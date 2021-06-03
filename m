Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp149295lfa;
        Thu, 3 Jun 2021 04:43:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVqEXhSvIlqUcuBB5ypjNSzGw3KK+bAH4ULWjWIpKHs4UYrumFfwgpORG6SSDhFUDS1Lm1
X-Received: by 2002:a25:cc0b:: with SMTP id l11mr49471606ybf.227.1622720603493;
        Thu, 03 Jun 2021 04:43:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622720603; cv=none;
        d=google.com; s=arc-20160816;
        b=ZWaHREl9N/6t0GGnY3EdG07tysk/V5piE8airi+noLdu9Z28LdhC0GkwptmWXiSsMd
         KFPBfJT2GAgAupH+gZp+wnGcSyg72PmI1J7TYdfXssjIW0CBDZKWRtaNv8ey3kozklgX
         /dS8SUziauRwnq/jAap/1oYGY7kKd3LqHcl7TDOiTwvWg4Ee65SyKYkJ8gESLEYOmF/0
         PGuZ2gQZ08FK9KIfOLzMYCyUlaA3GXRBQMb26LCKZsuKg17vq5nAmhGHu7t68viVLzss
         LQIZOfCUMykrxqtPaHG4u/Ue6dJTZGDH/esiXH9U/u9WwfDrzzNG4dLGcTpRk0Wz91/R
         eX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=hePt84QAzZ1tfsNCGGwklYvRPnR58S3Qt8jP+ioo4Kk=;
        b=hgzXxuu5zRV9qD1VkEwnh5sMmN0p5NYNozHqtHUjKgkY6ue96NoZxVcFUTwylYxl+X
         aKWi8pW83Iyva1pepU0YImfO9pZGHkpG3aw4CRxHKhhl2lDQDxTfiEiEsgvD18BbfWqn
         O0A+VRAccTlTYv3QHbBxcJUdFUSLSZgexSGG6ns3E2LlfZtyQPPu6T3o+rCEF6gLusSt
         7fthdBt1qpwpSIVq4KS1t6UglBN5h2V7c6z+I/RGFPKdaiXRcHOEYy6pPeDAT9ymuhtb
         JNZ2M0cvTS9f6xkJ0DW9HvqBGVJRGXvTlwmp4tkwbgCHDH/EGoSKOTSHU8YCTsFL48yP
         OSwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=EuyIWiU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si2732602ybb.156.2021.06.03.04.43.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 04:43:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=EuyIWiU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lolkw-0002W3-RD
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 07:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lolkd-0002VA-2b
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 07:43:03 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lolkZ-0006m3-0o
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 07:43:02 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 o2-20020a05600c4fc2b029019a0a8f959dso3528299wmq.1
 for <qemu-arm@nongnu.org>; Thu, 03 Jun 2021 04:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hePt84QAzZ1tfsNCGGwklYvRPnR58S3Qt8jP+ioo4Kk=;
 b=EuyIWiU3aB83+K4gk5vlbhMAp84+TWYQ7cFDzh/VeTmULQraw0Py3LeaKoCqDdrLwK
 FPmiSy6PACG/G/j0Ex2iQQ1muNTtBgW7o//A6nnFzqvhLEN1mFe+HDUCAuAXFzGlqPUr
 1+l0mGaVR76BUkX9XtBbMF0FNHwf2XZstNodkbye4oXWfDS7KYiS6VfBiVpa+7GvRh1F
 WABTA/G0wxN/IBjR4rAvAoBZs+vXpK2Wx7K8wTGY1LBNZvxRFx7J8HzfdpPDby7DPqqq
 1/gAPKIgBS4Ocd/GCtx6BXa7DX/WxBknKCihWVEkHzBgJczMFGw79RKqXWafyuPdYUXZ
 GneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hePt84QAzZ1tfsNCGGwklYvRPnR58S3Qt8jP+ioo4Kk=;
 b=e4zvDgHPmDkw36NSVtqitIlQvKbupn4RmASV6OV8eeo+sIJOerBI3GcmgSEJJA0+i6
 3RUahpsavr7F5epNkLetPPMDJSPc9EkciDIeW9g/1bBdqjwuWOSEsHuhW2YM+/gK0gbn
 2YernCRWyLh46uyKwcDSVAiCltRnNrWGP62Os3AfV6j5dXf4eqhGVOc2DI1t8IFksP+0
 cfjN6anjhz+QTesVfZ6HJPc3Yi14pvdpPk4os5efElwkg00k6QTA/th4yYW3Ao7sQQ1R
 cdVpEPcxdqb++/doujH/U0C/G1jsBN2/ckBrN/3WmvndZXxdq2SLQQggXDgUA4e7PIq/
 h5YQ==
