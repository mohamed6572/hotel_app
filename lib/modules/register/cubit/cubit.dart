import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/modules/register/cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates>{

  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);




}