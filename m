Received: by 2002:a05:7022:ef03:b0:7c:9548:a19d with SMTP id qy3csp1923068dlb;
        Tue, 7 May 2024 03:26:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVx/czbiA+JYmbpSEOLXPRJvECwNYOaDbvhBlBgC3qrq/78iDdq6D8KX9t8L7W0kSZlLFIyUSXG/oyCfzp9oJVCe5CkxGjR
X-Google-Smtp-Source: AGHT+IGecySHUeZjt3uQ1YM87qMoWYEUJj2TQQUin4ZjdvQM1jDpr51whJC4SchH1m/U20WRq2x9
X-Received: by 2002:a05:620a:3bc1:b0:790:797d:2c4a with SMTP id yf1-20020a05620a3bc100b00790797d2c4amr11334348qkn.14.1715077607483;
        Tue, 07 May 2024 03:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715077607; cv=none;
        d=google.com; s=arc-20160816;
        b=TYHVmzhl5GBX4JSlZQM8Dfs3gRkMmn0iLxgfRIkUHTRXEopL3ciDihxJHn3SeWyArR
         bN7qQmKtv880PAOlURfnInB1NSDe0NEBh4Cbx3PbXPMtPTyWDzkaNc3nu8+wuufsZ4e5
         XtO6rTAVc5Kpw5VsAEODLxImbuz/wRurXzF0JryQw34CfYdxlU+z6id61RiqaGfJvb9i
         tyKnXnL/eUPV0JoJswr/xWm9UEMwa+77T67Z97Xez+BzD4YGNQmwtH2znrZaWTlNx1o9
         N9YGh0aA9fdX+BEY+svHgimajoejelystz1tRmJRCD5QKO/ugxp8NEa3opcooQlyVfAx
         szFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cQnw0Lr91mm91QCQbo0hvaxzztmipIFdNFt3BeGuD0g=;
        fh=b0caXY4CPe/psykXhmIC1ATq16ArCjqG/j8OdW1a7lM=;
        b=qpDN/l25tOudq1ipBduZzA2Byc0HBc0ZS3JbqBGVh0B41NOE6HG99I9Dgu0Uxi3nJf
         F5vR68pBMz1L/MYbTOyHOPZv8VR7gQK7eOrbSIZjMDGFInOG+xXA+GjhS/HErsOVk06X
         HGmeYKAlwYVKwXekv2atICxn8P5P71ytkjlp2oD6S7p75//U9Jeq42Z9IlaFENU6v9+e
         VP2ZyJYDhRW/mN6JLZt2QPiRzMpvfmZmJsOmZHI2lfhcH3jtA9fSS3rfo/zgbj0UBQTp
         sgPlR0fdVPtAKP35i+PYEef/lsfb3eXirdm8NoBTTmpTKj/+u4/fuYnUakjBNeRQb67j
         maxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RsmbSjE5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de30-20020a05620a371e00b0078d63a91645si12886096qkb.366.2024.05.07.03.26.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2024 03:26:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RsmbSjE5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s4I1v-0006ML-7E; Tue, 07 May 2024 06:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s4I1p-0006Hq-2G
 for qemu-arm@nongnu.org; Tue, 07 May 2024 06:26:33 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s4I1l-0005oe-8U
 for qemu-arm@nongnu.org; Tue, 07 May 2024 06:26:30 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a59a17fcc6bso657353066b.1
 for <qemu-arm@nongnu.org>; Tue, 07 May 2024 03:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715077586; x=1715682386; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cQnw0Lr91mm91QCQbo0hvaxzztmipIFdNFt3BeGuD0g=;
 b=RsmbSjE5fZHVVTthPsGrqmqDrxqvzVnEKQBqYmS+CTBNri+cyH/cp4dCyto9PlNmcn
 OQMmQeIP68wO7MQ7M+j9/DMEk5p21S2S5OH+p1U6J5h3ALwS9SmaK22QvAT1ARbSre6a
 EE+1pIv1xNGvgw8qEp/E8yabtysqfaJ2CDZuLJI2/g11lAVQfa1FrzVO9Br9A7ZwTxVy
 JuiI5YqREIrr1YXfLsFDcMcaYNM04dXA67ecS/v3W5ZrGcGPcJQP0mQL2mdev/kvr2Wg
 xNbFDweoKZ7QIg8eyq4sz6xGAtWCIFV1fbD+VkFv+3umIHCxb932K+XukZisl5Olp86/
 XzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715077586; x=1715682386;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cQnw0Lr91mm91QCQbo0hvaxzztmipIFdNFt3BeGuD0g=;
 b=PB0EKlpN++GzU35fxmJABvwEZMvuRsCL5dP5XcMUtmXzlqTYAHxg2CKKhwitrFrRx8
 ZgmcsV1/unQ7FQaVuWQ7A6a8KksQDasOQQc1jD7fEc0if8Vlgn7m3DvrvYhJiLCd2YGH
 bg21ge+hNrLQ0P7IU1uGIimbU15nmk7vvbAm5uFIUi0U0YRiI4qPdxNSkt12O+B3ZGCd
 7b0xGEPTBpnUH14ncBxkkRp43AHD2VqIRKJZo4P8bsanEGaNF7f3M3szrEEwLqPv3o78
 q3DlVr3GSCOs9V4D0KojTk4vkyLYGsNfS2sWPfTqMtrzaj6vb2lj66nyL+jcdvzLeQug
 iKOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgH4BWjJBZQ9J3N+l8pr3PB8UzbrBc0a7e6p4y0GF3+Jr+rf0J/tvBMRQpbJVZP7vXUJydG72XTHFBmXFDthEzT6Y6
