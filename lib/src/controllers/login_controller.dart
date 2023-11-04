import 'package:target_flutter/src/dtos/login_dto.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validatorless/validatorless.dart';

class LoginController {
  final LoginDTO _loginDTO = LoginDTO();

  void setLoginUser(String? value) => _loginDTO.user = value?.trim();
  void setLoginPass(String? value) => _loginDTO.password = value?.trim();

  Future<void> openUrl() async {
    final Uri url = Uri.parse('https://www.google.com.br');
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  String? Function(String?)? userValidator() {
    var validate = Validatorless.multiple([
      Validatorless.required('Campo requerido'),
      Validatorless.max(20, 'O campo não pode ter mais que 20 caracteres'),
    ]);

    return validate;
  }

  String? Function(String?)? passwordValidator() {
    var validate = Validatorless.multiple(
      [
        Validatorless.required('Campo requerido'),
        Validatorless.min(2, 'O campo não pode ter menos que 2 caracteres'),
        Validatorless.max(20, 'O campo não pode ter mais que 20 caracteres'),
        Validatorless.regex(RegExp(r'^[a-zA-Z0-9]+$'),
            'O campo não pode ter caracteres especiais')
      ],
    );

    return validate;
  }
}
