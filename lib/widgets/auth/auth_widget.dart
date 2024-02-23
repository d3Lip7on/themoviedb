import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_button_style.dart';
import 'package:themoviedb/widgets/auth/auth_model.dart';
import 'package:themoviedb/widgets/main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login to your account'),
      ),
      body: ListView(children: const [
        _HeaderWidget(),
      ]),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 25,
        ),
        const _FormWidget(),
        const SizedBox(
          height: 25,
        ),
        const Text(
          'Чтобы пользоваться правкой и возможностями рейтинга TMDB, а '
          'также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой. Нажмите здесь, чтобы начать.',
          style: textStyle,
        ),
        TextButton(
            onPressed: () {},
            style: AppButtonStyle.linkButton,
            child: const Text('Register')),
        const SizedBox(
          height: 25,
        ),
        const Text(
          'Если Вы зарегистрировались, но не получили письмо для '
          'подтверждения,нажмите здесь, чтобы отправить письмо повторно'
          '.',
          style: textStyle,
        ),
        TextButton(
            onPressed: () {},
            style: AppButtonStyle.linkButton,
            child: const Text('Verify email')),
        const SizedBox(
          height: 25,
        ),
      ]),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.get(context)?.model;

    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );
    const textFieldInputDecoration = InputDecoration(
        border: OutlineInputBorder(),
        isCollapsed: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ErrorMessageWidget(),
        const Text(
          'Username',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          decoration: textFieldInputDecoration,
          controller: model?.loginTextController,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Password', style: textStyle),
        const SizedBox(
          height: 5,
        ),
        TextField(
          decoration: textFieldInputDecoration,
          obscureText: true,
          controller: model?.passwordTextController,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const _AuthButton(),
            const SizedBox(
              width: 30,
            ),
            TextButton(
              onPressed: () {},
              style: AppButtonStyle.linkButton,
              child: const Text('Reset password'),
            ),
          ],
        )
      ],
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final errorMessage = AuthProvider.watch(context)?.model.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMessage,
        style: const TextStyle(color: Colors.red, fontSize: 17),
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  const _AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF01B4E4);
    final model = AuthProvider.watch(context)?.model;
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;

    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 15, vertical: 8))),
        child: const Text('Login'));
  }
}
