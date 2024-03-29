## 使用

### 源文件

将学生的源文件在文件夹 `ex/student-name/` 下按照题号进行排列，如在 `ex/student1` 下，源文件如下，按照题号名+ `.c` 或其他 `.cpp` 等的格式放置

```
1.c
2.cpp
```

### 题目输入

在 `input` 下放置输入文件，后缀为 `.txt` ，格式为 `{pre}-{aft}.txt` ，其中 `{pre}` 为源文件对应的题号， `{aft}` 对应不同的输入，以 `{aft}` 为标识符将在源文件夹下生成对应的输出文件

```
1-1.txt
1-test.txt
2.txt
```

如果本题无需输入则不用创建输入文件

### 运行

在根目录运行脚本 `run.py` ，在源文件同文件夹的地方生成输出文件，如 `1.txt`

## 更新

* 2022.10.27: 添加对死循环/超时的反馈，并将生成文件放置于源文件同文件夹
* 2022.11.3: 
    - 将所有命令转化为python支持的api，因此可以在windows下运行该脚本了
    - 支持了多文件输入并输出对应的文件
