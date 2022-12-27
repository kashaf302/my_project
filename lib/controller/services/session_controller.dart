






class SessionController {

  static final SessionController _session = SessionController._internal() ;

  String? userId ;
  String? weight ;


  factory SessionController() {
    return _session ;
  }


  SessionController._internal(){

  }
}