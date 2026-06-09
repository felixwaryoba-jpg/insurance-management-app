import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/app_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          final user = authProvider.currentUser;
          
          if (user == null) {
            return const Center(
              child: Text('No user logged in'),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: user.profileImage.isNotEmpty
                      ? NetworkImage(user.profileImage)
                      : null,
                  child: user.profileImage.isEmpty
                      ? const Icon(Icons.person, size: 60)
                      : null,
                ),
                const SizedBox(height: 24),
                _buildProfileField('Full Name', user.fullName),
                const SizedBox(height: 16),
                _buildProfileField('Email', user.email),
                const SizedBox(height: 16),
                _buildProfileField('Phone', user.phoneNumber),
                const SizedBox(height: 16),
                _buildProfileField('Date of Birth', user.dateOfBirth),
                const SizedBox(height: 16),
                _buildProfileField('Gender', user.gender),
                const SizedBox(height: 16),
                _buildProfileField('Address', user.address),
                const SizedBox(height: 16),
                _buildProfileField('City', user.city),
                const SizedBox(height: 16),
                _buildProfileField('State', user.state),
                const SizedBox(height: 16),
                _buildProfileField('Zip Code', user.zipCode),
                const SizedBox(height: 32),
                AppButton(
                  label: 'Edit Profile',
                  onPressed: () {
                    // TODO: Navigate to edit profile
                  },
                ),
                const SizedBox(height: 12),
                AppButton(
                  label: 'Change Password',
                  onPressed: () {
                    // TODO: Navigate to change password
                  },
                ),
                const SizedBox(height: 12),
                AppButton(
                  label: 'Logout',
                  onPressed: () {
                    authProvider.logout();
                  },
                  backgroundColor: Colors.red,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value.isEmpty ? 'Not provided' : value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
