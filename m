Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1800984wru;
        Thu, 4 Jul 2019 02:27:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz5JCHCjOQ9nxRWzRPMhSER5q92OKuR5/bo4qN3s28qRo+X/AWhPRnvzgOEzprUS3P5K3eD
X-Received: by 2002:a17:906:6557:: with SMTP id u23mr22908778ejn.186.1562232429434;
        Thu, 04 Jul 2019 02:27:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562232429; cv=none;
        d=google.com; s=arc-20160816;
        b=eket4kfNMG2AzW6MW+CfBeMwKupTv/KYVUIgPabnz2gsKGyAo11KkxJLcXtCDkecsY
         pT/ZS6ZMbmfTw14FSD+Mm00RQO5X88us72iQ3Z9ApLCFwD/6LpwkuRhz2wBP+klqota7
         KgBBZKzcrHxuxuGou2Z1xq8yRvDvW7dBJ7ilgESxYavUki4kiBpmS9jk154i7LoSNZLQ
         LdShBR2za1IDtxc919fOm2ksZindreGdvmLh+dBwCmUoGN4wLY9G4PfriY526d85fxcc
         mRAAjszoTVgwg9mg7KE7gadkohssGvKUL0aDUSU4y4om3rsxb+hPsnxof+v4eZi8DEtn
         kx+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=pT2I37Dxf/gfQvnoHHpfem5+6ntsHRbZ8sxz2fUpUiY=;
        b=OpYfVgdSWOPhG0dcUqUYx9qLEzifyyE3NPnSpZstv9CY5krQuizn0xYFHe82rS+2bi
         qBu+ROaqW8GWb4mAgohlPpfnadR7CWVk6zdvMcoiqQeDjFoSL1+Mss+kULGKmMeLRT5Z
         DjlvRG+1CQ0139JvEmT0WpKSAg7FhUg2qKbrAlvgkzo/TIrXb/wtm8SujdUXaJ6rS+Xs
         UJufGgSWIJhrSfEEy+Mn20kYUDOspsRPJCtN8NLnpsgKyHISnt5qorKJybRpO7I169cE
         L3a7oujen704e8VHmgNVLOjRpUlJEEqzxsRbbgH/p4inNDD2lQ8fuNc9AcoIIqXlMJHk
         C+LA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k51si4355474eda.111.2019.07.04.02.27.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2019 02:27:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiy1E-0001tW-Hc
	for alex.bennee@linaro.org; Thu, 04 Jul 2019 05:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35403)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hiy14-0001pY-47
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 05:26:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hiy12-0006cm-RL
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 05:26:58 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53281)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hiy12-0006bi-LA
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 05:26:56 -0400
Received: by mail-wm1-f66.google.com with SMTP id x15so5013674wmj.3
 for <qemu-arm@nongnu.org>; Thu, 04 Jul 2019 02:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pT2I37Dxf/gfQvnoHHpfem5+6ntsHRbZ8sxz2fUpUiY=;
 b=CK85vceYUuBzE2Lkvu72l4/1h3vBJGozVgKi1xJjJZ6S9vif/PtyCrdkI2/G4k4f7B
 ZnEZ7J33OQ6v7NS7EF4lxh4k9ouqRyJ7qkqRJsC2fG3FwjT0p6BiiVtrvDhTLOH4seMk
 N8fpgfirbP6+/9264W0tmqhl/TbpLvUUW4llQZSa6+q0pfSaU6koqhl+SxhdF8WLq0Lb
 8zie56SnZEd1hOPx5AlDT/QSxw8d74bDt/XBMmROkZ30aj+UJjhNyBi4g+izhlTzCZee
 1kwLXkSwAZUyAwltVp71iljRj5IxPfwaO8m25K0veuJ5DAhSONe0KUrpy9yeKeBuq5FS
 dAQg==
X-Gm-Message-State: APjAAAVt+swVxTSTtiBUb0h6yHHRBVJQ8zQeCiAR3fTpeF17eEY4071V
 rSX57eBKDtfvEObcgTaY83x9dw==
