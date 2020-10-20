Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4759358lfa;
        Tue, 20 Oct 2020 05:55:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiibCBzIr4jWqN+17bM0wwUPF1ccN7dGljnb7T45fy3aRJusgTVCMiUgp9NrLvdMhMimQ1
X-Received: by 2002:a25:a224:: with SMTP id b33mr4197095ybi.109.1603198552730;
        Tue, 20 Oct 2020 05:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603198552; cv=none;
        d=google.com; s=arc-20160816;
        b=qz3PJBbc0KLgBhoGGEOL682xtWtTwphpw0xTcPiBH1XAv5Q9KbzlW94pKvVR2edWIP
         75NlvRjOcnbqtyfiy+Bds7tQQEjt8pAyvk+Jc8fn7m8byhdeK+PHDwt5wOS8YRjfS+ga
         AINyGpcngmK8BugsiTJx+gBFcVwUGzGAavafCYPGLl2XSAuJKLAJZNA3YFhY1UBXLwLd
         ib5SS9IemPwUjCGrYNkqqe6bhdZtHJDszL/zhLwVV4A/P2s3lJ3pD2cZi5eHz55kpQmX
         oikR2Fn6g12BCLwrozO/sabGU2DI7bj7GoW8EqKihYEF4azoa+B5JVZXjtH1Bh8rV/De
         6qIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L/6PHqH+TGvwE92BSCDHYQdMxJP2GXbcPBgEJuDa/38=;
        b=oL6JxMMH0STGj6aD/dU8AadmkuQ4/YCfpS/wivOcaQhj3Wm0BEtTDIUZA5Y312Rjcd
         ujK+3CNcKAbJeT3Sd/lu9rSUUrPoA2bvPQBeosIZBlieEC0NAVT1P7ro8PUkS4qNZSi9
         8p0fpCCuZMR0TUsTFzsvoankFOq9zXUO2fXo8IbH6WyYw8y7Ypz7ALRPguWNUTdrgERe
         ZTL4R3MQKk39kw4ZrrxijVfgiNys5dK2BbEo4kUIMKRdVKGBiGzbauXu7lYu0hpP32UC
         fEgcQP6lnpomaX6m3eSvHJdmLlo8VgI6CMvCMoX+UBAf+duFiE/BZTetUjxK5Aoa+5Gy
         en3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yXnGGUjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h188si1711732yba.388.2020.10.20.05.55.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 05:55:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yXnGGUjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUrBA-0004Ih-0y
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 08:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUrAt-0004IF-V9
 for qemu-arm@nongnu.org; Tue, 20 Oct 2020 08:55:36 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:38332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUrAq-0004S4-Nw
 for qemu-arm@nongnu.org; Tue, 20 Oct 2020 08:55:34 -0400
Received: by mail-ed1-x541.google.com with SMTP id i5so1720421edr.5
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2020 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L/6PHqH+TGvwE92BSCDHYQdMxJP2GXbcPBgEJuDa/38=;
 b=yXnGGUjJUI7koM9vYmfiyYZoIVnPICtapX69k5A+VybRbwarojCoi2pR2uPych3L4M
 X/NP/WcVNyGN7U8vP9sxudymsbmqyomYgtMqRyC17sp2l//v8pBKEcLRUXNupzDaFhxn
 NzZh9mZcPULOQ6HJ83CtYIa/okQ9jw5guFixOQLSA2qNnXhspUtyVwmJqntrTpUfVu1a
 YIo2Uc1wawiAFpEBJLD98GrenVUuQul40TA+no7OyQZfIlF9W6pdIUQJRwAWC6bTcilC
 OG0xKQBAoGFjXXpxFxJhJVTzhTm9msOsIbKUTvy267hjhfvYHSwatosnOu7vasKXv/Oi
 p/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L/6PHqH+TGvwE92BSCDHYQdMxJP2GXbcPBgEJuDa/38=;
 b=JNKY1ajyr/lsGTMQ2TmRVQDBukBOMHaUkq3mNrezWWwOHMQpUEanIL1DJ7MH4DNFyS
 RWlXlLBLOEStJz7uVazim9s5C2/XX63sRnuO2M+jKcG67RFz1vUYh+iNe89ByNhU1k9z
 qI99t/ZCFjPfpmGS999f8IrLT0m/0NPJpShWrpwtZHZX9JUTTov0Pf/mM6PhDkm527JU
 zHzfHPjiYHMPOBHmB8MyXgJU5ohAESYbh3y9c0p3DmHtZW//QFNdLoODuIISD3xZ7jhq
 6PM9v1pBSLSbLpaArU2QzbAUvYzO1xY7r09mNzXOrSVhkPkuoxRN2Mvt5AQ8/sAwXRcz
 FJxA==
X-Gm-Message-State: AOAM530cpUUG3eD6poIQ3PQXQzqnJbQK6Rn6f7xc13fgOro+oGLgsqrW
 26YkkpKOA2eF9/kwjFJatiGryppbGdGUDMauLI1sPA==
X-Received: by 2002:a05:6402:3133:: with SMTP id
 dd19mr2695415edb.100.1603198530325; 
 Tue, 20 Oct 2020 05:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201008232154.94221-1-hskinnemoen@google.com>
 <20201008232154.94221-4-hskinnemoen@google.com>
