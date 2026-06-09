import 'package:flutter/material.dart';

class ClaimCard extends StatelessWidget {
  final String claimNumber;
  final String claimType;
  final String status;
  final String claimedAmount;
  final String approvedAmount;
  final String claimDate;
  final VoidCallback onTap;

  const ClaimCard({
    Key? key,
    required this.claimNumber,
    required this.claimType,
    required this.status,
    required this.claimedAmount,
    required this.approvedAmount,
    required this.claimDate,
    required this.onTap,
  }) : super(key: key);

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
      case 'completed':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'pending':
      case 'processing':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    claimNumber,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getStatusColor(status),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      status,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Type',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        claimType,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Claimed',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        claimedAmount,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Approved',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        approvedAmount,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Filed: $claimDate',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
