unit uParcelas;

interface

uses
  UAbstract;

type
  TParcelas = class( TAbstract )
  private
    FCodFinanciamento: Integer;
    FSaldoDevedor: Currency;
    FPagamento: Currency;
    FValorJuros: Currency;
    FAmortizacaoSaldoDevedor: Currency;
    FNroParcela: Integer;
    procedure SetAmortizacaoSaldoDevedor( const Value: Currency );
    procedure SetCodFinanciamento( const Value: Integer );
    procedure SetNroParcela( const Value: Integer );
    procedure SetPagamento( const Value: Currency );
    procedure SetSaldoDevedor( const Value: Currency );
    procedure SetValorJuros( const Value: Currency );
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property CodFinanciamento: Integer read FCodFinanciamento write SetCodFinanciamento;
    property NroParcela: Integer read FNroParcela write SetNroParcela;
    property ValorJuros: Currency read FValorJuros write SetValorJuros;
    property SaldoDevedor: Currency read FSaldoDevedor write SetSaldoDevedor;
    property Pagamento: Currency read FPagamento write SetPagamento;
    property AmortizacaoSaldoDevedor: Currency read FAmortizacaoSaldoDevedor write SetAmortizacaoSaldoDevedor;

    procedure CopiarDados( VValue: TParcelas );
  end;

implementation

{ TParcelas }

procedure TParcelas.CopiarDados( VValue: TParcelas );
begin
  inherited CopiarDados( VValue );
  Self.FCodFinanciamento        := VValue.CodFinanciamento;
  Self.FSaldoDevedor            := VValue.SaldoDevedor;
  Self.FPagamento               := VValue.Pagamento;
  Self.FValorJuros              := VValue.ValorJuros;
  Self.FAmortizacaoSaldoDevedor := VValue.AmortizacaoSaldoDevedor;
  Self.FNroParcela              := VValue.NroParcela;
end;

constructor TParcelas.Create;
begin
  inherited Create;
  Self.FCodFinanciamento        := 0;
  Self.FSaldoDevedor            := 0;
  Self.FPagamento               := 0;
  Self.FValorJuros              := 0;
  Self.FAmortizacaoSaldoDevedor := 0;
  Self.FNroParcela              := 0;
end;

destructor TParcelas.Destroy;
begin
  inherited Destroy;
end;

procedure TParcelas.Free;
begin
  if Assigned( Self ) then
    Self.Destroy
end;

procedure TParcelas.SetAmortizacaoSaldoDevedor( const Value: Currency );
begin
  FAmortizacaoSaldoDevedor := Value;
end;

procedure TParcelas.SetCodFinanciamento( const Value: Integer );
begin
  FCodFinanciamento := Value;
end;

procedure TParcelas.SetNroParcela( const Value: Integer );
begin
  FNroParcela := Value;
end;

procedure TParcelas.SetPagamento( const Value: Currency );
begin
  FPagamento := Value;
end;

procedure TParcelas.SetSaldoDevedor( const Value: Currency );
begin
  FSaldoDevedor := Value;
end;

procedure TParcelas.SetValorJuros( const Value: Currency );
begin
  FValorJuros := Value;
end;

end.
