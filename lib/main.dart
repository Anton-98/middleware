import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

void main() => runApp(App());

class App extends MaterialApp {
  @override
  Widget get home => const HomeScreen();
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liste des applications")),
      body: ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                title: const Text("Applications Installées"),
                subtitle: const Text(
                    "Acceder à la liste des applications installées"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InstalledAppsScreen(),
                  ),
                ),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                title: const Text("Information Aplications"),
                subtitle: const Text("Get app info with package name"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppInfoScreen(),
                  ),
                ),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                title: Text("Start App"),
                subtitle: Text(
                    "Start app with package name. Get callback of success or failure."),
                onTap: () => InstalledApps.startApp("com.google.android.gm"),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                title: Text("Go To App Settings Screen"),
                subtitle: Text(
                    "Directly navigate to app settings screen with package name"),
                onTap: () =>
                    InstalledApps.openSettings("com.google.android.gm"),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                title: Text("Check If System App"),
                subtitle: Text("Check if app is system app with package name"),
                onTap: () =>
                    InstalledApps.isSystemApp("com.google.android.gm").then(
                  (bool? value) => _showDialog(
                      context,
                      value ?? false
                          ? "The requested app is system app."
                          : "Requested app in not system app."),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(text),
          actions: <Widget>[
            TextButton(
              child: const Text("Fermer"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}

class InstalledAppsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Application Installées")),
      body: FutureBuilder<List<AppInfo>>(
        future: InstalledApps.getInstalledApps(true, true),
        builder:
            (BuildContext buildContext, AsyncSnapshot<List<AppInfo>> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        AppInfo app = snapshot.data![index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Image.memory(app.icon!),
                            ),
                            title: Text(app.name!),
                            subtitle: Text(app.packageName!),
                            onTap: () =>
                                InstalledApps.startApp(app.packageName!),
                            onLongPress: () =>
                                InstalledApps.openSettings(app.packageName!),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                          "Error occurred while getting installed apps ...."))
              : Center(child: Text("Getting installed apps ...."));
        },
      ),
    );
  }
}

class AppInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Information application")),
      body: FutureBuilder<AppInfo>(
        future: InstalledApps.getAppInfo("com.lita.securite.middleware"),
        builder: (BuildContext buildContext, AsyncSnapshot<AppInfo> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
                  ? Center(
                      child: Column(
                        children: [
                          Image.memory(snapshot.data!.icon!),
                          Text(
                            snapshot.data!.name!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          Text(snapshot.data!.getVersionInfo())
                        ],
                      ),
                    )
                  : Center(child: Text("Error while getting app info ...."))
              : Center(child: Text("Getting app info ...."));
        },
      ),
    );
  }
}
