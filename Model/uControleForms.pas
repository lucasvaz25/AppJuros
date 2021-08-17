unit uControleForms;

interface

uses
  UFrmSimularFinanciamento,
  System.Classes;

type
  TControleForms = class
  private
    AFormSimularFinanciamento: TFrmSimularFinanciamento;
    _AOwner: TComponent;
  public
    constructor Create( Owner: TComponent );
    destructor Destroy;
    procedure Free;

    procedure ExibeFormSimularFinanciamento;

  end;

implementation

{ TControleForms }

constructor TControleForms.Create( Owner: TComponent );
begin
  _AOwner := Owner;
end;

destructor TControleForms.Destroy;
begin
  AFormSimularFinanciamento.Release;
end;

procedure TControleForms.ExibeFormSimularFinanciamento;
begin
  AFormSimularFinanciamento := TFrmSimularFinanciamento.Create( _AOwner );
  AFormSimularFinanciamento.Show;
end;

procedure TControleForms.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

end.
