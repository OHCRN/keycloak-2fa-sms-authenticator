# Keycloak 2FA SMS Authenticator

Keycloak Authentication Provider implementation to get a 2nd-factor authentication with a OTP/code/token send via SMS (through AWS SNS).

_Demo purposes only!_

Unfortunately, I don't have a real readme yet.
Blame on me!

But, for now, you can at least read my **blog post** about this autenticator here:
https://www.n-k.de/2020/12/keycloak-2fa-sms-authentication.html

Or, just watch my **video** about this 2FA SMS SPI:

[KEYCLOAK - 2FA with SMS based OTP text messages - DEMO](http://www.youtube.com/watch?v=GQi19817fFk "")

[KEYCLOAK - Conditional (2FA) Authentication - DEMO](http://www.youtube.com/watch?v=FHJ5WOx1es0 "")


### To run docker with a pre-configured realm:

1. Create a `.jar` file by running the `package` script from the Maven tool in IntelliJ. This will create a file called `dasniko.keycloak-2fa-sms-authenticator.jar` in the [/target](./target/) folder.
2. Run `docker-compose up -d` to start Postgres, Keycloak (`http://localhost:8088`) and Mailhog (`http://localhost:8025`).
3. Open the Keycloak Admin UI in the browser at `http://localhost:8088/admin`. The master realm admin user login credentials are the bitnami defaults:
```
Username: "user"
Password: "bitnami"
```

### To test 2FA Login with SMS and Email:

The imported `json` files contains all the configuration needed to test the custom 2FA extension with the Browser authentication flow, including one example user account to test each flow.

The Browser flow can be tested by logging into the [`Keycloak Account Console`](http://localhost:8088/realms/2fa-test).

#### To test the SMS flow:

1. Login with `user_with_phone@example.com`. Password = `"pass"`.
2. The SMS flow is configured to be in "Simulation Mode", which logs the code on the Keycloak server instead of sending an SMS message. When prompted for the SMS Code, check the Keycloak container logs for the message `***** SIMULATION MODE ***** Would send SMS to <mobilePhoneNumber> with text: Your one-time code is <one-time-code> and is valid for 5 minutes.`
3. Enter the one-time-code to complete the login.

#### To test the Email flow:

1. Login with `user_with_email@example.com`. Password = `"pass"`.
2. When prompted for the Email Code, check Mailhog for an email with the subject line "One-time passcode", which contains the one-time code.
3. Enter the code from the email to complete the login.


