class DecivceModel {
  String name = "";
  String color = "";
  bool isActive = false;
  String icon = "";

  DecivceModel(
      {required this.name,
      required this.color,
      required this.isActive,
      required this.icon});
}

List<DecivceModel> deviceModellist = [
  DecivceModel(
      name: 'Smart Spotlight', isActive: true, color: "#ff5f5f", icon: 'assets/images/light.png'),
];
