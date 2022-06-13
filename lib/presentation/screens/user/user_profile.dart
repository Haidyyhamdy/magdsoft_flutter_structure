import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/button.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit,GlobalState>(
      listener: (context, state) {},
      builder:(context,state){
        var cubit = GlobalCubit.get(context);
         return  Scaffold(
           appBar: AppBar(
             backgroundColor: AppColor.blue,
             title: const Center(child: Text(
               'User Data',
             ),),
             systemOverlayStyle: const SystemUiOverlayStyle(
               statusBarColor: AppColor.blue,
               statusBarIconBrightness: Brightness.light,
             ),
           ),
           body: Padding(
             padding: const EdgeInsets.symmetric(vertical: 80,horizontal: 70),
             child: Center(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,

                 children: [
                   Text(
                     'Name : ${cubit.loginModel!.account![0].name}',
                     style:
                     const TextStyle(color: AppColor.blue, fontSize: 20),
                   ),
                 const  SizedBox(height: 10,),
                   Text(
                     'Email : ${cubit.loginModel!.account![0].email}',
                     style:
                     const TextStyle(color: AppColor.blue, fontSize: 20),
                   ),
                   const SizedBox(
                     height: 10,
                   ),
                   Text(
                     'Phone : ${cubit.loginModel!.account![0].phone}',
                     style:
                     const TextStyle(color: AppColor.blue, fontSize: 20),
                   ),
                  const Spacer(),
                   Center(
                     child: defaultButton(
                       width:152 ,
                       height: 61,
                       background: const Color.fromRGBO(173, 0, 47, 1),
                         function: (){
                           Navigator.pushNamedAndRemoveUntil(
                               context, '/', (route) => false);
                         },
                         text: 'Logout',
                     ),
                   )

                 ],
               ),
             ),
           ),

        );
      }
    );
  }
}
