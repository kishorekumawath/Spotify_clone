
import 'package:dartz/dartz.dart';

import '../../../domain/respository/auth/auth.dart';
import '../../../service_locator.dart';
import '../../models/auth/create_user_req.dart';
import '../../models/auth/signin_user_req.dart';
import '../../source/auth/auth_firebase_service.dart';

class AuthRepositoryImpl extends AuthRepository {


  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }

}