//
//  ViewController.m
//  MyIOSApp4
//
//  Created by lingdian on 17/8/25.
//  Copyright © 2017年 lingdian. All rights reserved.
//

#import "ViewController.h"
#import "BMI.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textResult;
@property (weak, nonatomic) IBOutlet UISwitch *switchSex;
@property (weak, nonatomic) IBOutlet UITextField *editHeight;
@property (weak, nonatomic) IBOutlet UITextField *editWeight;

@property (weak, nonatomic) IBOutlet UITextView *textAdvice;

@end

@implementation ViewController
- (IBAction)onCalculateBtnClick:(id)sender {
    
    float height=[self.editHeight.text floatValue];
    float weight=[self.editWeight.text floatValue];
    
    BOOL isError=[self checkEditTextHeight:height Weight:weight];
    if (!isError) {
        BOOL sex=self.switchSex.isOn;
        BMI* bmi=[[BMI alloc]initWithHeight:height Weight:weight Sex:sex];
        float value=[bmi bim];
        
        NSString* result= [bmi getBMIResult:value Sex:sex];
        NSMutableString* mutableStr=[[NSMutableString alloc]initWithString:result];
        [mutableStr appendFormat:@"(%.2f)",value];
        self.textResult.text=mutableStr;
        NSString* advice=[bmi getAdvice];
        self.textAdvice.text=advice;
        
    }
    
}
//检查输入框的情况
-(BOOL)checkEditTextHeight:(float)height Weight:(float)weight{
    NSMutableString* errorStr=[[NSMutableString alloc]initWithString:@"错误:"];
    
    BOOL isError=FALSE;
    if(height<=0){
        isError=TRUE;
        [errorStr appendString:@"无高度值"];
    }else if(weight<=0){
        isError=TRUE;
        [errorStr appendString:@"无体重值"];
    }
    

    if(isError){
        UIColor* redColor=[[UIColor alloc]initWithRed:1 green:0 blue:0 alpha:1];
        [self.textResult setBackgroundColor:redColor];
        self.textResult.text=errorStr;
    }else{
        UIColor* green=[[UIColor alloc]initWithRed:0 green:1 blue:0 alpha:1];
        [self.textResult setBackgroundColor:green];
        self.textResult.text=@"";
    }
    return isError;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
