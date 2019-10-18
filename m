Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1259466wrm;
        Fri, 18 Oct 2019 11:19:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxBAyyA1qvriTA5zkFlzBy1HSXn+XdrcamQbg+pbiJSxJ/CrTR1CuheJX7UGlazQVLzwCVD
X-Received: by 2002:a17:906:f75a:: with SMTP id jp26mr10013211ejb.191.1571422751511;
        Fri, 18 Oct 2019 11:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571422751; cv=none;
        d=google.com; s=arc-20160816;
        b=qcgt2DKOSfvV/mcg6sEMAUHIc427F2y7A0x0VhbU79VGoD5jBa97a+jjvYpjOFMKL5
         x95TV1bljmKaBDBr0d1UnRqCrD5YeBhFJPr2Qx3m3YAPiN3jgmI1H60xkNdKLukmSm/W
         fibsVCK7SVojGw2J5TCbNwyiYHWb7Z3QmNjokYDdgobI4ziu8K9RyHvZgNfIiwBL7HPQ
         zo6RLrthdENWMBjDgHK7g9gCLiICrdfVAJ0fjdsKOUjUVjTFUPS2QMJUyahDdtknuG6H
         3icFLdwaBJvKTEX604gD3gqeuFXjzc2LlCqE37j4BKHTJaCi9+mFh14knIvTX0V0c6lF
         5H9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=h+ePRCwOeiDPPJVeh/ZGICTBIB7KHXv/C5hT8+LC3Vw=;
        b=glkrAI+xNXO1rco15QH7S5iaEaBqdTNeVuEYVOqpb8/E6Sp1urEf2GqTFJYkjAzYst
         /uvBcD1wgOlX/GviTsJHzudSct+iGcuAu4iL/+rtG6sDCdMUqmyCECV2kUyi/MVrHwBA
         yaf1T4acgpgLiO9m8nQPwx6LagtLqFe85XE7HkmsORiNAY9lPxOJYT4xrtOkW1BsvqJv
         pMc0IDxhVeQYGQNc6ikn6N6FBG5mJk1xAe/QLp6BsG8QvW5wIXl1BGmJxXAth1wtUzWj
         E1RvdEb0hEP9zCeeoaV77AzoBm39zp0C5LIfntVKztXVv8IB/gG2cBmWPWPVBzA7PGe6
         cJHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ryj+Wck6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3si4268495edy.48.2019.10.18.11.19.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 11:19:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ryj+Wck6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWqE-0008GT-3J
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 14:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1iLWpJ-00088r-AC
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 14:18:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1iLWpI-0001yl-3F
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 14:18:13 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:38799)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1iLWpF-0001vV-BQ; Fri, 18 Oct 2019 14:18:09 -0400
Received: by mail-pg1-x544.google.com with SMTP id w3so3801971pgt.5;
 Fri, 18 Oct 2019 11:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=h+ePRCwOeiDPPJVeh/ZGICTBIB7KHXv/C5hT8+LC3Vw=;
 b=ryj+Wck6Vm38zaZUuMiOmMaA7otw33+UC1sfy1W7rlO3EpzS/OeaVf1Mpb8XpYLD9R
 zUf3alKS/W8SgDJ6U4/W9yyrgyGA8NPSPqcIxpx/8nsJD8y7jjl2N+45yGvg4FmQldNu
 Xtf4QqZWz2X4PvLZ4VpHAI2HyNsGLMjlO8uSqi//9r8jxmAybYtPmmk++FAtHgvl/vO7
 SFN0yqn8xHlWeONyRPm3D0o3S9UBN6PR9VDZyo4A9i6hFBNTm36xmyGntopVv6Q5+2di
 HRBuMqFF67Fz1VURIIWtyPG7Ultq/2NRKV2NgP6OJbgS8xQjuWfzaKvNpBvKUAJvktrl
 W9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=h+ePRCwOeiDPPJVeh/ZGICTBIB7KHXv/C5hT8+LC3Vw=;
 b=KLIWXFuSFvGHnGj5nH4NVBoGQZE8nHiaGVAtDYBJZ/UcxtluQSbmWjjsB3gxi4e19v
 E/A8d9Vr9WfjcL8ZCecuLqVJxtYspQeW9sPU5jZ1PiBCYwXy+bJJ0o1kkevCDZqs//Ev
 W2dxroLdQlri7zlY+kCW4TLxdROjE1ggjlTMEpR5wONE7V6iZ6RA1K6E2D2vOVqOSCIJ
 2jegu6MIQQ95AB3AEDHxdEyxq9BteaxQ3QOsepHDky6uWm/BrTlZbs26ggYGm5iPJb+p
 HjIoNnEq0yT5EUjhOz9onJo2qvqMOt0CEy28eSZOimm0+0o4VBSw8JVKPCA0iRdTKBLA
 74GA==
