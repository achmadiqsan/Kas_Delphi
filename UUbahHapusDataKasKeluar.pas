unit UUbahHapusDataKasKeluar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFUbahHapusDataKasKeluar = class(TForm)
    Panel1: TPanel;
    Closebtn: TImage;
    Simpan: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ubah: TImage;
    delete: TImage;
    DateTimePicker1: TDateTimePicker;
    Memo1: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure ClosebtnClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure ubahClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUbahHapusDataKasKeluar: TFUbahHapusDataKasKeluar;

implementation

{$R *.dfm}

uses DataModule;

// code function convert int to currency :
function Ribuan(Edit:TEdit):string;
var
  NilaiRupiah : string;
  AngkaRupiah : Currency;
begin
  if Edit.Text='' then Exit;
  NilaiRupiah := Edit.Text;
  NilaiRupiah := StringReplace(NilaiRupiah,',','',[rfReplaceAll,rfIgnoreCase]);
  NilaiRupiah := StringReplace(NilaiRupiah,'.','',[rfReplaceAll,rfIgnoreCase]);
  AngkaRupiah := StrToCurrDef(NilaiRupiah,0);
  Edit.Text := FormatCurr('#,###',AngkaRupiah);
  Edit.SelStart := Length(Edit.Text);
end;

// code function convert currency to int:
function HapusFormat(Nilai:TEdit):Integer;
var
  hasil : String;
begin
  hasil := Nilai.text;
  hasil := StringReplace(hasil,',','',[rfReplaceAll,rfIgnoreCase]);
  hasil := StringReplace(hasil,'.','',[rfReplaceAll,rfIgnoreCase]);
  Result := StrToInt(hasil);
end;

procedure TFUbahHapusDataKasKeluar.ClosebtnClick(Sender: TObject);
begin
  DM.FDQuery2.Close;
  DM.FDQuery2.Active := True;
  DM.FDQuery3.Close;
  DM.FDQuery3.Active := True;
  //
  DateTimePicker1.Enabled := False;
  Memo1.Enabled := False;
  Edit1.Enabled := False;
  ubah.Visible := True;
  Simpan.Visible := False;
  //
  DateTimePicker1.Date := Now;
  Memo1.Clear;
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  //
  close;
end;

procedure TFUbahHapusDataKasKeluar.deleteClick(Sender: TObject);
var
  id,id2 : string;
begin
  if Dm.FDTable1.IsEmpty then ShowMessage('Data Kosong') else
  if Application.MessageBox('Yakin Hapus Data ??','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
    begin
      // coding untuk memilih kode dengan nomor yg paling terbesar :
      DM.FDQuery1.Close;
      DM.FDQuery1.SQL.Clear;
      DM.FDQuery1.SQL.Add('SELECT id, saldo_kas FROM saldo');
      DM.FDQuery1.SQL.Add('ORDER By id DESC LIMIT 1');
      DM.FDQuery1.Open;

      // coding untuk mengcopy nilai yang di seleksi :
      id := Copy(DM.FDQuery1.Fields[0].AsString, 0, 11);
      id2 := Copy(DM.FDQuery1.Fields[1].AsString, 0, 11);
      //
      if DM.FDTable2.Locate('id',id ,[]) then
        begin
          Dm.FDTable2.Edit;
          DM.FDTable2['saldo_kas'] := (DM.FDTable2['saldo_kas'] + StrToInt(edit3.Text));
          Dm.FDTable2.Post;
        end;
      //
      DM.FDTable2.Close;
      DM.FDTable2.Open;
      //
      DM.FDTable1.Delete;
      //
      if DM.FDQuery2.Locate('id',Edit2.Text ,[]) then
        begin
          DM.FDQuery2.Delete;
        end;
    end;
  DM.FDQuery2.Close;
  DM.FDQuery2.Active := True;
  DM.FDQuery3.Close;
  DM.FDQuery3.Active := True;
  Closebtn.OnClick(sender);
end;

procedure TFUbahHapusDataKasKeluar.Edit1Change(Sender: TObject);
begin
  if (Edit1.Text <> '0') then
    begin
      Ribuan(Edit1);
    end;
end;

procedure TFUbahHapusDataKasKeluar.FormActivate(Sender: TObject);
begin
  DateTimePicker1.Date := Now;
end;

procedure TFUbahHapusDataKasKeluar.SimpanClick(Sender: TObject);
var
  simp : Integer;
begin
  if Memo1.Text = '' then ShowMessage('Uraian Tidak Boleh Kosong') else
  if Edit1.Text = '' then ShowMessage('Jumlah Tidak Boleh Kosong') else
    begin
      simp := HapusFormat(Edit1);
      DM.FDTable1.Edit;
      DM.FDTable1['id'] := Edit2.Text;
      DM.FDTable1['tanggal'] := DateTimePicker1.Date;
      DM.FDTable1['uraian'] := Memo1.Text;
      DM.FDTable1['debit'] :=  0;
      DM.FDTable1['kredit'] := simp;
      DM.FDTable1['jenis'] := 'OUT';
      DM.FDTable1.Post;
      //
      if DM.FDTable2.Locate('id',Edit2.Text,[]) then
         begin
           Dm.FDTable2.Edit;
           DM.FDTable2['saldo_kas'] := (DM.FDTable2['saldo_kas'] + StrToInt(edit3.Text)) - simp;
           Dm.FDTable2.Post;
         end;
    end;
  DM.FDQuery2.Close;
  DM.FDQuery2.Active := True;
  DM.FDQuery3.Close;
  DM.FDQuery3.Active := True;
  Closebtn.OnClick(sender);
end;

procedure TFUbahHapusDataKasKeluar.ubahClick(Sender: TObject);
begin
  DateTimePicker1.Enabled := True;
  Memo1.Enabled := True;
  Edit1.Enabled := True;
  ubah.Visible := False;
  Simpan.Visible := true;
end;

end.
