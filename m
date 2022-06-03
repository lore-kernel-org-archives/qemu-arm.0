Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5423949lfh;
        Fri, 3 Jun 2022 00:18:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwialPNfUMWnUaRbn2kVE5jXJ0/uQq+WByRreQKnMM2koZetOBFjCjFUWlwDLgCwzpA+wXi
X-Received: by 2002:a05:620a:2848:b0:67d:35de:bb5b with SMTP id h8-20020a05620a284800b0067d35debb5bmr5340938qkp.499.1654240718779;
        Fri, 03 Jun 2022 00:18:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654240718; cv=none;
        d=google.com; s=arc-20160816;
        b=XA1dIcq44LIPCuIg4JObue3p/2N8vBEx3TV4hqnBGLUmBS8koopX6n+E3BoWozJ8o4
         NMyWMR492vWFzkndqy2juGObkI5WngUwL6HbJp9KzZ+hk1uJhzNAL+6ISPhJAEyUvGAZ
         bFXwon/GWIor1IKgffq6xWFfJbttjyFocxWLhMocIMmqYmMwbQ230MxcBioOQxBSpyqr
         AnHVuAizUUiUl21hOtZShUfNaG0GaqFkRSfkb8Uc/xRKTZ9KMmCSiyQpj2PrRf8sRcM2
         23tJBOLa/nhySKn90YZYqFbufFapUdLKqqHh4cW9mUFxMtxp3VQ5433DvJrVvmFmVT68
         +ZMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=BDfP+X+fLD5JXVEUuPExL1/3i5qMFaC6J6dm0GfSgqY=;
        b=GYJVi2HeopxFmFVGfj06IZs8FE2St7rTr1BOEXPRFA1ZGF+Mo9pfaLOtaPgU50pXuI
         Tr2lg3YfUPQO3Onb+Xu7svIdhTrcL6th+8VZNh+ydC+YEc9u3yYKqmedVveeeU0ufLk4
         OOKLDwlrU902cGspyabzyDXa2nSpVbboQPPxZvqHBnJoPYSGzdUo8Mz7jJNPEFouqe/o
         pkCLAyegjeA++IGIyjxlDxoMLaHWaSgS/wb41t7swuu6uu/nI6k50Kp7Eths6rN153wH
         Z8ssbhSO35SYe+/mbYVHHEgmwrJVvvYDsD9z8xL52dPCIX60LhgDloNaTWSy/IaJTyn9
         xXnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020ac85ac9000000b003024d8709bbsi3125097qtd.246.2022.06.03.00.18.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jun 2022 00:18:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nx1Zu-0003xq-3K
	for alex.bennee@linaro.org; Fri, 03 Jun 2022 03:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nx1PR-0003oJ-Cs
 for qemu-arm@nongnu.org; Fri, 03 Jun 2022 03:07:49 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:44377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nx1PN-0007xJ-P4
 for qemu-arm@nongnu.org; Fri, 03 Jun 2022 03:07:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BD06A10714B9E;
 Fri,  3 Jun 2022 09:07:34 +0200 (CEST)
Received: from kaod.org (37.59.142.108) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 3 Jun 2022
 09:07:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002247641a2-916c-4550-968a-14e4aceb021e,
 2F375BC487B398842DD9155F09582B226C9A4747) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <79ba2e1a-569c-6583-6cfd-13389355bfa3@kaod.org>
Date: Fri, 3 Jun 2022 09:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v2 0/6] hw/i2c: i2c slave mode support
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>
CC: <qemu-devel@nongnu.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 <qemu-arm@nongnu.org>, Peter Delevoryas <pdel@fb.com>, Peter Maydell
 <peter.maydell@linaro.org>, Corey Minyard <cminyard@mvista.com>, Padmakar
 Kalghatgi <p.kalghatgi@samsung.com>, Damien Hedde
 <damien.hedde@greensocs.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Arun Kumar Kashinath Agasar <arun.kka@samsung.com>, Klaus
 Jensen <k.jensen@samsung.com>
References: <20220601210831.67259-1-its@irrelevant.dk>
 <6e0eb197-25c2-6b1e-2c19-f93597e29cff@kaod.org> <YphzHGNYErSMEfPw@apples>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YphzHGNYErSMEfPw@apples>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fcea833a-06cf-4488-9e69-873d2eaa6ca6
X-Ovh-Tracer-Id: 12913508982122515387
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrleehgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffgefgkeevvedvvdffleefheelfffhhfetgeekudeuveffffekjeeiveffledthfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepkhdrjhgvnhhsvghnsehsrghmshhunhhgrdgtohhmpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QLEdZH+WOl0a

>>> With this combined I am able to boot up Linux on an emulated Aspeed 2600
>>> evaluation board and have the i2c echo device write into a Linux slave
>>> EEPROM. Assuming the echo device is on address 0x42:
>>>
>>>     # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-15/new_device
>>>     i2c i2c-15: new_device: Instantiated device slave-24c02 at 0x64
>>>     # i2cset -y 15 0x42 0x64 0x00 0xaa i
>>>     # hexdump /sys/bus/i2c/devices/15-1064/slave-eeprom
>>>     0000000 ffaa ffff ffff ffff ffff ffff ffff ffff
>>>     0000010 ffff ffff ffff ffff ffff ffff ffff ffff
>>>     *
>>>     0000100
>>
>> I have started working on buildroot images  :
>>
>>    https://github.com/legoater/buildroot/commits/aspeed
>>
>> The resulting files are quite small :
>>
>>      $ ll output/images/
>>      total 86040
>>      drwxr-xr-x 2 legoater legoater     4096 Jun  1 20:01 ./
>>      drwxrwxr-x 6 legoater legoater     4096 Jun  1 19:40 ../
>>      -rwxr-xr-x 1 legoater legoater    36837 Jun  1 20:01 aspeed-ast2600-evb.dtb*
>>      -rw-r--r-- 1 legoater legoater 67108864 Jun  1 20:01 flash.img
>>      -rw-r--r-- 1 legoater legoater  6682796 Jun  1 20:01 image.itb
>>      -rw-r--r-- 1 legoater legoater     1846 Jun  1 20:01 image.its
>>      -rw-r--r-- 1 legoater legoater  3168768 Jun  1 20:01 rootfs.cpio
>>      -rw-r--r-- 1 legoater legoater  1026660 Jun  1 20:01 rootfs.cpio.xz
>>      -rw-r--r-- 1 legoater legoater  3788800 Jun  1 20:01 rootfs.tar
>>      -rw-r--r-- 1 legoater legoater   653777 Jun  1 20:00 u-boot.bin
>>      -rw-r--r-- 1 legoater legoater  5617280 Jun  1 20:01 zImage
>>
>> I will probably host them on GH and we could use them under avocado
>> to extend the tests.
>>
>>
>> They should boot real HW. I will submit the defconfigs to buildroot
>> after more tests and cleanups.
>>
> 
> Nice!

Uploaded here :

https://github.com/legoater/qemu-aspeed-boot/tree/master/images/ast2600-evb/buildroot-2022.05-rc2


C.
