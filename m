Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3698036lft;
        Mon, 4 Jul 2022 22:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sg5+or1jra5YQqo3Rxhu+eL0p7oivVLYLkyQGl6LkoEwX37nHeCOdEKvDwE1fMlTKGk42e
X-Received: by 2002:a05:622a:1494:b0:31d:47a2:13d9 with SMTP id t20-20020a05622a149400b0031d47a213d9mr9516324qtx.678.1657000411156;
        Mon, 04 Jul 2022 22:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657000411; cv=none;
        d=google.com; s=arc-20160816;
        b=urw0V2ZmzYOrPRKWm0iDDpyLSTIdym85uO+dq5wfysUK59P4uSxF+cu/CzpXqhdOcM
         ASaOwFwNf0tzPoCRdfyT8db0iahk9r3N1htB4gKm0WiHhSAp6JwO4EtLSidrbQ+P2jjj
         IZdt8wIoofrwkfeiM3JV+OS+ETUlHlSBSa1rdqAEQ0ZemujfUaMMe7K7R4p0tPZ76pMq
         LCtNgVvyDLBOKXz3HKury5ewVCU+VawWAuzL0bjnPGTSZBWuULTOBLQgr/FG3iBwBwKt
         lRduuiRjTyHPvhh3j8vK2FHM+CYjrEbs1aZxGLrXIZV4yC5SJYZfgKrpEhfeiSwKhqm7
         71XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=lyJ7AVqtF76LmJphodAgKOiQt/jZiwHdl5kToQ4EQWo=;
        b=xwT7C3QPuBQagOMGKnCPxDlVo3CjoXP8Ypclt2NOrZQgyU+qxQW+X5O+Y8SGW2YyUF
         EuYjB1MjhLVfyrTm84VWAtMi/p7wJlBNmpGGYciggVOnQ0pSRte1rnqlVTdVHbSL2gbL
         giKmrj5xwrwL39LCl6OEy64820eht5ZjSZgJU0+76mj8oQihHrd9H4hOYKwHRTutBL4u
         MlyihT8YKPIaBjQq1OOfdMQngtx4fyeNAfXfiNHZs+77X/Nz3h1etAqvqxy3utvsV9jw
         Q4u/9TZL+Mh550nXU6t7vvS5tndjAUEoEq6bWD5+P4xedESBcBA1h5Q05lLsZ1CsOonY
         RuHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fz18-20020a05622a5a9200b00304d8f33999si3657852qtb.386.2022.07.04.22.53.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 22:53:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8bV4-0006vt-Lo
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 01:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8bSD-0001yg-KC
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 01:50:35 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:39819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8bS8-0005el-Ji
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 01:50:32 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.136])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E9BCF2654D;
 Tue,  5 Jul 2022 05:50:25 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 5 Jul 2022
 07:50:25 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004ee893d4c-fa6b-495e-bd1c-76dfd4b20c90,
 4FF77D4A254985FC0BE9A952312E42D6E34C6CC4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <78a03070-09f4-e290-7c33-639d6ae03c31@kaod.org>
Date: Tue, 5 Jul 2022 07:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 8/8] aspeed: Add AST1030 (BIC) to fby35
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220704215457.38332-1-peter@pjd.dev>
 <20220704215457.38332-8-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220704215457.38332-8-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 500c8db9-81ab-494e-976d-8649bbbdfc5f
X-Ovh-Tracer-Id: 15069325829979147046
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeitddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
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
X-TUID: JmAKVA5pXRf4

On 7/4/22 23:54, Peter Delevoryas wrote:
> With the BIC, the easiest way to run everything is to create two pty's
> for each SoC and reserve stdin/stdout for the monitor:
> 
>      wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
>      wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.13.01/Y35BCL.elf
>      qemu-system-arm -machine fby35 \
>          -drive file=fby35.mtd,format=raw,if=mtd \
>          -device loader,file=fby35.mtd,addr=0,cpu-num=0 \
>          -serial pty -serial pty -serial mon:stdio -display none -S
> 
>      screen /dev/ttys0
>      screen /dev/ttys1
>      (qemu) c
> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/arm/fby35.c | 27 ++++++++++++++++++++++++++-
>   1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
> index d3edfa3b10..031602800f 100644
> --- a/hw/arm/fby35.c
> +++ b/hw/arm/fby35.c
> @@ -11,7 +11,9 @@
>   #include "sysemu/sysemu.h"
>   #include "sysemu/block-backend.h"
>   #include "hw/boards.h"
> +#include "hw/qdev-clock.h"
>   #include "hw/arm/aspeed_soc.h"
> +#include "hw/arm/boot.h"
>   
>   #define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
>   OBJECT_DECLARE_SIMPLE_TYPE(Fby35State, FBY35);
> @@ -22,8 +24,11 @@ struct Fby35State {
>       MemoryRegion bmc_memory;
>       MemoryRegion bmc_dram;
>       MemoryRegion bmc_boot_rom;
> +    MemoryRegion bic_memory;
> +    Clock *bic_sysclk;
>   
>       AspeedSoCState bmc;
> +    AspeedSoCState bic;
>   
>       bool mmio_exec;
>   };
> @@ -110,11 +115,31 @@ static void fby35_bmc_init(Fby35State *s)
>       }
>   }
>   
> +static void fby35_bic_init(Fby35State *s)
> +{
> +    s->bic_sysclk = clock_new(OBJECT(s), "SYSCLK");
> +    clock_set_hz(s->bic_sysclk, 200000000ULL);
> +
> +    memory_region_init(&s->bic_memory, OBJECT(s), "bic-memory", UINT64_MAX);
> +
> +    object_initialize_child(OBJECT(s), "bic", &s->bic, "ast1030-a1");
> +    qdev_connect_clock_in(DEVICE(&s->bic), "sysclk", s->bic_sysclk);
> +    object_property_set_link(OBJECT(&s->bic), "memory", OBJECT(&s->bic_memory),
> +                             &error_abort);
> +    aspeed_soc_uart_set_chr(&s->bic, ASPEED_DEV_UART5, serial_hd(1));
> +    qdev_realize(DEVICE(&s->bic), NULL, &error_abort);
> +
> +    aspeed_board_init_flashes(&s->bic.fmc, "sst25vf032b", 2, 2);
> +    aspeed_board_init_flashes(&s->bic.spi[0], "sst25vf032b", 2, 4);
> +    aspeed_board_init_flashes(&s->bic.spi[1], "sst25vf032b", 2, 6);
> +}
> +
>   static void fby35_init(MachineState *machine)
>   {
>       Fby35State *s = FBY35(machine);
>   
>       fby35_bmc_init(s);
> +    fby35_bic_init(s);
>   }
>   
>   
> @@ -141,7 +166,7 @@ static void fby35_class_init(ObjectClass *oc, void *data)
>       mc->init = fby35_init;
>       mc->no_floppy = 1;
>       mc->no_cdrom = 1;
> -    mc->min_cpus = mc->max_cpus = mc->default_cpus = 2;
> +    mc->min_cpus = mc->max_cpus = mc->default_cpus = 3;
>   
>       object_class_property_add_bool(oc, "execute-in-place",
>                                      fby35_get_mmio_exec,

