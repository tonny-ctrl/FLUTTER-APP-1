import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Hardcoded summary stats
  // ignore: library_private_types_in_public_api
  static const List<_Stat> stats = [
    _Stat(label: 'Cars Listed', value: '84', icon: Icons.directions_car),
    _Stat(label: 'Sold', value: '32', icon: Icons.check_circle),
    _Stat(label: 'Pending', value: '9', icon: Icons.hourglass_bottom),
    _Stat(label: 'Revenue', value: 'KES 98M', icon: Icons.payments),
  ];

  // Hardcoded featured cars
  // ignore: library_private_types_in_public_api
  static const List<_Car> featured = [
    _Car(
      name: 'Toyota Prado TX',
      year: '2018',
      price: 'KES 6,200,000',
      mileage: '78,000 km',
    ),
    _Car(
      name: 'Mazda CX-5',
      year: '2019',
      price: 'KES 3,450,000',
      mileage: '54,000 km',
    ),
    _Car(
      name: 'Subaru Forester XT',
      year: '2017',
      price: 'KES 2,850,000',
      mileage: '92,000 km',
    ),
    _Car(
      name: 'Honda Fit',
      year: '2016',
      price: 'KES 1,100,000',
      mileage: '110,000 km',
    ),
  ];

  // Hardcoded recent activity
  // ignore: library_private_types_in_public_api
  static const List<_Activity> activity = [
    _Activity(
      title: 'Toyota Prado TX sold',
      time: '2 hours ago',
      icon: Icons.sell,
    ),
    _Activity(
      title: 'New inquiry on Mazda CX-5',
      time: '5 hours ago',
      icon: Icons.chat,
    ),
    _Activity(
      title: 'Subaru Forester XT reserved',
      time: 'Yesterday',
      icon: Icons.bookmark,
    ),
    _Activity(
      title: 'Honda Fit order cancelled',
      time: '2 days ago',
      icon: Icons.cancel,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            const Text(
              'Welcome back, Tonny 👋',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Here's how your showroom is doing today.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Stats grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: stats.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.6,
              ),
              itemBuilder: (context, index) => _StatCard(stat: stats[index]),
            ),
            const SizedBox(height: 24),

            // Featured cars
            const Text(
              'Featured Cars',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 190,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: featured.length,
                // ignore: unnecessary_underscores
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) =>
                    _FeaturedCard(car: featured[index]),
              ),
            ),
            const SizedBox(height: 24),

            // Recent activity
            const Text(
              'Recent Activity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...activity.map((a) => _ActivityTile(activity: a)),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// ---------- Data classes ----------

class _Stat {
  final String label;
  final String value;
  final IconData icon;

  const _Stat({required this.label, required this.value, required this.icon});
}

class _Car {
  final String name;
  final String year;
  final String price;
  final String mileage;

  const _Car({
    required this.name,
    required this.year,
    required this.price,
    required this.mileage,
  });
}

class _Activity {
  final String title;
  final String time;
  final IconData icon;

  const _Activity({
    required this.title,
    required this.time,
    required this.icon,
  });
}

// ---------- Widgets ----------

class _StatCard extends StatelessWidget {
  final _Stat stat;

  const _StatCard({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: Colors.brown.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(stat.icon, color: Colors.brown),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stat.value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    stat.label,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  final _Car car;

  const _FeaturedCard({required this.car});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90,
              width: double.infinity,
              color: Colors.brown.withValues(alpha: 0.12),
              child: const Icon(
                Icons.directions_car,
                size: 54,
                color: Colors.brown,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${car.name} ${car.year}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    car.mileage,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    car.price,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityTile extends StatelessWidget {
  final _Activity activity;

  const _ActivityTile({required this.activity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.brown.withValues(alpha: 0.12),
        child: Icon(activity.icon, color: Colors.brown, size: 20),
      ),
      title: Text(activity.title),
      subtitle: Text(activity.time),
    );
  }
}
