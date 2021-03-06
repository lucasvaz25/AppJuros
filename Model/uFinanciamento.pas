unit uFinanciamento;

interface

uses

  UAbstract,
  UParcelas,

  System.Generics.Collections;

type
  TFinanciamento = class( TAbstract )
  private
    FQtdeMeses: Integer;
    FTaxaJuros: Double;
    FValorCapital: Currency;
    FListaParcelas: TObjectList<TParcelas>;
    procedure SetQtdeMeses( const Value: Integer );
    procedure SetTaxaJuros( const Value: Double );
    procedure SetValorCapital( const Value: Currency );
    procedure SetListaParcelas( const Value: TObjectList<TParcelas> );
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property ValorCapital: Currency read FValorCapital write SetValorCapital;
    property TaxaJuros: Double read FTaxaJuros write SetTaxaJuros;
    property QtdeMeses: Integer read FQtdeMeses write SetQtdeMeses;
    property ListaParcelas: TObjectList<TParcelas> read FListaParcelas write SetListaParcelas;

    procedure CopiarDados( VValue: TFinanciamento );
    procedure LimparDados;
  end;

implementation

{ TFinanciamento }

procedure TFinanciamento.CopiarDados( VValue: TFinanciamento );
var
  AParcela: TParcelas;
  I: Integer;
begin
  inherited CopiarDados( VValue );
  Self.FValorCapital := VValue.ValorCapital;
  Self.FTaxaJuros    := VValue.TaxaJuros;
  Self.FQtdeMeses    := VValue.QtdeMeses;

  for I := 0 to VValue.ListaParcelas.Count - 1 do
  begin
    AParcela := TParcelas.Create;
    AParcela.CopiarDados( VValue.ListaParcelas[ I ] );
    Self.FListaParcelas.Add( AParcela );
  end;

end;

constructor TFinanciamento.Create;
begin
  inherited Create;
  Self.FListaParcelas := TObjectList<TParcelas>.Create;
  LimparDados;
end;

destructor TFinanciamento.Destroy;
begin
  Self.FListaParcelas.Free;

  inherited Destroy;
end;

procedure TFinanciamento.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TFinanciamento.LimparDados;
begin
  Self.FValorCapital := 0;
  Self.FTaxaJuros    := 0;
  Self.FQtdeMeses    := 0;
  Self.FListaParcelas.Clear;
end;

procedure TFinanciamento.SetListaParcelas( const Value: TObjectList<TParcelas> );
begin
  FListaParcelas := Value;
end;

procedure TFinanciamento.SetQtdeMeses( const Value: Integer );
begin
  FQtdeMeses := Value;
end;

procedure TFinanciamento.SetTaxaJuros( const Value: Double );
begin
  FTaxaJuros := Value;
end;

procedure TFinanciamento.SetValorCapital( const Value: Currency );
begin
  FValorCapital := Value;
end;

end.
