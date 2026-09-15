import 'package:test/test.dart';

import 'package:sip_ua/src/sip_ua_helper.dart';

List<void Function()> testFunctions = <void Function()>[
  () => test(
      'SIPUAHelper: forceTransportReconnect is a no-op before start()', () {
    SIPUAHelper helper = SIPUAHelper();

    // No UA has been started, so there is no socket transport to cycle. The
    // helper must warn and return rather than throw: the app calls this from
    // several reconnect paths, including timers that can fire while the stack
    // is shutting down.
    expect(helper.forceTransportReconnect, returnsNormally);
  })
];

void main() {
  for (Function func in testFunctions) {
    func();
  }
}
