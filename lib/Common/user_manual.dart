

import 'package:flutter/material.dart';


class UserManual extends StatelessWidget {
  const UserManual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white60,
        //center title
        centerTitle: true,
        title: const Text('Volume Booster', style: TextStyle(color: Colors.black),),
        // Add the menu icon to the AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.diamond_outlined, color: Colors.amber,), onPressed: () {  },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                elevation: 15,
                //4 points Text
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: const [

                      Text(
                        '1- Press “Start Boost” button to enable volume booster.',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '2- Use the slider to to set boost amount (30%- 40% Recommended)',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '3- Press “Stop Boost” button to disable volume booster.',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '4- If you are annoyed from the ads, you can Upgrade to ad free version from this button below “Remove Ads”',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Are you tired of these ADs? Upgrade!'),
                SizedBox(width: 6),
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
                                'Tired of Annoying Ads',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              const Text(
                                'We are sorry about it, we try our best to keep the amount of  ads  as  minimum as possible but in order to keep our App free for all we will have to keep showing ads  if  don’t  want  to  continue  seeing these ads  you  can  remove  the ads  fora  very cheap  price,  this  helps us  to maintain  the app  and keep it free for everyone, Thanks \nTEAM ASQUARE',
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
                                child: const Text('Remove ADs'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  style: ButtonStyle(
                    //rounded corners
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),

                    //border
                    side: MaterialStateProperty.all(
                      BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 1,
                      ),
                    ),
                  ),
                  child: const Text('Remove ADs'),
                ),


              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 350,
              width: 370,
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
          ],
        ),
      ),
    );
  }
}
