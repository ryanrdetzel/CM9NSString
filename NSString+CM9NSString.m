//
//  NSString+CM9NSString.m
//
//  Created by Ryan Detzel on 3/8/14.
//  Copyright (c) 2014 Ryan Detzel. All rights reserved.
//

@implementation NSString (CM9NSString)


- (NSString *)slugalize{
    NSString *separator = @"-";
    NSMutableString *slugalizedString = [NSMutableString string];
    NSRange replaceRange = NSMakeRange(0, self.length);
    
    // Remove all non ASCII characters
    NSRegularExpression *nonASCIICharsRegex = [NSRegularExpression regularExpressionWithPattern:@"[^\\x00-\\x7F]+"
                                                                                        options:0
                                                                                          error:nil];
    slugalizedString = [[nonASCIICharsRegex stringByReplacingMatchesInString:self
                                                                     options:0
                                                                       range:replaceRange
                                                                withTemplate:@""] mutableCopy];
    
    // Turn non-slug characters into separators
    NSRegularExpression *nonSlugCharactersRegex = [NSRegularExpression regularExpressionWithPattern:@"[^a-z0-9\\-_\\+ ]+"
                                                                                            options:NSRegularExpressionCaseInsensitive
                                                                                              error:nil];
    slugalizedString = [[nonSlugCharactersRegex stringByReplacingMatchesInString:slugalizedString
                                                                         options:0
                                                                           range:NSMakeRange(0, slugalizedString.length)
                                                                    withTemplate:@""] mutableCopy];
    
    //Replace strings with dashses
    NSRegularExpression *spaceCharactersRegex = [NSRegularExpression regularExpressionWithPattern:@" "
                                                                                            options:NSRegularExpressionCaseInsensitive
                                                                                              error:nil];
    slugalizedString = [[spaceCharactersRegex stringByReplacingMatchesInString:slugalizedString
                                                                         options:0
                                                                           range:NSMakeRange(0, slugalizedString.length)
                                                                    withTemplate:separator] mutableCopy];
    
    // No more than one of the separator in a row
    NSRegularExpression *repeatingSeparatorsRegex = [NSRegularExpression regularExpressionWithPattern:[NSString stringWithFormat:@"%@{2,}", separator]
                                                                                              options:0
                                                                                                error:nil];
    slugalizedString = [[repeatingSeparatorsRegex stringByReplacingMatchesInString:slugalizedString
                                                                           options:0
                                                                             range:NSMakeRange(0, slugalizedString.length)
                                                                      withTemplate:separator] mutableCopy];
    
    // Remove leading/trailing separator
    slugalizedString = [[slugalizedString stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:separator]] mutableCopy];
    
    return [slugalizedString lowercaseString];
}

-(NSString *)reverse{
    NSMutableString *reversedStr;
    int len = [self length];
    
    // Auto released string
    reversedStr = [NSMutableString stringWithCapacity:len];
    
    // Probably woefully inefficient...
    while (len > 0)
        [reversedStr appendString:
         [NSString stringWithFormat:@"%C", [self characterAtIndex:--len]]];
    
    return reversedStr;
}


-(NSString *)camelCase{
    return [[self capitalizedString] stringByReplacingOccurrencesOfString:@" " withString:@""];
}

@end
