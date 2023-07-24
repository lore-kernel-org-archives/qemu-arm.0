Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1984839ejb;
        Mon, 24 Jul 2023 09:11:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHXB725ZWMUoNJ3Xfe9ZadA0BrD2+zTzd+8APtDEr3TzIa1o3hzt7Jo/G0SmBeRVFtN7tiI
X-Received: by 2002:ac8:7e91:0:b0:403:fe7a:8d1c with SMTP id w17-20020ac87e91000000b00403fe7a8d1cmr234713qtj.16.1690215066189;
        Mon, 24 Jul 2023 09:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690215066; cv=none;
        d=google.com; s=arc-20160816;
        b=txng+Sxt+SoiqnoiN3nNRDnBSj0ZOmPU5ABbFBfiGNxiyEWlnqP2z52Y5k47YPn8it
         aDT+Z6FnIfKexFWpv5xeBGP0ylvBqBcdTJusSsayFoW/r7CMU4oF56xLDBfJ4ZFKYRDC
         Hl92lZneZHBZDvscf8XQ45s67ZswQgRUe+iii3XXIQrct+bJVavaxKV/SCJ1NvOljcl5
         8nVJ14IDDSJZq4EAoHIiZvYS9T4DXKR491vGTT4F38AIRV6riGnLiSkcxjwxMcYLQZHN
         EaR7cq6VTsQYusVe6DsH8fDau02ro02vfxmPCzjUjzC2YX9qGWcuGHSlpV/Q5xkX/jc1
         CN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=p4A7HnlNR4y+LiYMI6gxgLeOOWyF7e54galRz7wGSfw=;
        fh=XBL7wuOnmyes3GPK3AEoJ+XBo7B8JI753uFIVICnU40=;
        b=EMsIa1bmKRjsL9oJ/pq6BRmyzdYC+mH/LX9ivKCIXnqvddf2YPAv5YG8WhFmC3UIPs
         XuC8YN3LndlGsyPmApZLo4yOt7CzAguvz2pNNbzs31X/oPjk0VEMkspiP4hYyoOtScDP
         4s3Z61yUOgrmxOgBrAYg3SCGN/hnc9FXAw0R1cNOK9ndp4hEDViy9UBdCKwYVqvglU4u
         2qAM9Go/sBrSVGSf6oA7VdJCphqwr7ZxovyMx3kCRK/OFiUrdqrH3nV/CBg1gRwi2+sh
         LMxCDZr6a4EKCT42d1w1txq4wz1ARfyTXgENbIIOd8CcCcd/jXO8qXq0gn4caiad9Ag3
         +Jxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xm9w+aKM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10-20020a05622a14ca00b00403ef028ba7si5346057qtx.156.2023.07.24.09.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jul 2023 09:11:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xm9w+aKM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNy97-0005xJ-2Y; Mon, 24 Jul 2023 12:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qNy90-0005vf-6l
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 12:10:47 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qNy8y-0005d0-60
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 12:10:45 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fdd31bf179so6756272e87.2
 for <qemu-arm@nongnu.org>; Mon, 24 Jul 2023 09:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690215042; x=1690819842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p4A7HnlNR4y+LiYMI6gxgLeOOWyF7e54galRz7wGSfw=;
 b=xm9w+aKML9zzBDSeIXkf1KIrAjdJ2b99uCuaMcU7/UK7Yxtt/JkLw+f/8x49F8ZR6Q
 pzBgQI2bEQzEg8C8sRrf0Eas6xXm9frm43FQM8TLiVZ4qaf3+mT3ABLObGkxV3s1YBdR
 aWlAFYlxd3dQ8obyVpm8WHGQiSMnL4IRy2+Zl6rYwasTagjiLkZlzaXgAmz/F8eI4y2I
 49/6qaDPUBYWGT/nTxT+Nh3CBMhnPmiDkotkg/2sTDxV7jOJsxd8QcjMBtSczRDSVNrv
 WyvFF9vm8oUFpzs4xTtMZFlZnW1vmb84LOjxO/5DMAONQTG4VxSmnak633EKAHS04/3r
 P1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690215042; x=1690819842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p4A7HnlNR4y+LiYMI6gxgLeOOWyF7e54galRz7wGSfw=;
 b=RgR5DyHYUZ0Am0D3/4cR7qzh7SSy8lBpzsgi+j3TbHoVTE6qaMRg0t2hrL7u2LdRCL
 Ex3UUlp6W11QhK37A1fHji20gSUGXkXSosqqN7vtHolIE3Cx+VrgSs++pFrDm+2HrPli
 imtfnrTfT2vYnxyGBA24iLSOJTGX3LDIedsi3rtKsP8/uWr/+AtcUDUs6G89JYrlAYG/
 2uBx6gl9WVZHw777yKRGGQGWOxi56BOdBKaGcLuY9gwaW3Cb8nUHdzHOxuM7BM7tLl6w
 MhtPtgeUUIRZRoAfjTpl1ZGq21EN8lDw4aexYSxhvj+J2jp6QcqX0sUXm7iEPeR1gvLO
 mdSw==
