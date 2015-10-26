# BestPractice
记录工作中的最佳实践

# Project创建多个target用来区分不同的开发环境

由于项目需求同一项目需要区分开发版本、测试版本、发布候版本和发布版本，所以同一Project创建多个target比较适合。

## 对原有的target做duplicate

在原来的target上右键，选择duplicate，Xcode会复制一个名为A copy的target对象，同时生成一个A copy-info.plist和A copy的scheme。

### 改名

1. 对A copy target改名，可以直接单击target来修改，改成B。
2. A copy-info.plist，默认生成在程序环境根目录，也就是A.xcodeproj的同级目录中，如果想放到里层（比如与A-info.plist放在同级目录），可以先在Xcode删除A copy-info.plist索引，然后拷贝文件到指定目录中，然后更名为B-info.plist，在add到project中。
3. 在Project的Build Settings中，修改Info.plist File选项为B-info.plist的目录（相对路径）,这样就可以看到Info页了（就是B-info.plist）。
4. 修改ProductName和Bundle identifier，使之成为另一个app。
5. Prefix Header的路径，视具体需求而定是否要修改，如果两个target可以公用同一个Prefix Header，那么就不需要修改这里的路径。
6. 修改scheme，在调试的Stop按钮边上，我们可以选择本工程中所有的target来做编译，如果不修改，在这里选择出来的名字就是A copy，为了与新建的target统一起来，同样也要修改这里的名字。点击scheme选择区，然后选Manager Scheme，找到A copy，然后改成你需要的名字，比如B。

> 用duplicate的好处是，如果两个target的相同点很多，用duplicate，就可以把相关的设置全部拷贝过来，而不需要做过多的修改。

## 利用宏来标志每个版本

生成一个新的target，一定会与原target有区别，这里可以定义预编译宏，来区分两个版本的不同代码，预编译宏可以在Build Settings中Preprocessor Macros定义，比如在我们新建的target B中定义预编译宏MACRO，然后在代码中通过下面这样来区分。

```
#if defined (MACRO)
//target  B需要执行的代码
#else
//target A需要执行的代码
#endif
```

## 其他

Build Phases（各target编译所包含的内容需要注意的是，如果创建了target B后，再往A里面添加资源或文件，target B中不会自动增加这些资源，需要手动添加）。

1. Compile Sources：需要编译的代码文件
2. Link Binary With Libraries：编译所依赖的库
3. Copy Bundle Resources：编译需要的资源

每个target可以根据具体需要增减里面的内容。
