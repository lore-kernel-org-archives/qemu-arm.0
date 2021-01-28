Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp232784lfo;
        Thu, 28 Jan 2021 05:44:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwM+OSPLVbRlTLFBlv//IaSUut71W/xTr8lcV+NkxuskBCHpXjGQdQj66yu4zOlCFqyeUVJ
X-Received: by 2002:a25:8112:: with SMTP id o18mr23284088ybk.208.1611841458636;
        Thu, 28 Jan 2021 05:44:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611841458; cv=none;
        d=google.com; s=arc-20160816;
        b=NZ6RusEihdybi9Lupz0gHV7TEvfhpTsbdERNf3BOQrLKp8bWJcl1zaD17U/T2Rh1IC
         FrkBGsj3JDGol0M6dwry+WDw7uMTOPjY9vZ6bcoh5BciPt2Id3MVAlaCwuxewXNegkhy
         W6BeK8ZmOudWpbd90/Klb+631LH5QKuR3qZQjQ84os48vMsUgLGJinVdro7T706+DFF9
         dHxaagmwUZeISuj3thJePXfrPm65KLoZvMiR5v7v2Gmpw+o1zaB6VLrXTtTp/7yT2hNt
         FSXhLB8XbSEwEnp9j0F8ZZ/jbtvALMDGcPJFkqcGZu4CjKIWIYeXe7IKB4pBMImgWC0V
         V9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=r7rNPgL1Ipu5c9ziAcfsbd0SJejsrIOuX3XIPzLBs+k=;
        b=r/keENPg7csjYBgT6YoYjXgs/gsF5ORpXRNswmIo6PGkytUxNIqLoENSmBNPXgzFO7
         koJFBNNSq0nXfmD4/hhg3QuBL7omQQgYLpiq8WMGImw1h2muTRhn5UCTzfsa3WvDZpQx
         Ha/1x5yeAQbIC6BKuLexdfBto/1gYKGjQpsqhO7NRDMi9qKmsuGI5Uta7ym9EvgSi18g
         fbo8Jj8iPlfT8sjGISp2qhNxRawohNflE+1+O4gjHk5TKDwYEhlH7mrrZcALewOBlauy
         YLP9UiNKhNgZcajRWK2U1CLHf/bwzExC4blz26KH0ZX1wE4evpcxICdUZzsG6eO7VUXF
         Nc3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="CN/2gl0v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si3279852ybo.344.2021.01.28.05.44.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 05:44:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="CN/2gl0v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l57as-0008Nt-2B
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 08:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57aM-0008N6-3Y
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 08:43:46 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:40775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57aG-00058M-W3
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 08:43:44 -0500
Received: by mail-ed1-x535.google.com with SMTP id a14so6655908edu.7
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 05:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r7rNPgL1Ipu5c9ziAcfsbd0SJejsrIOuX3XIPzLBs+k=;
 b=CN/2gl0vnv1W/ulWUI46Z+5w1rK8RznnK3v9SnHybhaC93viD/bSFaJKmyuuB5TIHx
 xZe5BnbRL616Pj0vwhksosiJ1P+d+n4P6GK+aHWHWTfx9Evt+/rLkiwZ7mrizUzKDwhn
 +hPFQGbFWNrFxtHKrCPx2aadYeCKe6UBNu95XkMn8ATTtHDKVOUO0T921oq5l0pKZrdK
 boNLdOiCYZRKW5e7Jq+SMkRxYFhC7Y4VL8lGrQ5PKQ+zpmUj42N/oov03VdyuCKeg86N
 pKFhxzStnRI7NbeqEDOnTfKT7maHi6Y11p13oKmVW1k/ApNT+URjwO3LB7H4AMTCGL6V
 yoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r7rNPgL1Ipu5c9ziAcfsbd0SJejsrIOuX3XIPzLBs+k=;
 b=Bh3nydepfNQxh0Qg2zpMggQCBmibpshaGejMKy78eUV8VY50o0prKHw7W92wEn8i9S
 OyPmj4J3EQ2NmbTvCrPlfNPHPPeQ70/x6YYo3LOMNVhbv2d9Rw9ZScCJNnzKjJzWjZRX
 SLjoiQ+ogQ+r6Nwst7WJJfbRxBbT8350EosB4nmblTBaZgOSM52vP3wdGU9jaXzmnEMW
 sHzi57uWGzftBQkltG+B9XpEkbhZkNoBiHTHIQbhQhh6I0NY/VGSlzhBjY/AcnkEdHuW
 s+CFYMxjfxqCaCOK6EOJih6ZXQdEA5PnW1N/DlThUqe8SeE66lKNCPeCI0rX6fh1FWm9
 e/KQ==
X-Gm-Message-State: AOAM530VIyhGJfZsY49t2ijiDiWi44i5CUTBlQlnbUcrys7vQcBOE95G
 CGDnzawb/KpP5DV/Dw8evoDp8UpXWtiWMVXa2BaJ9g==
X-Received: by 2002:a05:6402:b2f:: with SMTP id
 bo15mr14552012edb.146.1611841417952; 
 Thu, 28 Jan 2021 05:43:37 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 13:43:26 +0000
Message-ID: <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hy4D+DiR36KI

On Tue, 19 Jan 2021 at 13:40, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> When the block is disabled, all registers are reset with the
> exception of the ECSPI_CONREG. It is initialized to zero
> when the instance is created.
>
> Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
>      chapter 21.7.3: Control Register (ECSPIx_CONREG)

> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 8fb3c9b..c952a3d 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -231,12 +231,23 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>  static void imx_spi_reset(DeviceState *dev)
>  {
>      IMXSPIState *s =3D IMX_SPI(dev);
> +    int i;
>
>      DPRINTF("\n");
>
> -    memset(s->regs, 0, sizeof(s->regs));
> -
> -    s->regs[ECSPI_STATREG] =3D 0x00000003;
> +    for (i =3D 0; i < ARRAY_SIZE(s->regs); i++) {
> +        switch (i) {
> +        case ECSPI_CONREG:
> +            /* CONREG is not updated on reset */
> +            break;
> +        case ECSPI_STATREG:
> +            s->regs[i] =3D 0x00000003;
> +            break;
> +        default:
> +            s->regs[i] =3D 0;
> +            break;
> +        }
> +    }

This retains the CONREG register value for both:
 * 'soft' reset caused by write to device register to disable
   the block
   -- this is corrcet as per the datasheet quote
 * 'power on' reset via TYPE_DEVICE's reset method
   -- but in this case we should reset CONREG, because the Device
   reset method is like a complete device powercycle and should
   return the device state to what it was when QEMU was first
   started.

thanks
-- PMM
