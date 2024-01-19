Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp1064954ejg;
        Fri, 19 Jan 2024 08:54:34 -0800 (PST)
X-Received: by 2002:a05:651c:1c9:b0:2cd:fa80:111d with SMTP id d9-20020a05651c01c900b002cdfa80111dmr783347ljn.164.1705683274027;
        Fri, 19 Jan 2024 08:54:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705683274; cv=none;
        d=google.com; s=arc-20160816;
        b=teVlxEZeeE7srAexjHSnYI7fmzGckwU0iVPEf7iLFw04D8cCLib4MN5Y9LwFICWzt+
         rlESgx2oVXAkYVVOJy/TKqUuosv39OatdFxbsa3NFjo8Z5M5fd5mrQLHVLzcGKGFs5Af
         ZyiRL2hXKtNDypfnU8R50b7ipdpUC4k5UALJyCdytvKuUBrghBqxtdjNflp1aPMTt9zU
         yR40TGi/8Sf/SrbMqUQ7leMe2/glLLn3fYkNjijYTzobGH8C2XHektc2wpUrSYI2J0uw
         gKt27B03Kp68rzQ2NZaALw5Eh5fD3OVtiiN9oe3LP50I6ifLIv49p8e0M5RlhGo5xOo5
         WHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/VKo14nNjMspmI9IxH1AOTDwceC29Cl5/kWyMJjbH8c=;
        fh=TdHNMZ8OHJtpmGETXsguxom88UHQqP6xd+te8w86lwo=;
        b=YiszQmR6/3hDsFIenKnuLCE52mtz7CDIHk6p01xGvwXuNUEi6rr3j6Q6swJUosTkNj
         Rx9NnrqxpqVtCrlKyWCZL6FPxVVKgOeavdTzCgaV66WvTcu0l6dQV8VLJ+bSqzsEggun
         +gEJEnRCAbjWR1uAOm2h/Qc8rBDO77Zn7w+h80BlrtHVRoVKoDFsiYalRRUbRF5C13is
         zdRLy7r6M9xsK4Ks1PU/mwm0A65SVaKPYGfoX5Gm5Xxdyzi20BLUtTPnIYCuZIOByShZ
         6koj+Nh7qf1QLSlSIUh/H46F4ruSBbFWTOOJDBo4grVW7dcVAh5KQo+J1ynkXvqwf/s0
         xcgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CgIas8R2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d13-20020a2e890d000000b002ccb53cbb29sor3712994lji.15.2024.01.19.08.54.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jan 2024 08:54:34 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CgIas8R2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705683273; x=1706288073; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VKo14nNjMspmI9IxH1AOTDwceC29Cl5/kWyMJjbH8c=;
        b=CgIas8R2LeeB8BFK7niSnC3Jl/LzWv1lOWRRuE3CkK8rMULCkhplieOhqg57muCFi5
         DpwwZwdOqQX3Fw+D/eIpanVsIoi9WYPcTP6zXtqLI14FxqfQE6RDng/TTMahCFyzHxUu
         PdDgATjIEJh+jr4rVVTHt0h70lFSYUS+riAs99UJsLOaHNiMUPj+e/fpSq8JpeCgT4o4
         e4Gd3X15JAsV57sWXtBSUT/TD+B3QOx8cEfNjkE5+tyi5KfPU01wWdWAckmHprKZIJ4a
         B0rMmi5ABhuOmohkPmNMW1RZtJ2KdBlc99zQlKZZyc/22byNxAGjvvECgqwZ+uvMeugp
         sYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705683273; x=1706288073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VKo14nNjMspmI9IxH1AOTDwceC29Cl5/kWyMJjbH8c=;
        b=uBZ/qxZHu6jkmtgquyv/bT1KgE25ueOwxA1PxWn1aW9nVUJbd7cMPGd3msH8ZzUR+K
         BILrzrocxK4aYTYwzCX+9FvbF6cpPbILV++Gg9VSHIiklFHymmn1n+v3GsloER7meu4I
         33JGO4F9zmOcVEUlQuk9XxCFU7Fey1lGcH4V5gs9+PrGm8jGNzvEldF/btT1FV6gpIOr
         0umWrvvpy67HigANyG7qstR36/AupYEPfNbPsMwMlaI1tjdQzuDjxGmRb2pyqJV4TL7w
         irbdIYXM1gLqmPwlcKxqYnATtBM4WjSMReHXTGa5ox7SOtcu0ILOw2x6mmCnGvifaF22
         rGvw==
X-Gm-Message-State: AOJu0YyQUTL7HUVPFhRg1PILnSmrmwWdNPpN12wcc18Lj5by8phZczm5
	g2zva5LmagoBCD+jR5wD/K0X06llMoX1vVV2pPo6za56rZtToi1UpzzWEx8wDZQOJrHST69JFGM
	4+mq3NMGZPlMKxoVnFhsQ5MEn3S9XM0OVo15UcxQk
