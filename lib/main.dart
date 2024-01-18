import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const APMCApp());
}

class APMCApp extends StatelessWidget {
  const APMCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APMC System',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/liveMarket': (context) => LiveMarketPage(),
        '/aboutAPMC': (context) => AboutAPMCPage(),
        '/weather': (context) => WeatherPage(),
        '/latestNews': (context) => LatestNewsPage(),
        '/trader': (context) => TraderPage(),
        '/farmer': (context) => FarmerPage(),
        '/contactUs': (context) => ContactUsPage(),
        '/trader/bidding': (context) => BiddingPage(),
        '/trader/winners': (context) => WinnersPage(),
        '/trader/bidHistory': (context) => BidHistoryPage(),
        '/trader/billGenerate': (context) => BillGeneratePage(),
        '/trader/gateEntry': (context) => GateEntryPage(),
        '/farmer/lot': (context) => LotPage(),
        '/farmer/lotStatus': (context) => LotStatusPage(),
        '/farmer/lotHistory': (context) => LotHistoryPage(),
        '/farmer/bills': (context) => BillsPage(),
        '/farmer/gateEntry': (context) => FarmerGateEntryPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APMC System'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          padding: const EdgeInsets.all(16.0),
          children: [
            buildButton(context, "Live Market", '/liveMarket'),
            buildButton(context, "About APMC", '/aboutAPMC'),
            buildButton(context, "Weather", '/weather'),
            buildButton(context, "Latest News", '/latestNews'),
            buildButton(context, "Trader", '/trader'),
            buildButton(context, "Farmer", '/farmer'),
            buildButton(context, "Contact Us", '/contactUs'),
          ],
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, String text, String route) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.all(16.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.green, Colors.lightGreen],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 23.0),
          ),
        ),
      ),
    );
  }
}

class TraderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trader'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          padding: const EdgeInsets.all(16.0),
          children: [
            buildSquareButton(context, "Bidding", '/trader/bidding'),
            buildSquareButton(context, "Winners", '/trader/winners'),
            buildSquareButton(context, "Bid History", '/trader/bidHistory'),
            buildSquareButton(context, "Bill Generate", '/trader/billGenerate'),
            buildSquareButton(context, "Gate Entry", '/trader/gateEntry'),
            buildSquareButton(context, "Logout", '/logout'),
          ],
        ),
      ),
    );
  }

  Widget buildSquareButton(BuildContext context, String text, String route) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        fixedSize: const Size(100.0, 100.0), // Set fixed dimensions
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(16.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.green, Colors.lightGreen],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 23.0),
          ),
        ),
      ),
    );
  }
}

class LiveMarketPage extends StatelessWidget {
  final String currentDate = 'January 6, 2024'; // Replace with actual date
  final List<Map<String, String>> marketData = [
    {
      'product': 'Apples',
      'unit': 'Kg',
      'avgPrice': '2.50',
      'requirements': '1000'
    },
    {
      'product': 'Apples',
      'unit': 'Kg',
      'avgPrice': '2.50',
      'requirements': '1000'
    },
    {
      'product': 'Bananas',
      'unit': 'Bunch',
      'avgPrice': '1.50',
      'requirements': '800'
    },
    {
      'product': 'Tomatoes',
      'unit': 'Kg',
      'avgPrice': '3.00',
      'requirements': '1200'
    },

    // Add more market data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Market'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date: $currentDate',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              _buildMarketTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMarketTable() {
    return DataTable(
      columns: [
        const DataColumn(label: Text('Product')),
        const DataColumn(label: Text('Unit')),
        const DataColumn(label: Text('Avg Price')),
        const DataColumn(label: Text('Requirements')),
      ],
      rows: marketData.map<DataRow>((data) {
        return DataRow(
          cells: [
            DataCell(Text(data['product'] ?? '')),
            DataCell(Text(data['unit'] ?? '')),
            DataCell(Text(data['avgPrice'] ?? '')),
            DataCell(Text(data['requirements'] ?? '')),
          ],
        );
      }).toList(),
    );
  }
}

class AboutAPMCPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About APMC'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the Agriculture Produce Marketing Committee (APMC) System!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'The APMC plays a crucial role in the marketing of agricultural produce, ensuring fair practices, and providing a platform for farmers and traders to engage in trade.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Our mission is to facilitate a transparent and efficient marketplace for agricultural commodities. The APMC System connects farmers with buyers, promotes fair pricing, and contributes to the overall development of the agricultural sector.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Through this platform, farmers can access real-time market information, connect with traders, and make informed decisions about selling their produce. Traders, on the other hand, can explore a diverse range of agricultural products and participate in fair trade practices.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Thank you for being a part of the APMC System. We are committed to supporting the agricultural community and fostering a sustainable and prosperous future for farmers and traders alike.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final String apiKey =
      'YOUR_OPENWEATHERMAP_API_KEY'; // Replace with your API key
  String location = '';
  double latitude = 0.0;
  double longitude = 0.0;
  Map<String, dynamic>? weatherData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
        location =
            '(${latitude.toStringAsFixed(2)}, ${longitude.toStringAsFixed(2)})';
      });
      _getWeatherData();
    } catch (e) {
      print('Error getting location: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _getWeatherData() async {
    try {
      final response = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'
              as Uri);
      if (response.statusCode == 200) {
        setState(() {
          weatherData = Map<String, dynamic>.from(response.body as Map);
        });
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error getting weather data: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : weatherData != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location: $location',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Temperature: ${weatherData!['main']['temp']}°C',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Description: ${weatherData!['weather'][0]['description']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Humidity: ${weatherData!['main']['humidity']}%',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Wind Speed: ${weatherData!['wind']['speed']} m/s',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      _buildWeatherIcon(weatherData!['weather'][0]['icon']),
                    ],
                  )
                : const Center(
                    child: Text('Failed to fetch weather data.'),
                  ),
      ),
    );
  }

  Widget _buildWeatherIcon(String iconCode) {
    return Image.network(
      'https://openweathermap.org/img/wn/$iconCode.png',
      width: 100,
      height: 100,
    );
  }
}

