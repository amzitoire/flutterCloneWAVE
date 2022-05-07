import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';
import 'my_home_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey.shade100,
            pinned: true,
            floating: false,
            leading: IconButton(
              color: Colors.black,
              icon: const Icon(CupertinoIcons.back),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyHomePage(title: 'Flutter Clone Wave',);
                }));
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Paramétres',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ],
                  ),
                  margin: const EdgeInsets.only(right: 40),
                )),

          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                section('Approvisionner son compte', Container(
                  child: Column(
                      children:[
                        listElement(Icons.account_balance, "Lier votre banque","", () {print("tap banque"); }),
                      ]
                  ),
                )),
                section('Partager', Container(
                      child: Column(
                        children:[
                          listElement(CupertinoIcons.share, "Inviter un ami à rejoindre Wave","", () {print("tap share"); }),
                          listElement(CupertinoIcons.sparkles, "Utiliser le code promotionnel","", () {print("tap promotion"); }),
                        ]
                          ),
                    )),
                section('Assistance', Container(
                      child: Column(
                          children:[
                          listElement(Icons.call, "Appelez le service client gratuitement","", () {print("tap service"); }),
                          listElement(CupertinoIcons.location_solid, "Trouvez les agents à proximité","", () {print("tap agents"); }),
                          listElement(Icons.article, "Vérifiez votre plafond","", () {print("tap plafond"); }),
                          listElement(CupertinoIcons.shield_lefthalf_fill, "Modifiez votre code secret","", () {print("tap code secret"); }),
                            ]
                      ),
                    )),
                section('',  Container(
                  child: Column(
                      children:[
                        listElement(Icons.logout_sharp, "Se déconnecter","(769403975)", () {print("tap logout"); }),
                          ]
                  ),
                ))

              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox( height: 10, width: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/uba.png',height: 40,
                        width: 60,color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 10,width: 20,),
                      Image.asset('assets/images/ecobank.png',height: 40,
                        width: 60,color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                  const SizedBox( height: 10, width: 10,),
                  RichText(text: TextSpan(
                      text: "Conditions générales de waves",
                      style: GoogleFonts.inter(
                        color: Colors.grey.shade400,
                        fontSize: 14,))),
                  const SizedBox( height: 20, width: 10,),
                  RichText(text: TextSpan(
                text: "Version :22.4.20 (build 12345.543 AMADOU)",
                style: GoogleFonts.inter(
                  color: Colors.grey.shade400,
                  fontSize: 14,))),
                  const SizedBox( height: 20, width: 10,),
                ],
            ),
          )
        ],
      ),
    );
  }

  listElement(IconData icon, String text,String text2, VoidCallback onTap){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 30,
            ),
            const SizedBox(
                height: 10,
                width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                      text: text,
                      style: GoogleFonts.inter(
                        fontSize: 16, color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )

                ),
                if(text2.isNotEmpty) RichText(
                      text: TextSpan(
                        text: text2,
                        style: GoogleFonts.inter(
                          fontSize: 16, color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                      )

                  ),

              ],
            )

          ],
        ),

      ),
    );
  }
  section(String text,Container list){
   return Column(
     children:  [
       Row(
         children: [
           const SizedBox( height: 40, width: 10,),
           RichText(text: TextSpan(
             text: text,
             style: GoogleFonts.inter(
               color: Colors.grey.shade600,
               fontSize: 14,),
           ),
           ),
         ],
       ),
       Container(
         // color: Colors.white ,
         margin:  const EdgeInsets.only(right: 10,left: 10,bottom: 5 ),
         decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(10),
             boxShadow: [
               BoxShadow(
                 color: Colors.grey.shade800.withOpacity(0.3),
                 blurRadius: 5,
                 spreadRadius: 1,
                 offset: const Offset(0, 1),
               )
             ]),
         child : Column(
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 list,
               ],
             ),],),
       )
     ],
   );
  }
}