# 🧪 Automação de Testes TestComplete: Calculadora do Windows

## 📋 **Visão Geral**

Este projeto automatiza testes funcionais da **Calculadora do Windows** usando o **TestComplete**, com scripts em **JavaScript** e cenários de teste escritos no formato **Gherkin (BDD)**.

O objetivo é validar operações matemáticas básicas (adição, subtração, multiplicação, divisão) de forma robusta e reutilizável.

| **ITEM**                                     | **Status**   |
|---------------------------------------------|--------------|
| Cenários Gherkin criados para ao menos 4 operações | ✅ |
| TestComplete instalado e configurado         | ✅ |
| Scripts automatizados prontos                | ✅ |
| Projeto publicado em repositório público     | ✅ |
| Documentação de uso de IA (se usada)         | ✅ |


### ✅ O projeto inclui:
- **Scripts de teste** para validar operações matemáticas.
- **Cenários BDD (Gherkin)** que descrevem o comportamento esperado em linguagem natural.
- **Manipuladores de eventos** que controlam execução, erros e janelas inesperadas.
- **Funções utilitárias** para interagir com a interface da calculadora e validar os resultados.

💡 **Suporta números inteiros e decimais**. Estrutura modular, fácil de manter e extensível para novos testes.

---

## 🗂️ **Estrutura do Projeto**

📁 CalculadoraTestes/ 

```
CalculadoraTestes/
├── CalculadoraScripts.js      # Funções de teste (somar, subtrair, multiplicar, dividir, todosOsTestes)
├── CalculadoraUtils.js        # Funções utilitárias: clique em botões, validação de resultados, controle da calculadora
├── EventsHooks.js             # Manipuladores de eventos do TestComplete (início, fim, erro, janelas inesperadas)
├── Calculadora.feature        # Cenários de teste escritos em Gherkin (BDD)
└── StepDefinitions.js         # Mapeamento dos passos Gherkin para funções JavaScript
```


### 🧠 Destaques dos arquivos:

#### 📌 `CalculadoraScripts.js`
- Testes como `2+2=4`, `4-9=-5`, `3×9,1=27,3`, `6÷3=2`.

#### 📌 `CalculadoraUtils.js`
- `garantirCalculadoraAberta()`, `pressionarBotao()`, `verificarResultado()`, `calcular()`.
- Suporte para números decimais e operadores matemáticos.

#### 📌 `EventsHooks.js`
- Executa ações no início e fim dos testes.
- Captura erros e lida com janelas inesperadas.

#### 📌 `Calculadora.feature`
- Cenários de teste usando Gherkin.
- Exemplo: `Dado que o usuário abre a Calculadora... Quando insere 2... Então o resultado deve ser 4`.

#### 📌 `StepDefinitions.js`
- Implementa os passos do Gherkin usando funções do `CalculadoraUtils`.

---

## 💻 **Pré-requisitos**

- ✅ **Windows 10 ou superior**
- ✅ **Calculadora do Windows instalada**
- ✅ **TestComplete v14+** com suporte para JavaScript
- ⭕ **Node.js** (opcional, apenas se usar módulos externos)

---

## ⚙️ **Configuração do Projeto**

### 1. 📥 Clonar ou copiar o projeto
```bash
git clone https://github.com/DarkMatter015/Calculadora-TestComplete-Viasoft-LucasC
```


### 2. 🧩 Adicionar os arquivos ao projeto TestComplete

- No Project Explorer, clique com o botão direito em **Scripts** > `Add > Existing Item`.
- Adicione todos os `.js` e o `.feature`.

### 3. 🗺️ Configurar o Name Mapping

Use o **Object Spy** do TestComplete para garantir que os seguintes objetos estão mapeados corretamente:

- `Aliases.Microsoft_WindowsCalculator.Calculadora.NavView.LandmarkTarget`
- Teclado: números, operadores (+, −, ×, ÷), botões CE, CA, =
- Resultado: `A_exibição_é_*`

### 4. ⚡ Configurar Eventos (Event Handlers)

No TestComplete:

- Vá em **Tools > Current Project Properties > Events**
- Configure os eventos:
  - `OnStartTest → Script | EventsHooks | EventsHooks_OnStartTest`
  - `OnStopTest → Script | EventsHooks | EventsHooks_OnStopTest`
  - `OnLogError → Script | EventsHooks | EventsHooks_OnLogError`
  - `OnUnexpectedWindow → Script | EventsHooks | EventsHooks_OnUnexpectedWindow`

### 5. 🧬 Configurar a Integração BDD

- Certifique-se de que o plugin **BDD Support** está ativado.
- No Project Explorer, clique com o botão direito em `Calculadora.feature` > **Run** para executar os testes.

---

## 🚀 Como Rodar o Projeto

### ✅ **Modo 1 – Executar via Gherkin (arquivo `.feature`)**

1. Abra o `Calculadora.feature` no TestComplete.
2. Clique com o botão direito > **Run**.
3. O TestComplete executará os passos definidos em `StepDefinitions.js`.

### ✅ **Modo 2 – Executar via Script direto**

1. Abra o arquivo `CalculadoraScripts.js`.
2. Selecione uma função de teste, como:
```bash
function todosOsTestes() {
  testarSoma();
  testarSubtracao();
  testarMultiplicacao();
  testarDivisao();
}
```
3. Clique com o botão direito sobre a função > **Run**.

### ✅ **Modo 3 - Executar Bateria de Testes**

1. Abra o projeto
2. Clique em `Run project Suite (F5)`

### 📸 **Exemplo de Execução**
```bash
Cenário: Soma de dois números
Dado que o usuário abre o aplicativo Calculadora
Quando o usuário insere o número 2
E o usuário pressiona o botão de adição
E o usuário insere o número 2
E o usuário pressiona o botão de igual
Então o resultado exibido deve ser 4
```

## 👨‍💻 **Autor**

***Lucas Matheus de Camargo***

Estudante de Análise e Desenvolvimento de Sistemas - UTFPR

Testes de Software e Automação QA