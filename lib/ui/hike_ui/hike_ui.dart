
import 'package:top_hikes_2020/model/Hike.dart';
import 'package:flutter/material.dart';


class HikeListViewDetails extends StatelessWidget {

  final String hikeName;
  final Hike hike;

  const HikeListViewDetails({Key key, this.hikeName, this.hike}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hikes "),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[
          HikeDetailsThumbnail(thumbnail: hike.poster),
          HikeDetailsHeaderWithPoster(hike: hike),
          HorizontalLine(),
          HorizontalLine(),
          HikeDetailsExtraPosters(posters: hike.images,)
        ],
      ),
      /*body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("Go back ${this.movie.director}"),
            onPressed: (){
            Navigator.pop(context);
            }),
          ),
      ),*/
    );
  }
}

class HikeDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const HikeDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 190,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(thumbnail),
                        fit: BoxFit.cover)
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors:[Color(0x00f5f5f5), Color(0xfff5f5f5)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)
            ),
            height: 80,
          )

        ]
    );
  }
}
class HikeDetailsHeaderWithPoster extends StatelessWidget{
  final Hike hike;

  const HikeDetailsHeaderWithPoster({Key key, this.hike}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          HikePoster(poster: hike.images[0].toString()),
          SizedBox(width:16,),
          Expanded(
              child: HikeDetailsHeader(hike: hike))

        ],
      ),
    );
  }
}



class HikePoster extends StatelessWidget{
  final String poster;

  const HikePoster({Key key, this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(poster),
                  fit: BoxFit.cover)
          ),
        ),
      ),
    );
  }
}

class HikeDetailsHeader extends StatelessWidget{
  final Hike hike;

  const HikeDetailsHeader({Key key, this.hike}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("${hike.year} - ${hike.terrain}".toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.purple
          ),),
        Text(hike.title, style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 32
        ),),
        Text.rich(TextSpan(style: TextStyle(
          fontSize: 13, fontWeight: FontWeight.w300,

        ), children: <TextSpan> [
          TextSpan(
              text: hike.description
          ),
          TextSpan(
              text: " More...",
              style: TextStyle(
                  color: Colors.purple
              )
          )
        ]))
      ],
    );
  }
}

class HikeDetailsCast extends StatelessWidget {
  final Hike hike;

  const HikeDetailsCast({Key key, this.hike}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          HikeField(field: "Cast", value: hike.parking),
          HikeField(field: "Directors", value: hike.trailhead),
          HikeField(field: "Awards", value: hike.trailend)
        ],
      ),
    );
  }
}

class HikeField extends StatelessWidget {
  final String field;
  final String value;

  const HikeField({Key key, this.field, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$field : ", style: TextStyle(
            color: Colors.black38,
            fontSize: 12, fontWeight: FontWeight.w300
        ),),
        Expanded(
          child: Text(value, style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300
          ),),
        )
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class HikeDetailsExtraPosters extends StatelessWidget {
  final List<String> posters;

  const HikeDetailsExtraPosters({Key key, this.posters}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text("More Hike Images".toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.black26,
            ),),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          height: 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8,),
            itemCount: posters.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(posters[index]),
                        fit: BoxFit.cover)
                ),
              ),
            ), ),
        )
      ],
    );
  }
}