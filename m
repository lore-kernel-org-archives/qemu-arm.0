Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp993456ejf;
        Tue, 16 Jan 2024 08:43:59 -0800 (PST)
X-Received: by 2002:a19:4f53:0:b0:50e:b3dc:3ea5 with SMTP id a19-20020a194f53000000b0050eb3dc3ea5mr3057706lfk.66.1705423439246;
        Tue, 16 Jan 2024 08:43:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705423439; cv=none;
        d=google.com; s=arc-20160816;
        b=ZtXfz5GIz2Ku7Z+MqH9E14I2dTw/7mU8z47LO+/u/qENDRrszMtnYCMNPeWsTfo5hu
         pB5iUrECc9vZbhfx9GoPU+Ym21XM1D1ACSrMu17HYrhGonWs/LYPW/RINo+M9Uzw60RA
         YYhJuhEbuImE66vMdl1g/gkM4SZzZov8CL97BUo+Zg+hi+1IUGyLPPIXDuKB9Rv+YMxf
         Jg2aI2EVoE91IKz/MMbsk9F54G2dL3FP+g988Se5uRgOVs1hAWxxYIG/UvMV64ONoizj
         Hg7n7o9AlH5MpBPziCc2MC8eSst6ehKNPXpQWHC1ARinBof4QsOGBoGGNHx7tZtUaN41
         1moA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bEWHIsOs0K0h8LuxnFBVrPkY6pIftjFFe53K4qEN0iw=;
        fh=TdHNMZ8OHJtpmGETXsguxom88UHQqP6xd+te8w86lwo=;
        b=bQOsYUlHKiQuHAt3YsYUZFbhdxcq/7/p7RB7URe4Iehmb+tLhInEEAoNscEHLIagnb
         kVe2sz6UKfPL6I8K9O69gRf+aNYv1CYMfucTkW0cv2Pcw9bHZOBXzzqY+IzEnK0Bxf6K
         io5CMEXzbBBOw8wlJVnBAGKvbR6jIDPIVmuLC1bd7Pw++SkYixbZdWQNppLQUyTYPbXz
         a/AijsKwHS1ePkm0ek1d/y3rU0EbIeCQ79yOs531kIlVmZd95+sU83Zhw4Tdg78jWitV
         nfGV5Af9tw+31l9vwN3Z7ky/zIIaQC8RK7Er6IMtkEyAd6Cc7uzXCj+V+Keqsu+5dO6G
         Xeew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B/lBoWH+";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x15-20020a05640226cf00b00558f7ccf921sor527617edd.10.2024.01.16.08.43.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Jan 2024 08:43:59 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B/lBoWH+";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705423439; x=1706028239; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEWHIsOs0K0h8LuxnFBVrPkY6pIftjFFe53K4qEN0iw=;
        b=B/lBoWH+YuLXhEFNxNP0G/VmTec14fMLbhuOFnpilKuY1YaANL6f8lvK+EhmxEdRjk
         zQyqciFyHHvhhkqIbu425Gs/Lcn81V6FBUUDfxAIsC6HdEGuJgVJGMBWXD44/t+F6v4o
         sAAUmtRtlIkFvr2U//qST7SOlKrkWqBsSjgShtbK7eefnWGy8y05NaOIeIA/XH4YP9Xg
         OZcEcsT9yENEPWPPhwpFxDzqBrrAf3DEmXM+GXHonlKobEwMru0fABND4HUepHi5xKUA
         2JHSisjAQMol7VWvQv73IHZRoYG8EX/0LltyBXvvgFfadYnRfyQCxUJDsIP4cErzoCfg
         ERQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705423439; x=1706028239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEWHIsOs0K0h8LuxnFBVrPkY6pIftjFFe53K4qEN0iw=;
        b=YeVrNziDAghb/6WzDfizGteoXhqC7l7Pv2siFUizxQ70J2rpT2OciM8NQOErSNN0jJ
         BflJh0BAAG0xYrno2ylvVZsN/Mp0EnEJbiQdmjlyVCXvCFaSLtpZGPBeLrfQmhDkoZjG
         hRctCtoR73Ie+8UOTCOfpo0OeJmYGnDlf+AHqeUY7YeVn2nIi/Df3qCMThkeunS/MiKX
         4AXbq4WKr4FOBlIIcdFnJfg2LQ0lCtBDzAEtZuHbTf+cqEAnf4VSmQvSP+9u2s8EcLob
         nTXkBg31BQEDb6Cb3AnQQ0ROyfAnOkaFde3P14sg5heUmz74h77emDILIjg+Ll37i/No
         IEcg==
