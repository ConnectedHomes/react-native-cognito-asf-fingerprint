import { NativeModules, Platform } from 'react-native';
const { CognitoAsfFingerprint } = NativeModules;

// getData - this API matches the web one
export const getData = async (username, userPoolId, clientId) => {
	// TODO: handle fallback if not running on web ? bundle in aws-asf web library?
	 // TODO: check if we need to handle username === undefined
	 let advancedSecurityData = await CognitoAsfFingerprint.getData(userPoolId, username, clientId);
	 // ASF on android outputs RFC 2045 compatible outout - which means line breaks every 64 characters.
	 // some base64 decoders choke on this and it's not consistent with ios output
	 if (Platform.OS === 'android') {
	 	advancedSecurityData = advancedSecurityData.replace(/\n/g, "")
	 }
	 return advancedSecurityData
}

export const deviceId = async() => {
	// TODO: read the device id?
	// for now useGetData and decode it yourself :-p
}

export const resetDeviceId = async() => {
	// TODO - remove the value stored in sharedprefs / keychain
}