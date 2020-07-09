Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1692755lfm;
        Thu, 9 Jul 2020 11:43:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxf4eKhZt4tEbptNtJSFEfOUSsEkh7o5Jf14cuAkAQ974mIN94OXl8IDEgmUF9ytUYhkPvA
X-Received: by 2002:a25:e708:: with SMTP id e8mr13287245ybh.137.1594320223365;
        Thu, 09 Jul 2020 11:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594320223; cv=none;
        d=google.com; s=arc-20160816;
        b=yzSop2qT4nE0WTHf5QCFB6YE0O0/U3tAuGdCR7IUDNrUq/+fbO8chL7CTO+s9FIqHj
         y+tpLX/F3OaofxOMicT7v1alShBNxBxEd16CMFx3hWB1pS5rb09C4fAeJYvIXk12V4sd
         Cb81TdazQaiEthp6EKcBsZiXFTwvPL0MLImS/VB4RhSz8BlLqXYhzh8nQmTxw4aiTX++
         uu67CBFTh1Lj5T0GUA/cxh2+M8ycCm6zIOzqRzBhw/yNylnBGwdoicTSfojyeOsA5rVn
         9UbOeiSl2RVYFEBrq4L53Z0J0uNiPhLUaLxSvNRmfKutK0tD1zLlLUTX9vjJuvcY0Mec
         Bkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=XLCJhvCmRGA/0A3mO5tinIdkZXp2MxZF5s0OuyMW6Gg=;
        b=ZMi6A1NpC5QclxpA0EYtb1dN+Ag9DSi/JyDCZbxWWo751m0oxhf1F+9IAyB+nw6XNw
         ViBgm3tN5EX++BeRrZiis1d8W7tVCxxyEENU1VwM+gdPwJ9cKW3ixLzmPFacTqkek0go
         7ZH4b1ukC+RfKWNQHd5dR/y6yw7ITn2CKIjrIH82rc/9EjIIzS02lHrkj8+C9GWiPmw2
         SPqxZ87pCGaJ7NiOKkJJ87A4a7EAuj5qMe4P0ZzVOBYyuPTBOACarra0U+jFc7KLGuNZ
         JyVx/JcHwVNGzRlltQVSW0w/KrY4DxMZ319oUUo/u1xrPNCqltjKRSSoZklFM5cj2nY/
         Wu+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GfgBrDY7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i192si3266332yba.341.2020.07.09.11.43.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 11:43:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GfgBrDY7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtbWI-0002zh-QR
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 14:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbWB-0002z3-4x
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 14:43:35 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbW7-0001Gg-BV
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 14:43:34 -0400
Received: by mail-ot1-x343.google.com with SMTP id c25so2401501otf.7
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2020 11:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XLCJhvCmRGA/0A3mO5tinIdkZXp2MxZF5s0OuyMW6Gg=;
 b=GfgBrDY7xJ5Z0WIAmSfTnBJDsvSAnsbBIvts2KgmX4fyTHFm3tEstfZ9O7SkZXc2lm
 dGt9VB4f6D+qpDLUf+czfOaLjcp6TAJKFzHBKwSCIQR7QgYdO7OovXp3d3XC8Pf6X+ze
 oR/McFSdnH3C1TdRA4jU+Bu0q/E8m7WDtz/6GT94nLsIEHZNCE2SwoQLw937Vinx7aMP
 RZXZuVZlsdI8h1GGeIWxNtkTIGMyyd2BxaWoyvlkjPlaaareeeWV1WlVkxlGHptGbVYp
 n7gYuEBXUcR3cLu7HbprHgk2U30bj25ZFqxukun9y9wdZVNdH69PaPBpNpn4phXO1j77
 ZQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XLCJhvCmRGA/0A3mO5tinIdkZXp2MxZF5s0OuyMW6Gg=;
 b=eV9ab9lRxmyutGJUPFgNQ6Xefn82dfR0UDueBasy+HfXFk2LntdRzOKWXd1CmyeLET
 Eh9+pbWeO/QVZmiG1vjQm38cU4pb7L98mvI3O463smok10vNURODV0BY57ZMXuntVD13
 0gUCYP/yHa8dWFB3IeEa7G+s8qnDXrlYlV+h9E3oyeR1GD+RChEXUz1kLYkij8Cl7I+1
 HDLeaFsDrTQHwqAAFwi6LErGsgVvxQsUz2Q+TZjI+WK9sK6c8/i3VieMx6Xql1rxQven
 /1SgEXbty1tmcqVs5u3Bo6m2qT4hmsVWT41wa83D1FpYR3VldrS3tHsTBSAutmkri+5X
 t3wA==
