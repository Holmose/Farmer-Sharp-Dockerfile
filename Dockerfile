FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# 复制项目文件并进行构建
WORKDIR /app
ADD Microsoft-Rewards-Farmer-Sharp.tar.gz .
RUN cp -rf Microsoft-Rewards-Farmer-Sharp/* /app/ && dotnet publish -c Release -o out

# 构建运行容器
FROM mcr.microsoft.com/dotnet/runtime:6.0
WORKDIR /app
COPY --from=build /app/out ./
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y libglib2.0-0 \
        libnss3 libatk-bridge2.0-0 libatk1.0-0 \
        libcups2 libdrm2 libxcomposite1 libxdamage1 \
        libxfixes3 libxrandr2 libgbm1 libxkbcommon0 \
        libpango1.0-0 libasound2
# 安装tzdata软件包并设置时区
RUN apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
# 指定用户数据目录
VOLUME /share/
# 设置容器的入口点为 C# 程序
ENTRYPOINT ["/docker-entrypoint.sh"]
#CMD ["dotnet", "Microsoft Rewards Farmer.TUI.dll"]
CMD ["bash", "-c", "dotnet 'Microsoft Rewards Farmer.TUI.dll' -a --disable-gpu,--no-sandbox | stdbuf -o0 sed \"s/^/$(date -u +%FT%T.%N) /\" "]
