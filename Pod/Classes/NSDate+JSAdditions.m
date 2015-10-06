//
//  JSDateFormatter.m
//  DateFormatter
//
//  Created by Jessie Serrino on 10/2/15.
//

#import "NSDate+JKAdditions.h"

static float const kSecondsInADay = 86400.00;

@implementation NSDate (JSAdditions)

- (BOOL) isToday
{
    return [[NSCalendar currentCalendar] isDateInToday:self];
}

- (BOOL) isYesterday
{
    return [[NSCalendar currentCalendar] isDateInYesterday:self];
}

- (BOOL) isPastWeek
{
    return [[[NSCalendar currentCalendar] startOfDayForDate:self] isWithinDaysFromToday:7];
}

- (BOOL) isPastTwoWeeks
{
    return [[[NSCalendar currentCalendar] startOfDayForDate:self] isWithinDaysFromToday:14];
}

- (BOOL) isPastMonth
{
    return [[[NSCalendar currentCalendar] startOfDayForDate:self] isWithinDaysFromToday:31];
}

- (BOOL) isPastYear
{
    return [[[NSCalendar currentCalendar] startOfDayForDate:self] isWithinDaysFromToday:365];
}

- (BOOL) isWithinDaysFromToday: (NSInteger) days
{
    NSTimeInterval timeInterval = [self timeIntervalSinceNow];
    float daysInterval = -timeInterval / kSecondsInADay;
    return daysInterval < days;
}

@end
