Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7492013wrq;
        Thu, 28 Jun 2018 07:25:22 -0700 (PDT)
X-Received: by 2002:aca:b504:: with SMTP id e4-v6mr5598816oif.93.1530195922455;
        Thu, 28 Jun 2018 07:25:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530195922; cv=none;
        d=google.com; s=arc-20160816;
        b=gLs8AWCf/wu7T1YlVk83kkyOX4rnAotfSWCVA8H6S0MX9j0OGPc1GdFRpt6svq9SQu
         3n4ygV8R5hR7+cJ1BDSNmCHttab3ECkw1AfkSB19AqgLtuCiG/BU8nCZVicd0uvs5qgz
         cfkI0coHpaP9ptPz51rz+eoCKaOuPUpiMYIAWnrCDCcIm97deI6yOGVel+pK8kxAuWgw
         VBMZeNGLROxStLfa+6wZ6Yvsub//t2CaxW3z/HsaP7eGd62YGFskB70nH4Vsldf6SB4u
         Kk/LenmhvDKYWk+9s3bAhmiOXDP4+AhHMTaNyk23KGvfWCfRDYkP3lmQnFZ62EzHiJoC
         BjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=DsSKNZrC6GlHD0sQ6S2qYz16mBoCrlGl3kBwFCBCGsQ=;
        b=N+chMlnJpdY9v+m0ciWfxF3ypwYLAN2B8goTg1gEpt7e1z3prgW7yPfOs2A2dYVT2P
         JLWiDLdBQDZ4kcLAtyWO2XDUIspTnIN8LXFdlMQESnYlQlWVe/LCK2Hr9Phf/2T8TmfA
         lv54krBWy3EQhSNWOWiQQnITqXJvRKwyVsFhy6VMzjTf9PhxL6AQnODzwMuwhdckR+zs
         vj8WD1DHT1OSByOomn5ZzHgZZu37pVwL7ikIHcO9bvWvsNjw4HoZ+mClnPu21/E2m5pP
         wbrR/Yjz8Ie4DVwwH/dU1Br2bt8pz1XvF/ng/fSwHJ0tmUZrK82YmXJfcqfY9aGS7GJt
         46Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VTXoKnMg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s143-v6sor2615421oih.51.2018.06.28.07.25.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Jun 2018 07:25:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VTXoKnMg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DsSKNZrC6GlHD0sQ6S2qYz16mBoCrlGl3kBwFCBCGsQ=;
        b=VTXoKnMgrK2KLllYrKPGKNZLywJBTOU3UVlWmviq/pbYM+Lh1YCsa97lq6c5fjKUpg
         YDBxEkHNRuuxBfje1wR+1DpLeVstDvGcUyoS+ZG+sj3tTVm55CQtJr7EDAYYUQfIBkw+
         QljtkeAiNZ+HwD6JxH1vwd+AKHXRpcbHhpM0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DsSKNZrC6GlHD0sQ6S2qYz16mBoCrlGl3kBwFCBCGsQ=;
        b=TupJu4QJ/GMqJipxdK3azShu5kJ00S58TZWF1QOyxugUojdzlnbW4rFyS2q4GUtey8
         BV/Znfzmx8fP3q3QzBq9YY7I/oHnR6kcE2jCsI4EGm5yOBmSzKqOLSy01suz5czfR2Ja
         shDnZlwLEIyUJcgs/9m96WAZZOACltIwmXd6skIiV+QPxrMPaLEteVJ3yhvOhcW2mUCa
         7pFz6fnoPF6/knKwTS9karwnTze1w5RRxNN2MHaSPo0chImtsGnf9CsaWXqat49mu7Yx
         F97+LCf03C9SLW3NLTf15HwnyispxSHxd1rgC7UoMogh/190I3Iwf3q/X4IvTsciWy2c
         xL+A==
X-Gm-Message-State: APt69E0DVFHo/PouvLQfdp3vxOOgCzKCm1NwSndlR7x4RjCWwSImnelN
	P+iLjbE3pHGlEJwb1/EMd6HrWjuAMLnElOsTmz12ghh7Uw4=
X-Google-Smtp-Source: AAOMgpeo8xO+RHyzGa4dgGchRNJq6v0pe4WjM5z9h1YGKbpf+GAR2yeFLPffdcVGTQsg8z5ZMRC6wPMliCwaC8PAHDM=
X-Received: by 2002:aca:7247:: with SMTP id p68-v6mr5465338oic.252.1530195921973;
 Thu, 28 Jun 2018 07:25:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP; Thu, 28 Jun 2018 07:25:01 -0700 (PDT)
In-Reply-To: <20180625160009.17437-3-alex.bennee@linaro.org>
References: <20180625160009.17437-1-alex.bennee@linaro.org> <20180625160009.17437-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 15:25:01 +0100
Message-ID: <CAFEAcA8JHHp2oVvUqX0oGhc+R7u1PNCWW1Q052ujpTx9WbVNDw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] target/arm: relax permission checks for
 HWCAP_CPUID registers
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 6b/zaBgK20kQ

On 25 June 2018 at 17:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Although technically not visible to userspace the kernel does make
> them visible via trap and emulate. For user mode we can provide the
> value directly but we need to relax our permission checks to do this.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/helper.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6e6b1762e8..9d81feb124 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5813,7 +5813,19 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu=
,
>      if (r->state !=3D ARM_CP_STATE_AA32) {
>          int mask =3D 0;
>          switch (r->opc1) {
> -        case 0: case 1: case 2:
> +        case 0:
> +#ifdef CONFIG_USER_ONLY
> +            /* Some AArch64 CPU ID/feature are exported to userspace
> +             * by the kernel (see HWCAP_CPUID) */
> +            if (r->opc0 =3D=3D 3 && r->crn =3D=3D 0 &&
> +                (r->crm =3D=3D 0 ||
> +                 (r->crm >=3D 4 && r->crm <=3D 7))) {
> +                mask =3D PL0_R;
> +                break;
> +            }
> +#endif
> +            /* fall-through */
> +        case 1: case 2:
>              /* min_EL EL1 */
>              mask =3D PL1_RW;
>              break;

This looks like a rather inelegant place to shove a CONFIG_USER_ONLY
special case. Isn't there a cleaner way to do whatever this is trying
to achieve?

thanks
-- PMM
