Received: by 2002:a0c:aa59:0:0:0:0:0 with SMTP id e25csp1553938qvb;
        Thu, 31 Mar 2022 04:07:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwglqxd9a6evVpdyPEBs6bq7U7HMw76umpI0N1oaf+1KrfwqFAA+48kjTDiRhuC4UB71U0N
X-Received: by 2002:a05:6214:da9:b0:441:2d37:1fdf with SMTP id h9-20020a0562140da900b004412d371fdfmr3206513qvh.14.1648724821254;
        Thu, 31 Mar 2022 04:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648724821; cv=none;
        d=google.com; s=arc-20160816;
        b=E9MTjhytN8R2iMR6qLrkATFdRLFzDCB2KfkO/acDA7iIgNzSGRRuxSZLK701uAWuPz
         +no+sYm0mz2ftStz0YSrt0bf4vDyYyKp/nSXsH1p4a/OSZNBFNKog8p7kyvTyZo+RkqN
         4Zebra14IV+Rhf/BDwAwMZVKIaNzk8Tvm9XSbTyJAoZkkEs4YY8Z6P6IiFgkvf2O4CXw
         5GCu+6jZCZP8BVtQE2ho4nm2UzI4tDqP4ESzfvNT5Ln4ZRyr78FT6TtKQ8LZhcWG3KoE
         FTngfjxEMUz994RZB795mpgdGJqRyIQSiJA0GwVo6nDDQk5X3PvctMf0+/UnnIvTlkPE
         K0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=cZ3qPVNABNKI9hospEca0MH3Lp0hwASoUpnMbmeLKl0=;
        b=qImSTf4Qxgf2GqUD43xbYtBwMWAGcGGds/C9SpPlSdDxqzSNUM6L+HKVb3JVbVOgji
         nUDzWT1YEF+rBusdg7NcvoHO5Yox4Dc8OPCNpZGnL+tu35pSYELt+p+MbQ/ziemsLZ2E
         vsCZmFOZjFIb177ZX7CJlkFLhqoNqkLMiwrqHZ/hMyHjO2UNOFHzQdVEWnrtkITpEECz
         rdaFacGjkwhO1tijN0zFV+kfZ+yWjmnW21bNek74NV7XQ1B9SlO3jeDNA8WGYxux/ZaJ
         WE33wrHUNZnNzCvZekkrPVwAOlgIRhxpSAt/9zmaw6mT7BYWhmf7xKF9Xc9z8twCEGqL
         eqSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r23-20020ae9d617000000b0067e98304433si13097263qkk.605.2022.03.31.04.07.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 04:07:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZsdo-0000rL-Pr
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 07:07:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nZsbw-0006Xo-M4
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:05:04 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:36793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nZsbu-0001eZ-9u
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:05:04 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.92])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 89A8BF1C13EC;
 Thu, 31 Mar 2022 13:04:51 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 31 Mar
 2022 13:04:50 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0031272dd39-f112-4b75-93ef-24f488bdb690,
 FC9088D273F6636B0CAAD4892A2C3D02B7ACC8E0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <09f78864-066e-a18c-6abe-26fe50753c81@kaod.org>
Date: Thu, 31 Mar 2022 13:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 8/9] aspeed: Add an AST1030 eval board
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220331081545.7140-1-jamin_lin@aspeedtech.com>
 <20220331081545.7140-9-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220331081545.7140-9-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 82f90295-e1fe-4cbd-acef-3331db2f514e
X-Ovh-Tracer-Id: 10003339199421189051
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: troy_lee@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R9o7Bp5mfqQj

Hello Jamin,

On 3/31/22 10:15, Jamin Lin wrote:
> The image should be supplied with ELF binary.
> $ qemu-system-arm -M ast1030-evb -kernel zephyr.elf -nographic
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>   hw/arm/aspeed.c         | 111 ++++++++++++++++++++++++++++++++++++++++
>   include/hw/arm/aspeed.h |  21 ++++++++
>   2 files changed, 132 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index d205384d98..14ce0dff8b 100644
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
> @@ -1361,3 +1362,113 @@ static const TypeInfo aspeed_machine_types[] = {
>   };
>   
>   DEFINE_TYPES(aspeed_machine_types)
> +
> +#define AST1030_INTERNAL_FLASH_SIZE (1024 * 1024)
> +
> +struct AspeedMiniBmcMachineState {
> +    /* Private */
> +    MachineState parent_obj;
> +    /* Public */
> +
> +    AspeedSoCState soc;
> +    MemoryRegion ram_container;
> +    MemoryRegion max_ram;
> +    bool mmio_exec;
> +    char *fmc_model;
> +    char *spi_model;
> +};
>

