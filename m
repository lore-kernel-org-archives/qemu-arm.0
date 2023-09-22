Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1308579ejm;
        Fri, 22 Sep 2023 06:22:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYDr7vMI8nKf+Ss2ZcH2SoSUwOBTwNOctmC8nuUBVUs9Yb9EryavPNnPVA7fFGlRRbisK7
X-Received: by 2002:a05:6870:d61f:b0:1bf:5b4:4a51 with SMTP id a31-20020a056870d61f00b001bf05b44a51mr8759845oaq.58.1695388964195;
        Fri, 22 Sep 2023 06:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695388964; cv=none;
        d=google.com; s=arc-20160816;
        b=UIkAVb7vO3PP9qp/bIjCG8WhuOOc7HjNExRBEARwDNe/qzfxuOpQWS7VE+KBOvCpdn
         1MvwatlkXY43yjxtT/ub7snkLVfkp1hHXQOnQda+EJG4aXRf5F46dmwAqSmnU/P1Abru
         inq5hkyvFRDcvBWkUi91/TWMGRc9Z3r581jaLhS+4k4NnTnguF/HtrChT/2dc94Oh8dm
         rbsfp8k+a6ejbs7ocq6na4Mf/qOFhI8bh4+GaHhR0kAF2OGrk3IEbUWGop+JfkcLnS5Y
         tCgNIA2P0hNu27MJUcInWupWWT9JW0vyw2CUIAmY7JwGYZYkeS+OF51y34CJ8IhKjHTf
         lreQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=fXpKl2BGpGdi3OwMOFg1/TqxscWjdljbyxHohHlQzss=;
        fh=QI4ekA9CPF2UDmZ9IbBxztVUWiLuNXqX6g2lGMmCLnw=;
        b=Una/SZLO4uybRhJIOLMj3SVXguMKmD5s9lIyahnY6Tan82GARTP3ytBLvmOdJI9wIp
         Z6Nmm2Z8rtgZ8+4S+84J95hMoqQ/YkDNZUSZgqySy3hiAt4uTslpHR1MY54w1VagPDtf
         ueH2LJ+kF6V00N7Qt4t4y5uOVk/OUydRLsXBG2OQQng3uSC2HgPYE5PqL2HoUDLIOoDk
         3H5JZnNTQlsPscBW3HTY9v7K69S3PzL5J3gN18f5xiHnE/QBq1kufquF3rFXhFPq3UdQ
         Z1zMs15sSknxwUwGdxtbb7YPNpAEptuyQsLTVXtD6+1Ox33qEQmsyYYJpTgtaaSjhXkr
         GNUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10-20020a0cde0a000000b0062529d9a496si2194879qvk.608.2023.09.22.06.22.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 06:22:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qjg6i-0008GG-PN; Fri, 22 Sep 2023 09:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=/LOp=FG=kaod.org=clg@ozlabs.org>)
 id 1qjg6h-0008Fm-Cf; Fri, 22 Sep 2023 09:22:07 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=/LOp=FG=kaod.org=clg@ozlabs.org>)
 id 1qjg6e-000635-AH; Fri, 22 Sep 2023 09:22:07 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RsXwy62rVz4x5J;
 Fri, 22 Sep 2023 23:21:54 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RsXww4f8Mz4x3G;
 Fri, 22 Sep 2023 23:21:52 +1000 (AEST)
Message-ID: <a4a62040-0127-4f39-4fc3-a1795e4daad8@kaod.org>
Date: Fri, 22 Sep 2023 15:21:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Qemu-devel] [PATCH 08/19] aspeed/timer: Fix behaviour running
 Linux
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
References: <20190525151241.5017-1-clg@kaod.org>
 <20190525151241.5017-9-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20190525151241.5017-9-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=/LOp=FG=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ntOUIo3BO8dD

Joel, Andrew,

