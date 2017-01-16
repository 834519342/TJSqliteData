# TJSqliteData

- (instancetype)initWithDBName:(NSString *)dbName TableName:(NSString *)tableName;

//插入一个数据
- (BOOL)insertData:(DataModel *)dataModel TableName:(NSString *)tableName;

//更新一个数据
- (BOOL)updateData:(DataModel *)dataModel TableName:(NSString *)tableName;

//删除一个数据
- (BOOL)deleteData:(DataModel *)dataModel TableName:(NSString *)tableName;

//删除数据库表
- (BOOL)deleteTable:(NSString *)tableName;

//获取一个数据
- (DataModel *)getData:(DataModel *)dataModel Table:(NSString *)tableName;

//获取所有用户
- (NSArray *)getAllDataTableName:(NSString *)tableName;
