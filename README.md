Docker NFS Server
================

##Suggested host properties
In the following setup the host is Ubuntu Trusty with the package `nfs-common` installed.

Usage
----
```bash
docker run -d --name nfs --priviledged pandrew/nfs-server /path/to/share /path/to/share2 /path/to/shareN
```
