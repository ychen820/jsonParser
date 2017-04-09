//
//  ActorClass.m
//  JSONXMLParse
//
//  Created by Nathan Chen on 4/8/17.
//  Copyright © 2017 RJTCOMPUQUEST. All rights reserved.
//

#import "ActorClass.h"

@implementation ActorClass

+(instancetype)actorWithName:(NSString *)name andDescription:(NSString *)actorDescription actorImage:(NSString *)image{
    ActorClass *actor=[[super alloc ]init];
    if(actor !=nil){
        actor.actorName=name;
        actor.actorDescription=actorDescription;
        actor.actorImage=image;
    }
    return actor;
}
+(instancetype)actorWithDictionary:(NSDictionary *)dict{
    ActorClass *actor=[ActorClass actorWithName:[dict valueForKey:@"name"] andDescription:[dict valueForKey:@"description"] actorImage:[dict valueForKey:@"image"]];
    return actor;
}
@end
