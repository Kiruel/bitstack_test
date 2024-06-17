// di_container.dart

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  final Map<Type, dynamic> _services = {};

  factory ServiceLocator() {
    return _instance;
  }

  ServiceLocator._internal();

  void registerSingleton<T>(T instance) {
    _services[T] = instance;
  }

  void registerFactory<T>(T Function() factoryFunction) {
    _services[T] = factoryFunction;
  }

  T resolve<T>() {
    var service = _services[T];
    if (service is Function) {
      return service();
    }
    return service;
  }
}