X-Received: by 2002:a1c:6c08:: with SMTP id h8mr12353319wmc.62.1562232415599; 
 Thu, 04 Jul 2019 02:26:55 -0700 (PDT)
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.56])
 by smtp.gmail.com with ESMTPSA id c1sm7609690wrh.1.2019.07.04.02.26.54
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 02:26:54 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20190704055150.4899-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <cd1f8a48-27cb-5cc5-1fd2-46f1597a7094@redhat.com>
Date: Thu, 4 Jul 2019 11:26:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190704055150.4899-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for 4.1] aspeed/timer: Provide
 back-pressure information for short periods
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6lOwpzJggzb3

CC'ing Stefan & Paolo for a non-ARM view on this...

On 7/4/19 7:51 AM, Cédric Le Goater wrote:
> From: Andrew Jeffery <andrew@aj.id.au>
> 
> First up: This is not the way the hardware behaves.
> 
> However, it helps resolve real-world problems with short periods being
> used under Linux. Commit 4451d3f59f2a ("clocksource/drivers/fttmr010:
> Fix set_next_event handler") in Linux fixed the timer driver to
> correctly schedule the next event for the Aspeed controller, and in
> combination with 5daa8212c08e ("ARM: dts: aspeed: Describe random number
> device") Linux will now set a timer with a period as low as 1us.
> 
> Configuring a qemu timer with such a short period results in spending
> time handling the interrupt in the model rather than executing guest
> code, leading to noticeable "sticky" behaviour in the guest.
> 
> The behaviour of Linux is correct with respect to the hardware, so we
> need to improve our handling under emulation. The approach chosen is to
> provide back-pressure information by calculating an acceptable minimum
> number of ticks to be set on the model. Under Linux an additional read
> is added in the timer configuration path to detect back-pressure, which
> will never occur on hardware. However if back-pressure is observed, the
> driver alerts the clock event subsystem, which then performs its own
> next event dilation via a config option - d1748302f70b ("clockevents:
> Make minimum delay adjustments configurable")
> 
> A minimum period of 5us was experimentally determined on a Lenovo
> T480s, which I've increased to 20us for "safety".
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> [clg: - changed the computation of min_ticks to be done each time the
>         timer value is reloaded. It removes the ordering issue of the
>         timer and scu reset handlers but is slightly slower ]
>       - introduced TIMER_MIN_NS
>       - introduced calculate_min_ticks() ]
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> 
>  This is fixing a serious slowdown issue with recent Linux. 
> 
>  hw/timer/aspeed_timer.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 29cc5e807081..217d59fa7885 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -42,6 +42,13 @@ enum timer_ctrl_op {
>      op_pulse_enable
>  };
>  
> +/*
> + * Minimum value of the reload register to filter out short period
> + * timers which have a noticeable impact in emulation. 5us should be
> + * enough, use 20us for "safety".
> + */
> +#define TIMER_MIN_NS (20 * SCALE_US)
> +
>  /**
>   * Avoid mutual references between AspeedTimerCtrlState and AspeedTimer
>   * structs, as it's a waste of memory. The ptimer BH callback needs to know
> @@ -96,6 +103,14 @@ static inline uint32_t calculate_ticks(struct AspeedTimer *t, uint64_t now_ns)
>      return t->reload - MIN(t->reload, ticks);
>  }
>  
> +static uint32_t calculate_min_ticks(AspeedTimer *t, uint32_t value)
> +{
> +    uint32_t rate = calculate_rate(t);
> +    uint32_t min_ticks = muldiv64(TIMER_MIN_NS, rate, NANOSECONDS_PER_SECOND);
> +
> +    return  value < min_ticks ? min_ticks : value;
> +}
> +
>  static inline uint64_t calculate_time(struct AspeedTimer *t, uint32_t ticks)
>  {
>      uint64_t delta_ns;
> @@ -259,7 +274,7 @@ static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
>      switch (reg) {
>      case TIMER_REG_RELOAD:
>          old_reload = t->reload;
> -        t->reload = value;
> +        t->reload = calculate_min_ticks(t, value);
>  
>          /* If the reload value was not previously set, or zero, and
>           * the current value is valid, try to start the timer if it is
> 