class LatestNewsPage extends StatelessWidget {
  final List<Map<String, String>> newsList = [
    {
      'title':
          'Minister warns mills against cheating farmers while weighing sugarcane',
      'description':
          'Growers should get their sugarcane weighed at APMC for free and get a receipt. That load should again be weighed at the sugar mills. If there is any discrepancy in the weight of the produce, they should give a written complaint against the mills. We will examine it and cancel the licence of mills if the latter are found guilty. The problem is that farmers often don’t come forward to give complaints,” Mr. Patil told media representatives in Kalaburagi on Wednesday',
    },
    {
      'title':
          'Minister warns mills against cheating farmers while weighing sugarcane',
      'description':
          'Growers should get their sugarcane weighed at APMC for free and get a receipt. That load should again be weighed at the sugar mills. If there is any discrepancy in the weight of the produce, they should give a written complaint against the mills. We will examine it and cancel the licence of mills if the latter are found guilty. The problem is that farmers often don’t come forward to give complaints,” Mr. Patil told media representatives in Kalaburagi on Wednesday',
    },
    {
      'title':
          'Minister warns mills against cheating farmers while weighing sugarcane',
      'description':
          'Growers should get their sugarcane weighed at APMC for free and get a receipt. That load should again be weighed at the sugar mills. If there is any discrepancy in the weight of the produce, they should give a written complaint against the mills. We will examine it and cancel the licence of mills if the latter are found guilty. The problem is that farmers often don’t come forward to give complaints,” Mr. Patil told media representatives in Kalaburagi on Wednesday',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest News'),
      ),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return _buildNewsCard(newsList[index]);
        },
      ),
    );
  }

  Widget _buildNewsCard(Map<String, String> news) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news['title']!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              news['description']!,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class FarmerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 211, 169, 44),
              Color.fromARGB(255, 229, 232, 140)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          padding: const EdgeInsets.all(16.0),
          children: [
            buildSquareButton(context, "Lot", '/farmer/lot'),
            buildSquareButton(context, "Lot Status", '/farmer/lotStatus'),
            buildSquareButton(context, "Lot History", '/farmer/lotHistory'),
            buildSquareButton(context, "Bills", '/farmer/bills'),
            buildSquareButton(context, "Gate Entry", '/farmer/gateEntry'),
            buildSquareButton(context, "Logout", '/farmer/gateEntry'),
          ],
        ),
      ),
    );
  }

  Widget buildSquareButton(BuildContext context, String text, String route) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.all(16.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.green, Colors.lightGreen],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 23.0),
          ),
        ),
      ),
    );
  }

  Widget buildCircleButton(BuildContext context, String text, String route) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      backgroundColor: Colors.green,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 250, 250, 250),
              Color.fromARGB(255, 255, 255, 255)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Contact Information'),
              _buildContactInfo('Email', 'contact@example.com'),
              _buildContactInfo('Phone', '+1 (555) 123-4567'),
              const SizedBox(height: 16.0),
              _buildSectionTitle('Address'),
              _buildContactInfo('Street', '123 Main Street'),
              _buildContactInfo('City, State', 'Cityville, State, 12345'),
              const SizedBox(height: 16.0),
              _buildSectionTitle('Business Hours'),
              _buildContactInfo('Monday - Friday', '9:00 AM - 5:00 PM'),
              _buildContactInfo('Saturday', '10:00 AM - 2:00 PM'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  Widget _buildContactInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class BiddingPage extends StatefulWidget {
  @override
  _BiddingPageState createState() => _BiddingPageState();
}

class _BiddingPageState extends State<BiddingPage> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController lotCodeController = TextEditingController();
  final TextEditingController traderNameController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  final TextEditingController bidPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bidding'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField("Product Name", productNameController),
            _buildTextField("Lot Code", lotCodeController),
            _buildTextField("Trader Name", traderNameController),
            _buildDateField(
                "Start Date", startDate, () => _selectStartDate(context)),
            _buildDateField("End Date", endDate, () => _selectEndDate(context)),
            _buildTextField("Bid Price", bidPriceController),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _submitBid(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text('Submit Bid'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDateField(String label, DateTime? date, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                date != null
                    ? "${date.toLocal()}".split(' ')[0]
                    : "Select Date",
              ),
              Icon(Icons.calendar_today),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != endDate) {
      setState(() {
        endDate = picked;
      });
    }
  }

  void _submitBid(BuildContext context) {
    String productName = productNameController.text;
    String lotCode = lotCodeController.text;
    String traderName = traderNameController.text;
    String startDateString =
        startDate != null ? startDate!.toLocal().toString() : "";
    String endDateString = endDate != null ? endDate!.toLocal().toString() : "";
    double bidPrice = double.tryParse(bidPriceController.text) ?? 0.0;

    // Handle the submitted bid data as needed, e.g., send it to a server
    print('Submitted Bid:');
    print('Product Name: $productName');
    print('Lot Code: $lotCode');
    print('Trader Name: $traderName');
    print('Start Date: $startDateString');
    print('End Date: $endDateString');
    print('Bid Price: $bidPrice');

    // Show a dialog box
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bid Submitted Successfully'),
          content: Text('Thank you for submitting your bid.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class WinnersPage extends StatefulWidget {
  @override
  _WinnersPageState createState() => _WinnersPageState();
}

class _WinnersPageState extends State<WinnersPage> {
  DateTime? selectedDate;
  List<Map<String, dynamic>> winnersData = [
    {
      'traderId': 1,
      'traderName': 'John Doe',
      'lotCode': 'LC123',
      'bidPrice': 500.0,
      'date': DateTime(2024, 1, 10)
    },
    {
      'traderId': 2,
      'traderName': 'Jane Smith',
      'lotCode': 'LC456',
      'bidPrice': 700.0,
      'date': DateTime(2024, 1, 10)
    },
    {
      'traderId': 3,
      'traderName': 'Bob Johnson',
      'lotCode': 'LC789',
      'bidPrice': 600.0,
      'date': DateTime(2024, 1, 12)
    },
    {
      'traderId': 3,
      'traderName': 'Bob Johnson',
      'lotCode': 'LC789',
      'bidPrice': 600.0,
      'date': DateTime(2024, 1, 12)
    },
    // Add more sample data as needed
  ];

  List<Map<String, dynamic>> filteredWinners = [];

  @override
  void initState() {
    super.initState();
    filteredWinners = List.from(winnersData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Winners'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateField(
                "Select Date", selectedDate, () => _selectDate(context)),
            SizedBox(height: 16.0),
            _buildWinnersTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField(String label, DateTime? date, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                date != null
                    ? "${date.toLocal()}".split(' ')[0]
                    : "Select Date",
              ),
              Icon(Icons.calendar_today),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _filterWinnersByDate();
      });
    }
  }

  void _filterWinnersByDate() {
    if (selectedDate != null) {
      filteredWinners = winnersData
          .where((winner) =>
              winner['date'].year == selectedDate!.year &&
              winner['date'].month == selectedDate!.month &&
              winner['date'].day == selectedDate!.day)
          .toList();
    } else {
      filteredWinners = List.from(winnersData);
    }
  }

  Widget _buildWinnersTable() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Trader ID')),
        DataColumn(label: Text('Trader Name')),
        DataColumn(label: Text('Lot Code')),
        DataColumn(label: Text('Bid Price')),
        DataColumn(label: Text('Date')),
      ],
      rows: filteredWinners.map<DataRow>((data) {
        return DataRow(
          cells: [
            DataCell(Text(data['traderId'].toString())),
            DataCell(Text(data['traderName'].toString())),
            DataCell(Text(data['lotCode'].toString())),
            DataCell(Text(data['bidPrice'].toString())),
            DataCell(Text(data['date'].toString().split(' ')[0])),
          ],
        );
      }).toList(),
    );
  }
}

