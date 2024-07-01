Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1535161njm;
        Mon, 1 Jul 2024 11:44:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXithFuGjiHO+TI+2BdkO4meB3juIqJVtXarduHe2nuqEk6Z/1v6zTYrWTK0l2wH35vUxNtEpoJU35OOPFAoI7enCLE/3xF
X-Google-Smtp-Source: AGHT+IFG7GmDWtR08t3IMk2ISEN9kXBnPEmKdRBiZkcDsKfWmYoNUMTCvvNX8ED/bDe3oB9/L9RZ
X-Received: by 2002:a05:622a:1450:b0:446:426b:70f9 with SMTP id d75a77b69052e-44662df3d1fmr92294511cf.24.1719859441125;
        Mon, 01 Jul 2024 11:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719859441; cv=none;
        d=google.com; s=arc-20160816;
        b=IIcKJpsrX65YtawSJ6ba0/3VYsdjFUJyBRj19txKIAvHoM/u+2lelJSon0lFnyhACo
         Y19LvOZlsSx+M6j/t0AhVsc3/TYcRMJi34S02/EfNyBTzi7xTuXdti99PVHe6vBV0ACL
         /xiGyxUK48a/A9sxdGx5dy+hqj7lraLLHD1/RdqohsuNKddOV2B5iW/qyPBWmOwzIx+H
         lh1HFvcG8E7F8wLWp9bGZoK55bl1UNELDidEAg22WuvdOjhzg3LspGXThbSJibf7NhXE
         pSvOflQ1UV1h8rdcdLi2b+m/6/fJwPrw6bfSnSqq68wW6U6uu8nRb2i7TYQRQwIh+8BB
         sMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=/t08kRa44q9W+ptTF51auBXzrEFnH8rCANtuh2eLx3c=;
        fh=mz6QU+R2ARrFGaX6AFbNQuoDoDh2mdgHQCuz2bNdl94=;
        b=ZcJUa+9FI9WEySrZqArC4bruKbG1nAp7Nh7P5LsgUhJXKpEbh1RUiVD2SAoFrTdXEG
         xYdM1WiJ5EqOuBiwPrjKoHGz+YbqVD+U3YtzzDtMK4R5uRzlR72YCe+EhGqD/4L8sllR
         gY3ZznNShsbnKL9FY/DdHhU0zsJbNDJTUn0Qo74w3x4wCem/8RZb6+6Tj6empU2a4Vo3
         GFzgqDoX6rQ5Sncw2hi/Ua9HJjkXggP0R5UZgLSehG0SEgknpOGMsighuOFnZzsUTG2H
         2kAiQ8y77mrh5d87Bc74TkVL2SfoGAR0GGGxwftS6r7x3onDe98HRaOOsBDVROHU+3w8
         mW4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@lmichel.fr header.s=pharaoh header.b=Ag0hLRKT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446514ac5d7si83607781cf.516.2024.07.01.11.44.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 11:44:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@lmichel.fr header.s=pharaoh header.b=Ag0hLRKT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOM0I-0005QR-Ef; Mon, 01 Jul 2024 14:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1sOM0D-0005OM-GG; Mon, 01 Jul 2024 14:43:51 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1sOM0B-0001hJ-Mu; Mon, 01 Jul 2024 14:43:49 -0400
Received: from localhost (sekoia-laptop.home.lmichel.fr [192.168.61.102])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id E6FFDC602A4;
 Mon,  1 Jul 2024 20:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1719859424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/t08kRa44q9W+ptTF51auBXzrEFnH8rCANtuh2eLx3c=;
 b=Ag0hLRKTOxwRFUjsso0s7BZkHFomoTxYvOK8EFlH0r9gWatsJt13RWhkllphe5LIuOUQTa
 M7ZA0px/4XydmOzPSAg1dp8R/6lQwhyFmOU5B+xxkd6/mO3BJPGtQcEGQ874jNnl0Rx9VG
 i6G2bH4QGLUlICKpN5erILzUeoWGJWcPIUK/qeARZVkwbNnlZWB9uMZOiv0UyJ/qyu4hNH
 0tXf4Jzp8JQEbHAaA6WZ9dXX0du14Rs7xRhrCMQ9BJEAetMvvfNGBaxyPVOD6+g39gmtmV
 YxZH8rRFycwl016bY1De2ykFXqoFGo9wITTD2faaHE8doPbaR9iRxLv25ctXHw==
Date: Mon, 1 Jul 2024 20:43:43 +0200
From: Luc Michel <luc@lmichel.fr>
To: =?utf-8?B?SW7DqHM=?= Varhol <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Damien Hedde <damien.hedde@dahe.fr>
Subject: Re: [PATCH v4 1/3] hw/misc: Create STM32L4x5 SYSCFG clock
Message-ID: <ZoL43zSdOE0qQ9pv@michell-laptop.localdomain>
References: <20240622094402.244604-1-ines.varhol@telecom-paris.fr>
 <20240622094402.244604-2-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240622094402.244604-2-ines.varhol@telecom-paris.fr>
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: j16TXWkFh27I

