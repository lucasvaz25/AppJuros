unit uAbstractController;

interface

uses
  System.Contnrs;

type
  TAbstractController = class

  protected
    Entity: TObject;
  public
    constructor Create;
    destructor Destroy;

    function Insert( var Value: TObject ): Boolean; virtual;
    function Update( var Value: TObject ): Boolean; virtual;
    function Recover( const VID: Integer; out Value: TObject ): Boolean; virtual;
    function Delete( const VID: Integer ): Boolean; virtual;
    function Search( const Parametro: string ): TObjectList; virtual;
  end;

implementation

{ TAbstractController }

constructor TAbstractController.Create;
begin

end;

function TAbstractController.Delete( const VID: Integer ): Boolean;
begin

end;

destructor TAbstractController.Destroy;
begin

end;

function TAbstractController.Insert( var Value: TObject ): Boolean;
begin

end;

function TAbstractController.Recover( const VID: Integer;
            out Value: TObject ): Boolean;
begin

end;

function TAbstractController.Search( const Parametro: string ): TObjectList;
begin

end;

function TAbstractController.Update( var Value: TObject ): Boolean;
begin

end;

end.
