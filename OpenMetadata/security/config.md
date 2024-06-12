# Install and configure open metadata

## openmetadata jwt config
RSA_PUBLIC_KEY_FILE_PATH="/etc/openmetadata/jwtkeys/public_key.der"
RSA_PRIVATE_KEY_FILE_PATH="/etc/openmetadata/jwtkeys/private_key.der"
JWT_ISSUER="casd.local" # update this as per your environment
JWT_KEY_ID="f72c3a8c-9cd8-4674-b797-7a6a7d5d5ae1" # update this to a unique uuid4

AUTHENTICATION_PUBLIC_KEYS=["https://datacatalog.casd.local/api/v1/config/jwks"]
AUTHENTICATION_AUTHORITY="https://datacatalog.casd.local"
AUTHORIZER_ADMIN_PRINCIPALS=[admin]
AUTHORIZER_ALLOWED_REGISTRATION_DOMAIN=["all"]
AUTHORIZER_PRINCIPAL_DOMAIN="casd.local"


## Configure SMTP server

Open metadata needs to send mail to allow user to change password or activate account.

Below is a smtp server config example. The login and password is in .creds

```shell
OM_EMAIL_ENTITY="CASD"
OM_SUPPORT_URL="https://casd.eu"
AUTHORIZER_ENABLE_SMTP=true
OPENMETADATA_SERVER_URL="https://datacatalog.casd.local"
OPENMETADATA_SMTP_SENDER_MAIL="datascience@casd.local"
SMTP_SERVER_ENDPOINT="smtp-relay.brevo.com"
SMTP_SERVER_PORT="587"
SMTP_SERVER_USERNAME="chagneMe"
SMTP_SERVER_PWD="changeMe"
SMTP_SERVER_STRATEGY="SMTP_TLS"
```

For the `SMTP_SERVER_STRATEGY`, in general case it depends on the server port:
- SMTP: If SMTP port is 25 use this
- SMTPS: If SMTP port is 465 use this
- SMTP_TLS: If SMTP port is 587 use this

