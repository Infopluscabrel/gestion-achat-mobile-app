

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/add_task.dart';
import 'package:myapp/screens/hom_screen.dart';
import 'package:myapp/screens/list_client.dart';
import 'package:myapp/screens/list_task.dart';
import 'package:myapp/screens/profile.dart';

import 'AddClientPage.dart';
import 'list_task_bloc.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

@override
  State<BottomBar> createState() => _BottomBarState() ;

  
}

class _BottomBarState extends State<BottomBar>{

  // initilisation des variables
  int _selectedIndex=0; 


//liste des menus de navigation
    static final List<Widget> _widgetOptions = <Widget> [
   //   const HomeScreen() , 
   const ListTaskBloc() , 
      const ListTask() ,
      
      const AddTask() ,
    //  const Profile() ,
      AddClientPage() ,
        ListClient() ,
    ] ;

void _onItemTapped(int index) {
  setState(() => {
       _selectedIndex = index 
  },) ;

  
}


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Center(child:Text("E-store")  ,) 
      ) ,
      body: Center(child: 
       _widgetOptions[_selectedIndex] ,
       ) ,
      
        bottomNavigationBar : BottomNavigationBar(

          currentIndex: _selectedIndex ,

          onTap: _onItemTapped ,

          elevation: 10 , 
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blueGrey , 
          unselectedItemColor: const Color(0xFF526480),
          type : BottomNavigationBarType.fixed, 
          items: const [
            BottomNavigationBarItem(icon: Icon( FluentSystemIcons.ic_fluent_home_regular )  ,
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled) ,
             label: "Home") ,
             BottomNavigationBarItem(icon: Icon( FluentSystemIcons.ic_fluent_search_regular )  ,
              activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled) ,
             label: "Search") ,
             BottomNavigationBarItem(icon: Icon( FluentSystemIcons.ic_fluent_ticket_regular )  ,
              activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled) ,
             label: "Tickets") ,
             BottomNavigationBarItem(icon: Icon( FluentSystemIcons.ic_fluent_person_regular )  ,
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled) ,
             label: "Profile") ,

             // loading data from bloc 
             BottomNavigationBarItem(icon: Icon( FluentSystemIcons.ic_fluent_ticket_regular )  ,
              activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled) ,
             label: "Tickets-stores") ,

        ])  ,
    )  ;
  }
} 