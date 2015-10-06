//
//  JSDateFormatter.m
//  DateFormatter
//
//  Created by Jessie Serrino on 10/2/15.
//

#import <Foundation/Foundation.h>

@interface NSDate (JSAdditions)

- (BOOL) isToday;

- (BOOL) isYesterday;

- (BOOL) isPastWeek;

- (BOOL) isPastTwoWeeks;

- (BOOL) isPastMonth;

- (BOOL) isPastYear;

- (BOOL) isWithinDaysFromToday: (NSInteger) days;

@end
