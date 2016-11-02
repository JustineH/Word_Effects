//
//  main.m
//  Word Effects (P*)
//
//  Created by Justine Herman on 10/31/16.
//  Copyright © 2016 Justine Herman. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int choice;
        // 255 unit long array of characters
        char inputChars[255];
        
        printf("Input a string: \r\n");
        // limit input to max 255 characters
        fgets(inputChars, 255, stdin);
        
        while (true)
        {
            // convert char array to an NSString object
            NSString *inputString = [NSString stringWithUTF8String:inputChars];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
     
            printf("Please choose one of the following operations for your string:\n 1 to uppercase it,\n 2 to lowercase it,\n 3 to numberize it,\n 4 to Canadianize it,\n 5 to receive a response, or\n 6 to de-space it.\n");
                   
            scanf("%d", &choice);

            switch (choice)
            {
                case 1: {
                    NSString *uppercaseString = [inputString uppercaseString];
                    NSLog(@"Result: %@", uppercaseString);
                    break;
                }
                case 2: {
                    NSString *lowercaseString = [inputString lowercaseString];
                    NSLog(@"Result: %@", lowercaseString);
                    break;
                }
                case 3: {
                    NSNumberFormatter *convertedString = [[NSNumberFormatter alloc] init];
                    
                    if ([convertedString numberFromString:inputString]) {
                        
                        int integerNumber = [inputString intValue];
                        NSLog(@"Result: %i", integerNumber);
                    } else {
                        NSLog(@"Sorry, can't make %@ string into a number.\n", inputString);
                    }
                    break;
                }
                case 4: {
                    NSString *canadianizedString = [inputString stringByAppendingString:@", eh?"];
                    NSLog(@"Result: %@\n", canadianizedString);
                    break;
                }
                case 5:
                    if ([inputString hasSuffix:@"?"]) {
                        printf("I don't know.\n");
                    } else if ([inputString hasSuffix:@"!"]) {
                        printf("Whoa, calm down!\n");
                    } else {
                        printf("No comment.\n");
                    }
                    break;
                case 6: {
                    NSString *spacesRemoved = [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"];
                    NSLog(@"Result: %@\n", spacesRemoved);
                    break;
                }
                default:
                    NSLog(@"Invalid entry. Please try again.\n");
                    break;
            }
        }
        
    }
    return 0;
}
