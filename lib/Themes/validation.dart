class Vaildation {


  String? emailVaild(String? input) {
    RegExp emailRegex = RegExp(r'^[a-zA-Z0-9]*@+gmail|yaho.com');
    if ((emailRegex.hasMatch(input!)) && (input?.length ?? 0) > 12) {
      return null;
    }
    return "invaild Email";
  }

  String? passwordVaild(String? input) {
    RegExp pass = RegExp(r'^[a-zA-Z0-9]{8}$');
    if ((pass.hasMatch(input!))) {
      return null;
    }
    return "invaild PassWord";
  }

  String? phoneVaild(String? input) {
    RegExp phone = RegExp(r'^(012|010|011)[0-9]{8}$');
    if ((phone.hasMatch(input!))) {
      return null;
    }
    return "invaild";
  }
}


