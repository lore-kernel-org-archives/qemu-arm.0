Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp5550lfo;
        Tue, 2 Feb 2021 02:37:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDA6f5QOnIH/+kVPv3XMeo7r99aFLsUh3ZNdAjM6bva9hMLUqb4Dwuj58Ej1TpIrYPabiR
X-Received: by 2002:a25:718b:: with SMTP id m133mr32065943ybc.412.1612262110188;
        Tue, 02 Feb 2021 02:35:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612262110; cv=none;
        d=google.com; s=arc-20160816;
        b=QT53/rgLIlzCEjnY1MbAW0Ood5UNJjfNZApjgdkbT69nJgPgd1cnw5Yh+rcM44tqHx
         gIHjCFJwDsK0fqnuJ3CMUlBLDCv5fYJhRP8ZJY70a4x2KQhA5++zs229sHMCFKhvCn55
         wLtpc5wbr74M6UA2IO2DmRs7Aa7bFToTJ3YMMclDd4XFdUEv8g2u5HiRvxa7cL+3RHWq
         CVWIeRXkWpPLZl38bvC3A1kLMiBbG04FAZZVlP7aANpzsEKLajtssB5icftmD4psuTfi
         PZtoqPiVl+A7abnKSimUwQ5I/NsAd35dvt4Pd6os9+bzWJjERYzeV1mGUQ9reySaXdR/
         i0tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oYCKgYeTZFIXYzlgfOx5yK9+kfLjp/kYudqFD9ohZU0=;
        b=geWyd6TA4TX/Xx5rqDA/wu2XwGHD6QNtrrKQiW4Pr/1xPdmW5nkgLDLaBZ4bRDzD7d
         O9MhHU9NKhh5sWIJLbk3jhORbMi6IYECC/AH0PNGUew34bIbdEonEShhWXH2497Naq8e
         SuuHkPE8rSZkjvtBaoaSjpREVC2saCe8iyyIW6+Tdl5iI5uRbD1MVa8czSrT4Glwm9kO
         8gZI8UVJZN2XNmcqj8kaRy7Qh6Cw+cJWSIo0+IKbDZ1ILRxQz+lOg+N0gJEkoCAxND03
         /OJkpjiL0n6UtxskmllCkumHVEQ9qtSWBzhsW/Bl69V6uz0yEr0aqH1KPWwqVsN7djwO
         Q4KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dO6hhg1G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si8035641ybf.437.2021.02.02.02.34.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 02:35:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dO6hhg1G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6t1B-0005US-RX
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 05:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6t0j-0005SO-F8
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:34:17 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:36405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6t0h-0005dT-D7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:34:17 -0500
Received: by mail-ej1-x62d.google.com with SMTP id lg21so1821442ejb.3
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 02:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oYCKgYeTZFIXYzlgfOx5yK9+kfLjp/kYudqFD9ohZU0=;
 b=dO6hhg1GHVOjQPHXePsA0p8jBPb9Nkl2JJfliTN1opjL5WnHYdqtCMDG0f5BGqgbUw
 p1y0KasxRn7BW4Key6E0Do82hQoFCq4MlqjYTPdeDYOR7tovhchavIlkDtfN9zc45oUg
 ONJP2mO1jPBzr3db/Jfqob/Alkm7SEveqGqti4/xI0yOwRDgxeb+BbRdkyK8JsCpxg6A
 RtkRO4oYX8gqIhB9BEUihKfOuP8RIUBqHWa3Hn2v1PbE6BXaA4fuxQYsEjBmYWEa4fwV
 +BfO0pyuyHWyYJsOJlYhdvQuN4B7M/LDGYd54FAXwvVGEJSvS20qOeHMSqBbwS70VGBN
 bcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oYCKgYeTZFIXYzlgfOx5yK9+kfLjp/kYudqFD9ohZU0=;
 b=r1V+8vp/KM5BGjQSWKyfVZZTZfGAqTFhhvEki5AXnXhqhzQP5d+/Dy2LNtZovFrOFj
 a2peBKibKDm7Ivsyv5tdtk1as7Vzcl2jjmxvVloFMyLSNdZXjfgRoUP7Gb1ELTxvuzrD
 Ivx9CA4pSAvJBu5Ndxr7/pizuXv5Qg1KtPuuanWo9RaAlZLiO76LonfSFLoWf5Kvrv8B
 MXP4m7q6FeZH3Np45hEMoguiCjvjIlAX8T2u7PGIdVTtf9skJhN50X0KM3YYX/MxqfWc
 H/hKjWPUWT+YIH4dmORCX+z3aPSx93LBG+cU6DdruZ1fDEJviSN1xhUPD1C867SGgV/2
 bhAQ==
X-Gm-Message-State: AOAM532CwRoIzPTZGjxXj57Jg7MjZJuZEMNJER+OZU5Qtp6wai2+Auxp
 udlJ+XZ2SHK/fbYwCHQBA8MjCSRBtPfVaHsjueChnA==
X-Received: by 2002:a17:906:5917:: with SMTP id
 h23mr11011083ejq.407.1612262053882; 
 Tue, 02 Feb 2021 02:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20210124025306.3949-1-leif@nuviainc.com>
 <20210124025306.3949-4-leif@nuviainc.com>
In-Reply-To: <20210124025306.3949-4-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 10:34:02 +0000
Message-ID: <CAFEAcA8M6kfy-xfBViMjDLM-XSKcBSie+6nhSCWGQpRy3+PdGg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] hw/intc: set GICD_TYPER.DVIS for GICv4
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QncAY3Mi7EN5

On Sun, 24 Jan 2021 at 02:53, Leif Lindholm <leif@nuviainc.com> wrote:
>
> The VLPI frames are what make the redistributor size change, so ensure
> we state in GICD_TYPER that we have them.
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  hw/intc/arm_gicv3_dist.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
> index b65f56f903..833deb0a74 100644
> --- a/hw/intc/arm_gicv3_dist.c
> +++ b/hw/intc/arm_gicv3_dist.c
> @@ -387,6 +387,9 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
>
>          *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
>              (0xf << 19) | itlinesnumber;
> +        if (s->revision == 4) {
> +            *data |= (1 << 18);;
> +        }

Double semicolon.

>          return MEMTX_OK;
>      }
>      case GICD_IIDR:

I think I'd prefer not to take this patch in mainline for the moment:
it would be "safe", in the sense that it doesn't affect anything,
but it's not the only thing in this register that changes for GIC
versions > 3, and it would make a lot more sense to go in as part
of the general support for the feature the bit is advertising.

thanks
-- PMM
