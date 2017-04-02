#! /bin/bash
/bin/bash
/bin/nslcd && sleep 5
/usr/bin/echo "Creating DB edt.org..."
/usr/bin/echo "admin" | kinit admin/admin
cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
rm -rf /etc/openldap/slapd.d/*
slaptest -f /opt/docker/slapd-edt.org.acl.conf -F /etc/openldap/slapd.d
chown -R ldap.ldap /etc/openldap/slapd.d/
chown -R ldap.ldap /var/lib/ldap/
/usr/sbin/slapd
/usr/bin/echo "Contacting to master LDAP, Wait please..." && sleep 15
kdestroy
/usr/bin/echo "Thanks for Waiting , Done"
