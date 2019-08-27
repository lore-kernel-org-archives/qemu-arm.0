Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5435607wrs;
        Tue, 27 Aug 2019 09:11:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxlgf9RVQSYiry+0mb50T3tmY72mmMtn5X0mp/w+nMMw58wrWXUTL4e6F9aB6LM5liIFZun
X-Received: by 2002:aed:25b0:: with SMTP id x45mr14787020qtc.191.1566922307670;
        Tue, 27 Aug 2019 09:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566922307; cv=none;
        d=google.com; s=arc-20160816;
        b=w809iDhAQyMpHXc1FshO10teQUjjMlo12IAABz+hr/4K3IbDUhZ5tiuWuzt9dSoobF
         JU1m+18fDX7ipJ4cAJzy0oMNFb260YQj8dC74BGQO0wKh3QYc36CR73YmMgm7GXYgb3I
         CVW3Opsm9lXgHBG2asah7CaoM7Yrff1SrgyZe0LEFNn4nlyqwv0lPWiFj1IgFJTuxVeM
         ezOAN4YvDogGVSWKGx2y6fP0oGQJRw4a8ZBrdCltd8eoABC+7ijdDvNA5M+9cYBT7YeA
         b1k3FHEuAg5R034ONhkGYP7ruixt4+nBbbdYPZRh2iTCzmXhLo0EpHneuW7gJjbTQ58X
         5HTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WXplowyUpocu+OrbQx46F/GL5CgBCu++9nmAgG1PNWE=;
        b=fgDmf2KuhlXwH5VnrRBC+NK9SH+D3QF/PmVT5mZrpZy0h6rU8flRxWrYMfRX49RI4V
         blfNEfrmn550O7lbKltAwCrTmQmzavERO2D5eZK1Om4tkqf2NZGxgnuDJJv4nr1fTZa+
         FWJPcyEi0LYRJf7pmGjEi4JINJNcikRjniBogQ6zSwnokRIu8UVn9s/eTKnzPWfCU6bw
         oKP4hGg5u0/TPqph9CcvxblQiKPxtOkt42Rj1WF0OaCiWfpt+p/dH7m/pntXAW9kK0Lk
         AYtc8jYyxXjzA5XJWVCmD+3qQTc9OUQzfjCOgv1rYR2LtC95dJeaev1/ttSEf11SLOoH
         xpKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MGWEMIXk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x24si2125255qkj.51.2019.08.27.09.11.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 09:11:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MGWEMIXk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2e4Q-0000LO-QU
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 12:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59324)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2e1y-0006rs-Ks
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:09:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2e1x-00041q-7n
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:09:14 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43722)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2e1x-00041M-3T
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:09:13 -0400
Received: by mail-ot1-x342.google.com with SMTP id e12so19176450otp.10
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 09:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WXplowyUpocu+OrbQx46F/GL5CgBCu++9nmAgG1PNWE=;
 b=MGWEMIXkG6mwbfOa6A6VEDYKZ1Co9c5ly89GCsLfE2crlWRLTBZ2Z38eeLDWufPUsb
 s0QYXX5qgS5rKUEjr+DH5p8RdNTpxmC1cEdZgIAkmwLrRfyNlN1SKq9pBgikmew8BAsG
 Mvbl66WmHIW83l6W8q5pATPY6gB2sItJmRopWi4xrDxlYLpK1/20aB6ltWFnc4V7b/9l
 CdJZJf++nCEA+2XJs6RwzuwrgAzDwvCHYol8SMItKfRm/RXJenyybnKhxCh5mZoD7zx6
 KVP0YnQvnArp8fYN22XpvaGxfYbGfkeVBWJlTZYepWKsoGTVG6MYj1Em3rMiuLpPmPS+
 P6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WXplowyUpocu+OrbQx46F/GL5CgBCu++9nmAgG1PNWE=;
 b=Y9RsuX4cSmD+rEw4ECFjwbsb6fNkEODC7uVrX97Pz14SbSCBLYx0nqvUhrps5s9Pke
 KN0iKkm1zbJeO3nfrAzZ4yM8OiM//tG0n/EMOE6vrQ2xfPZJQ/LBmX1kvb7+CJPizhDm
 cjgzlquC7iwtXWg3ND8cM/6pzcTxklAl79hsuGzMLcg2SYI7qc6eps3zrX/K5T6d9noV
 B9I8uZr1VgqJafA2KWqUis5ZQlc+7sM992ax2XgRd2mkVCTd5Vz36ZBnKDP5w+PjD2pz
 Dlo4f5jrWl6sSE3TezXvgI9S5auG2cQqtTBbmNUWZLMCcebnTm85voWr0k4usfqMM1NF
 ii/A==
