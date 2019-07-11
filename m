Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp810368wrv;
        Thu, 11 Jul 2019 07:39:10 -0700 (PDT)
X-Received: by 2002:a9d:1718:: with SMTP id i24mr3497865ota.269.1562855950383;
        Thu, 11 Jul 2019 07:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562855950; cv=none;
        d=google.com; s=arc-20160816;
        b=jhwCPFcIjO8mKGk0oMEJlPOP7hl5ujLd52piqaYFQAKF494Qj1ffL1xbYr10zHx7Jq
         MEUnaEwooMwvzkmo6K8j1wzfOY83NpYbLK9/0o4+0uLoQm2XJp9bqqfs7o+i8f1Ccune
         cofTCvKDWVL8fm/lz3XVpIjunSrdPKnd2Mj0CB3nRvJ0V99BpF98VcWzD/HYu0Tqi35T
         t9OI05f+uEQAvYAUyVs3tcjIO+G6IzffFuuxW1N7q7B0HSJEQD1VbHOyYqZ398QcQqIz
         JOD95aVnAkTpetvhtoKL2z3O4UTjsY3M8LAqcVXAgSTsFPlVO2YWVj19UzBwHzx/pv/9
         dulg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BYOEYw35xlqaw1o7LBjte74j1xHji7u5iShs1xXWefQ=;
        b=OpdYSf5HYA9ZTikxDPTlGjMSKdImHNwXZecKdtdNscP8ykGSlLFML/TrsHCkoyU2O4
         f8UL8Ivgqb3bGELYUL4EoltzEk5kbZt3C+Yvg/jgbVNhIQkkXEAMZxhrSsDZpa7srXoh
         yHvdvw+iCdYExHAgYYVzoDiJLi6uiOseszo60OXKGaVk376jLb3ROcD5IRoNnj+7TSLK
         nrwghywbQ2ScoOR8/vsORdFWmUYeWVU+OJBIKPG3Sj+2CfUt5EKecbHsqCJ/7LHC7bQv
         XRGaFGcZOzF6BGZBXvNwJb/oVDN1votGtzIi2uyTlg8PrCl0oWr5R4qt0RGlkRYmBdjw
         15ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EcaEfFB/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i4sor3056970ota.11.2019.07.11.07.39.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jul 2019 07:39:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EcaEfFB/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BYOEYw35xlqaw1o7LBjte74j1xHji7u5iShs1xXWefQ=;
        b=EcaEfFB/nfr8zMoxkiMotiFkTx/0yZ9hMoz+D6BIWKVNUqolvZcjtWmgyYbRvABupO
         Ow9HQN+zcVO+HnUJ87eC66k4e2c4xHVFDIWcENkBNq4bH/1t2HM9bS5aAIJh3V8TwVsB
         AJgPlAntPEgAsLfgntLhQdj6APa2Nw11IgQJI0KIzyIrWq7/nBy0kVGepllhx6JclH5r
         4YyxJOcw00++rJEQ7qjWHSuj3bQFKsk9aDzjLPCv6hpE0NlzObwvSaHNxbL39Wgex2OD
         xN3On5Qqd4TuuF42PKPj+hOlaN2ddggMmLX7pL1X5hlO3vLsf/RI5KmLNOzHolF4DiaK
         av2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BYOEYw35xlqaw1o7LBjte74j1xHji7u5iShs1xXWefQ=;
        b=fiAs3h9JfqWMGNe4WJdYivBeP3FylrM5ShlVvyyqt1LAVY8OV73Mr7KNZptPkXklvy
         XCcQX3IZiuHu8+ZW8xpP1a1WU293H0MxlFIlHOJxwihXbdHAsrHFugRV6rjBUQekfxue
         NhbInCmRETSeHRdQbrn5ZYNNush7rO86DZ2P4eaLacvMe9xzasebRFEf3MiksbijbCtO
         NrP53hsGp9zpb8KM9kD+OWPV/LrvDJX0b8Uhwy+kcM1TNtoLFM+Y7SGrpS9ImRfovSDJ
         TzXsS5FAJxi1aQWM0jdiODU9WdNvbbXsmmqsSs7KLzDB9/XTelG3bCmD00cFSJ+LphcI
         aCOg==
X-Gm-Message-State: APjAAAUCQfmXouFf8YVmVkAWzFavEybYyUmFCEOJLWmYB03V9Cs1bFXQ
	VYaHFsxPusaZfUUmnCy8eCKVsfA3tWdYI011DrgiANxL9xdM9Q==
X-Google-Smtp-Source: APXvYqyrmvsKMGyjQFlEAAp1a4kK3k+UUWb4MeuLqjsPCHK2f77Ir/fxoWCHXalGd9TIe1490sIeUE1ERHT3dFEb72M=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr3796751oti.91.1562855949933;
 Thu, 11 Jul 2019 07:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190711103737.10017-1-alex.bennee@linaro.org>
In-Reply-To: <20190711103737.10017-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jul 2019 15:38:58 +0100
Message-ID: <CAFEAcA-mJ5qcA-iS8BxfoVVMkAt13k11bYOT_eELw-WzcSEvRQ@mail.gmail.com>
Subject: Re: [PATCH v2 for 4.1] target/arm: report ARMv8-A FP support for
 AArch32 -cpu max
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	1836078@bugs.launchpad.net, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: oTHE162M9Mg0

On Thu, 11 Jul 2019 at 11:37, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> When we converted to using feature bits in 602f6e42cfbf we missed out
> the fact (dp && arm_dc_feature(s, ARM_FEATURE_V8)) was supported for
> -cpu max configurations. This caused a regression in the GCC test
> suite. Fix this by setting the appropriate bits in mvfr1.FPHP to
> report ARMv8-A with FP support (but not ARMv8.2-FP16).
>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1836078
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index e75a64a25a..ad164a773b 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2452,6 +2452,10 @@ static void arm_max_initfn(Object *obj)
>              t =3D FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
>              cpu->isar.id_isar6 =3D t;
>
> +            t =3D cpu->isar.mvfr1;
> +            t =3D FIELD_DP32(t, MVFR1, FPHP, 2);     /* v8.0 FP support =
*/
> +            cpu->isar.mvfr1 =3D t;
> +
>              t =3D cpu->isar.mvfr2;
>              t =3D FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
>              t =3D FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
> --
> 2.20.1



Applied to target-arm.next, thanks.

-- PMM
