//
//  DatePickerIos.m
//  Bridging
//
//  Created by Anurag on 10/06/24.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(DatePickerIos, NSObject)

RCT_EXTERN_METHOD(showDatePicker:(RCTResponseSenderBlock)callback)

@end
