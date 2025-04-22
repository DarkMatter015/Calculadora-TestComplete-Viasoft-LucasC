# language: pt

Funcionalidade: Operações matemáticas com a Calculadora do Windows
  Como um usuário
  Quero realizar operações básicas
  Para obter os resultados corretos

  Cenário: Soma de dois números inteiros
    Dado que o usuário abre o aplicativo Calculadora pelo menu Iniciar
    Quando o usuário insere o número 22
    E o usuário pressiona o botão de adição
    E o usuário insere o número 2
    E o usuário pressiona o botão de igual
    Então o resultado exibido deve ser 24
    E o usuário fecha a Calculadora

  Cenário: Subtração entre dois números inteiros
    Dado que o usuário abre o aplicativo Calculadora pelo menu Iniciar
    Quando o usuário insere o número 9
    E o usuário pressiona o botão de subtração
    E o usuário insere o número 5
    E o usuário pressiona o botão de igual
    Então o resultado exibido deve ser 4
    E o usuário fecha a Calculadora

  Cenário: Multiplicação envolvendo zero
    Dado que o usuário abre o aplicativo Calculadora pelo menu Iniciar
    Quando o usuário insere o número 1
    E o usuário pressiona o botão de multiplicação
    E o usuário insere o número 0
    E o usuário pressiona o botão de igual
    Então o resultado exibido deve ser 0
    E o usuário fecha a Calculadora
    
  Cenário: Multiplicação entre dois números inteiros
    Dado que o usuário abre o aplicativo Calculadora pelo menu Iniciar
    Quando o usuário insere o número 10
    E o usuário pressiona o botão de multiplicação
    E o usuário insere o número 5
    E o usuário pressiona o botão de igual
    Então o resultado exibido deve ser 50
    E o usuário fecha a Calculadora

  Cenário: Divisão de dois números inteiros
    Dado que o usuário abre o aplicativo Calculadora pelo menu Iniciar
    Quando o usuário insere o número 6
    E o usuário pressiona o botão de divisão
    E o usuário insere o número 3
    E o usuário pressiona o botão de igual
    Então o resultado exibido deve ser 2
    E o usuário fecha a Calculadora

  Cenário: Soma com número decimal
    Dado que o usuário abre o aplicativo Calculadora pelo menu Iniciar
    Quando o usuário insere o número 2,5
    E o usuário pressiona o botão de adição
    E o usuário insere o número 3,5
    E o usuário pressiona o botão de igual
    Então o resultado exibido deve ser 6
    E o usuário fecha a Calculadora