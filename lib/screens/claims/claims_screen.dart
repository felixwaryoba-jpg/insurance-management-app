import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/claim_provider.dart';
import '../../widgets/claim_card.dart';

class ClaimsScreen extends StatefulWidget {
  const ClaimsScreen({Key? key}) : super(key: key);

  @override
  State<ClaimsScreen> createState() => _ClaimsScreenState();
}

class _ClaimsScreenState extends State<ClaimsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Claims'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to file claim screen
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<ClaimProvider>(
        builder: (context, claimProvider, _) {
          if (claimProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (claimProvider.claims.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.assignment, size: 80, color: Colors.grey.shade300),
                  const SizedBox(height: 16),
                  Text(
                    'No claims found',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'File your first insurance claim',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: claimProvider.claims.length,
            itemBuilder: (context, index) {
              final claim = claimProvider.claims[index];
              return ClaimCard(
                claimNumber: claim.claimNumber,
                claimType: claim.claimType.toString().split('.').last,
                status: claim.status.toString().split('.').last,
                claimedAmount: '\$${claim.claimedAmount}',
                approvedAmount: '\$${claim.approvedAmount}',
                claimDate: claim.claimDate.toString().split(' ')[0],
                onTap: () {
                  // TODO: Navigate to claim details
                },
              );
            },
          );
        },
      ),
    );
  }
}
