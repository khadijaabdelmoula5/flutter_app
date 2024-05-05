import 'package:flutter/material.dart';
import 'package:projetflutter/AppState.dart';
import 'package:projetflutter/localization.dart';
import 'package:provider/provider.dart';

class HomeKhadija extends StatefulWidget {
  const HomeKhadija({Key? key}) : super(key: key);

  @override
  State<HomeKhadija> createState() => _HomeKhadijaState();
}

class _HomeKhadijaState extends State<HomeKhadija> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization(lang: appState.lang).translation("khadija-appbar"),),

        actions: [
          IconButton(
            icon: Icon(Icons.email),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(AppLocalization(lang: appState.lang).translation("contact"),),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Email : khadijaabdelmoula4@gmail.com"),
                        Text("Numero Telephonne : 54010757 "),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.add_location_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/map'); // Naviguer vers l'écran de la carte
            },
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Accueil',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.school)),
            label: 'Compétences',
          ),
          NavigationDestination(
            icon: Badge(
              //label: Text('2'),
              child: Icon(Icons.manage_accounts),
            ),
            label: 'Expériences',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.account_balance_wallet_rounded),
            ),
            label: 'Portfolio',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            if (currentPageIndex == 0)
              Column(
                children: [
                  Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(8.0),
                    color: Colors.white60,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage('images/khadija.png'),
                          ),
                          SizedBox(height: 80),
                          Text(AppLocalization(lang: appState.lang).translation("about-khadija"),

                            style: theme.textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Espacement entre la carte et l'image
                  Image.asset('images/portfolio/iit.png', width:180,height:100), // Remplacez 'votre_image.png' par le chemin de votre image



                ],

              ),

            if (currentPageIndex == 1)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/khadija.png'),
                    ),
                    SizedBox(height: 16),
                    Text(
                      AppLocalization(lang: appState.lang).translation("Comp"),
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    _buildSkillItem('Java', 0.8),
                    _buildSkillItem('Flutter', 0.7),
                    _buildSkillItem('Angular', 0.9),
                    _buildSkillItem('Asp.net', 0.8),
                    _buildSkillItem('Symfony', 0.7),
                    _buildSkillItem('SQL', 0.8),
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center, // Centrer le contenu
                      children: [
                        Text(
                          AppLocalization(lang: appState.lang).translation("certif"),
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center, // Centrer les éléments de la ligne
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildCertificationItem('CCNA'),
                                SizedBox(height: 8), // Ajouter un espace entre le texte et l'image
                                Image.asset('images/portfolio/ccna.jpg', width: 130, height: 130), // Ajouter CCNA certification image
                              ],
                            ),
                            SizedBox(width: 50), //
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildCertificationItem('Scrum'),
                                SizedBox(height: 8),
                                Image.asset('images/portfolio/certkh.png', width: 130, height: 130),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),


            if (currentPageIndex == 2)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 5), // Ajouter un espace
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/khadija.png'), // Remplacez par votre chemin d'image
                    ),
                    SizedBox(height: 16),
                    Text(
                      AppLocalization(lang: appState.lang).translation("exper"),
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildStageItem('primatec engineering', 'stage pfa', '2021','jira software'),
                          _buildStageItem('primatec engineering', 'stage pfe', '2022','unity 3d'),
                          _buildStageItem('systeo digital', 'stage été', '2023','symfony:app web'),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('images/primatec1.png', width: 120, height: 120),
                        Image.asset('images/systeo1.png', width: 120, height:120),
                      ],
                    ),
                  ],
                ),
              ),
            if (currentPageIndex == 3)
              Padding(
                padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                child: Column(

                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Card(
                                  child: Image.asset(
                                    'images/portfolio/angular.jpg',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Projet angular',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Card(
                                  child: Image.asset(
                                    'images/portfolio/laravel.jpg',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  ' Projet Laravel+vs',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Card(
                                  child: Image.asset(
                                    'images/portfolio/asp.jpg',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Projet ASP.NET ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Card(
                                  child: Image.asset(
                                    'images/portfolio/flutter.jpg',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Projet Flutter',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Card(
                                  child: Image.asset(
                                    'images/portfolio/symfony.png',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Projet Symfony',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Card(
                                  child: Image.asset(
                                    'images/portfolio/ia.jpg',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Projet IA',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillItem(String skillName, double skillLevel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              skillName,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 10,
              child: LinearProgressIndicator(
                value: skillLevel,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificationItem(String certificationName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green),
          SizedBox(width: 8),
          Text(
            certificationName,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildStageItem(String entreprise, String poste, String annee,String sujet) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          '$entreprise - $poste ($annee) - $sujet',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
