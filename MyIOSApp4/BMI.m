//
//  BMI.m
//  MyIOSApp4
//
//  Created by lingdian on 17/8/26.
//  Copyright © 2017年 lingdian. All rights reserved.
//

#import "BMI.h"

@implementation BMI

-(instancetype)initWithHeight:(float)pHeight Weight:(float)pWeight Sex:(BOOL)pSex{
    if (self=[super init]) {
        self.height=pHeight;
        self.weight=pWeight;
        _sex=pSex;
    }
    return self;
}
-(float)bim{
    return  self.weight*100.0*100.0/(self.height*self.height);
}
//该身高情况下 正常的体重的最大值
-(float)normalMaxWeight{
    float normalBmi=ZHENGCHANG_M;
    if(!self.sex){
        normalBmi=normalBmi-DISTANCE;
    }
    return self.height*self.height/10000.0*normalBmi;
}
-(NSString*)getAdvice{
    float maxValue=[self normalMaxWeight];
    float minValue=[self normalMinWeight];
    float target=0;
    if(maxValue<self.weight){//胖了
        target=self.weight-maxValue;
        NSString* result=[[NSString alloc]initWithFormat:@"您现在太胖了(%.2f kg)\n距离最大标准体重(%.2f kg)还需减%.2f(kg)",self.weight, maxValue,target];
        return result;
    }else if(minValue>self.weight){//瘦了
        target=minValue-self.weight;
        NSString* result=[[NSString alloc]initWithFormat:@"您现在太瘦了(%.2f kg)\n距离最小标准体重(%.2f kg)还需要增%.2f(kg)",self.weight,minValue,target];
        return result;
    }else{//正常
        return @"你现在很健康";
    }
}

//该身高情况下 正常的体重的最小值
-(float)normalMinWeight{
    float normalBmi=PIANSHOU_M;
    if(!self.sex){
        normalBmi=normalBmi-DISTANCE;
    }
    return self.height*self.height/10000.0*normalBmi;
}



-(NSString*)getBMIResult:(float)result Sex:(BOOL)isMale{
    
    if(!isMale){
        result=result-DISTANCE;
    }
        if (result<=PIANSHOU_M) {
            return @"偏廋";
        }else if(result<=ZHENGCHANG_M){
            return @"正常";
        }else if(result<=PIANPANG_M){
            return @"偏胖I";
        }else if(result<=FEIPANG_M){
            return @"肥胖II";
        }else if(result<=ZHOGNDU_M){
            return @"重度肥胖III";
        }else{
            return @"极度肥胖IV";
        }
    
}
@end
