//
//  UAXWordsListViewController.m
//  Diccionario
//
//  Created by Juan Jose Ramirez Escribano on 9/1/15.
//  Copyright (c) 2015 UAX. All rights reserved.
//

#import "UAXWordsListViewController.h"
#import "UAXDefinitionViewController.h"

#define kWordCellIdentifier @"kWordCellIdentifier"

@interface UAXWordsListViewController ()

@property (strong, nonatomic) NSArray *words;

@end

@implementation UAXWordsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Lista de palabras";
    
    self.words = @[@"casa",
                   @"perro",
                   @"ordenador",
                   @"croqueta"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kWordCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.words.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kWordCellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.words objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *word = [self.words objectAtIndex:indexPath.row];
    
    // Aviso a mi delegado, si es que tengo delegado
    [self.delegate wordSelected:word];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        UAXDefinitionViewController *defVC = [[UAXDefinitionViewController alloc] initWithWord:word];
        [self.navigationController pushViewController:defVC animated:YES];
    }

    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}















@end
