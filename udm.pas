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

unit uDM;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZDataset, DB;

type

  { TDM }

  TDM = class(TDataModule)
    conexao: TZConnection;
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
    procedure conexaoAfterConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure qrEventoBeforeOpen(DataSet: TDataSet);
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

{ TDM }

procedure TDM.DataModuleCreate(Sender: TObject);
begin

end;

procedure TDM.qrEventoBeforeOpen(DataSet: TDataSet);
begin
  qrEvento.parambyName('id').asinteger:=1;
end;

procedure TDM.conexaoAfterConnect(Sender: TObject);
begin
  qrEvento.open;
end;

end.

