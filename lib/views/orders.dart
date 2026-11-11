import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  // Hardcoded orders
  static const List<Map<String, String>> orders = [
    {
      'id': '#DS-1001',
      'item': 'Toyota Prado TX 2018',
      'date': '28 Oct 2026',
      'price': 'KES 6,200,000',
      'status': 'Delivered',
    },
    {
      'id': '#DS-1002',
      'item': 'Mazda CX-5 2019',
      'date': '30 Oct 2026',
      'price': 'KES 3,450,000',
      'status': 'Shipped',
    },
    {
      'id': '#DS-1003',
      'item': 'Subaru Forester XT 2017',
      'date': '02 Nov 2026',
      'price': 'KES 2,850,000',
      'status': 'Processing',
    },
    {
      'id': '#DS-1004',
      'item': 'Honda Fit 2016',
      'date': '03 Nov 2026',
      'price': 'KES 1,100,000',
      'status': 'Cancelled',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders'), centerTitle: true),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        // ignore: unnecessary_underscores
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final order = orders[index];
          return _OrderCard(
            id: order['id']!,
            item: order['item']!,
            date: order['date']!,
            price: order['price']!,
            status: order['status']!,
          );
        },
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final String id;
  final String item;
  final String date;
  final String price;
  final String status;

  const _OrderCard({
    required this.id,
    required this.item,
    required this.date,
    required this.price,
    required this.status,
  });

  Color _statusColor() {
    switch (status) {
      case 'Delivered':
        return Colors.green;
      case 'Shipped':
        return Colors.blue;
      case 'Processing':
        return Colors.orange;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _statusColor();

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: Colors.brown.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.directions_car,
                size: 30,
                color: Colors.brown,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$id  •  $date',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    price,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
