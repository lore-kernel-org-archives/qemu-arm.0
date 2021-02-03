Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp551692lfo;
        Wed, 3 Feb 2021 12:51:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsQer6lRuHtqsNdr1nNnOp2hhDHAR33cEdTVQliZ5xtdBmOTXa3W2YSbx2KNobpE4s1hv4
X-Received: by 2002:a25:6607:: with SMTP id a7mr7033018ybc.439.1612385492607;
        Wed, 03 Feb 2021 12:51:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612385492; cv=none;
        d=google.com; s=arc-20160816;
        b=DLH1cAbtCf0ZMgqi2CYtW7NvQNqgdpXoh8fzZDxfqfBLzhcycIO14z7iv1u6/sqlAG
         H2+Ei1ABJwp0ogaRBTCLVdm5Y9TQOX8gN0AUGpY2F35DpDp0X2tIXbjKXtipfmJETJ17
         trGWy3QJtdSrRua3jXO+mi3F+7J24z2a86HoY8bTf6ZB+OrG3/p59i2Lt/B6Iy31zKwY
         RJCuqgoa59M9a6rLHTDcp+85MjB7b0XSp1ZYI2oc1Jy2ikhDk+mnfNSSdSeO9fuFsd0p
         BxNYe7WDDRRYLe6bRgknmO0YsgK790Cu3nNneSrVSz8E/EUcTQ7NL9YcI14MJ3/MKA2b
         qMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=psWP7xIbHlnuUXphUwDiv7gAY1unk+/g8lPMEVwaEzs=;
        b=HF8yPZnKpdKQmc+cERIWKot8PIf309yNtaddtFEdQJbDfMA+OZOah/wajlwXd+hMo2
         whgVbMGqL6dOxEMj9M2RnSUsBpuuu9rq1egatRzjzxJ/AZrAAUFlnAiPLiu/aj1hvUZO
         tDa9uQP96ICIYOeIJSHl1PZ3J/qkIx0F5PDhQGAtGVa0prcQUYCOTftbSWxUVGzFSRWn
         pDTuwrGSxUCwZvD1/GZrFEzaTP2fFeo+OpwX9ZZgvCj1yyxZ+EkwDDCZynR7lKxjkjyx
         YmvSvEyDsi9tHBU8Id3fXqS51kPlh6VPZcsYYC9mSggzxESdF+Wj+4kf8O+RNP3+jJx9
         8bqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=R9mpzwmR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si3282351ybh.135.2021.02.03.12.51.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 12:51:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=R9mpzwmR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:35086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7P7c-00026D-1L
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 15:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l7P7F-000248-Ss; Wed, 03 Feb 2021 15:51:14 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:56742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l7P79-00062r-8K; Wed, 03 Feb 2021 15:51:08 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id F3BFAC602E6;
 Wed,  3 Feb 2021 21:50:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1612385457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=psWP7xIbHlnuUXphUwDiv7gAY1unk+/g8lPMEVwaEzs=;
 b=R9mpzwmRod59vKsVYMXSFKlm7VOs+0YNmuDSXrGUka9qblB67O/0a/KfmlaRS6ohLjJ3No
 6LNyK/HdEhrij90Yf5nAtmU5GpZ96K6aKIpC1/uxJv4/eBxLVBvPlnVkRSojM6TIAy1aGd
 YAibn/QPg6pOJZm/Ir5jCIYzigqZ26v7p0dx379U5CstCwzp4Y7kbF3XDboP2zoEP5DiaF
 4wD53JaUj9a0PdY2qEi0Om0LDqNWTI1PQ25YEGtDUH63OKnSDt0PGW7pzPMG0j0VcQ4cOj
 HaXhrBbtfXnUC7Y29/LWhl2FuDqLk/gfGf+H53TqlViQJ1/Ia2Ndmi+YjsT2Yg==