X-Gm-Message-State: AOJu0Yx4ANNRDAivRZ/NvxEpW37p+Y1X+4EX6w1m0ZFlC9ZVaYJrSD0R
 sdeNpKMmP5b6A/3ZiITN6qXhd8GmeDJOH2lnNLi/tIBMFv5lRDuvyHznB+9H8G3tqJK+7CbKT+y
 yqEHC1/zy1T7WkbcSTiAGSz5psyfs1B3oGmxDuA==
X-Received: by 2002:a50:ab5a:0:b0:572:5f8c:42 with SMTP id
 t26-20020a50ab5a000000b005725f8c0042mr8214873edc.0.1715077586524; 
 Tue, 07 May 2024 03:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnsOnN6AkE3visU9jaycp61G87XRJFwDGx4D1=HJSJpA2tfXw@mail.gmail.com>
In-Reply-To: <CAHnsOnN6AkE3visU9jaycp61G87XRJFwDGx4D1=HJSJpA2tfXw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 May 2024 11:26:15 +0100
Message-ID: <CAFEAcA8S1HJgcJdC5M=V1UHZHwNKhX_ii9PNNc88uC2Gi2E3sw@mail.gmail.com>
Subject: Re: [PATCH] Fixes: Indentation using TABs and improve formatting
To: Tanmay <tanmaynpatil105@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org, 
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com, richard.henderson@linaro.org
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Z4ddtXaEm7OS

On Mon, 6 May 2024 at 07:20, Tanmay <tanmaynpatil105@gmail.com> wrote:
>
> Hi,
>
> I have added a patch inline that fixes indentation and formatting for some files as listed in https://gitlab.com/qemu-project/qemu/-/issues/373.
>
> Thanks,
> Tanmay

Hi; thanks for this patch. Unfortunately there seem to be some
problems with the formatting, which mean it doesn't apply correctly.

In particular you've sent it as a plain/text + HTML email, and
something (probably your mail client) is wrapping long lines.
I can usually fix something like this up on my end for a first
time submitter, but in this case the patch is just way too big
for that to be practical.

I generally don't recommend trying to send patch emails directly
through the gmail web UI -- it unfortunately mangles them too
much. Personally I use git-send-email; it is a bit awkward to
set up, but https://git-send-email.io/ has a nice step-by-step
guide including specific details on how to configure it to send
via Gmail.

> From 46026574821c46804111eea6607a1b39314b7abe Mon Sep 17 00:00:00 2001
> From: Tanmay Patil <tanmaynpatil105@gmail.com>
> Date: Sat, 25 Nov 2023 00:53:54 +0530
> Subject: [PATCH] Fixes: Indentation using TABs and improve formatting
>  Resolves: https://gitlab.com/qemu-project/qemu/-/issues/373
>
>    Files changed:
>         - hw/arm/boot.c
>         - hw/char/omap_uart.c
>         - hw/dma/pxa2xx_dma.c
>         - hw/gpio/omap_gpio.c
>         - hw/gpio/zaurus.c
>         - hw/input/tsc2005.c
>         - hw/input/tsc210x.c
>         - hw/intc/omap_intc.c
>         - hw/misc/cbus.c
>         - hw/misc/omap_clk.c
>         - hw/misc/omap_l4.c
>         - hw/misc/omap_sdrc.c
>         - hw/misc/omap_tap.c
>         - hw/sd/omap_mmc.c
>         - hw/sd/pxa2xx_mmci.c
>         - hw/timer/omap_gptimer.c
>         - hw/timer/omap_synctimer.c
>         - hw/timer/pxa2xx_timer.c
>         - include/hw/arm/pxa.h
>         - include/hw/arm/sharpsl.h
>         - include/hw/arm/soc_dma.h
>         - tcg/arm/tcg-target.h
>
> Signed-off-by: Tanmay Patil <tanmaynpatil105@gmail.com>
> ---
>  hw/arm/boot.c             |   8 +-
>  hw/char/omap_uart.c       |  49 +-
>  hw/dma/pxa2xx_dma.c       | 198 ++++----
>  hw/gpio/omap_gpio.c       | 243 +++++-----
>  hw/gpio/zaurus.c          |  61 +--
>  hw/input/tsc2005.c        | 130 ++---
>  hw/input/tsc210x.c        | 442 +++++++++--------
>  hw/intc/omap_intc.c       | 261 +++++-----
>  hw/misc/cbus.c            | 202 ++++----
>  hw/misc/omap_clk.c        | 999 +++++++++++++++++++-------------------
>  hw/misc/omap_l4.c         |  21 +-
>  hw/misc/omap_sdrc.c       | 135 +++---
>  hw/misc/omap_tap.c        |  28 +-
>  hw/sd/omap_mmc.c          | 208 ++++----
>  hw/sd/pxa2xx_mmci.c       | 149 +++---
>  hw/timer/omap_gptimer.c   | 126 ++---
>  hw/timer/omap_synctimer.c |   7 +-
>  hw/timer/pxa2xx_timer.c   | 279 ++++++-----
>  include/hw/arm/pxa.h      | 100 ++--
>  include/hw/arm/sharpsl.h  |   2 +-
>  include/hw/arm/soc_dma.h  |   4 +-
>  tcg/arm/tcg-target.h      |   4 +-
>  22 files changed, 1903 insertions(+), 1753 deletions(-)

This is a lot of changes to do all in one commit, even though they're
all just whitespace fixes. Could you split them up, please, into
multiple patches that tackle fewer files at a time?

thanks
-- PMM
