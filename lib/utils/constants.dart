class AppConstants {
  // API Endpoints
  static const String apiBaseUrl = 'https://your-api.com/api';
  static const String userEndpoint = '/users';
  static const String policiesEndpoint = '/policies';
  static const String claimsEndpoint = '/claims';

  // Firebase Collections
  static const String usersCollection = 'users';
  static const String policiesCollection = 'policies';
  static const String claimsCollection = 'claims';

  // Strings
  static const String appName = 'Insurance Manager';
  static const String noData = 'No data available';
  static const String loading = 'Loading...';
  static const String error = 'Something went wrong';
  static const String success = 'Success';

  // Durations
  static const Duration shortDuration = Duration(milliseconds: 300);
  static const Duration mediumDuration = Duration(milliseconds: 500);
  static const Duration longDuration = Duration(milliseconds: 800);

  // Sizes
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 8.0;
  static const double cardBorderRadius = 12.0;

  // Text Field validation
  static const String emailRegex =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String phoneRegex = r'^\d{10}$';
  static const String passwordMinLength = '6';
}
