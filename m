Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3033566lft;
        Thu, 23 Jun 2022 08:10:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vJoVT5dh5jlQFVoEgpvryMkGvwrQWGzNve5Z0RJ1VaQdksO91RBLQLvF5XeQzEMtwp0tdu
X-Received: by 2002:ac8:59cb:0:b0:305:166b:9bf6 with SMTP id f11-20020ac859cb000000b00305166b9bf6mr8642450qtf.9.1655997023631;
        Thu, 23 Jun 2022 08:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655997023; cv=none;
        d=google.com; s=arc-20160816;
        b=LqpS+V8BdnWl6N/W8G4lYEuafWQY0yw4X+zxQ6aO2zbhDZZInaIlgzRYWkv6bzeXc8
         osEdemilzoopLXV+0ytla4bUZV1DqhQa8TE4k8s1GdPIbGZ+bavgwNTbVgQR/5kxmOGO
         lDo0Z6llFtys1ySsddb5M4ygPggvGxOdGkVLbKMwlDRLMtQ/Xq92JSebaAcJhwJ1fqBt
         x2A60FGltHFu209+Aw5LQIVkDyM6TXzulm7RHEQfWXZK+xqy/V+P2iIGr176vRHurM7L
         EMijt3oDS6SYRdXe2pBaK6J4GwrW7P2iet3KxwvwFEeFUnsCk5cclh0vzsat3sJdBQmx
         ReDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id;
        bh=E95YvVIQb1rTItdMgN1QUArhoYtY67qJoHVLPVWePJk=;
        b=UCWlqRuA1PrYa97FL6/piKcK4QsTT19EbEMUO7L1XJF5v2KA2+rSXe7cXvJa7x1zQj
         ffXwgGAAJzaDB56rasq2bblxLkp+6ZQgRLy6iIWdVCIiTdtDKd1zNyJ8ZrXF56S5/LYX
         91Hisnwgs/F3X+yuN6+qzRle8hJpN85oPb7GFd2sZJH64udmlK+LCeXLrd7G8P2D4pKR
         4TXNo08m+/MsCWoivYq/n9Oox0uebvtW3mcEqIj8iUGXUgVZerGngg1TsEo1JJzqoFQh
         XCYbU4Hwhsv9bhIqxo+g762zLDc7sDfJw9fgvwd/PDLU+OzLqt+Iu0Z+4IT7/DUmRX1j
         HpNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gy5-20020a056214242500b0046e74b508dbsi17143283qvb.527.2022.06.23.08.10.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 08:10:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4OTP-0000GX-3P
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 11:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o4OT8-0000Dr-5y; Thu, 23 Jun 2022 11:10:06 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:40497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o4OT4-0005xT-LR; Thu, 23 Jun 2022 11:10:05 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.131])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C76B0231E2;
 Thu, 23 Jun 2022 15:09:57 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 23 Jun
 2022 17:09:56 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00387f07116-a976-436d-9488-f78a9ccc6e13,
 1905447EDF4A6B95D61F03ED56167C5A36471571) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e5f51f14-fe75-0d55-6588-a3ca2565f760@kaod.org>
Date: Thu, 23 Jun 2022 17:09:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 12/14] aspeed: Make aspeed_board_init_flashes public
To: Peter Delevoryas <pdel@fb.com>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <pbonzini@redhat.com>, <berrange@redhat.com>, <eduardo@habkost.net>,
 <"i.mitsyanko@gmail.com.mst"@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <richard.henderson@linaro.org>, <f4bug@amsat.org>, <ani@anisinha.ca>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <kvm@vger.kernel.org>
References: <20220623102617.2164175-1-pdel@fb.com>
 <20220623102617.2164175-13-pdel@fb.com>
Content-Language: en-US
In-Reply-To: <20220623102617.2164175-13-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2dbb2037-39f1-45b4-b5ec-fe71b9aca839
X-Ovh-Tracer-Id: 9386908999118261121
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfhffuvfevfhgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeghfeuudfftdduleetkeegffdtiefgkeejgeektdeggeegueelhfefieehjeevkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepkhhvmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheegke
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
X-TUID: naTgV1vCIUhC

On 6/23/22 12:26, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Let's start simple without flash support. We should be able to
load FW blobs in each CPU address space using loader devices.

Thanks,

C.

> ---
>   hw/arm/aspeed.c             | 25 -------------------------
>   hw/arm/aspeed_soc.c         | 26 ++++++++++++++++++++++++++
>   include/hw/arm/aspeed_soc.h |  2 ++
>   3 files changed, 28 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 3aa74e88fb..c893ce84d7 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -278,31 +278,6 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
>       rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
>   }
>   
> -static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
> -                                      unsigned int count, int unit0)
> -{
> -    int i;
> -
> -    if (!flashtype) {
> -        return;
> -    }
> -
> -    for (i = 0; i < count; ++i) {
> -        DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
> -        qemu_irq cs_line;
> -        DeviceState *dev;
> -
> -        dev = qdev_new(flashtype);
> -        if (dinfo) {
> -            qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
> -        }
> -        qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
> -
> -        cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
> -        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
> -    }
> -}
> -
>   static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
>   {
>           DeviceState *card;
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index b7e8506f28..33bfc06ed8 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -20,6 +20,7 @@
>   #include "hw/i2c/aspeed_i2c.h"
>   #include "net/net.h"
>   #include "sysemu/sysemu.h"
> +#include "sysemu/blockdev.h"
>   
>   #define ASPEED_SOC_IOMEM_SIZE       0x00200000
>   
> @@ -579,3 +580,28 @@ void aspeed_soc_uart_init(AspeedSoCState *s)
>                          serial_hd(i), DEVICE_LITTLE_ENDIAN);
>       }
>   }
> +
> +void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
> +                               unsigned int count, int unit0)
> +{
> +    int i;
> +
> +    if (!flashtype) {
> +        return;
> +    }
> +
> +    for (i = 0; i < count; ++i) {
> +        DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
> +        qemu_irq cs_line;
> +        DeviceState *dev;
> +
> +        dev = qdev_new(flashtype);
> +        if (dinfo) {
> +            qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
> +        }
> +        qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
> +
> +        cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
> +    }
> +}
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index c68395ddbb..270d85d5de 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -166,5 +166,7 @@ enum {
>   
>   qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
>   void aspeed_soc_uart_init(AspeedSoCState *s);
> +void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
> +                               unsigned int count, int unit0);
>   
>   #endif /* ASPEED_SOC_H */

