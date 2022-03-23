Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2680804lfb;
        Wed, 23 Mar 2022 13:13:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLy12AwEu9vjNITsmLSMzqSQFIPm48I4S8Zan3sAnWTLfQkedTnzlNhMdIS6Oshr0ZiR36
X-Received: by 2002:a25:500e:0:b0:633:7dc4:a4c2 with SMTP id e14-20020a25500e000000b006337dc4a4c2mr1610201ybb.542.1648066387044;
        Wed, 23 Mar 2022 13:13:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648066387; cv=none;
        d=google.com; s=arc-20160816;
        b=u9DXjNujW0oAahCxTbnBt8SPGtpPD86nJ/a1UUr2sCHNjEIS1JF1mwnolmfL/Fs6Kt
         BAVV3ee/SdKK09DFUcjnz28ahi+2tYjxv3p27EscT17P7LNTfUNu0LWbkjymX1SkBZ2/
         cKwVqeqY4sEVlmi+l12h94YDx3OPc2CW8sCE9XdyYn4XRFGnQA2nSXebZFXOVMz8oE9O
         9w/Db0TdjIVpPppMzLEutsC1H3QKyJNVc3RhBsl/W7JMnN0QA1hIliB3HobjNrbufsBQ
         Rdr+ksJfrfA6tW0uboKq3K4NRXHYRBxXtrmcs3q7IQa4tVC0T5KHuAffUrkeTlwpT/mB
         t8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YHtZi5nizY9puhdceIY19puAR1LihUdYAVG8A3DdYWE=;
        b=JmsAcj63BPtvCJAP/YbnkSv16pNNajL2bNMtPzzWqu3Vocq6lyN3C7GCFiI3DlTchZ
         6vecr/Kl9tESgNrqXU9pquo3xpGarTje4pQw3dsJG9218hIuz2yoqHwv7DY3p0sog73X
         Une05wDR4fD+zhWXVEwsJ8brStI9LFRlQYS0jcn94wnNb0MsTR7vmbY9XkCRR/5fRsas
         6fW8kolmjX6d/uKuxcKgGtueyBuqdYnvSns8a37YCZiRzlk0MM1NHQOcQiCyIyrlCLuk
         +GXBI4B78IUhBl4rlbtLC9HrEL6ZAoEu/Lr2yiDho/yxEx3NyFkLW6pz5FcvnBysNRe8
         5aDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=fJC4D137;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j184-20020a8192c1000000b002e5bb9dcae1si13748251ywg.362.2022.03.23.13.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Mar 2022 13:13:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=fJC4D137;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:37272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nX7Lu-0003lw-7k
	for alex.bennee@linaro.org; Wed, 23 Mar 2022 16:13:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nX7Lk-0003lj-O4
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 16:12:56 -0400
Received: from [2607:f8b0:4864:20::930] (port=40860
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nX7Lg-0001Q5-PX
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 16:12:55 -0400
Received: by mail-ua1-x930.google.com with SMTP id a28so1166759uaf.7
 for <qemu-arm@nongnu.org>; Wed, 23 Mar 2022 13:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YHtZi5nizY9puhdceIY19puAR1LihUdYAVG8A3DdYWE=;
 b=fJC4D137UAPZbhA+hWBZAkG/r2Vf9ZEpH2MdffgRiUQBcTm312SrORtEGhqX/1NFA8
 KDcVh/4cg2AlB4kDoNb7QFcHSRkOtcM0IsXyWdXmqTWA6z0BermoDM5XxqZcPou3BYsl
 guM0VGAljHsy1rYVrUrfcvRnLJSEDax55EAU1z7RZ2wHEyugCBuk0qOS0nEGlmKp4llZ
 4RxHF4dDn1Mz8ecftEZu+2CQm54Jq4hRyImy6a6Pu66rMNqsJrW88HHACx5Xve6H50gR
 qbuS/2aGufObIIlnEU+fCtmiGcQuAoXcCyu6xykcLm32ieXVzlYm1++Iw+6sKdHwLZJ2
 lJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YHtZi5nizY9puhdceIY19puAR1LihUdYAVG8A3DdYWE=;
 b=dXDwwrMd6b3q5MRbeFi1fBi4Yt9ShYy2UMlfIm6HmofjcHw4Vi2851SPHwBlo783fN
 n58k+5Ldhsrs+6YsgEJWkPGwyuBgKXcP1kVZNRlqbyRTN31/6V6FLLcPMVSedfKW3SVo
 CTcWhwf5XdGti/UJN4U493BuCZCr0JwfJ2IQLT4gO1vsKVQNtYkvZmF04g7i7pGmbKCv
 y19UhDB/oKnfG105ajUTcIjaJJzWcJzfqCrtbvpkJoqhBh1lwp/eE1iWA5AUIwtn04Kh
 ddSeCF8dkhJ5dMO9+YF19sFZy20zkGYkTRnAP746gDYMRf94hZ3IjmE6hNVLrfZi7lMc
 7euw==
X-Gm-Message-State: AOAM5300iZftdKi9sxtjDkTvM/HHFypdE2jTKaCpeTRcxn90girajDMj
 xoHN46j/YUH1vzndinYKcvM2M4iwyBCudTUIUKqP0g==
X-Received: by 2002:ab0:7e4b:0:b0:341:2c61:b9a3 with SMTP id
 e11-20020ab07e4b000000b003412c61b9a3mr919992uax.88.1648066370060; Wed, 23 Mar
 2022 13:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
 <20220322025154.3989-9-jamin_lin@aspeedtech.com>
In-Reply-To: <20220322025154.3989-9-jamin_lin@aspeedtech.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 23 Mar 2022 13:12:39 -0700
Message-ID: <CAO=notwd6pxwuzSyjRg=WF975_DuALsepf-G13uztpoYqfDbqA@mail.gmail.com>
Subject: Re: [PATCH v1 8/9] aspeed: Add an AST1030 eval board
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 "open list:STM32F205" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>, steven_lee@aspeedtech.com
Content-Type: multipart/alternative; boundary="0000000000008e1acb05dae85aef"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=venture@google.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: wFm4DXOWnfIW

--0000000000008e1acb05dae85aef
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 21, 2022 at 7:59 PM Jamin Lin <jamin_lin@aspeedtech.com> wrote:

> From: Steven Lee <steven_lee@aspeedtech.com>
>
> The image should be supplied with ELF binary.
> $ qemu-system-arm -M ast1030-evb -kernel zephyr.elf -nographic
>
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
>
Reviewed-by: Patrick Venture <venture@google.com>

> ---
>  hw/arm/aspeed.c         |   2 +-
>  hw/arm/aspeed_minibmc.c | 129 ++++++++++++++++++++++++++++++++++++++++
>  hw/arm/meson.build      |   3 +-
>  include/hw/arm/aspeed.h |  25 ++++++++
>  4 files changed, 157 insertions(+), 2 deletions(-)
>  create mode 100644 hw/arm/aspeed_minibmc.c
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index d205384d98..e5a2e59aef 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -276,7 +276,7 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr
> addr, size_t rom_size,
>      rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
>  }
>
> -static void aspeed_board_init_flashes(AspeedSMCState *s, const char
> *flashtype,
> +void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
>                                        unsigned int count, int unit0)
>  {
>      int i;
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
> +    AspeedMiniBmcMachineClass *amc =
> ASPEED_MINIBMC_MACHINE_GET_CLASS(machine);
> +    Clock *sysclk;
> +
> +    sysclk = clock_new(OBJECT(machine), "SYSCLK");
> +    clock_set_hz(sysclk, SYSCLK_FRQ);
> +
> +    object_initialize_child(OBJECT(machine), "soc", &bmc->soc,
> amc->soc_name);
> +    qdev_connect_clock_in(DEVICE(&bmc->soc), "sysclk", sysclk);
> +
> +    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
> +                         amc->uart_default);
> +    qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
> +
> +    aspeed_board_init_flashes(&bmc->soc.fmc,
> +                              bmc->fmc_model ? bmc->fmc_model :
> amc->fmc_model,
> +                              amc->num_cs,
> +                              0);
> +
> +    aspeed_board_init_flashes(&bmc->soc.spi[0],
> +                              bmc->spi_model ? bmc->spi_model :
> amc->spi_model,
> +                              amc->num_cs, amc->num_cs);
> +
> +    aspeed_board_init_flashes(&bmc->soc.spi[1],
> +                              bmc->spi_model ? bmc->spi_model :
> amc->spi_model,
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
>    'aspeed_soc.c',
>    'aspeed.c',
>    'aspeed_ast2600.c',
> -  'aspeed_ast1030.c'
> +  'aspeed_ast1030.c',
> +  'aspeed_minibmc.c'
>  ))
>  arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
>  arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index cbeacb214c..7050366e64 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -11,14 +11,21 @@
>
>  #include "hw/boards.h"
>  #include "qom/object.h"
> +#include "hw/ssi/aspeed_smc.h"
>
>  typedef struct AspeedMachineState AspeedMachineState;
> +typedef struct AspeedMiniBmcMachineState AspeedMiniBmcMachineState;
>
>  #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
> +#define TYPE_ASPEED_MINIBMC_MACHINE MACHINE_TYPE_NAME("aspeed-minibmc")
>  typedef struct AspeedMachineClass AspeedMachineClass;
>  DECLARE_OBJ_CHECKERS(AspeedMachineState, AspeedMachineClass,
>                       ASPEED_MACHINE, TYPE_ASPEED_MACHINE)
>
> +typedef struct AspeedMiniBmcMachineClass AspeedMiniBmcMachineClass;
> +DECLARE_OBJ_CHECKERS(AspeedMiniBmcMachineState, AspeedMiniBmcMachineClass,
> +                     ASPEED_MINIBMC_MACHINE, TYPE_ASPEED_MINIBMC_MACHINE)
> +
>  #define ASPEED_MAC0_ON   (1 << 0)
>  #define ASPEED_MAC1_ON   (1 << 1)
>  #define ASPEED_MAC2_ON   (1 << 2)
> @@ -41,5 +48,23 @@ struct AspeedMachineClass {
>      uint32_t uart_default;
>  };
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
>  #endif
> --
> 2.17.1
>
>
>

