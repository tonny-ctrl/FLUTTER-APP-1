import 'package:flutter/material.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({super.key});

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  // Hardcoded cars
  static const List<_Car> allCars = [
    _Car(
      name: 'Toyota Prado TX',
      year: '2018',
      price: 'KES 6,200,000',
      mileage: '78,000 km',
      fuel: 'Diesel',
      transmission: 'Automatic',
      location: 'Nairobi',
    ),
    _Car(
      name: 'Mazda CX-5',
      year: '2019',
      price: 'KES 3,450,000',
      mileage: '54,000 km',
      fuel: 'Petrol',
      transmission: 'Automatic',
      location: 'Athi River',
    ),
    _Car(
      name: 'Subaru Forester XT',
      year: '2017',
      price: 'KES 2,850,000',
      mileage: '92,000 km',
      fuel: 'Petrol',
      transmission: 'Automatic',
      location: 'Mombasa',
    ),
    _Car(
      name: 'Honda Fit',
      year: '2016',
      price: 'KES 1,100,000',
      mileage: '110,000 km',
      fuel: 'Petrol',
      transmission: 'CVT',
      location: 'Nairobi',
    ),
    _Car(
      name: 'Toyota Hilux Double Cab',
      year: '2020',
      price: 'KES 5,400,000',
      mileage: '41,000 km',
      fuel: 'Diesel',
      transmission: 'Manual',
      location: 'Nakuru',
    ),
    _Car(
      name: 'Nissan Note',
      year: '2017',
      price: 'KES 950,000',
      mileage: '88,000 km',
      fuel: 'Petrol',
      transmission: 'CVT',
      location: 'Machakos',
    ),
  ];

  final TextEditingController _searchController = TextEditingController();
  final Set<String> _favorites = {};
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showDetails(_Car car) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.brown.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.directions_car,
                  size: 90,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '${car.name} ${car.year}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                car.price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 16),
              _DetailRow(
                icon: Icons.speed,
                label: 'Mileage',
                value: car.mileage,
              ),
              _DetailRow(
                icon: Icons.local_gas_station,
                label: 'Fuel',
                value: car.fuel,
              ),
              _DetailRow(
                icon: Icons.settings,
                label: 'Transmission',
                value: car.transmission,
              ),
              _DetailRow(
                icon: Icons.location_on,
                label: 'Location',
                value: car.location,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('Buy / Reserve'),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cars = allCars
        .where(
          (c) => '${c.name} ${c.year}'.toLowerCase().contains(
            _query.toLowerCase(),
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Cars'), centerTitle: true),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => _query = value),
              decoration: InputDecoration(
                hintText: 'Search cars...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _query.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _query = '');
                        },
                      ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),

          // Results
          Expanded(
            child: cars.isEmpty
                ? const Center(child: Text('No cars found'))
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: cars.length,
                    // ignore: unnecessary_underscores
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final car = cars[index];
                      final key = '${car.name}-${car.year}';
                      final isFav = _favorites.contains(key);
                      return _CarCard(
                        car: car,
                        isFavorite: isFav,
                        onTap: () => _showDetails(car),
                        onFavorite: () => setState(() {
                          isFav ? _favorites.remove(key) : _favorites.add(key);
                        }),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _Car {
  final String name;
  final String year;
  final String price;
  final String mileage;
  final String fuel;
  final String transmission;
  final String location;

  const _Car({
    required this.name,
    required this.year,
    required this.price,
    required this.mileage,
    required this.fuel,
    required this.transmission,
    required this.location,
  });
}

class _CarCard extends StatelessWidget {
  final _Car car;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavorite;

  const _CarCard({
    required this.car,
    required this.isFavorite,
    required this.onTap,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.brown.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.directions_car,
                  size: 44,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${car.name} ${car.year}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${car.mileage}  •  ${car.fuel}  •  ${car.transmission}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
              IconButton(
                onPressed: onFavorite,
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.brown),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(color: Colors.grey)),
          const Spacer(),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
