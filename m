Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp1144556lfb;
        Fri, 22 Jan 2021 11:52:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyK2K1mJ+XMvQndZzspP3V7RhAaLxJRyid4OuTE1Gh8T/bvS0U3MHfrGFMR7p4AcD1uD1iQ
X-Received: by 2002:a25:ba08:: with SMTP id t8mr8389327ybg.316.1611345136895;
        Fri, 22 Jan 2021 11:52:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611345136; cv=none;
        d=google.com; s=arc-20160816;
        b=A7EkiRSJckoUVDUIAyhggVu9+nBfYEbBVu4nUIk3DIuHgv3Ns0zPegsXWJNjzbowef
         7esNSx7yPe/rYIaScp0TVdgA928nSFP/UoJc29MyGnjwkxQfmMzLYQdX6QRaY6G9Sd1Q
         lLhWMQrsdSM0BH4nbt08Wo875DllauQwTL97SbZIX9e0VvKtvMQCVEB6EqY3dOv1hQel
         VnFmKY46C2TDqe65/QvohEfYy4nY0qUecNvhb8+fDAgJde3iqyHRDbKlJEnW9fEi3N3i
         7XQUys5cZXDF4/EnRcEY4KnooFp/AVgyW7VVjiNRlX2gBYM1tvog6hK4U8Z3uvdFJzMz
         Apmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Wmcscl1Xb9UoU4w05+zUFfzC7ziHZySaeSCTfo7Q0ys=;
        b=NE6pkoH+Ok0e6049ZigM5p920wXM0ZrW/5EioVYJYoYXq5mCsLNbfGnpqSyz2SUfBB
         ItvdWjMNd4t5ENVFcMItXg0aZuoKrJl0hG4FkD1ggDwugaNkzZGD5VggG8QfZkazu0tV
         rRIdwWfZlgwAEt+oK2nQsbFWdMu8zFVLGL+YO+2sYzKEqvFuqML8KX3tGcSGgv6072G4
         HyCYVNnLbXhEVXeNjFDGPIStzMRB4XCMXnLhdaPVovHuSI1s5PNA/IidQ/XDoo/5U1Iz
         hf2VgIzruGbxWPUyShdkZyG7Q7u12PBc5MfvN9AVJlbqEnM85lD579groF4vr3FVskww
         FHxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=bW0B7YaJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15si8189647ybk.325.2021.01.22.11.52.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 11:52:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=bW0B7YaJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:55628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l32Tg-0005dR-9a
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 14:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l32TS-0005by-W1; Fri, 22 Jan 2021 14:52:03 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:49606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l32TQ-0005Gr-JP; Fri, 22 Jan 2021 14:52:02 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 17A2BC602E6;
 Fri, 22 Jan 2021 20:51:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611345114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wmcscl1Xb9UoU4w05+zUFfzC7ziHZySaeSCTfo7Q0ys=;
 b=bW0B7YaJs8tHKwiUR83xhfiKwkZYM0HJk5Gw8OUgd45aHow2Sbq+Lr5mLsYX6qECt8vULG
 G4cFQ6/Jk9bajQdKqbDWRf0deDLwFZF8ZXBjIwH6lKoe9+2Rw0DCix17AGGvJuMzIZKuZd
 N6uBuiUtHDKpfNPdnwvL1xlbhwqkhwH5bLTunR9BYsrVoq+Sd3Enq2hffjPlps+29U6AgG
 O4dpbbJ2Eaacggor6W3xOGaB/nCR1juMQ4oSRxSCYMBIyVx4SP+NR/cDlV0FeEvvToW0Rr
 DfWGdH74TwMJCefE0Ma4iGM+HLGuG8v6/6V+RAgYj7Y2CwZshbAeH+GpXKvKng==
Date: Fri, 22 Jan 2021 20:52:15 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 13/25] hw/arm/mps2: Create and connect SYSCLK Clock
Message-ID: <20210122195215.yw7qoldfdyojsaxn@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-14-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-14-peter.maydell@linaro.org>
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mdx4tmCW25Ak

On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> Create a fixed-frequency Clock object to be the SYSCLK, and wire it
> up to the devices that require it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/arm/mps2.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index f762d1b46af..cd1c215f941 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -46,6 +46,7 @@
>  #include "hw/net/lan9118.h"
>  #include "net/net.h"
>  #include "hw/watchdog/cmsdk-apb-watchdog.h"
> +#include "hw/qdev-clock.h"
>  #include "qom/object.h"
>  
>  typedef enum MPS2FPGAType {
> @@ -84,6 +85,7 @@ struct MPS2MachineState {
>      CMSDKAPBDualTimer dualtimer;
>      CMSDKAPBWatchdog watchdog;
>      CMSDKAPBTimer timer[2];
> +    Clock *sysclk;
>  };
>  
>  #define TYPE_MPS2_MACHINE "mps2"
> @@ -140,6 +142,10 @@ static void mps2_common_init(MachineState *machine)
>          exit(EXIT_FAILURE);
>      }
>  
> +    /* This clock doesn't need migration because it is fixed-frequency */
> +    mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
> +    clock_set_hz(mms->sysclk, SYSCLK_FRQ);
> +
>      /* The FPGA images have an odd combination of different RAMs,
>       * because in hardware they are different implementations and
>       * connected to different buses, giving varying performance/size
> @@ -341,6 +347,7 @@ static void mps2_common_init(MachineState *machine)
>                                  TYPE_CMSDK_APB_TIMER);
>          sbd = SYS_BUS_DEVICE(&mms->timer[i]);
>          qdev_prop_set_uint32(DEVICE(&mms->timer[i]), "pclk-frq", SYSCLK_FRQ);
> +        qdev_connect_clock_in(DEVICE(&mms->timer[i]), "pclk", mms->sysclk);
>          sysbus_realize_and_unref(sbd, &error_fatal);
>          sysbus_mmio_map(sbd, 0, base);
>          sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(armv7m, irqno));
> @@ -349,6 +356,7 @@ static void mps2_common_init(MachineState *machine)
>      object_initialize_child(OBJECT(mms), "dualtimer", &mms->dualtimer,
>                              TYPE_CMSDK_APB_DUALTIMER);
>      qdev_prop_set_uint32(DEVICE(&mms->dualtimer), "pclk-frq", SYSCLK_FRQ);
> +    qdev_connect_clock_in(DEVICE(&mms->dualtimer), "TIMCLK", mms->sysclk);
>      sysbus_realize(SYS_BUS_DEVICE(&mms->dualtimer), &error_fatal);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&mms->dualtimer), 0,
>                         qdev_get_gpio_in(armv7m, 10));
> @@ -356,6 +364,7 @@ static void mps2_common_init(MachineState *machine)
>      object_initialize_child(OBJECT(mms), "watchdog", &mms->watchdog,
>                              TYPE_CMSDK_APB_WATCHDOG);
>      qdev_prop_set_uint32(DEVICE(&mms->watchdog), "wdogclk-frq", SYSCLK_FRQ);
> +    qdev_connect_clock_in(DEVICE(&mms->watchdog), "WDOGCLK", mms->sysclk);
>      sysbus_realize(SYS_BUS_DEVICE(&mms->watchdog), &error_fatal);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&mms->watchdog), 0,
>                         qdev_get_gpio_in_named(armv7m, "NMI", 0));
> -- 
> 2.20.1
> 

-- 
