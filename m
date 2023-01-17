Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2131303ejc;
        Mon, 16 Jan 2023 23:39:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXupmro7t7jsefcoLtg0OiDuub0krD2sRKOXnUI+RHpUSSSpZKKu8Qkk4hlbXgsGddRmVXQk
X-Received: by 2002:ad4:59c7:0:b0:535:1982:9407 with SMTP id el7-20020ad459c7000000b0053519829407mr3165680qvb.14.1673941174364;
        Mon, 16 Jan 2023 23:39:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673941174; cv=none;
        d=google.com; s=arc-20160816;
        b=wvBBluila5TAgYf/dWKGAGlk04YGiQqamV+4ixxHr4IzUsQbMoJjG2f2CCAyoFFs7A
         pkejGfW15AxvEr0PECp1btMs8msG6dgG2bDyk083NWeamF7M17x1OjQO3fgewioyN9de
         /aAJGWyVFZWsVI/5+4CE723tswjJfvgzgPZQINGxYtjOhV65yG7vsNk/o6bKJ0H27pC3
         KxOndhG7kYDomLOSfWg+9jEZtI2gebHw8mLphiQjf91nWHKwBvGw4x6ZyKjTAYMB4kcT
         x5hPXvF3mfVIwqarZ6DZuC2alIdUnS1K8v5luw5NJgio+r9NSDa/3xUSYicEi83ywVzb
         2ZZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=g0VzZDgmu9nZj08F6++NJ0T6mW2ulyS9icToU4F0qug=;
        b=mOkrL8bko/S6gyxJmzfd6mjMDuSYUkBq6g86um+fUS9hiVjQlRP1H20lcntrFFccEK
         wwERgja+Izu+SW6BLymfCv7ZNjhokSAm7UQvy595pKzbmWzXgcRfKA6XpajAkYjeFsZ+
         3oKD/e+xLGjnR2XwHx3ndmwkJo8Nkqi61AsmlkoSivg9jz0at/mZ2aTcGzr2oO2612Ox
         FFm9V4cqdzi5lP32dox24Mn6w9N6WLvjOqlfh6MNjlc8PY85Fi8ch6ZjG+Y6Fikmgc5l
         3T81zB4/lmbIb488pRbQMUhem9tp+awFkAlECcgtjN59mMsSb/YiaZEirKnzMaH0hi/K
         lxYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q24-20020a37f718000000b007049d89b119si15422137qkj.164.2023.01.16.23.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 23:39:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHgYu-0004G3-Rr; Tue, 17 Jan 2023 02:39:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pHgYt-0004Fh-0y
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:39:15 -0500
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pHgYq-0004Rg-Lw
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:39:14 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.170])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 05A472D627;
 Tue, 17 Jan 2023 07:39:07 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 17 Jan
 2023 08:39:06 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003f86c3be0-add9-4082-8729-70c7a3e364ae,
 80E99EE0A2DD913C679298F6DB2E78D5E583611C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d494fe87-d083-cc64-867b-186852a120d7@kaod.org>
Date: Tue, 17 Jan 2023 08:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 4/5] hw/arm/aspeed: Add aspeed_eeprom.c
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <hskinnemoen@google.com>, <kfting@nuvoton.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20230116235604.55099-1-peter@pjd.dev>
 <20230116235604.55099-5-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230116235604.55099-5-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 796cb323-fb43-4a21-8df1-d267152cfacb
X-Ovh-Tracer-Id: 5808236145257581420
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddthedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefgkeetkeegleehueejgefhteekteelieduueffkeetgfekheeuffehveevkeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhesphhjugdruggvvhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgrnhgurhgvfiesrghjrdhiugdrrghupdhjohgvlhesjhhmshdrihgurdgruhdphhhskhhinhhnvghmohgvnhesghhoohhglhgvrdgtohhmpdhkfhhtihhnghesnhhuvhhothhonhdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsth
 epmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XmOBNXauTxF3

