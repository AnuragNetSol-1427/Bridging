//
//  TimePickerIos.m
//  Bridging
//
//  Created by Anurag on 10/06/24.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(TimePickerIos, NSObject)

RCT_EXTERN_METHOD(showTimePicker:(RCTResponseSenderBlock)callback)

@end
