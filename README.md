# CubeJS Tableau JDBC connector

CubeJS Tableau JDBC connector

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
