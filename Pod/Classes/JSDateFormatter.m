//
//  JSDateFormatter.m
//  DateFormatter
//
//  Created by Jessie Serrino on 10/2/15.
//

#import "JSDateFormatter.h"
#import "NSDate+JSAdditions.h"

@implementation JSDateFormatter

+ (NSString *) formattedTimeStringWithDate: (NSDate *) date
{
    if (date) {
        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
        timeFormatter = [[NSDateFormatter alloc] init];
        timeFormatter.timeStyle = NSDateFormatterShortStyle;
        return [timeFormatter stringFromDate:date];
    }
    return nil;
}

+ (NSString *) formattedDateStringWithDate: (NSDate *) date
{
    if (date) {
        if ([date isToday]) {
            return @"Today";
        } else if ([date isYesterday]) {
            return @"Yesterday";
        } else if ([date isPastWeek]) {
            return [JSDateFormatter dayFromDate:date abbreviated:NO];
        } else if ([date isPastTwoWeeks]) {
            return [@"Last " stringByAppendingString:[JSDateFormatter dayFromDate:date abbreviated:YES]];
        } else if ([date isPastYear]) {
            return [JSDateFormatter monthAndDayWithPostfix:date abbreviatedMonth: NO withYear:NO];
        } else {
            return [JSDateFormatter monthAndDayWithPostfix:date abbreviatedMonth: YES withYear:YES];
        }
    }
    return nil;
}

+ (NSString *) monthAndDayWithPostfix: (NSDate *) date abbreviatedMonth: (BOOL) abbreviatedMonth withYear: (BOOL) withYear
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    
    NSString *monthName = [JSDateFormatter monthFromDate:date abbreviated:abbreviatedMonth];
    NSString *dayWithPostfix = [JSDateFormatter dayWithPostfix:components.day];
    NSString *yearString = withYear ? [NSString stringWithFormat:@", %li", components.year] : @"";
    
    return [[[monthName stringByAppendingString: @" "] stringByAppendingString: dayWithPostfix] stringByAppendingString: yearString];
}

+ (NSString *) monthFromDate: (NSDate *) date abbreviated: (BOOL) isAbbreviated
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *monthNameFormat = [NSDateFormatter dateFormatFromTemplate:@"MMMM" options:0 locale:[NSLocale currentLocale]];
    
    if (isAbbreviated) {
        monthNameFormat = [NSDateFormatter dateFormatFromTemplate:@"MMM" options:0 locale:[NSLocale currentLocale]];
    }
    [dateFormatter setDateFormat:monthNameFormat];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *) dayFromDate: (NSDate *) date abbreviated: (BOOL) isAbbreviated
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *dayNameFormat = [NSDateFormatter dateFormatFromTemplate:@"EEEE" options:0 locale:[NSLocale currentLocale]];

    if (isAbbreviated) {
        dayNameFormat = [NSDateFormatter dateFormatFromTemplate:@"EEE" options:0 locale:[NSLocale currentLocale]];
    }
    [dateFormatter setDateFormat:dayNameFormat];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *) dayWithPostfix: (NSInteger) day
{
    return [NSString stringWithFormat:@"%li%@", day, [JSDateFormatter postfixForDay:day]];
}

+ (NSString *) postfixForDay: (NSInteger) day
{
    NSInteger mod10 = day % 10;
    NSInteger div10 = day / 10;
    NSString *postFix = @"th";
    
    if (mod10 == 1 && div10 != 1) {
        postFix = @"st";
    } else if (mod10 == 2 && div10 != 1 ) {
        postFix = @"nd";
    } else if (mod10 == 3 && div10 != 1) {
        postFix = @"rd";
    }
    return postFix;
}

@end
