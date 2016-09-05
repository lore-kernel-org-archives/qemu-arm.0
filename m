Received: by 10.25.87.130 with SMTP id l124csp165141lfb;
        Mon, 5 Sep 2016 08:06:51 -0700 (PDT)
X-Received: by 10.200.37.111 with SMTP id 44mr39852575qtn.17.1473088011755;
        Mon, 05 Sep 2016 08:06:51 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-ua0-x236.google.com (mail-ua0-x236.google.com. [2607:f8b0:400c:c08::236])
        by mx.google.com with ESMTPS id j202si12857734qke.255.2016.09.05.08.06.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Sep 2016 08:06:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c08::236 as permitted sender) client-ip=2607:f8b0:400c:c08::236;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c08::236 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-ua0-x236.google.com with SMTP id i32so232519389uai.2
        for <alex.bennee@linaro.org>; Mon, 05 Sep 2016 08:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=g+w+8lDIt0cqfZ8VpLmbizUX34f4XhYrb2Ui9ira0x0=;
        b=CBPXm1LvhBnkoyKlqkp4RcyYS/6fZ6Cld7J72psJ/gN60jUJqA7vMiMTGGlglZaQ67
         ZM6oThUg0+51UPbukowkhCXB7V+Z9xm8Zx4wJ+cUf5g84E6pNLbU7oAAOAAxtY5buJKC
         yccPNe5K4A2YQzJ9KX7ZRwB85/CNVc0x5snt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g+w+8lDIt0cqfZ8VpLmbizUX34f4XhYrb2Ui9ira0x0=;
        b=brppKNJjPHrWF1PT0qRGOMYvBet7qbfBXJXQW2cFNRENlf3hu9R+Feyjl12Ce70tBV
         o/vRscurEKnOhDGCKSlOB5zskt2VJRvBS0QBFJ7bfhHi1F5YcTq8+w+rGtPK0VJ+uRqm
         1mLO41/jZcEJdb6LZTnyj6HW5KMX6mKFxdOPQfw2GRGI9Ba8b99wRp1a1IC8bgXSRDFL
         jOpIL4QdhA2j0qF780QosxS2D/aSCsIVWpdn8DN2PHPGLTI1pCYvfJRkt6/vaoukAxgP
         FqcBbMgkEtm9vVXtdKwzkWFJQqUVIdAwLOTBhAvlunfyPWp2liFRLio8tfUZk9z8rmDM
         cwaQ==
X-Gm-Message-State: AE9vXwPam7AL/OB8zlxcYFV6MxEnKaOx1mUo/mWlnvOVTMcUiAJbcZ0oyzCPsfT5wKmdlByTLNbmsIFWMydVlkCBCZo=
X-Received: by 10.176.80.120 with SMTP id z53mr18026305uaz.38.1473088011177;
 Mon, 05 Sep 2016 08:06:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.131 with HTTP; Mon, 5 Sep 2016 08:06:30 -0700 (PDT)
In-Reply-To: <20160905140944.5379-1-alex.bennee@linaro.org>
References: <20160905140944.5379-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Sep 2016 16:06:30 +0100
Message-ID: <CAFEAcA-k0js=eZa4NkoAh5Gwz0cDAwDLWXG7NBzLAeYAT7QO5A@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/intc/arm_gic: handle Set-Active/Clear-Active registers
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "open list:ARM cores" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 58L5zL2xsk+3

On 5 September 2016 at 15:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> I noticed while testing with modern kernels and -d guest_errors warnings
> about invalid writes to the GIC. For GICv2 these registers certainly
> should work so I've implemented both. As the code is common between all
> the various GICs writes to GICD_ISACTIVERn is checked to ensure it is
> not a RO register for v1 GICs.

This is definitely a bug, and also the right way to fix it, so you
don't need to mark your patch 'RFC' :-)

Some minor review issues below.

> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  hw/intc/arm_gic.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index b30cc91..423a4ae 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -972,9 +972,38 @@ static void gic_dist_writeb(void *opaque, hwaddr off=
set,
>                  GIC_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
>              }
>          }
> +    } else if (offset < 0x380) {
> +        /* Interrupt Set-Active */
> +        irq =3D (offset - 0x300) * 8 + GIC_BASE_IRQ;
> +        if (irq >=3D s->num_irq || s->revision < 2)

Better to check "s->revision !=3D 2" -- we still have the NVIC
code tangled up with the GIC, and on the NVIC these are R/O.

> +            goto bad_reg;
> +
> +        for (i =3D 0; i < 8; i++) {
> +            if (s->security_extn && !attrs.secure &&
> +                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                continue; /* Ignore Non-secure access of Group0 IRQ */
> +            }
> +
> +            if (value & (1 << i)) {
> +                GIC_SET_ACTIVE(irq + i, 1 << cpu);

The mask parameter to GIC_SET_ACTIVE/GIC_CLEAR_ACTIVE should be
calculated like
                int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK=
;

-- compare the set-enable, clear-enable, etc write code.

I'm fairly sure that just setting the active bit (ie not also
trying to update the active-priority registers) is the correct
behaviour here, though the GIC spec is not clear to me on this point.

> +            }
> +        }
>      } else if (offset < 0x400) {
> -        /* Interrupt Active.  */
> -        goto bad_reg;
> +        /* Interrupt Clear-Active  */
> +        irq =3D (offset - 0x380) * 8 + GIC_BASE_IRQ;
> +        if (irq >=3D s->num_irq)
> +            goto bad_reg;

This is missing the check against s->revision.

> +
> +        for (i =3D 0; i < 8; i++) {
> +            if (s->security_extn && !attrs.secure &&
> +                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                continue; /* Ignore Non-secure access of Group0 IRQ */
> +            }
> +
> +            if (value & (1 << i)) {
> +                GIC_CLEAR_ACTIVE(irq + i, 1 << cpu);
> +            }
> +        }
>      } else if (offset < 0x800) {
>          /* Interrupt Priority.  */
>          irq =3D (offset - 0x400) + GIC_BASE_IRQ;
> --
> 2.9.3

It looks like we don't implement reads of clear-active correctly
either.

thanks
-- PMM
