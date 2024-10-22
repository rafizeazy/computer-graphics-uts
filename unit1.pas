unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Spin;

type
  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    SpinEdit1: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private
    { Private declarations }
    DindingColor, AtapColor, PintuColor, JendelaColor: TColor;
    RumahX, RumahY, Skala: Integer;
    PosisiDindingX, PosisiDindingY: Integer;
    PosisiAtapX, PosisiAtapY: Integer;
    PosisiPintuX, PosisiPintuY: Integer;
    PosisiJendelaKiriX, PosisiJendelaKiriY: Integer;
    PosisiJendelaKananX, PosisiJendelaKananY: Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Awal
  DindingColor := clWhite;
  AtapColor := clWhite;
  PintuColor := clWhite;
  JendelaColor := clWhite;

  RumahX := 100;
  RumahY := 200;
  Skala := 2;
  SpinEdit1.Value := Skala;

  PosisiDindingX := RumahX;
  PosisiDindingY := RumahY;
  PosisiAtapX := RumahX;
  PosisiAtapY := RumahY;
  PosisiPintuX := RumahX + 40 * Skala;
  PosisiPintuY := RumahY + 40 * Skala;
  PosisiJendelaKiriX := RumahX + 20 * Skala;
  PosisiJendelaKiriY := RumahY + 20 * Skala;
  PosisiJendelaKananX := RumahX + 70 * Skala;
  PosisiJendelaKananY := RumahY + 20 * Skala;
end;

procedure TForm1.FormPaint(Sender: TObject);
var
  Atap: array[0..2] of TPoint;
begin
  // Gambar Dinding
  Canvas.Brush.Color := DindingColor;
  Canvas.FillRect(PosisiDindingX, PosisiDindingY, PosisiDindingX + Round(100 * Skala), PosisiDindingY + Round(80 * Skala));

  // Gambar Atap
  Atap[0] := Point(PosisiAtapX, PosisiAtapY);
  Atap[1] := Point(PosisiAtapX + Round(50 * Skala), PosisiAtapY - Round(50 * Skala));
  Atap[2] := Point(PosisiAtapX + Round(100 * Skala), PosisiAtapY);
  Canvas.Brush.Color := AtapColor;
  Canvas.Polygon(Atap);

  // Gambar Pintu
  Canvas.Brush.Color := PintuColor;
  Canvas.FillRect(PosisiPintuX, PosisiPintuY, PosisiPintuX + Round(20 * Skala), PosisiPintuY + Round(40 * Skala));

  // Gambar Jendela
  Canvas.Brush.Color := JendelaColor;
  Canvas.Rectangle(PosisiJendelaKiriX, PosisiJendelaKiriY, PosisiJendelaKiriX + Round(10 * Skala), PosisiJendelaKiriY + Round(10 * Skala));
  Canvas.Ellipse(PosisiJendelaKananX, PosisiJendelaKananY, PosisiJendelaKananX + Round(10 * Skala), PosisiJendelaKananY + Round(10 * Skala));

  // Gambar Jalan
  Canvas.Brush.Color := clGray;
  Canvas.FillRect(0, PosisiDindingY + Round(80 * Skala), ClientWidth, PosisiDindingY + Round(200 * Skala));

  // Gambar Pohon
  // Gambar Batang
  Canvas.Brush.Color := RGBToColor(139, 69, 19); // Warna coklat
  Canvas.FillRect(RumahX - 50, RumahY, RumahX - 30, RumahY + 162);

  // Gambar Daun
  Canvas.Brush.Color := clGreen;
  Canvas.Ellipse(RumahX - 80, RumahY - 80, RumahX - 5, RumahY + 10);
end;

// Mengganti Warna
procedure TForm1.Button1Click(Sender: TObject);
begin
  DindingColor := clCream;
  Invalidate;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  AtapColor := clRed;
  Invalidate;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  PintuColor := RGBToColor(139, 69, 19);
  Invalidate;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  JendelaColor := clSkyBlue;
  Invalidate;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  Skala := SpinEdit1.Value;
  Invalidate;
end;

end.

