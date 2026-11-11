import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  // Hardcoded categories
  // ignore: library_private_types_in_public_api
  static const List<_Category> categories = [
    _Category(name: 'SUVs', count: 24, icon: Icons.directions_car_filled),
    _Category(name: 'Sedans', count: 18, icon: Icons.directions_car),
    _Category(name: 'Hatchbacks', count: 15, icon: Icons.time_to_leave),
    _Category(name: 'Pickups', count: 9, icon: Icons.local_shipping),
    _Category(name: 'Vans & Minibuses', count: 7, icon: Icons.airport_shuttle),
    _Category(name: 'Luxury', count: 6, icon: Icons.star),
    _Category(name: 'Electric', count: 4, icon: Icons.electric_car),
    _Category(name: 'Motorbikes', count: 11, icon: Icons.two_wheeler),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories'), centerTitle: true),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 1.1,
        ),
        itemBuilder: (context, index) {
          return _CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}

class _Category {
  final String name;
  final int count;
  final IconData icon;

  const _Category({
    required this.name,
    required this.count,
    required this.icon,
  });
}

class _CategoryCard extends StatelessWidget {
  final _Category category;

  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.brown.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(category.icon, size: 32, color: Colors.brown),
              ),
              const SizedBox(height: 12),
              Text(
                category.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${category.count} cars',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
