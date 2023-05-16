import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm/res/round_button.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_state.dart';
import 'package:mvvm/view_model/auth_view_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  ValueNotifier<bool> obSecuredPassword = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final authViewModel = ref.watch<LoginState>(authViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            focusNode: _emailFocusNode,
            decoration: const InputDecoration(
              hintText: 'Email',
              label: const Text('Email'),
              prefixIcon: const Icon(Icons.alternate_email),
            ),
            onFieldSubmitted: (value) {
              Utils.fieldFocusChange(
                  context, _emailFocusNode, _passwordFocusNode);
            },
          ),
          SizedBox(
            height: 10,
          ),
          ValueListenableBuilder(
              valueListenable: obSecuredPassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: obSecuredPassword.value,
                  focusNode: _passwordFocusNode,
                  obscuringCharacter: "*",
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    label: const Text('Password'),
                    prefixIcon: const Icon(Icons.lock_open_rounded),
                    suffixIcon: InkWell(
                        onTap: () {
                          obSecuredPassword.value = !obSecuredPassword.value;
                        },
                        child: Icon(obSecuredPassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined)),
                  ),
                  onFieldSubmitted: (value) {},
                );
              }),
          SizedBox(
            height: height * 0.085,
          ),
          RoundButton(
            title: "Login",
            loading: authViewModel is LoginLoadingState,
            onPress: () {
              Map requestData = {
                'email': _emailController.text.toString(),
                'password': _passwordController.text.toString(),
              };
              // call login api using provider notifier.
              ref
                  .read(authViewModelProvider.notifier)
                  .performLogin(requestData, context);
            },
          ),
          Text('Login API Response'),
          SizedBox(
            height: height * 0.085,
          ),
          getLoginResponseStatus(authViewModel),
        ],
      ),
    );
  }

  Widget getLoginResponseStatus(LoginState state) {
    if (state is LoginLoadingState) return Text('Loading...');
    if (state is LoginSuccessState) return Text('Success...');
    if (state is LoginErrorState) return Text('Error...');
    return Text("NA");
  }

  @override
  void dispose() {
    super.dispose();
    _emailFocusNode.dispose();
    _emailController.dispose();
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    obSecuredPassword.dispose();
  }
}
