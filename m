Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp660683lfb;
        Thu, 31 Mar 2022 23:59:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySoCUTBsI9lXHV1Z/99n1Ip057O1NiPiXlwliBo47+KHe+cQZFo9Bh7FYXfGa5WFhYGEF8
X-Received: by 2002:a05:6214:da2:b0:441:4623:945c with SMTP id h2-20020a0562140da200b004414623945cmr38057594qvh.62.1648796375404;
        Thu, 31 Mar 2022 23:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648796375; cv=none;
        d=google.com; s=arc-20160816;
        b=N5zCwjx2SLn8XP+LHxaAy9akPEEd3FYYxWPNEwxY6oKlDzHKv5R/8veo2sRIbVN/1t
         7Fog2vBAXl7Ri0t2bHB8/7wTb1FvUEaB2ej/HPV4tEnrtLShWlcX6jNeFLKJEl0hH21M
         GjFUL5hO1RQY+rEHamHr5dKpjsWLtygI5nySFvoCSlMm9lO/H2wOhrH5535SJqvHe+ct
         temuY3rEW7nlTDjLwa4FojxEPKd0qY8fR9zhEHRCmTPVIhtoAZX5j4qYfGysF4slVN7q
         pMcCoqMtTxxGwAwROwoGxYejPnLztSgUm5mBikxzReNmJAd75ZUs0FgXBd1WLqF06K9m
         zzeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=I19N6yUDfJtdBu+h/RZbtVX08KrmbBkNTQyTDnCDM0Y=;
        b=Sh1L4tiS8MElMkRkIhLfgPhHyfOtrbtXtJOCvH25xQT3QzaP8jrsT42NtFfKdn2ILh
         zyix7Ulz12c1InyZ7t5NLBOHemku2WxzUHT5lP5gHJsi9jEi89BXdp3I2xGaqLu6FsLj
         FjFCGV3RMSmktaJvgSRfvjWJd9cEM6C4gGu/r/DQDmb90yL0PJgXgVlj66vMdCcWNTvP
         pVHfmdg6yoVUg6fh6lnIT+4udjZ2cH3PpC6o9SqvSsNLzCY9XRGfMPU7+xmmtVQr1lkU
         ZKdp3BjF7nXtXTuGkZnsrf3rWbLZJevumcfaSfrjC+KngC8mSlnunwMCNlnvNlNRKJnu
         Ra/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ck2-20020a05621404c200b00440e46a7d77si490078qvb.533.2022.03.31.23.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 23:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naBFu-0008Ee-MW
	for alex.bennee@linaro.org; Fri, 01 Apr 2022 02:59:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1naBFW-0008Cy-AO
 for qemu-arm@nongnu.org; Fri, 01 Apr 2022 02:59:10 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:58381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1naBFU-0003kb-49
 for qemu-arm@nongnu.org; Fri, 01 Apr 2022 02:59:09 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.129])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id DF84924E8C;
 Fri,  1 Apr 2022 06:59:04 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 1 Apr
 2022 08:59:03 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005ca221c5a-2e3b-4c42-9422-c308d25062df,
 BF19997ACFFB9775C4837E30A1DE169AA6CF9E32) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <fb2fff0a-65da-3fcc-0e2b-be892e690a66@kaod.org>
Date: Fri, 1 Apr 2022 08:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 8/9] aspeed: Add an AST1030 eval board
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220401034651.9066-1-jamin_lin@aspeedtech.com>
 <20220401034651.9066-9-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220401034651.9066-9-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c6acb026-14a7-4184-a16f-67f78121cb18
X-Ovh-Tracer-Id: 11725121631811963835
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeihedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
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
Cc: troy_lee@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kmCmpUX7MrSU

On 4/1/22 05:46, Jamin Lin wrote:
> The image should be supplied with ELF binary.
> $ qemu-system-arm -M ast1030-evb -kernel zephyr.elf -nographic
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>   hw/arm/aspeed.c         | 97 +++++++++++++++++++++++++++++++++++++++++
>   include/hw/arm/aspeed.h |  6 +--
>   2 files changed, 100 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index d205384d98..30b49d2db1 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -24,6 +24,7 @@
>   #include "hw/loader.h"
>   #include "qemu/error-report.h"
>   #include "qemu/units.h"
> +#include "hw/qdev-clock.h"
>   
>   static struct arm_boot_info aspeed_board_binfo = {
>       .board_id = -1, /* device-tree-only board */
> @@ -1361,3 +1362,99 @@ static const TypeInfo aspeed_machine_types[] = {
>   };
>   
>   DEFINE_TYPES(aspeed_machine_types)
> +
> +#define AST1030_INTERNAL_FLASH_SIZE (1024 * 1024)
> +/* Main SYSCLK frequency in Hz (200MHz) */
> +#define SYSCLK_FRQ 200000000ULL
> +
> +static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
> +                                                          void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MINIBMC_MACHINE_CLASS(oc);

I don't think we need a ASPEED_MINIBMC type (yet)

> +
> +    mc->desc = "Aspeed AST1030 MiniBMC (Cortex-M4)";
> +    amc->soc_name = "ast1030-a1";
> +    amc->hw_strap1 = 0;
> +    amc->hw_strap2 = 0;
> +    mc->default_ram_size = 0;
> +    mc->default_cpus = mc->min_cpus = mc->max_cpus = 1;
> +    amc->fmc_model = "sst25vf032b";
> +    amc->spi_model = "sst25vf032b";
> +    amc->num_cs = 2;

In this routine, you could add :

  amc->macs_mask = 0;

Since the NICs are not modeled yet.

> +}
> +
> +static void ast1030_machine_instance_init(Object *obj)
> +{
> +    ASPEED_MINIBMC_MACHINE(obj)->mmio_exec = false;
> +}

