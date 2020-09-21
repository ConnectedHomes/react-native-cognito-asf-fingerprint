# react-native-cognito-asf-fingerprint

## Getting started

`$ npm install react-native-cognito-asf-fingerprint --save`

### Mostly automatic installation

_this shouldn't be needed if auto-linking is supported by your app's react-native version_

`$ react-native link react-native-cognito-asf-fingerprint`

## Usage
```javascript
import { getData } from 'react-native-cognito-asf-fingerprint';

// TODO: What to do with the module?
const advancedSecurityData = await getData(username, cognitoPoolId, cognitoApplicationId);

const UserContextData = {
	EncodedData: advancedSecurityData
}
```

## Notes
💡 check out the example app in demo
ℹ (/demo)
💡 recommended: run Metro Bundler in a new shell
ℹ (cd demo && yarn start)
💡 enter the following commands to run the example app:
ℹ cd demo
ℹ react-native run-android
ℹ react-native run-ios
⚠ first steps in case of a clean checkout
ℹ run Yarn in demo
ℹ (cd demo && yarn)
ℹ do `pod install` for iOS in demo/ios
ℹ (cd demo/ios && pod install)