Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp1145010lfb;
        Fri, 22 Jan 2021 11:53:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypVaYqBVNMmV8z+Y2cK+iIKxVTd21laYwWBOVZbMHy4RA2S1yt1mYaEJgqulBe/R5uvGQB
X-Received: by 2002:a25:8283:: with SMTP id r3mr8568782ybk.66.1611345195779;
        Fri, 22 Jan 2021 11:53:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611345195; cv=none;
        d=google.com; s=arc-20160816;
        b=WSsy9rAjSTeR4FvLtU6FcM1nW514RO1PeARhifTgsCoY0DwCjx4Y53F8zsYgIeHDza
         byLCg1r2mr0S+qVcY0rxlQ7ePOxmefn9ppnmGC9dd+MD2J6/4nrBBjR23I0AK0WQI6eX
         8wQCLUaEJ09ozHLs1vp/H0UAOJbxkpzTkwgTTdzVHub6/1w3V1ZzOLrUzCSovdzcfCpo
         e5Iutf8p1oVy2mjfnMfabTF2vAaCmxI/tOYgpydq3nxJEYhMD3EH/kDNHGXFxVVoCh/i
         y7+DpJXumRgY/JVKO+y9hLUbo1/q9ukE+pAw303U0lY7cBq+rFk3h4xaMBKByAmWUZlw
         kjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=XOypW6orXQcKL1DdZ6guwBXdmIKbtJmsHqcnKk03GLg=;
        b=hXX3SR1W/6oYPKdAKtnJW9tlK1yKn32vhsSyVbZi2ELuBw9EO8ictY4537foVPVTus
         hbSDL7angB47FVLjcWUoTLo/965aqk7z+swIgAq3LyO3l7P1lgDCK7UAQ9ftmqjxe/JO
         IJ2gAGBonx2tA9vtNibSrOmOPwHOBkQLM9+WFKjhYh1W2Jgh5nk1FNrCvgHtZ+YyqCDy
         nAOAY7ki3zQtUNJrctrFGHuIhu/McXvdfBkfHV6zUr5hvV90JFRpTlwyKuMORsIEOgBY
         ImB4w7Er+RpkpwrA2WyKuzRBI8KBUX7nOYgOm3Q6OaCIg3EpmQxDnKsG7pbjCdKeEsUe
         DrOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=LfPQBSc8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a184si9784932yba.451.2021.01.22.11.53.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 11:53:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=LfPQBSc8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:56824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l32Ud-000697-6I
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 14:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l32U6-000670-Dj; Fri, 22 Jan 2021 14:52:42 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:49658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l32Ty-0005T9-4Y; Fri, 22 Jan 2021 14:52:42 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 1D6BDC602E6;
 Fri, 22 Jan 2021 20:52:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611345151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XOypW6orXQcKL1DdZ6guwBXdmIKbtJmsHqcnKk03GLg=;
 b=LfPQBSc8HLx2/MQSAQa3BWMJn9Ye9goxsabsRmI44zDh2dvj3ZExzqREfxSxTsCKyYaezY
 atf5P5ZHwTDSn7o8iaO+RQNeroJEJMQqwILFY/mLTC40q2W6VsjIY30eh+TEbyLMTR3pSc
 08d1tTsx6gC7F9lamT8W59boLs1xN4A7q1R2t3h2PaRY+6sF8nHs94p5Q3P3A0fXPLmZsB
 y7h0mQek8ZeUmf8nulVv2iC4REEDQ/91InAk3ZDDRgmVLuTv+TEscJFhN22xlygYEmtRrY
 YkgHGeWtNmG++XC4BSgOlDqp5/KU6+LmeVP0pufdXiVB9JQWOj8zk9ux6Gx6VQ==
Date: Fri, 22 Jan 2021 20:52:52 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 14/25] hw/arm/mps2-tz: Create and connect ARMSSE Clocks
Message-ID: <20210122195252.vq6jmtdqkqgv53jt@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-15-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-15-peter.maydell@linaro.org>
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
X-TUID: qG8Vm2wyJ4Yy

On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> Create and connect the two clocks needed by the ARMSSE.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/arm/mps2-tz.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 6a9eed9022a..7acdf490f28 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -62,6 +62,7 @@
>  #include "hw/net/lan9118.h"
>  #include "net/net.h"
>  #include "hw/core/split-irq.h"
> +#include "hw/qdev-clock.h"
>  #include "qom/object.h"
>  
>  #define MPS2TZ_NUMIRQ 92
> @@ -100,6 +101,8 @@ struct MPS2TZMachineState {
>      qemu_or_irq uart_irq_orgate;
>      DeviceState *lan9118;
>      SplitIRQ cpu_irq_splitter[MPS2TZ_NUMIRQ];
> +    Clock *sysclk;
> +    Clock *s32kclk;
>  };
>  
>  #define TYPE_MPS2TZ_MACHINE "mps2tz"
> @@ -110,6 +113,8 @@ OBJECT_DECLARE_TYPE(MPS2TZMachineState, MPS2TZMachineClass, MPS2TZ_MACHINE)
>  
>  /* Main SYSCLK frequency in Hz */
>  #define SYSCLK_FRQ 20000000
> +/* Slow 32Khz S32KCLK frequency in Hz */
> +#define S32KCLK_FRQ (32 * 1000)
>  
>  /* Create an alias of an entire original MemoryRegion @orig
>   * located at @base in the memory map.
> @@ -396,6 +401,12 @@ static void mps2tz_common_init(MachineState *machine)
>          exit(EXIT_FAILURE);
>      }
>  
> +    /* These clocks don't need migration because they are fixed-frequency */
> +    mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
> +    clock_set_hz(mms->sysclk, SYSCLK_FRQ);
> +    mms->s32kclk = clock_new(OBJECT(machine), "S32KCLK");
> +    clock_set_hz(mms->s32kclk, S32KCLK_FRQ);
> +
>      object_initialize_child(OBJECT(machine), TYPE_IOTKIT, &mms->iotkit,
>                              mmc->armsse_type);
>      iotkitdev = DEVICE(&mms->iotkit);
> @@ -403,6 +414,8 @@ static void mps2tz_common_init(MachineState *machine)
>                               OBJECT(system_memory), &error_abort);
>      qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", MPS2TZ_NUMIRQ);
>      qdev_prop_set_uint32(iotkitdev, "MAINCLK_FRQ", SYSCLK_FRQ);
> +    qdev_connect_clock_in(iotkitdev, "MAINCLK", mms->sysclk);
> +    qdev_connect_clock_in(iotkitdev, "S32KCLK", mms->s32kclk);
>      sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
>  
>      /*
> -- 
> 2.20.1
> 

-- 
