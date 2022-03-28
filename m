Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp6521436lfb;
        Mon, 28 Mar 2022 05:52:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjFjSzsbplB5hSy1bH9Kzgi8n3/3UDJyoVLb+q1qMTrLZAixq0JCAJdoRLuLxZPjq8VIFM
X-Received: by 2002:a05:620a:4445:b0:67e:aaab:837e with SMTP id w5-20020a05620a444500b0067eaaab837emr14885769qkp.403.1648471969619;
        Mon, 28 Mar 2022 05:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648471969; cv=none;
        d=google.com; s=arc-20160816;
        b=BbHiLGngFgsSMw2mJZy/30iV3sSNjV7PD2LeC/fnk9qu3q/HlfJl0bRD4RjsNuZVNX
         NnVoZ3Md3H9KodUQIUSZqGT0hN8wCYCFur2GAicJk+Z1mOoewTF/wkF+RlPv1PIp/bJY
         w40N/OLJJp91qU4D+IbRQkCz2s76Vu5J+4yudQpu2T5qLA1Mn8DP6bzdkpS6Hj5FICAe
         o+Gw3c4eziXbFNIQOOK6BIIK0b3nzgXZWqjB4iH+aFphCgL9+gVyvGjB2ooxSgxWvj8Z
         OmU2M6zZt2Zkwy6hEfFY9dI5aoh+1wcX2VyHQDb+XO+cFTH9xf8uqzv9m8/4kpe9JlZH
         dn3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=uPd7TKVOKlDTifOVcpeaGMR9jOpUYh0Jfq8zFPwN7pI=;
        b=j4PicQVw+9NQiOSztTq8vH5AVFqQxhqxTD6z5eU02lTauryqgGeYi6tL/nGu3guaDa
         2i1QgEdnG0BEd1qxENhPMlorUpzNkLguS+C7ilfPui6406HOfNCONYt8owOC5AGeFzzO
         m6m1YsUCC+BbugMD8HvbgRN5DGMnYzR0ACipdTiHt+Zoytjqa6p9ruoPS1gqUr5BkaSM
         1nAWVJkUBJzGZkYZcLQqSMUyUa0Sym0FrlwgmOUJ0wt3YqhE0lSM3AXwXuBwnk1Wa0st
         zcLQvbbnRN6cTz2Mf6q4XgHq8+YLLzsLQnZPQbcumVRKsAbApUIGg6exNEGCUHoacyls
         K1XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11-20020a0cda8b000000b00440e46a7c7csi6285083qvj.282.2022.03.28.05.52.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Mar 2022 05:52:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYorZ-0005B7-0Q
	for alex.bennee@linaro.org; Mon, 28 Mar 2022 08:52:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nYooB-0002J5-B8
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 08:49:20 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:33177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nYoo7-0007Z8-EQ
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 08:49:18 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 907AAF0770D2;
 Mon, 28 Mar 2022 14:49:11 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 14:49:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001e8bc5b70-3302-4778-8a30-7661576d2420,
 26BDE5DCC9D641057CC543FCC51E49565A23663A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <980c91c2-80a8-89de-064e-f387d1dd3c23@kaod.org>
Date: Mon, 28 Mar 2022 14:49:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 8/9] aspeed: Add an AST1030 eval board
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Alistair Francis
 <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, "open list:STM32F205" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
 <20220322025154.3989-9-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220322025154.3989-9-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 062e107c-06a1-4c40-b489-d21108a07287
X-Ovh-Tracer-Id: 12594034882997750715
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
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
X-TUID: dVcXKWPq2cPk

Hello Jamin,

On 3/22/22 03:51, Jamin Lin wrote:
> From: Steven Lee <steven_lee@aspeedtech.com>
> 
> The image should be supplied with ELF binary.
> $ qemu-system-arm -M ast1030-evb -kernel zephyr.elf -nographic
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>


I don't see the benefits of duplicating the Aspeed machine file.
The "ast1030-evb" machine can be directly added in aspeed.c with
a different machine init handler : aspeed_minibmc_machine_init().

If the need arise one day, we can consider the alternative.

Thanks,

C.


> ---
>   hw/arm/aspeed.c         |   2 +-
>   hw/arm/aspeed_minibmc.c | 129 ++++++++++++++++++++++++++++++++++++++++
>   hw/arm/meson.build      |   3 +-
>   include/hw/arm/aspeed.h |  25 ++++++++
>   4 files changed, 157 insertions(+), 2 deletions(-)
>   create mode 100644 hw/arm/aspeed_minibmc.c
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index d205384d98..e5a2e59aef 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -276,7 +276,7 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
>       rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
>   }
>   
> -static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
> +void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
>                                         unsigned int count, int unit0)
>   {
>       int i;
> diff --git a/hw/arm/aspeed_minibmc.c b/hw/arm/aspeed_minibmc.c
> new file mode 100644
> index 0000000000..6a29475919
> --- /dev/null
> +++ b/hw/arm/aspeed_minibmc.c
> @@ -0,0 +1,129 @@
> +/*
> + * ASPEED AST1030 SoC
> + *
> + * Copyright (C) 2022 ASPEED Technology Inc.
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-clock.h"
> +#include "qemu/error-report.h"
> +#include "hw/arm/aspeed.h"
> +#include "hw/arm/aspeed_soc.h"
> +#include "hw/arm/boot.h"
> +#include "hw/i2c/smbus_eeprom.h"
> +#include "hw/sensor/tmp105.h"
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
> +
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
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 362868c1a0..0431ca2948 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -52,7 +52,8 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>     'aspeed_soc.c',
>     'aspeed.c',
>     'aspeed_ast2600.c',
> -  'aspeed_ast1030.c'
> +  'aspeed_ast1030.c',
> +  'aspeed_minibmc.c'
>   ))
>   arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
>   arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index cbeacb214c..7050366e64 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -11,14 +11,21 @@
>   
>   #include "hw/boards.h"
>   #include "qom/object.h"
> +#include "hw/ssi/aspeed_smc.h"
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
> @@ -41,5 +48,23 @@ struct AspeedMachineClass {
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
> +
> +void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
> +                                      unsigned int count, int unit0);
>   
>   #endif

