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

unit ufrmImpressaoCartelas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, RLReport, ZDataset, JvPanel, Windows ;

type

  { TfrmImpressaoCartelas }

  TfrmImpressaoCartelas = class(TForm)
    bt_Imprimir: TBitBtn;
    bt_fechar: TSpeedButton;
    DBE1: TRLDBText;
    DBE10: TRLDBText;
    DBE100: TRLDBText;
    DBE101: TRLDBText;
    DBE102: TRLDBText;
    DBE103: TRLDBText;
    DBE104: TRLDBText;
    DBE105: TRLDBText;
    DBE106: TRLDBText;
    DBE107: TRLDBText;
    DBE108: TRLDBText;
    DBE109: TRLDBText;
    DBE11: TRLDBText;
    DBE110: TRLDBText;
    DBE111: TRLDBText;
    DBE112: TRLDBText;
    DBE113: TRLDBText;
    DBE114: TRLDBText;
    DBE115: TRLDBText;
    DBE116: TRLDBText;
    DBE117: TRLDBText;
    DBE118: TRLDBText;
    DBE119: TRLDBText;
    DBE12: TRLDBText;
    DBE120: TRLDBText;
    DBE121: TRLDBText;
    DBE122: TRLDBText;
    DBE123: TRLDBText;
    DBE124: TRLDBText;
    DBE125: TRLDBText;
    DBE13: TRLDBText;
    DBE14: TRLDBText;
    DBE15: TRLDBText;
    DBE16: TRLDBText;
    DBE17: TRLDBText;
    DBE18: TRLDBText;
    DBE19: TRLDBText;
    DBE2: TRLDBText;
    DBE20: TRLDBText;
    DBE21: TRLDBText;
    DBE22: TRLDBText;
    DBE23: TRLDBText;
    DBE24: TRLDBText;
    DBE25: TRLDBText;
    DBE26: TRLDBText;
    DBE27: TRLDBText;
    DBE28: TRLDBText;
    DBE29: TRLDBText;
    DBE3: TRLDBText;
    DBE30: TRLDBText;
    DBE31: TRLDBText;
    DBE32: TRLDBText;
    DBE33: TRLDBText;
    DBE34: TRLDBText;
    DBE35: TRLDBText;
    DBE36: TRLDBText;
    DBE37: TRLDBText;
    DBE38: TRLDBText;
    DBE39: TRLDBText;
    DBE4: TRLDBText;
    DBE40: TRLDBText;
    DBE41: TRLDBText;
    DBE42: TRLDBText;
    DBE43: TRLDBText;
    DBE44: TRLDBText;
    DBE45: TRLDBText;
    DBE46: TRLDBText;
    DBE47: TRLDBText;
    DBE48: TRLDBText;
    DBE49: TRLDBText;
    DBE5: TRLDBText;
    DBE50: TRLDBText;
    DBE51: TRLDBText;
    DBE52: TRLDBText;
    DBE53: TRLDBText;
    DBE54: TRLDBText;
    DBE55: TRLDBText;
    DBE56: TRLDBText;
    DBE57: TRLDBText;
    DBE58: TRLDBText;
    DBE59: TRLDBText;
    DBE6: TRLDBText;
    DBE60: TRLDBText;
    DBE61: TRLDBText;
    DBE62: TRLDBText;
    DBE63: TRLDBText;
    DBE64: TRLDBText;
    DBE65: TRLDBText;
    DBE66: TRLDBText;
    DBE67: TRLDBText;
    DBE68: TRLDBText;
    DBE69: TRLDBText;
    DBE7: TRLDBText;
    DBE70: TRLDBText;
    DBE71: TRLDBText;
    DBE72: TRLDBText;
    DBE73: TRLDBText;
    DBE74: TRLDBText;
    DBE75: TRLDBText;
    DBE76: TRLDBText;
    DBE77: TRLDBText;
    DBE78: TRLDBText;
    DBE79: TRLDBText;
    DBE8: TRLDBText;
    DBE80: TRLDBText;
    DBE81: TRLDBText;
    DBE82: TRLDBText;
    DBE83: TRLDBText;
    DBE84: TRLDBText;
    DBE85: TRLDBText;
    DBE86: TRLDBText;
    DBE87: TRLDBText;
    DBE88: TRLDBText;
    DBE89: TRLDBText;
    DBE9: TRLDBText;
    DBE90: TRLDBText;
    DBE91: TRLDBText;
    DBE92: TRLDBText;
    DBE93: TRLDBText;
    DBE94: TRLDBText;
    DBE95: TRLDBText;
    DBE96: TRLDBText;
    DBE97: TRLDBText;
    DBE98: TRLDBText;
    DBE99: TRLDBText;
    dsImpCartelas: TDataSource;
    edInicial: TEdit;
    edFinal: TEdit;
    JvPanel1: TJvPanel;
    Label1: TLabel;
    Label2: TLabel;
    lbl_evento: TRLLabel;
    lbl_Premio1: TRLLabel;
    lbl_Premio3: TRLLabel;
    lbl_Premio4: TRLLabel;
    lbl_Premio5: TRLLabel;
    lbl_Premio6: TRLLabel;
    lb_nmPremio3: TRLLabel;
    lb_nmPremio4: TRLLabel;
    lb_nmPremio5: TRLLabel;
    Panel1: TPanel;
    qrImpCartelas: TZQuery;
    qrImpCartelasB1: TLongintField;
    qrImpCartelasB11: TLongintField;
    qrImpCartelasB12: TLongintField;
    qrImpCartelasB13: TLongintField;
    qrImpCartelasB14: TLongintField;
    qrImpCartelasB15: TLongintField;
    qrImpCartelasB2: TLongintField;
    qrImpCartelasB3: TLongintField;
    qrImpCartelasB4: TLongintField;
    qrImpCartelasB5: TLongintField;
    qrImpCartelasCHAVE: TStringField;
    qrImpCartelasCHAVE2: TStringField;
    qrImpCartelasG1: TLongintField;
    qrImpCartelasG11: TLongintField;
    qrImpCartelasG12: TLongintField;
    qrImpCartelasG13: TLongintField;
    qrImpCartelasG14: TLongintField;
    qrImpCartelasG15: TLongintField;
    qrImpCartelasG2: TLongintField;
    qrImpCartelasG3: TLongintField;
    qrImpCartelasG4: TLongintField;
    qrImpCartelasG5: TLongintField;
    qrImpCartelasI1: TLongintField;
    qrImpCartelasI11: TLongintField;
    qrImpCartelasI12: TLongintField;
    qrImpCartelasI13: TLongintField;
    qrImpCartelasI14: TLongintField;
    qrImpCartelasI15: TLongintField;
    qrImpCartelasI2: TLongintField;
    qrImpCartelasI3: TLongintField;
    qrImpCartelasI4: TLongintField;
    qrImpCartelasI5: TLongintField;
    qrImpCartelasN1: TLongintField;
    qrImpCartelasN11: TLongintField;
    qrImpCartelasN12: TLongintField;
    qrImpCartelasN13: TLongintField;
    qrImpCartelasN14: TLongintField;
    qrImpCartelasN15: TLongintField;
    qrImpCartelasN2: TLongintField;
    qrImpCartelasN3: TLongintField;
    qrImpCartelasN4: TLongintField;
    qrImpCartelasN5: TLongintField;
    qrImpCartelasNUMERO: TLargeintField;
    qrImpCartelasNUMERO2: TLargeintField;
    qrImpCartelasO1: TLongintField;
    qrImpCartelasO11: TLongintField;
    qrImpCartelasO12: TLongintField;
    qrImpCartelasO13: TLongintField;
    qrImpCartelasO14: TLongintField;
    qrImpCartelasO15: TLongintField;
    qrImpCartelasO2: TLongintField;
    qrImpCartelasO3: TLongintField;
    qrImpCartelasO4: TLongintField;
    qrImpCartelasO5: TLongintField;
    repCartelas: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDraw1: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    RLDraw12: TRLDraw;
    RLDraw13: TRLDraw;
    RLDraw14: TRLDraw;
    RLDraw15: TRLDraw;
    RLDraw16: TRLDraw;
    RLDraw17: TRLDraw;
    RLDraw18: TRLDraw;
    RLDraw19: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw20: TRLDraw;
    RLDraw21: TRLDraw;
    RLDraw22: TRLDraw;
    RLDraw23: TRLDraw;
    RLDraw24: TRLDraw;
    RLDraw25: TRLDraw;
    RLDraw26: TRLDraw;
    RLDraw27: TRLDraw;
    RLDraw28: TRLDraw;
    RLDraw29: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw30: TRLDraw;
    RLDraw31: TRLDraw;
    RLDraw32: TRLDraw;
    RLDraw33: TRLDraw;
    RLDraw34: TRLDraw;
    RLDraw35: TRLDraw;
    RLDraw36: TRLDraw;
    RLDraw37: TRLDraw;
    RLDraw38: TRLDraw;
    RLDraw39: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw40: TRLDraw;
    RLDraw41: TRLDraw;
    RLDraw42: TRLDraw;
    RLDraw43: TRLDraw;
    RLDraw44: TRLDraw;
    RLDraw45: TRLDraw;
    RLDraw46: TRLDraw;
    RLDraw47: TRLDraw;
    RLDraw48: TRLDraw;
    RLDraw49: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw50: TRLDraw;
    RLDraw51: TRLDraw;
    RLDraw52: TRLDraw;
    RLDraw53: TRLDraw;
    RLDraw54: TRLDraw;
    RLDraw55: TRLDraw;
    RLDraw56: TRLDraw;
    RLDraw57: TRLDraw;
    RLDraw58: TRLDraw;
    RLDraw59: TRLDraw;
    RLDraw6: TRLDraw;
    RLDraw60: TRLDraw;
    RLDraw61: TRLDraw;
    RLDraw62: TRLDraw;
    RLDraw63: TRLDraw;
    RLDraw64: TRLDraw;
    RLDraw65: TRLDraw;
    RLDraw66: TRLDraw;
    RLDraw67: TRLDraw;
    RLDraw68: TRLDraw;
    RLDraw69: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw70: TRLDraw;
    RLDraw71: TRLDraw;
    RLDraw72: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    lb_nmPremio1: TRLLabel;
    lb_nmPremio2: TRLLabel;
    lb_Assinatura: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;

    procedure bt_fecharClick(Sender: TObject);
    procedure bt_ImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure JvPanel1Click(Sender: TObject);
    procedure RLBand2AfterPrint(Sender: TObject);
  private

  public

  end;

