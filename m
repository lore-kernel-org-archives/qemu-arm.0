Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp1938733lfb;
        Sat, 23 Jan 2021 12:31:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5PHGxmUnfrYUxYbLNbU5JSbKbJGLj9xtc3S+WXfOQEyP4J+rFgBsUU0uaa4MRiKv6URuw
X-Received: by 2002:a25:d147:: with SMTP id i68mr495921ybg.206.1611433867318;
        Sat, 23 Jan 2021 12:31:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611433867; cv=none;
        d=google.com; s=arc-20160816;
        b=K/JofBOYXmTBFw8DF9LL3ZLUjqyKZgwrYxhDU4sbIhYVoIvXyzqP5DebjhBqT8YF5E
         tysIr4+lP220vwHzdljq2dHCAV/2YqUXWqu+sbAKEgkpQ+4ikwl+VO7i10wBmRV+JoLU
         8WR20jOCQlX6igWsnYJagAZpRkzAAq9+l6YBuEVGkDtfHUwEWitnXPMYM4GJw5O1wV14
         ZtHA/ElKPGr59IDAe2WLloKi+z8BzrAjv1dGbEkehUKW7VQ7LPT0FNoLOIqs10arJat1
         6Ey07tNIaUuuSg3qsBeSU1N7FmyH6Zc6lI2xHYM/jpekrTAzBziKZvzZeUYpOQ/RmymI
         hzWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Up9eZMVcclbqdpC4POjfNn3Ho4ZJEmSotsDbxz+VVAA=;
        b=NmTQmku7z2SqaSKqj1aW9H2ImuFkfWLTzTqpl/CeHghs6f1arISnqkZlduFc/lBOYZ
         BNVfrcMvuXR0VfmpjFD2aQC4FI6Fh43h6oSKlryV91AjdTeZajT1efMzzc8GNKOR1Nd3
         bVRwkmu78Ypg3G9gdwVz7Oh6WOWTUFW1w/JKL6h6tX3b64dBGiJr98HXRmX4qUprfGMb
         AdbQFXjHcKEfFKsJFIyXvFwaTIfZ7rYm41yZ5yM9nVmJYzTZ9Z15YMjha30QckKaZsLa
         3q3tg3vONp57ZXkXAhTbULHtX0up1ap2wBnqMJAONRDctap3nec4nInlpY+c3wMZHyBX
         zpaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=jTvjIQ6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13si11539074ybr.447.2021.01.23.12.31.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 12:31:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=jTvjIQ6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:52912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l3PYo-00054s-Ot
	for alex.bennee@linaro.org; Sat, 23 Jan 2021 15:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3PYh-00054f-Bs; Sat, 23 Jan 2021 15:30:59 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:58286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3PYf-0003QE-7G; Sat, 23 Jan 2021 15:30:59 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 9A9E8C602E6;
 Sat, 23 Jan 2021 21:30:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611433853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Up9eZMVcclbqdpC4POjfNn3Ho4ZJEmSotsDbxz+VVAA=;
 b=jTvjIQ6pYgggpDprkxXxi0cu9yA/zHuZ0lNsIRATt2ct5bnjtUii8ogmayYgM8zn+lMri0
 H8u7wCGvwnSPQG+UL/9oMC1CD2GNjCILrA7DsfLLI0nabhHwOwlI56Ljsz1c4Rl5KcffYU
 M/XU7lyqypmK+YUwodHgcbays/LgCrSz0Gw8isUMBvBxcJiF2Hv9AAhFEh7BkS9ys/wZ6e
 BMBNoVoeZAjBQUgoecfGIb/+LdHWYFRrpsKQb8Pp+HMNh2pYwhzPT14CuUrQgGRkwXMOK5
 QIbrdJyUXQUkDw9Z6uAhRQiOX5RaaJ+uoGILF0iG/opAoy3aaj3giBkw8CJi9g==
Date: Sat, 23 Jan 2021 21:31:15 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 22/25] hw/arm/armsse: Use Clock to set system_clock_scale
Message-ID: <20210123203115.5wz66nu5z3faj3no@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-23-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-23-peter.maydell@linaro.org>
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
X-TUID: EH27G3dEb2KY

On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> Use the MAINCLK Clock input to set the system_clock_scale variable
> rather than using the mainclk_frq property.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> At some point we should make the SysTick take a Clock itself so
> that we can get rid of the system_clock_scale global entirely.
> (In fact we want two Clocks: one that is the CPU clock and one
> for the 'external reference clock' whose period is currently
> hardcoded at 1000ns in systick_scale()...)
> ---
>  hw/arm/armsse.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index 4349ce9bfdb..1da0c1be4c7 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -232,6 +232,16 @@ static void armsse_forward_sec_resp_cfg(ARMSSE *s)
>      qdev_connect_gpio_out(dev_splitter, 2, s->sec_resp_cfg_in);
>  }
>  
> +static void armsse_mainclk_update(void *opaque)
> +{
> +    ARMSSE *s = ARM_SSE(opaque);
> +    /*
> +     * Set system_clock_scale from our Clock input; this is what
> +     * controls the tick rate of the CPU SysTick timer.
> +     */
> +    system_clock_scale = clock_ticks_to_ns(s->mainclk, 1);
> +}
> +
I think you forgot to connect this callback to the clock itself (the
`qdev_init_clock_in` call in `armsse_init`).

Moreover on a clock change event, shouldn't the SysTick timer be
recomputed? I guess this will be better fixed in the SysTick itself once
it takes the two Clock inputs as you said.

-- 
Luc

>  static void armsse_init(Object *obj)
>  {
>      ARMSSE *s = ARM_SSE(obj);
> @@ -451,9 +461,11 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    if (!s->mainclk_frq) {
> -        error_setg(errp, "MAINCLK_FRQ property was not set");
> -        return;
> +    if (!clock_has_source(s->mainclk)) {
> +        error_setg(errp, "MAINCLK clock was not connected");
> +    }
> +    if (!clock_has_source(s->s32kclk)) {
> +        error_setg(errp, "S32KCLK clock was not connected");
>      }
>  
>      assert(info->num_cpus <= SSE_MAX_CPUS);
> @@ -1115,7 +1127,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>       */
>      sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->container);
>  
> -    system_clock_scale = NANOSECONDS_PER_SECOND / s->mainclk_frq;
> +    /* Set initial system_clock_scale from MAINCLK */
> +    armsse_mainclk_update(s);
>  }
>  
>  static void armsse_idau_check(IDAUInterface *ii, uint32_t address,
> -- 
> 2.20.1
> 

-- 
