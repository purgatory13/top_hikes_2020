class Hike {

  static List<Hike> getHikes() =>  [
    Hike("Camelback Mountain", "2020", "Moderate", "Feb. 13", "Desert, Mountain",
        "Description",
        "https://d2e111jq13me73.cloudfront.net/sites/default/files/styles/product_image_aspect_switcher_170w/public/product-images/csm-movie/1984-poster.jpg?itok=34kcFnr8",

        "parking", "trailhead", "trailend", "Out & Back", "notes", [
          "https://cdn.theatlantic.com/thumbor/PLSCxGQSGKov_ltuedlqFv4k05Y=/720x405/media/img/mt/2014/04/1984_movie-1/original.jpg",
          "https://imgix.bustle.com/uploads/image/2018/3/21/39229b65-3a17-441f-bdf1-54058d57bde6-1984_still.jpg?w=800&auto=format%2Ccompress&cs=srgb&q=70&fit=crop&crop=faces&dpr=2",
          "https://i.guim.co.uk/img/media/910745047fad990f222dadbb4ff836c5f77c49f3/134_0_2601_1560/master/2601.jpg?width=300&quality=45&auto=format&fit=max&dpr=2&s=6f1ddc657492ab44f21cd3b0836bc75c",
          "https://static.rogerebert.com/uploads/review/primary_image/reviews/1984-1984/EB19840101REVIEWS401010301AR.jpg",
          "https://res.cloudinary.com/jerrick/image/upload/fl_progressive,q_auto,w_1024/zyqgk0otoreo9ggkjkgt.jpg"
        ]),
    Hike("Devils Bridge", "2020", "Moderate", "Feb. 15", "Desert, Mountain",
        "Description",
        "https://static.displate.com/280x392/displate/2019-09-21/d693d60b770f92b87203085c6e89261b_a7fd3396239821352e56dbcd6e9594d1.jpg",

        "parking", "trailhead", "trailend", "Out & Back", "notes", [
          "https://media.timeout.com/images/101619403/630/472/image.jpg",
          "https://consequenceofsound.net/wp-content/uploads/2015/12/brazil.jpg?quality=80",
          "https://images2.minutemediacdn.com/image/upload/c_fill,g_auto,h_1248,w_2220/f_auto,q_auto,w_1100/v1555356020/shape/mentalfloss/brazil_primary.jpg",
          "https://i.ytimg.com/vi/tSY1VnNUJzQ/maxresdefault.jpg",
          "https://www.bfi.org.uk/sites/bfi.org.uk/files/styles/full/public/image/brazil-1985-004-jonathan-pryce-part-shadow-bfi-00m-zdo_0.jpg?itok=GGpYWnTq"
        ])
  ];

  String title;
  String year;
  String rated;
  String date;
  String terrain;
  String description;
  String poster;
  String parking;
  String trailhead;
  String trailend;
  String outback;
  String notes;
  List<String> images;

  Hike(
      this.title,
      this.year,
      this.rated,
      this.date,
      this.terrain,
      this.description,
      this.poster,
      this.parking,
      this.trailhead,
      this.trailend,
      this.outback,
      this.notes,
      this.images);

}