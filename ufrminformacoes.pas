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

unit ufrmInformacoes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBCtrls, ZDataset;

type

  { TfrmInformacoes }

  TfrmInformacoes = class(TForm)
    bt_gravar: TBitBtn;
    edDescEvento: TDBEdit;
    edDHEvento: TDBEdit;
    edLocalEvento: TDBEdit;
    edPatrocEvento: TDBEdit;
    edPremio1: TDBEdit;
    edPremio2: TDBEdit;
    edPremio3: TDBEdit;
    edPremio4: TDBEdit;
    edPremio5: TDBEdit;
    edPremioExtra: TDBEdit;
    edPromoEvento: TDBEdit;
    dsEvento: TDataSource;
    edValorCartela: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    bt_fechar: TSpeedButton;
    qrEvento: TZQuery;
    qrEventoDATAHORA: TStringField;
    qrEventoDESCRICAO: TStringField;
    qrEventoID: TSmallintField;
    qrEventoLOCAL: TStringField;
    qrEventoMENSAGEM: TMemoField;
    qrEventoP1PREMIO: TStringField;
    qrEventoP2PREMIO: TStringField;
    qrEventoP3PREMIO: TStringField;
    qrEventoP4PREMIO: TStringField;
    qrEventoP5PREMIO: TStringField;
    qrEventoPATROCINADORES: TStringField;
    qrEventoPREMIO_CARTELAEXTRA: TStringField;
    qrEventoPROMOTORES: TStringField;
    qrEventoVALORCARTELA: TFloatField;
    procedure bt_fecharClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure dsEventoStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmInformacoes: TfrmInformacoes;

implementation

{$R *.lfm}

{ TfrmInformacoes }
uses uDM;

procedure TfrmInformacoes.bt_fecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmInformacoes.bt_gravarClick(Sender: TObject);
begin
  if qrEvento.state in [dsEdit] then
  begin
     qrEvento.post;
     qrEvento.ApplyUpdates;
  end;
end;

procedure TfrmInformacoes.dsEventoStateChange(Sender: TObject);
begin
  if qrEvento.state in [dsEdit] then
     bt_gravar.Enabled:=true
  else
    bt_gravar.Enabled:=false;

end;

procedure TfrmInformacoes.FormCreate(Sender: TObject);
begin
     qrEvento.Open;
end;

end.