In-Reply-To: <20201008232154.94221-4-hskinnemoen@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2020 13:55:17 +0100
Message-ID: <CAFEAcA9gkSbQsP_sUJfXEdUQYrqGsq6SAb_0O8qWEV2iSRi1Mg@mail.gmail.com>
Subject: Re: [PATCH 3/6] hw/timer: Adding watchdog for NPCM7XX Timer.
To: Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4i8PI4L47P3z

On Fri, 9 Oct 2020 at 00:22, Havard Skinnemoen <hskinnemoen@google.com> wrote:
>
> From: Hao Wu <wuhaotsh@google.com>
>
> The watchdog is part of NPCM7XX's timer module. Its behavior is
> controlled by the WTCR register in the timer.
>
> When enabled, the watchdog issues an interrupt signal after a pre-set
> amount of cycles, and issues a reset signal shortly after that.
>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> ---
>  include/hw/misc/npcm7xx_clk.h             |   9 +
>  include/hw/timer/npcm7xx_timer.h          |  43 ++-
>  hw/arm/npcm7xx.c                          |  11 +
>  hw/misc/npcm7xx_clk.c                     |  20 ++
>  hw/timer/npcm7xx_timer.c                  | 275 +++++++++++++++----
>  tests/qtest/npcm7xx_watchdog_timer-test.c | 313 ++++++++++++++++++++++
>  MAINTAINERS                               |   1 +
>  tests/qtest/meson.build                   |   1 +
>  8 files changed, 620 insertions(+), 53 deletions(-)
>  create mode 100644 tests/qtest/npcm7xx_watchdog_timer-test.c
>
> diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h
> index cdcc9e8534..483028cf63 100644
> --- a/include/hw/misc/npcm7xx_clk.h
> +++ b/include/hw/misc/npcm7xx_clk.h
> @@ -42,6 +42,15 @@ typedef struct NPCM7xxCLKState {
>      int64_t ref_ns;
>  } NPCM7xxCLKState;
>
> +/**
> + * npcm7xx_clk_perform_watchdog_reset - Perform watchdog reset action generated
> + * by a watchdog event.
> + * @clk: The clock module that connects to the watchdog.
> + * @watchdog_index: The index of the watchdog that triggered the reset action.
> + */
> +void npcm7xx_clk_perform_watchdog_reset(NPCM7xxCLKState *clk,
> +        int watchdog_index);

It looks like you're using this as a mechanism for having the
watchdog module signal to the clock module that it needs to
do a reset. The usual way I'd implement a cross-device
link like that would be to use a qemu_irq for it -- the
receiving end creates a named GPIO input, the sending end
has a named GPIO output, and the SoC that creates both devices
also wires the GPIO link from one to the other. (You can
send an arbitrary integer down a qemu_irq, not just an
on/off, so you could do this either with an array of N
GPIOs, one per watchdog, or with just one that you send
an index value down.)

I have a handful of nits below but other than the above issue
this patch looks good.

> +static void npcm7xx_watchdog_timer_reset_cycles(NPCM7xxWatchdogTimer *t,
> +        int64_t cycles)
> +{
> +    uint32_t prescaler = npcm7xx_watchdog_timer_prescaler(t);
> +    int64_t ns = (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ) * cycles;
> +
> +    /*
> +     * The reset function always clear the current timer. The caller to the
> +     * this needs to decide whether to start the watchdog timer based on

"always clears". "The caller of this".

> +     * specific flag in WTCR.
> +     */
> +    npcm7xx_timer_clear(&t->base_timer);
> +
> +    ns *= prescaler;
> +    t->base_timer.remaining_ns = ns;
> +}
> @@ -259,9 +333,47 @@ static void npcm7xx_timer_write_tisr(NPCM7xxTimerCtrlState *s, uint32_t value)
>          if (value & (1U << i)) {
>              npcm7xx_timer_check_interrupt(&s->timer[i]);
>          }
> +

Stray extra blank line?

>      }
>  }
>

> +    /*
> +     * Set WTCLK to 1(default) and resets all flags except WTRF.
> +     * WTRF is not reset during a core domain reset.
> +     */

"and reset all flags" (or "Sets", if you prefer)

+    s->watchdog_timer.wtcr = 0x00000400 | (s->watchdog_timer.wtcr &
> +            NPCM7XX_WTCR_WTRF);
> +}
> +
> +static void npcm7xx_watchdog_timer_expired(void *opaque)
> +{
> +    NPCM7xxWatchdogTimer *t = opaque;
> +
> +    if (t->wtcr & NPCM7XX_WTCR_WTE) {
> +        if (t->wtcr & NPCM7XX_WTCR_WTIF) {
> +            if (t->wtcr & NPCM7XX_WTCR_WTRE) {
> +                t->wtcr |= NPCM7XX_WTCR_WTRF;
> +                /* send reset signal to CLK module*/
> +                npcm7xx_clk_perform_watchdog_reset(t->ctrl->clk,
> +                        t->ctrl->index);
> +            }
> +        } else {
> +            t->wtcr |= NPCM7XX_WTCR_WTIF;
> +            if (t->wtcr & NPCM7XX_WTCR_WTIE)
> +                /* send interrupt */
> +                qemu_irq_raise(t->irq);

This if() is missing its mandatory braces. (Not sure why
checkpatch doesn't catch this.)

> +            npcm7xx_watchdog_timer_reset_cycles(t,
> +                    NPCM7XX_WATCHDOG_INTERRUPT_TO_RESET_CYCLES);
> +            npcm7xx_timer_start(&t->base_timer);
> +        }
> +    }
>  }

thanks
-- PMM
