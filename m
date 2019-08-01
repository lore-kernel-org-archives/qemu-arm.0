Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6969481wrv;
        Thu, 1 Aug 2019 06:36:21 -0700 (PDT)
X-Received: by 2002:aca:318c:: with SMTP id x134mr57606872oix.125.1564666581623;
        Thu, 01 Aug 2019 06:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564666581; cv=none;
        d=google.com; s=arc-20160816;
        b=09zJHvWxWvjGFXuZ4Y1HbCCwW/hih6R8E/yXMQpTZY6T/IhEZ5IPD5IH4+9HU0CSWe
         ed1gcn5OeFInCBtVVm1j1jatw9pGymgWqQkOw/rpsuF0mhLQCKWjfAv92eb3DswV7mFN
         qo0P5zAO4Hu4OtyJ+gSgsXts3FHoIAuDwoFrHyyDcdJ6N0TT/Xnv00mh5mQldphcIbRv
         wyX5kyqjuGrQpjBc6f21PizXUUnfs4oPko+KO0aSy8jN20FhTx/ImXgnGGO3Jv0doHrn
         mUJ9XXtYIRT+zRd2py4Xx/2QUhC77dJdNQI4KnsgnC6Dwxas4Q3W+hEfFBd3YUbZV2Wr
         Ce1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BH5EqTr/kV4VuIqOYRQmUrS+hUvcrPgyJv6kF1NH4ZA=;
        b=Kzcg+LHN2d3D7/C2wgj0C73hNqhpJwjrFPmBvwR3g2nwI3qq5e/MuUIbQT/FSdCc+/
         JEs1GHAjdNQ9/3JwxjpMhNUsFx5z9LCaXJg+/RIEd3vk4pXCPYKUKzyP6UFiqrE2eJ4C
         H//Wl0eIg3UxQHtzsZTn+FURwiqY6d4PKBibDKaR78+++/FZuSHAPBoGpQ7TRTJKaXp9
         XkjTULXm55lsLYYWEOlvnQpe2PWYjR20xPWqDKFWEJuB1O6U/DpVaaCyCPWhIURP54ts
         CteuYvTJ9M4ogNwRP86iwsNeNYfuUH1XDZZgy02tNJWo618DQtxNwEzEtlAAxn4GdtSb
         fb0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iV9MPvJ3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f131sor32781759oia.43.2019.08.01.06.36.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 Aug 2019 06:36:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iV9MPvJ3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BH5EqTr/kV4VuIqOYRQmUrS+hUvcrPgyJv6kF1NH4ZA=;
        b=iV9MPvJ3bjFwPZZDqSSI4TaYTfM4n7fwy+f1Ca32decRD3d+rMG+E2BMB9VVLekskJ
         Bo5GBNZOCxorHN6N/Z7wB3wGy8KivJ7oKo6JhOysENEjvUXOa79dflNgGAe57hXA/MJD
         o/QN7PD0RT3s4nb4NaLliS/mSy2tRzP/AK/r7DKVq0/Ai4NlNLMC4uIsv2TbNw/Od875
         xeU4pGAOk0xb/o0VEtzxtNRuQ4PCITDJVvzf19AdBsTgrA7kn5KlaLacdz4YSbcSHPM7
         jha1frFtQTm3SyHjsGV779AqAKdweCJGFlhqqprl5iI2kVxXUa8he/RiWnQpDJw06euo
         ImbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BH5EqTr/kV4VuIqOYRQmUrS+hUvcrPgyJv6kF1NH4ZA=;
        b=ZxOyPONi/tsSZ8hV8FwmTRRCwg9KzrlX1bgNY4LRmXfTnppoHz0StBI7Hd7DCr9qrK
         STlL1rKD4OhjrHNDUJKAYmE4TCbBql4JJbTi547XWHTWaZAQUpKkBlhdZVpPd0ifSCkG
         hH/5u2PfC/cFsFO3OjeyFKd76yPLuB/HIFCgW7ZnM74BwkxhTAD9mvrZ7jw8o3YFo9xJ
         E36cxrTCQVE6C6pu0sRDpbwLPD1o7c0dj339cvuNWjbmKOAMVOz98l9xTPfabnOMSlnD
         h/1ojV6vaoincTQ6seUhPieNHZqfQ8r/yaXGO8Hs/f3Sb3gvEGM0sKyONo236Kj1gF66
         p8nA==
X-Gm-Message-State: APjAAAWO3Tb+aQv7x3zTgwq3zH72AVR/9Tj65JcJqhrsceoQNeCGI5fG
	kHPRxbE1Q2sTgmUcRlu1KzfJGHubmXFHx8cA+nXDJgFE
X-Google-Smtp-Source: APXvYqyzakUrmyme8XBNd4/09ZOkL21zw+lBnH04TMaLWfFfLEc4DekJSV2fI/6KIHba6+OfEBaOS/WH6InO2CHrkTg=
X-Received: by 2002:aca:4bcc:: with SMTP id y195mr4477881oia.146.1564666581059;
 Thu, 01 Aug 2019 06:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190731160719.11396-1-alex.bennee@linaro.org>
 <20190731160719.11396-5-alex.bennee@linaro.org> <20190801132659.GJ5034@quinoa.localdomain>
In-Reply-To: <20190801132659.GJ5034@quinoa.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Aug 2019 14:36:10 +0100
Message-ID: <CAFEAcA8P-UnF-z9mM-TJkBLOsZXiiAciOsHz3zykLDiWRfcGFg@mail.gmail.com>
Subject: Re: [PATCH v4 04/54] target/arm: remove run time semihosting checks
To: Aaron Lindsay OS <aaron@os.amperecomputing.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "cota@braap.org" <cota@braap.org>, 
	"bobby.prani@gmail.com" <bobby.prani@gmail.com>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: JYU60Ylb7cDc

On Thu, 1 Aug 2019 at 14:27, Aaron Lindsay OS
<aaron@os.amperecomputing.com> wrote:
>
> On Jul 31 17:06, Alex Benn=C3=A9e wrote:

> > @@ -8371,11 +8315,13 @@ void arm_cpu_do_interrupt(CPUState *cs)
> >          return;
> >      }
> >
> > -    /* Semihosting semantics depend on the register width of the
> > -     * code that caused the exception, not the target exception level,
> > -     * so must be handled here.
> > +    /*
> > +     * Semihosting semantics depend on the register width of the code
> > +     * that caused the exception, not the target exception level, so
> > +     * must be handled here.
> >       */
> > -    if (check_for_semihosting(cs)) {
> > +    if (cs->exception_index =3D=3D EXCP_SEMIHOST) {
> > +        handle_semihosting(cs);
> >          return;
> >      }
>
> Previously, this code would never return here if CONFIG_TCG was not
> defined because check_for_semihosting() always returned false in that
> case. Is it now true that `cs->exception_index` will never hold a value
> of EXCP_SEMIHOST if CONFIG_TCG is not defined (or that it is otherwise
> correct to return here in that case where it wasn't previously)?

It's always true that cs->exception_index can't be EXCP_SEMIHOST
here if we're not using TCG, because the only way you can get into
this function other than by using TCG is the call in
kvm_arm_handle_debug(), which sets exception_index beforehand.
More generally, we only call this function in non-TCG if we're
trying to manually configure the CPU state to simulate a guest
exception entry, and that will always be done by setting up the
exception_index to the kind of exception we're simulating before
the call. EXCP_SEMIHOST isn't a real exception so that should never
happen (you could argue that we should assert, I suppose).

thanks
-- PMM
