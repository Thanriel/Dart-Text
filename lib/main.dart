import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      //home: MyHomePage(title: 'Relatório 3 - Trabalhando com Textos'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key? key, this.title}) : super(key: key);
  const MyHomePage({Key? key}) : super(key: key);

  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isHidden = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // função criada para alterar o estado da visibilidade da senha: escondida ou visível
  // acostume-se a colocar os nomes de variáveis e funções em ingles. O Flutter agradece.
  void _changePassVisibility() {
    if (_isHidden == true) {
      _isHidden = false;
      print('_isHidden = false. Mostra Senha.');
    } else {
      _isHidden = true;
      print('_isHidden = true. Esconde Senha.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //------------------------------------------------------------------AppBar
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          " Usando TextField.",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true, // centraliza o texto da AppBar
        leading: Icon(
          // coloca o ícone "chave" na AppBar
          Icons.build,
          color: Colors.yellow,
        ),

        shape: RoundedRectangleBorder(
            // arredonda a App bar
            borderRadius:
                BorderRadiusDirectional.vertical(bottom: Radius.circular(20))),
      ),
      //------------------------------------------------------------- Fim AppBar

      body: Center(
        // define o corpo da tela principal
        child: Column(
          // define uma coluna no centro da tela

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              // afasta a linha do TextField 16 pixels das margens esquerda e direita
              padding: const EdgeInsets.all(16.0),

              //---------------------------------------------- TextFieldParaNome
              child: TextField(
                //----------------------------------------------------Decoration
                // coloca uma decoração no campo de texto: retângulo para entrada de dados
                decoration: InputDecoration(
                  labelText: 'Nome', // nome do retângulo
                  //  tamanho da fonte  e cor para o texto da decoração
                  labelStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),

                  hintText: "Digite seu nome", // campo de dica
                  hintStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

                  prefixIcon: Icon(Icons.person), // icone da decoração
                  prefixText:
                      'Aluno: ', // texto do prefixo: aparece antes da entrada de dados
                  // estilo e tamanho da fonte de texto para a dica
                  prefixStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),

                  // texto do sufixo: aparece depois da entrada de dados
                  suffixText: 'DAM',
                  // estilo do SUfixo "DAM"
                  suffixStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),

                  border: OutlineInputBorder(
                    // arrendonda a borda da caixa de entrada
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                //------------------------------------------------ FimDecoration

                // você pode escolher vários tipos de teclado: numérico, email, data, telefone etc
                keyboardType: TextInputType.text,
                // estilo do texto a ser digitado
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              //------------------------------------------ Fim TextFieldParaNome
            ),

            // o Widget Padding afasta a linha do TextField 16 pixels das margens esquerda e direita
            Padding(
              padding: const EdgeInsets.all(16.0),

              //--------------------------------------------- TextFieldParaSenha
              child: TextField(
                //----------------------------------------------------Decoration
                // coloca uma decoração no campo de texto: retângulo para entrada de dados
                decoration: InputDecoration(
                  labelText: 'Senha', // nome do retângulo
                  //  tamanho da fonte  e cor para o texto da decoração
                  labelStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),

                  hintText: "Informe a Senha", // campo de dica
                  // estilo e tamanho da fonte de texto para a dica
                  hintStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

                  prefixIcon: Icon(Icons.lock), // icone da decoração
                  // texto do prefixo: aparece antes da entrada de dados
                  prefixText: 'Senha: ',
                  // estilo do prefixo "Aluno"
                  prefixStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),

                  // texto do sufixo: aparece depois da entrada de dados
                  suffixText: 'DAM',
                  // estilo do SUfixo "DAM"
                  suffixStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),

                  // arrendonda a borda da caixa de entrada
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                //--------------------------------------------------------------

                // você pode escolher vários tipos de teclado: numérico, email, data, telefone etc
                keyboardType: TextInputType.text,
                // estilo do texto a ser digitado
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),

                // esconde o texto ao digitar senha/muda o caracter que substitui o texto digitado
                obscureText: _isHidden,
                obscuringCharacter: '*',
              ),
              //----------------------------------------- Fim TextFieldParaSenha
            ),

            // botão para mostrar/esconder senha: altera o estado da propriedade obscureText
            TextButton(
              child: Text('Mostrar Senha'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                // setState chama o Build e recontroi a tela do app atualizando estatus
                setState(() {
                  _changePassVisibility();
                });
              },
            ),

            const SizedBox(
                // coloca um espaço vazio entre TextField e Text
                height: 60),

            // aplicativo original: contador de cliques continua funcionando
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              //style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
