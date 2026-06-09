import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/policy_provider.dart';
import '../../widgets/policy_card.dart';

class PoliciesScreen extends StatefulWidget {
  const PoliciesScreen({Key? key}) : super(key: key);

  @override
  State<PoliciesScreen> createState() => _PoliciesScreenState();
}

class _PoliciesScreenState extends State<PoliciesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Policies'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to add policy screen
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<PolicyProvider>(
        builder: (context, policyProvider, _) {
          if (policyProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (policyProvider.policies.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.policy, size: 80, color: Colors.grey.shade300),
                  const SizedBox(height: 16),
                  Text(
                    'No policies found',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add your first insurance policy',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: policyProvider.policies.length,
            itemBuilder: (context, index) {
              final policy = policyProvider.policies[index];
              return PolicyCard(
                policyNumber: policy.policyNumber,
                policyType: policy.policyType.toString().split('.').last,
                status: policy.status.toString().split('.').last,
                providerName: policy.providerName,
                nextPremiumDate: policy.nextPremiumDate.toString().split(' ')[0],
                onTap: () {
                  // TODO: Navigate to policy details
                },
              );
            },
          );
        },
      ),
    );
  }
}
