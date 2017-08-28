//
//  BMI.h
//  MyIOSApp4
//
//  Created by lingdian on 17/8/26.
//  Copyright © 2017年 lingdian. All rights reserved.
//

#import <Foundation/Foundation.h>
#define PIANSHOU_M 18.5
#define ZHENGCHANG_M 23.9
#define PIANPANG_M 24.9
#define FEIPANG_M 30
#define ZHOGNDU_M 40

#define DISTANCE 2

#define PIANSHOU 1
#define ZHENGCHANG 2
#define PIANPANG 3
#define FEIPANG 4
#define ZHOGNDU 5
#define JIDU 6

@interface BMI : NSObject
@property(nonatomic)float height,weight;
@property(nonatomic)BOOL sex;
-(instancetype)initWithHeight:(float)pHeight Weight:(float)pWeight Sex:(BOOL)pSex;
-(float)bim;

-(int)getBmiLevel:(float)result Sex:(BOOL)isMale;
-(NSString*)getAdvice;
-(NSString*)getBMIResult:(float)result Sex:(BOOL)isMale;


@end