class BidHistoryPage extends StatefulWidget {
  @override
  _BidHistoryPageState createState() => _BidHistoryPageState();
}

class _BidHistoryPageState extends State<BidHistoryPage> {
  DateTime? fromDate;
  DateTime? toDate;
  List<Map<String, dynamic>> bidHistoryData = [
    {
      'productName': 'Apples',
      'lotCode': 'LC123',
      'price': 500.0,
      'date': DateTime(2024, 1, 10)
    },
    {
      'productName': 'Bananas',
      'lotCode': 'LC456',
      'price': 700.0,
      'date': DateTime(2024, 1, 12)
    },
    {
      'productName': 'Tomatoes',
      'lotCode': 'LC789',
      'price': 600.0,
      'date': DateTime(2024, 1, 15)
    },
    // Add more sample data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bid History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateRangeSelector("From Date", fromDate,
                (date) => setState(() => fromDate = date)),
            _buildDateRangeSelector(
                "To Date", toDate, (date) => setState(() => toDate = date)),
            SizedBox(height: 16.0),
            _buildBidHistoryList(),
          ],
        ),
      ),
    );
  }

  Widget _buildDateRangeSelector(
      String label, DateTime? date, Function(DateTime) onDateChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: date ?? DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2101),
          );
          if (picked != null && picked != date) {
            onDateChanged(picked);
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                date != null
                    ? "${date.toLocal()}".split(' ')[0]
                    : "Select Date",
              ),
              Icon(Icons.calendar_today),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBidHistoryList() {
    final filteredBids = bidHistoryData.where((bid) {
      if (fromDate != null && bid['date'].isBefore(fromDate!)) {
        return false;
      }
      if (toDate != null && bid['date'].isAfter(toDate!)) {
        return false;
      }
      return true;
    }).toList();

    return Expanded(
      child: ListView.builder(
        itemCount: filteredBids.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                '${filteredBids[index]['productName']} - ${filteredBids[index]['lotCode']}'),
            subtitle: Text(
                'Price: ${filteredBids[index]['price']} | Date: ${filteredBids[index]['date']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BidPage(bidDetails: filteredBids[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BidPage extends StatelessWidget {
  final Map<String, dynamic> bidDetails;

  BidPage({required this.bidDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bid Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product Name: ${bidDetails['productName']}'),
            Text('Lot Code: ${bidDetails['lotCode']}'),
            Text('Price: ${bidDetails['price']}'),
            Text('Date: ${bidDetails['date']}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}

class BillGeneratePage extends StatefulWidget {
  @override
  _BillGeneratePageState createState() => _BillGeneratePageState();
}

class _BillGeneratePageState extends State<BillGeneratePage> {
  final TextEditingController farmerNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController traderNameController = TextEditingController();
  final TextEditingController billController = TextEditingController();
  final TextEditingController cashController = TextEditingController();
  final TextEditingController expensesController = TextEditingController();

  final TextEditingController farmerSignatureController =
      TextEditingController();
  final TextEditingController traderSignatureController =
      TextEditingController();

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _generateBill() {
    // Logic to generate the bill
    _showDialog('Bill generated successfully!');
  }

  void _saveBill() {
    // Logic to save the bill
    _showDialog('Bill saved successfully!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Generation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputRow(
              'Farmer Name',
              farmerNameController,
              'Date',
              dateController,
              'Place',
              placeController,
            ),
            SizedBox(height: 16.0),
            _buildInputRow(
              'Trader Name',
              traderNameController,
              'Bill',
              billController,
            ),
            SizedBox(height: 16.0),
            _buildProductList(),
            SizedBox(height: 16.0),
            _buildExpensesSection(),
            SizedBox(height: 16.0),
            _buildTotalSection(),
            SizedBox(height: 16.0),
            _buildSignatureBoxes(),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _generateBill,
                  child: Text('Generate Bill'),
                ),
                ElevatedButton(
                  onPressed: _saveBill,
                  child: Text('Save Bill'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputRow(
    String label1,
    TextEditingController controller1,
    String label2,
    TextEditingController controller2, [
    String? label3,
    TextEditingController? controller3,
  ]) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label1),
              TextField(
                controller: controller1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label2),
              TextField(
                controller: controller2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        if (label3 != null && controller3 != null)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label3),
                TextField(
                  controller: controller3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildProductList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product List:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Table(
          columnWidths: {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
          },
          border: TableBorder.all(),
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Product'),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Quantity'),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Rate'),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Apples'),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('10'),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('5.0'),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Bananas'),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('8'),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('3.0'),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Tomatoes'),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('12'),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('2.5'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExpensesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Expenses'),
        TextField(
          controller: expensesController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalSection() {
    double total = 115.0; // Replace with the actual calculated total

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.0),
        Text(
          'Total: $total',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSignatureBoxes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSignatureBox('Farmer Signature', farmerSignatureController),
        _buildSignatureBox('Trader Signature', traderSignatureController),
      ],
    );
  }

  Widget _buildSignatureBox(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Container(
          width: 200.0,
          height: 80.0,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(8.0),
            ),
          ),
        ),
      ],
    );
  }
}

class GateEntryPage extends StatefulWidget {
  @override
  _GateEntryPageState createState() => _GateEntryPageState();
}

class _GateEntryPageState extends State<GateEntryPage> {
  String traderId = '';
  String traderName = '';
  String vehicleNumber = '';
  String vehicleType = 'Tractor'; // Default value
  String reasonForEntry = 'Delivery'; // Default value
  List<String> selectedProducts = [];

  final TextEditingController traderIdController = TextEditingController();
  final TextEditingController traderNameController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();

  final List<String> vehicleTypes = [
    'Tractor',
    'Truck',
    'Auto',
    'Pickup',
    'Other'
  ];
  final List<String> reasonsForEntry = [
    'Delivery',
    'Pickup',
    'Meeting',
    'Service',
    'Other'
  ];
  final List<String> availableProducts = [
    'Product A',
    'Product B',
    'Product C',
    'Product D',
    'Product E'
  ];

  void _submitEntry() {
    // Logic to submit the gate entry
    _showDialog('Gate entry submitted successfully!');
  }

  void _resetFields() {
    setState(() {
      traderIdController.clear();
      traderNameController.clear();
      vehicleNumberController.clear();
      vehicleType = 'Tractor';
      reasonForEntry = 'Delivery';
      selectedProducts.clear();
    });
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gate Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputRow('Trader ID', traderIdController),
            _buildInputRow('Trader Name', traderNameController),
            _buildInputRow('Vehicle Number', vehicleNumberController),
            SizedBox(height: 16.0),
            _buildDropdownRow('Vehicle Type', vehicleType, vehicleTypes),
            _buildDropdownRow(
                'Reason for Entry', reasonForEntry, reasonsForEntry),
            SizedBox(height: 16.0),
            _buildProductList(),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _submitEntry,
                  child: Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: _resetFields,
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputRow(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildDropdownRow(String label, String value, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        DropdownButton<String>(
          value: value,
          onChanged: (newValue) {
            setState(() {
              if (label == 'Vehicle Type') {
                vehicleType = newValue!;
              } else if (label == 'Reason for Entry') {
                reasonForEntry = newValue!;
              }
            });
          },
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildProductList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Products'),
        Wrap(
          spacing: 8.0,
          children: availableProducts.map((String productName) {
            return ElevatedButton(
              onPressed: () {
                setState(() {
                  if (selectedProducts.contains(productName)) {
                    selectedProducts.remove(productName);
                  } else {
                    selectedProducts.add(productName);
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                primary: selectedProducts.contains(productName)
                    ? Colors.green
                    : null,
              ),
              child: Text(productName),
            );
          }).toList(),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}

class LotPage extends StatefulWidget {
  @override
  _LotPageState createState() => _LotPageState();
}

class _LotPageState extends State<LotPage> {
  String selectedProduct = '[dropdown]';
  String selectedBagType = '[dropdown]';
  DateTime selectedDate = DateTime.now();
  TextEditingController lotCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lot Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lot Code:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: lotCodeController,
              decoration: InputDecoration(
                hintText: 'Enter lot code',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Lot Date:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select Date'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Products:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            buildDropdown(products, selectedProduct),
            SizedBox(height: 16.0),
            Text(
              'Bag Type:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            buildDropdown(bagTypes, selectedBagType),
            SizedBox(height: 16.0),
            // Your existing code for number of bags and quantity...
            ElevatedButton(
              onPressed: () {
                // Add your logic for proceeding to bid
                _proceedToBid();
              },
              child: Text('Proceed to Bid'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(List<String> items, String selectedItem) {
    return DropdownButton<String>(
      value: selectedItem,
      onChanged: (String? newValue) {
        setState(() {
          selectedItem = newValue!;
        });
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _proceedToBid() {
    // Add your logic for proceeding to bid
    // This method will be called when the "Proceed to Bid" button is pressed
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Proceed to Bid'),
          content: Text('Your lot information has been submitted for bidding.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

// Sample data for dropdowns
List<String> products = ['[dropdown]', 'Product A', 'Product B', 'Product C'];
List<String> bagTypes = ['[dropdown]', '30kg', '40kg', '50kg'];

class LotStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lot Status'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search Lot Code:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter lot code',
              ),
            ),
            SizedBox(height: 16.0),
            buildStatusRow('Lot Code', true),
            buildStatusRow('Weight Check', true),
            buildStatusRow('Sample Collect', false),
            buildStatusRow('Approval', true),
            buildStatusRow('Bid Created', true),
            buildStatusRow('Bid Status', 'Closed'),
            buildStatusRow(
                'Bid Amount', '\$5000'), // Change this to the actual bid amount
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add your logic for proceeding to bill
                _proceedToBill(context);
              },
              child: Text('Proceed to Bill'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatusRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          if (value is bool)
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                // Handle checkbox change
              },
            ),
          if (value is String)
            Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
        ],
      ),
    );
  }

  void _proceedToBill(BuildContext context) {
    // Add your logic for proceeding to bill
    // This method will be called when the "Proceed to Bill" button is pressed
    // You can navigate to the bill page or show a sample bill
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sample Bill'),
          content: Column(
            children: [
              // Display your sample bill content here
              // Include trader name, farmer name, date, bill no, products, quantity, rate, etc.
              // Add signature spaces for farmer and trader
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class LotHistoryPage extends StatefulWidget {
  @override
  _LotHistoryPageState createState() => _LotHistoryPageState();
}

class _LotHistoryPageState extends State<LotHistoryPage> {
  DateTime selectedFromDate = DateTime.now();
  DateTime selectedToDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lot History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search by Date:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _selectDate(context, true),
                  child: Text('From Date'),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () => _selectDate(context, false),
                  child: Text('To Date'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Lot History:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            buildLotHistoryEntry('Trader 1', 'Lot 123', '\$5000'),
            buildLotHistoryEntry('Trader 2', 'Lot 456', '\$7000'),
            // Add more lot history entries as needed
          ],
        ),
      ),
    );
  }

  Widget buildLotHistoryEntry(
      String traderName, String lotNumber, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Trader: $traderName',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Lot: $lotNumber',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Price: $price',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isFromDate ? selectedFromDate : selectedToDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null &&
        pickedDate != (isFromDate ? selectedFromDate : selectedToDate)) {
      setState(() {
        if (isFromDate) {
          selectedFromDate = pickedDate;
        } else {
          selectedToDate = pickedDate;
        }
      });
    }
  }
}

class Bill {
  final String productName;
  final double price;
  final DateTime date;

  Bill({required this.productName, required this.price, required this.date});
}

class BillsPage extends StatefulWidget {
  @override
  _BillsPageState createState() => _BillsPageState();
}

class _BillsPageState extends State<BillsPage> {
  DateTime selectedDate = DateTime.now();

  List<Bill> bills = [
    Bill(
        productName: 'Product 1',
        price: 100.0,
        date: DateTime.now().subtract(Duration(days: 2))),
    Bill(
        productName: 'Product 2',
        price: 150.0,
        date: DateTime.now().subtract(Duration(days: 1))),
    // Add more bills as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bills'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search by Date:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select Date'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Bills:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            buildBillList(),
          ],
        ),
      ),
    );
  }

  Widget buildBillList() {
    return Expanded(
      child: ListView.builder(
        itemCount: bills.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Product: ${bills[index].productName}'),
            subtitle: Text('Price: \$${bills[index].price.toString()}'),
            trailing: ElevatedButton(
              onPressed: () => _viewBillDetails(context, bills[index]),
              child: Text('View'),
            ),
          );
        },
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        // Implement filtering bills by selected date
      });
    }
  }

  void _viewBillDetails(BuildContext context, Bill bill) {
    // Implement navigating to the BillDetailsPage with the selected bill
    // You can pass the 'bill' object to the BillDetailsPage for detailed view
  }
}

// ignore: use_key_in_widget_constructors
class FarmerGateEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gate Entry'),
      ),
      body: const Center(
        child: Text('Gate Entry Page for Farmer'),
      ),
    );
  }
}

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: const Center(
        child: Text('Logout Page'),
      ),
    );
  }
}
