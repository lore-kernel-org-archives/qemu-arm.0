Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp356030lfg;
        Tue, 17 Aug 2021 02:45:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw14ap8oEtea9SemZZSbQ5VcuBIo8ir5LcsMHy5YIo325N99NP1dwZC3rMn8xwSV7D4S4Y8
X-Received: by 2002:a37:5d83:: with SMTP id r125mr2790626qkb.251.1629193507395;
        Tue, 17 Aug 2021 02:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629193507; cv=none;
        d=google.com; s=arc-20160816;
        b=uqAGM0blxWYR3PnQo+fMCbRinvJyeiK9n6+ULOYNEauzyBay+sX0oMcN4n9JInREnV
         aL5CPdkpGqzuuf5Tf6C/ocEl82mCoRE7wQ81aKl/Wm8/kp3r0X1/JQlRrl1HHcCiPPAC
         jkZ4AnPjZCnIUh3me/o8U9sbFZENRQHrTYqZzgmaMye+6iWqvMIQGvwE64ha5lkowOoK
         pseIgtnz6EtTCzrs9qpl3l2GyTvwFJrhB3LRm7AZkYkmnfaCPioz8AVGwoG9otipKNM9
         88VRBl/aTp8a8CfBzqfBJMohf3d5SfXRzO72VFVvHPEuyq5rBu0SeKTwvkPGR234k/OY
         KY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=5O1ygyha8gywJe77jWHlZQ7fAe2nin+8TAWXoUEo1SY=;
        b=kDkAdWGct2dTsQ9JULpuQtZJ3hmlqOEx8e6GF9Z8gDqYFLN9Dm8p/uevtC+Qp6EtAE
         yEDv2PSxREYe3UgqXF7Td4Ps07NvFqMBIVXPpJSgQvNkVHcsjKFh6GmMtukqB1JbUUzW
         shBUAYuD3hMFgMxAODmt7/KJoSt3/DfgY1ZiQZMe5FgiUDxC3aDkCRgQIVQqa7mXuoBv
         c1u4ZfLMBajYB5c+SzCdlkOyH+egpM113CKs5TfxGPx0bMs81CXO9zV5g1/BiXsTkUQV
         cGEGSCqG5RUoso6M/vWeqt529TtlLgoSCU4ukMwhFZwf1EOAD6aK9XW4k2C+WV2NkZU6
         ayxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b="TTM/+4wS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6si1383926qki.271.2021.08.17.02.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 02:45:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b="TTM/+4wS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:59436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFvec-0008Q9-Lc
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 05:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFveT-0008N3-2h; Tue, 17 Aug 2021 05:44:57 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:54780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFveQ-0004nM-SQ; Tue, 17 Aug 2021 05:44:56 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 087E8C6019D;
 Tue, 17 Aug 2021 11:44:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1629193492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5O1ygyha8gywJe77jWHlZQ7fAe2nin+8TAWXoUEo1SY=;
 b=TTM/+4wSMaCrHXsV1Ee1MB/RePaVwYm2xEAn7px8OV/+OZR3DSnWJ6g7vqr6XA/2eL6gSv
 l1DwkrlD2R77gu7Lt8B/mfllQ6xzC6b286pfUgrvtYvVnc63l14+Gfr1JaAz0jWQJnVqlS
 VchgHKtv7FasbHIOYlR24+/rVpPuErpyMtdxyMQLARHn7ShAqTJTn7co+yziFR1KjUXaKl
 gHtzWCrZT23hU+1yI96AKyuPcdh4kvyD/8aUbWBocRHmXOyT4JlZyE7L8vmAelvmCc5nOW
 dHSFkOlh50hY//8gILnd6/Ne9uE0GNvS/cQGrDqyjJsX987yq+ZxJfpGBNRq9A==
Date: Tue, 17 Aug 2021 11:47:04 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 12/25] hw/arm/stm32f205: Wire up sysclk and refclk
Message-ID: <20210817094704.4vdrdpfo36vzfy2x@sekoia-pc.home.lmichel.fr>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-13-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812093356.1946-13-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5oTgjYstnVE9

