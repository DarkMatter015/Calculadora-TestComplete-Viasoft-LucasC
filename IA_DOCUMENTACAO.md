# Histórico de Uso de Inteligência Artificial no Projeto

Este documento registra as interações com ferramentas de inteligência artificial (ChatGPT e Grok) utilizadas durante o desenvolvimento do projeto de automação de testes da Calculadora do Windows com TestComplete. O projeto foi baseado no escopo disponível no Google Drive e orientado pela série de 8 vídeos do canal **rsmSantos** no YouTube. Abaixo, cada interação é detalhada com o prompt utilizado, a ferramenta, a versão, o resultado obtido e os benefícios para o projeto.

## Estrutura do Histórico
Cada seção corresponde a uma interação com a IA, contendo:
- **Ferramenta**: Nome da ferramenta de IA (ex.: ChatGPT, Grok).
- **Versão**: Modelo ou versão específica (ex.: GPT-4o, Grok 3).
- **Prompt**: Texto ou contexto fornecido à IA.
- **Resultado**: Resumo do que a IA retornou, incluindo exemplos de código quando aplicável.
- **Benefícios**: Como a interação contribuiu para o projeto.

---

## 1. Melhoria do Arquivo `EventsHooks`

**Ferramenta**: ChatGPT  
**Versão**: GPT-4o  
**Prompt**:  
> (Disponibilizei os arquivos do projeto baseados nos vídeos) O arquivo `EventsHooks`, como posso melhorá-lo?

**Resultado**:  
O ChatGPT analisou o arquivo `EventsHooks.js` inicial, que continha funções básicas para iniciar e encerrar a Calculadora do Windows. Foram sugeridas melhorias, como:
- Verificar se a calculadora já está aberta antes de iniciá-la.
- Centralizar a lógica de encerramento em uma função auxiliar (`fecharCalculadora`).
- Adicionar mensagens de log mais descritivas com emojis.

**Código Refatorado**:
```javascript
function iniciarCalculadora() {
  if (!Sys.WaitProcess("Microsoft.WindowsCalculator", 1000).Exists) {
    Log.Message("🔄 Iniciando a calculadora.");
    TestedApps.calc.Run();
    Delay(500);
  } else {
    Log.Message("✅ Calculadora já estava aberta.");
  }
}

function fecharCalculadora() {
  const processoCalc = Sys.Process("Microsoft.WindowsCalculator");
  if (processoCalc.Exists) {
    Log.Message("🛑 Encerrando a calculadora.");
    processoCalc.Terminate();
  } else {
    Log.Message("ℹ️ A calculadora já estava encerrada.");
  }
}

function EventsHooks_OnStartTest(Sender) {
  Log.Message("🚀 Iniciando o teste...");
  iniciarCalculadora();
}

function EventsHooks_OnStopTest(Sender) {
  Log.Message("✅ Teste finalizado com sucesso.");
  fecharCalculadora();
}

function EventsHooks_OnLogError(Sender, LogParams) {
  Log.Error("❌ Erro durante o teste: " + LogParams.Str);
  fecharCalculadora();
}
```

**Benefícios**:
- Código mais modular e reutilizável.
- Evita múltiplas instâncias da calculadora.
- Logs mais claros, facilitando a depuração.
- Padrão aplicável a outros scripts do projeto (ex.: `CalculadoraUtils`).

---

## 2. Simplificação de Chamadas de Funções com Variáveis

**Ferramenta**: ChatGPT  
**Versão**: GPT-4o  
**Prompt**:  
> Crie uma variável para as funções para não chamar em cada linha `uCodigo`.

**Resultado**:  
O ChatGPT sugeriu criar variáveis para as funções do módulo `uCodigo` no arquivo `CalculadoraScripts.js`, evitando a repetição de `uCodigo` em cada chamada. Isso tornou o código mais limpo e fácil de manter.

