Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2992032lft;
        Tue, 28 Jun 2022 01:01:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1utC9+fEcPAClHPRbo2kskTDf1lB982Obi0XAmwavG9YJf0S1uIwuMhCvfrgJZXUlaIPuQE
X-Received: by 2002:ac8:5a43:0:b0:305:20c4:7914 with SMTP id o3-20020ac85a43000000b0030520c47914mr12268300qta.2.1656403288406;
        Tue, 28 Jun 2022 01:01:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656403288; cv=none;
        d=google.com; s=arc-20160816;
        b=rZ+hCL4EbRW1Vm05WYPGIbe7RKeOYlxHOLheWY4tqeaGMUld1dx8c/KO5kBmfAS/Bp
         05Pl+Lpf0dfGruqLSu+G++ItMTebet+WoAm3sQEDig+1f6LjzFibY5nbbPYRN2ZwV5gr
         fLDXgKlqvZTuzz7cQAAyJnIfIEG4W92PDhXE6DP4qAl3Y1Ig0roEq4cvV0EZF+veggF1
         HkvrfEk53y7sxPjw8Ng84A+tlO54e6uOPcKzqQVxrLyzehIq9sB+QvV3SNCnYBIPCmZ3
         aDWemVXeO8jbYYUy3DlLr7+YWOHGN74EcXFIzqBpYKi+EGmsfQ8SeowZ6fR6o3T/rOLR
         nATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=lu973ia1oZTjFpK09kG9seNQUphomv9UwJ6vbl5+iM4=;
        b=ExhpCEsqKOdH9XV57wRtmEC8qsqO2W/47UC+H7Q2Ek0Bd9Bkqhthe6QIt31vu1pwDz
         KY0FnSQZqQ+Eux2k1GSzQF14NDpVE0+TfKTFoGYhAC0xWSwdqmeovL4YBoq3V+QkuG6R
         2hGnICLhBPdaEleGG9z/o3n56f3b1o7rxc8hgWffuHTvQLpYQZ6TkSdh9emtL6Tzd0f8
         XLU1oloKtTsBdZQq/fjEnP+9yoxUdKR802Vuyx8XWdg70uhgiTlayusgkv8HVs4LQ4Yj
         81V+QRKevGIxNghHd9hLvk287v0PBr63fOLJtpZH7u/bS7vMjmgyfkmvucaPNt5mP2n4
         R56A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15-20020a05622a190f00b00317cadf5b15si7058354qtc.74.2022.06.28.01.01.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 01:01:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o66A3-0003P0-QM
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 04:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o65Hm-0006iY-3O
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 03:05:24 -0400
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:56653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o65Hk-0000WU-49
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 03:05:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4C1DE22577;
 Tue, 28 Jun 2022 07:05:18 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 28 Jun
 2022 09:05:17 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003c47ffef7-0d01-4edc-a329-dcd2127ab6c5,
 366CF7EF17C4C6544BD620BB2F2D78A15BAD5133) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <94b12c69-cee0-192e-fe9c-19b9d85ae6b4@kaod.org>
Date: Tue, 28 Jun 2022 09:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 00/14] aspeed: Add I2C new register DMA slave mode support
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <zhdaniel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <komlodi@google.com>, <titusr@google.com>, <andrew@aj.id.au>,
 <joel@jms.id.au>
References: <20220627195506.403715-1-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627195506.403715-1-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fed8ab87-c33f-4631-9d19-9ccb960d8278
X-Ovh-Tracer-Id: 12118623647776541548
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegiedguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
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
X-TUID: EfTgO1WiY3mA

