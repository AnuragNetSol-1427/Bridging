//
//  ToastIos.m
//  Bridging
//
//  Created by Anurag on 11/06/24.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ToastIos, NSObject)

RCT_EXTERN_METHOD(openToast : (NSString *) param)

@end
