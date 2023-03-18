import 'package:dartz/dartz.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/errors/failures.dart';

import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() {

    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
}
