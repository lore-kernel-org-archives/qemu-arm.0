Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp952092lfb;
        Fri, 22 Jan 2021 07:33:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGpyYdRUR1H99pM127vWd7ZI3Zg+km0/hC9Hm9WpaywWZyeKubpt3CQW9pgMSFeDp0KsRV
X-Received: by 2002:a25:45c3:: with SMTP id s186mr7048531yba.435.1611329637747;
        Fri, 22 Jan 2021 07:33:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611329637; cv=none;
        d=google.com; s=arc-20160816;
        b=BAxXPrY4fQkUWOX4MOBZV2ZyFiQnfKjevdACtlfHicL82lWEbMONs9+S5euKxviuI7
         aQVQ3CdvECXKehxHLaudd+XAysXYWIebChIED/TtYV0NlrwmG1v0wsE9zsgJvpPwEKuq
         QICQzjcM8/QbhOEUAZDxPan3d7EByk4u/uIoisOrtfdf3Czo2NBb1MzB07Gv0SSdRUAH
         Keh2YnXCNmy0zM1fJmT5TGKI3mlcM/uxsPGU01vB6cIslPNHFfYsrXH8pUEcjJ2ziBDw
         x6w+ia/M6BCiiaSqTeN1MZ9aHZHYPLP/lfCI02QinafZ4A6an6iIEYXHZB8wZyAaDptU
         7hBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=xeg4i8QeVQjatmW7drF6t6jp9MeDNxVlNliXw5wlWCc=;
        b=Vmk+0iK5ku5S9xE88yzfCnfj+MDy3WjkYo+AZkhpHfdzZSAWYj8gWzlEZLeBr4ALab
         fGBLKd5p85iSe466NFODQEFDxNqGg6qKtn2naxkburBMyRFBCprr5mjp6+mbN8UTnwME
         2VKamiZS0Y1iOPWKNrWiC9nDiYdR9l/xQZddXp2n8/ofUvV5vai5MfC3NQdRf5UO8Rx9
         CJrVh2KV8ffkVfxl4ZQZvroj7VubmjW0M1y5VIj86lzFL6luqvvk2u7WR4QgWmLnJsWE
         +6ZoVfVnsEwASwxEj92XaD4DXH3f+3oWUjiUrgiTfqMmxlmP0dWduaG0EcV0+uONsvDY
         jl2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=MgYycpkR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 83si6386881ybf.111.2021.01.22.07.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 07:33:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=MgYycpkR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:58494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2yRh-0004mW-5o
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 10:33:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l2yRU-0004lt-B7; Fri, 22 Jan 2021 10:33:44 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:38202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l2yRO-0002Ih-4M; Fri, 22 Jan 2021 10:33:44 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id EFA32C602E6;
 Fri, 22 Jan 2021 16:33:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611329615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xeg4i8QeVQjatmW7drF6t6jp9MeDNxVlNliXw5wlWCc=;
 b=MgYycpkRyYvt+Pps7DVFFWLHsGFWqM6Szcr+vhFi7YLUA5SbtPmyz/y1qclYWQ6MnPiFvw
 68cXxT0k95nfZaF4xH1En6KkxuBnvStHquowX5x+db6Qncp7BNenN5PfwtSWgekxl1Qgba
 N7hUHSEwlYrEZ8HsxsuX9sFFoGflWRL75NBASlKUZQD+A2Z1KV0O/TNRZj7z7hK2AEIww/
 7Iz+YuGufYqBehIw10OcAxRrGZbF4yIt9u5wOU4ekJmktCg1J392d36CVg5rvP8HGWyzjf
 uByZ5287xkCaiMyqDC1j9n10f1VFT+g4jsXeTMLb0knWQs+EikN+Irvw0nufVg==
Date: Fri, 22 Jan 2021 16:33:56 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 12/25] hw/arm/mps2: Inline CMSDK_APB_TIMER creation
Message-ID: <20210122153356.vngi3pmohaxvmb3k@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-13-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-13-peter.maydell@linaro.org>
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
X-TUID: EyIfvDIjjGXp

