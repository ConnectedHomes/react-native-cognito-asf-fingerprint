package uk.co.sandfox.cognito_asf_fingerprint;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Promise;

import com.amazonaws.cognito.clientcontext.data.UserContextDataProvider;

public class CognitoAsfFingerprintModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public CognitoAsfFingerprintModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "CognitoAsfFingerprint";
    }

    @ReactMethod
    public void getData(String poolId, String userId, String appId, Promise promise) {
        try {
            String userContextData = null;
            UserContextDataProvider dataProvider = UserContextDataProvider.getInstance();
            userContextData = dataProvider.getEncodedContextData(this.reactContext, userId, poolId, appId);
            promise.resolve(userContextData);
        } catch (Exception e) {
            promise.reject(e);
        }
    }
}
