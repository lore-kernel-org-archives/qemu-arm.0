Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp888152lfb;
        Fri, 22 Jan 2021 06:16:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiox1LhB9AC1LmFXr90qaSO7lV3ij04BecLVSglsglK93cT6zxBbmD7UP9pGsRKdxv5RIr
X-Received: by 2002:a25:11c2:: with SMTP id 185mr6605799ybr.74.1611324996523;
        Fri, 22 Jan 2021 06:16:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611324996; cv=none;
        d=google.com; s=arc-20160816;
        b=TWmwOBun9cVlzedF8n6hdWU/CsvPY9XkwJ2vMAGhue3hiAG+x9RT1fvzE7CHPWL9cC
         eD4E140D06jzuiuIUFvRO7nudjjeRbpcgZLdJVrCixKaS0IiVgSKQsJSzFRMpXxn8OWI
         f7LWmOBZqSL/QfwJfMKMmAiHe0U9ZSkpRo6xy7NYJYoGT78P9IJz76TNrz0a5PnbAGqv
         Jax+g/4OJjvY3zEmqLnUZ8/PUqH/y+KxxaYZqxYg9hcPS3ho5T+rAWmqUy6SEnrdoA19
         tS0zMjZ8/4oOjkfL9XP5hrG4pKXzhLoVRaiQs19omHKJ8W8Fs1xEQRoI5yVqYujCO/Xc
         0svA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Hj31JtBA8JkF+nolfAcP7G8osTbcEoYpDkFcINBCRDk=;
        b=S756I0S6ok6T1YQAgHu0uJCKLUMX5kqJJZOIAu/KMycnzPxDdh68oKdCURkRknYUSK
         0549/2RWqpgTvhCIfKxB0NxCqu0j7E+uy3pdtAW0Dt95YLYcquIdyOg1aTFsqLjuWotP
         /SUc0i6vOGXkSFyWg+nDtRrM2dTaAiOdHVFPowkkYsrkRrGUVfHZbMypAc0WsqQO9na0
         cqXsZxsnEh4G8h0aNmnLZBrg5axqO1JCF07JOE/9ql1RdYkMfLnwkygo/r/O7L+yKk/r
         OhgQRLl2IdjlLeA0YAziyCfMKyMLk+BYPLz7+Jn2Izx28OYw+/7bXqIAKr24kFMNpW04
         wyew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=dLq9OhoR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si9471895ybk.457.2021.01.22.06.16.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 06:16:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=dLq9OhoR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:58420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2xEo-0003pl-9r
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 09:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l2xDc-0001wo-Ph; Fri, 22 Jan 2021 09:15:20 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:34446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l2xDa-00081s-23; Fri, 22 Jan 2021 09:15:20 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 46680C602E6;
 Fri, 22 Jan 2021 15:15:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611324915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hj31JtBA8JkF+nolfAcP7G8osTbcEoYpDkFcINBCRDk=;
 b=dLq9OhoRb6vHTLjPaSRnZe1f8HuJVO/e+X/E5ksv5UYUXgw4AQrNy7aek9qx6m/8H1A06t
 zL4IKftqTIwBOZPs2ghrHvly7zt9L5LOcEwCJ5wrdDIrU7lzymV2LLYIGXNEHO3Zs5z8tH
 GiZAp8uUyHI/2osJo0AgJRp4CAvCeM3mfBcdrfEx4I1a3OAaXCuXw22Y5FBtWz3JlbrBtw
 PSPoVxlgtmhjb6M1+gpb2c/lLye9XzxsbyxUc5puziW7jpxUh5YStR7/u2mJP/zo/zjzlj
 bZhatJmuOXeWvZofIeuoDO5a/c24QO5qrTmrdkfUivYzSnn9iHr02V2K1xchhg==
Date: Fri, 22 Jan 2021 15:15:36 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 02/25] clock: Add new clock_has_source() function
Message-ID: <20210122141536.n6mplt2z7ckv3izc@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-3-peter.maydell@linaro.org>
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
X-TUID: eENd4ncastYc

On 19:05 Thu 21 Jan     , Peter Maydell wrote:
> Add a function for checking whether a clock has a source.  This is
> useful for devices which have input clocks that must be wired up by
> the board as it allows them to fail in realize rather than ploughing
> on with a zero-period clock.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  docs/devel/clocks.rst | 16 ++++++++++++++++
>  include/hw/clock.h    | 15 +++++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> index 2548d842322..c54bbb82409 100644
> --- a/docs/devel/clocks.rst
> +++ b/docs/devel/clocks.rst
> @@ -235,6 +235,22 @@ object during device instance init. For example:
>      /* set initial value to 10ns / 100MHz */
>      clock_set_ns(clk, 10);
>  
> +To enforce that the clock is wired up by the board code, you can
> +call ``clock_has_source()`` in your device's realize method:
> +
> +.. code-block:: c
> +
> +   if (!clock_has_source(s->clk)) {
> +       error_setg(errp, "MyDevice: clk input must be connected");
> +       return;
> +   }
> +
> +Note that this only checks that the clock has been wired up; it is
> +still possible that the output clock connected to it is disabled
> +or has not yet been configured, in which case the period will be
> +zero. You should use the clock callback to find out when the clock
> +period changes.
> +
>  Fetching clock frequency/period
>  -------------------------------
>  
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index 6382f346569..e5f45e2626d 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -139,6 +139,21 @@ void clock_clear_callback(Clock *clk);
>   */
>  void clock_set_source(Clock *clk, Clock *src);
>  
> +/**
> + * clock_has_source:
> + * @clk: the clock
> + *
> + * Returns true if the clock has a source clock connected to it.
> + * This is useful for devices which have input clocks which must
> + * be connected by the board/SoC code which creates them. The
> + * device code can use this to check in its realize method that
> + * the clock has been connected.
> + */
> +static inline bool clock_has_source(const Clock *clk)
> +{
> +    return clk->source != NULL;
> +}
> +
>  /**
>   * clock_set:
>   * @clk: the clock to initialize.
> -- 
> 2.20.1
> 

-- 
