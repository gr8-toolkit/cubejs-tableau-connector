# CubeJS Tableau JDBC connector

CubeJS Tableau JDBC connector implemented based on
[postgres-jdbc connector](https://github.com/tableau/connector-plugin-sdk/tree/master/samples/plugins/postgres_jdbc)
but with some specific workarounds:

- added `MEASURE` aggregating function
- removed redundant `CAST AS TEXT` operation for string arguments

## How to build the connector

- Create virtualenv for python

    ```bash
    make venv
    make setup
    ```

- Package the connector

  ```bash
  make pack
  ```

- Sign the connector (WIP)
  The following algorithm signs the `taco` file with self-signed certificate,
  which is not acceptable for Tableau Desktop by default.

  ```bash
  keytool -genkeypair -alias tableau -keyalg DSA
  keytool -exportcert -alias tableau -file /tmp/cert.cer
  keytool -certreq -alias tableau -file /tmp/cert.crt
  jarsigner packaged_connector/cubejs_jdbc-v0.0.0.taco tableau -tsa http://sha256timestamp.ws.symantec.com/sha256/timestamp -verbose -certs
  ```

  You can run Tableau Desktop with the following command then:

  ```bash
  open -n /Applications/Tableau\ Desktop\ 2023.1.app --args -DDisableVerifyConnectorPluginSignature=true
  ```

## TODO

- Implement connector testing with `tdvt` library
- Describe `CONTRIBUTING` guideline once testing framework is defined
- Add code-signing certificate to be able to run the connector in the usual way
