unit uFrmPrincipal;

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
  Vcl.ToolWin,
  Vcl.ActnMan,
  Vcl.ActnCtrls,
  Vcl.ActnMenus,
  Vcl.Menus,

  UControleForms;

type
  TFrmPrincipal = class( TForm )
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    SimularFinanciamento1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    procedure Sair1Click( Sender: TObject );
    procedure FormCreate( Sender: TObject );
    procedure SimularFinanciamento1Click( Sender: TObject );
  private
    { Private declarations }
    AControlForm: TControleForms;
  public
    { Public declarations }

  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  UFrmSimularFinanciamento;
{$R *.dfm}


procedure TFrmPrincipal.FormCreate( Sender: TObject );
begin
  AControlForm := TControleForms.Create( Self );
end;

procedure TFrmPrincipal.Sair1Click( Sender: TObject );
begin
  Close;
end;

procedure TFrmPrincipal.SimularFinanciamento1Click( Sender: TObject );
begin
  AControlForm.ExibeFormSimularFinanciamento;
end;

end.