**Código Modificado (`CalculadoraScripts.js`)**:
```javascript
var uCodigo = require("uCodigo");

var inicio = uCodigo.inicio;
var pressionarBotao = uCodigo.pressionarBotao;
var calcular = uCodigo.calcular;
var verificarResultado = uCodigo.verificarResultado;

function somar() {
  inicio();
  pressionarBotao("CE");
  Log.AppendFolder("➕ Teste: Soma");
  calcular("2+2=4");
  calcular("5+3=8");
  Log.PopLogFolder();
}

// Funções subtrair, multiplicar, dividir e todosOsTestes seguem o mesmo padrão
```

**Benefícios**:
- Redução de redundância no código.
- Maior legibilidade e manutenção.
- Facilidade para adicionar novas funções ou ajustar chamadas existentes.

---

## 3. Completar Estrutura `switch` para Botões da Calculadora

**Ferramenta**: Grok  
**Versão**: Grok 3  
**Prompt**:  
> Complete para mim:  
> ```javascript
> switch ( botao ) {
>   case 0:
>     numeros.Zero.Click();
>     break;
>   case :
>     break;
> }
> 
> numeros.Um.Click();
> numeros.Dois.Click();
> // ... outros números
> ```

**Resultado**:  
O Grok completou a estrutura `switch` para mapear os botões numéricos (0 a 9) da calculadora, mantendo a consistência com o caso 0 fornecido.

**Código Completado**:
```javascript
switch (botao) {
  case 0:
    numeros.Zero.Click();
    break;
  case 1:
    numeros.Um.Click();
    break;
  case 2:
    numeros.Dois.Click();
    break;
  case 3:
    numeros.Tr_s.Click();
    break;
  case 4:
    numeros.Quatro.Click();
    break;
  case 5:
    numeros.Cinco.Click();
    break;
  case 6:
    numeros.Seis.Click();
    break;
  case 7:
    numeros.Sete.Click();
    break;
  case 8:
    numeros.Oito.Click();
    break;
  case 9:
    numeros.Nove.Click();
    break;
}
```

**Benefícios**:
- Mapeamento completo dos botões numéricos, essencial para a função `pressionarBotao` em `CalculadoraUtils`.
- Código consistente e pronto para automação.
- Reduziu a necessidade de ajustes manuais no mapeamento de botões.

---

## 4. Criação de Cenários Gherkin para Operações da Calculadora

**Ferramenta**: Grok  
**Versão**: Grok 3  
**Prompt**:  
> Escrita dos Cenários BDD (Gherkin), escreva cenários para cada Adição, Subtração, Multiplicação e Divisão.  
> Estrutura de um cenário (exemplo de adição):  
> ```gherkin
> Funcionalidade: Operação na Calculadora do Windows
> Cenário: Realizar adição de dois números
>   Dado que o usuário abre o aplicativo Calculadora pelo menu Iniciar
>   Quando o usuário insere o número 7
>   E o usuário pressiona o botão de adição
>   E o usuário insere o número 5
>   E o usuário pressiona o botão de igual
>   Então o resultado exibido deve ser 12
>   E o usuário fecha a Calculadora
> ```

**Resultado**:  
O Grok criou cenários Gherkin para adição, subtração, multiplicação, divisão e tratamento de erro de divisão por zero, alinhados com o projeto e os testes em `CalculadoraScripts`.

