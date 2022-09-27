import 'package:flutter/material.dart';
import 'package:violin/app/core/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VColors.primary_color,
      drawer: Drawer(
        backgroundColor: VColors.primary_color,
        child: Column(children: []),
      ),
      appBar: AppBar(
        backgroundColor: VColors.primary_color,
        elevation: 0,
        actions: [CircleAvatar()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: VColors.primary_color,
        selectedItemColor: VColors.secondary_color,
        unselectedItemColor: VColors.white.withOpacity(0.5),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, User!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 1),
            Text(
              'Review or track albums you\'ve watched...',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Popular this month',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: albumList.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: Image.network(
                      albumList[index].path ??
                          "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANMAAADTCAMAAAAs2dbrAAAAMFBMVEXo6OiwsLDa2trMzMy+vr7l5eW7u7u0tLTFxcXh4eHe3t7T09PQ0NDCwsLJycm3t7cpaIThAAAB/ElEQVR4nO3a7W6DIBSAYUUR8aPe/92uFURqrU6zTI55n39bR+Kb0TN0zTIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4tiuOKazV1/ynkd+3OPqi95WnEhKPEqbU015yttPnUvK26svfMPY1KkjuteS4uoL3zA2qeNLaPpfv25SqomX3KBJDc8fG5p5ifymxg07Y8MS+U2ln+B9WCK/KfxZCkvEN2npTc1K4ZRkwhJRTc9jeqWXP9X7pjosEdSkx2nwEWXdSdd9X1iTrfJ8Pap+/Zb0vERMUxNuPD6332KJlKY2upfaiJLU1PqaeidKUNMjjLbVKK3elkho0i7EPWhYiXruS3+EFdOk/cDzt+TLKFc8iJp7jUsyYX+9R00jvpyXJN/UuYFnmvn7cdQ8DwWdI9bG9xwVPwFsM1FN/WLOuf1WWX/vVLmvlaSmevnKNDaml/Uw7k8rp6n7fCmKMq89505OlRbSZFYfq4aoyg0Pd9DoZTTFAy/mo8I7zU2LUkTT14ffY1S0Lad7QwFNG88juiL+D8b8FpPctGDN/ZrCnLxT03SXdasmf2i6V1NW3bBJxt9cmmi6wNnPEqTcpPcvf9WXU28aznzcaHrakird7xd82HqcnoS2Lo/pU/5gDgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPAnfgBmJgyK7mlJ7QAAAABJRU5ErkJggg==",
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Popular this month',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 16,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: albumList.length,
                  itemBuilder: (BuildContext context, int index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: Image.network(
                          albumList[index].path ??
                              "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANMAAADTCAMAAAAs2dbrAAAAMFBMVEXo6OiwsLDa2trMzMy+vr7l5eW7u7u0tLTFxcXh4eHe3t7T09PQ0NDCwsLJycm3t7cpaIThAAAB/ElEQVR4nO3a7W6DIBSAYUUR8aPe/92uFURqrU6zTI55n39bR+Kb0TN0zTIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4tiuOKazV1/ynkd+3OPqi95WnEhKPEqbU015yttPnUvK26svfMPY1KkjuteS4uoL3zA2qeNLaPpfv25SqomX3KBJDc8fG5p5ifymxg07Y8MS+U2ln+B9WCK/KfxZCkvEN2npTc1K4ZRkwhJRTc9jeqWXP9X7pjosEdSkx2nwEWXdSdd9X1iTrfJ8Pap+/Zb0vERMUxNuPD6332KJlKY2upfaiJLU1PqaeidKUNMjjLbVKK3elkho0i7EPWhYiXruS3+EFdOk/cDzt+TLKFc8iJp7jUsyYX+9R00jvpyXJN/UuYFnmvn7cdQ8DwWdI9bG9xwVPwFsM1FN/WLOuf1WWX/vVLmvlaSmevnKNDaml/Uw7k8rp6n7fCmKMq89505OlRbSZFYfq4aoyg0Pd9DoZTTFAy/mo8I7zU2LUkTT14ffY1S0Lad7QwFNG88juiL+D8b8FpPctGDN/ZrCnLxT03SXdasmf2i6V1NW3bBJxt9cmmi6wNnPEqTcpPcvf9WXU28aznzcaHrakird7xd82HqcnoS2Lo/pU/5gDgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPAnfgBmJgyK7mlJ7QAAAABJRU5ErkJggg==",
                          fit: BoxFit.contain,
                          height: 92,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        albumList[index].name!,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: VColors.secondary_color,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          CircleAvatar(),
                          const SizedBox(width: 4),
                          Text(
                            'Alejandro',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: VColors.secondary_color,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final albumList = [
  Album(
    path:
        'https://upload.wikimedia.org/wikipedia/pt/4/4f/Evermore_-_Taylor_Swift.png',
    name: 'evermore',
  ),
  Album(
    path:
        'https://www.tenhomaisdiscosqueamigos.com/wp-content/uploads/2021/10/saudade-vou-me-embora-de-mim-capa.jpg',
    name: 'vou me embora de mim',
  ),
  Album(
    path:
        'https://akamai.sscdn.co/uploadfile/letras/albuns/8/7/4/c/1191031636725437.jpg',
    name: 'formula of love',
  ),
];

class Album {
  final String? path;
  final String? name;
  final String? description;

  Album({this.path, this.name, this.description});
}
