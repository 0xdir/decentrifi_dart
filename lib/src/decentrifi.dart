import 'endpoints/endpoint.dart';

/// This is the main object
class Decentrifi {
  /// Initialize a connection to the API endpoint
  late final Endpoint api;

  /// Initialize the main object
  Decentrifi() {
    api = Endpoint();
  }

  /// Get the label (ie. tag) of an address
  ///
  /// Labels are manually checked and added to the database
  /// by the decentrifi team.
  Future<String?> getLabeledAddress({
    /// The wallet address
    required String address,
  }) async {
    return api.getLabelFromAddress(address);
  }

  /// Get address by ENS name
  Future<String?> getAddressByENS({
    /// The ENS name of the user
    required String ensName,
  }) async {
    return api.getAddressByENS(ensName);
  }

  /// Get the ENS name of an address
  Future<String?> getENSName({
    /// The wallet address of the user
    required String address,
  }) async {
    return api.getENSName(address);
  }

  /// Decode events of a transaction
  ///
  /// Provide transaction hash to decode its events, and [network]
  /// eg. ETHEREUM
  ///
  /// [network] can be obtained by calling getNetwork()
  ///
  /// Supported events for decoding (subject to change): token approval,
  /// token transfer, borrow, claim, add liquidity,
  /// swap, get reward, remove liquidity, token burn.
  Future<List<dynamic>?> getEvents({
    /// The transaction hash
    required String tx,

    /// The network name obtained from getNetwork()
    required String network,
  }) async {
    return api.getEvents(tx, network);
  }

  /// Get all protocols supported by Decentrifi
  ///
  /// Decentrifi generalized apps, smart contracts and companies as
  /// protocols.
  Future<List<dynamic>?> getProtocols() async {
    return api.getProtocols();
  }

  /// Get all networks supported by Decentrifi
  Future<List<dynamic>?> getNetworks() async {
    return api.getNetworks();
  }

  /// Get wrapped native token address of a given [network]
  ///
  /// Each network has a wrapped version of the native token
  /// that can be used. Decentrifi maintains a mapping for every network.
  Future<String?> getWrappedTokenAddress({
    /// The network name obtained from getNetwork()
    required String network,
  }) async {
    return api.getWrappedTokenAddress(network);
  }

  /// Get ERC-20 token information
  Future<Map<String, dynamic>?> getERC20TokenInformation({
    /// The network name obtained from getNetwork()
    required String network,

    /// The token address
    required String address,
  }) async {
    return api.getERC20TokenInformation(network, address);
  }

  /// Get token balance of a user
  Future<BigInt?> getTokenBalance({
    /// The network name obtained from getNetwork()
    required String network,

    /// The token address
    required String token,

    /// The wallet address of the user
    required String address,
  }) async {
    return api.getTokenBalance(network, token, address);
  }

  /// Get allowance of a [spender] for a [token]in a [user] wallet
  Future<BigInt?> getAllowance({
    /// The network name obtained from getNetwork()
    required String network,

    /// The token address
    required String token,

    /// The wallet address of the user
    required String user,

    /// The address of the spender contract
    required String spender,
  }) async {
    return api.getAllowance(network, token, user, spender);
  }

  /// Get pools for a [protocol]
  Future<List<dynamic>?> getPools({
    /// The slug of the protocol, obtained from getProtocols()

    required String protocol,
  }) async {
    return api.getPools(protocol);
  }

  /// Get pools for a specific [network], [protocol]
  /// and [token]
  Future<List<dynamic>?> getPoolsForToken({
    /// The network name obtained from getNetwork()
    required String network,

    /// The slug of the protocol, obtained from getProtocols()
    required String protocol,

    /// The token address
    required String token,
  }) async {
    return api.getPoolsForToken(network, protocol, token);
  }

  /// Get active pool positions of the user [address]
  /// on a specific [protocol]
  Future<List<dynamic>?> getPoolPositions({
    /// The slug of the protocol with the pool, obtained from getPools()
    required String protocol,

    /// The wallet address of the user
    required String address,
  }) async {
    return api.getPoolPositions(protocol, address);
  }

  /// Get pool history on a [protocol] for a user
  Future<List<dynamic>?> getPoolHistory({
    /// The slug of the protocol with the pool, obtained from getPools()
    required String protocol,

    /// The wallet address of the user
    required String address,
  }) async {
    return api.getPoolHistory(protocol, address);
  }

  /// Get all supported lending markets for a specific protocol
  ///
  /// Returns a list of Lending Markets, which contain information
  /// about which tokens can be lent out on a specific [protocol].
  /// It often returns the APR, which is the rate the user will get
  /// for providing assets to the lending pool.
  Future<List<dynamic>?> getLending({
    required String protocol,
  }) async {
    return api.getLending(protocol);
  }

  /// Get all lending markets for a specific [network], [protocol]
  /// and [token]
  ///
  /// This can be used to search for a lending market on a specific
  /// protocol (like compound) using DAI as your asset to be lent out.
  Future<List<dynamic>?> getLendingForToken({
    /// The network name, obtained from getNetworks()
    required String network,

    /// The slug of the protocol, obtained from getProtocols()
    required String protocol,

    /// The token address
    required String token,
  }) async {
    return api.getLendingForToken(network, protocol, token);
  }

