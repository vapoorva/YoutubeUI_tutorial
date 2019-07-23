import 'package:flutter/material.dart';
import 'package:youtube_ui/models/youtude_model.dart';
import 'package:youtube_ui/video_list.dart';

class VideoDetail extends StatefulWidget {
  final YoutubeModel details;

  const VideoDetail({Key key, this.details})      : super(key: key); //optional parameter
  @override
  _VideoDetailState createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _lay = [
      _videoinfo()
    ];
    return Scaffold(
      body: Column(
          children: <Widget>[
          _buildvc(context),
        Expanded(
          child: ListView(
            children: _lay
          )
        )
    ]
    ));


  }

  Widget _buildvc(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: MediaQuery.of(context).size.width,
      height: 350.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.details.thumbNail), fit: BoxFit.cover)),
    );
  }

  Widget _videoinfo() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(widget.details.title),
                subtitle: Text(widget.details.likeCount),
                trailing: Icon(Icons.more_vert),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildButtonColumn(Icons.thumb_up, widget.details.likeCount),
                  _buildButtonColumn(
                      Icons.thumb_down, widget.details.dislikeCount),
                  _buildButtonColumn(Icons.share, "Share"),
                  _buildButtonColumn(Icons.file_download, "Download"),
                  _buildButtonColumn(Icons.storage, "Save"),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }



  Widget _buildButtonColumn(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Icon(
            icon,
            color: Colors.grey[700],
          ),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _channelInfo() {
    //info of chnel
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.details.channelAvatar),
              ),
              title: Text(
                widget.details.channelTitle,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text("15,000 subscribers"),
            ),
          ),
          FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.play_circle_filled,
                color: Colors.red,
              ),
              label: Text(
                "SUBSCRIBE",
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
    );
  }

//  Widget _moreInfo() {
//    Row(
//      mainAxisAlignment: MainAxisAlignment.spaceAround,
//      children: <Widget>[
//        Expanded(child: Text("Up next")),
//        Text("Autoplay"),
//        Switch(
//          onChanged: (c) {},
//          value: true,
//        ),
//      ],
//    );
//  }
}