var
  frmImpressaoCartelas: TfrmImpressaoCartelas;

implementation

{$R *.lfm}

uses uDM;
{ TfrmImpressaoCartelas }


procedure TfrmImpressaoCartelas.bt_fecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmImpressaoCartelas.bt_ImprimirClick(Sender: TObject);
var
   cInicial, cFinal: integer;
begin
  try
     cInicial:=StrToInt(edInicial.text);
     cFinal:=StrToInt(edFinal.text);
  except
    begin
        cInicial:=0;
        cFinal:=0;
    end;
  end;
  qrImpCartelas.paramByName('inicio').asInteger:=cInicial;
  qrImpCartelas.paramByName('final').asInteger:=cFinal;
  qrImpCartelas.open;
  lbl_evento.caption:=dm.qrEvento.fieldbyName('DESCRICAO').asString;
  lb_nmpremio1.caption:=dm.qrEvento.fieldbyName('P1PREMIO').asString;
  lb_nmpremio2.caption:=dm.qrEvento.fieldbyName('P2PREMIO').asString;
  lb_nmpremio3.caption:=dm.qrEvento.fieldbyName('P3PREMIO').asString;
  lb_nmpremio4.caption:=dm.qrEvento.fieldbyName('P4PREMIO').asString;
  lb_nmpremio5.caption:=dm.qrEvento.fieldbyName('P5PREMIO').asString;

  repCartelas.Preview();

end;

procedure TfrmImpressaoCartelas.FormCreate(Sender: TObject);
begin

end;

procedure TfrmImpressaoCartelas.FormKeyPress(Sender: TObject; var Key: char);
begin
  if activeControl=nil then exit;

  with activeControl do
  if (key=#13) and (classType = TEdit) then
  begin
    Keybd_event(VK_TAB,0,0,0);
    key:=#0;
  end;
end;

procedure TfrmImpressaoCartelas.JvPanel1Click(Sender: TObject);
begin

end;

procedure TfrmImpressaoCartelas.RLBand2AfterPrint(Sender: TObject);
begin

end;

end.

