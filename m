Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp1171037lfb;
        Fri, 22 Jan 2021 12:33:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyc2fonqJApnZdIYrMZ2GpDTn2/QrNXxuOapgXLQHk7Cv2LIQQ7jEwWuLHYJkXKe5R/v8Jk
X-Received: by 2002:a25:8146:: with SMTP id j6mr8883551ybm.380.1611347604645;
        Fri, 22 Jan 2021 12:33:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611347604; cv=none;
        d=google.com; s=arc-20160816;
        b=juCNSIi+mjIWISdlDt1ut5qSXie3mdKphG+QEnseKCGJWLC8IKhtHu3QfmUXvxvnGh
         2bsc1BQufYdi8yMZfIUzBJKQHggtEEoiXj6387Iq0aKu0D3NKeW0MaJ1l+uD+V8SQ2tg
         qo7XInszqyhGH7t+JYW7/FpomLog4ubwvVEpg6KDWsp8EJc6i+/G+qJBArSOG6ng/PqJ
         70jKiugzg2+5Wb/ittWZ5cU/zAGW1Lm7mbKyyFQW5LyK6aBp8GUO7eWi1jmTYQS37rVR
         Yp/iselcCFqoBPm5dhRLqNlw3rzTMPAMNfhvYUvF9CPTIVvBkxDctVyXdplXg4Jih7Q/
         OuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=faOVIinSqea55p9lVc+8t9GiMOiIjuL60TaUy5QwqYQ=;
        b=m3RN6WweTi25p41bU9QjqBYm9M9wdM/xwGHjjT+ItS/iosARvqfQHh5oQNIFT/ZDqP
         FI4FigEe3aCLNDjU7EkohlFRyFrGShZUZn3J0aFEjEVPD4refVT9bU9igMVhf81AbIiH
         koV/tqu8UhLx6ga03TDKFLsvQIHsxdN1z5hclxadAa9XGlWlkEDwKB5pwI5Aw9gG+8NO
         Smx6Pf4ap15Zdx/trYLkQtvLJP1+N4fZnM6HBnVbMjq2xiX16infg4iPkum/jMS8eZkP
         HnDJvJx296ocmePxZpZBf5NGWkNvoFeNIuEENxoAgirM+Oi/fiuuVa5pBRy6khV9W6WU
         Dtjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=NthCbdQ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n20si8966815ybk.226.2021.01.22.12.33.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 12:33:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=NthCbdQ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:59991 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l337U-00085F-0t
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 15:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l337A-0007lu-Am; Fri, 22 Jan 2021 15:33:04 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:55856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3378-0005Yi-5j; Fri, 22 Jan 2021 15:33:03 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id AFDA3C602E6;
 Fri, 22 Jan 2021 21:32:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611347579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=faOVIinSqea55p9lVc+8t9GiMOiIjuL60TaUy5QwqYQ=;
 b=NthCbdQ7dkhnqagpBskgROsqy0FiM6tFIDmXtf2rQMomEc+zlFr+ObmF5Q2H3evtW4Yrf7
 Z340F6d+v/FNafmRkFYT8qxiWwYNAXBBHTNwqLwspBBgWJDlEuHo5XQKmFp7qaQblXk9df
 hZbTmURETBJ/n+KqtygrzAbmHjSRvp8dQo0UKrAX/JvH0yqcySMa6XfKcoRgkdnu8PQNU2
 PRQ/xUhHLKr+Xc4AfEQls+O/SzHtNxex0ThH9WBqrj2tSt4sS44KkkyXbTRxBJ199UMHkx
 iRDTBKOtruwcfMNWQP7e8L5/sMqTBRid4AkNPs+L48BEpT5/5TFvn7YNiwPaWQ==
Date: Fri, 22 Jan 2021 21:33:21 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 18/25] hw/timer/cmsdk-apb-timer: Convert to use Clock input
Message-ID: <20210122203321.ondgckxsqdcnksld@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-19-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-19-peter.maydell@linaro.org>
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
X-TUID: gPT82fskvmaO

On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> Switch the CMSDK APB timer device over to using its Clock input; the
> pclk-frq property is now ignored.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/timer/cmsdk-apb-timer.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
> index c63145ff553..f053146d88f 100644
> --- a/hw/timer/cmsdk-apb-timer.c
> +++ b/hw/timer/cmsdk-apb-timer.c
> @@ -204,6 +204,15 @@ static void cmsdk_apb_timer_reset(DeviceState *dev)
>      ptimer_transaction_commit(s->timer);
>  }
>  
> +static void cmsdk_apb_timer_clk_update(void *opaque)
> +{
> +    CMSDKAPBTimer *s = CMSDK_APB_TIMER(opaque);
> +
> +    ptimer_transaction_begin(s->timer);
> +    ptimer_set_period_from_clock(s->timer, s->pclk, 1);
> +    ptimer_transaction_commit(s->timer);
> +}
> +
>  static void cmsdk_apb_timer_init(Object *obj)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> @@ -213,15 +222,16 @@ static void cmsdk_apb_timer_init(Object *obj)
>                            s, "cmsdk-apb-timer", 0x1000);
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->timerint);
> -    s->pclk = qdev_init_clock_in(DEVICE(s), "pclk", NULL, NULL);
> +    s->pclk = qdev_init_clock_in(DEVICE(s), "pclk",
> +                                 cmsdk_apb_timer_clk_update, s);
>  }
>  
>  static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
>  {
>      CMSDKAPBTimer *s = CMSDK_APB_TIMER(dev);
>  
> -    if (s->pclk_frq == 0) {
> -        error_setg(errp, "CMSDK APB timer: pclk-frq property must be set");
> +    if (!clock_has_source(s->pclk)) {
> +        error_setg(errp, "CMSDK APB timer: pclk clock must be connected");
>          return;
>      }
>  
> @@ -232,7 +242,7 @@ static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
>                             PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
>  
>      ptimer_transaction_begin(s->timer);
> -    ptimer_set_freq(s->timer, s->pclk_frq);
> +    ptimer_set_period_from_clock(s->timer, s->pclk, 1);
>      ptimer_transaction_commit(s->timer);
>  }
>  
> -- 
> 2.20.1
> 

-- 
