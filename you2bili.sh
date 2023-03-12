#!/bin/bash
mkdir biliupdir \
&& cd biliupdir \
&& pip install biliup \
&& wget -c http://ghproxy.com/https://github.com/ForgQi/biliup-rs/releases/download/v0.1.15/biliupR-v0.1.15-x86_64-linux.tar.xz \
&& tar -xvf ./biliupR-v0.1.15-x86_64-linux.tar.xz \
&& mv biliupR-v0.1.15-x86_64-linux/ biliupR

# 修改 config.toml 文件，添加需要被监控的直播间，自定义添加直播间
cat >config.toml <<EOF
# 以下为必填项
[streamers."Lofi Girl"] # 设置直播间1
url = ["https://www.youtube.com/watch?v=jfKfPfyJRdk"]
tags = ["安静学习"]

# 设置直播间2
[streamers."在线追逐"]
url = ["https://www.youtube.com/watch?v=iNRIA8HE0DA"]
tags = ["追逐"]
EOF

# 扫码登录 B站登录

biliupR/biliup login && mv biliupR/cookies.json ./ && biliup start
