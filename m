Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp718591lfb;
        Fri, 1 Apr 2022 01:52:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoUVvCZeoRsC7m4aAYsUfuQj9UkWogGgrE+ixh2rMQMudoHJLKUeyMPAt3p1innlCrr8ML
X-Received: by 2002:a05:6214:27cc:b0:441:499f:76ac with SMTP id ge12-20020a05621427cc00b00441499f76acmr7334104qvb.36.1648803122630;
        Fri, 01 Apr 2022 01:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648803122; cv=none;
        d=google.com; s=arc-20160816;
        b=r/1lHuLw5l1k5bNmpUWcdqShlAgbMnEdNX8014hhmpA1/ecQJNDMbREu/ucJo45UfH
         5JzH/RP7KYl6PS1b82/5GlGjzO9rp9BpsnR9QXksgbuOwQCeCPn5K4WJYbH/xRrFnvDz
         A2Kg6gX5b/jTQ9DOYO97mpZpApZ9OMk2DP6hzuH0eGRmL56+QtjkD0JbDvIF5b0lE/h4
         ezlU+lfe9P1i/G/VKJY0a9Dym4ZEHB6DK8nVGLNeP+1CT4WGxDkJP7avkQjs6e+EzGd2
         AvssVFsY/tiqcNILGZRBM+HTfrkabE1gOPfRJgXwCf3qTqgSkecr9F+QOEfVaIeZAKai
         Q3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date;
        bh=IyZ1IjdyOO8U/GyQ/HSWSY/RCS/vKoYlxr1gjyF42fg=;
        b=fTv1r25KolZ6msSVFP6omWCX2tdQOpVyNMKoHarvxQ9tuyPzhM9QARqEeEnO09yqK8
         FnKsffDEiHA7xq+cjEnCuUbFHTeMVhsR43E8oXzFbahKBygHWqvWbdUBHgJftSPDLMcI
         Dn03tOVZ4YKbp3QflJ0YX62s6m5jBCG0ieN6YSfmu2SzY0xM85MMEsEvRjeJhnzJIzfB
         JpRn4/CK0F1kOMrOL0vRzduFGzPicXlAg9jwJBIFq0ImDof0PvkwJSGGf6y8IqDiBcE/
         iA59SUydaUg3GEurNQ4CNrHlatfHAxgHCA2h6+0GzCEeLjySBQPYd8WmoC46duTc4KNC
         tKlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1-20020ac81001000000b002e1fbf3be94si815525qti.133.2022.04.01.01.52.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Apr 2022 01:52:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naD0j-0002XM-Vp
	for alex.bennee@linaro.org; Fri, 01 Apr 2022 04:52:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1naCvD-0007XM-Ua; Fri, 01 Apr 2022 04:46:20 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:16261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1naCvA-0002E9-R8; Fri, 01 Apr 2022 04:46:19 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2318YYaS031364;
 Fri, 1 Apr 2022 16:34:34 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 1 Apr
 2022 16:45:35 +0800
Date: Fri, 1 Apr 2022 16:45:32 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v4 8/9] aspeed: Add an AST1030 eval board
Message-ID: <20220401084530.GA15438@aspeedtech.com>
References: <20220401034651.9066-1-jamin_lin@aspeedtech.com>
 <20220401034651.9066-9-jamin_lin@aspeedtech.com>
 <fb2fff0a-65da-3fcc-0e2b-be892e690a66@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb2fff0a-65da-3fcc-0e2b-be892e690a66@kaod.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2318YYaS031364
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Beraldo Leal <bleal@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6EvjwTd2FFA1

