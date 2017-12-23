Assuming that local and remote have conflicting commits

```
$ git rev-list --left-right @...@{u}
<07c1dae04420fa9d2873b32c76c5b6443d48ba8b
>19a5ddb53c42715eaed8959d929cbbda002d6ffa
>b8ee8ec2f8d50f0338f07a7eeaa6e505d91f0244
$ git rev-list --left-right --count @...@{u}
1       2
```