On 6/27/22 21:54, Peter Delevoryas wrote:
> Hey everyone,
> 
> I'm sending a big patch series for this, but only the last commit is really
> intended to be accepted right now. I'm just including the rest of them
> because it depends on them for testing.
> 
> Klaus's changes include the multi-master stuff in hw/i2c/core.c, and the old
> register mode slave mode support.
> 
> My series of patches includes a bunch of changes to eliminate most (if not
> all) of the I2C errors reported by the fb OpenBIC firmware for fby35
> CraterLake Bridge Interconnect (BIC) (shortname: oby35-cl) upon startup.
> 
> In particular, I needed to add the IC_DEVICE_ID to the isl voltage regulator
> implementation, which required a fix to the pmbus implementation when
> switching pages. We weren't resetting the buffer state when switching
> pages there.
> 
> I also added a placeholder implementation of the PECI controller, that does
> almost nothing, but doesn't produce errors.
> 
> I added the fby35-cpld, which oby35-cl queries using master-mode TX and RX
> commands.
> 
> And finally, I added an "intel-me" device (Intel Management Engine) that
> attempts to respond to the first IPMB message sent by the BIC. I used this
> to test the final patch, which I actually want to merge, the I2C new
> register DMA slave mode support.
> 
> All the patches except the last one can be ignored for now if you want,
> again, I just included them for testing purposes.
> 
> The final patch is pretty rough, but I wanted to start the review instead of
> waiting too long. I expect the interrupt handling part will be
> the main blocker.
> 
> Thanks,
> Peter
> 
> Klaus Jensen (3):
>    hw/i2c: support multiple masters
>    hw/i2c: add asynchronous send
>    hw/i2c/aspeed: add slave device in old register mode
> 
> Peter Delevoryas (11):
>    aspeed: i2c: Fix DMA len write-enable bit handling
>    aspeed: i2c: Fix R_I2CD_FUN_CTRL reference
>    aspeed: i2c: Fix MASTER_EN missing error message


I  didn't receive this patch ?

C.


>    aspeed: Add PECI controller
>    hw/misc: Add fby35-cpld
>    pmbus: Reset out buf after switching pages
>    pmbus: Add read-only IC_DEVICE_ID support
>    aspeed: Add oby35-cl machine
>    hw/misc: Add intel-me
>    aspeed: Add intel-me on i2c6 instead of BMC
>    aspeed: Add I2C new register DMA slave mode support
> 
>   hw/arm/aspeed.c                  |  42 ++++++
>   hw/arm/aspeed_ast10x0.c          |  11 ++
>   hw/arm/pxa2xx.c                  |   2 +
>   hw/display/sii9022.c             |   2 +
>   hw/display/ssd0303.c             |   2 +
>   hw/i2c/aspeed_i2c.c              | 234 +++++++++++++++++++++++++++----
>   hw/i2c/core.c                    |  70 ++++++++-
>   hw/i2c/pmbus_device.c            |   6 +
>   hw/i2c/smbus_slave.c             |   4 +
>   hw/i2c/trace-events              |   2 +
>   hw/misc/aspeed_peci.c            | 225 +++++++++++++++++++++++++++++
>   hw/misc/fby35_cpld.c             | 137 ++++++++++++++++++
>   hw/misc/intel_me.c               | 176 +++++++++++++++++++++++
>   hw/misc/meson.build              |   5 +-
>   hw/nvram/eeprom_at24c.c          |   2 +
>   hw/sensor/isl_pmbus_vr.c         |  30 ++++
>   hw/sensor/lsm303dlhc_mag.c       |   2 +
>   include/hw/arm/aspeed_soc.h      |   3 +
>   include/hw/i2c/aspeed_i2c.h      |  11 ++
>   include/hw/i2c/i2c.h             |  30 ++++
>   include/hw/i2c/pmbus_device.h    |   1 +
>   include/hw/misc/aspeed_peci.h    |  34 +++++
>   include/hw/sensor/isl_pmbus_vr.h |   1 +
>   23 files changed, 1002 insertions(+), 30 deletions(-)
>   create mode 100644 hw/misc/aspeed_peci.c
>   create mode 100644 hw/misc/fby35_cpld.c
>   create mode 100644 hw/misc/intel_me.c
>   create mode 100644 include/hw/misc/aspeed_peci.h
> 