The 04/01/2022 06:59, Cédric Le Goater wrote:
> On 4/1/22 05:46, Jamin Lin wrote:
> > The image should be supplied with ELF binary.
> > $ qemu-system-arm -M ast1030-evb -kernel zephyr.elf -nographic
> > 
> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >   hw/arm/aspeed.c         | 97 +++++++++++++++++++++++++++++++++++++++++
> >   include/hw/arm/aspeed.h |  6 +--
> >   2 files changed, 100 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index d205384d98..30b49d2db1 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -24,6 +24,7 @@
> >   #include "hw/loader.h"
> >   #include "qemu/error-report.h"
> >   #include "qemu/units.h"
> > +#include "hw/qdev-clock.h"
> >   
> >   static struct arm_boot_info aspeed_board_binfo = {
> >       .board_id = -1, /* device-tree-only board */
> > @@ -1361,3 +1362,99 @@ static const TypeInfo aspeed_machine_types[] = {
> >   };
> >   
> >   DEFINE_TYPES(aspeed_machine_types)
> > +
> > +#define AST1030_INTERNAL_FLASH_SIZE (1024 * 1024)
> > +/* Main SYSCLK frequency in Hz (200MHz) */
> > +#define SYSCLK_FRQ 200000000ULL
> > +
> > +static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
> > +                                                          void *data)
> > +{
> > +    MachineClass *mc = MACHINE_CLASS(oc);
> > +    AspeedMachineClass *amc = ASPEED_MINIBMC_MACHINE_CLASS(oc);
> 
> I don't think we need a ASPEED_MINIBMC type (yet)
>
Fixed
> > +
> > +    mc->desc = "Aspeed AST1030 MiniBMC (Cortex-M4)";
> > +    amc->soc_name = "ast1030-a1";
> > +    amc->hw_strap1 = 0;
> > +    amc->hw_strap2 = 0;
> > +    mc->default_ram_size = 0;
> > +    mc->default_cpus = mc->min_cpus = mc->max_cpus = 1;
> > +    amc->fmc_model = "sst25vf032b";
> > +    amc->spi_model = "sst25vf032b";
> > +    amc->num_cs = 2;
> 
> In this routine, you could add :
> 
>   amc->macs_mask = 0;
> 
> Since the NICs are not modeled yet.
> 
Thanks for your review and suggestion. Added in v5 patch.
> > +}
> > +
> > +static void ast1030_machine_instance_init(Object *obj)
> > +{
> > +    ASPEED_MINIBMC_MACHINE(obj)->mmio_exec = false;
> > +}
> 
> ast1030_machine_instance_init() is not that useful either.
> 
Fixed
> > +
> > +static void aspeed_minibmc_machine_init(MachineState *machine)
> > +{
> > +    AspeedMachineState *bmc = ASPEED_MINIBMC_MACHINE(machine);
> > +    AspeedMachineClass *amc = ASPEED_MINIBMC_MACHINE_GET_CLASS(machine);
> > +    Clock *sysclk;
> > +
> > +    sysclk = clock_new(OBJECT(machine), "SYSCLK");
> > +    clock_set_hz(sysclk, SYSCLK_FRQ);
> > +
> > +    object_initialize_child(OBJECT(machine), "soc", &bmc->soc, amc->soc_name);
> > +    qdev_connect_clock_in(DEVICE(&bmc->soc), "sysclk", sysclk);
> > +
> > +    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
> > +                         amc->uart_default);
> > +    qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
> > +
> > +    aspeed_board_init_flashes(&bmc->soc.fmc,
> > +                              bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
> > +                              amc->num_cs,
> > +                              0);
> > +
> > +    aspeed_board_init_flashes(&bmc->soc.spi[0],
> > +                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
> > +                              amc->num_cs, amc->num_cs);
> > +
> > +    aspeed_board_init_flashes(&bmc->soc.spi[1],
> > +                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
> > +                              amc->num_cs, (amc->num_cs * 2));
> > +
> > +    if (amc->i2c_init) {
> > +        amc->i2c_init(bmc);
> > +    }
> > +
> > +    armv7m_load_kernel(ARM_CPU(first_cpu),
> > +                       machine->kernel_filename,
> > +                       AST1030_INTERNAL_FLASH_SIZE);
> > +}
> > +
> > +static void aspeed_minibmc_machine_class_init(ObjectClass *oc, void *data)
> > +{
> > +    MachineClass *mc = MACHINE_CLASS(oc);
> > +    AspeedMachineClass *amc = ASPEED_MINIBMC_MACHINE_CLASS(oc);
> > +
> > +    mc->init = aspeed_minibmc_machine_init;
> > +    mc->no_floppy = 1;
> > +    mc->no_cdrom = 1;
> > +    mc->no_parallel = 1;
> > +    mc->default_ram_id = "ram";
> > +    amc->uart_default = ASPEED_DEV_UART5;
> 
> This is very much like aspeed_machine_class_init()
> 
> 
> > +}
> > +
> > +static const TypeInfo aspeed_minibmc_machine_types[] = {
> > +    {
> > +        .name           = MACHINE_TYPE_NAME("ast1030-evb"),
> > +        .parent         = TYPE_ASPEED_MINIBMC_MACHINE,
> 
> Why don't you inherit directly from TYPE_ASPEED_MACHINE and simplify
> the model by removing the duplicate TYPE_ASPEED_MINIBMC_MACHINE ?
> 
Fixed and removed TYPE_ASPEED_MINIBMC_MACHINE in v5 patch.
> > +        .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
> > +    }, {
> > +        .name           = TYPE_ASPEED_MINIBMC_MACHINE,
> > +        .parent         = TYPE_MACHINE,
> > +        .instance_size  = sizeof(AspeedMachineState),
> > +        .instance_init  = ast1030_machine_instance_init,
> > +        .class_size    = sizeof(AspeedMachineClass),
> > +        .class_init    = aspeed_minibmc_machine_class_init,
> > +        .abstract      = true,
> > +    }
> > +};
> > +
> > +DEFINE_TYPES(aspeed_minibmc_machine_types)
> > +
> > diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> > index cbeacb214c..b7411c860d 100644
> > --- a/include/hw/arm/aspeed.h
> > +++ b/include/hw/arm/aspeed.h
> > @@ -13,18 +13,19 @@
> >   #include "qom/object.h"
> >   
> >   typedef struct AspeedMachineState AspeedMachineState;
> > -
> >   #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
> > +#define TYPE_ASPEED_MINIBMC_MACHINE MACHINE_TYPE_NAME("aspeed-minibmc")
> >   typedef struct AspeedMachineClass AspeedMachineClass;
> >   DECLARE_OBJ_CHECKERS(AspeedMachineState, AspeedMachineClass,
> >                        ASPEED_MACHINE, TYPE_ASPEED_MACHINE)
> > +DECLARE_OBJ_CHECKERS(AspeedMachineState, AspeedMachineClass,
> > +                     ASPEED_MINIBMC_MACHINE, TYPE_ASPEED_MINIBMC_MACHINE)
> 
> This looks useless to me.
> 
> We might want a new type of Aspeed machines someday but I don't see
> the need yet.
> 
> Thanks,
> 
> C.
> 
removed and fixed in v5 patch.
Thanks for your review.
> >   
> >   #define ASPEED_MAC0_ON   (1 << 0)
> >   #define ASPEED_MAC1_ON   (1 << 1)
> >   #define ASPEED_MAC2_ON   (1 << 2)
> >   #define ASPEED_MAC3_ON   (1 << 3)
> >   
> > -
> >   struct AspeedMachineClass {
> >       MachineClass parent_obj;
> >   
> > @@ -41,5 +42,4 @@ struct AspeedMachineClass {
> >       uint32_t uart_default;
> >   };
> >   
> > -
> >   #endif
> 
