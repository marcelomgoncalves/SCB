program SCB;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, uFrmprincipal, uDM, ufrmInformacoes, zcomponent, ufrmGeracaoCartelas,
  ufrmImpressaoCartelas
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  frmPrincipal.Caption:='SCB - Sistema de Controle de Bingos - Versão 1.0';
  Application.Run;
end.

