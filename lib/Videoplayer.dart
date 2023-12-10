import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plvasu/Home.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';

class Youtube extends StatefulWidget {
  final String VideoUrl;
  final String VideoTitle;
  final String VideoSubtitle;

  const Youtube(
      {required this.VideoUrl,
      required this.VideoTitle,
      required this.VideoSubtitle});

  @override
  State<Youtube> createState() => _YoutubePlayerCustomSubtitleState();
}

class _YoutubePlayerCustomSubtitleState extends State<Youtube> {
  late YoutubePlayerController _controller;
  bool _playerVisible = true;

  // bool _bodycontent = true;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: widget.VideoUrl,
        flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
            forceHD: true,
            hideControls: false,
            disableDragSeek: false))
      ..addListener(_onPlayerStateChange);
  }

  void _onPlayerStateChange() {
    if (_controller.value.playerState == PlayerState.playing) {
      // Add your logic for subtitles here if needed
    }
    if (_controller.value.isFullScreen) {
      setState(() {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      });
      // Hide the app bar and status bar when in full-screen mode
    } else {
      // Show the app bar and status bar in normal mode
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      // SystemChrome.setPreferredOrientations([
      //   DeviceOrientation.portraitUp,
      // ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_playerVisible) {
          // Show the player again before popping the screen
          setState(() {
            _playerVisible = false;
            Navigator.pop(context);
          });
          if (_controller.value.isFullScreen) {
            // Show the app bar and status bar in normal mode
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
            ]);
          }
          return false; // Prevent the back button press from closing the screen
        }

        return true; // Allow the back button press to navigate back to the previous screen
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Visibility(
                visible: _playerVisible,
                child: Expanded(
                  child: YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.blue,
                    ),
                    builder: (context, player) {
                      // SystemChrome.setEnabledSystemUIMode(
                      //   SystemUiMode.manual,
                      //   overlays: [SystemUiOverlay.bottom],
                      // );

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: player,
                            ),
                          ),

                          Card(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/videoinfo.png",
                                  height: 60,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          widget.VideoTitle,
                                          style: GoogleFonts.robotoSerif(
                                            textStyle: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          overflow: TextOverflow.ellipsis, // Truncate text if it overflows
                                          maxLines: 2, // Adjust max number of lines as needed
                                        ),
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                            child: Text(
                              widget.VideoSubtitle,
                              style: GoogleFonts.robotoSlab(
                                textStyle: TextStyle(
                                  fontSize: 11,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                               // Truncate text if it overflows
                              // Adjust max number of lines as needed
                            ),
                          ),

                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
