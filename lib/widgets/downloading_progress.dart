
import 'package:animations/image_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifier.dart';

class DownloadingProgress extends StatelessWidget {
  const DownloadingProgress({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer<DownloadNotifier>(
        builder: (_, dCtr, __) {
          return InkWell(
            onTap: () async {
              if(dCtr.value == 1){
                print("Tapped");
                await dCtr.startDownload();
              }else{
                Navigator.push(context, MaterialPageRoute(
                  builder: (_)=> const ImagePage(),
                ),

                );
              }
            },
            child: Stack(
              children: [
                const Hero(
                  tag: 'masjid',
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/1.jpg"),
                    radius: 30,
                  ),
                ),
                Consumer<DownloadNotifier>(
                  builder: (_, dCtr, __) {
                    print(1 / dCtr.value);
                    return AnimatedOpacity(
                      duration: Duration( milliseconds: 1000),
                      opacity: dCtr.value == 1 ? dCtr.value : 1 / dCtr.value,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(Icons.download),
                      ),
                    );
                  },

                )
              ],
            ),
          );
        }
    );
  }
}
