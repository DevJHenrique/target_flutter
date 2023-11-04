import 'package:flutter_test/flutter_test.dart';
import 'package:target_flutter/src/controllers/login_controller.dart';

void main() {
  final controller = LoginController();
  setUp(() {});
  group('User validator |', () {
    test('Should be return a MessageError of required field', () {
      var field = controller.userValidator();
      var user = '';
      var result = field!(user);

      expect(result, 'Campo requerido');
    });
    test('Should be return a MessageError of max characteres', () {
      var field = controller.userValidator();
      var user = '012345678901234567890';

      var result = field!(user);
      expect(result, 'O campo não pode ter mais que 20 caracteres');
    });
    test('Should be return null', () {
      var field = controller.userValidator();
      var user = 'Usuário';

      var result = field!(user);
      expect(result, null);
    });
  });
  group('Password validator |', () {
    test('Should be return a MessageError of required field', () {
      var field = controller.passwordValidator();
      var pass = '';
      var result = field!(pass);

      expect(result, 'Campo requerido');
    });
    test('Should be return a MessageError of min characteres', () {
      var field = controller.passwordValidator();
      var pass = '0';

      var result = field!(pass);
      expect(result, 'O campo não pode ter menos que 2 caracteres');
    });
    test('Should be return a MessageError of max characteres', () {
      var field = controller.passwordValidator();
      var pass = '012345678901234567890';

      var result = field!(pass);
      expect(result, 'O campo não pode ter mais que 20 caracteres');
    });
    test('Should be return a MessageError of invalid character', () {
      var field = controller.passwordValidator();
      var pass = 'password!';

      var result = field!(pass);
      expect(result, 'O campo não pode ter caracteres especiais');
    });
    test('Should be return null', () {
      var field = controller.passwordValidator();
      var pass = 'Password';

      var result = field!(pass);
      expect(result, null);
    });
  });
}