**Cenários Gherkin**:
```gherkin
Funcionalidade: Operações na Calculadora do Windows

Cenário: Realizar adição de dois números
  Dado que o usuário abre o aplicativo Calculadora pelo menu Iniciar
  Quando o usuário insere o número 7
  E o usuário pressiona o botão de adição
  E o usuário insere o número 5
  E o usuário pressiona o botão de igual
  Então o resultado exibido deve ser 12
  E o usuário fecha a Calculadora

Cenário: Realizar subtração de dois números
  Dado que o usuário abre o aplicativo Calculadora pelo menu Iniciar
  Quando o usuário insere o número 10
  E o usuário pressiona o botão de subtração
  E o usuário insere o número 3
  E o usuário pressiona o botão de igual
  Então o resultado exibido deve ser 7
  E o usuário fecha a Calculadora

Cenário: Realizar multiplicação de dois números
  Dado que o usuário abre o aplicativo Calculadora pelo menu Iniciar
  Quando o usuário insere o número 6
  E o usuário pressiona o botão de multiplicação
  E o usuário insere o número 4
  E o usuário pressiona o botão de igual
  Então o resultado exibido deve ser 24
  E o usuário fecha a Calculadora

Cenário: Realizar divisão de dois números
  Dado que o usuário abre o aplicativo Calculadora pelo menu Iniciar
  Quando o usuário insere o número 8
  E o usuário pressiona o botão de divisão
  E o usuário insere o número 2
  E o usuário pressiona o botão de igual
  Então o resultado exibido deve ser 4
  E o usuário fecha a Calculadora

Cenário: Tratar erro de divisão por zero
  Dado que o usuário abre o aplicativo Calculadora pelo menu Iniciar
  Quando o usuário insere o número 10
  E o usuário pressiona o botão de divisão
  E o usuário insere o número 0
  E o usuário pressiona o botão de igual
  Então a mensagem exibida deve ser "Não é possível dividir por zero"
  E o usuário fecha a Calculadora
```

**Benefícios**:
- Cenários claros e consistentes, prontos para integração com TestComplete via SpecFlow ou plugin BDD.
- Cobertura de operações básicas e erro de divisão por zero, alinhada com `CalculadoraScripts`.
- Sugestões para cenários adicionais (ex.: `"++=Entrada inválida"`) e automação com `CalculadoraUtils`.

---

## 5. Configuração do `EventsHooks` no TestComplete

**Ferramenta**: Grok  
**Versão**: Grok 3  
**Prompt**:  
> Meus `EventsHooks` não são usados nenhuma vez:  
> ```javascript
> var CalculadoraUtils = require("CalculadoraUtils");
> var garantirCalculadoraAberta = CalculadoraUtils.garantirCalculadoraAberta();
> 
> function fecharCalculadora() {
>   const processoCalc = Sys.WaitProcess("Microsoft.WindowsCalculator", 1000);
>   if (processoCalc.Exists) {
>     Log.Message("! Encerrando a calculadora.");
>     processoCalc.Terminate();
>     processoCalc.Wait(2000);
>   } else {
>     Log.Message("ℹ A calculadora já estava encerrada.");
>   }
> }
> 
> function EventsHooks_OnStartTest(Sender) {
>   Log.Message("Iniciando o teste...");
>   garantirCalculadoraAberta();
> }
> 
> function EventsHooks_OnStopTest(Sender) {
>   Log.Message("✅ Teste finalizado com sucesso.");
>   fecharCalculadora();
> }
> 
> function EventsHooks_OnLogError(Sender, LogParams) {
>   Log.Error("❌ Erro durante o teste: " + LogParams.Str);
>   Log.Picture(Sys.Desktop.Picture(), "Captura de tela no momento do erro");
> }
> 
> function EventsHooks_OnUnexpectedWindow(Sender, Window, LogParams) {
>   Log.Warning("Janela inesperada detectada: " + Window.Caption);
>   Log.Picture(Window, "Captura da janela");
>   Window.Close();
>   LogParams.Locked = true;
> }
> ```

**Resultado**:  
O Grok identificou que o `EventsHooks` não estava sendo usado porque não foi associado aos eventos do TestComplete. Foram fornecidas instruções para configurá-lo:

1. **Adicionar ao Projeto**:
   - Incluir `EventsHooks.js` no Project Explorer (**Script > Add > Existing Item**).