On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> The old-style convenience function cmsdk_apb_timer_create() for
> creating CMSDK_APB_TIMER objects is used in only two places in
> mps2.c.  Most of the rest of the code in that file uses the new
> "initialize in place" coding style.
> 
> We want to connect up a Clock object which should be done between the
> object creation and realization; rather than adding a Clock* argument
> to the convenience function, convert the timer creation code in
> mps2.c to the same style as is used already for the watchdog,
> dualtimer and other devices, and delete the now-unused convenience
> function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/timer/cmsdk-apb-timer.h | 21 ---------------------
>  hw/arm/mps2.c                      | 18 ++++++++++++++++--
>  2 files changed, 16 insertions(+), 23 deletions(-)
> 
> diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
> index fc2aa97acac..54f7ec8c502 100644
> --- a/include/hw/timer/cmsdk-apb-timer.h
> +++ b/include/hw/timer/cmsdk-apb-timer.h
> @@ -45,25 +45,4 @@ struct CMSDKAPBTimer {
>      uint32_t intstatus;
>  };
>  
> -/**
> - * cmsdk_apb_timer_create - convenience function to create TYPE_CMSDK_APB_TIMER
> - * @addr: location in system memory to map registers
> - * @pclk_frq: frequency in Hz of the PCLK clock (used for calculating baud rate)
> - */
> -static inline DeviceState *cmsdk_apb_timer_create(hwaddr addr,
> -                                                 qemu_irq timerint,
> -                                                 uint32_t pclk_frq)
> -{
> -    DeviceState *dev;
> -    SysBusDevice *s;
> -
> -    dev = qdev_new(TYPE_CMSDK_APB_TIMER);
> -    s = SYS_BUS_DEVICE(dev);
> -    qdev_prop_set_uint32(dev, "pclk-frq", pclk_frq);
> -    sysbus_realize_and_unref(s, &error_fatal);
> -    sysbus_mmio_map(s, 0, addr);
> -    sysbus_connect_irq(s, 0, timerint);
> -    return dev;
> -}
> -
>  #endif
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index 9a8b23c64ce..f762d1b46af 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -83,6 +83,7 @@ struct MPS2MachineState {
>      /* CMSDK APB subsystem */
>      CMSDKAPBDualTimer dualtimer;
>      CMSDKAPBWatchdog watchdog;
> +    CMSDKAPBTimer timer[2];
>  };
>  
>  #define TYPE_MPS2_MACHINE "mps2"
> @@ -330,8 +331,21 @@ static void mps2_common_init(MachineState *machine)
>      }
>  
>      /* CMSDK APB subsystem */
> -    cmsdk_apb_timer_create(0x40000000, qdev_get_gpio_in(armv7m, 8), SYSCLK_FRQ);
> -    cmsdk_apb_timer_create(0x40001000, qdev_get_gpio_in(armv7m, 9), SYSCLK_FRQ);
> +    for (i = 0; i < ARRAY_SIZE(mms->timer); i++) {
> +        g_autofree char *name = g_strdup_printf("timer%d", i);
> +        hwaddr base = 0x40000000 + i * 0x1000;
> +        int irqno = 8 + i;
> +        SysBusDevice *sbd;
> +
> +        object_initialize_child(OBJECT(mms), name, &mms->timer[i],
> +                                TYPE_CMSDK_APB_TIMER);
> +        sbd = SYS_BUS_DEVICE(&mms->timer[i]);
> +        qdev_prop_set_uint32(DEVICE(&mms->timer[i]), "pclk-frq", SYSCLK_FRQ);
> +        sysbus_realize_and_unref(sbd, &error_fatal);
> +        sysbus_mmio_map(sbd, 0, base);
> +        sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(armv7m, irqno));
> +    }
> +
>      object_initialize_child(OBJECT(mms), "dualtimer", &mms->dualtimer,
>                              TYPE_CMSDK_APB_DUALTIMER);
>      qdev_prop_set_uint32(DEVICE(&mms->dualtimer), "pclk-frq", SYSCLK_FRQ);
> -- 
> 2.20.1
> 

-- 
