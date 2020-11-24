unit UCetakLapKasKeluar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFCetakLapKasKeluar = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCetakLapKasKeluar: TFCetakLapKasKeluar;

implementation

{$R *.dfm}

uses DataModule, ULap;

procedure TFCetakLapKasKeluar.Button1Click(Sender: TObject);
begin
  DM.filterOUT.Close;
  DM.filterOUT.SQL.Clear;
  DM.filterOUT.SQL.Add('select * from kas where jenis = '+QuotedStr(Edit1.Text)+' and (((tanggal) between "'+FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date)+'" AND "'+FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date)+'")) ORDER BY id asc');
  DM.filterOUT.Open;
  FLap.QRLabel15.Caption := DateToStr(DateTimePicker1.Date);
  FLap.QRLabel17.Caption := DateToStr(DateTimePicker2.Date);
  FLap.QuickRep2.Preview;
end;

procedure TFCetakLapKasKeluar.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TFCetakLapKasKeluar.FormActivate(Sender: TObject);
begin
  DateTimePicker1.Date := Now;
  DateTimePicker2.Date := Now;
end;

end.
