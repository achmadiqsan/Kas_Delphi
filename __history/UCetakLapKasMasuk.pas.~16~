unit UCetakLapKasMasuk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFCetakLapKasMasuk = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label3: TLabel;
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
  FCetakLapKasMasuk: TFCetakLapKasMasuk;

implementation

{$R *.dfm}

uses DataModule, ULap;

procedure TFCetakLapKasMasuk.Button1Click(Sender: TObject);
begin
  DM.filterIN.Close;
  DM.filterIN.SQL.Clear;
  DM.filterIN.SQL.Add('select * from kas where jenis = '+QuotedStr(Edit1.Text)+' and (((tanggal) between "'+FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date)+'" AND "'+FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date)+'")) ORDER BY id asc');
  DM.filterIN.Open;
  FLap.QRLabel2.Caption := DateToStr(DateTimePicker1.Date);
  FLap.QRLabel4.Caption := DateToStr(DateTimePicker2.Date);
  FLap.QuickRep2.Preview;
end;

procedure TFCetakLapKasMasuk.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFCetakLapKasMasuk.FormActivate(Sender: TObject);
begin
  DateTimePicker1.Date := Now;
  DateTimePicker2.Date := Now;
end;

end.