ast1030_machine_instance_init() is not that useful either.

> +
> +static void aspeed_minibmc_machine_init(MachineState *machine)
> +{
> +    AspeedMachineState *bmc = ASPEED_MINIBMC_MACHINE(machine);
> +    AspeedMachineClass *amc = ASPEED_MINIBMC_MACHINE_GET_CLASS(machine);
> +    Clock *sysclk;
> +
> +    sysclk = clock_new(OBJECT(machine), "SYSCLK");
> +    clock_set_hz(sysclk, SYSCLK_FRQ);
> +
> +    object_initialize_child(OBJECT(machine), "soc", &bmc->soc, amc->soc_name);
> +    qdev_connect_clock_in(DEVICE(&bmc->soc), "sysclk", sysclk);
> +
> +    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
> +                         amc->uart_default);
> +    qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
> +
> +    aspeed_board_init_flashes(&bmc->soc.fmc,
> +                              bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
> +                              amc->num_cs,
> +                              0);
> +
> +    aspeed_board_init_flashes(&bmc->soc.spi[0],
> +                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
> +                              amc->num_cs, amc->num_cs);
> +
> +    aspeed_board_init_flashes(&bmc->soc.spi[1],
> +                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
> +                              amc->num_cs, (amc->num_cs * 2));
> +
> +    if (amc->i2c_init) {
> +        amc->i2c_init(bmc);
> +    }
> +
> +    armv7m_load_kernel(ARM_CPU(first_cpu),
> +                       machine->kernel_filename,
> +                       AST1030_INTERNAL_FLASH_SIZE);
> +}
> +
> +static void aspeed_minibmc_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MINIBMC_MACHINE_CLASS(oc);
> +
> +    mc->init = aspeed_minibmc_machine_init;
> +    mc->no_floppy = 1;
> +    mc->no_cdrom = 1;
> +    mc->no_parallel = 1;
> +    mc->default_ram_id = "ram";
> +    amc->uart_default = ASPEED_DEV_UART5;

This is very much like aspeed_machine_class_init()


> +}
> +
> +static const TypeInfo aspeed_minibmc_machine_types[] = {
> +    {
> +        .name           = MACHINE_TYPE_NAME("ast1030-evb"),
> +        .parent         = TYPE_ASPEED_MINIBMC_MACHINE,

Why don't you inherit directly from TYPE_ASPEED_MACHINE and simplify
the model by removing the duplicate TYPE_ASPEED_MINIBMC_MACHINE ?

> +        .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
> +    }, {
> +        .name           = TYPE_ASPEED_MINIBMC_MACHINE,
> +        .parent         = TYPE_MACHINE,
> +        .instance_size  = sizeof(AspeedMachineState),
> +        .instance_init  = ast1030_machine_instance_init,
> +        .class_size    = sizeof(AspeedMachineClass),
> +        .class_init    = aspeed_minibmc_machine_class_init,
> +        .abstract      = true,
> +    }
> +};
> +
> +DEFINE_TYPES(aspeed_minibmc_machine_types)
> +
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index cbeacb214c..b7411c860d 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -13,18 +13,19 @@
>   #include "qom/object.h"
>   
>   typedef struct AspeedMachineState AspeedMachineState;
> -
>   #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
> +#define TYPE_ASPEED_MINIBMC_MACHINE MACHINE_TYPE_NAME("aspeed-minibmc")
>   typedef struct AspeedMachineClass AspeedMachineClass;
>   DECLARE_OBJ_CHECKERS(AspeedMachineState, AspeedMachineClass,
>                        ASPEED_MACHINE, TYPE_ASPEED_MACHINE)
> +DECLARE_OBJ_CHECKERS(AspeedMachineState, AspeedMachineClass,
> +                     ASPEED_MINIBMC_MACHINE, TYPE_ASPEED_MINIBMC_MACHINE)

This looks useless to me.

We might want a new type of Aspeed machines someday but I don't see
the need yet.

Thanks,

C.

>   
>   #define ASPEED_MAC0_ON   (1 << 0)
>   #define ASPEED_MAC1_ON   (1 << 1)
>   #define ASPEED_MAC2_ON   (1 << 2)
>   #define ASPEED_MAC3_ON   (1 << 3)
>   
> -
>   struct AspeedMachineClass {
>       MachineClass parent_obj;
>   
> @@ -41,5 +42,4 @@ struct AspeedMachineClass {
>       uint32_t uart_default;
>   };
>   
> -
>   #endif

