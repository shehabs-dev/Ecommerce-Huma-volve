import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> signIn({
    required String username,
    required String password,
  });

  Future<Either<Failure, bool>> hasSession();

  Future<void> signOut();
}
