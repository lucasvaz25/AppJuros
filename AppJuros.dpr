program AppJuros;

uses
  Vcl.Forms,
  uFrmPrincipal in 'View\uFrmPrincipal.pas' {FrmPrincipal},
  uFrmBase in 'View\uFrmBase.pas' {FrmBase},
  uFrmSimularFinanciamento in 'View\uFrmSimularFinanciamento.pas' {FrmSimularFinanciamento},
  uControleForms in 'Model\uControleForms.pas',
  uFinanciamento in 'Model\uFinanciamento.pas',
  uAbstract in 'Model\uAbstract.pas',
  uParcelas in 'Model\uParcelas.pas',
  uAbstractController in 'Controller\uAbstractController.pas',
  uFinanciamentoController in 'Controller\uFinanciamentoController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
