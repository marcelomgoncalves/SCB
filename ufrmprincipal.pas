//---------------------------------------------------------------------------//
// Projeto: SCB
// Sistema de Geração e Impressão de Cartelas de Bingo
//
// Direitos Autorais Reservados (c) 2023 Marcelo M. Gonçalves
//
// Você pode obter a última versão desse arquivo no GitHub
// URL: https://github.com/marcelomgoncalves/SCB
//
// Este sistema é software livre; você pode redistribuí-la e/ou modificá-la
// sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela
// Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério)
// qualquer versão posterior.
//
// Este sistema é distribuída na expectativa de que seja útil, porém, SEM
// NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU
// ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral
// Menor do GNU para mais detalhes.
//
// Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto
// com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,
// no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.
// Você também pode obter uma copia da licença em:
// http://www.opensource.org/licenses/lgpl-license.php
//
// Marcelo M. Gonçalves - marcelomgoncalves@gmail.com
//---------------------------------------------------------------------------//

unit uFrmprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ActnList,
  SpkToolbar, spkt_Tab, spkt_Pane, spkt_Buttons;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    ac_ImpressaoCartelas: TAction;
    ac_GerarCartelas: TAction;
    ac_infoEvento: TAction;
    ActionList1: TActionList;
    imgMenu: TImageList;
    SpkLargeButton1: TSpkLargeButton;
    SpkLargeButton2: TSpkLargeButton;
    SpkLargeButton3: TSpkLargeButton;
    SpkPane1: TSpkPane;
    SpkTab1: TSpkTab;
    SpkTab2: TSpkTab;
    SpkToolbar1: TSpkToolbar;
    StatusBar1: TStatusBar;
    procedure ac_GerarCartelasExecute(Sender: TObject);
    procedure ac_ImpressaoCartelasExecute(Sender: TObject);
    procedure ac_infoEventoExecute(Sender: TObject);
  private

  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.lfm}


uses ufrmInformacoes, ufrmGeracaoCartelas, ufrmImpressaoCartelas;

{ TfrmPrincipal }

procedure TfrmPrincipal.ac_infoEventoExecute(Sender: TObject);
begin
  frmInformacoes:=TFrmInformacoes.create(self);
  frmInformacoes.ShowModal;
  FreeAndNil(frmInformacoes);
end;

procedure TfrmPrincipal.ac_GerarCartelasExecute(Sender: TObject);
begin
  frmGeracaoCartelas:=TFrmGeracaoCartelas.create(self);
  frmGeracaoCartelas.showModal;
  FreeAndNil(frmGeracaoCartelas);
end;

procedure TfrmPrincipal.ac_ImpressaoCartelasExecute(Sender: TObject);
begin
  frmImpressaoCartelas:=TfrmImpressaoCartelas.create(self);
  frmImpressaoCartelas.ShowModal;
  FreeAndNil(frmImpressaoCartelas);
end;

end.