On 11:43 Sat 22 Jun     , Inès Varhol wrote:
> This commit creates a clock in STM32L4x5 SYSCFG and wires it up to the
> corresponding clock from STM32L4x5 RCC.
> 
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/misc/stm32l4x5_syscfg.h |  1 +
>  hw/arm/stm32l4x5_soc.c             |  2 ++
>  hw/misc/stm32l4x5_syscfg.c         | 19 +++++++++++++++++--
>  3 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/misc/stm32l4x5_syscfg.h b/include/hw/misc/stm32l4x5_syscfg.h
> index 23bb564150..c450df2b9e 100644
> --- a/include/hw/misc/stm32l4x5_syscfg.h
> +++ b/include/hw/misc/stm32l4x5_syscfg.h
> @@ -48,6 +48,7 @@ struct Stm32l4x5SyscfgState {
>      uint32_t swpr2;
>  
>      qemu_irq gpio_out[GPIO_NUM_PINS];
> +    Clock *clk;
>  };
>  
>  #endif
> diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
> index 38f7a2d5d9..fb2afa6cfe 100644
> --- a/hw/arm/stm32l4x5_soc.c
> +++ b/hw/arm/stm32l4x5_soc.c
> @@ -236,6 +236,8 @@ static void stm32l4x5_soc_realize(DeviceState *dev_soc, Error **errp)
>  
>      /* System configuration controller */
>      busdev = SYS_BUS_DEVICE(&s->syscfg);
> +    qdev_connect_clock_in(DEVICE(&s->syscfg), "clk",
> +        qdev_get_clock_out(DEVICE(&(s->rcc)), "syscfg-out"));
>      if (!sysbus_realize(busdev, errp)) {
>          return;
>      }
> diff --git a/hw/misc/stm32l4x5_syscfg.c b/hw/misc/stm32l4x5_syscfg.c
> index a5a1ce2680..a947a9e036 100644
> --- a/hw/misc/stm32l4x5_syscfg.c
> +++ b/hw/misc/stm32l4x5_syscfg.c
> @@ -26,6 +26,9 @@
>  #include "trace.h"
>  #include "hw/irq.h"
>  #include "migration/vmstate.h"
> +#include "hw/clock.h"
> +#include "hw/qdev-clock.h"
> +#include "qapi/error.h"
>  #include "hw/misc/stm32l4x5_syscfg.h"
>  #include "hw/gpio/stm32l4x5_gpio.h"
>  
> @@ -225,12 +228,22 @@ static void stm32l4x5_syscfg_init(Object *obj)
>      qdev_init_gpio_in(DEVICE(obj), stm32l4x5_syscfg_set_irq,
>                        GPIO_NUM_PINS * NUM_GPIOS);
>      qdev_init_gpio_out(DEVICE(obj), s->gpio_out, GPIO_NUM_PINS);
> +    s->clk = qdev_init_clock_in(DEVICE(s), "clk", NULL, s, 0);
> +}
> +
> +static void stm32l4x5_syscfg_realize(DeviceState *dev, Error **errp)
> +{
> +    Stm32l4x5SyscfgState *s = STM32L4X5_SYSCFG(dev);
> +    if (!clock_has_source(s->clk)) {
> +        error_setg(errp, "SYSCFG: clk input must be connected");
> +        return;
> +    }
>  }
>  
>  static const VMStateDescription vmstate_stm32l4x5_syscfg = {
>      .name = TYPE_STM32L4X5_SYSCFG,
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(memrmp, Stm32l4x5SyscfgState),
>          VMSTATE_UINT32(cfgr1, Stm32l4x5SyscfgState),
> @@ -241,6 +254,7 @@ static const VMStateDescription vmstate_stm32l4x5_syscfg = {
>          VMSTATE_UINT32(swpr, Stm32l4x5SyscfgState),
>          VMSTATE_UINT32(skr, Stm32l4x5SyscfgState),
>          VMSTATE_UINT32(swpr2, Stm32l4x5SyscfgState),
> +        VMSTATE_CLOCK(clk, Stm32l4x5SyscfgState),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> @@ -251,6 +265,7 @@ static void stm32l4x5_syscfg_class_init(ObjectClass *klass, void *data)
>      ResettableClass *rc = RESETTABLE_CLASS(klass);
>  
>      dc->vmsd = &vmstate_stm32l4x5_syscfg;
> +    dc->realize = stm32l4x5_syscfg_realize;
>      rc->phases.hold = stm32l4x5_syscfg_hold_reset;
>  }
>  
> -- 
> 2.43.2
> 

-- 
