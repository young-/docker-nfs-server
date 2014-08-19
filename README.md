Docker NFS Server
================

##Suggested host properties
In the following setup the host is Ubuntu Trusty. I have also added `nfs` and `nfsd` to `/etc/modules` so these can be loaded at boottime. You do not need this if your dist have the modules compiled into the kernel.

Usage
----
```bash
docker run -d --name nfs --priviledged pandrew/nfs-server /path/to/share /path/to/share2 /path/to/shareN
```
