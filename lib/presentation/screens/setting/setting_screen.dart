import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/business_logic/cubit/cubit.dart';
import 'package:shopping_app/business_logic/cubit/states.dart';
import 'package:shopping_app/components/constants.dart';
import 'package:shopping_app/presentation/widget/default_button.dart';
import 'package:shopping_app/presentation/widget/default_form_field.dart';

class SettingsScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = AppCubit.get(context).loginModel;
        nameController.text = model!.data!.name!;
        emailController.text = model.data!.email!;
        phoneController.text = model.data!.phone!;
        return ConditionalBuilder(
          condition: AppCubit.get(context).loginModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DefaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'name must not be empty';
                        }
                        return null;
                      },
                      prefix: Icons.person,
                      label: 'Name'),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'email must not be empty';
                        }
                        return null;
                      },
                      prefix: Icons.email,
                      label: 'Email Address'),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'phone must not be empty';
                        }
                        return null;
                      },
                      prefix: Icons.phone,
                      label: 'Phone Number'),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultButton(background: Colors.blue,width: double.infinity,


                    function: (){
                    signOut(context);
                  }, text: 'Logout',isUpperCase: true,
                  )
                ],
              ),
            ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