X-Gm-Message-State: AOJu0YxICDxmPPUMTkGJCTVqRmqp2al29NHebad7yKlTm7Ytp8J6BQJ3
	oCxcj2kD8ui7lV89grYi/yu73j3cT+9OR+ogKL+rqeTPPqJ5kgdv
X-Google-Smtp-Source: AGHT+IGFGl2T4WvnJZo/NVA65E62ccTpzGnsuE654Uns4u39ylX8RacuPRkheZC66bJjd/FjPNegpkNTAxWI2X2eLzM=
X-Received: by 2002:a05:6402:17cf:b0:559:c8e6:9d71 with SMTP id
 s15-20020a05640217cf00b00559c8e69d71mr61950edy.27.1705423438827; Tue, 16 Jan
 2024 08:43:58 -0800 (PST)
MIME-Version: 1.0
References: <20240110195329.3995-1-philmd@linaro.org> <CAFEAcA9c58iVvgW4wnNT1H3tzsdYbxyU-kT7bJP=A3E+B-t7PA@mail.gmail.com>
 <7a73231a-d7ae-4abe-9bca-e8e295a5f70d@linaro.org>
In-Reply-To: <7a73231a-d7ae-4abe-9bca-e8e295a5f70d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jan 2024 16:43:47 +0000
Message-ID: <CAFEAcA-wV-1njkAhjV1kjp1NW8RVjZLNjJMThrcuhjakNT3TTg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] hw/arm: Prefer arm_feature() over object_property_find()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	qemu-arm@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Radoslaw Biernacki <rad@semihalf.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Rob Herring <robh@kernel.org>, 
	Markus Armbruster <armbru@redhat.com>, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 5pIQm2zxfDDC

On Tue, 16 Jan 2024 at 16:20, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 13/1/24 14:36, Peter Maydell wrote:
> > On Wed, 10 Jan 2024 at 19:53, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> Since v2 [2]:
> >> - Dropped "Simplify checking A64_MTE bit in FEATURE_ID register"
> >> - Correct object_property_get_bool() uses
> >> - Update ARM_FEATURE_AARCH64 && aa64_mte
> >>
> >> Since RFC [1]:
> >> - Split one patch per feature
> >> - Addressed Peter's review comments
> >>
> >> [1] https://lore.kernel.org/qemu-devel/20231214171447.44025-1-philmd@l=
inaro.org/
> >> [2] https://lore.kernel.org/qemu-devel/20240109180930.90793-1-philmd@l=
inaro.org/
> >>
> >> Based-on: <20231123143813.42632-1-philmd@linaro.org>
> >>    "hw: Simplify accesses to CPUState::'start-powered-off' property"
> >>
> >> Philippe Mathieu-Daud=C3=A9 (14):
> >>    hw/arm/armv7m: Introduce cpudev variable in armv7m_realize()
> >>    hw/arm/armv7m: Ensure requested CPU type implements ARM_FEATURE_M
> >>    hw/arm/armv7m: Move code setting 'start-powered-off' property aroun=
d
> >>    hw/arm/armv7m: Always set 'init-nsvtor' property for Cortex-M CPUs
>
>
> > The first part of this is fine and reasonable cleanup, but I
> > continue to disagree about the later parts. What we want to do is
> > "if this property is present, then set it", and that's what we do.
> > Conversion to "if <some condition we know that the CPU is using to
> > decide whether to define the property> then set it" is duplicating
> > the condition logic in two places and opening the door for bugs
> > where we change the condition in one place and not in the other.
> > Where the <some condition> is a simple "feature X is set" it doesn't
> > look too bad, but where it gets more complex it makes it IMHO more
> > obvious that this is a bad idea, for example with:
> >
> > -        if (object_property_find(cpuobj, "reset-cbar")) {
> > +        if (arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
> > +            arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO)) {
>
> For that we could add helpers such
>
>    static inline bool arm_feature_cbar(CPUState *cpu) {
>      return arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
>             arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>    }
>
> and use it in the target/ code where we register the property
> and in the hw/ code where we set it.

Well, we could, but why? The question we're trying to
answer is "can we set this property?" and the simplest
and most logical way to test that is "does the object
have the property?". I really don't understand why we
would want to change the code at all.

> Do you mind taking the cleanup patches (1-4) meanwhile?

Yes, I can take patches 1-4.

thanks
-- PMM
