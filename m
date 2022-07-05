Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3697677lft;
        Mon, 4 Jul 2022 22:52:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1voW32spyCk6E4h9n2v4R3h0Ptvo/S1JsA3NZUIDRO4aSeRYpyr/xF6IKsWaZEZDTVAfY8w
X-Received: by 2002:ac8:570f:0:b0:31d:3692:36e0 with SMTP id 15-20020ac8570f000000b0031d369236e0mr17427845qtw.343.1657000348551;
        Mon, 04 Jul 2022 22:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657000348; cv=none;
        d=google.com; s=arc-20160816;
        b=zqLGbE93/yfVlLtvGQBMEB6fUIjNFXQc+j39ETwwYhhmw/hc3D/1Kp45X9HHlGi8mw
         +yMP2qJ4JPcwuPofo3cZXI2s35Qe675GixSLjke7TUdSFMcbNEg1BBJV0i+J34c+aDaA
         SpW+ATXJavhJof33rBSK86CLTfaKtITwkQeJxwU0BXwta+mL09gsypRqxkQBvQEiBsHW
         Q1E7vnh6FhY4oLjRleY6KhsRP6tZlD379bvE8DuMK7PtlJsBe75wTBYoPt/8EqFlzteF
         MZJjkL1JUONVZAu/ytIlvy7JBkgbFew0LihUAC1uKnYuD8YgPPqExPXoS+dyN+y3/IsM
         NQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Ycw7a4RnjsUGBjF2hLiSZi1bn4gAGwO695hCFujkFGo=;
        b=ylg36jw4tTlXuy9GZJloA2RpFPigd1x7gUYWPsE5kH14YpR6acVIh3IltVkhnQx+LC
         aMg0pz9j7ln0piXZ3RpWp8iMH/WTcMonh67OjvMK45rwH9gK3jV1OJcClksnenF7Tvey
         M2YMZdoqDGa0YrKj1pxA8InduKsQPjhc0libPZ1B5vnKlpuwlgwTKcO5g0RNG5s4JfpO
         GR7biL2Ivm4HRq4BIPUIZDbR+2CukZKgzrGsA+n+T8Lr/tCjv43uKdLWwJ5BB0u1ms3U
         d+dQ/OMzVkBViFZlFKMM7ottMN1IuWQiCirejvw1+m1WKOc6ERamSlvtuR5DRnuXvLrD
         cELQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020a05622a144a00b0031d425cfba7si5522716qtx.324.2022.07.04.22.52.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 22:52:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8bU4-0004Z2-1p
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 01:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8bRp-0001lw-Pi
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 01:50:09 -0400
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:38055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8bRn-0005cq-A5
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 01:50:09 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.195])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B519526404;
 Tue,  5 Jul 2022 05:50:05 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 5 Jul 2022
 07:50:05 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001fd3ede2b-2235-46d5-86f4-de487534163c,
 4FF77D4A254985FC0BE9A952312E42D6E34C6CC4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <43b67835-cb9c-c7a0-3e12-fa1d9e22aa8c@kaod.org>
Date: Tue, 5 Jul 2022 07:49:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/8] aspeed: Add AST2600 (BMC) to fby35
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220704215457.38332-1-peter@pjd.dev>
 <20220704215457.38332-6-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220704215457.38332-6-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 732f505d-15c5-42c4-8f20-79fc3633b17d
X-Ovh-Tracer-Id: 15063696329665514278
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeitddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E/+PI2n+vYnA

On 7/4/22 23:54, Peter Delevoryas wrote:
> You can test booting the BMC with both '-device loader' and '-drive
> file'. This is necessary because of how the fb-openbmc boot sequence
> works (jump to 0x20000000 after U-Boot SPL).
> 
>      wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
>      qemu-system-arm -machine fby35 -nographic \
>          -device loader,file=fby35.mtd,addr=0,cpu-num=0 -drive file=fby35.mtd,format=raw,if=mtd
> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/fby35.c | 41 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
> 
> diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
> index 03b458584c..5c5224d374 100644
> --- a/hw/arm/fby35.c
> +++ b/hw/arm/fby35.c
> @@ -6,17 +6,55 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "qapi/error.h"
> +#include "sysemu/sysemu.h"
>   #include "hw/boards.h"
> +#include "hw/arm/aspeed_soc.h"
>   
>   #define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
>   OBJECT_DECLARE_SIMPLE_TYPE(Fby35State, FBY35);
>   
>   struct Fby35State {
>       MachineState parent_obj;
> +
> +    MemoryRegion bmc_memory;
> +    MemoryRegion bmc_dram;
> +    MemoryRegion bmc_boot_rom;
> +
> +    AspeedSoCState bmc;
>   };
>   
> +#define FBY35_BMC_RAM_SIZE (2 * GiB)
> +
> +static void fby35_bmc_init(Fby35State *s)
> +{
> +    memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_MAX);
> +    memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram",
> +                           FBY35_BMC_RAM_SIZE, &error_abort);
> +
> +    object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
> +    object_property_set_int(OBJECT(&s->bmc), "ram-size", FBY35_BMC_RAM_SIZE,
> +                            &error_abort);
> +    object_property_set_link(OBJECT(&s->bmc), "memory", OBJECT(&s->bmc_memory),
> +                             &error_abort);
> +    object_property_set_link(OBJECT(&s->bmc), "dram", OBJECT(&s->bmc_dram),
> +                             &error_abort);
> +    object_property_set_int(OBJECT(&s->bmc), "hw-strap1", 0x000000C0,
> +                            &error_abort);
> +    object_property_set_int(OBJECT(&s->bmc), "hw-strap2", 0x00000003,
> +                            &error_abort);
> +    aspeed_soc_uart_set_chr(&s->bmc, ASPEED_DEV_UART5, serial_hd(0));
> +    qdev_realize(DEVICE(&s->bmc), NULL, &error_abort);
> +
> +    aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
> +}
> +
>   static void fby35_init(MachineState *machine)
>   {
> +    Fby35State *s = FBY35(machine);
> +
> +    fby35_bmc_init(s);
>   }
>   
>   static void fby35_class_init(ObjectClass *oc, void *data)
> @@ -25,6 +63,9 @@ static void fby35_class_init(ObjectClass *oc, void *data)
>   
>       mc->desc = "Meta Platforms fby35";
>       mc->init = fby35_init;
> +    mc->no_floppy = 1;
> +    mc->no_cdrom = 1;
> +    mc->min_cpus = mc->max_cpus = mc->default_cpus = 2;
>   }
>   
>   static const TypeInfo fby35_types[] = {

