unit uFrmSimularFinanciamento;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  UFrmBase,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons,
  UFinanciamentoController;

type
  TFrmSimularFinanciamento = class( TFrmBase )
    EdCapital: TLabeledEdit;
    EdTxJuros: TLabeledEdit;
    EdMeses: TLabeledEdit;
    BtnLimpar: TBitBtn;
    BtnSimular: TBitBtn;
    DBGrid1: TDBGrid;
    procedure BtnSairClick( Sender: TObject );
    procedure BtnLimparClick( Sender: TObject );
    procedure FormCreate( Sender: TObject );
    procedure EdCapitalExit( Sender: TObject );
    procedure EdTxJurosExit( Sender: TObject );
    procedure BtnSimularClick( Sender: TObject );
  private
    { Private declarations }
    procedure Simular;
    procedure ConfigDB;
    procedure PopularGrid;
    function ValidarForm: Boolean;

  public
    { Public declarations }
    FinanciamentoControl: TFinanciamentoController;

  end;

var
  FrmSimularFinanciamento: TFrmSimularFinanciamento;

implementation

uses
  UFinanciamento,
  UParcelas,

  System.Generics.Collections,
  Datasnap.DBClient;

{$R *.dfm}


procedure TFrmSimularFinanciamento.BtnLimparClick( Sender: TObject );
begin
  inherited;
  Self.LimparCampos;
  TDset_Generic.EmptyDataSet;
end;

procedure TFrmSimularFinanciamento.BtnSairClick( Sender: TObject );
begin
  inherited;
  Self.Sair;
end;

procedure TFrmSimularFinanciamento.BtnSimularClick( Sender: TObject );
begin
  inherited;
  Self.Simular;
end;

procedure TFrmSimularFinanciamento.ConfigDB;
begin
  DsGeneric     := TDataSource.Create( Self );
  TDset_Generic := TClientDataSet.Create( Self );
  with TDset_Generic do
  begin
    Close;
    FieldDefs.Clear;
    FieldDefs.Add( 'Meses', FtString, 15 );
    FieldDefs.Add( 'Juros', FtCurrency );
    FieldDefs.Add( 'AmortizacaoSaldoDevedor', FtCurrency );
    FieldDefs.Add( 'Pagamento', FtCurrency );
    FieldDefs.Add( 'SaldoDevedor', FtCurrency );
    CreateDataset;
    Active := True;
    DisableControls;
    Open;
  end;
  DsGeneric.DataSet := TDset_Generic;

  DBGrid1.DataSource                   := DsGeneric;
  DBGrid1.Columns.Items[ 0 ].FieldName := 'Meses';
  DBGrid1.Columns.Items[ 0 ].Width     := 40;
  DBGrid1.Columns.Items[ 1 ].FieldName := 'Juros';
  DBGrid1.Columns.Items[ 1 ].Width     := 120;
  DBGrid1.Columns.Items[ 2 ].FieldName := 'AmortizacaoSaldoDevedor';
  DBGrid1.Columns.Items[ 2 ].Width     := 120;
  DBGrid1.Columns.Items[ 3 ].FieldName := 'Pagamento';
  DBGrid1.Columns.Items[ 3 ].Width     := 120;
  DBGrid1.Columns.Items[ 4 ].FieldName := 'SaldoDevedor';
  DBGrid1.Columns.Items[ 4 ].Width     := 120;

end;

procedure TFrmSimularFinanciamento.EdCapitalExit( Sender: TObject );
begin
  inherited;
  Self.FormatCurrency( Sender );
end;

procedure TFrmSimularFinanciamento.EdTxJurosExit( Sender: TObject );
begin
  inherited;
  Self.FormatNumeroDecimais( Sender );
end;

procedure TFrmSimularFinanciamento.FormCreate( Sender: TObject );
begin
  inherited;

  FinanciamentoControl := nil;
  FinanciamentoControl.GetInstance( FinanciamentoControl, Self );

  Self.ConfigDB;
end;

procedure TFrmSimularFinanciamento.PopularGrid;
var
  List: TObjectList<TParcelas>;
  I: Integer;
  TotalJuros: Currency;
begin
  TDset_Generic.EmptyDataSet;

  TotalJuros := 0;
  List       := FinanciamentoControl.GetEntity.ListaParcelas;

  if List <> nil then
    if List.Count > 0 then
    begin
      for I := 0 to List.Count - 1 do
      begin
        with TDset_Generic do
        begin
          Append;

          FieldByName( 'Meses' ).AsString   := List[ I ].NroParcela.ToString;
          FieldByName( 'Juros' ).AsCurrency := List[ I ].ValorJuros;
          FieldByName( 'AmortizacaoSaldoDevedor' ).AsCurrency := List[ I ].AmortizacaoSaldoDevedor;
          FieldByName( 'Pagamento' ).AsCurrency    := List[ I ].Pagamento;
          FieldByName( 'SaldoDevedor' ).AsCurrency := List[ I ].SaldoDevedor;

          TotalJuros := TotalJuros + List[ I ].ValorJuros;

          Post;
        end;
      end;

      TDset_Generic.Append;
      TDset_Generic.FieldByName( 'Meses' ).AsString   := 'Totais';
      TDset_Generic.FieldByName( 'Juros' ).AsCurrency := TotalJuros;
      TDset_Generic.FieldByName( 'AmortizacaoSaldoDevedor' ).AsCurrency := List[ 0 ].SaldoDevedor;
      TDset_Generic.FieldByName( 'Pagamento' ).AsCurrency := List[ 0 ].SaldoDevedor + TotalJuros;
      TDset_Generic.Post;

      TDset_Generic.EnableControls;
    end;
end;

procedure TFrmSimularFinanciamento.Simular;
var
  AFinanciamento: TFinanciamento;
  ALstAux: TObjectList<TParcelas>;
begin
  if ValidarForm then
  begin
    if not( TDset_Generic.IsEmpty ) then
      TDset_Generic.EmptyDataSet;

    AFinanciamento := TFinanciamento.Create;
    try
      with AFinanciamento do
      begin
        TaxaJuros    := StrToFloat( EdTxJuros.Text );
        ValorCapital := StrToCurr( StringReplace( EdCapital.Text, 'R$', '', [ RfReplaceAll, RfIgnoreCase ] ) );
        QtdeMeses    := StrToInt( EdMeses.Text );
        ALstAux      := ListaParcelas;

        FinanciamentoControl.CalculoSistemaPagamentoUnico( ALstAux, TaxaJuros, ValorCapital, QtdeMeses );
      end;
      FinanciamentoControl.GetEntity.LimparDados;
      FinanciamentoControl.GetEntity.CopiarDados( AFinanciamento );
      Self.PopularGrid;
    finally
      AFinanciamento.Free;
    end;
  end;

end;

function TFrmSimularFinanciamento.ValidarForm: Boolean;
begin
  Result := False;

  if ( EdCapital.Text = EmptyStr ) then
  begin
    MessageDlg( 'Insira o valor do capital!', MtInformation, [ MbOK ], 0 );
    EdCapital.SetFocus;
    Exit;
  end;

  if ( EdTxJuros.Text = EmptyStr ) then
  begin
    MessageDlg( 'Insira o valor da taxa de juros!', MtInformation, [ MbOK ], 0 );
    EdTxJuros.SetFocus;
    Exit;
  end;

  if ( EdMeses.Text = EmptyStr ) then
  begin
    MessageDlg( 'Insira a quantidade de meses!', MtInformation, [ MbOK ], 0 );
    EdMeses.SetFocus;
    Exit;
  end;

  Result := True;
end;

end.
