var EventsHooks = require("EventsHooks");
var fecharCalculadora = EventsHooks.fecharCalculadora;

const {
  garantirCalculadoraAberta,
  pressionarBotao,
  verificarResultado,
} = require("CalculadoraUtils");

let operador = "";
let resultadoEsperado = "";

// Dado que o usuário abre o aplicativo
Given("que o usuário abre o aplicativo Calculadora pelo menu Iniciar", function () {
  garantirCalculadoraAberta();
});

// Quando o usuário insere o número
When("o usuário insere o número {string}", function (string) {
  let string1 = string.toString().split('')
  for(let i = 0; i < string1.length; i++){
    pressionarBotao(string1[i]);
  }
});

// Quando o usuário insere um número decimal
When("o usuário insere o número {string},{string}", function (inteiro, decimal) {
  const numero = inteiro + "," + decimal;
  for (let i = 0; i < numero.length; i++) {
    pressionarBotao(numero[i]);
  }
});

// Operações
When("o usuário pressiona o botão de adição", function () {
  operador = "+";
  pressionarBotao("+");
});

When("o usuário pressiona o botão de subtração", function () {
  operador = "-";
  pressionarBotao("-");
});

When("o usuário pressiona o botão de multiplicação", function () {
  operador = "*";
  pressionarBotao("*");
});

When("o usuário pressiona o botão de divisão", function () {
  operador = "/";
  pressionarBotao("/");
});

// Igual
When("o usuário pressiona o botão de igual", function () {
  pressionarBotao("=");
});

// Resultado
Then("o resultado exibido deve ser {string}", function (resultado) {
  resultadoEsperado = resultado;
  verificarResultado(resultadoEsperado);
});

Then("o resultado exibido deve ser {string},{string}", function (inteiro, decimal) {
  resultadoEsperado = inteiro + "," + decimal;
  verificarResultado(resultadoEsperado);
});

Then("a mensagem exibida deve ser {string}", function (mensagem) {
  resultadoEsperado = mensagem;
  verificarResultado(resultadoEsperado);
});

// Fechar calculadora
Then("o usuário fecha a Calculadora", function () {
  fecharCalculadora();
});