# How to make a release

* open a Pull Request with a manual `plugin_version` bump in [manifest.xml](cubejs_jdbc/manifest.xml)
* once it's merged, create and push the new tag in format `v0.1.1`
  * be sure to use the same version as in the `manifest.xml`
  * be sure to start the tag with `v` e.g. `v0.1.1`
  * push the tag to trigger GitHub action:

  ```bash
  git tag v0.1.1
  git push origin v0.1.1
  ```

* once the GitHub action is complete, check the created release and attached assets.
  The file like `cubejs_jdbc-v0.1.0.taco` must be attached.
