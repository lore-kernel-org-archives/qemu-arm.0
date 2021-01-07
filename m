Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp604222lfq;
        Thu, 7 Jan 2021 12:51:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzztd+DivBYJAXGkV0UD1jjvZPc8/0uCsBf7gW+P3ZWylHTq/ZTCA9T7pDWhdGl+xcigVBS
X-Received: by 2002:a25:ad93:: with SMTP id z19mr933516ybi.486.1610052718378;
        Thu, 07 Jan 2021 12:51:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610052718; cv=none;
        d=google.com; s=arc-20160816;
        b=rBJ+ggA5dW8vh+lI/zDjEdmETdH6aryXB0hPQZpZJHw3/Olvv0xegi1BouqpV++vfd
         gMx9Kdp9nqMRaaoN4m7yAentWRsrty7464fn1pgfwfGGaKN1R4L7h/UQwQdHiBbW6sr5
         cTK6B+K00Q9O3rkPc8dLmnDLRLzHaltDpEqkcTe3pDUzPLyno1YmlvsD292kYBD9ajtd
         r95mntiDi3irEQhfQujuZT/wnW/FJcpOY6i5Vbb6ZEiRCyHmvNLEfhiyFVvgtGbKoFZy
         PUA7FgAuUjXFiiBxzgBKmUkyIHaEQ6HMGX1vppq2nsru0BPmmh/utKP6QgbrQ6qILG7Y
         7cUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gqi24Ai0MHhPoFwoMyHu9fKaAXLmhYyMzu9GXm1LsrM=;
        b=P7Lm1sc8cwZcNUjS7aCN6hBH3eFVItGLnEHI3uXzSnDliZw6DMDRi57m4E5UOCiRvz
         /RVsoFpuhNt53adUap77Yse/lwpCIQRvy4tAKhqfE7D0iSBSUXNkRWtvAcJxrwElMPrM
         Q/dW3VqVrtZqRO0DlV58+bHt8chAyseMeIHsKFlh8CWXbkhGdESEOq5sKuNODs1XqBsK
         nPvftsj0fzcb7EMxpS6xW0KjmXGsCYuQlY6HqfNrb2/bCEZ5HhGVgH/s2LG9Z2NvI18r
         wl5zsj0EntHft/4My03JgWusPZDTxS+fDih5cVcooSLqnJ4mbJ0AZgHlVSW3OknXqOPU
         G0sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NjO57jFT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k1si6809175ybm.38.2021.01.07.12.51.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 12:51:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NjO57jFT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxcGD-00055C-PY
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 15:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxcG3-00050B-8d
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 15:51:47 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:45352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxcG1-00053s-06
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 15:51:47 -0500
Received: by mail-ej1-x62a.google.com with SMTP id qw4so11501589ejb.12
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 12:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gqi24Ai0MHhPoFwoMyHu9fKaAXLmhYyMzu9GXm1LsrM=;
 b=NjO57jFTI9+HM4g6sWEwJzQhjaD66Jd0feXVPmgziRSukdgI3JdsR+NR4mPMsqjkJ2
 KZbMjvU+LB+MlP96cNzQN1gVF85tz1wXv4TGVArPrjDK0QfjhLF/Owlo9XTvo4kqvyB5
 AFDlORPoemfXplrPyV/JilgYYyPWYac5AlZJyAaHkp3o9eK5cp3mDnmCmxLHRLsCgGry
 aLnc8UkU7OjARUnwd2GX8+ElIuwf6MEVCSr/xO8XzYHLh/ncG/iwAFmMLa/cI8CI7tw0
 nCbBlrEIM9JUaiiJM+OkBblPGmuKT+ZbQE8IUtHSilIMo84ovSbAMl/0fIEUXhKAvsEB
 UoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gqi24Ai0MHhPoFwoMyHu9fKaAXLmhYyMzu9GXm1LsrM=;
 b=GLYjFi2exhHCvKuULhAWL2u69COQGsSBJRZmcoRRR0h2L1Wd2JiLZTHYLfqQeI6Ydp
 BNb4cw9N2v7hoGkjCBTzDm51yIPATUmRGT7c9Cm1XfPADwWrju2BcGMASbS6LNgzNjlm
 l3R2A5OggPjg/AgzSWDngQpqzX2E5S03+1jU6+BzdZuxWJ6WdQm5AAQ7aU3qbCSpkYcH
 LCbljk9M687IElHoJYmGglTkCOnleSMl644hjSqW3Yu2g5eWKXV15hc4cnuXJApaDGvL
 NDL6I46e1aRHORcAB7xQ73ZBN8HOLHEZeRyqzLRBwGzlGFgpMLTtpFMcywrR5Z4tWSG7
 7yrw==
X-Gm-Message-State: AOAM532l/XCK+cD2fdMGHmg2FKMK2/k0WAvGLFLdwBfQxEXcEcc9IxvJ
 nfQQv0012ANGrYOk4Z+7asjXUMfFrw1PN0zA24MZeA==
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr468767ejr.482.1610052702610; 
 Thu, 07 Jan 2021 12:51:42 -0800 (PST)
MIME-Version: 1.0
References: <20201217004349.3740927-1-wuhaotsh@google.com>
 <20201217004349.3740927-3-wuhaotsh@google.com>
In-Reply-To: <20201217004349.3740927-3-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 20:51:31 +0000
Message-ID: <CAFEAcA_jEYK_e7uoJCKn=+om8c6cCRW0Xt5TKi6mzto+zE44Fg@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] hw/timer: Refactor NPCM7XX Timer to use CLK clock
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c50CifsevNNS

On Thu, 17 Dec 2020 at 00:45, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch makes NPCM7XX Timer to use a the timer clock generated by the
> CLK module instead of the magic number TIMER_REF_HZ.
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx.c                 |  5 +++++
>  hw/timer/npcm7xx_timer.c         | 25 ++++++++++++++-----------
>  include/hw/misc/npcm7xx_clk.h    |  6 ------
>  include/hw/timer/npcm7xx_timer.h |  1 +
>  4 files changed, 20 insertions(+), 17 deletions(-)

> @@ -130,7 +130,7 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer *t, uint32_t count)
>  {
>      int64_t ns = count;
>
> -    ns *= NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ;
> +    ns *= clock_get_ns(t->ctrl->clock);
>      ns *= npcm7xx_tcsr_prescaler(t->tcsr);

I'm afraid that since you wrote and sent this we've updated the
clock API (in commits 554d523785ef868 and de6a65f11d7e5a2a93f),
so clock_get_ns() doesn't exist any more. Instead there is
a new function clock_ticks_to_ns().

The idea of the new function is that clocks don't necessarily
have a period which is a whole number of nanoseconds, so
doing arithmetic on the return value from clock_get_ns()
introduces rounding errors, especially in the case of
"multiply clock_get_ns() by a tick count to get a duration".
(The worst case for this is "clock frequency >1GHz", at which
point the rounding means that clock_get_ns() returns 0...)

There is as yet no function for "convert duration to
tick count", so code like:
   count = ns / clock_get_ns(t->ctrl->clock);

should probably for the moment call clock_ticks_to_ns()
passing a tick count of 1. But I plan to write a patchset
soon which will avoid the need to do that.

Strictly speaking, even "call clock_ticks_to_ns() and
then multiply by the prescaler value" can introduce
rounding error; to deal with that I think you'd need to
either have an internal Clock object whose period you
adjusted as the prescalar value was updated by the guest,
or else do arithmetic with the return value of clock_get()
(which is in units of 2^-32 ns); I'm not sure either is
worth it.

thanks
-- PMM
