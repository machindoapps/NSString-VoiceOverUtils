//
//  NSString+VoiceOverUtils.m
//
//  Created by David Haynes on 31/01/2013.
//  Copyright (c) 2013 Machindo Apps
//
//  MIT License: Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including without
//  limitation the rights to use, copy, modify, merge, publish, distribute,
//  sublicense, and/or sell copies of the Software, and to permit persons to
//  whom the Software is furnished to do so, subject to the following
//  conditions: The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software. THE SOFTWARE
//  IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR
//  A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//


#import "NSString+VoiceOverUtils.h"

@implementation NSString (VoiceOverUtils)

+(NSString *)ordinalForIntegerString:(NSString *)numberString {
	if([numberString integerValue] > 0) {
		NSString *retString = @"";
		unichar c = [numberString characterAtIndex:[numberString length]-1];
		switch (c) {
			case '1':
				retString = [numberString stringByAppendingFormat:@"st"];
				break;
			case '2':
				retString = [numberString stringByAppendingFormat:@"nd"];
				break;
			case '3':
				retString = [numberString stringByAppendingFormat:@"rd"];
				break;
			default:
				retString = [numberString stringByAppendingFormat:@"th"];
				break;
		}
		return retString;
	} else {
		return nil;
	}
}

+(NSString *)timeDescriptionForString:(NSString *)timeString {
	if([timeString length] > 5) {
		return nil;
	}
	
	int mins = [[timeString substringFromIndex:3] integerValue];
	
	if(mins < 10 && mins > -1) {
		NSString *description = [timeString substringToIndex:2];
		if(mins == 0) {
			description = [description stringByAppendingFormat:@" hundred"];
		} else {
			description = [description stringByAppendingFormat:@" oh %d", mins];
		}
		return description;
	} else {
		return timeString;
	}
}

@end