Date: Wed, 3 Feb 2021 21:51:14 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC 3/4] clock: Add clock_ns_to_ticks() function
Message-ID: <20210203205114.mxmr55bjpr4ic7aq@sekoia-pc.home.lmichel.fr>
References: <20210201123013.32308-1-peter.maydell@linaro.org>
 <20210201123013.32308-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201123013.32308-4-peter.maydell@linaro.org>
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZUXdwK4EDFPF

On 12:30 Mon 01 Feb     , Peter Maydell wrote:
> Add a clock_ns_to_ticks() function which does the opposite of
> clock_ticks_to_ns(): given a duration in nanoseconds, it returns the
> number of clock ticks that would happen in that time.  This is useful
> for devices that have a free running counter register whose value can
> be calculated when it is read.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I have made the overflow behaviour here be "wrap", with justification
> as per the comment; but I'm not 100% set on this.
I thought about this, but I can't see a scenario where the upper 64 bits
would be needed. So I guess wrapping is fine.

> ---
>  docs/devel/clocks.rst | 12 ++++++++++++
>  include/hw/clock.h    | 41 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> index dea63742fb0..84fb45bbe5f 100644
> --- a/docs/devel/clocks.rst
> +++ b/docs/devel/clocks.rst
> @@ -355,6 +355,18 @@ rather than simply passing it to a QEMUTimer function like
>  ``timer_mod_ns()`` then you should be careful to avoid overflow
>  in those calculations, of course.)
>  
> +Obtaining tick counts
> +---------------------
> +
> +For calculations where you need to know the number of ticks in
> +a given duration, use ``clock_ns_to_ticks()``. This function handles
> +possible non-whole-number-of-nanoseconds periods and avoids
> +potential rounding errors. It will return '0' if the clock is stopped
> +(i.e. it has period zero). If the inputs imply a tick count that
> +overflows a 64-bit value (a very long duration for a clock with a
> +very short period) the output value is truncated, so effectively
> +the 64-bit output wraps around.
> +
>  Changing a clock period
>  -----------------------
>  
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index 7d0eb286faa..e3545eda439 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -277,6 +277,47 @@ static inline uint64_t clock_ticks_to_ns(const Clock *clk, uint64_t ticks)
>      return ns_low >> 32 | ns_high << 32;
>  }
>  
> +/**
> + * clock_ns_to_ticks:
> + * @clk: the clock to query
> + * @ns: duration in nanoseconds
> + *
> + * Returns the number of ticks this clock would make in the given
> + * number of nanoseconds. Because a clock can have a period which
> + * is not a whole number of nanoseconds, it is important to use this
> + * function rather than attempting to obtain a "period in nanoseconds"
> + * value and then dividing the duration by that value.
> + *
> + * If the clock is stopped (ie it has period zero), returns 0.
> + *
> + * For some inputs the result could overflow a 64-bit value (because
> + * the clock's period is short and the duration is long). In these
> + * cases we truncate the result to a 64-bit value. This is on the
> + * assumption that generally the result is going to be used to report
> + * a 32-bit or 64-bit guest register value, so wrapping either cannot
> + * happen or is the desired behaviour.
> + */
> +static inline uint64_t clock_ns_to_ticks(const Clock *clk, uint64_t ns)
> +{
> +    /*
> +     * ticks = duration_in_ns / period_in_ns
> +     *       = ns / (period / 2^32)
> +     *       = (ns * 2^32) / period
> +     * The hi, lo inputs to divu128() are (ns << 32) as a 128 bit value.
> +     */
> +    uint64_t lo = ns << 32;
> +    uint64_t hi = ns >> 32;
> +    if (clk->period == 0) {
> +        return 0;
> +    }
> +    /*
> +     * Ignore divu128() return value as we've caught div-by-zero and don't
> +     * need different behaviour for overflow.
> +     */
> +    divu128(&lo, &hi, clk->period);
> +    return lo;
> +}
> +
>  /**
>   * clock_is_enabled:
>   * @clk: a clock
> -- 
> 2.20.1
> 

-- 
