Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp5034480wrg;
        Thu, 6 Jun 2019 16:35:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqylIQswcc7ajFxZKObU5SFGc5EOuSkO46ffK4qn0ZGDpVxUPw1BQ3lUj70rA+FALcmYfck+
X-Received: by 2002:a05:620a:1310:: with SMTP id o16mr40465307qkj.196.1559864128659;
        Thu, 06 Jun 2019 16:35:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559864128; cv=none;
        d=google.com; s=arc-20160816;
        b=nd9cMoPb4/PZTuFZ4oyFSa6lrRPooFLhx4U3TF29qnmIdj3prUujVk4/Vt+w+Z55Dj
         LoQFcO9WpAt/vYl12nvkfgbxwQ3kGzqSKDKEoQM4IuxEqzj7CA5/RmbbP0f15T32PjZc
         Z2kt5ugDnbYYVOoKvuKBov70A+HocyUdhjtxHzPmcX2Ky15RfziVL55zqJS2iaREGggk
         3JAUPauqwW6idC3tm6wjwvZJAW4Y+GDTCfISk/LOMjqiEbRRJl2850eZReoqAGaapweI
         jUYw81jJmaWPraOAVXcRXTqhW3KnWsJbQFeivOEY8cfZwkQCnMOZRVjGkeUySb39aMNg
         8sgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=ohX5dO1S3F1UEXL9KGCGLISev2OwPzeptWW2jNr/7GY=;
        b=w1iTOmoq/MC9jEYysQC2veu6GyVL1w+4aeF4PB/qbC+qHigh48Lv4uz9D3yQzVOxAl
         ESrHsrNl27h76r3bEpxVJbp8RiIVuAp2S0wlLDKEn5wJSHEEYmdNySdTivX61pFQ8/OC
         7umhMm01QIgjMwkBs08KWdpvCYRK05LtqwVXtlRZqrH/yfcv8n2IFKUSwU7wuluWx6kz
         xcAOAiFm3bLeNkT/cEqOhOd7ljfAsq3JJ/pqEy//sT0vfr9lnZJqKkfkNJH5H/CGX289
         D4THNUVJex5QEWrqzDFzYIzWbdTu4tP9o5slfuK1/iWlnu0/7tkrLp5dDxnkSbeGNPm9
         D7Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.47])
        by mx.google.com with ESMTPS id q11si303942qtq.83.2019.06.06.16.35.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jun 2019 16:35:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) client-ip=209.51.188.47;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44996 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZ1uq-0007QO-6a
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 19:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46294)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hZ1uP-0007Pz-Oa
 for qemu-arm@nongnu.org; Thu, 06 Jun 2019 19:35:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hZ1uN-0000sE-OB
 for qemu-arm@nongnu.org; Thu, 06 Jun 2019 19:35:01 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46386)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hZ1uL-0000oI-S2
 for qemu-arm@nongnu.org; Thu, 06 Jun 2019 19:34:59 -0400
Received: by mail-wr1-f68.google.com with SMTP id n4so275597wrw.13
 for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 16:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ohX5dO1S3F1UEXL9KGCGLISev2OwPzeptWW2jNr/7GY=;
 b=igMKc955sMWkI2VBPnpg4NamT0p27uWdFTdc5RU4ao/4wQJU3+cZTmdQRkYGPAam8o
 5dPfgtL/peYaLU7Dh/JtMCJxHPIlNOTptx6PLqiYg5fXrBf9ybXSAvltNUV6Ai/InAEP
 5vpQ28cUQuX8FHjIEPvH1lMWAj/k1JCLX+r9sMcOL4IlRLrzo0Tc9hRn7DCLvtASjKR5
 74oKcik025GB87eTGS440LzxZp4e4kyh9g+1Jkd18Fl6aR1r+2LempsCxSOr362C/cmB
 J6ueOg7qWry4ES5EJShBGGdbtYVqSp0EDuytD0XAkIjtFE5ICJd0h+C9PuYduJmgk4Sq
 PHlg==
X-Gm-Message-State: APjAAAV2kFyf3DnKxtwy8R/0N3FKiM+KELd2+5jvnkZQDVTuwiWxcyZl
 YREXSLVTKbJ9vk1AZq4ED4KeHQ==
X-Received: by 2002:adf:c541:: with SMTP id s1mr17165822wrf.44.1559864095132; 
 Thu, 06 Jun 2019 16:34:55 -0700 (PDT)
