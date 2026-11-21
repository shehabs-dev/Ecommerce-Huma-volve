abstract class DeepLinks {
  static const host = 'humavolve-store.web.app';
  static const _base = 'https://$host';

  // the path must match a GoRoute path
  static String product(String id) => '$_base/products/$id';
}