On 1/17/23 00:56, Peter Delevoryas wrote:
> - Create aspeed_eeprom.c and aspeed_eeprom.h
> - Include aspeed_eeprom.c in CONFIG_ASPEED meson source files
> - Include aspeed_eeprom.h in aspeed.c
> - Add fby35_bmc_fruid data
> - Use new at24c_eeprom_init_rom helper to initialize BMC FRUID EEPROM with data
>    from aspeed_eeprom.c
> 
> wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
> qemu-system-aarch64 -machine fby35-bmc -nographic -mtdblock fby35.mtd
> ...
> user: root
> pass: 0penBmc
> ...
> root@bmc-oob:~# fruid-util bmc
> 
> FRU Information           : BMC
> ---------------           : ------------------
> Board Mfg Date            : Mon Jan 10 21:42:00 2022
> Board Mfg                 : XXXXXX
> Board Product             : BMC Storage Module
> Board Serial              : XXXXXXXXXXXXX
> Board Part Number         : XXXXXXXXXXXXXX
> Board FRU ID              : 1.0
> Board Custom Data 1       : XXXXXXXXX
> Board Custom Data 2       : XXXXXXXXXXXXXXXXXX
> Product Manufacturer      : XXXXXX
> Product Name              : Yosemite V3.5 EVT2
> Product Part Number       : XXXXXXXXXXXXXX
> Product Version           : EVT2
> Product Serial            : XXXXXXXXXXXXX
> Product Asset Tag         : XXXXXXX
> Product FRU ID            : 1.0
> Product Custom Data 1     : XXXXXXXXX
> Product Custom Data 2     : Config A
> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

One little comment below,

> ---
>   hw/arm/aspeed.c        |  4 +++-
>   hw/arm/aspeed_eeprom.c | 51 ++++++++++++++++++++++++++++++++++++++++++
>   hw/arm/aspeed_eeprom.h | 11 +++++++++
>   hw/arm/meson.build     |  1 +
>   4 files changed, 66 insertions(+), 1 deletion(-)
>   create mode 100644 hw/arm/aspeed_eeprom.c
>   create mode 100644 hw/arm/aspeed_eeprom.h
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index c929c61d582a..11e423db4538 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -14,6 +14,7 @@
>   #include "hw/arm/boot.h"
>   #include "hw/arm/aspeed.h"
>   #include "hw/arm/aspeed_soc.h"
> +#include "hw/arm/aspeed_eeprom.h"
>   #include "hw/i2c/i2c_mux_pca954x.h"
>   #include "hw/i2c/smbus_eeprom.h"
>   #include "hw/misc/pca9552.h"
> @@ -942,7 +943,8 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
>       at24c_eeprom_init(i2c[6], 0x51, 128 * KiB);
>       at24c_eeprom_init(i2c[8], 0x50, 32 * KiB);
>       at24c_eeprom_init(i2c[11], 0x51, 128 * KiB);
> -    at24c_eeprom_init(i2c[11], 0x54, 128 * KiB);
> +    at24c_eeprom_init_rom(i2c[11], 0x54, 128 * KiB, fby35_bmc_fruid,
> +                          fby35_bmc_fruid_size);
>   
>       /*
>        * TODO: There is a multi-master i2c connection to an AST1030 MiniBMC on
> diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
> new file mode 100644
> index 000000000000..a5ffa959927b
> --- /dev/null
> +++ b/hw/arm/aspeed_eeprom.c
> @@ -0,0 +1,51 @@
> +/* Copyright (c) Meta Platforms, Inc. and affiliates. */
> +
> +#include "aspeed_eeprom.h"
> +
> +const uint8_t fby35_bmc_fruid[] = {
> +    0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00, 0x36,
> +    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x4d,
> +    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x6f,
> +    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e,
> +    0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00, 0xc6,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
> +    0x69, 0x74, 0x65, 0x20, 0x56, 0x33, 0x2e, 0x35, 0x20, 0x45, 0x56, 0x54,
> +    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> +    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc8, 0x43, 0x6f,
> +    0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +};
> +
> +const uint32_t fby35_bmc_fruid_size = sizeof(fby35_bmc_fruid);
> diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
> new file mode 100644
> index 000000000000..89860e37d007
> --- /dev/null
> +++ b/hw/arm/aspeed_eeprom.h
> @@ -0,0 +1,11 @@
> +/* Copyright (c) Meta Platforms, Inc. and affiliates. */
> +
> +#ifndef ASPEED_EEPROM_H
> +#define ASPEED_EEPROM_H
> +
> +#include "qemu/osdep.h"
> +
> +extern const uint8_t fby35_bmc_fruid[];


may be define the array with an explicit size to avoid the size variable ?
I don't see any good solution.

Thanks,

C.



> +extern const uint32_t fby35_bmc_fruid_size;
> +
> +#endif
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 76d4d650e42e..f70e8cfd4545 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -53,6 +53,7 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>     'aspeed.c',
>     'aspeed_ast2600.c',
>     'aspeed_ast10x0.c',
> +  'aspeed_eeprom.c',
>     'fby35.c'))
>   arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
>   arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))

