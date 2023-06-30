import 'dart:convert';
import '../objects/address.dart';
import '../objects/response/response.dart';
import '../connection/connection.dart';
import '../constants/constants.dart';

/// This is the api endpoint
///
/// Returns the expected result if the call
/// is successful, or null otherwise.
class Endpoint {
  late Connection connection;

  final String baseUrl = Constants().baseURL;

  Endpoint() {
    connection = Connection();
  }

  /// Get the label (ie. tag) of an address
  Future<String?> getLabelFromAddress(String address) async {
    Response response = await connection.get('$baseUrl/'
        'labeled-addresses/$address');
    return response.statusCode == 200
        ? Address.fromMap(json.decode(response.body)).tag
        : null;
  }

  /// Get address by ENS name
  Future<String?> getAddressByENS(String ensName) async {
    Response response = await connection.get('$baseUrl/'
        'ens/by-name/$ensName');
    return response.statusCode == 200
        ? Address.fromMap(json.decode(response.body)).address
        : null;
  }

  /// Get ENS name of an address
  Future<String?> getENSName(String address) async {
    Response response = await connection.get('$baseUrl/'
        'ens/by-address/$address');
    return response.statusCode == 200
        ? Address.fromMap(json.decode(response.body)).ensName
        : null;
  }

  /// Decode events of a transaction
  Future<List<dynamic>?> getEvents(String tx, String network) async {
    Response response = await connection.get('$baseUrl/'
        'events/decode/$tx?network=$network');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Get all protocols supported by Decentrifi
  Future<List<dynamic>?> getProtocols() async {
    Response response = await connection.get('$baseUrl/protocols');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Get all networks supported by Decentrifi
  Future<List<dynamic>?> getNetworks() async {
    Response response = await connection.get('$baseUrl/networks');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Get wrapped native token address of a given [network]
  Future<String?> getWrappedTokenAddress(String network) async {
    Response response = await connection.get('$baseUrl/'
        'erc20/$network/wrapped');
    return response.statusCode == 200
        ? json.decode(response.body)['address']
        : null;
  }

  /// Get ERC-20 token information
  Future<Map<String, dynamic>?> getERC20TokenInformation(
    String network,
    String address,
  ) async {
    Response response = await connection.get('$baseUrl/'
        'erc20/$network/$address/token');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Get token balance of a user
  Future<BigInt?> getTokenBalance(
    String network,
    String token,
    String address,
  ) async {
    Response response =
        await connection.get('$baseUrl/erc20/$network/$token/$address');
    return response.statusCode == 200
        ? BigInt.from(json.decode(response.body))
        : null;
  }

  /// Get allowance
  Future<BigInt?> getAllowance(
    String network,
    String token,
    String user,
    String spender,
  ) async {
    Response response = await connection.get('$baseUrl/erc20/'
        '$network/allowance/$token/$user/$spender');
    return response.statusCode == 200
        ? BigInt.from(json.decode(response.body))
        : null;
  }

  /// Get pools for a [protocol]
  Future<List<dynamic>?> getPools(
    String protocol,
  ) async {
    Response response = await connection.get('$baseUrl/'
        '$protocol/pooling/all-markets');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Get pools for a specific [network], [protocol]
  /// and [token]
  Future<List<dynamic>?> getPoolsForToken(
    String protocol,
    String network,
    String token,
  ) async {
    Response response = await connection.get('$baseUrl/'
        '$protocol/pooling/markets?token=$token&network=$network');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Get active pool positions of the user [address]
  /// on a specific [protocol]
  Future<List<dynamic>?> getPoolPositions(
    String protocol,
    String address,
  ) async {
    Response response = await connection.get('$baseUrl/'
        '$protocol/pooling/$address/positions');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Get pool history on a [protocol] for a user
  Future<List<dynamic>?> getPoolHistory(
    String protocol,
    String address,
  ) async {
    Response response = await connection.get('$baseUrl/'
        '$protocol/pooling/$address/history');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Get all supported lending markets for a specific [protocol]
  Future<List<dynamic>?> getLending(
    String protocol,
  ) async {
    Response response = await connection.get('$baseUrl/'
        '$protocol/lending/all-markets');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Get all lending markets on a [protocol] for a specific
  /// [token] and [network]
  Future<List<dynamic>?> getLendingForToken(
    String network,
    String protocol,
    String token,
  ) async {
    Response response = await connection.get('$baseUrl/'
        '$protocol/lending/markets?token=$token&network=$network');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Get all lending positions on a [protocol] for a user [address]
  Future<List<dynamic>?> getLendingPositions(
    String protocol,
    String address,
  ) async {
    Response response = await connection.get('$baseUrl/'
        '$protocol/lending/$address/positions');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Get all farming positions on a [protocol] on a [network]
  Future<List<dynamic>?> getFarms(
    String protocol,
    String network,
  ) async {
    Response response = await connection.get('$baseUrl/'
        '$protocol/staking/all-markets?network=$network');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Get all farming markets pertaining to a specific [token]
  /// and [network]
  Future<List<dynamic>?> getFarmsForToken(
    String network,
    String protocol,
    String token,
  ) async {
    Response response = await connection.get('$baseUrl/'
        '$protocol/staking/markets?token=$token&network=$network');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Get all farming positions on a [protocol] for a user [address]
  Future<List<dynamic>?> getFarmPositions(
    String protocol,
    String address,
  ) async {
    Response response = await connection.get('$baseUrl/'
        '$protocol/farming/$address/positions');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Get the price of a token on a [network]
  Future<double?> getPrice(
    String network,
    String address,
    String amount,
  ) async {
    Response response = await connection.post('https://api.decentri.fi/price', {
      'address': address,
      'network': network,
      'amount': amount,
    });
    if (response.statusCode != 200) {
      return null;
    } else {
      return json.decode(response.body) as double;
    }
  }

  /// Get list of companies that has integrated with Decentrifi
  Future<List<dynamic>?> getCompanies() async {
    Response response = await connection.get('$baseUrl/companies');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Get Decentrifi statistics
  Future<Map<String, dynamic>?> getStats(
    /// [type]: farming, lending, pooling
    String type,
  ) async {
    Response response = await connection.get('$baseUrl/'
        'statistics/$type/markets/count');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Get transactions to enter a Farm or Lending position
  ///
  /// CHeck if prepareInvestmentSupported: true
  /// using getFarms() or getLending()
  Future<List<dynamic>?> entryService({
    /// [type]: lending, farming
    required String type,
    required String protocol,
    required String id,
    required String address,
    required String amount,
  }) async {
    Response response = await connection.post(
        '$baseUrl/'
        '$protocol/$type/markets/$id/enter',
        {'user': address, 'amount': amount});
    if (response.statusCode != 200) {
      return null;
    } else if (json.decode(response.body)['error'] != null) {
      /// Returns empty array if the user does not have enough
      /// required assets
      return [];
    } else {
      return json.decode(response.body)['transactions'];
    }
  }

  /// Get transactions to exit a Farm or Lending position
  ///
  /// CHeck if exitPositionSupported: true
  /// using getFarms() or getLending()
  ///
  /// This is not supported for most lending positions
  Future<List<dynamic>?> exitService({
    /// [type]: lending, farming
    required String type,
    required String protocol,
    required String id,
    required String address,
    required String amount,
  }) async {
    Response response = await connection.post(
        '$baseUrl/'
        '$protocol/$type/markets/$id/exit',
        {
          'user': address,
          'amount': amount,
        });
    if (response.statusCode != 200) {
      return null;
    } else if (json.decode(response.body)['error'] != null) {
      /// Returns empty array if the user does not have enough
      /// required assets
      return [];
    } else {
      return json.decode(response.body)['transactions'];
    }
  }

  /// Get a list of claimables from a protocol
  Future<List<dynamic>?> getClaimables(
    String protocol,
    String address,
  ) async {
    Response response = await connection.get('$baseUrl/'
        '$protocol/$address/claimables');
    return response.statusCode == 200 ? json.decode(response.body) : null;
  }

  /// Close the connection
  void close() {
    connection.close();
  }
}
