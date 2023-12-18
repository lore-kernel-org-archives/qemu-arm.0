Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp674405eji;
        Mon, 18 Dec 2023 01:48:57 -0800 (PST)
X-Received: by 2002:a2e:86cb:0:b0:2cc:778a:274d with SMTP id n11-20020a2e86cb000000b002cc778a274dmr251610ljj.23.1702892937280;
        Mon, 18 Dec 2023 01:48:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702892937; cv=none;
        d=google.com; s=arc-20160816;
        b=NuwXnou9/3iuRKClUnvW8hg/StpHiCUgYjJhDxr3IWtsX2aDYvHwo0H3yIU+opTjoj
         IMuGLW9w+UUx6UqS12qMHMmPp042j9r/jOVbV+5KDQutrweC3ePHLC0cEHOLfylHOyIS
         /kcjKT+t4xWlawoXbMs6WFYyRutlvpDdspXXchTH9BV9vmFRUbuqoXDe0rI5U9m6OkSd
         ZiUoRbZlZgp8y3IMGzGAY7CxcmpAbxgZiqz5Fa2LBtvYuZcwIGNknlFvgygaBm2ZnM/B
         uoPpIOTQAHMNu0XeY1ROqMMP30/ndck+ESCLijuy0R3OKo9INOSzTBMN9IU6T4gYcONR
         OfCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/rzm0E835i0JWDe+HCQaZ1ik9yylUdADi+Oh0GkKdvQ=;
        fh=Vooc0W51SDTanS7KBfS3bbd23+a8MH2Kcqz8gmZrY70=;
        b=tawWRdvO8iHEml84mmwk1n67z3S/Tr7KRjuXtCNU/AufFekqTQzuIIADe3c6b3HL2n
         vZPvp8TM0l5FUrSYmYbR+YRrZLAk9u1tgAn91EPjeHERLbqD8ZQJzus/NYS/OjkOWmnX
         cE11yoOTrbqdRxnKMx6OLtwCqzWyz5pERQqPrlG1CENumT7I8tDHrXOclrD2fLNhGJ+E
         3UPHz5WDcdghzK7ufA2PGXOybF+EnoGGkV79zaWa1IGNRFZJZm6y674IAw9WGsC12g0j
         XFS8zPQzpAfgtKa6tKVTft+xLOTrm0BtKLBnr2yn3qpWk7oZhB6j/iUOXQoBhqj80rGE
         RMJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dtlkkZm5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a98-20020a509eeb000000b005531bf4821bsor528036edf.10.2023.12.18.01.48.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Dec 2023 01:48:57 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dtlkkZm5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702892937; x=1703497737; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rzm0E835i0JWDe+HCQaZ1ik9yylUdADi+Oh0GkKdvQ=;
        b=dtlkkZm5kqR9WW13SW0Azb9rDxYnjijDr4hH/E38coMm1iZNW1jL/NEYJzCHoWP/FA
         YsaQttyss/5diuvFGPm8IcoOWMb19S7mTXAZiZlDvWgcyqdRZunEe43qnp8ZPXnwZ5Km
         OskIlLy/apWBUK2bPP9YCTBPpfLcGHvDAvoD1jtqENE0+pGas+woApzYwrkaHWVfEjoP
         gN5ekeULChkK+N1DkJ33jhiwJl7YkQ+OoQX/7spH5Tw4VvUiFd0rM/TDSFzftEveqLO/
         5kFVzMJxbDCsNui6f5FU+7ogJGr7jwsjIPCVQ60JrFt2tsvJT6eeueR8q/M9uKTYFU8L
         PHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702892937; x=1703497737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rzm0E835i0JWDe+HCQaZ1ik9yylUdADi+Oh0GkKdvQ=;
        b=CreVHY93EohOWujOvqEFV/QySLKD4E7PyzRonDpisZUUBVrSjn6SrjoEAFZr0WLzpO
         KBqFe4hccyWIm/9GJhHMzjdgP6EWXwv+sWo7e2Y4UTOCOE1zeMXTmVJQ4pqiLMlrzs34
         A0JSE6PFN3CCtELz7U7Vq2ZkLEGvpn8hiAvYraHHSgyPxaboPOvPZpM1CUIdqBMm9RQJ
         ujpOM6Tgr7EjlKwpasnSb79WN2HWVovU4JAoCM0ub5Jxkh1O3uEh43vqUjPfyNEnsEBn
         j32+2a/F/h+3zkUpCDZtyRarcHXCW/SQlW2kQ5sozwBJGgDlpz+CPL2vwKLkzyqwc/+m
         4W9Q==
X-Gm-Message-State: AOJu0Yzz/06la0hT8VVaXpacRPpHLCN0ch8hiihE7rF9j8HrqfunO+xi
	lbEX002U7EXht5quLm77jpIt8EezNQ6WJpiK10Ffv1Ul
X-Google-Smtp-Source: AGHT+IFJWliWDFQ7yEBF2WnXbPX+wma1ojFtmH+69LkCl7i7E2SDJTpqLA8dyC5YRvmUNLgU5V6Mn5iJofSTZ0jJpcQ=
X-Received: by 2002:a50:ccdd:0:b0:553:5077:213c with SMTP id
 b29-20020a50ccdd000000b005535077213cmr583762edj.71.1702892936802; Mon, 18 Dec
 2023 01:48:56 -0800 (PST)
MIME-Version: 1.0
References: <20231214171447.44025-1-philmd@linaro.org> <CAFEAcA-Je+_tNCwiL_sQb-tDmCRJ2LWm5mAfuowtxbUBNEWQXQ@mail.gmail.com>
 <871qbkug24.fsf@pond.sub.org>
In-Reply-To: <871qbkug24.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 09:48:45 +0000
Message-ID: <CAFEAcA9vEvOeTseaC27hz9RKe13zs_2oPGjK-bLs8VL1wQF2jw@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/arm: Prefer arm_feature() over object_property_find()
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Rob Herring <robh@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 5XOigYoLM36W

On Mon, 18 Dec 2023 at 07:26, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 14 Dec 2023 at 17:14, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> QOM properties are added on the ARM vCPU object when a
> >> feature is present. Rather than checking the property
> >> is present, check the feature.
> >>
> >> Suggested-by: Markus Armbruster <armbru@redhat.com>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> ---
> >> RFC: If there is no objection on this patch, I can split
> >>      as a per-feature series if necessary.
> >>
> >> Based-on: <20231123143813.42632-1-philmd@linaro.org>
> >>   "hw: Simplify accesses to CPUState::'start-powered-off' property"
> >
> > I'm not a super-fan of board-level code looking inside
> > the QOM object with direct use of arm_feature() when
> > it doesn't have to. What's wrong with asking whether
> > the property exists before trying to set it?
>
> I'm not a fan of using QOM instead of the native C interface.
>
> The native C interface is CPUArmState method arm_feature().

But we don't in most of these cases really want to know "is this
a CPU with feature foo?". What we're asking is "does this
QOM property exist so it won't blow up if I set/get it?".

> Attempts to use it on anything but a CPUArmState * will be caught by the
> compiler.  object_property_find() will happily take any Object.
>
> Likewise, typos in its second argument will be caught by the compiler.
> object_property_find() will happily return NULL then.
>
>
> I also don't like adding QOM properties to instances.
> arm_cpu_post_init() seems to do that.  I feel it's best to stick to
> class properties whenever practical.

I agree, and the Arm CPU is a bit of an outlier in what it's
doing, for reasons that are largely I think historical. I'd
be happy to review patches that change these to class properties
where applicable, but I suspect that might be tricky...

thanks
-- PMM