X-Gm-Message-State: APjAAAVkyv1bsqTqzXWrP0bmR7gD7qQscemw1x9excRfD1LEjG2XDuEG
 66OfPEFNzJ3SnR9Slo+bBrU=
X-Received: by 2002:a63:eb52:: with SMTP id b18mr11149577pgk.205.1571422687887; 
 Fri, 18 Oct 2019 11:18:07 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id f185sm9122431pfb.183.2019.10.18.11.18.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 18 Oct 2019 11:18:06 -0700 (PDT)
Date: Fri, 18 Oct 2019 11:18:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/timer/exynos4210_mct: Initialize ptimer before
 starting it
Message-ID: <20191018181804.GA29037@roeck-us.net>
References: <20191018143149.9216-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018143149.9216-1-peter.maydell@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SpKZy0vsOaMP

On Fri, Oct 18, 2019 at 03:31:49PM +0100, Peter Maydell wrote:
> From: Guenter Roeck <linux@roeck-us.net>
> 
> When booting a recent Linux kernel, the qemu message "Timer with delta
> zero, disabling" is seen, apparently because a ptimer is started before
> being initialized.  Fix the problem by initializing the offending ptimer
> before starting it.
> 
> The bug is effectively harmless in the old QEMUBH setup
> because the sequence of events is:
>  * the delta zero means the timer expires immediately
>  * ptimer_reload() arranges for exynos4210_gfrc_event() to be called
>  * ptimer_reload() notices the zero delta and disables the timer
>  * later, the QEMUBH runs, and exynos4210_gfrc_event() correctly
>    configures the timer and restarts it
> 
> In the new transaction based API the bug is still harmless,
> but differences of when the callback function runs mean the
> message is not printed any more:
>  * ptimer_run() does nothing as it's inside a transaction block
>  * ptimer_transaction_commit() sees it has work to do and
>    calls ptimer_reload()
>  * the zero delta means the timer expires immediately
>  * ptimer_reload() calls exynos4210_gfrc_event() directly
>  * exynos4210_gfrc_event() configures the timer
>  * the delta is no longer zero so ptimer_reload() doesn't complain
>    (the zero-delta test is after the trigger-callback in
>    the ptimer_reload() function)
> 
> Regardless, the behaviour here was not intentional, and we should
> just program the ptimer correctly to start with.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> [PMM: Expansion/clarification of the commit message:
>  the message is about a zero delta, not a zero period;
>  added detail to the commit message of the analysis of what
>  is happening and why the kernel boots even with the message;
>  added note that the message goes away with the new ptimer API]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Philippe pointed me at this bugfix from Guenter. At one point
> in my working on the ptimer API changes I thought this bugfix
> would be necessary as a prerequisite, but in fact the issue
> was in my ptimer changes, and it just happened that fixing
> the MCT bug was a workaround for my bug. Even though the
> ptimer API changes actually coincidentally now suppress the
> annoying message about a zero delta, the behaviour is definitely
> not intentional, and since I spent the time working through the
> analysis of what was actually going on here I don't want
> to waste it :-)
> ---

Thanks a lot for picking this up, and for the great analysis!

Guenter

>  hw/timer/exynos4210_mct.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
> index 72257584145..944120aea59 100644
> --- a/hw/timer/exynos4210_mct.c
> +++ b/hw/timer/exynos4210_mct.c
> @@ -1254,7 +1254,7 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
>          /* Start FRC if transition from disabled to enabled */
>          if ((value & G_TCON_TIMER_ENABLE) > (old_val &
>                  G_TCON_TIMER_ENABLE)) {
> -            exynos4210_gfrc_start(&s->g_timer);
> +            exynos4210_gfrc_restart(s);
>          }
>          if ((value & G_TCON_TIMER_ENABLE) < (old_val &
>                  G_TCON_TIMER_ENABLE)) {
> -- 
> 2.20.1
> 
