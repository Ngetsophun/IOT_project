class DashBoard {
  late String name;
  late String icons;
  late String device;
  bool isActive = false;

  DashBoard(
      {required this.name,
      required this.icons,
      required this.device,
      required this.isActive});
}

List<DashBoard> dashboardDatalist = [
  DashBoard(
      name: 'Living Room',
      icons: 'assets/images/livingroom.png',
      device: '5',
      isActive: true),
  DashBoard(
      name: 'Meeting Room',
      icons: 'assets/images/meeting_room.png',
      device: '7',
      isActive: true),
  DashBoard(
      name: 'Bed Room',
      icons: 'assets/images/bedroom.png',
      device: '4',
      isActive: true),
];