X-Gm-Message-State: APjAAAV4HUxBB4q5uwEbwPnYpkTPEOw6Gqj50UaJinSAjMr2JS3zYOQq
 Q7SSbf7Jt6XP6acfKysWgZYZxfI6Jd5hdKAM3PLfUYgKu10=
X-Received: by 2002:a9d:5e11:: with SMTP id d17mr9698539oti.135.1566922151050; 
 Tue, 27 Aug 2019 09:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190809054341.24728-1-andrew@aj.id.au>
In-Reply-To: <20190809054341.24728-1-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 17:08:59 +0100
Message-ID: <CAFEAcA9dEKLneH5GJJsX84LTW_p9qBrGmr6yMxAYcNo-2EzHZg@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH v2] target-arm: Make the counter tick
 relative to cntfrq
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
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n3SDYhfvS8ra

On Fri, 9 Aug 2019 at 06:43, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The use of GTIMER_SCALE assumes the clock feeding the generic timer is
> 62.5MHz for all platforms. This is untrue in general, for example the
> ASPEED AST2600 feeds the counter with either an 800 or 1200MHz clock,
> and CNTFRQ is configured appropriately by u-boot.
>
> To cope with these values we need to take care of the quantization
> caused by the clock scaling in terms of nanoseconds per clock by
> calculating an effective frequency such that NANOSECONDS_PER_SECOND is
> an integer multiple of the effective frequency. Failing to account for
> the quantisation leads to sticky behaviour in the VM as the guest timer
> subsystems account for the difference between delay time and the counter
> value.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> v2:
> 1. Removed the user-mode change that broke v1
> 2. Rearranged the implementation as a consequence of 1.
>
>  target/arm/helper.c | 51 ++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 48 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b74c23a9bc08..166a54daf278 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2277,6 +2277,34 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
>
>  #ifndef CONFIG_USER_ONLY
>
> +static void gt_recalc_timer(ARMCPU *cpu, int timeridx);
> +static void gt_cntfrq_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                            uint64_t value)
> +{
> +    uint64_t scale;
> +    ARMCPU *cpu;
> +    int i;
> +
> +    raw_write(env, ri, value);
> +
> +    /* Fix up the timer scaling */
> +    cpu = env_archcpu(env);
> +    scale = MAX(1, NANOSECONDS_PER_SECOND / value);
> +    for (i = 0; i < NUM_GTIMERS; i++) {
> +        if (!cpu->gt_timer[i]) {
> +            continue;
> +        }
> +
> +        cpu->gt_timer[i]->scale = scale;

Reaching into the internals of a QEMUTimer and changing
the 'scale' value seems like a bad idea. If QEMUTimer doesn't
have a facility for changing the frequency and we need one
then we should add one at that API layer.

Also, this isn't how the hardware works, I'm pretty sure.
In hardware the timers tick at whatever frequency they're
set up to tick, and CNTFRQ is just a reads-as-written register
that firmware can fill in with an appropriate value that it's
determined from somewhere for the benefit of other software.

If on ASPEED SoCs the timer frequency is different, then we
should model that by having CPU properties for timer frequency
and having the SoC set those properties, I think.

> +        gt_recalc_timer(cpu, i);
> +    }
> +}

thanks
-- PMM
