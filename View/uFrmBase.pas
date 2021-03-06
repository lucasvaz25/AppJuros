unit uFrmBase;

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
  Vcl.StdCtrls,
  Vcl.Buttons,
  Datasnap.DBClient,
  Data.DB;

type
  TFrmBase = class( TForm )
    BtnSair: TBitBtn;
    BtnSalvar: TBitBtn;
    procedure FormClose( Sender: TObject; var Action: TCloseAction );
    procedure FormShow( Sender: TObject );
  protected
    TDset_Generic: TClientDataSet;
    DsGeneric: TDataSource;
    procedure FormatNumeroDecimais( Sender: TObject );
    procedure LimparCampos;
    procedure FormatCurrency( Sender: TObject );
    { Private declarations }
  public
    { Public declarations }
    procedure Salvar; virtual;
    procedure Sair; virtual;
  end;

var
  FrmBase: TFrmBase;

implementation

uses
  Vcl.ExtCtrls;

{$R *.dfm}


procedure TFrmBase.FormClose( Sender: TObject; var Action: TCloseAction );
begin
  Action := CaFree;
  Self   := nil;
end;

procedure TFrmBase.FormShow( Sender: TObject );
begin
  Self.LimparCampos;
end;

procedure TFrmBase.Sair;
begin
  Self.Close;
end;

procedure TFrmBase.Salvar;
begin

end;

procedure TFrmBase.FormatCurrency( Sender: TObject );
var
  Value: Currency;
  Str: string;
begin
  if Length( TLabeledEdit( Sender ).Text ) > 0 then
  begin
    Str := StringReplace( TLabeledEdit( Sender ).Text, 'R$', '', [ RfReplaceAll, RfIgnoreCase ] );
    try
      Value := StrToCurr( Str );
    except
      MessageDlg( 'Valor Inv?lido!', MtInformation, [ MbOK ], 0 );
      TLabeledEdit( Sender ).Clear;
      TLabeledEdit( Sender ).SetFocus;
      Exit;
    end;

    TLabeledEdit( Sender ).Text := FormatFloat( 'R$ 0.00##', Value );
  end;
end;

procedure TFrmBase.FormatNumeroDecimais( Sender: TObject );
var
  Value: Real;
  Str: string;
begin
  if Length( TLabeledEdit( Sender ).Text ) > 0 then
  begin
    Str := TLabeledEdit( Sender ).Text;
    try
      Value := StrToFloat( Str );
    except
      MessageDlg( 'Valor Inv?lido!', MtInformation, [ MbOK ], 0 );
      TLabeledEdit( Sender ).Clear;
      TLabeledEdit( Sender ).SetFocus;
      Exit;
    end;

    TLabeledEdit( Sender ).Text := FormatFloat( '0.00##', Value );
  end;
end;

procedure TFrmBase.LimparCampos;
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    if ( Components[ I ] is TLabeledEdit ) then
      TLabeledEdit( Components[ I ] ).Clear
end;

end.
