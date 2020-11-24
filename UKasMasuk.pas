unit UKasMasuk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.StdCtrls, StrUtils;

type
  TFKasMasuk = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Simpan: TImage;
    CloseBtn: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    procedure CloseBtnClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FKasMasuk: TFKasMasuk;

implementation

{$R *.dfm}

uses DataModule, UTabmahDataKasMasuk, UUbahDataKasMasuk;

procedure TFKasMasuk.SimpanClick(Sender: TObject);
begin
  FTabmahDataKasMasuk.Show;
end;

procedure TFKasMasuk.Button1Click(Sender: TObject);
begin
  DM.FDQuery1.Close;
  DM.FDQuery1.SQL.Clear;
  DM.FDQuery1.SQL.Add('SELECT saldo_kas FROM saldo');
  DM.FDQuery1.SQL.Add('ORDER By id DESC LIMIT 1');
  DM.FDQuery1.Open;
end;

procedure TFKasMasuk.CloseBtnClick(Sender: TObject);
begin
  DM.FDQuery2.Close;
  DM.FDQuery2.Active := True;
  DM.FDQuery3.Close;
  DM.FDQuery3.Active := True;
  Close;
end;

procedure TFKasMasuk.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    FUbahDataKasMasuk.DateTimePicker1.Date :=  DM.FDQuery2['tanggal'];
    FUbahDataKasMasuk.Memo1.Text := DM.FDQuery2['uraian'];
    FUbahDataKasMasuk.Edit1.Text := DM.FDQuery2['debit'];
    FUbahDataKasMasuk.Edit2.Text := DM.FDQuery2['id'];
    FUbahDataKasMasuk.Edit3.Text := DM.FDQuery2['debit'];
    FUbahDataKasMasuk.Show;
  end;
end;

procedure TFKasMasuk.FormActivate(Sender: TObject);
var
  jml : Integer;
begin
  DM.FDQuery2.Close;
  DM.FDQuery2.Active := True;
  // code untk hitung SUM besar simpanan :
  jml := 0;
  DM.FDTable1.First;
  while not DM.FDTable1.Eof do
    begin
      jml := jml + DM.FDTable1['debit'];
      DM.FDTable1.Next;
    end;
  // Label3.Caption := IntToStr(jml);
  Label3.Caption  := AnsiReplaceStr(FormatFloat('Rp ,#,###',jml),',','.');
end;

procedure TFKasMasuk.FormCreate(Sender: TObject);
begin
  //
end;

end.
