import 'package:internative_task/core/network/services.dart';
import 'package:mobx/mobx.dart';
import '../../../main.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  var services = getIt.get<Services>();

  @observable
  bool isLoading = false;

  @observable
  bool passwordVisible = true;

  @observable
  String? token = '';

  @action
  Future<bool> login(String email, String password) async {
    try {
      var result = await services.login(email, password);
      token = result.data?.token;
      await services.setToken(token!);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @action
  emailValidation(String value) {
    String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value.toString())) {
      return 'Geçerli bir email adresi giriniz';
    } else
      return null;
  }

  @action
  passwordToggle() {
    passwordVisible = !passwordVisible;
  }
}
