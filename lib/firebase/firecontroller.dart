class ClubEv {
  String ename;
  String cname;
  String date;
  String banner;
  String link;
  ClubEv({
    required this.ename,
    required this.cname,
    required this.date,
    required this.link,
    required this.banner,
  });
  Map<String, dynamic> toJson() => {
        'name': ename,
        'cname': cname,
        'Date': date,
        'link': link,
        'banner': banner
      };
  static ClubEv fromJson(Map<String, dynamic> json) => ClubEv(
      ename: json['name'],
      cname: json['cname'],
      date: json['Date'],
      banner: json['banner'],
      link: json['link']);
}
