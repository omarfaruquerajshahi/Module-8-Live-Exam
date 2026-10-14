import 'package:flutter/material.dart';

const Color kNavy = Color(0xFF1B2250);
const Color kRed = Color(0xFFE53935);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: const [
              SizedBox(height: 12),
              Text(
                'Blood Requests',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 20),
              BloodRequestCard(
                bloodGroup: 'O-',
                units: 3,
                location: 'Khulna City Medical College Hospital, KDA Avenue',
              ),
              BloodRequestCard(
                bloodGroup: 'O+',
                units: 2,
                location: 'Khulna City Medical College Hospital, KDA Avenue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BloodRequestCard extends StatelessWidget {
  final String bloodGroup;
  final int units;
  final String location;

  const BloodRequestCard({
    super.key,
    required this.bloodGroup,
    required this.units,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // red bar on the left
            Container(width: 10, color: kRed),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // URGENT chip + units
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFDE8E8),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'URGENT',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: kRed,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.water_drop,
                                size: 14, color: kRed),
                            const SizedBox(width: 4),
                            Text(
                              '$units Units',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '$bloodGroup Blood Needed',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: kNavy,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // location
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kNavy,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'View Details',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}