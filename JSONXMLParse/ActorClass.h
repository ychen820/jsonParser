//
//  ActorClass.h
//  JSONXMLParse
//
//  Created by Nathan Chen on 4/8/17.
//  Copyright © 2017 RJTCOMPUQUEST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActorClass : NSObject
@property(nonatomic,strong) NSString *actorName;
@property(nonatomic,strong) NSString *actorDescription;
@property(nonatomic,strong) NSString *actorImage;
+(instancetype)actorWithDictionary:(NSDictionary *)dict;
+(instancetype)actorWithName:(NSString *)name andDescription:(NSString *)actorDescription actorImage:(NSString *)image;

@end
