object DM: TDM
  OldCreateOrder = False
  Height = 471
  Width = 593
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Database=db_kas'
      'Server=localhost'
      'User_Name=root')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 48
  end
  object FDTable1: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'kas'
    TableName = 'kas'
    Left = 120
    Top = 40
    object FDTable1id: TStringField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object FDTable1tanggal: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tanggal'
      Origin = 'tanggal'
      DisplayFormat = 'dd-MMM-yyyy'
    end
    object FDTable1uraian: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uraian'
      Origin = 'uraian'
      Size = 225
    end
    object FDTable1debit: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'debit'
      Origin = 'debit'
      DisplayFormat = '#,###'
    end
    object FDTable1kredit: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'kredit'
      Origin = 'kredit'
      DisplayFormat = '#,###'
    end
    object FDTable1jenis: TStringField
      FieldName = 'jenis'
      Origin = 'jenis'
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery2
    Left = 288
    Top = 120
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM saldo')
    Left = 64
    Top = 112
  end
  object FDTable2: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'db_kas.saldo'
    TableName = 'db_kas.saldo'
    Left = 200
    Top = 32
    object FDTable2id: TStringField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object FDTable2saldo_kas: TIntegerField
      FieldName = 'saldo_kas'
      Origin = 'saldo_kas'
      Required = True
      DisplayFormat = '#,###'
    end
  end
  object DataSource2: TDataSource
    DataSet = FDQuery3
    Left = 392
    Top = 128
  end
  object FDQuery2: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM kas WHERE jenis = '#39'IN'#39)
    Left = 296
    Top = 72
    object FDQuery2id: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery2tanggal: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tanggal'
      Origin = 'tanggal'
      DisplayFormat = 'dd-MMM-yyyy'
    end
    object FDQuery2uraian: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uraian'
      Origin = 'uraian'
      Size = 225
    end
    object FDQuery2debit: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'debit'
      Origin = 'debit'
      DisplayFormat = '#,###'
    end
    object FDQuery2jenis: TStringField
      FieldName = 'jenis'
      Origin = 'jenis'
      Required = True
    end
  end
  object FDQuery3: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM kas WHERE jenis = '#39'OUT'#39)
    Left = 376
    Top = 80
    object FDQuery3id: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery3tanggal: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tanggal'
      Origin = 'tanggal'
      DisplayFormat = 'dd-MMM-yyyy'
    end
    object FDQuery3uraian: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uraian'
      Origin = 'uraian'
      Size = 225
    end
    object FDQuery3kredit: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'kredit'
      Origin = 'kredit'
      DisplayFormat = '#,###'
    end
    object FDQuery3jenis: TStringField
      FieldName = 'jenis'
      Origin = 'jenis'
      Required = True
    end
  end
  object login: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM login')
    Left = 72
    Top = 280
  end
  object dslogin: TDataSource
    DataSet = login
    Left = 80
    Top = 336
  end
  object filterIN: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM kas')
    Left = 264
    Top = 256
  end
  object dsIN: TDataSource
    DataSet = filterIN
    Left = 248
    Top = 312
  end
  object filterOUT: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM kas')
    Left = 336
    Top = 264
  end
  object dsOUT: TDataSource
    DataSet = filterOUT
    Left = 344
    Top = 320
  end
  object Gabung: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT kas.id,kas.tanggal, kas.uraian, kas.debit, kas.kredit, ka' +
        's.jenis,'
      'saldo.saldo_kas '
      'FROM kas'
      'INNER JOIN saldo'
      'ON kas.id = saldo.id')
    Left = 464
    Top = 232
  end
  object dsGabung: TDataSource
    DataSet = Gabung
    Left = 472
    Top = 288
  end
  object setting: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM login')
    Left = 192
    Top = 376
  end
  object dssetting: TDataSource
    DataSet = setting
    Left = 232
    Top = 416
  end
end