Received: from [192.168.0.156] ([78.192.181.46])
 by smtp.gmail.com with ESMTPSA id d17sm308019wrx.9.2019.06.06.16.34.54
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 16:34:54 -0700 (PDT)
To: Eddie James <eajames@linux.ibm.com>, qemu-arm@nongnu.org
References: <1559599768-9176-1-git-send-email-eajames@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <29f493c1-ac0c-684f-a33e-8226be8db48b@redhat.com>
Date: Fri, 7 Jun 2019 01:34:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559599768-9176-1-git-send-email-eajames@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw: misc: Add Aspeed XDMA device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: andrew@aj.id.au, peter.maydell@linaro.org, joel@jms.id.au,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VYAW1hzrqJW9

Hi Eddie,

On 6/4/19 12:09 AM, Eddie James wrote:
> The XDMA engine embedded in the Aspeed SOCs performs PCI DMA operations
> between the SOC (acting as a BMC) and a host processor in a server.

If I got your model correctly, it does no DMA operation but simply
answer correctly to the BMC, and set 'operation done' IRQ with no delay.
So this is a dummy device. Then it would be more useful having ignored
DMA ops traced with trace-events.

> 
> The XDMA engine exists on the AST2400, AST2500, and AST2600 SOCs, so
> enable it for all of those.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  hw/arm/aspeed_soc.c           |  14 ++++
>  hw/misc/Makefile.objs         |   2 +-
>  hw/misc/aspeed_xdma.c         | 156 ++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/aspeed_soc.h   |   2 +
>  include/hw/misc/aspeed_xdma.h |  31 +++++++++
>  5 files changed, 204 insertions(+), 1 deletion(-)
>  create mode 100644 hw/misc/aspeed_xdma.c
>  create mode 100644 include/hw/misc/aspeed_xdma.h
> 
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index faff42b..b25bb18 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -31,6 +31,7 @@
>  #define ASPEED_SOC_VIC_BASE         0x1E6C0000
>  #define ASPEED_SOC_SDMC_BASE        0x1E6E0000
>  #define ASPEED_SOC_SCU_BASE         0x1E6E2000
> +#define ASPEED_SOC_XDMA_BASE        0x1E6E7000
>  #define ASPEED_SOC_SRAM_BASE        0x1E720000
>  #define ASPEED_SOC_TIMER_BASE       0x1E782000
>  #define ASPEED_SOC_WDT_BASE         0x1E785000
> @@ -159,6 +160,9 @@ static void aspeed_soc_init(Object *obj)
>  
>      sysbus_init_child_obj(obj, "ftgmac100", OBJECT(&s->ftgmac100),
>                            sizeof(s->ftgmac100), TYPE_FTGMAC100);
> +
> +    sysbus_init_child_obj(obj, "xdma", OBJECT(&s->xdma), sizeof(s->xdma),
> +                          TYPE_ASPEED_XDMA);
>  }
>  
>  static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> @@ -298,6 +302,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100), 0, ASPEED_SOC_ETH1_BASE);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100), 0,
>                         qdev_get_gpio_in(DEVICE(&s->vic), 2));
> +
> +    /* XDMA */
> +    object_property_set_bool(OBJECT(&s->xdma), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->xdma), 0, ASPEED_SOC_XDMA_BASE);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->xdma), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->vic), 6));
>  }
>  
>  static void aspeed_soc_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 77b9df9..a4483af 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -74,7 +74,7 @@ obj-$(CONFIG_ARMSSE_MHU) += armsse-mhu.o
>  
>  obj-$(CONFIG_PVPANIC) += pvpanic.o
>  obj-$(CONFIG_AUX) += auxbus.o
> -obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
> +obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o aspeed_xdma.o
>  obj-$(CONFIG_MSF2) += msf2-sysreg.o
>  obj-$(CONFIG_NRF51_SOC) += nrf51_rng.o
>  
> diff --git a/hw/misc/aspeed_xdma.c b/hw/misc/aspeed_xdma.c
> new file mode 100644
> index 0000000..fe3a32e
> --- /dev/null
> +++ b/hw/misc/aspeed_xdma.c
> @@ -0,0 +1,156 @@
> +/*
> + * ASPEED XDMA Controller
> + * Eddie James <eajames@linux.ibm.com>
> + *
> + * Copyright (C) 2019 IBM Corp
> + * SPDX-License-Identifer: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/error-report.h"
> +#include "hw/misc/aspeed_xdma.h"
> +#include "qapi/error.h"
> +
> +#define XDMA_BMC_CMDQ_ADDR         0x10
> +#define XDMA_BMC_CMDQ_ENDP         0x14
> +#define XDMA_BMC_CMDQ_WRP          0x18
> +#define  XDMA_BMC_CMDQ_W_MASK      0x0003FFFF
> +#define XDMA_BMC_CMDQ_RDP          0x1C
> +#define  XDMA_BMC_CMDQ_RDP_MAGIC   0xEE882266
> +#define XDMA_IRQ_ENG_CTRL          0x20
> +#define  XDMA_IRQ_ENG_CTRL_US_COMP BIT(4)
> +#define  XDMA_IRQ_ENG_CTRL_DS_COMP BIT(5)
> +#define  XDMA_IRQ_ENG_CTRL_W_MASK  0xBFEFF07F
> +#define XDMA_IRQ_ENG_STAT          0x24
> +#define  XDMA_IRQ_ENG_STAT_US_COMP BIT(4)
> +#define  XDMA_IRQ_ENG_STAT_DS_COMP BIT(5)
> +#define  XDMA_IRQ_ENG_STAT_RESET   0xF8000000
> +
> +#define TO_REG(addr) ((addr) / sizeof(uint32_t))
> +
> +static uint64_t aspeed_xdma_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    uint32_t val = 0;
> +    AspeedXDMAState *xdma = opaque;
> +
> +    if (addr < ASPEED_XDMA_REG_SIZE) {
> +        val = xdma->regs[TO_REG(addr)];
> +    }
> +
> +    return (uint64_t)val;
> +}
> +
> +static void aspeed_xdma_write(void *opaque, hwaddr addr, uint64_t val,
> +                              unsigned int size)
> +{
> +    unsigned int idx;
> +    uint32_t val32 = (uint32_t)val;
> +    AspeedXDMAState *xdma = opaque;
> +
> +    if (addr >= ASPEED_XDMA_REG_SIZE) {
> +        return;
> +    }
> +
> +    switch (addr) {
> +    case XDMA_BMC_CMDQ_ENDP:
> +        xdma->regs[TO_REG(addr)] = val32 & XDMA_BMC_CMDQ_W_MASK;
> +        break;
> +    case XDMA_BMC_CMDQ_WRP:
> +        idx = TO_REG(addr);
> +        xdma->regs[idx] = val32 & XDMA_BMC_CMDQ_W_MASK;
> +        xdma->regs[TO_REG(XDMA_BMC_CMDQ_RDP)] = xdma->regs[idx];

The two previous lines are odd. Are they inverted?

I guess I'd trace here:

           trace_aspeed_xdma_...(val, ...);

> +
> +        if (xdma->bmc_cmdq_readp_set) {
> +            xdma->bmc_cmdq_readp_set = 0;
> +        } else {
> +            xdma->regs[TO_REG(XDMA_IRQ_ENG_STAT)] |=
> +                XDMA_IRQ_ENG_STAT_US_COMP | XDMA_IRQ_ENG_STAT_DS_COMP;
> +
> +            if (xdma->regs[TO_REG(XDMA_IRQ_ENG_CTRL)] &
> +                (XDMA_IRQ_ENG_CTRL_US_COMP | XDMA_IRQ_ENG_CTRL_DS_COMP))
> +                qemu_irq_raise(xdma->irq);
> +        }
> +        break;
> +    case XDMA_BMC_CMDQ_RDP:

Trace here too.

> +        if (val32 == XDMA_BMC_CMDQ_RDP_MAGIC) {
> +            xdma->bmc_cmdq_readp_set = 1;
> +        }
> +        break;
> +    case XDMA_IRQ_ENG_CTRL:
> +        xdma->regs[TO_REG(addr)] = val32 & XDMA_IRQ_ENG_CTRL_W_MASK;
> +        break;
> +    case XDMA_IRQ_ENG_STAT:
> +        idx = TO_REG(addr);
> +        if (val32 & (XDMA_IRQ_ENG_STAT_US_COMP | XDMA_IRQ_ENG_STAT_DS_COMP)) {
> +            xdma->regs[TO_REG(addr)] &=

                          ^ idx

> +                ~(XDMA_IRQ_ENG_STAT_US_COMP | XDMA_IRQ_ENG_STAT_DS_COMP);
> +            qemu_irq_lower(xdma->irq);
> +        }
> +        break;
> +    default:
> +        xdma->regs[TO_REG(addr)] = val32;
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps aspeed_xdma_ops = {
> +    .read = aspeed_xdma_read,
> +    .write = aspeed_xdma_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
> +};
> +
> +static void aspeed_xdma_realize(DeviceState *dev, Error **errp)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    AspeedXDMAState *xdma = ASPEED_XDMA(dev);
> +
> +    sysbus_init_irq(sbd, &xdma->irq);
> +    memory_region_init_io(&xdma->iomem, OBJECT(xdma), &aspeed_xdma_ops, xdma,
> +                          TYPE_ASPEED_XDMA, ASPEED_XDMA_MEM_SIZE);
> +    sysbus_init_mmio(sbd, &xdma->iomem);
> +}
> +
> +static void aspeed_xdma_reset(DeviceState *dev)
> +{
> +    AspeedXDMAState *xdma = ASPEED_XDMA(dev);
> +
> +    xdma->bmc_cmdq_readp_set = 0;
> +    memset(xdma->regs, 0, ASPEED_XDMA_REG_SIZE);
> +    xdma->regs[TO_REG(XDMA_IRQ_ENG_STAT)] = XDMA_IRQ_ENG_STAT_RESET;
> +
> +    qemu_irq_lower(xdma->irq);
> +}
> +
> +static const VMStateDescription aspeed_xdma_vmstate = {
> +    .name = TYPE_ASPEED_XDMA,
> +    .version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, AspeedXDMAState, ASPEED_XDMA_NUM_REGS),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +
> +static void aspeed_xdma_class_init(ObjectClass *classp, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(classp);
> +
> +    dc->realize = aspeed_xdma_realize;
> +    dc->reset = aspeed_xdma_reset;
> +    dc->vmsd = &aspeed_xdma_vmstate;
> +}
> +
> +static const TypeInfo aspeed_xdma_info = {
> +    .name          = TYPE_ASPEED_XDMA,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(AspeedXDMAState),
> +    .class_init    = aspeed_xdma_class_init,
> +};
> +
> +static void aspeed_xdma_register_type(void)
> +{
> +    type_register_static(&aspeed_xdma_info);
> +}
> +type_init(aspeed_xdma_register_type);
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 836b2ba..0329247 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -20,6 +20,7 @@
>  #include "hw/ssi/aspeed_smc.h"
>  #include "hw/watchdog/wdt_aspeed.h"
>  #include "hw/net/ftgmac100.h"
> +#include "hw/misc/aspeed_xdma.h"
>  
>  #define ASPEED_SPIS_NUM  2
>  #define ASPEED_WDTS_NUM  3
> @@ -40,6 +41,7 @@ typedef struct AspeedSoCState {
>      AspeedSDMCState sdmc;
>      AspeedWDTState wdt[ASPEED_WDTS_NUM];
>      FTGMAC100State ftgmac100;
> +    AspeedXDMAState xdma;
>  } AspeedSoCState;
>  
>  #define TYPE_ASPEED_SOC "aspeed-soc"
> diff --git a/include/hw/misc/aspeed_xdma.h b/include/hw/misc/aspeed_xdma.h
> new file mode 100644
> index 0000000..d19e9a7
> --- /dev/null
> +++ b/include/hw/misc/aspeed_xdma.h
> @@ -0,0 +1,31 @@
> +/*
> + * ASPEED XDMA Controller
> + * Eddie James <eajames@linux.ibm.com>
> + *
> + * Copyright (C) 2019 IBM Corp.
> + * SPDX-License-Identifer: GPL-2.0-or-later
> + */
> +
> +#ifndef ASPEED_XDMA_H
> +#define ASPEED_XDMA_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_ASPEED_XDMA "aspeed.xdma"
> +#define ASPEED_XDMA(obj) OBJECT_CHECK(AspeedXDMAState, (obj), TYPE_ASPEED_XDMA)
> +
> +#define ASPEED_XDMA_MEM_SIZE 0x1000

Maybe you can keep ASPEED_XDMA_MEM_SIZE private in the source file.

> +#define ASPEED_XDMA_NUM_REGS (ASPEED_XDMA_REG_SIZE / sizeof(uint32_t))
> +#define ASPEED_XDMA_REG_SIZE 0x7C

0x80?

> +
> +typedef struct AspeedXDMAState {
> +    SysBusDevice parent;
> +
> +    MemoryRegion iomem;
> +    qemu_irq irq;
> +
> +    char bmc_cmdq_readp_set;
> +    uint32_t regs[ASPEED_XDMA_NUM_REGS];
> +} AspeedXDMAState;
> +
> +#endif /* ASPEED_XDMA_H */
> 

Few questions, but otherwise LGTM.

Regards,

Phil.
