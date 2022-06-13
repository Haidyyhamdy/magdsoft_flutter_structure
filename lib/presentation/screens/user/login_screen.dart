import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/textFormField.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (BuildContext context, Object? state) {
        if (state is LoginSuccessState) {
          if (GlobalCubit.get(context).loginModel!.status == 200) {
            Fluttertoast.showToast(
              msg: 'Login Successfully',
              backgroundColor: Colors.green,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
            );
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile', (route) => false);
          }
        }
        if (state is LoginErrorState) {
          Fluttertoast.showToast(
            msg: "Login Fail",
            backgroundColor: Colors.red,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.blue,
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: AppColor.blue,
                        padding: const EdgeInsetsDirectional.only(top: 30),
                        child: const Image(
                            image: AssetImage(
                          'assets/images/appBarLogo.png',
                        )),
                      ),
                      Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 55, end: 25),
                          child: MaterialButton(
                            color: AppColor.white,
                            onPressed: () {},
                            child: const Text(
                              'عربي',
                              style: TextStyle(
                                color: AppColor.blue,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 2.08 / 3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(43.0),
                          topLeft: Radius.circular(43.0),
                        )),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 120, left: 40, right: 40),
                            child: Column(
                              children: [
                                defaultFormField(
                                  controller: emailController,
                                  type: TextInputType.emailAddress,
                                  hint: 'Email ',
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'email must not empty';
                                    }
                                  },
                                  prefixIcon: Icons.email,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                defaultFormField(
                                    controller: passwordController,
                                    type: TextInputType.visiblePassword,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'password must not empty';
                                      }
                                    },
                                    isPassword:
                                        GlobalCubit.get(context).isPassword,
                                    onSubmit: (value) {
                                      if (formKey.currentState!.validate()) {
                                        GlobalCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    },
                                    hint: 'Password ',
                                    suffixIcon: GlobalCubit.get(context).suffix,
                                    suffixPressed: () {
                                      GlobalCubit.get(context)
                                          .changePasswordVisibility();
                                    }),
                              ],
                            ),
                          ),
                         const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: defaultButton(
                                    width: 152,
                                    height: 61,
                                    background: AppColor.blue,
                                    text: 'login',
                                    function: () {
                                      if (formKey.currentState!.validate()) {
                                        GlobalCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    },
                                  ),
                                  flex: 2,
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                Expanded(
                                  child: defaultButton(
                                    width: 152,
                                    height: 61,
                                    background: AppColor.blue,
                                    text: 'register',
                                    function: () {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          '/register', (route) => false);
                                    },
                                  ),
                                  flex: 2,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