--0000000000008e1acb05dae85aef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 21, 2022 at 7:59 PM Jamin=
 Lin &lt;<a href=3D"mailto:jamin_lin@aspeedtech.com">jamin_lin@aspeedtech.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: Steven Lee &lt;<a href=3D"mailto:steven_lee@aspeedtech.com" target=
=3D"_blank">steven_lee@aspeedtech.com</a>&gt;<br>
<br>
The image should be supplied with ELF binary.<br>
$ qemu-system-arm -M ast1030-evb -kernel zephyr.elf -nographic<br>
<br>
Signed-off-by: Troy Lee &lt;<a href=3D"mailto:troy_lee@aspeedtech.com" targ=
et=3D"_blank">troy_lee@aspeedtech.com</a>&gt;<br>
Signed-off-by: Jamin Lin &lt;<a href=3D"mailto:jamin_lin@aspeedtech.com" ta=
rget=3D"_blank">jamin_lin@aspeedtech.com</a>&gt;<br>
Signed-off-by: Steven Lee &lt;<a href=3D"mailto:steven_lee@aspeedtech.com" =
target=3D"_blank">steven_lee@aspeedtech.com</a>&gt;<br></blockquote><div>Re=
viewed-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.com">ventur=
e@google.com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
---<br>
=C2=A0hw/arm/aspeed.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<b=
r>
=C2=A0hw/arm/aspeed_minibmc.c | 129 +++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0hw/arm/meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0include/hw/arm/aspeed.h |=C2=A0 25 ++++++++<br>
=C2=A04 files changed, 157 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 hw/arm/aspeed_minibmc.c<br>
<br>
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>
index d205384d98..e5a2e59aef 100644<br>
--- a/hw/arm/aspeed.c<br>
+++ b/hw/arm/aspeed.c<br>
@@ -276,7 +276,7 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr add=
r, size_t rom_size,<br>
=C2=A0 =C2=A0 =C2=A0rom_add_blob_fixed(&quot;aspeed.boot_rom&quot;, storage=
, rom_size, addr);<br>
=C2=A0}<br>
<br>
-static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flash=
type,<br>
+void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
int count, int unit0)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
diff --git a/hw/arm/aspeed_minibmc.c b/hw/arm/aspeed_minibmc.c<br>
new file mode 100644<br>
index 0000000000..6a29475919<br>
--- /dev/null<br>
+++ b/hw/arm/aspeed_minibmc.c<br>
@@ -0,0 +1,129 @@<br>
+/*<br>
+ * ASPEED AST1030 SoC<br>
+ *<br>
+ * Copyright (C) 2022 ASPEED Technology Inc.<br>
+ *<br>
+ * This code is licensed under the GPL version 2 or later.=C2=A0 See<br>
+ * the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;hw/boards.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+#include &quot;hw/qdev-clock.h&quot;<br>
+#include &quot;qemu/error-report.h&quot;<br>
+#include &quot;hw/arm/aspeed.h&quot;<br>
+#include &quot;hw/arm/aspeed_soc.h&quot;<br>
+#include &quot;hw/arm/boot.h&quot;<br>
+#include &quot;hw/i2c/smbus_eeprom.h&quot;<br>
+#include &quot;hw/sensor/tmp105.h&quot;<br>
+<br>
+#define AST1030_INTERNAL_FLASH_SIZE (1024 * 1024)<br>
+<br>
+struct AspeedMiniBmcMachineState {<br>
+=C2=A0 =C2=A0 /* Private */<br>
+=C2=A0 =C2=A0 MachineState parent_obj;<br>
+=C2=A0 =C2=A0 /* Public */<br>
+<br>
+=C2=A0 =C2=A0 AspeedSoCState soc;<br>
+=C2=A0 =C2=A0 MemoryRegion ram_container;<br>
+=C2=A0 =C2=A0 MemoryRegion max_ram;<br>
+=C2=A0 =C2=A0 bool mmio_exec;<br>
+=C2=A0 =C2=A0 char *fmc_model;<br>
+=C2=A0 =C2=A0 char *spi_model;<br>
+};<br>
+<br>
+/* Main SYSCLK frequency in Hz (200MHz) */<br>
+#define SYSCLK_FRQ 200000000ULL<br>
+<br>
+static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *data)<br>
+{<br>
+=C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_CLASS(oc);<br>
+=C2=A0 =C2=A0 AspeedMiniBmcMachineClass *amc =3D ASPEED_MINIBMC_MACHINE_CL=
ASS(oc);<br>
+<br>
+=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Aspeed AST1030 MiniBMC (Cortex-M4)&quo=
t;;<br>
+=C2=A0 =C2=A0 amc-&gt;soc_name =3D &quot;ast1030-a1&quot;;<br>
+=C2=A0 =C2=A0 amc-&gt;hw_strap1 =3D 0;<br>
+=C2=A0 =C2=A0 amc-&gt;hw_strap2 =3D 0;<br>
+=C2=A0 =C2=A0 mc-&gt;default_ram_size =3D 0;<br>
+=C2=A0 =C2=A0 mc-&gt;default_cpus =3D mc-&gt;min_cpus =3D mc-&gt;max_cpus =
=3D 1;<br>
+=C2=A0 =C2=A0 amc-&gt;fmc_model =3D &quot;sst25vf032b&quot;;<br>
+=C2=A0 =C2=A0 amc-&gt;spi_model =3D &quot;sst25vf032b&quot;;<br>
+=C2=A0 =C2=A0 amc-&gt;num_cs =3D 2;<br>
+}<br>
+<br>
+static void ast1030_machine_instance_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 ASPEED_MINIBMC_MACHINE(obj)-&gt;mmio_exec =3D false;<br>
+}<br>
+<br>
+static void aspeed_minibmc_machine_init(MachineState *machine)<br>
+{<br>
+=C2=A0 =C2=A0 AspeedMiniBmcMachineState *bmc =3D ASPEED_MINIBMC_MACHINE(ma=
chine);<br>
+=C2=A0 =C2=A0 AspeedMiniBmcMachineClass *amc =3D ASPEED_MINIBMC_MACHINE_GE=
T_CLASS(machine);<br>
+=C2=A0 =C2=A0 Clock *sysclk;<br>
+<br>
+=C2=A0 =C2=A0 sysclk =3D clock_new(OBJECT(machine), &quot;SYSCLK&quot;);<b=
r>
+=C2=A0 =C2=A0 clock_set_hz(sysclk, SYSCLK_FRQ);<br>
+<br>
+=C2=A0 =C2=A0 object_initialize_child(OBJECT(machine), &quot;soc&quot;, &a=
mp;bmc-&gt;soc, amc-&gt;soc_name);<br>
+=C2=A0 =C2=A0 qdev_connect_clock_in(DEVICE(&amp;bmc-&gt;soc), &quot;sysclk=
&quot;, sysclk);<br>
+<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(DEVICE(&amp;bmc-&gt;soc), &quot;uart-de=
fault&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0amc-&gt;uart_default);<br>
+=C2=A0 =C2=A0 qdev_realize(DEVICE(&amp;bmc-&gt;soc), NULL, &amp;error_abor=
t);<br>
+<br>
+=C2=A0 =C2=A0 aspeed_board_init_flashes(&amp;bmc-&gt;soc.fmc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bmc-&gt;fmc_model ? bmc-&gt;fmc_model : amc=
-&gt;fmc_model,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amc-&gt;num_cs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0);<br>
+<br>
+=C2=A0 =C2=A0 aspeed_board_init_flashes(&amp;bmc-&gt;soc.spi[0],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bmc-&gt;spi_model ? bmc-&gt;spi_model : amc=
-&gt;spi_model,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amc-&gt;num_cs, amc-&gt;num_cs);<br>
+<br>
+=C2=A0 =C2=A0 aspeed_board_init_flashes(&amp;bmc-&gt;soc.spi[1],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bmc-&gt;spi_model ? bmc-&gt;spi_model : amc=
-&gt;spi_model,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amc-&gt;num_cs, (amc-&gt;num_cs * 2));<br>
+<br>
+=C2=A0 =C2=A0 if (amc-&gt;i2c_init) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 amc-&gt;i2c_init(bmc);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 armv7m_load_kernel(ARM_CPU(first_cpu),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0machine-&gt;kernel_filename,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AST1030_INTERNAL_FLASH_SIZE);<br>
+}<br>
+<br>
+static void aspeed_minibmc_machine_class_init(ObjectClass *oc, void *data)=
<br>
+{<br>
+=C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_CLASS(oc);<br>
+=C2=A0 =C2=A0 AspeedMiniBmcMachineClass *amc =3D ASPEED_MINIBMC_MACHINE_CL=
ASS(oc);<br>
+<br>
+=C2=A0 =C2=A0 mc-&gt;init =3D aspeed_minibmc_machine_init;<br>
+=C2=A0 =C2=A0 mc-&gt;no_floppy =3D 1;<br>
+=C2=A0 =C2=A0 mc-&gt;no_cdrom =3D 1;<br>
+=C2=A0 =C2=A0 mc-&gt;no_parallel =3D 1;<br>
+=C2=A0 =C2=A0 mc-&gt;default_ram_id =3D &quot;ram&quot;;<br>
+=C2=A0 =C2=A0 amc-&gt;uart_default =3D ASPEED_DEV_UART5;<br>
+}<br>
+<br>
+static const TypeInfo aspeed_minibmc_machine_types[] =3D {<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D MACHINE_TYPE_NAME(&quot;ast1030-evb&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D T=
YPE_ASPEED_MINIBMC_MACHINE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =C2=A0=3D aspeed_mini=
bmc_machine_ast1030_evb_class_init,<br>
+=C2=A0 =C2=A0 }, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TYPE_ASPEED_MINIBMC_MACHINE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D T=
YPE_MACHINE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .instance_size=C2=A0 =3D sizeof(AspeedMiniBmcM=
achineState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .instance_init=C2=A0 =3D ast1030_machine_insta=
nce_init,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .class_size=C2=A0 =C2=A0 =3D sizeof(AspeedMini=
BmcMachineClass),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D aspeed_minibmc_ma=
chine_class_init,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .abstract=C2=A0 =C2=A0 =C2=A0 =3D true,<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+DEFINE_TYPES(aspeed_minibmc_machine_types)<br>
diff --git a/hw/arm/meson.build b/hw/arm/meson.build<br>
index 362868c1a0..0431ca2948 100644<br>
--- a/hw/arm/meson.build<br>
+++ b/hw/arm/meson.build<br>
@@ -52,7 +52,8 @@ arm_ss.add(when: &#39;CONFIG_ASPEED_SOC&#39;, if_true: fi=
les(<br>
=C2=A0 =C2=A0&#39;aspeed_soc.c&#39;,<br>
=C2=A0 =C2=A0&#39;aspeed.c&#39;,<br>
=C2=A0 =C2=A0&#39;aspeed_ast2600.c&#39;,<br>
-=C2=A0 &#39;aspeed_ast1030.c&#39;<br>
+=C2=A0 &#39;aspeed_ast1030.c&#39;,<br>
+=C2=A0 &#39;aspeed_minibmc.c&#39;<br>
=C2=A0))<br>
=C2=A0arm_ss.add(when: &#39;CONFIG_MPS2&#39;, if_true: files(&#39;mps2.c&#3=
9;))<br>
=C2=A0arm_ss.add(when: &#39;CONFIG_MPS2&#39;, if_true: files(&#39;mps2-tz.c=
&#39;))<br>
diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h<br>
index cbeacb214c..7050366e64 100644<br>
--- a/include/hw/arm/aspeed.h<br>
+++ b/include/hw/arm/aspeed.h<br>
@@ -11,14 +11,21 @@<br>
<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
+#include &quot;hw/ssi/aspeed_smc.h&quot;<br>
<br>
=C2=A0typedef struct AspeedMachineState AspeedMachineState;<br>
+typedef struct AspeedMiniBmcMachineState AspeedMiniBmcMachineState;<br>
<br>
=C2=A0#define TYPE_ASPEED_MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0MACHINE_TYPE_NA=
ME(&quot;aspeed&quot;)<br>
+#define TYPE_ASPEED_MINIBMC_MACHINE MACHINE_TYPE_NAME(&quot;aspeed-minibmc=
&quot;)<br>
=C2=A0typedef struct AspeedMachineClass AspeedMachineClass;<br>
=C2=A0DECLARE_OBJ_CHECKERS(AspeedMachineState, AspeedMachineClass,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ASPEED_MACHINE, TYPE_ASPEED_MACHINE)<br>
<br>
+typedef struct AspeedMiniBmcMachineClass AspeedMiniBmcMachineClass;<br>
+DECLARE_OBJ_CHECKERS(AspeedMiniBmcMachineState, AspeedMiniBmcMachineClass,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ASPEED_MINIBMC_MACHINE, TYPE_ASPEED_MINIBMC_MACHINE)<br>
+<br>
=C2=A0#define ASPEED_MAC0_ON=C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
=C2=A0#define ASPEED_MAC1_ON=C2=A0 =C2=A0(1 &lt;&lt; 1)<br>
=C2=A0#define ASPEED_MAC2_ON=C2=A0 =C2=A0(1 &lt;&lt; 2)<br>
@@ -41,5 +48,23 @@ struct AspeedMachineClass {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t uart_default;<br>
=C2=A0};<br>
<br>
+struct AspeedMiniBmcMachineClass {<br>
+=C2=A0 =C2=A0 MachineClass parent_obj;<br>
+<br>
+=C2=A0 =C2=A0 const char *name;<br>
+=C2=A0 =C2=A0 const char *desc;<br>
+=C2=A0 =C2=A0 const char *soc_name;<br>
+=C2=A0 =C2=A0 uint32_t hw_strap1;<br>
+=C2=A0 =C2=A0 uint32_t hw_strap2;<br>
+=C2=A0 =C2=A0 const char *fmc_model;<br>
+=C2=A0 =C2=A0 const char *spi_model;<br>
+=C2=A0 =C2=A0 uint32_t num_cs;<br>
+=C2=A0 =C2=A0 uint32_t macs_mask;<br>
+=C2=A0 =C2=A0 void (*i2c_init)(AspeedMiniBmcMachineState *bmc);<br>
+=C2=A0 =C2=A0 uint32_t uart_default;<br>
+};<br>
+<br>
+void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int co=
unt, int unit0);<br>
<br>
=C2=A0#endif<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000008e1acb05dae85aef--
