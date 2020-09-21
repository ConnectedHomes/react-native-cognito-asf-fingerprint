#import "CognitoAsfFingerprint.h"
#import <AWSCognitoIdentityProviderASF/AWSCognitoIdentityProviderASF.h>
#import <UICKeyChainStore.h>

@implementation CognitoAsfFingerprint

RCT_EXPORT_MODULE()

// inlined from https://github.com/aws-amplify/aws-sdk-ios/blob/main/AWSCognitoAuth/AWSCognitoAuth.m
static NSString * AWSCognitoAuthAsfDeviceId = @"asf.device.id";

/**
 * Get a namespaced keychain key given a namespace and key
 */
- (NSString *) keyChainKey: (NSString *) namespace key:(const NSString *) key {
    return [NSString stringWithFormat:@"%@.%@", namespace, key];
}

RCT_EXPORT_METHOD(getData:
                  (NSString*) userPoolId
                  username:(NSString *)username
                  userPoolClientId:(nonnull NSString*)userPoolClientId
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject
                  ){
	// Hacky inlining
	UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:[NSString stringWithFormat:@"%@.%@", [NSBundle mainBundle].bundleIdentifier, @"AWSCognitoIdentityUserPool"]];  //Consistent with AWSCognitoIdentityUserPool
    NSString * asfDeviceIdKey = [self keyChainKey:userPoolClientId key:AWSCognitoAuthAsfDeviceId];
    NSString * asfDeviceId = keychain[asfDeviceIdKey];
    if(asfDeviceId == nil){
        asfDeviceId = [[[NSUUID UUID] UUIDString] lowercaseString];
        keychain[asfDeviceIdKey] = asfDeviceId;
    }

    resolve([AWSCognitoIdentityProviderASF userContextData: userPoolId username:username deviceId:asfDeviceId userPoolClientId:userPoolClientId]);
}

@end
