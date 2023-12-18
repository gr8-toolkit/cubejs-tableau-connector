# How to make a release

* open a Pull Request with a manual `plugin_version` bump in [manifest.xml](cubejs_jdbc/manifest.xml)
* once it's merged, create a new release from
  [GitHub UI](https://github.com/gr8-toolkit/cubejs-tableau-connector/releases).
* check the following details regarding the release:  
  * be sure to start the tag with `v` e.g. `v0.1.1`
  * be sure to use the same version as in the `manifest.xml`

* once the GitHub action is complete, check the created release and attached assets.
  The file like `cubejs_jdbc-v0.1.0.taco` must be attached.