Why duplicate the state structure since it is the same ?

> +/* Main SYSCLK frequency in Hz (200MHz) */
> +#define SYSCLK_FRQ 200000000ULL
> +
> +static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
> +                                                          void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMiniBmcMachineClass *amc = ASPEED_MINIBMC_MACHINE_CLASS(oc);
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
> +}
> +
> +static void ast1030_machine_instance_init(Object *obj)
> +{
> +    ASPEED_MINIBMC_MACHINE(obj)->mmio_exec = false;
> +}
> +
> +static void aspeed_minibmc_machine_init(MachineState *machine)
> +{
> +    AspeedMiniBmcMachineState *bmc = ASPEED_MINIBMC_MACHINE(machine);
> +    AspeedMiniBmcMachineClass *amc = ASPEED_MINIBMC_MACHINE_GET_CLASS(machine);
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
> +    AspeedMiniBmcMachineClass *amc = ASPEED_MINIBMC_MACHINE_CLASS(oc);
> +
> +    mc->init = aspeed_minibmc_machine_init;
> +    mc->no_floppy = 1;
> +    mc->no_cdrom = 1;
> +    mc->no_parallel = 1;
> +    mc->default_ram_id = "ram";
> +    amc->uart_default = ASPEED_DEV_UART5;
> +}
> +
> +static const TypeInfo aspeed_minibmc_machine_types[] = {
> +    {
> +        .name           = MACHINE_TYPE_NAME("ast1030-evb"),
> +        .parent         = TYPE_ASPEED_MINIBMC_MACHINE,
> +        .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
> +    }, {
> +        .name           = TYPE_ASPEED_MINIBMC_MACHINE,
> +        .parent         = TYPE_MACHINE,
> +        .instance_size  = sizeof(AspeedMiniBmcMachineState),
> +        .instance_init  = ast1030_machine_instance_init,
> +        .class_size    = sizeof(AspeedMiniBmcMachineClass),
> +        .class_init    = aspeed_minibmc_machine_class_init,
> +        .abstract      = true,
> +    }
> +};
> +
> +DEFINE_TYPES(aspeed_minibmc_machine_types)
> +
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index cbeacb214c..d300ab0042 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -13,12 +13,18 @@
>   #include "qom/object.h"
>   
>   typedef struct AspeedMachineState AspeedMachineState;
> +typedef struct AspeedMiniBmcMachineState AspeedMiniBmcMachineState;
>   
>   #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
> +#define TYPE_ASPEED_MINIBMC_MACHINE MACHINE_TYPE_NAME("aspeed-minibmc")
>   typedef struct AspeedMachineClass AspeedMachineClass;
>   DECLARE_OBJ_CHECKERS(AspeedMachineState, AspeedMachineClass,
>                        ASPEED_MACHINE, TYPE_ASPEED_MACHINE)
>   
> +typedef struct AspeedMiniBmcMachineClass AspeedMiniBmcMachineClass;
> +DECLARE_OBJ_CHECKERS(AspeedMiniBmcMachineState, AspeedMiniBmcMachineClass,
> +                     ASPEED_MINIBMC_MACHINE, TYPE_ASPEED_MINIBMC_MACHINE)
> +
>   #define ASPEED_MAC0_ON   (1 << 0)
>   #define ASPEED_MAC1_ON   (1 << 1)
>   #define ASPEED_MAC2_ON   (1 << 2)
> @@ -41,5 +47,20 @@ struct AspeedMachineClass {
>       uint32_t uart_default;
>   };
>   
> +struct AspeedMiniBmcMachineClass {
> +    MachineClass parent_obj;
> +
> +    const char *name;
> +    const char *desc;
> +    const char *soc_name;
> +    uint32_t hw_strap1;
> +    uint32_t hw_strap2;
> +    const char *fmc_model;
> +    const char *spi_model;
> +    uint32_t num_cs;
> +    uint32_t macs_mask;
> +    void (*i2c_init)(AspeedMiniBmcMachineState *bmc);
> +    uint32_t uart_default;
> +};

I don't see a good reason to duplicate the class either.

Thanks,

C.
