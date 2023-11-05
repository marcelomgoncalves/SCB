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

unit ufrmGeracaoCartelas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
  ExtCtrls, JvSpecialProgress, JvCheckBox, ZDataset, Math;

type

  { TfrmGeracaoCartelas }

  TfrmGeracaoCartelas = class(TForm)
    bt_fechar: TSpeedButton;
    bt_fechar1: TSpeedButton;
    bt_gerar: TBitBtn;
    chkVisualizar: TJvCheckBox;
    edQtde: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    prg: TJvSpecialProgress;
    Memo1: TMemo;
    qrAux: TZQuery;
    rgbTipo: TRadioGroup;
    procedure bt_fechar1Click(Sender: TObject);
    procedure bt_gerarClick(Sender: TObject);
    procedure rgbTipoClick(Sender: TObject);
  private
    procedure bubbleSort(var pArray: TStringArray);
    function RemoveElement(var pArray: TStringArray; const pIndex: integer
      ): boolean;
    function StrZero(Zeros: string; Quant: integer): String;

  public

  end;

var
  frmGeracaoCartelas: TfrmGeracaoCartelas;

implementation

{$R *.lfm}

{ TfrmGeracaoCartelas }

procedure TfrmGeracaoCartelas.rgbTipoClick(Sender: TObject);
begin

end;

procedure TfrmGeracaoCartelas.bt_gerarClick(Sender: TObject);
var
 LetraB: TStringArray;
 LetraI: TStringArray;
 LetraN: TStringArray;
 LetraG: TStringArray;
 LetraO: TStringArray;

 SorteioB,SorteioI,SorteioN,SorteioG,SorteioO: TStringArray;

 p1,p2,p3,p4,p5, nomecampo,chave:String;
 j,x,q,qtd, tipoCartela, qtdNumCartela: Integer;



