[![pub package](https://img.shields.io/pub/v/decentrifi.svg)](https://pub.dev/packages/decentrifi)
[![package publisher](https://img.shields.io/pub/publisher/decentrifi.svg)](https://pub.dev/packages/decentrifi/publisher)

A Future-based library for interacting with the Decentrifi Defi Hub. 

Access data on ENS, lending, borrowing, vaults, farming and staking on multiple chains 
easily with this library which is a wrapper around the [Decentrifi API]. It is 
multi-platform, with limited dependencies for use in mobile, desktop, or browser apps.

[Decentrifi API]: https://docs.decentri.fi/

This community package is designed to follow the [Decentrifi API Documentation] as closely
as possible.

[Decentrifi API Documentation]: https://docs.decentri.fi/

## Using

The easiest way to use this library is via the top-level ```Decentrifi``` class.

```dart
import 'package:decentrifi/decentrifi.dart';

void main() async {
  /// Initialize the main object
  Decentrifi decentrifi = Decentrifi();

  /// Get the ENS name of a user's wallet address
  var ens = await decentrifi.getENSName(
    address: '0x231b0Ee14048e9dCcD1d247744d114a4EB5E8E63',
  );

  /// Do stuff with the result
  print('$ens');

  /// Close the connection
  decentrifi.close();
}

```

## What is Decentri.fi?

Decentrifi's [Defi Hub] is a defi aggregation API which serves
as a gateway to decentralized finance by abstracting common
principles and domains.

It unifies all concepts of lending, borrowing, vaults, farming
and staking into a single API for easy integration.

[Defi Hub]: https://decentri.fi/

## Getting Help

Submit an issue on [github].

[github]: https://github.com/0xdir/decentrifi

## How to contribute

All feedback and suggestions for improvements are welcome:

1. Open a discussion on [github]
2. Discuss proposed changes
3. Submit a PR (optional)

[github]: https://github.com/0xdir/decentrifi

## Support my work

This package is possible thanks to the people and companies
who donate money, services or time to keep the project running.

If you're interested in becoming a Sponsor, Backer or Contributor
to expand the project, check out my profile on [Github Sponsors].

[Github Sponsors]: https://github.com/sponsors/0xdir

Or buy my coffee at `0xdir.near`.