On 10:33 Thu 12 Aug     , Peter Maydell wrote:
> Wire up the sysclk and refclk for the stm32f205 SoC.  This SoC always
> runs the systick refclk at 1/8 the frequency of the main CPU clock,
> so the board code only needs to provide a single sysclk clock.
> 
> Because there is only one board using this SoC, we convert the SoC
> and the board together, rather than splitting it into "add clock to
> SoC; connect clock in board; add error check in SoC code that clock
> is wired up".
> 
> When the systick device starts honouring its clock inputs, this will
> fix an emulation inaccuracy in the netduino2 board where the systick
> reference clock was running at 1MHz rather than 15MHz.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/arm/stm32f205_soc.h |  4 ++++
>  hw/arm/netduino2.c             | 12 +++++++-----
>  hw/arm/stm32f205_soc.c         | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_soc.h
> index 75251494917..849d3ed8891 100644
> --- a/include/hw/arm/stm32f205_soc.h
> +++ b/include/hw/arm/stm32f205_soc.h
> @@ -32,6 +32,7 @@
>  #include "hw/or-irq.h"
>  #include "hw/ssi/stm32f2xx_spi.h"
>  #include "hw/arm/armv7m.h"
> +#include "hw/clock.h"
>  #include "qom/object.h"
>  
>  #define TYPE_STM32F205_SOC "stm32f205-soc"
> @@ -67,6 +68,9 @@ struct STM32F205State {
>      MemoryRegion sram;
>      MemoryRegion flash;
>      MemoryRegion flash_alias;
> +
> +    Clock *sysclk;
> +    Clock *refclk;
>  };
>  
>  #endif
> diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
> index 1733b71507c..b5c0ba23ee5 100644
> --- a/hw/arm/netduino2.c
> +++ b/hw/arm/netduino2.c
> @@ -26,6 +26,7 @@
>  #include "qapi/error.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/qdev-clock.h"
>  #include "qemu/error-report.h"
>  #include "hw/arm/stm32f205_soc.h"
>  #include "hw/arm/boot.h"
> @@ -36,16 +37,17 @@
>  static void netduino2_init(MachineState *machine)
>  {
>      DeviceState *dev;
> +    Clock *sysclk;
>  
> -    /*
> -     * TODO: ideally we would model the SoC RCC and let it handle
> -     * system_clock_scale, including its ability to define different
> -     * possible SYSCLK sources.
> -     */
>      system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
>  
> +    /* This clock doesn't need migration because it is fixed-frequency */
> +    sysclk = clock_new(OBJECT(machine), "SYSCLK");
> +    clock_set_hz(sysclk, SYSCLK_FRQ);
> +
>      dev = qdev_new(TYPE_STM32F205_SOC);
>      qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
> +    qdev_connect_clock_in(dev, "sysclk", sysclk);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>  
>      armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> index 0bd215aebd7..c6b75a381d9 100644
> --- a/hw/arm/stm32f205_soc.c
> +++ b/hw/arm/stm32f205_soc.c
> @@ -29,6 +29,7 @@
>  #include "exec/address-spaces.h"
>  #include "hw/arm/stm32f205_soc.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/qdev-clock.h"
>  #include "sysemu/sysemu.h"
>  
>  /* At the moment only Timer 2 to 5 are modelled */
> @@ -74,6 +75,9 @@ static void stm32f205_soc_initfn(Object *obj)
>      for (i = 0; i < STM_NUM_SPIS; i++) {
>          object_initialize_child(obj, "spi[*]", &s->spi[i], TYPE_STM32F2XX_SPI);
>      }
> +
> +    s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
> +    s->refclk = qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0);
>  }
>  
>  static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
> @@ -85,6 +89,30 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>  
>      MemoryRegion *system_memory = get_system_memory();
>  
> +    /*
> +     * We use s->refclk internally and only define it with qdev_init_clock_in()
> +     * so it is correctly parented and not leaked on an init/deinit; it is not
> +     * intended as an externally exposed clock.
> +     */
> +    if (clock_has_source(s->refclk)) {
> +        error_setg(errp, "refclk clock must not be wired up by the board code");
> +        return;
> +    }
> +
> +    if (!clock_has_source(s->sysclk)) {
> +        error_setg(errp, "sysclk clock must be wired up by the board code");
> +        return;
> +    }
> +
> +    /*
> +     * TODO: ideally we should model the SoC RCC and its ability to
> +     * change the sysclk frequency and define different sysclk sources.
> +     */
> +
> +    /* The refclk always runs at frequency HCLK / 8 */
> +    clock_set_mul_div(s->refclk, 8, 1);
> +    clock_set_source(s->refclk, s->sysclk);
> +
>      memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F205.flash",
>                             FLASH_SIZE, &error_fatal);
>      memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
> @@ -101,6 +129,8 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
>      qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
>      qdev_prop_set_bit(armv7m, "enable-bitband", true);
> +    qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
> +    qdev_connect_clock_in(armv7m, "refclk", s->refclk);
>      object_property_set_link(OBJECT(&s->armv7m), "memory",
>                               OBJECT(get_system_memory()), &error_abort);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
> -- 
> 2.20.1
> 

-- 