begin
  qrAux.close;
  qrAux.sql.clear;
  qrAux.sql.add('delete from cartelas ;');
  qrAux.ExecSQL;
  qrAux.close;
  qrAux.sql.clear;
  qrAux.sql.add('set generator GEN_CARTELAS_ID to 0;');
  qrAux.ExecSQL;

 prg.position:=0;
 try
  qtd:=StrToInt(edQtde.Text);
 except
       begin
         ShowMessage('Houve um erro na conversão da quantidade de cartelas! Você deve preencher a quantidade com números válidos!');
         abort;
       end;
 end;

 if (rgbTipo.itemIndex = 0) then
 begin
   tipoCartela:=1;
   qtdNumCartela:=15;
 end
 else if (rgbTipo.itemIndex = 1) then
 begin
   tipoCartela:=2;
   qtdNumCartela:=17;
 end
 else
 begin
   tipoCartela:=2;
   qtdNumCartela:=18;
 end;

 memo1.Lines.Clear;
 memo1.Lines.Add('*** Iniciando a Geração de '+qtd.toString()+' Cartelas de Bingo ***');
 memo1.lines.add('');
 memo1.Lines.Add('*** Aguarde a Mensagem de Término da Geração ***');

 for q := 1 to qtd do
 begin

   prg.position:=trunc((q / qtd) * 100);

   SetLength(LetraB, qtdNumCartela);
   SetLength(LetraI, qtdNumCartela);                // inicializa o tamanho dos vetores
   SetLength(LetraN, qtdNumCartela);
   SetLength(LetraG, qtdNumCartela);
   SetLength(LetraO, qtdNumCartela);

   SetLength(SorteioB,5);
   SetLength(SorteioI,5);
   SetLength(SorteioN,5);
   SetLength(SorteioG,5);
   SetLength(SorteioO,5);

   for x:=0 to (qtdNumCartela-1) do
   begin
     LetraB[x]:=IntToStr(x+1);
     LetraI[x]:=IntToStr((x+1) + qtdNumCartela);
     LetraN[x]:=IntToStr((x+1) + qtdNumCartela*2);              //preenche os vetores com os dados em cada letra
     LetraG[x]:=IntToStr((x+1) + qtdNumCartela*3);
     LetraO[x]:=IntToStr((x+1) + qtdNumCartela*4);
   end;

   for x := 0 to 4 do
   begin
     SorteioB[x]:='X';
     SorteioI[x]:='X';                               // preenche os vetores de sorteio com 'X'
     SorteioN[x]:='X';
     SorteioG[x]:='X';
     SorteioO[x]:='X';
   end;


   // começa a parte de sorteios e eliminação do numero sorteado do array de cada letra
   // para evitar duplicidade de numeros
   j:=0;
   randomize;

   while j <= 4 do
   begin
     x:=randomRange(0, Length(LetraB));
     p1:=LetraB[x];
     removeElement(LetraB, x);

     x:=randomRange(0, Length(LetraI));
     p2:=LetraI[x];
     removeElement(LetraI, x);

     x:=randomRange(0, Length(LetraN));
     p3:=LetraN[x];
     removeElement(LetraN, x);

     x:=randomRange(0, Length(LetraG));
     p4:=LetraG[x];
     removeElement(LetraG, x);

     x:=randomRange(0, Length(LetraO));
     p5:=LetraO[x];
     removeElement(LetraO, x);

     SorteioB[j]:=p1;
     SorteioI[j]:=p2;
     SorteioN[j]:=p3;
     SorteioG[j]:=p4;
     SorteioO[j]:=p5;

     j := j + 1;

     sleep(5);
     Application.ProcessMessages;

   end;

   bubbleSort(SorteioB);
   bubbleSort(SorteioI);            // Utiliza Rotina de Ordenação bubbleSort para os Arrays
   bubbleSort(SorteioN);            // COLOCA NÚMEROS NA ORDEM CRESCENTE EM CADA LETRA (BINGO)
   bubbleSort(SorteioG);
   bubbleSort(SorteioO);

   // memo1.Lines.Clear;
   if chkVisualizar.checked then
   begin
     for x := 0 to 4 do
     begin
      memo1.Lines.Add(SorteioB[x]+' - '+SorteioI[x]+' - '+SorteioN[x]+' - '+SorteioG[x]+' - '+SorteioO[x]);
     end;
     memo1.Lines.Add('');
     memo1.Lines.Add('');
   end;
   qrAux.close;
   qrAux.SQL.Clear;
   qrAux.SQL.Add('INSERT INTO CARTELAS (B1,B2,B3,B4,B5,I1,I2,I3,I4,I5,N1,N2,N3,N4,N5,G1,G2,G3,G4,G5,O1,O2,O3,O4,O5,CHAVE) ');
   qrAux.SQL.Add('VALUES (:B1,:B2,:B3,:B4,:B5,:I1,:I2,:I3,:I4,:I5,:N1,:N2,:N3,:N4,:N5,:G1,:G2,:G3,:G4,:G5,:O1,:O2,:O3,:O4,:O5,:CHAVE);');
   qrAux.ParamByName('B1').AsString:=SorteioB[0];
   qrAux.ParamByName('B2').AsString:=SorteioB[1];
   qrAux.ParamByName('B3').AsString:=SorteioB[2];
   qrAux.ParamByName('B4').AsString:=SorteioB[3];
   qrAux.ParamByName('B5').AsString:=SorteioB[4];
   qrAux.ParamByName('I1').AsString:=SorteioI[0];
   qrAux.ParamByName('I2').AsString:=SorteioI[1];
   qrAux.ParamByName('I3').AsString:=SorteioI[2];
   qrAux.ParamByName('I4').AsString:=SorteioI[3];
   qrAux.ParamByName('I5').AsString:=SorteioI[4];
   qrAux.ParamByName('N1').AsString:=SorteioN[0];
   qrAux.ParamByName('N2').AsString:=SorteioN[1];
   qrAux.ParamByName('N3').AsString:=SorteioN[2];
   qrAux.ParamByName('N4').AsString:=SorteioN[3];
   qrAux.ParamByName('N5').AsString:=SorteioN[4];
   qrAux.ParamByName('G1').AsString:=SorteioG[0];
   qrAux.ParamByName('G2').AsString:=SorteioG[1];
   qrAux.ParamByName('G3').AsString:=SorteioG[2];
   qrAux.ParamByName('G4').AsString:=SorteioG[3];
   qrAux.ParamByName('G5').AsString:=SorteioG[4];
   qrAux.ParamByName('O1').AsString:=SorteioO[0];
   qrAux.ParamByName('O2').AsString:=SorteioO[1];
   qrAux.ParamByName('O3').AsString:=SorteioO[2];
   qrAux.ParamByName('O4').AsString:=SorteioO[3];
   qrAux.ParamByName('O5').AsString:=SorteioO[4];
   chave:=StrZero(SorteioB[0],2)+StrZero(SorteioB[1],2)+StrZero(SorteioB[2],2)+StrZero(SorteioB[3],2)+StrZero(SorteioB[4],2);
   chave:=chave+StrZero(SorteioI[0],2)+StrZero(SorteioI[1],2)+StrZero(SorteioI[2],2)+StrZero(SorteioI[3],2)+StrZero(SorteioI[4],2);
   chave:=chave+StrZero(SorteioN[0],2)+StrZero(SorteioN[1],2)+StrZero(SorteioN[2],2)+StrZero(SorteioN[3],2)+StrZero(SorteioN[4],2);
   chave:=chave+StrZero(SorteioG[0],2)+StrZero(SorteioG[1],2)+StrZero(SorteioG[2],2)+StrZero(SorteioG[3],2)+StrZero(SorteioG[4],2);
   chave:=chave+StrZero(SorteioO[0],2)+StrZero(SorteioO[1],2)+StrZero(SorteioO[2],2)+StrZero(SorteioO[3],2)+StrZero(SorteioO[4],2);
   qrAux.ParamByName('chave').AsString:=chave;
   try
     qrAux.ExecSQL;
    // dm.Conexao.CommitRetaining;
   except on e:Exception do
     begin
       Showmessage(e.Message);
       qtd:=qtd+1;
     end;
   end;
 end;

 memo1.Lines.Add('*** Fim da Geração de Cartelas ***');

