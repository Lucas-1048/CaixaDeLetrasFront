import 'package:caixa_de_letras/bloc/screens/login/login_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}
