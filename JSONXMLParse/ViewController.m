//
//  ViewController.m
//  JSONXMLParse
//
//  Created by Balu Naik on 4/7/17.
//  Copyright © 2017 RJTCOMPUQUEST. All rights reserved.
//

#import "ViewController.h"
#import "UserTableViewCell.h"
#import "ActorClass.h"
@interface ViewController ()
@property(nonatomic,strong)NSMutableArray *arrayActors;
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayActors=[[NSMutableArray alloc]init];
    self.tblView.estimatedRowHeight = 107;
    self.tblView.rowHeight = UITableViewAutomaticDimension;
    [self callApiForActorsInformation];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)callApiForActorsInformation{
 
    NSURL *url = [NSURL URLWithString:RESTAPI];
    [[[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error  == nil) {
            NSError *jsonError = nil;
            NSDictionary  *jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                for(NSDictionary *item in [jsonData valueForKey:@"actors"]){
                    ActorClass *newEntry=[ActorClass actorWithDictionary:item];
                    [self.arrayActors addObject:newEntry];
                }
                NSLog(@"%@",self.arrayActors);
                [self.tblView reloadData];

            });
            
        }
    }] resume];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.arrayActors.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"UserTableViewCell";
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    ActorClass *actor = [self.arrayActors objectAtIndex:indexPath.row];
    NSLog(@"%@",actor);
    cell.userNamelbl.text = actor.actorName;
    cell.descrptLbltext.text = actor.actorDescription;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(queue, ^{
        NSData *dataImg = [NSData dataWithContentsOfURL:[NSURL URLWithString:actor.actorImage]];
        
        UIImage *img = [UIImage imageWithData:dataImg];
        if (img) {
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.imgUser.image = img;
 
            });
        }

    });
    
    
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
