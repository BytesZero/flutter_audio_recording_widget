import 'package:flutter/material.dart';

// 录音页面
class AudioRecordPage extends StatefulWidget {
  AudioRecordPage({Key key}) : super(key: key);

  @override
  _AudioRecordPageState createState() => _AudioRecordPageState();
}

class _AudioRecordPageState extends State<AudioRecordPage> {
  // 录制状态
  bool recording = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AudioRecordPage')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              recording = !recording;
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AudioRecordWidget(recording: recording),
              SizedBox(height: 10),
              Text(
                '00:06',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AudioRecordWidget extends StatelessWidget {
  const AudioRecordWidget({
    Key key,
    @required this.recording,
  }) : super(key: key);

  final bool recording;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0x999999).withOpacity(.3),
          width: 3,
        ),
        shape: BoxShape.circle,
      ),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.circle,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          child: Icon(
            recording ? Icons.pause_circle_filled : Icons.play_circle_filled,
            color: Colors.white,
            // 这里必须要添加 key
            key: ValueKey<bool>(recording),
            size: 40,
          ),
        ),
      ),
    );
  }
}
