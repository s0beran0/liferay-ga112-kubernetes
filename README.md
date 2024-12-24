# liferay-ga112-kubernetes
A advanced configuration for liferay comunity GA 112 for kubernetes


# Liferay Environment Configuration

 Correctly configure the file `com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config` for connection with Elasticsearch. If you are not going to use it and prefer to set it up using the sidecar for configuration via the interface, comment out the corresponding line in the Dockerfile.

 Add the correct path in the file `com.liferay.portal.store.file.system.configuration.FileSystemStoreConfiguration.config` where the Document Library (DL) will be mounted in the pod. If you intend to use a direct connection to S3, comment out the `COPY` related to this file in the Dockerfile.

 Add your namespace and built image to the following files:
   - `jgroupsliferay-control.xml`
   - `jgroupsliferay-transport.xml`
   - `statefulset.yaml`

 Examples of BASE64 secrets:

 - URL `jdbc:mysql://192.168.1.211/liferay`, run this command:
   ```bash
   echo -n "jdbc:mysql://192.168.1.211/liferay" | base64
   ```
   The terminal will return:
   ```
   bG9yZWZheXM6Ly8xOTIuMTY4LjEuMjExL2xpZmVyYXk=
   ```
 Do this for each of the secrets before placing them in `secrets.yaml`.

 Configure the database connection secrets in the `secrets.yaml` file, including:
   - URL
   - Password
   - User

