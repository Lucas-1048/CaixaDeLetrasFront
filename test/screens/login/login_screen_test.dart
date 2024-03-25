import 'package:bloc_test/bloc_test.dart';
import 'package:caixa_de_letras/bloc/screens/login/login_bloc.dart';
import 'package:caixa_de_letras/components/cdl_text_form_field.dart';
import 'package:caixa_de_letras/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mocks/screens/login/mock_login_bloc.dart';

void main() {
  group('Teste componentes visuais', () {
    late final MockLoginBloc mockLoginBloc;
    setUpAll(() {
      mockLoginBloc = MockLoginBloc();
    });
    testWidgets(
        'Teste se encontra os componentes de formulário para login e senha estão na tela',
        (tester) async {
      whenListen(
        mockLoginBloc,
        Stream.fromIterable([LoginInitial()]),
        initialState: LoginInitial(),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginBloc>(
            create: (context) => mockLoginBloc,
            child: const LoginScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final finderCDLTextForm = find.byType(CDLTextFormField);

      expect(finderCDLTextForm, findsExactly(3));

      final findEmail = find.text('E-mail');
      final findPassword = find.text('Senha');

      expect(findEmail, findsOne);
      expect(findPassword, findsOne);
    });

    testWidgets(
        'Teste se o componente de load aparece quando o está no estado de Loading',
        (tester) async {
      whenListen(
        mockLoginBloc,
        Stream.fromIterable([LoginLoading()]),
        initialState: LoginInitial(),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginBloc>(
            create: (context) => mockLoginBloc,
            child: const LoginScreen(),
          ),
        ),
      );

      await tester.pump();

      final finderCircularProgressIndicator =
          find.byType(CircularProgressIndicator);

      expect(finderCircularProgressIndicator, findsOne);
    });
  });
}
