//
//  main.m
//  Word Effects
//
//  Created by Errol Cheong on 2017-06-26.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>

int charStringToInt(NSString *inputString) {
    //Numberize
    int numberizeString = inputString.intValue;
    
    //Check if number is more or less than 0
    if (numberizeString > 0 || numberizeString < 0) {
        
        return numberizeString;
        
        //Check if the zero is caused by number 0 or strings
    } else {
        //Replace 0 with empty spaces
        NSString * modInputString = [inputString stringByReplacingOccurrencesOfString:@"0" withString:@""];
        
        //If Empty string, then its a 0 digit
        if ([modInputString isEqualToString:@"\n"]){
            return 0;
            //Else, it is a string
        } else {
            return -1;
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 255 units long array of character
        char inputChars[255];
        char inputChoice[255];
        BOOL runProgram = YES;
        do{
            //Request input for questions
            NSLog(@"Menu Options (Please choose 0 to 5):\n"
                  "0 - Uppercase\n"
                  "1 - Lowercase\n"
                  "2 - Numberize\n"
                  "3 - Canadianize\n"
                  "4 - Respond\n"
                  "5 - Despace\n"
                  "Enter any other key to exit\n");
            fgets(inputChoice, 255, stdin);
            NSString *choiceString = [NSString stringWithUTF8String:inputChoice];
            int choice = charStringToInt(choiceString);
            fpurge(stdin);
            
            //Assignment Questions:
            switch (choice) {
                    
                case 0:
                {
                    //Obtain input with 255 characters max
                    NSLog(@"Please input a string to uppercase:");
                    fgets(inputChars, 255, stdin);
                    
                    NSString *inputString = [NSString stringWithUTF8String:inputChars];
                    //Uppercase
                    NSString *upperString = [inputString uppercaseString];
                    NSLog(@"%@", upperString);
                    sleep(2);
                    break;
                }
                    
                case 1:
                {
                    NSLog(@"Please input a string to lowercase:");
                    fgets(inputChars, 255, stdin);
                    
                    NSString *inputString = [NSString stringWithUTF8String:inputChars];
                    //Lowercase
                    NSString *lowerString = [inputString lowercaseString];
                    NSLog(@"%@", lowerString);
                    sleep(2);
                    break;
                }
                    
                case 2:
                {
                    NSLog(@"Please input a string to numberize:");
                    fgets(inputChars, 255, stdin);
                    
                    NSString *inputString = [NSString stringWithUTF8String:inputChars];
                    int numberizeString = charStringToInt(inputString);
                    if (numberizeString == -1) {
                        NSLog(@"Unable to convert non-digit string");
                    } else {
                        NSLog(@"%i", numberizeString);
                    }
                    sleep(2);
                    break;
                }
                    
                case 3:
                {
                    NSLog(@"Please input a string to canadianize:");
                    fgets(inputChars, 255, stdin);
                    
                    NSString *inputString = [NSString stringWithUTF8String:inputChars];
                    //Canadianize
                    NSString *canadianString = [[NSString alloc] initWithFormat:@"%@%@", [inputString stringByReplacingOccurrencesOfString:@"\n" withString:@""], @", eh?"];
                    NSLog(@"%@", canadianString);
                    sleep(2);
                    break;
                }
                    
                case 4:
                {
                    NSLog(@"Please input a string to respond:");
                    fgets(inputChars, 255, stdin);
                    
                    NSString *inputString = [NSString stringWithUTF8String:inputChars];
                    //Respond
                    NSString *responseString = [inputString substringFromIndex:[inputString length] - 2];
                    if ([responseString isEqualToString:@"?\n"]) {
                        NSLog(@"I don't know");
                    } else if ([responseString isEqualToString:@"!\n"]) {
                        NSLog(@"Whoa, calm down!");
                    } else {
                        NSLog(@"Neither question nor statement");
                    }
                    sleep(2);
                    break;
                }
                    
                case 5:
                {
                    NSLog(@"Please input a string to despace:");
                    fgets(inputChars, 255, stdin);
                    
                    NSString *inputString = [NSString stringWithUTF8String:inputChars];
                    //De-Space-It
                    NSString *despaceString = [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"];
                    NSLog(@"%@", despaceString);
                    sleep(2);
                    break;
                }
                    
                default:
                    runProgram = NO;
                    break;
            }
        } while (runProgram);
    }
    return 0;
}
