import 'package:campus_connect/helpers/readmore_helper.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  const new({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  var posts = [
    Post(
      id: 1,
      createdByName: "Informatic Engineering SA",
      createdByImage: "https://i.pravatar.cc/100?img=11",
      posts: ["https://i.pravatar.cc/500?img=21"],
      title:
          "Incididunt ut excepteur est Lorem velit consectetur pariatur sint.",
      description: "Ut consectetur sunt mollit sint adipisicing officia irure fugiat enim deserunt in. Voluptate in veniam magna commodo. Adipisicing eiusmod laboris laborum sit eiusmod velit. Nisi nulla nisi id est incididunt Lorem adipisicing cillum ad. Reprehenderit exercitation ut est ex ad Lorem eu non Lorem deserunt nostrud et voluptate. Aliquip voluptate consequat nostrud eu et deserunt aute adipisicing voluptate voluptate sunt culpa ea. Ut velit consectetur aliquip in dolore anim nulla adipisicing officia mollit consectetur.",
      totalLike: 50,
      totalComment: 20,
    ),
    Post(
      id: 2,
      createdByName: "Electric Engineering SA",
      createdByImage: "https://i.pravatar.cc/100?img=12",
      posts: ["https://i.pravatar.cc/500?img=22"],
      title: "Adipisicing incididunt nostrud non deserunt duis quis occaecat officia sint minim nisi mollit.",
      description: "Veniam occaecat exercitation consequat ut ipsum velit magna minim. Cupidatat do nisi ut do amet excepteur exercitation cupidatat laborum esse amet reprehenderit. Eu excepteur ut nulla commodo eiusmod in. Quis excepteur cillum non sit sit dolore occaecat elit veniam proident labore. Laborum esse consequat eiusmod consectetur. Elit eu pariatur sunt eu culpa ipsum sint amet ea adipisicing. Eiusmod non nulla Lorem mollit velit ut sunt incididunt est nostrud nulla ea consectetur dolore.",
      totalLike: 40,
      totalComment: 25,
    ),
    Post(
      id: 3,
      createdByName: "Univ Public Relation",
      createdByImage: "https://i.pravatar.cc/100?img=13",
      posts: ["https://i.pravatar.cc/500?img=23"],
      title: "Ad ullamco amet elit et laborum officia ut officia duis nostrud.",
      description: "Elit voluptate reprehenderit aliquip aliqua in. Nisi magna tempor velit est eu dolore magna. Tempor consequat Lorem minim irure qui eu elit fugiat in magna irure occaecat et. Aliquip do exercitation irure labore nostrud ex aliquip. Aliqua ea non ut exercitation ad fugiat eiusmod quis pariatur adipisicing esse veniam ex labore. Cupidatat aliquip aliqua aliqua occaecat ullamco culpa.",
      totalLike: 50,
      totalComment: 20,
    ),
    Post(
      id: 4,
      createdByName: "Student Bureau",
      createdByImage: "https://i.pravatar.cc/100?img=14",
      posts: ["https://i.pravatar.cc/500?img=24"],
      title: "Labore veniam Lorem duis est culpa aliqua Lorem ut consectetur ipsum.",
      description: "Esse excepteur eu eu commodo aute ut sit amet cillum aliqua culpa magna nisi. Quis ea enim aute irure dolor aliquip excepteur eu Lorem id commodo qui ex cupidatat. Officia non ex id tempor sit ut. Veniam mollit elit non est aliquip aute pariatur dolor labore do occaecat exercitation proident cupidatat. Officia aliquip minim ea dolore laboris dolor aute enim nostrud.",
      totalLike: 23,
      totalComment: 11,
    ),
    Post(
      id: 5,
      createdByName: "HMTIF",
      createdByImage: "https://i.pravatar.cc/100?img=15",
      posts: ["https://i.pravatar.cc/500?img=25"],
      title: "Esse aliquip nisi exercitation elit velit dolor aliqua consequat et.",
      description: "Aute occaecat cupidatat quis velit velit est sunt ex laborum eu consequat consequat officia. Nostrud magna ea amet ea et esse ea exercitation. Lorem commodo dolore duis elit duis aliquip ea mollit reprehenderit.",
      totalLike: 50,
      totalComment: 20,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => PostItemWidget(post: posts[index]),
    );
  }
}

class PostItemWidget extends StatefulWidget {
  final Post post;
  const new({super.key, required this.post});

  @override
  State<PostItemWidget> createState() => _PostItemWidgetState();
}

class _PostItemWidgetState extends State<PostItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    widget.post.createdByImage ?? "",
                    height: 25,
                    width: 25,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  widget.post.createdByName ?? "",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Spacer(),
                TextButton(onPressed: () => (), child: Text("Follow")),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Image.network(
                  widget.post.posts?.first ?? "",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.heart_broken_outlined),
                                  Text(widget.post.totalLike.toString()),
                                ],
                              ),
                            ),
                            SizedBox(width: 25),
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.comment),
                                  Text(widget.post.totalComment.toString()),
                                ],
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.bookmark),
                          ],
                        ),
                      ),
                      Text(
                        "${widget.post.createdByName} - ${widget.post.title}",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      ReadmoreHelper(widget.post.description ?? ""),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Post {
  late int id;
  String? createdByName;
  String? createdByImage;
  List<String>? posts;
  String? title;
  String? description;
  int? totalLike;
  int? totalComment;

  Post({
    required this.id,
    this.createdByName,
    this.createdByImage,
    this.posts,
    this.title,
    this.description,
    this.totalLike,
    this.totalComment,
  });
}
