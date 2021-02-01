Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3496877lfo;
        Mon, 1 Feb 2021 07:18:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwZwHUTHxpdYqm0hWUWW3BvR7mWrSCMsQdCO8JQA6m2m/vh/Rmx3vCbiyajIdCwjvEoF6O
X-Received: by 2002:a25:c901:: with SMTP id z1mr26273639ybf.497.1612192716409;
        Mon, 01 Feb 2021 07:18:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612192716; cv=none;
        d=google.com; s=arc-20160816;
        b=ubEFCj3e0PlfQoP33e/x0Dw3xQi9oLUnhA07hK3zV552WjaGESnh5ggLmR5Dcvk6sQ
         h+P6JnKH7fFn9M7u0soH3gvcdMO0jFo4sGXqS9C6oDkpmZ569SbVsPOSINJIkZwN5kTs
         WmEPLVNXgScpJAJNFGueePQXaMphrpJCsaG3rxwUSc9bnQ1jGTCH5IebpQxtc6FNCAIo
         3SHcjp9Rn/+LhkVzHSIqgt6gc/ChrLng+eCK/APG/Iyvjxf9XNYE8I6Xqc33x33p9p7y
         C/mdrn7h+y9H81Ygu0pYs5pDwX4gKYp7lmqZ5O4J+MiF/vIJyW2urU2jA5yM38LIqihr
         /s/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Alq5OZIl9+U/IHBWXNwlGw8gVM/UVyqiUZrelU07SI8=;
        b=sKwDzLgNJxjJKszZnkr+WCp7Ot5SNc2DXuwWZ0LEPO+uFpxgsNncVmkBw8Ob5vhZCO
         ByntFZv6c79TeTvKxHFOIYFIT0dUUrwym6RVlTSx8lF9PogaDRsiw2Jnqm8ODfH2X7QD
         2ID4hTPvFEy88jJlc2Da2HREqzdgEpuGsa9iygXzwW4zAchCgH6aiYdm8ueCbtsSqLgf
         rH/m6AluLrq1Te3JLspgR6rjo9n4ybZTmly0V7cpuipmcsb1c9bF83Aj8zucb07se+mI
         Y5XGfDMSBpgyuVSn2hAO24beHny0rW+p7orUQh5R2lID215c8LWHnAl7v8q8ncYEAVkg
         CY9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tjCHp5CJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 82si18183162ybc.487.2021.02.01.07.18.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Feb 2021 07:18:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tjCHp5CJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6ayJ-0008FT-P1
	for alex.bennee@linaro.org; Mon, 01 Feb 2021 10:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6awg-00077g-4w; Mon, 01 Feb 2021 10:16:54 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:42077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6awa-0001dF-Su; Mon, 01 Feb 2021 10:16:53 -0500
Received: by mail-io1-xd31.google.com with SMTP id u20so3606557iot.9;
 Mon, 01 Feb 2021 07:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Alq5OZIl9+U/IHBWXNwlGw8gVM/UVyqiUZrelU07SI8=;
 b=tjCHp5CJgJs+qaWIUR6Yy/iipMxmAAnsAlXcnvDUSd124Hq5O0D23xiyIWS3tFdhow
 EsEZvtl4M4p0rFgIHWOyZDdwS2oqVTjHiPQj/f3djxjwts4qRAB49N6c+DUq4y39CVLa
 5ha7J0xyTV/w0hyfVuaRCzZtzCKQvs+BUTcPnkb8HuRGcNn27ugCL16OiHYRvDUpfMGG
 D4koz2Nc01Ir9s+/0g67VgnZg80vqwIzQ0uHJOLV+Rz2yybM77pb9s3qmJlUzhHHgq7S
 /uYZ3gkexCFkovIUqscSRVQFXNxlJxMjVFClG1BSS/mo+qnCv/egRChhVJJPenUTTNOd
 JwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Alq5OZIl9+U/IHBWXNwlGw8gVM/UVyqiUZrelU07SI8=;
 b=aWyZDWQB/A4+KbbKm12G4f/+Gadr+Ot8HNOXrvv8fX9bONiWX087zRB2Wt/a6yPBJG
 DcMRfMYDQLGEfaZpT46Lq6pWVcl1hTdtLs2uDL/drKcZFKc4fQ17jblKYfo1dMvlOlHq
 7DchC9u3/PA9Ecd0+tHodxXD/t+rWHC1ij5EDwUntOPTKPK9PsCYa748/i+mZZpp5wvy
 XSZWez5rTNr6dizlteZZF99MRbbIhh4jPrIMpw1sMCP8we8L63DGrweamTAJth0sulUV
 EBXaFSWVdlRCknIIvrCvn1XVi/ICpIEGXH6sHAzBf0wyiY7z78lY2Ljiglc7C8k9WPAq
 /bKA==
X-Gm-Message-State: AOAM531KtuydPnCvO5HRI6g0vl28slksZ2KeaaJJAsWLqyGTwn24PMsz
 J/Otsb9DeBb1MyFPbTzhpA2bGJgtpYxwUMk5eOI=
X-Received: by 2002:a02:cbad:: with SMTP id v13mr14624551jap.26.1612192606136; 
 Mon, 01 Feb 2021 07:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20210131105918.228787-1-f4bug@amsat.org>
 <20210131105918.228787-2-f4bug@amsat.org>
In-Reply-To: <20210131105918.228787-2-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Feb 2021 07:16:19 -0800
Message-ID: <CAKmqyKPPSJtTfAPKEaXt5MVrbf5r2ZyidHhzDynmS5+e14LpJw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] hw/arm/stm32f405_soc: Add missing dependency on
 OR_IRQ
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rVrEfQ3YfOJu

On Sun, Jan 31, 2021 at 3:00 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> The STM32F405 SoC uses an OR gate on its ADC IRQs.
>
> Fixes: 529fc5fd3e1 ("hw/arm: Add the STM32F4xx SoC")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: alistair@alistair23.me
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 13cc42dcc84..a320a124855 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -336,6 +336,7 @@ config STM32F205_SOC
>  config STM32F405_SOC
>      bool
>      select ARM_V7M
> +    select OR_IRQ
>      select STM32F4XX_SYSCFG
>      select STM32F4XX_EXTI
>
> --
> 2.26.2
>
>
