[![pub package](https://img.shields.io/pub/v/permission_handler.svg)](https://pub.dev/packages/inngage_plugin) 

# inngage_plugin

This SDK inf lutter aims to enable integration with the [Inngage](http://www.inngage.com.br)  platform

## Add the plugin to your project

* Open the **pubspec.yaml**
* add to the dependencies section


[Access here](https://inngage.readme.io/v1.0/docs/integração-flutter) to see the official documentation on the inngage website

```yaml
inngage_plugin:1.4.1
```


## How to use

```dart
  final json = {
    "nome": "test",
    "dt_nascimento": "01/09/1970",
    "genero": "M",
    "cartao": "N",
    "ultimo_abastecimento": "10/09/2018",
    "total_abastecido": "290,00"
  };

  final inngageWebViewProperties = InngageWebViewProperties(
    appBarColor: Colors.pink,
    appBarText: Text(
      'AppTitle',
    ),
    backgroundColor: Colors.white,
    loaderColor: Colors.pink,
    debuggingEnabled: true,
    withJavascript: true,
    withLocalStorage: true,
    withZoom: true,
  );
await InngageSDK.subscribe(
    appToken: 'AppToken',
    friendlyIdentifier: 'user@email.com',
    customFields: json,
    phoneNumber: '11-959821612',
    navigatorKey: navigatorKey,
    inngageWebViewProperties: inngageWebViewProperties,
  );
  await InngageSDK.sendEvent(
    eventName: 'MyEvent',
    appToken: 'MyAppToken',
    identifier: 'user@gmail.com',
    registration: 'registration',
    eventValues: {
      'location': '12312312312',
    },
  );
  await InngageSDK.sendEvent(
    eventName: 'MyOtherEventWithoutEventValues',
    appToken: 'MyAppToken',
    identifier: 'user@gmail.com',
  );
```

Call `subscribe()` on a `InngageSDK` to request it.
