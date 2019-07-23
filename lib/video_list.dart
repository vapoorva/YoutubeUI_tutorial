import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_ui/models/youtude_model.dart';
import 'package:youtube_ui/screens/video_details.dart';

class VideoList extends StatelessWidget {
  final List<YoutubeModel> listdata;

  const VideoList({this.listdata});

  @override
  Widget build(BuildContext context) {
    final Do = MediaQuery.of(context).orientation;
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (Do == Orientation.landscape)
          return InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => VideoDetail(details: listdata[index],)));
              },
              child: _buildLandscape(context, index));
        else
          return InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => VideoDetail(details: listdata[index],)));
              },
              child: _buildPotrait(context, index));
      },
      separatorBuilder: (context, index) => Divider(
            height: 1.0,
            color: Colors.lightGreen,
          ),
      itemCount: listdata.length,
    );
  }

  Widget _buildPotrait(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(listdata[index].thumbNail),
                  fit: BoxFit.cover)),
        ),
        ListTile(
          contentPadding: EdgeInsets.all(8.0),
          leading: CircleAvatar(
              backgroundImage: NetworkImage(listdata[index].channelAvatar)),
          title: Text(listdata[index].title),
          subtitle: Text(
              "${listdata[index].channelTitle} . ${listdata[index].viewCount} . ${listdata[index].publishedTime}"),
          trailing: Icon(Icons.more_vert),
        ),
      ],
    );
  }

  Widget _buildLandscape(BuildContext context, int index) {
    return Container(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 336 / 1.5,
              height: 124,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(listdata[index].thumbNail),
                      fit: BoxFit.cover)),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text(listdata[index].title),
                  subtitle: Text(
                      "${listdata[index].channelTitle} . ${listdata[index].viewCount} . ${listdata[index].publishedTime}"),
                  trailing: Icon(Icons.more_vert),
                ),
                Container(
                  padding: EdgeInsets.only(left: 8.0),
                  child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(listdata[index].channelAvatar)),
                ),
              ],
            )),
          ],
        ));
  }
}
