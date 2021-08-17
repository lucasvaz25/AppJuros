unit uFinanciamentoController;

interface

uses
  System.Contnrs,
  System.Generics.Collections,

  UFinanciamento,
  UParcelas,
  UAbstractController,
  System.Classes;

type
  TFinanciamentoController = class( TAbstractController )

  protected
    // FinanciamentoDao: TFinanciamentoDao;

  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TFinanciamentoController; OWner: TComponent ): TFinanciamentoController;
    function GetEntity: TFinanciamento;

    function Insert( var Value: TObject ): Boolean; override;
    function Update( var Value: TObject ): Boolean; override;
    function Recover( const VID: Integer; out Value: TObject ): Boolean; override;
    function Delete( const VID: Integer ): Boolean; override;
    function Search( const Parametro: string ): TObjectList; override;

    function CalculoSistemaPagamentoUnico( var ALstParcela: TObjectList<TParcelas>; ATaxaJuros: Double; AValorCapital: Currency; AQtdeMeses: Integer ): Boolean;

  end;

implementation

uses
  Math;
{ TFinanciamentoController }

function TFinanciamentoController.CalculoSistemaPagamentoUnico(
            var ALstParcela: TObjectList<TParcelas>; ATaxaJuros: Double;
            AValorCapital: Currency; AQtdeMeses: Integer ): Boolean;
var
  I: Integer;
  AParcela: TParcelas;
  _SaldoDevedor: Currency;
begin
  ALstParcela.Clear;

  AParcela              := TParcelas.Create;
  AParcela.SaldoDevedor := AValorCapital;
  _SaldoDevedor         := AValorCapital;
  ALstParcela.Add( AParcela );

  for I := 1 to AQtdeMeses do
  begin
    AParcela := TParcelas.Create;
    with AParcela do
    begin
      NroParcela    := I;
      ValorJuros    := Math.RoundTo( ( _SaldoDevedor * ( 1 + ( ATaxaJuros / 100 ) ) ) - ( _SaldoDevedor ), -2 );
      SaldoDevedor  := _SaldoDevedor + ValorJuros;
      _SaldoDevedor := SaldoDevedor;
    end;
    ALstParcela.Add( AParcela );
  end;
  AParcela.SaldoDevedor            := 0;
  AParcela.Pagamento               := _SaldoDevedor;
  AParcela.AmortizacaoSaldoDevedor := AValorCapital;
end;

constructor TFinanciamentoController.Create;
begin
  inherited;
  // FinanciamentoDao := TFinanciamentoDao.Create;
end;

function TFinanciamentoController.Delete( const VID: Integer ): Boolean;
begin
  // Result := FinanciamentoDao.Delete( Value );
end;

destructor TFinanciamentoController.Destroy;
begin
  // FinanciamentoDao.Destroy;
  inherited;
end;

procedure TFinanciamentoController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TFinanciamentoController.GetEntity: TFinanciamento;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TFinanciamento.Create;
  Result        := TFinanciamento( Self.Entity );
end;

function TFinanciamentoController.GetInstance(
            var Instance: TFinanciamentoController;
            OWner: TComponent ): TFinanciamentoController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TFinanciamentoController.Create;
  Result     := Instance;
end;

function TFinanciamentoController.Insert( var Value: TObject ): Boolean;
begin
  // Result := FinanciamentoDao.Insert( Value );
end;

function TFinanciamentoController.Recover( const VID: Integer;
            out Value: TObject ): Boolean;
begin
  // Result := FinanciamentoDao.Recover( Value );
end;

function TFinanciamentoController.Search( const Parametro: string ): TObjectList;
begin
  // Result := FinanciamentoDao.Search( Parametro );
end;

function TFinanciamentoController.Update( var Value: TObject ): Boolean;
begin
  // Result := FinanciamentoDao.Update( Value );
end;

end.
