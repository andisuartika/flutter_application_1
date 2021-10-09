import 'package:flutter/material.dart';
import 'package:flutter_application_1/Service/apiService.dart';
import 'package:flutter_application_1/UI/login/login_screen.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:iconsax/iconsax.dart';

class Body extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          ProfileMenu(
            icon: Icon(Iconsax.user),
            text: "Edit Profile",
            press: (){},
          ),
          ProfileMenu(
            icon: Icon(Icons.settings),
            text: "Settings",
            press: (){},
          ),
          ProfileMenu(
            icon: Icon(Icons.logout),
            text: "Log out",
            press: (){
                   showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Logout'),
                        content: Text('Are you sure you want to logout?'),
                        actions: <Widget>[
                          FlatButton(
                            color: Colors.blueAccent,
                            child: Text('Cancel', style: TextStyle(color: Colors.white),),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('Logout'),
                            onPressed: () { 
                              APIService.logut();
                              final snackBar = SnackBar(
                                  content: 
                                    Text(
                                      "Logout Success!",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                    backgroundColor: kSecondaryLightColor,
                                    duration: Duration(seconds: 4),
                                    shape: StadiumBorder(),
                                    behavior: SnackBarBehavior.floating,
                                  );        
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context){
                                    return LoginScreen();
                                  }
                                )
                              );
                            },
                          ),
                        ],
                      );
                    }
                  );
                }
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key, 
    required this.text, 
    required this.icon, 
    required this.press,
  }) : super(key: key);

  final String text;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            icon,
            SizedBox(width: 20,),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: kSecondaryColor,)
          ],
        ),
      ),
    );
  }
}