2. **Associar aos Eventos**:
   - Em **Tools > Current Project Properties > Events**, adicionar:
     - **OnStartTest**: `Script | EventsHooks | EventsHooks_OnStartTest`.
     - **OnStopTest**: `Script | EventsHooks | EventsHooks_OnStopTest`.
     - **OnLogError**: `Script | EventsHooks | EventsHooks_OnLogError`.
     - **OnUnexpectedWindow**: `Script | EventsHooks | EventsHooks_OnUnexpectedWindow`.

3. **Testar**:
   - Executar um teste e verificar logs para mensagens como `"Iniciando o teste..."` e `"Teste finalizado com sucesso."`.

**Benefícios**:
- Resolução do problema de `EventsHooks` não utilizado.
- Automação do setup (abrir calculadora) e teardown (fechar calculadora).
- Logs e capturas de tela para depuração de erros.

---

## 6. Criação de um README Completo para o Projeto

**Ferramenta**: Grok  
**Versão**: Grok 3  
**Prompt**:  
> (Disponibilizei os arquivos do projeto) Faça um README completo do projeto explicando o projeto e como executar.

**Resultado**:  
O Grok gerou um README detalhado descrevendo o projeto de automação de testes da Calculadora do Windows, incluindo:
- **Visão Geral**: Objetivo do projeto (testar operações matemáticas e erros).
- **Estrutura**: Descrição dos arquivos (`CalculadoraScripts.js`, `CalculadoraUtils.js`, `EventsHooks.js`, `Calculadora.feature`, `StepDefinitions.js`).
- **Pré-requisitos**: Sistema operacional, TestComplete, configuração do projeto.
- **Configuração**: Instruções para adicionar arquivos, configurar Name Mapping, associar `EventsHooks`, e integrar BDD.
- **Correção de Problemas**: Solução para o erro em `verificarResultado` (suporte a `"Não é possível dividir por zero"`) e reativação de `testarErros`.
- **Execução**: Passos para rodar scripts e cenários Gherkin.
- **Cenários de Teste**: Lista de testes cobertos (adição, subtração, multiplicação, divisão, erro).
- **Extensões**: Sugestões para adicionar testes como `"++=Entrada inválida"`.

**Benefícios**:
- Documentação profissional e completa.
- Instruções claras para configurar e executar o projeto.
- Solução para problemas conhecidos (ex.: erro de `TextContainer`).
- Base para futuras extensões do projeto.

---

## Considerações Gerais
- **Base do Projeto**: O desenvolvimento foi guiado pelo escopo do Google Drive e pela série de vídeos do canal **rsmSantos**, que forneceram a estrutura inicial.
- **Ferramentas de IA**:
  - **ChatGPT (GPT-4o)**: Usado para refatorações iniciais e simplificação de código.
  - **Grok (Grok 3)**: Usado para criação de cenários Gherkin, resolução de problemas específicos (ex.: `EventsHooks`), e documentação.
- **Impacto da IA**:
  - Acelerou a implementação de boas práticas (ex.: modularidade, logs claros).
  - Forneceu soluções para erros técnicos (ex.: configuração de eventos, validação de erros).
  - Facilitou a criação de cenários BDD e documentação.
- **Próximos Passos**:
  - Adicionar suporte para o teste `"++=Entrada inválida"` com cenário Gherkin e ajuste em `verificarResultado`.
  - Testar a integração BDD com SpecFlow ou plugin TestComplete BDD.
  - Validar a configuração do `EventsHooks` e a execução de todos os cenários.

Se precisar de mais detalhes sobre alguma interação ou ajustes no projeto, entre em contato!

---

**Nota**: Este histórico foi organizado para refletir o progresso do projeto e pode ser atualizado com novas interações com a IA. Certifique-se de executar os testes após aplicar as sugestões e validar os logs no TestComplete para garantir que tudo funciona conforme esperado.

---

Este Markdown está pronto para ser copiado e colado. Ele mantém todo o conteúdo original, mas organiza as informações de forma mais clara, com títulos consistentes, seções numeradas, e um tom profissional. Se precisar de ajustes adicionais (ex.: incluir mais interações ou detalhes), é só avisar!