X-Gm-Message-State: AOAM533MUGJGbWSO7qVBP8kPT1an74W5Mh93c4tnh5drGsBCpNuivI3q
 DsAhybnAQCVhVUxEzoE3T4pVo2zWqumgm0f9mUeT/g==
X-Received: by 2002:a9d:7303:: with SMTP id e3mr47488751otk.221.1594320209958; 
 Thu, 09 Jul 2020 11:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200705213350.24725-1-f4bug@amsat.org>
 <20200705213350.24725-2-f4bug@amsat.org>
In-Reply-To: <20200705213350.24725-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2020 19:43:18 +0100
Message-ID: <CAFEAcA8=sJ6JsrPFyN14OjN1zPORvZDf+QLoShT0O+j6GgwDmQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/sd/pxa2xx_mmci: Do not create SD card within the
 SDHCI controller
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lEMwAGbu3CJF

On Sun, 5 Jul 2020 at 22:33, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> SDHCI controllers provide a SD Bus to plug SD cards, but don't
> come with SD card plugged in :) Let the machine/board object
> create and plug the SD cards when required.

This too is not an SDHCI controller.

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/arm/pxa.h |  3 +--
>  hw/arm/pxa2xx.c      | 39 +++++++++++++++++++++++++++++----------
>  hw/sd/pxa2xx_mmci.c  | 11 ++---------
>  3 files changed, 32 insertions(+), 21 deletions(-)
> @@ -2135,15 +2136,24 @@ PXA2xxState *pxa270_init(MemoryRegion *address_sp=
ace,
>
>      s->gpio =3D pxa2xx_gpio_init(0x40e00000, s->cpu, s->pic, 121);
>
> -    dinfo =3D drive_get(IF_SD, 0, 0);
> -    if (!dinfo && !qtest_enabled()) {
> -        warn_report("missing SecureDigital device");
> -    }
>      s->mmc =3D pxa2xx_mmci_init(address_space, 0x41100000,
> -                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
>                      qdev_get_gpio_in(s->pic, PXA2XX_PIC_MMC),
>                      qdev_get_gpio_in(s->dma, PXA2XX_RX_RQ_MMCI),
>                      qdev_get_gpio_in(s->dma, PXA2XX_TX_RQ_MMCI));
> +    dinfo =3D drive_get(IF_SD, 0, 0);
> +    if (dinfo) {
> +        DeviceState *carddev;
> +
> +        /* Create and plug in the sd card */
> +        carddev =3D qdev_new(TYPE_SD_CARD);
> +        qdev_prop_set_drive_err(carddev, "drive",
> +                                blk_by_legacy_dinfo(dinfo), &error_fatal=
);
> +        qdev_realize_and_unref(carddev, qdev_get_child_bus(DEVICE(s->mmc=
),
> +                                                           "sd-bus"),
> +                               &error_fatal);
> +    } else if (!qtest_enabled()) {
> +        warn_report("missing SecureDigital device");
> +    }

When we finally get round to qdevifying the PXA2xx this will
have to move up another layer, since pxa270_init() is
effectively the SoC, not the board model. But for the moment
this is as far as we can sensibly lift the code.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