X-Gm-Message-State: AOAM532vPfr6qDtqeUqU35gXAIv2pM1IeNcRxBLWW8mV8hx9pAyTNQzK
 GOKW1qwXvfnLaAeRDwzovtVyXA==
X-Received: by 2002:a05:600c:22cf:: with SMTP id
 15mr30759939wmg.144.1622720576345; 
 Thu, 03 Jun 2021 04:42:56 -0700 (PDT)
Received: from leviathan (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id k82sm5821199wmf.11.2021.06.03.04.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 04:42:55 -0700 (PDT)
Date: Thu, 3 Jun 2021 12:42:54 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: [PATCH v4 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Message-ID: <20210603114254.mkqr4jnpfqkx3m6w@leviathan>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-8-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602180042.111347-8-shashi.mallela@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, rad@semihalf.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vOBTNHsdzlkH

On Wed, Jun 02, 2021 at 14:00:41 -0400, Shashi Mallela wrote:
> Included creation of ITS as part of SBSA platform GIC
> initialization.
> 
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 43c19b4923..3d9c073636 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -34,7 +34,7 @@
>  #include "hw/boards.h"
>  #include "hw/ide/internal.h"
>  #include "hw/ide/ahci_internal.h"
> -#include "hw/intc/arm_gicv3_common.h"
> +#include "hw/intc/arm_gicv3_its_common.h"
>  #include "hw/loader.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/qdev-properties.h"
> @@ -64,6 +64,7 @@ enum {
>      SBSA_CPUPERIPHS,
>      SBSA_GIC_DIST,
>      SBSA_GIC_REDIST,
> +    SBSA_GIC_ITS,
>      SBSA_SECURE_EC,
>      SBSA_GWDT,
>      SBSA_GWDT_REFRESH,
> @@ -107,6 +108,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
>      [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
>      [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
>      [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },

It seems customary in QEMU to flag gaps in memory space (although
admittedly, we'd already failed to do so here). This patch leaves a
gap of 0x00010000. Is there a particular reason?

> +    [SBSA_GIC_ITS] =            { 0x44090000, 0x00020000 },

And then again a gap (the one we already had).

/
    Leif

>      [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
>      [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
>      [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
> @@ -377,7 +379,20 @@ static void create_secure_ram(SBSAMachineState *sms,
>      memory_region_add_subregion(secure_sysmem, base, secram);
>  }
>  
> -static void create_gic(SBSAMachineState *sms)
> +static void create_its(SBSAMachineState *sms)
> +{
> +    DeviceState *dev;
> +
> +    dev = qdev_new(TYPE_ARM_GICV3_ITS);
> +    SysBusDevice *s = SYS_BUS_DEVICE(dev);
> +
> +    object_property_set_link(OBJECT(dev), "parent-gicv3", OBJECT(sms->gic),
> +                             &error_abort);
> +    sysbus_realize_and_unref(s, &error_fatal);
> +    sysbus_mmio_map(s, 0, sbsa_ref_memmap[SBSA_GIC_ITS].base);
> +}
> +
> +static void create_gic(SBSAMachineState *sms, MemoryRegion *mem)
>  {
>      unsigned int smp_cpus = MACHINE(sms)->smp.cpus;
>      SysBusDevice *gicbusdev;
> @@ -404,6 +419,10 @@ static void create_gic(SBSAMachineState *sms)
>      qdev_prop_set_uint32(sms->gic, "len-redist-region-count", 1);
>      qdev_prop_set_uint32(sms->gic, "redist-region-count[0]", redist0_count);
>  
> +    object_property_set_link(OBJECT(sms->gic), "sysmem", OBJECT(mem),
> +                                 &error_fatal);
> +    qdev_prop_set_bit(sms->gic, "has-lpi", true);
> +
>      gicbusdev = SYS_BUS_DEVICE(sms->gic);
>      sysbus_realize_and_unref(gicbusdev, &error_fatal);
>      sysbus_mmio_map(gicbusdev, 0, sbsa_ref_memmap[SBSA_GIC_DIST].base);
> @@ -450,6 +469,7 @@ static void create_gic(SBSAMachineState *sms)
>          sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
>                             qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
>      }
> +    create_its(sms);
>  }
>  
>  static void create_uart(const SBSAMachineState *sms, int uart,
> @@ -762,7 +782,7 @@ static void sbsa_ref_init(MachineState *machine)
>  
>      create_secure_ram(sms, secure_sysmem);
>  
> -    create_gic(sms);
> +    create_gic(sms, sysmem);
>  
>      create_uart(sms, SBSA_UART, sysmem, serial_hd(0));
>      create_uart(sms, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
> -- 
> 2.27.0
> 
