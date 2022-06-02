Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp4731444lfh;
        Thu, 2 Jun 2022 00:53:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw37C2ssWID2LzmoBlTEspEwPxjGtHnaZmQ/f2oyqLMtskiPaM0M81S17EULzS6bJ6kZfmM
X-Received: by 2002:ae9:ef45:0:b0:6a6:7403:870d with SMTP id d66-20020ae9ef45000000b006a67403870dmr1729802qkg.40.1654156418851;
        Thu, 02 Jun 2022 00:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654156418; cv=none;
        d=google.com; s=arc-20160816;
        b=XLJa5pbe72/jUq0vLuGgxU3rl4Iduk8tyFp9DgDfmYoWYCBR9Avyk535l5DDVV+6LC
         JYgyDgtT64hF1cvtwXnkANxygO8nVWq1n4gWzKnwp5OiC0KWgXZ4YHvVybAFfkO06Aiw
         v0YM9idvwZ0J5qiKZWDvsC8rxegHpBgwkiags5vqVHDhYjDjK/QwRyhtrtSQGFpNDMGH
         mtIIGJXuXiJBqdkv5wcRmh8Ji+cTLvG+MkSOfHbM3BpEn1YoGbYwnhwMLKd6Zc2z5uuH
         /6i28OgqzjVbc2z385nOzbV3tIoEDEIibe9V3VKGBlG5/xiHg7O8NKsg1QYlReHeqTog
         OeFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=xb9Gt1X6BJIavY7Jx5Unc7A7Qzrmxxgv3KbFe0ry8rY=;
        b=ID0ZDSSZ3uaIJfrBsSoAZntfm4rOy2DfejRuja5jZa3nvCuLAYc9CamAIRu0/qytEu
         w8u2TwfNE4FIw5jM5sOcbkODFYOO3w4boahv+wabe5csxdePn6OJ69gy37OGpzFEPPvM
         bTnSfZ/vDMqFSZieUmz/qoLfg2mlUgd+9IUK4c3d0NeQZessdcAMDUQEzhQsZHvX8nCK
         WozGcs2da81WI61F8K/MLv3PPVyH3fdvSiWKq6Lizm5ha3CVZN9eKb0+KydsnGhSk8a4
         mDu8Je90XNttKwmesFNlZwEaEffufS7viILzxti/WrbFSV14ge+9oUYl2MNP+HeIJge5
         9WHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12-20020a05620a288c00b0069fe9799e14si2218777qkp.477.2022.06.02.00.53.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 00:53:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwfeE-0005VB-BP
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 03:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwfdk-0005E0-70
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 03:53:09 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:60083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwfdh-0004qq-O7
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 03:53:07 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.120])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0AF7320DE4;
 Thu,  2 Jun 2022 07:52:30 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 2 Jun 2022
 09:52:29 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0048e78e0fe-e814-4266-8dd2-7f34cf88214d,
 123C0E545D135716686AEE7B3F9DB382F3F098BA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6e0eb197-25c2-6b1e-2c19-f93597e29cff@kaod.org>
Date: Thu, 2 Jun 2022 09:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v2 0/6] hw/i2c: i2c slave mode support
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, <qemu-devel@nongnu.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>, <qemu-arm@nongnu.org>,
 Peter Delevoryas <pdel@fb.com>, Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Padmakar Kalghatgi
 <p.kalghatgi@samsung.com>, Damien Hedde <damien.hedde@greensocs.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Arun Kumar
 Kashinath Agasar <arun.kka@samsung.com>, Klaus Jensen <k.jensen@samsung.com>
References: <20220601210831.67259-1-its@irrelevant.dk>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220601210831.67259-1-its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3ea5b2f8-6585-4223-bb23-f18855a68240
X-Ovh-Tracer-Id: 7799671607086975931
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrledugdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepkhdrjhgvnhhsvghnsehsrghmshhunhhgrdgtohhmpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
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
X-TUID: ZMEJV8pTVatM

On 6/1/22 23:08, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Hi all,
> 
> This RFC series adds I2C "slave mode" support for the Aspeed I2C

I think you can remove the RFC prefix.

