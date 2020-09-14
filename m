Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2276423lfq;
        Mon, 14 Sep 2020 06:44:27 -0700 (PDT)
X-Received: by 2002:a7b:c847:: with SMTP id c7mr15475808wml.149.1600091067559;
        Mon, 14 Sep 2020 06:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600091067; cv=none;
        d=google.com; s=arc-20160816;
        b=FWvdFUWUZ+zN5PWsjREffXkeVl1n+s5+U+yW5fdGqbanCXySJSy12zaTD0QW+27pWl
         Rq+eFUY9KIcistGfM14I7D4ktPZ3aNMMnd7NSpXPOq6AhNBzTXB1UmIqGIU7cNTtaDHe
         P/ARyIrZzrZlLuSIWRlwMHm56Uhi25AhZ71xOF65mrI7N4VMXu/dSVR2RPgBI/uZ8M36
         0tPxVyqYT0jfUk2VEaf/tO419tJBpchtVqvl4dLiLUbTj50xMoGSgzi5rEoX8del+4p2
         0mOR922Nkv1WLawY9yiM5fGJoGgo72yA3kvT5/PylvvA5PF+viPIZPSN+zMBc6CWX76X
         II2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9SiCAQeKUAzJKUQvyZCko1wEECMwt01LkprMPg7Sc4k=;
        b=KF9ZWI+fdGBFUbd/54mBy+EaC1k3bVJ4WuJN6JYOIHyVRjlAzR5+d7o7PG80NiG9xS
         k8e2LGjmKDnTKnYuYqMAkxBf7ageUZ5P/LY5aol6M26yc4EfQyhg/TtbOSUvy/axb56I
         OS8Nk9IuJUg0OF74n9OXO5XHl15D5YeFrTiGnbs+VMvJY/triBz4e/H/h4v//5+1rsQX
         vbJVHyfzVia5LENQRG0A/+4cvkcqgPFujjYTC47r/vgQ2MArrJRwhuWnkICUJqTr8v3P
         O6zSyBSbWZDpIv7ityjuEdx00sUkP3e8V4VXlvxpXrdw3EevfEjvZWxPJFv1CYG0QqzT
         gUGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m2GeFylF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o125sor1126283wme.0.2020.09.14.06.44.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 14 Sep 2020 06:44:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m2GeFylF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9SiCAQeKUAzJKUQvyZCko1wEECMwt01LkprMPg7Sc4k=;
        b=m2GeFylFmAc7t2sjuM3F3rOHTdaM9sTDeVFz4m59pVkoJ4IiGcEv8c/JzFgfOmeDig
         D9JPpeWT1eDmHbl+BoLuqW/xgMMM5FQAtrTwERrBWY8FxEP3RCXZDsB/S9vItLDovtDu
         h+OBL+XkbGgvL+yLKvQbjRgv2g6+TQc6aGlhnwtjfUX3yVsbcTX2stKU9nWgvRsbWk+7
         xbi6DxExmdKIIhNsgnEgE4ATFEUQUgc8clWLYjWKPtjNfkOmNPakgPwRIjw+wqtzE0RG
         R/mv+jtxIlrLB3KqX1eki+X3pv8UJLNAy6VclVgcRMWZ0t/zuICt3x22ISLx3lBivLei
         gLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9SiCAQeKUAzJKUQvyZCko1wEECMwt01LkprMPg7Sc4k=;
        b=sXHSlijoWtOd4aJUeMqjZzy+xncUlFBXwX3NoXtMrTpCmQZb571rQb8HNsyMbZ+3QE
         2V8wfH1TNAQUdTsYc4pAZmorMDKsb1/eMaLl2W6q9TNe1OQ8vqW9jm6oyA7FIeP9fLf3
         GlqJz21KqmcM90XYjCGI34qHZ+kNqM9s58+oWLDB3h4qRNE/Zw9e9vHkwZbpzQ3yi5rH
         aI1fpeeTLcWohgpMpf85jSUjpa/zSZ83somat/1jkwfK+/EdqyM++a89/tTcRXb0vS55
         nIz0B+1ibtTJcgZzQ5rDxWCj5uheHKcvh96P50LCfvzcQ9OSA78b2aDgjxfZfO1OyZ9e
         gs9A==
X-Gm-Message-State: AOAM531Z6KZ328EjF079GND6jOBzUXRbjF6nLVV24tybZVI3g/lhcC7N
	CDVe4i/ptH9CRuiB4ptN1aoaVZMO4la4LBIsM2EPmmaXWwApj7KH
X-Google-Smtp-Source: ABdhPJzvf5QnzZ2wOrVLTNrtuCKSCTsoA0V20T+8BYLZeOva69kWMQBG93/6ZDEsiAPiW1I04YG6EJKeDtw6FMdXnhA=
X-Received: by 2002:a17:906:24d6:: with SMTP id f22mr14364265ejb.85.1600091067074;
 Mon, 14 Sep 2020 06:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200901162046.32670-1-peter.maydell@linaro.org>
 <20200901162046.32670-2-peter.maydell@linaro.org> <87bli81nmc.fsf@linaro.org>
In-Reply-To: <87bli81nmc.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2020 14:44:15 +0100
Message-ID: <CAFEAcA9Y_hiLBW+Jy2Xg3rD6J6g02G0PwELmbH_9a0pHJ998cw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm.risu: Correct VLDR/VSTR U=0 patterns
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: rW2qdbF2NqE2

On Mon, 14 Sep 2020 at 14:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > Correct the VLDR and VSTR patterns, which claimed to be setting U=3D0
> > but in fact left it identical to the U=3D1 pattern due to a
> > cut-and-paste error.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Somehow the pre-generated test binaries I have from Alex have
> > U=3D0 insns in them -- I suspect this got fixed locally but never
> > made it upstream ?
>
> Hmm my current set of aarch32 test patterns have U=3D1 throughout. So if
> it did get fixed locally it also got lost.

I'm surprised you don't see test failures due to the memory
constraint not matching up with the encoding...

-- PMM
