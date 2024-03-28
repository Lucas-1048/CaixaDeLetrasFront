import 'package:caixa_de_letras/components/cdl_circle_avatar.dart';
import 'package:caixa_de_letras/components/cdl_date_form_field.dart';
import 'package:caixa_de_letras/components/cdl_drop_down_field.dart';
import 'package:caixa_de_letras/components/cdl_multi_select_drop_down.dart';
import 'package:caixa_de_letras/components/cdl_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController birthDateController = TextEditingController();

  final TextEditingController genderController = TextEditingController();

  final List<String> genderItens = [];
  late final List<Widget> listWidgets;

  final formKeySignUp = GlobalKey<FormState>();

  @override
  void initState() {
    _initializeWidgetList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            const Center(
              //TODO: Arquivo de strings
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Form(
        key: formKeySignUp,
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey.shade900,
                Colors.grey.shade800,
                Colors.grey.shade700,
              ],
            ),
          ),
          child: ListView.separated(
            itemBuilder: (context, index) => listWidgets[index],
            itemCount: listWidgets.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
          ),
        ),
      ),
    );
  }

  void _initializeWidgetList() {
    listWidgets = [
      const CDLCircleAvatar(),
      CDLTextFormField(
        labelText: 'Nome de usuário',
        controller: nameController,
        width: 320,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        validator: (passwordText) {
          if (passwordText == null || passwordText.isEmpty) {
            return 'Campo obrigatório'; // Ajustar traduções
          }

          return null;
        },
      ),
      CDLTextFormField(
        labelText: 'E-mail',
        controller: emailController,
        width: 320,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        validator: (passwordText) {
          if (passwordText == null || passwordText.isEmpty) {
            return 'Campo obrigatório'; // Ajustar traduções
          }

          return null;
        },
      ),
      CDLTextFormField(
        labelText: 'Senha',
        controller: passwordController,
        width: 320,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        validator: (passwordText) {
          if (passwordText == null || passwordText.isEmpty) {
            return 'Campo obrigatório'; // Ajustar traduções
          }

          return null;
        },
      ),
      CDLTextFormField(
        labelText: 'Confirmar senha',
        controller: confirmPasswordController,
        width: 320,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        validator: (passwordText) {
          if (passwordText == null || passwordText.isEmpty) {
            return 'Campo obrigatório'; // Ajustar traduções
          }

          return null;
        },
      ),
      CDLDateFormField(
        labelText: 'Data de nascimento',
        controller: birthDateController,
        width: 320,
        validator: (birthDate) {
          if (birthDate == null || birthDate.isEmpty) {
            return 'Campo obrigatório'; // Ajustar traduções
          }

          return null;
        },
      ),
      CDLDropDownField(
        items: const ['Masculino', 'Feminino'],
        labelText: 'Selecione seu genero favorito',
        controller: genderController,
      ),
      CDLMultiSelectDropDown(
        labelText: 'Selecione seus generos favoritos',
        itens: ['Terror', 'Suspense', 'Comédia'],
        selectedItems: genderItens,
        width: 320,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton(
              onPressed: () {
                if (formKeySignUp.currentState!.validate()) {}
              },
              child: const Text('Cadastrar')),
        ],
      )
    ];
  }
}
