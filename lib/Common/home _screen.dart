

import 'package:flutter/material.dart';

import '../VolumeControll/volume_controll.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 50),
          child: Column(

            children: [
              //Volume icon with blue cirular background
              Container(
                width: 100,
                height: 100,
                decoration:
                const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.volume_up,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Volume Booster',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              Container(
                height: 300,
                width: 350,
                //set grey background
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child:  Text(
                    'No ADs',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              //Text of privacy policy
              const SizedBox(height: 20),
              const Text(
                'By pressing “Continue” I confirm that i have read and accepted the Terms of Use and Privacy Policy',
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.diamond, color: Colors.yellow, size: 60,),
                            const SizedBox(height: 16.0),
                            const Text(
                              'Privacy Policy',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            const Text(
                              'We are sorry about it, we try our best to keep the amount of  ads  as  minimum  as possible but in order to keep our App free  we  will  have  to  keep  showing ads   if  don’t want  to  continue  seeing the  ads  you  can  remove  the ads  for a  very cheap  price,  this  helps  to maintain  the app  and keep it free for everyone, Thanks \n We are sorry about it, we try our best to keep the amount of  ads  as  minimum as possible but in order to keep our App free  we  will  have  to  keep  showing ads   if  don’t want  to  continue  seeing the  ads  you  can  remove  the ads  for a  very cheap  price,  this  helps  to maintain  the app  and keep it free for everyone, Thanks',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                              //button size
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(500, 40),
                              ),
                              //Navigate to VolumeControlScreen
                              onPressed: () {
                                //pop the dialog
                                Navigator.of(context).pop();

                              },
                              child: const Text('Agree'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Text('Privacy Policy'),
              ),
              const SizedBox(height: 30),
              //Elevated button of continue
              ElevatedButton(
                //button size
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 40),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VolumeControlScreen() ));
                },
                child: const Text('Continue'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


























