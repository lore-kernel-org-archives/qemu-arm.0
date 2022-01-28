Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp265721lfk;
        Fri, 28 Jan 2022 02:52:02 -0800 (PST)
X-Received: by 2002:a05:6000:1c1c:: with SMTP id ba28mr6895033wrb.392.1643367122665;
        Fri, 28 Jan 2022 02:52:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643367122; cv=none;
        d=google.com; s=arc-20160816;
        b=eS4UuqijE9lAbwU+MFoyX/4KXg1GfjruafPrF1/vw5RHs+FJatvxeROwpgSwcYj1qE
         loEje8wdTr/FWBPrTY6xb97eWCv/Hcf1BTmJNs175T2jIgadjAwMxCBZQyzgO4aDla9C
         RrGbaKUhjpajfbJC4EmdLmR1Ep4QUrah2jFaWaQbOaY8Jb+0HVyjriDBV/+u6AHnVr5t
         57LlOR/rQDPpFBfYhn2TJMT5uTbZby6WrrXZO9QI3Al7zj90XNeKs4rs48XaNU0Uht5r
         OXuiq+mpEJopMqLr7RkmFQse4Sg3oNbOovvGynS1BV0AoOeiymLS14mnsemgqIjtFcn4
         0luA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cLjP2O4H615JGx2i+CeBkLHEIC2riVesbwrQ06Izni0=;
        b=AlgyAy2CvlQSm+qDUgGmHNXcSXK4tZuSKv1Bf8PlvovzXvTJ+oGGWiKOXrz08yjfWe
         E1rhpblRMBRhiRJJ9qYWShsbXfJPAvadsan9aGwXM57mdtpqxVKf76LQWDZL2DlRq0HR
         uAYRcOXxTn25W0Yd4N8ciB2TudiiwA1G+toa8aOgnmgwKqC/wunhDsX0dSpsW+BSJvz0
         uRZubd5txgYK8rc/3HxC4PwXsuSTdq3FgeHVtThvatQJ20Sn7nLxoB7iAJ2EwISqL6Wy
         d3TcMoF3HzHTQT0fVQqoVBsTL+PgooSjnMxEILYq4odNH8fVks/iEQl4JrHXvpIYvNMp
         lRZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HhaSobLk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g17sor15579131wrv.76.2022.01.28.02.52.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Jan 2022 02:52:02 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HhaSobLk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cLjP2O4H615JGx2i+CeBkLHEIC2riVesbwrQ06Izni0=;
        b=HhaSobLkvtPbNrHmLXXa09uFAHSv8tNwtpOCjEQdortK3+2yBcr+JyK5mBtPy37Nvw
         Zsou/OttqeDm+/ktK8fo7Prf5DVhDYmXb2pepo9mPXj8Q/6AFAKTpktBL2bkW7V7HSVn
         oyEB3ioWNXIr1WIC4TM8Y8rlL2xmFe9UxwRzw8m56FlyFD67uxSLrRAxWgN45Eo1vz7T
         sidAWX1NSmDYWxerl9Jt+XJwhZJQFCIg1D1ADQBX8j/oYEW+VdgYgnUPdHFR5UX6YOEE
         Vxc22j/M+cUL5EsrEKQ1Bkv/XUMd6jOosqdo5D3PDbwGmdA+hGhc/lyBRhH9ss5mrUXn
         mYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cLjP2O4H615JGx2i+CeBkLHEIC2riVesbwrQ06Izni0=;
        b=fpEX6IGL8q/3ubZdIs8KIrigrGSgFL9YYnMyZRFkiceeIh4vPPKn+DtU64riBoZfU7
         wENb3j+Z4NUtAyYGYtcLEEqPt0+aYhpY+2CssnwWQhyH6Wv0WPknE/JiUiyQvPI2bWq4
         y9oM8NMYeO5mzctq1UZ2XeN03gGqRV09G2u/0aF9NPEEZiKnSzbo9ALYSoZjbMEBGAKE
         JZ2cLycaECUbMtaoQbQWpnup11JYqICmof6+EGxj5Z17GacDw/pcbFRmmcZu4W6Xy1tW
         QICYtOIk1lgUMhcHwKTulzHfH+zp4jg70QjPwhT68d9wr+99eJW/mDEy6WGTeaJBatqA
         adVQ==
X-Gm-Message-State: AOAM531/vFrQxQSV7hgbBzJJswTB5+1l/Z4UUIMtSbu1a2zoNpqFmt2S
	3S6ZCgb71vpf3hQkhr0DWdGYsJ7IZonG4vP9eUrpImIN
X-Google-Smtp-Source: ABdhPJznf8XmZ55w4Oah5x7g1V3Kw8pjzlAA6aZ/L25vI7GzI3CO2aUbuUwmio1rlJ6knok6yx8w5cXihoH+FEYrq6c=
X-Received: by 2002:a05:6000:258:: with SMTP id m24mr6904812wrz.2.1643367122347;
 Fri, 28 Jan 2022 02:52:02 -0800 (PST)
MIME-Version: 1.0
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-3-peter.maydell@linaro.org> <908f211b-0882-cce4-2fa9-dd43ced4545d@linaro.org>
In-Reply-To: <908f211b-0882-cce4-2fa9-dd43ced4545d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 10:51:51 +0000
Message-ID: <CAFEAcA8Vy-_xb7fUw8eS5gaotGXxEFMFk=S0ZnPd_HcQ+-_vsg@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] hw/intc/arm_gicv3_its: Convert int ID check to
 num_intids convention
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Shashi Mallela <shashi.mallela@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: WO4y6Xuu0SEt

On Fri, 28 Jan 2022 at 01:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/12/22 04:10, Peter Maydell wrote:
> > The bounds check on the number of interrupt IDs is correct, but
> > doesn't match our convention; change the variable name, initialize it
> > to the 2^n value rather than (2^n)-1, and use >=3D instead of > in the
> > comparison.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > ---
> >   hw/intc/arm_gicv3_its.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index 6d11fa02040..5919b1a3b7f 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -338,7 +338,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_=
t value, uint32_t offset,
> >       uint32_t devid, eventid;
> >       uint32_t pIntid =3D 0;
> >       uint64_t num_eventids;
> > -    uint32_t max_Intid;
> > +    uint32_t num_intids;
>
> Does this now need to be uint64_t, like num_eventids?

No, because GICD_TYPER_IDBITS is 0xf, so num_intids is 2^16
and still fits in a 32-bit integer.

thanks
-- PMM
