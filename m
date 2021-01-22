Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp933476lfb;
        Fri, 22 Jan 2021 07:11:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4lopmRJdZO19rMIJGr2fMpGYIiXNSLcygTZdYXIPEftyE40PXrmcFjTLremlX97WRsted
X-Received: by 2002:a25:ab09:: with SMTP id u9mr7107350ybi.259.1611328271909;
        Fri, 22 Jan 2021 07:11:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611328271; cv=none;
        d=google.com; s=arc-20160816;
        b=rkMuCZvpw/lC+g2zzThtOTNepHnZ8ykPQNCl4BpyC2BnngJGH/a3m+u4+SDBzkSpow
         gL3n6sC8jhr35fEd1vxbTdxTpiEoco1Amr0wvJ3BZ7ZpJmHO9KpnVbzIQkWRODmRhgjy
         ockrt781ACIyqyRcbgqB78E/b/fpbD8oFYZFIjxSe1y1pWgslO9feIlhhoKEXeXmz3A+
         RCOUD0h0FaNL4Mu8dZtYNKGN8Yt4gZQKGmtJ+2x5d69pbI8kFWlGqrQV3Nlq9EDSU6VU
         hececrF08svQOmfYzuguu/R6CoP8M+dkFxcpt+4MUaMH0ilKajtxDoiyqiW3zAxiu6Kg
         7YfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=U5Mp5i+Beskuw5QIaO3QIgdUSiNWtRWABsRDVUwBegg=;
        b=gu1yjswLUi/3XTDnoDmF5eSGLHr7tgP8W6GXZKKiN7kARbAQv4wJMew5DmloPiL6BF
         llSjTqRuFLnpr9IOwvZhsOAH0sreA41UYcEK635/nBX3bdXYTHLRbUdK+XerODNKLEg2
         2uhQ66Xh9+MykKMBuJBxEEhuJOckji8g8YvPZ8q4bxtDMPGq44PLaGkgqRe6sozjJ4Vx
         j8zsjKkOEGQ8RfW5jrTtPNuvYK6m5Bdrwg172FbVi4rAtDpL6nAJUf1PVLfAwEwX+cK4
         xgY+CASftRrkrmlbgRgxv+P6AvrDcDARPYlkV+p9zYrXi9AErrLrRqhHqDV2cnwCgqWH
         CMbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b="DRjSJqH/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s36si9082390ybi.85.2021.01.22.07.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 07:11:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b="DRjSJqH/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:54958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2y5f-00072Z-8Z
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 10:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l2y5P-0006zN-Qm; Fri, 22 Jan 2021 10:10:55 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:37104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l2y5M-00008k-8l; Fri, 22 Jan 2021 10:10:55 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 380C3C602E6;
 Fri, 22 Jan 2021 16:10:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611328249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U5Mp5i+Beskuw5QIaO3QIgdUSiNWtRWABsRDVUwBegg=;
 b=DRjSJqH/ApRlyI6cWO6wReNxNDkYlu2KrkznEo8b4dQ6VcvdfUN/PsHx8g/6G/N6InUgXW
 jNRNJ87SmC0g6EeAWzhUhtNFMEEofGjb93sMKT5Yzm/NEuwamoBZ1UZW2dECnTKHJKFgSj
 C1JXmXhufrpY67ubZxipPCjMLqgDxMbfuHzvqMkFAG/BUOF9Fwh4NN8sarb4m3wVSPmbnV
 +ohLAI3JwKBwYY+dviGzyvRmNJUmYBSmlYa9kl/JGbTZ6YKO3+j0a+dGrod2t82UgelSQO
 /5A9SZL/by1QR/zRnHrq2l1p3U8LUDmdpNGM/nlwN6f02/2cJp+IJh6RwDO4qg==
Date: Fri, 22 Jan 2021 16:11:10 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 07/25] hw/timer/cmsdk-apb-timer: Add Clock input
Message-ID: <20210122151110.oznikz7qcc2tyrsz@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-8-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-8-peter.maydell@linaro.org>
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
X-TUID: KEIRbE/PpO8K

On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> As the first step in converting the CMSDK_APB_TIMER device to the
> Clock framework, add a Clock input.  For the moment we do nothing
> with this clock; we will change the behaviour from using the pclk-frq
> property to using the Clock once all the users of this device have
> been converted to wire up the Clock.
> 
> Since the device doesn't already have a doc comment for its "QEMU
> interface", we add one including the new Clock.
> 
> This is a migration compatibility break for machines mps2-an505,
> mps2-an521, musca-a, musca-b1.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/timer/cmsdk-apb-timer.h | 9 +++++++++
>  hw/timer/cmsdk-apb-timer.c         | 7 +++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
> index baa009bb2da..fc2aa97acac 100644
> --- a/include/hw/timer/cmsdk-apb-timer.h
> +++ b/include/hw/timer/cmsdk-apb-timer.h
> @@ -15,11 +15,19 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
>  #include "hw/ptimer.h"
> +#include "hw/clock.h"
>  #include "qom/object.h"
>  
>  #define TYPE_CMSDK_APB_TIMER "cmsdk-apb-timer"
>  OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBTimer, CMSDK_APB_TIMER)
>  
> +/*
> + * QEMU interface:
> + *  + QOM property "pclk-frq": frequency at which the timer is clocked
> + *  + Clock input "pclk": clock for the timer
> + *  + sysbus MMIO region 0: the register bank
> + *  + sysbus IRQ 0: timer interrupt TIMERINT
> + */
>  struct CMSDKAPBTimer {
>      /*< private >*/
>      SysBusDevice parent_obj;
> @@ -29,6 +37,7 @@ struct CMSDKAPBTimer {
>      qemu_irq timerint;
>      uint32_t pclk_frq;
>      struct ptimer_state *timer;
> +    Clock *pclk;
>  
>      uint32_t ctrl;
>      uint32_t value;
> diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
> index ae9c5422540..c63145ff553 100644
> --- a/hw/timer/cmsdk-apb-timer.c
> +++ b/hw/timer/cmsdk-apb-timer.c
> @@ -35,6 +35,7 @@
>  #include "hw/sysbus.h"
>  #include "hw/irq.h"
>  #include "hw/registerfields.h"
> +#include "hw/qdev-clock.h"
>  #include "hw/timer/cmsdk-apb-timer.h"
>  #include "migration/vmstate.h"
>  
> @@ -212,6 +213,7 @@ static void cmsdk_apb_timer_init(Object *obj)
>                            s, "cmsdk-apb-timer", 0x1000);
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->timerint);
> +    s->pclk = qdev_init_clock_in(DEVICE(s), "pclk", NULL, NULL);
>  }
>  
>  static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
> @@ -236,10 +238,11 @@ static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
>  
>  static const VMStateDescription cmsdk_apb_timer_vmstate = {
>      .name = "cmsdk-apb-timer",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (VMStateField[]) {
>          VMSTATE_PTIMER(timer, CMSDKAPBTimer),
> +        VMSTATE_CLOCK(pclk, CMSDKAPBTimer),
>          VMSTATE_UINT32(ctrl, CMSDKAPBTimer),
>          VMSTATE_UINT32(value, CMSDKAPBTimer),
>          VMSTATE_UINT32(reload, CMSDKAPBTimer),
> -- 
> 2.20.1
> 

-- 