  /// Get all lending positions on a [protocol] for a user [address]
  ///
  /// If the protocol does not support Lending Markets, the result
  /// will be an empty list.
  Future<List<dynamic>?> getLendingPositions({
    /// The slug of the protocol, obtained from getProtocols()
    required String protocol,

    /// The wallet address of the user
    required String address,
  }) async {
    return api.getLendingPositions(protocol, address);
  }

  /// Get transactions to be signed for entering a lending position [id]
  /// on a [protocol] and [network]
  ///
  /// The user wallet's [address] and [amount] to enter is required.
  ///
  /// When fetching Lending Markets using getLending(), the field
  /// prepareInvestmentSupported is returned. This indicates
  /// if Decentrifi supports preparation of entry ie. deposit
  /// transactions for the underlying market.
  ///
  /// Returns a list of transactions, which can be signed
  /// and broadcasted sequentially to enter the underlying market.
  Future<List<dynamic>?> getLendingEntryTransactions({
    /// The Protocol name, obtained from getProtocol()
    required String protocol,

    /// The Protocol id
    required String id,

    /// The wallet address of the user
    required String address,

    /// The amount of tokens to enter the lending market
    required String amount,
  }) async {
    return api.entryService(
      type: 'lending',
      protocol: protocol,
      id: id,
      address: address,
      amount: amount,
    );
  }

  /// Get transactions to exit a Lending position
  ///
  /// These transactions need to be signed and broadcasted
  /// to the network in the order they are listed.
  Future<List<dynamic>?> getLendingExitTransactions({
    /// The slug of the protocol, obtained from getProtocols()
    required String protocol,

    /// The id of the lending market, obtained from getLending()
    required String id,

    /// The wallet address of the user
    required String address,

    /// The amount to enter the lending market with
    required String amount,
  }) async {
    return api.exitService(
      type: 'lending',
      protocol: protocol,
      id: id,
      address: address,
      amount: amount,
    );
  }

  /// Get all farming positions for a [protocol] on a specified [network]
  Future<List<dynamic>?> getFarms({
    /// The slug of the protocol, obtained from getProtocols()
    required String protocol,

    /// The network name obtained from getNetwork()
    required String network,
  }) async {
    return api.getFarms(protocol, network);
  }

  /// Get all farming markets pertaining to a specific [token]
  /// and [network]
  ///
  /// Return a list of Farming markets on a specific network
  /// for a specific token. This can be used to search for a
  /// lending market on a specific protocol (like Beefy Finance)
  /// using DAI as your asset to be put in the specific farm or vault.
  Future<List<dynamic>?> getFarmsForToken({
    /// The network name obtained from getNetwork()
    required String network,

    /// The slug of the protocol with the farm, obtained from getFarms()
    required String protocol,

    /// the wallet address of the user
    required String token,
  }) async {
    return api.getFarmsForToken(network, protocol, token);
  }

  /// Get all farming positions on a [protocol] for a user [address]
  Future<List<dynamic>?> getFarmPositions({
    /// The slug of the protocol with the farm, obtained from getFarms()
    required String protocol,

    /// the wallet address of the user
    required String address,
  }) async {
    return api.getFarmPositions(protocol, address);
  }

  /// Get transactions to enter a Farm
  ///
  /// These transactions need to be signed and broadcasted
  /// to the network in the order they are listed. The first
  /// is usually a approval transaction.
  Future<List<dynamic>?> getFarmEntryTransactions({
    /// The slug of the protocol with the farm, obtained from getFarms()

    required String protocol,

    /// The id of the Farm, obtained from getFarms()
    required String id,

    /// The wallet address of the user
    required String address,

    /// The amount to enter the farm with
    required String amount,
  }) async {
    return api.entryService(
      type: 'staking',
      protocol: protocol,
      id: id,
      address: address,
      amount: amount,
    );
  }

  /// Get transactions to exit a Farm
  ///
  /// These transactions need to be signed and broadcasted
  /// to the network in the order they are listed.
  Future<List<dynamic>?> getFarmExitTransactions({
    /// The slug of the protocol with the farm, obtained from getFarms()
    required String protocol,

    /// The id of the Farm, obtained from getFarms()
    required String id,

    /// The wallet address of the user
    required String address,

    /// The token amount to exit the farm with
    required String amount,
  }) async {
    return api.exitService(
      type: 'staking',
      protocol: protocol,
      id: id,
      address: address,
      amount: amount,
    );
  }

  /// Get the price of a token on a [network]
  ///
  /// Provide the token [address] and [amount] to be converted
  Future<double?> getPrice({
    /// The network name, obtained from getNetwork()
    required String network,

    /// The token address
    required String address,

    /// The amount of tokens to convert
    required String amount,
  }) async {
    return api.getPrice(network, address, amount);
  }

  /// Get list of companies that has integrated with Decentrifi
  Future<List<dynamic>?> getCompanies() async {
    return api.getCompanies();
  }

  /// Get Decentrifi statistics
  Future<Map<String, dynamic>?> getStats({
    /// [type]: pooling, staking, farming
    required String type,
  }) async {
    return api.getStats(type);
  }

  /// Get a list of climables from a [protocol]
  Future<List<dynamic>?> getClaimables({
    /// The protocol name, obtained from getProtocol()
    required String protocol,

    /// the wallet address of the user
    required String address,
  }) async {
    return api.getClaimables(protocol, address);
  }

  /// Close the connection
  void close() {
    api.close();
  }
}