> controller as well as the necessary infrastructure in the i2c core to
> support this.
> 
> v2 changes
> ~~~~~~~~~~
> I finally got around to working on this again. I'm sorry for not
> bringing a v2 to the table earlier.
> 
> Mad props to Peter and Jonathan for putting this series to work and
> pushing it forward! Thanks!
> 
> This series is based off Cédric's aspeed-7.1 tree, so it includes the
> register fields. This is all "old register mode", but Peter seems to
> have added support in new mode.
> 
> There are some loose ends of course, i.e send_async doesn't handle
> broadcast and asynchronous slaves being sent stuff can't nack. But I
> wanted to get some feedback on the interface before I tackle that.
> 
> This series
> ~~~~~~~~~~~
> Patch 1 and 2 are small Aspeed I2C changes/additions.
> 
> Patch 3 adds support for multiple masters in the i2c core, allowing
> slaves to master the bus and (safely) issue i2c_send/recv().
> 
> Patch 4 adds an asynchronous send i2c_send_async(I2CBus *, uint8) on the
> bus that must be paired with an explicit ack using i2c_ack(I2CBus *). We
> have previously discussed how we wanted to handle the issue that some
> slaves implement this and some do not. Using a QOM interface was up, but
> couldn't figure out a good way to do it. I ended up decided against it
> since I believe this have to be a run-time check anyway. The problem is
> that a slave can master the bus and try to communicate with *anyone* on
> the bus - and there is no reason why we should only allow asynchronous
> slaves on the bus in that case, or whatever we would want to do when
> devices are plugged. So, instead, the current master can issue an
> i2c_start_send() and if that fails (because it isnt implemented by the
> target slave) it can either bail out or use i2c_start_send_async() if it
> itself supports it. This works the other way around as well of course,
> but it is probably simpler to handle slaves that respond to
> i2c_start_send(). This approach relies on adding a new i2c_event, which
> is why a bunch of other devices needs changes in their event handling.
> 
> Patch 5 adds *partial* slave mode functionality to the emulated Aspeed
> I2C controller, that is, it only supports asynchronous sends started by
> another slave that is currently mastering the bus. No asynchronous
> receive.

If there are no objections, I think this is a good way to move forward
and improve this initial implementation when the need arises.

> Finally, patch 6 adds an example device using this new API. The device
> is a simple "echo" device that upon being sent a set of bytes uses the
> first byte as the address of the slave to echo to.
> 
> With this combined I am able to boot up Linux on an emulated Aspeed 2600
> evaluation board and have the i2c echo device write into a Linux slave
> EEPROM. Assuming the echo device is on address 0x42:
> 
>    # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-15/new_device
>    i2c i2c-15: new_device: Instantiated device slave-24c02 at 0x64
>    # i2cset -y 15 0x42 0x64 0x00 0xaa i
>    # hexdump /sys/bus/i2c/devices/15-1064/slave-eeprom
>    0000000 ffaa ffff ffff ffff ffff ffff ffff ffff
>    0000010 ffff ffff ffff ffff ffff ffff ffff ffff
>    *
>    0000100

I have started working on buildroot images  :

   https://github.com/legoater/buildroot/commits/aspeed

The resulting files are quite small :

     $ ll output/images/
     total 86040
     drwxr-xr-x 2 legoater legoater     4096 Jun  1 20:01 ./
     drwxrwxr-x 6 legoater legoater     4096 Jun  1 19:40 ../
     -rwxr-xr-x 1 legoater legoater    36837 Jun  1 20:01 aspeed-ast2600-evb.dtb*
     -rw-r--r-- 1 legoater legoater 67108864 Jun  1 20:01 flash.img
     -rw-r--r-- 1 legoater legoater  6682796 Jun  1 20:01 image.itb
     -rw-r--r-- 1 legoater legoater     1846 Jun  1 20:01 image.its
     -rw-r--r-- 1 legoater legoater  3168768 Jun  1 20:01 rootfs.cpio
     -rw-r--r-- 1 legoater legoater  1026660 Jun  1 20:01 rootfs.cpio.xz
     -rw-r--r-- 1 legoater legoater  3788800 Jun  1 20:01 rootfs.tar
     -rw-r--r-- 1 legoater legoater   653777 Jun  1 20:00 u-boot.bin
     -rw-r--r-- 1 legoater legoater  5617280 Jun  1 20:01 zImage

I will probably host them on GH and we could use them under avocado
to extend the tests.


They should boot real HW. I will submit the defconfigs to buildroot
after more tests and cleanups.

Thanks

C.


> 
> Klaus Jensen (6):
>    hw/i2c/aspeed: rework raise interrupt trace event
>    hw/i2c/aspeed: add DEV_ADDR in old register mode
>    hw/i2c: support multiple masters
>    hw/i2c: add asynchronous send
>    hw/i2c/aspeed: add slave device in old register mode
>    hw/misc: add a toy i2c echo device [DO NOT PULL]
> 
>   hw/arm/pxa2xx.c             |   2 +
>   hw/display/sii9022.c        |   2 +
>   hw/display/ssd0303.c        |   2 +
>   hw/i2c/aspeed_i2c.c         | 152 ++++++++++++++++++++++++++++-----
>   hw/i2c/core.c               |  70 +++++++++++++++-
>   hw/i2c/smbus_slave.c        |   4 +
>   hw/i2c/trace-events         |   4 +-
>   hw/misc/i2c-echo.c          | 162 ++++++++++++++++++++++++++++++++++++
>   hw/misc/ibm-cffps.c         |   2 +
>   hw/misc/ir35221.c           |   2 +
>   hw/misc/meson.build         |   2 +
>   hw/nvram/eeprom_at24c.c     |   2 +
>   hw/sensor/lsm303dlhc_mag.c  |   2 +
>   include/hw/i2c/aspeed_i2c.h |  16 ++++
>   include/hw/i2c/i2c.h        |  30 +++++++
>   15 files changed, 428 insertions(+), 26 deletions(-)
>   create mode 100644 hw/misc/i2c-echo.c
> 

