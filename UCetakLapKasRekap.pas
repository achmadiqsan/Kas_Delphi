unit UCetakLapKasRekap;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFCetakLapKasRekap = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCetakLapKasRekap: TFCetakLapKasRekap;

implementation

{$R *.dfm}

uses DataModule, ULap;

procedure TFCetakLapKasRekap.Button1Click(Sender: TObject);
begin
  DM.Gabung.Close;
  DM.Gabung.Open;
  DM.Gabung.Filtered := False;
  DM.Gabung.Filter :='tanggal>= '+Quotedstr(DateToStr(DateTimePicker1.Date))+'And tanggal<= '+Quotedstr(DateToStr(DateTimePicker2.Date));
  DM.Gabung.Filtered := True;
  FLap.QRLabel24.Caption := DateToStr(DateTimePicker1.Date);
  FLap.QRLabel26.Caption := DateToStr(DateTimePicker2.Date);
  FLap.QuickRep3.Preview;
end;

procedure TFCetakLapKasRekap.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TFCetakLapKasRekap.FormActivate(Sender: TObject);
begin
  DateTimePicker1.Date := Now;
  DateTimePicker2.Date := Now;
end;

end.
