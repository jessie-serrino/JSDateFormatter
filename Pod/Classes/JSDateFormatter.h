//
//  JSDateFormatter.m
//  DateFormatter
//
//  Created by Jessie Serrino on 10/2/15.
//

#import <Foundation/Foundation.h>

@interface JSDateFormatter : NSObject

+ (NSString *) formattedDateStringWithDate: (NSDate *) date;

+ (NSString *) formattedTimeStringWithDate: (NSDate *) date;

@end
