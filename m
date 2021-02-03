Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp567782lfo;
        Wed, 3 Feb 2021 13:14:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmXiIYer0pv6AvN/+bqGX5BfL50GP4de5aHqAgslUMxV9escLiFqZ0njARR2d5aDmau03v
X-Received: by 2002:a5b:7c1:: with SMTP id t1mr6893513ybq.480.1612386865742;
        Wed, 03 Feb 2021 13:14:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612386865; cv=none;
        d=google.com; s=arc-20160816;
        b=wFAFlp+JbD4g4Cexe3obvTNS1SnItYhOugJZDFgRiw1ctyDUFgUQfV2QYcDDaOZO9E
         jflD8sRw+NBHmvLjqADmJVf3YArJwDFar5cyAUNHf0/4UWS2na/MMEcrBJNCa+eVguH8
         oUYtCSNAW91feqbJuzo1z97kcalYXVDY/+LkRqCKRNA8kvyNIdG4Vu7sWQ5U43mBSCjv
         aN5i7r5oP3kJgmPjJLs4hhQpMHPVJ7gSoW6Guwk66kDn2Ji5KFG2ep5xI9wjy/cDcb0A
         GMTolrPT8JxfGd6MOLRjzlveLMez4/jeyeUarCSDe29ZllmxkScJ7QNjUiVvDqOUnt3C
         JWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=EEnYCCzG9PWtib6tXNLQD66+EeJEANh6CSJRwlVV/wY=;
        b=p4UWWyuV6w65aJNGUzgWm7siHRJKTQrzrcgkK6zxcJQEQMNUKv+5Kbb6FY/oPsaSkp
         g8ICeBntzY3aKbJnf81alsCzqy7SkrozFkjQwEIspRgg1mzEv6mOJFmGxVHb7laLuTil
         vuo9M9SHoMso4uXJx4ehB8qOFF9L77G/d01rt+xS2US5J5fzUWLlEo0SdLnhZ6DbzN/S
         Vfo7Pobw/12ZPjmzq3YpAT9x/dOB+eIztFXSgR0BW11MqJhYCsS9WhfqK+wdWgtlacaX
         8MdvUYaXnWDelJnHk1+l9A7JRZFlUW9k0RZTJt7FBnk+GQCShpYNXtl62JB1Vs4s4YtA
         LrbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=HtlaS6B6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n2si3243902ybn.340.2021.02.03.13.14.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 13:14:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=HtlaS6B6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:50354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7PTl-00021b-44
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 16:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l7PTb-0001ze-Ld; Wed, 03 Feb 2021 16:14:15 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:57784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l7PTZ-0007XH-4K; Wed, 03 Feb 2021 16:14:15 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 25A5DC602E6;
 Wed,  3 Feb 2021 22:14:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1612386849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EEnYCCzG9PWtib6tXNLQD66+EeJEANh6CSJRwlVV/wY=;
 b=HtlaS6B6UaywRqi+WmENeld124sEohg4T91wfkOhaj/OQrdqLaC2MnD5fNwXcmR7k2veIw
 kXPl8GfN5rHdI1ov6RLZ8t5AOEb0xX8AmZmxhV5kTfh7Jo9/oUjYZJqa5dtvo2VjkQsVel
 L3uOl2okKabl8vk41OlQZV452mlxdXDiDhXf1z0KmQijMCyUmyKQUDnl678JIAx8kO2eXl
 R/nWzm+UTkbPawHsM418+yGLz70vuk3x8wvJr4I2Sn/VkuiOzmKSJfKnj1RTDsM+I3UtxA
 m2CdtrVkuEy4r3uNqPXpCjz45bsHbkZQku9zsRKOgYQW/ROuR0tOZePAVJbbWw==
Date: Wed, 3 Feb 2021 22:14:36 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC 0/4] New APIs for the Clock framework
Message-ID: <20210203211436.lkxqejxgx6alsvef@sekoia-pc.home.lmichel.fr>
References: <20210201123013.32308-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201123013.32308-1-peter.maydell@linaro.org>
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
X-TUID: 2JQcdbArPWRa

On 12:30 Mon 01 Feb     , Peter Maydell wrote:
[snip]
> 
> Side note: there is currently no MAINTAINERS entry for the
> clock framework. Any volunteers? It would cover
> 
> F: include/hw/clock.h
> F: include/hw/qdev-clock.h
> F: hw/core/clock.c
> F: hw/core/qdev-clock.c
> F: docs/devel/clocks.rst

I'd love to get involved as a maintainer so I volunteer. And I think
this part is reasonably small to get started. Do you have some
guidelines? I found https://wiki.qemu.org/Contribute/SubmitAPullRequest
on the QEMU wiki.

Thanks.

-- 
Luc

> 
> thanks
> -- PMM
> 
> Peter Maydell (4):
>   clock: Add ClockEvent parameter to callbacks
>   clock: Add ClockPreUpdate callback event type
>   clock: Add clock_ns_to_ticks() function
>   hw/timer/npcm7xx_timer: Use new clock_ns_to_ticks()
> 
>  docs/devel/clocks.rst            | 54 ++++++++++++++++++++++++++++++--
>  include/hw/clock.h               | 52 +++++++++++++++++++++++++++++-
>  hw/arm/armsse.c                  |  8 +++--
>  hw/char/cadence_uart.c           |  5 ++-
>  hw/char/ibex_uart.c              |  5 ++-
>  hw/char/pl011.c                  |  5 ++-
>  hw/core/clock.c                  |  5 ++-
>  hw/misc/bcm2835_cprman.c         | 20 +++++++++---
>  hw/misc/npcm7xx_clk.c            | 31 ++++++++++++++++--
>  hw/misc/zynq_slcr.c              |  6 +++-
>  hw/timer/cmsdk-apb-dualtimer.c   |  5 ++-
>  hw/timer/cmsdk-apb-timer.c       |  5 ++-
>  hw/timer/npcm7xx_timer.c         |  4 +--
>  hw/watchdog/cmsdk-apb-watchdog.c |  5 ++-
>  14 files changed, 188 insertions(+), 22 deletions(-)
> 
> -- 
> 2.20.1
> 

-- 
