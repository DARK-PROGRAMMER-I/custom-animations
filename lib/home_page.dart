import 'package:animations/image_page.dart';
import 'package:animations/notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<DownloadNotifier>(
        builder: (_, dCtr, __) {
          print(1 / dCtr.value);
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
                const Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: 'masjid',
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/1.jpg"),
                      radius: 30,
                    ),
                  ),
                ),
                Consumer<DownloadNotifier>(
                  builder: (_, dCtr, __) {
                    print(1 / dCtr.value);
                    return Align(
                      alignment: Alignment.center,
                      child: AnimatedOpacity(
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
                      ),
                    );
                  },

                )
              ],
            ),
          );
        }
        ),
      ),
      floatingActionButton: Consumer<DownloadNotifier>(
       builder: (_, dCtr, __) {
       return Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           FloatingActionButton(
             heroTag: "btn1",
            onPressed: ()async {
              await dCtr.resetValue();
            },
            child: const Icon(Icons.lock_reset_outlined),
            ),
           FloatingActionButton(
             heroTag: "btn2",
            onPressed: ()async {
              await dCtr.startDownload();
            },
            child: const Icon(Icons.download),
            ),
         ],
       );
       }
      ),
    );
  }

}
