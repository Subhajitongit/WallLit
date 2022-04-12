import 'package:wall_it/models/filter_model.dart';

String apiKEY = "563492ad6f917000010000017db8e0a0b8e6412c9be1f5ab094eb9a5";

List<FilterModel> getFilters() {
  List<FilterModel> filters = <FilterModel>[];
  FilterModel filtermodel;

  //
  filtermodel = FilterModel(name: '', imgUrl: '');
  filtermodel.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  filtermodel.name = "Street Art";
  filters.add(filtermodel);

  //
  filtermodel = FilterModel(imgUrl: '', name: '');
  filtermodel.imgUrl =
      "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  filtermodel.name = "Wild Life";
  filters.add(filtermodel);

  //
  filtermodel = FilterModel(imgUrl: '', name: '');
  filtermodel.imgUrl =
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  filtermodel.name = "Nature";
  filters.add(filtermodel);

  //
  filtermodel = FilterModel(imgUrl: '', name: '');
  filtermodel.imgUrl =
      "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  filtermodel.name = "City";
  filters.add(filtermodel);

  //
  filtermodel = FilterModel(imgUrl: '', name: '');
  filtermodel.imgUrl =
      "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  filtermodel.name = "Motivation";

  filters.add(filtermodel);

  //
  filtermodel = FilterModel(imgUrl: '', name: '');
  filtermodel.imgUrl =
      "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  filtermodel.name = "Bikes";
  filters.add(filtermodel);

  //
  filtermodel = FilterModel(imgUrl: '', name: '');
  filtermodel.imgUrl =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  filtermodel.name = "Cars";
  filters.add(filtermodel);

  //
  filtermodel = FilterModel(imgUrl: '', name: '');
  filtermodel.imgUrl =
      "https://images.pexels.com/photos/46798/the-ball-stadion-football-the-pitch-46798.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  filtermodel.name = "Sports";
  filters.add(filtermodel);

  return filters;
}
