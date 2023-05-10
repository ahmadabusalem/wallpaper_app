import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:wallpaper_app1/favoritescreen.dart';
import 'package:wallpaper_app1/home_screen.dart';


class FullScreen extends StatefulWidget {

  final String imageurl;


  const FullScreen({super.key, required this.imageurl});@override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  Future<void> setwallpaper() async {
    int location = WallpaperManager.HOME_SCREEN;

    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    final bool  result =
    await WallpaperManager.setWallpaperFromFile(file.path, location);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Wallpaper App', style: TextStyle(fontSize: 20, color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Wallpaper())),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Image.network(widget.imageurl),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.black,
                child: Row(
                  children: [
                    IconButton(
                      color: Color.fromARGB(255, 62, 94, 70),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => FavoriteScreen()));
                      },
                      icon: Icon(Icons.add),
                    ),
                    SizedBox(width: 90,),
                    Center(

                      child: Text('Set Wallpaper',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
