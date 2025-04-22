var CalculadoraUtils = require("CalculadoraUtils");

// Referência das funções de CalculadoraUtils em uma variável
var garantirCalculadoraAberta = CalculadoraUtils.garantirCalculadoraAberta;
var pressionarBotao = CalculadoraUtils.pressionarBotao;
var calcular = CalculadoraUtils.calcular;
var verificarResultado = CalculadoraUtils.verificarResultado;

function somar() {
  garantirCalculadoraAberta();
  Log.AppendFolder("➕ Teste: Soma");
  calcular("2+2=4");
  calcular("5+3=8");
  Log.PopLogFolder();
}

function subtrair() {
  garantirCalculadoraAberta();
  Log.AppendFolder("➖ Teste: Subtração");
  calcular("4-9=-5");
  calcular("7-3=4");
  Log.PopLogFolder();
}

function multiplicar() {
  garantirCalculadoraAberta();
  Log.AppendFolder("✖ Teste: Multiplicação");
  calcular("3*9,1=27,3");
  calcular("6*0=0");
  Log.PopLogFolder();
}

function dividir() {
  garantirCalculadoraAberta();
  Log.AppendFolder("➗ Teste: Divisão");
  calcular("8/2=4");
  calcular("6/3=2");
  Log.PopLogFolder();
}

function todosOsTestes() {
  somar();
  subtrair();
  multiplicar();
  dividir();
}

// Nao consegui fazer funcionar a validação Não é possível dividir por zero (somente se criasse uma função especifica para isso)
function testarErros() {
  garantirCalculadoraAberta();
  Log.AppendFolder("🚫 Teste: Erros");
  calcular("10/0=Não é possível dividir por zero");
  Log.PopLogFolder();
}

module.exports = {
  somar,
  subtrair,
  multiplicar,
  dividir,
  todosOsTestes
};