end;

procedure TfrmGeracaoCartelas.bt_fechar1Click(Sender: TObject);
begin
  close;
end;

function TfrmGeracaoCartelas.RemoveElement(var pArray: TStringArray; const pIndex:integer):boolean;
var
  i :integer;
begin
  Result := (pIndex <= High(pArray)) and (pIndex >= Low(pArray));
  if not(Result) then
    raise EListError.Create(
      Format('List index is out of bounds (s).', [pIndex]))
  else
    begin
      for i:= pIndex to High(pArray)-1 do
        pArray[i] := pArray[i+1];
      SetLength(pArray, Length(pArray)-1);
      Result := true;
    end;
end;

procedure TfrmGeracaoCartelas.bubbleSort(var pArray: TStringArray);
var
   I, J: integer;
   Troca:String;
begin
     for I := 0 to 4 do
     begin
          for J := I + 1 to 4 do
          begin
               if StrToInt(pArray[J]) < StrToInt(pArray[I]) then
               begin
                    troca := pArray[I];
                    pArray[I] := pArray[J];
                    pArray[J] := troca;
               end;
          end;
     end;
end;

function TfrmGeracaoCartelas.StrZero(zeros:string; Quant:integer):String;
var
 i,tamanho:integer;
 aux: string;
begin
 aux := zeros;
 tamanho := length(zeros);
 zeros:='';

 for i:=1 to (Quant-tamanho) do zeros := zeros + '0';

 aux := zeros + aux;
 result := aux;
end;

end.

