
class Users {
  int id;
  String status;
  String staffCode;
  String prefixT;
  String nameT;
  String lastnameT;
  String division;
  String department;
  String company;
  String score56;
  String score55;
  String score54;

  Users(
      {this.id,
        this.status,
        this.staffCode,
        this.prefixT,
        this.nameT,
        this.lastnameT,
        this.division,
        this.department,
        this.company,
        this.score56,
        this.score55,
        this.score54});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    staffCode = json['staff_code'];
    prefixT = json['prefix_t'];
    nameT = json['name_t'];
    lastnameT = json['lastname_t'];
    division = json['division'];
    department = json['department'];
    company = json['company'];
    score56 = json['score_56'];
    score55 = json['score_55'];
    score54 = json['score_54'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['staff_code'] = this.staffCode;
    data['prefix_t'] = this.prefixT;
    data['name_t'] = this.nameT;
    data['lastname_t'] = this.lastnameT;
    data['division'] = this.division;
    data['department'] = this.department;
    data['company'] = this.company;
    data['score_56'] = this.score56;
    data['score_55'] = this.score55;
    data['score_54'] = this.score54;
    return data;
  }
}