On 5/25/19 17:12, Cédric Le Goater wrote:
> From: Joel Stanley <joel@jms.id.au>
> 
> The Linux kernel driver was updated in commit 4451d3f59f2a
> ("clocksource/drivers/fttmr010: Fix set_next_event handler) to fix an
> issue observed on hardware:
> 
>   > RELOAD register is loaded into COUNT register when the aspeed timer
>   > is enabled, which means the next event may be delayed because timer
>   > interrupt won't be generated until <0xFFFFFFFF - current_count +
>   > cycles>.
> 
> When running under Qemu, the system appeared "laggy". The guest is now
> scheduling timer events too regularly, starving the host of CPU time.
> 
> This patch modifies the timer model to attempt to schedule the timer
> expiry as the guest requests, but if we have missed the deadline we
> re interrupt and try again, which allows the guest to catch up.
> 
> Provides expected behaviour with old and new guest code.
> 
> Fixes: c04bd47db6b9 ("hw/timer: Add ASPEED timer device model")
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> [clg: - merged a fix from Andrew Jeffery <andrew@aj.id.au>
>          "Fire interrupt on failure to meet deadline"
>          https://lists.ozlabs.org/pipermail/openbmc/2019-January/014641.html
>        - adapted commit log
>        - checkpatch fixes ]
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/timer/aspeed_timer.c | 59 ++++++++++++++++++++++-------------------
>   1 file changed, 31 insertions(+), 28 deletions(-)
> 
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 5c786e512815..9ffd8e09f670 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -109,37 +109,40 @@ static inline uint64_t calculate_time(struct AspeedTimer *t, uint32_t ticks)
>   
>   static uint64_t calculate_next(struct AspeedTimer *t)
>   {
> -    uint64_t next = 0;
> -    uint32_t rate = calculate_rate(t);
> +    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    uint64_t next;
>   
> -    while (!next) {
> -        /* We don't know the relationship between the values in the match
> -         * registers, so sort using MAX/MIN/zero. We sort in that order as the
> -         * timer counts down to zero. */
> -        uint64_t seq[] = {
> -            calculate_time(t, MAX(t->match[0], t->match[1])),
> -            calculate_time(t, MIN(t->match[0], t->match[1])),
> -            calculate_time(t, 0),
> -        };
> -        uint64_t reload_ns;
> -        uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> -
> -        if (now < seq[0]) {
> -            next = seq[0];
> -        } else if (now < seq[1]) {
> -            next = seq[1];
> -        } else if (now < seq[2]) {
> -            next = seq[2];
> -        } else if (t->reload) {
> -            reload_ns = muldiv64(t->reload, NANOSECONDS_PER_SECOND, rate);
> -            t->start = now - ((now - t->start) % reload_ns);
> -        } else {
> -            /* no reload value, return 0 */
> -            break;
> -        }
> +    /*
> +     * We don't know the relationship between the values in the match
> +     * registers, so sort using MAX/MIN/zero. We sort in that order as
> +     * the timer counts down to zero.
> +     */
> +
> +    next = calculate_time(t, MAX(t->match[0], t->match[1]));
> +    if (now < next) {
> +        return next;
> +    }
> +
> +    next = calculate_time(t, MIN(t->match[0], t->match[1]));
> +    if (now < next) {
> +        return next;
> +    }
> +
> +    next = calculate_time(t, 0);
> +    if (now < next) {
> +        return next;
> +    }
> +
> +    /* We've missed all deadlines, fire interrupt and try again */
> +    timer_del(&t->timer);
> +
> +    if (timer_overflow_interrupt(t)) {
> +        t->level = !t->level;
> +        qemu_set_irq(t->irq, t->level);
>       }
>   
> -    return next;
> +    t->start = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0));

This MAX(MAX(x, y), 0) looks strange to me. Would you remember where it comes
from ? Thanks,

C.


>   }
>   
>   static void aspeed_timer_mod(AspeedTimer *t)

