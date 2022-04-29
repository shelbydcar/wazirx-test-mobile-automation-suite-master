import pyotp
from robot.api.deco import keyword


class CustomLib:

    @keyword('authenticator otp')
    def get_Authenticator_OTP(self, secretcode ):
        totp = pyotp.TOTP(secretcode)
        OTP = totp.now()
        return OTP