X-Gm-Message-State: ABy/qLbETNbM/m3aaRdS9UD8kccFeyyfEsyMu5/lCzRae209apmt/LuV
 AyB8bxUWPJSRlhgmx8oTMSJiibOZPR0XNjSuooJdtw==
X-Received: by 2002:a19:6450:0:b0:4f9:607a:6508 with SMTP id
 b16-20020a196450000000b004f9607a6508mr4434019lfj.50.1690215041844; Mon, 24
 Jul 2023 09:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230714232659.76434-1-chris@laplante.io>
 <20230714232659.76434-2-chris@laplante.io>
In-Reply-To: <20230714232659.76434-2-chris@laplante.io>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2023 17:10:30 +0100
Message-ID: <CAFEAcA9hqBqGWgVXVsxwxSAOUbW1_hsyEC2MqdF=rmPumtbaGw@mail.gmail.com>
Subject: Re: [PATCH 1/6] hw/gpio/nrf51: implement DETECT signal
To: Chris Laplante <chris@laplante.io>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: NVIXYvNZANh1

On Sat, 15 Jul 2023 at 00:27, Chris Laplante <chris@laplante.io> wrote:
>
> Implement nRF51 DETECT signal in the GPIO peripheral.
>
> The reference manual makes mention of a per-pin DETECT signal, but these
> are not exposed to the user. See https://devzone.nordicsemi.com/f/nordic-q-a/39858/gpio-per-pin-detect-signal-available
> for more information. Currently, I don't see a reason to model these.

I agree -- they seem to be internal to the GPIO module,
so we don't need to model them as qemu_irq lines.

> Signed-off-by: Chris Laplante <chris@laplante.io>
> ---
>  hw/arm/nrf51_soc.c           |  1 +
>  hw/gpio/nrf51_gpio.c         | 14 +++++++++++++-
>  include/hw/gpio/nrf51_gpio.h |  1 +
>  3 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index 34da0d62f0..7ae54e18be 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -150,6 +150,7 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
>
>      /* Pass all GPIOs to the SOC layer so they are available to the board */
>      qdev_pass_gpios(DEVICE(&s->gpio), dev_soc, NULL);
> +    qdev_pass_gpios(DEVICE(&s->gpio), dev_soc, "detect");

Is the DETECT line really exposed external to the SoC?
I had a look at the nRF51822 datasheet and it suggests not.
For purposes of supporting the wake-up-on-gpio functionality
we don't need to expose it to the board -- the SoC layer
can just wire it up to the POWER device. (In fact, exposing
it to the board makes it harder, because you can't connect
one qemu_irq to two places, so if we let the board connect
it somewhere then the SoC can't conveniently connect it
to the POWER device without doing extra work to split it.)

The logic for calculating DETECT looks good to me.

thanks
-- PMM
