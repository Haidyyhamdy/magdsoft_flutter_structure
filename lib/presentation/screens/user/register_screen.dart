
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/textFormField.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var fullNmeController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  var registerformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (BuildContext context, Object? state) {
        if (state is RegisterSuccessState) {
          Fluttertoast.showToast(
            msg: GlobalCubit.get(context).registerModel!.message.toString(),
            backgroundColor: Colors.green,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
          );
         Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }
        if (state is RegisterErrorState) {
          Fluttertoast.showToast(
            msg: GlobalCubit.get(context).registerModel!.message.toString(),
            backgroundColor: Colors.red,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
          );
        }
      },
      builder: (context, state) {
        double Height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        var cubit = GlobalCubit.get(context);
        return SafeArea(
            child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: AppColor.blue,
              child: Column(
                children: [
                  Center(
                    child: Image.asset('assets/images/appBarLogo.png'),
                  ),
                  Container(
                    width: double.infinity,
                    height: Height * 0.75,
                    decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(43),
                        topRight: Radius.circular(43),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: Height * 0.07,
                          start: width * 0.11,
                          end: width * 0.11),
                      child: Form(
                        key: registerformKey,
                        child: Column(
                          children: [
                            defaultFormField(
                              controller: fullNmeController,
                              hint: 'Full Name',
                              type: TextInputType.emailAddress,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Full Name  Must Not Empty';
                                }
                              },
                            ),
                            SizedBox(
                              height: Height * 0.015,
                            ),
                            defaultFormField(
                              controller: emailController,
                              hint: 'Email',
                              type: TextInputType.emailAddress,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Email Must Not Empty';
                                }
                              },
                            ),
                            SizedBox(
                              height: Height * 0.015,
                            ),
                            defaultFormField(
                              controller: phoneController,
                              hint: 'Phone',
                              type: TextInputType.phone,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Phone  Must Not Empty';
                                }
                              },
                            ),
                            SizedBox(
                              height: Height * 0.015,
                            ),
                            defaultFormField(
                              controller: passwordController,
                              hint: 'Password',
                              type: TextInputType.visiblePassword,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Password  Must Not Empty';
                                }
                              },
                              isPassword: cubit.isPassword,
                              suffixIcon: cubit.suffix,
                              suffixPressed: ()=> cubit.changePasswordVisibility(),
                            ),
                            SizedBox(
                              height: Height * 0.015,
                            ),
                            defaultFormField(
                              controller: confirmPasswordController,
                              hint: 'Confirm Password ',
                              type: TextInputType.visiblePassword,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Confirm Password  Must Not Empty';
                                }
                                if (passwordController.text !=
                                    confirmPasswordController.text) {
                                  return 'Password Dose not Matched';
                                }
                              },
                              isPassword: cubit.isConfirmNewPassword,
                              suffixIcon: cubit.confirmPasswordSuffix,
                              suffixPressed: ()=> cubit.changeConfirmNewPasswordVisibility(),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Expanded(
                                  child: defaultButton(
                                    function: () {
                                      if (registerformKey.currentState !=
                                              null &&
                                          registerformKey.currentState!
                                              .validate()) {
                                        cubit.userRegister(
                                          email: emailController.text,
                                          name: fullNmeController.text,
                                          password: passwordController.text,
                                          phone: phoneController.text,
                                          confirmPassword:
                                              confirmPasswordController.text,
                                        );
                                      }
                                    },
                                    text: 'Register',
                                    background: AppColor.blue,
                                    width: 152,
                                    height: 61,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                    child: defaultButton(
                                        width: 152,
                                        height: 61,
                                        background: AppColor.blue,
                                        function: () {
                                          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                                        },
                                        text: 'Login'))
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
