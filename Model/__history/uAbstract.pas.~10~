unit uAbstract;

interface

type
  TAbstract = class( TObject )
  private
    FCodigo: Integer;
    procedure SetCodigo( const Value: Integer );
  public

    constructor Create;
    destructor Destroy;
    procedure Free;

    property Codigo: Integer read FCodigo write SetCodigo;

    procedure CopiarDados( VValue: TAbstract );
  end;

implementation

{ TAbstract }

procedure TAbstract.CopiarDados( VValue: TAbstract );
begin
  Self.FCodigo := VValue.Codigo;
end;

constructor TAbstract.Create;
begin
  inherited;
  Self.FCodigo := 0;
end;

destructor TAbstract.Destroy;
begin
  inherited Destroy;
end;

procedure TAbstract.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TAbstract.SetCodigo( const Value: Integer );
begin
  FCodigo := Value;
end;

end.
