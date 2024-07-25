import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student App',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentListPage()),
            );
          },
          child: Text('Student'),
        ),
      ),
    );
  }
}

class UserNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'User',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'List',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inbox),
          label: 'Inbox',
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => StudentMainPage()),
          );
        } else if (index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => StudentListPage()),
          );
        } else if (index == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => StudentInboxPage()),
          );
        }
      },
    );
  }
}

class StudentMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Main'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Information', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('lorem ipsum'),
            GestureDetector(
              onTap: () {
                // Handle download receipts action
              },
              child: Text('Download receipts', style: TextStyle(color: Colors.blue)),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[300],
                child: Center(
                  child: Text('Embed video on how to choose the best devices for your use case'),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ThankYouPage()),
                );
              },
              child: Text('Log out'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
      bottomNavigationBar: UserNavBar(),
    );
  }
}

class StudentListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Student List'),
            Spacer(), // Pushes the filter button to the right
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FilterPage()),
                    );
                  },
                ),
                Text('Filter'),
              ],
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.devices),
              title: Text('Device ${index + 1}', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Extra information about device ${index + 1}'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClaimPage()),
                  );
                },
                child: Text('Claim'),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: UserNavBar(),
    );
  }
}


class ClaimPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Claim Device'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What will you use the device for?', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              items: [
                DropdownMenuItem(child: Text('Gaming'), value: 'Gaming'),
                DropdownMenuItem(child: Text('Software Development'), value: 'Software Development'),
                DropdownMenuItem(child: Text('Reading/Writing'), value: 'Reading/Writing'),
              ],
              onChanged: (value) {},
              hint: Text('Select an option'),
            ),
            SizedBox(height: 16),
            ToggleButtons(
              children: [
                Padding(padding: EdgeInsets.all(8.0), child: Text('Shipping')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('Pick-up')),
              ],
              isSelected: [false, false],
              onPressed: (index) {},
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Additional Information',
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Discard'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Claim'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Options'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Operating System'),
            DropdownButton<String>(
              items: [
                DropdownMenuItem(child: Text('Mac OS'), value: 'Mac OS'),
                DropdownMenuItem(child: Text('Windows'), value: 'Windows'),
                DropdownMenuItem(child: Text('Linux'), value: 'Linux'),
              ],
              onChanged: (value) {},
              hint: Text('Select an OS'),
            ),
            SizedBox(height: 16),
            Text('Battery Life'),
            DropdownButton<String>(
              items: [
                DropdownMenuItem(child: Text('< 5 hours'), value: '< 5 hours'),
                DropdownMenuItem(child: Text('5 - 10 hours'), value: '5 - 10 hours'),
                DropdownMenuItem(child: Text('> 10 hours'), value: '> 10 hours'),
              ],
              onChanged: (value) {},
              hint: Text('Select battery life'),
            ),
            SizedBox(height: 16),
            Text('Storage Options'),
            DropdownButton<String>(
              items: [
                DropdownMenuItem(child: Text('< 256 GB'), value: '< 256 GB'),
                DropdownMenuItem(child: Text('256 - 512 GB'), value: '256 - 512 GB'),
                DropdownMenuItem(child: Text('> 512 GB'), value: '> 512 GB'),
              ],
              onChanged: (value) {},
              hint: Text('Select storage option'),
            ),
            SizedBox(height: 16),
            Text('Condition'),
            DropdownButton<String>(
              items: [
                DropdownMenuItem(child: Text('New'), value: 'New'),
                DropdownMenuItem(child: Text('Refurbished'), value: 'Refurbished'),
                DropdownMenuItem(child: Text('Used'), value: 'Used'),
              ],
              onChanged: (value) {},
              hint: Text('Select condition'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Apply filters
                      Navigator.pop(context);
                    },
                    child: Text('Apply'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StudentInboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Inbox'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(8.0),
              leading: Icon(Icons.image, size: 30),
              title: Text('Device ${index + 1}', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Offer by Person ${index + 1}'),
                  Text('Additional information about the offer'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => StudentListPage()),
                      );
                    },
                    child: Text('Decline'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                  SizedBox(width: 8), // Space between buttons
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => StudentListPage()),
                      );
                    },
                    child: Text('Accept'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: UserNavBar(),
    );
  }
}

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Thank you for trying our demo', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
