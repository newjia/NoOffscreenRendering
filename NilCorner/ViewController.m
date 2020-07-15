//
//  ViewController.m
//  NilCorner
//
//  Created by 李佳 on 2020/7/15.
//  Copyright © 2020 李佳. All rights reserved.
//

#import "ViewController.h"
#import "DemoCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *tbView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    tbView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tbView.delegate = self;
    tbView.dataSource = self;
    [tbView registerClass:[DemoCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tbView];

}
#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    DemoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[DemoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
 
    return cell;
}

#pragma mark - UITableView Delegate methods

 

@end
