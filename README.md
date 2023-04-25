Please read the [Legal Notice](#legal) before using.

## Usage

1. Clone the latest version of the project

```bash
git clone --depth=1 https://github.com/Tom60chat/Microsoft-Rewards-Farmer-Sharp.git
```

2. Packaging and compressing

```bash
tar zcvf Microsoft-Rewards-Farmer-Sharp.tar.gz Microsoft-Rewards-Farmer-Sharp/*
```

3. Build image

```bash
docker build -t myapp:latest .
```

4. Modify user information by editing the Settings.json file in the share directory. For more information, please refer to [Tom60chat/Microsoft-Rewards-Farmer-Sharp](https://github.com/Tom60chat/Microsoft-Rewards-Farmer-Sharp).

5. Start the container.

```bash
docker run -itd --name worker --restart=on-failure:3 -v `pwd`/share:/share -v `pwd`/local-chromium:/app/.local-chromium/ -v `pwd`/Profils:/app/Profils -v `pwd`/Logs:/app/Logs myapp
```

Success when you see the following message.

```txt
Directory 'share' exists.
Settings.json file is successfully replaced.
```


## <a id="legal">Legal Notice</a>

I am not responsible for what you do with this program, USE IT AT YOUR OWN RISK!
This program is made for education purposes, and I learned a lot about using puppetter 😋

Using this application on Microsoft services may cause Microsoft to disqualify you; deactivate your access to the Program or to your Rewards account.
Please read https://www.microsoft.com/en-us/servicesagreement/ in particular the Microsoft Rewards section.

Licensed under WTFPL
