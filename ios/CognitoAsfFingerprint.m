#import "CognitoAsfFingerprint.h"
#import <AWSCognitoIdentityProviderASF/AWSCognitoIdentityProviderASF.h>

@implementation CognitoAsfFingerprint

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(sandfox:
                  (NSString*) userPoolId
                  username:(NSString *)username
                  deviceId:(nonnull NSString*)deviceId
                  userPoolClientId:(nonnull NSString*)userPoolClientId
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject
                  ){
    resolve([AWSCognitoIdentityProviderASF userContextData: userPoolId username:username deviceId:deviceId userPoolClientId:userPoolClientId]);
}

RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
{
    // TODO: Implement some actually useful functionality
    callback(@[[NSString stringWithFormat: @"numberArgument:: %@ stringArgument:: %@", numberArgument, stringArgument]]);
}

@end
