# hello task example

```
./testrun.sh
```

適用したリソースを確認。
```
# tkn task list
NAME               AGE
echo-hello-world   1 minute ago
# tkn taskrun list
NAME                        STARTED        DURATION     STATUS      
echo-hello-world-task-run   1 minute ago   16 seconds   Succeeded   
```

実行結果をtaskrunより確認

```
# tkn taskrun logs -f echo-hello-world-task-run
[echo] hello
```