X-Google-Smtp-Source: AGHT+IGvz8NY58VpW6T/HJHz1w1NKNjuVqXvfmOcq2MDh5zSu5irvrW9dHZrZLKgCjbG/oSDjikg4Vs1E1NyJCJQ8Bc=
X-Received: by 2002:a2e:3e17:0:b0:2cd:2c9e:180 with SMTP id
 l23-20020a2e3e17000000b002cd2c9e0180mr779162lja.116.1705683273609; Fri, 19
 Jan 2024 08:54:33 -0800 (PST)
MIME-Version: 1.0
References: <20240110195329.3995-1-philmd@linaro.org> <CAFEAcA9c58iVvgW4wnNT1H3tzsdYbxyU-kT7bJP=A3E+B-t7PA@mail.gmail.com>
 <7a73231a-d7ae-4abe-9bca-e8e295a5f70d@linaro.org> <CAFEAcA-wV-1njkAhjV1kjp1NW8RVjZLNjJMThrcuhjakNT3TTg@mail.gmail.com>
In-Reply-To: <CAFEAcA-wV-1njkAhjV1kjp1NW8RVjZLNjJMThrcuhjakNT3TTg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jan 2024 16:54:22 +0000
Message-ID: <CAFEAcA_1egxsS=N_L_BtVvRTNZNC9uBYUNH34UUa3KaO9nPehQ@mail.gmail.com>
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
X-TUID: sF3c9lnVhy1z

On Tue, 16 Jan 2024 at 16:43, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Tue, 16 Jan 2024 at 16:20, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
> >
> > On 13/1/24 14:36, Peter Maydell wrote:
> > > On Wed, 10 Jan 2024 at 19:53, Philippe Mathieu-Daud=C3=A9 <philmd@lin=
aro.org> wrote:
> > >>
> > >> Since v2 [2]:
> > >> - Dropped "Simplify checking A64_MTE bit in FEATURE_ID register"
> > >> - Correct object_property_get_bool() uses
> > >> - Update ARM_FEATURE_AARCH64 && aa64_mte
> > >>
> > >> Since RFC [1]:
> > >> - Split one patch per feature
> > >> - Addressed Peter's review comments
> > >>
> > >> [1] https://lore.kernel.org/qemu-devel/20231214171447.44025-1-philmd=
@linaro.org/
> > >> [2] https://lore.kernel.org/qemu-devel/20240109180930.90793-1-philmd=
@linaro.org/
> > >>
> > >> Based-on: <20231123143813.42632-1-philmd@linaro.org>
> > >>    "hw: Simplify accesses to CPUState::'start-powered-off' property"
> > >>
> > >> Philippe Mathieu-Daud=C3=A9 (14):
> > >>    hw/arm/armv7m: Introduce cpudev variable in armv7m_realize()
> > >>    hw/arm/armv7m: Ensure requested CPU type implements ARM_FEATURE_M
> > >>    hw/arm/armv7m: Move code setting 'start-powered-off' property aro=
und
> > >>    hw/arm/armv7m: Always set 'init-nsvtor' property for Cortex-M CPU=
s
> >
> >
> > > The first part of this is fine and reasonable cleanup, but I
> > > continue to disagree about the later parts. What we want to do is
> > > "if this property is present, then set it", and that's what we do.
> > > Conversion to "if <some condition we know that the CPU is using to
> > > decide whether to define the property> then set it" is duplicating
> > > the condition logic in two places and opening the door for bugs
> > > where we change the condition in one place and not in the other.
> > > Where the <some condition> is a simple "feature X is set" it doesn't
> > > look too bad, but where it gets more complex it makes it IMHO more
> > > obvious that this is a bad idea, for example with:
> > >
> > > -        if (object_property_find(cpuobj, "reset-cbar")) {
> > > +        if (arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
> > > +            arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO)) {
> >
> > For that we could add helpers such
> >
> >    static inline bool arm_feature_cbar(CPUState *cpu) {
> >      return arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
> >             arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> >    }
> >
> > and use it in the target/ code where we register the property
> > and in the hw/ code where we set it.
>
> Well, we could, but why? The question we're trying to
> answer is "can we set this property?" and the simplest
> and most logical way to test that is "does the object
> have the property?". I really don't understand why we
> would want to change the code at all.
>
> > Do you mind taking the cleanup patches (1-4) meanwhile?
>
> Yes, I can take patches 1-4.

Hmm, this doesn't apply cleanly (probably due to the dependency
noted in the Based-on tag). Can you resend the relevant patches
in a form where they'll apply, or ping me once the dependency has
gone upstream), please?

thanks
-- PMM
