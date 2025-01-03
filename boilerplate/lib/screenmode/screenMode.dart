import 'package:boilerplate/screenmode/lightmode.dart';
import 'package:boilerplate/screenmode/themprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Screenmode extends StatelessWidget {
  const Screenmode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.surfaceColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'S E T T I N G',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Badge.count(
                count: 10,
                child: Icon(Icons.notifications),
              )),
          IconButton(
              onPressed: () {},
              icon: Badge(
                label: Text('offline'),
                backgroundColor: Colors.orangeAccent,
                textColor: Colors.black,
                child: Icon(Icons.wifi),
              )),
          IconButton(
              onPressed: () {},
              icon: Badge.count(
                count: 100,
                child: Icon(Icons.notifications),
              )),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Text('Dark Mode'),
            const SizedBox(
              width: 5,
            ),
            CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context, listen: false)
                    .isDarkMode,
                onChanged: (value) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                }),
            ElevatedButton(
                onPressed: () {
                  showLicensePage(context: context);
                },
                child: Text('Show licence page'))
          ],
        ),
      ),
    );
  }
}
