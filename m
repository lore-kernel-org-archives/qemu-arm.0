Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2123034lfc;
        Thu, 11 Feb 2021 02:11:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUigQlzsYbl+WxVVl6U45ZRz5A4U+ULfDjHGyLpPxvJ28Zg4NPvFtZUzzDso9JdBFN+OvT
X-Received: by 2002:a5b:690:: with SMTP id j16mr10932849ybq.251.1613038260517;
        Thu, 11 Feb 2021 02:11:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613038260; cv=none;
        d=google.com; s=arc-20160816;
        b=LMCERBYu0BWBXb73R6fHCIBqKAGb7fgf96QnebMqOGZJaU8KbvfRlj+xktGgvLG/sP
         0TE26NC3uw5ynDbQyBHPeXDqCcfdF9V56NiBlZOo01F9aFEQZQRYvB3xPN40PunFUbiM
         r5CUWUVBLUdjNof3SOno8RmHQqz+Vqs/IsspZTYV6rR1XTzbooH4ds5rr+O86wwwXMKR
         7AG5icxnT+BqIrkzNQrx+1Q4tgNoNb8Uze/HgRxzjf9Gvsj3qKoMNLCL4fN71znzjrPJ
         1kdvIQ0cjMfOYzUz8ux47duWWaVEl67eUhbeaAlUVgE5fXkFGK6UnbrmgLUORUc2LdAd
         M6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=XBdFX38jptpi0BIEJ1yRhy9PuJYL9HLek6XR7hMRUW4=;
        b=094SZJS+tZzaxtdSgwPU03SaDkSzfJXsJtz//l3mBORWPgzR7lMqgoytVtegh7vnwZ
         1zNEsLzUk27nER32lwrgaIh4mxsdtbdqdIQpAO95O4VF8yI4uMxpKlYk18cqW5F0mCDs
         F7jRid6u8mCMDf6pdNfM22nOwds/F8EYZrffwFO2zj39ECs3WMZ15lXFbUrBNL2LxlSi
         iHci32Kw3JBZrY0VeGaIsCKS5M+OLkwRqsdWaE6cT1wp01evM9uz94Wrhsb8cc1S6GeT
         ttn3sUUVUpgcw6hWjKbCt5rk2ZgZlrQuXP7GiVuKJiRNmasxSR5vHuNPYmRgBLmi+5w5
         YK+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=iJxuED8M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4si4900511ybc.292.2021.02.11.02.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 02:11:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=iJxuED8M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:59720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lA8w7-0000I5-TP
	for alex.bennee@linaro.org; Thu, 11 Feb 2021 05:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1lA8vp-0000G4-Bj; Thu, 11 Feb 2021 05:10:44 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:34712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1lA8vm-0004u0-QA; Thu, 11 Feb 2021 05:10:41 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id DA894C602E6;
 Thu, 11 Feb 2021 11:10:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1613038234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XBdFX38jptpi0BIEJ1yRhy9PuJYL9HLek6XR7hMRUW4=;
 b=iJxuED8MJ4azTSXo2rSrMZWCFL+MHglfISNdL/yr5G7Y1XF+fyVvzuLcUSN65bn2Kfrpl8
 tKDK3wI5jy6baxdwHOLQ40CsryU+4PZlWIFrJjTSfZ725KPC/+XQGww/v6djZdmUg5DvJO
 HGnTJ+5tvS79bikjv37Rx88uk7bc/7tzxcZpF8eGK4hwTlVNHW0iEe9OvOebXRsa9KWf0D
 GiUHnSeuUfdg//lULoY2/D3uYq3mBnWsnQkGMne/jaG63eaW0aryTe7WGBLmNkyZYk9sdS
 aJS96mkoferP0/Jr7s1eE7rsYSwJzm5jJWLQHrD+fjv2jk7lvXnOTpYJ15zvBA==
Date: Thu, 11 Feb 2021 11:11:06 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 2/4] clock: Add ClockPreUpdate callback event type
Message-ID: <20210211101106.t7y67bw4ecz4uk6a@sekoia-pc.home.lmichel.fr>
References: <20210209132040.5091-1-peter.maydell@linaro.org>
 <20210209132040.5091-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209132040.5091-3-peter.maydell@linaro.org>
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
Cc: Havard Skinnemoen <hskinnemoen@google.com>, qemu-devel@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z8Ov69TdsFRE

On 13:20 Tue 09 Feb     , Peter Maydell wrote:
> Add a new callback event type ClockPreUpdate, which is called on
> period changes before the period is updated.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  docs/devel/clocks.rst | 9 ++++++++-
>  include/hw/clock.h    | 1 +
>  hw/core/clock.c       | 3 +++
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> index cd344e3fe5d..f0391e76b4f 100644
> --- a/docs/devel/clocks.rst
> +++ b/docs/devel/clocks.rst
> @@ -181,7 +181,14 @@ events.
>  
>  The events currently supported are:
>  
> - * ``ClockUpdate`` : called after the input clock's period has changed
> + * ``ClockPreUpdate`` : called when the input clock's period is about to
> +   update. This is useful if the device needs to do some action for
> +   which it needs to know the old value of the clock period. During
> +   this callback, Clock API functions like ``clock_get()`` or
> +   ``clock_ticks_to_ns()`` will use the old period.
> + * ``ClockUpdate`` : called after the input clock's period has changed.
> +   During this callback, Clock API functions like ``clock_ticks_to_ns()``
> +   will use the new period.
>  
>  Note that a clock only has one callback: it is not possible to register
>  different functions for different events. You must register a single
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index 5c73b4e7ae9..d7a6673c29e 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -30,6 +30,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
>   */
>  typedef enum ClockEvent {
>      ClockUpdate = 1, /* Clock period has just updated */
> +    ClockPreUpdate = 2, /* Clock period is about to update */
>  } ClockEvent;
>  
>  typedef void ClockCallback(void *opaque, ClockEvent event);
> diff --git a/hw/core/clock.c b/hw/core/clock.c
> index 71dc1f4de65..2c86091d8a3 100644
> --- a/hw/core/clock.c
> +++ b/hw/core/clock.c
> @@ -80,6 +80,9 @@ static void clock_propagate_period(Clock *clk, bool call_callbacks)
>  
>      QLIST_FOREACH(child, &clk->children, sibling) {
>          if (child->period != clk->period) {
> +            if (call_callbacks) {
> +                clock_call_callback(child, ClockPreUpdate);
> +            }
>              child->period = clk->period;
>              trace_clock_update(CLOCK_PATH(child), CLOCK_PATH(clk),
>                                 CLOCK_PERIOD_TO_HZ(clk->period),
> -- 
> 2.20.1
> 

-- 
