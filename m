Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2962231ejs;
        Sat, 13 Jan 2024 05:37:26 -0800 (PST)
X-Received: by 2002:a05:6402:510d:b0:558:c044:e860 with SMTP id m13-20020a056402510d00b00558c044e860mr1912107edd.69.1705153046295;
        Sat, 13 Jan 2024 05:37:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705153046; cv=none;
        d=google.com; s=arc-20160816;
        b=Mm4eASosvZhwsVuWDOqjY5O5VM8tb8J4/BnqKYeW7AGfm/BvJIC1KTQwbrHNT0F57V
         sQHO/xYdyULYrcpNQnf3mdWqietj/HeU21Pncj3W8jd7kbX26hSX0oqFvs39U+q5N6ww
         PqBzDArFAsvdtWh6gWEHXxLgEzPdH2hyOrLiVuleF/B2f7gmcR7JDVqCYyQ17tCZS4jF
         CeSR3XPvPUqfmPb5lYT7eMUGTvEe51j2VnhPMA71mzesN95U1JIepG74SWkgmeP410IS
         jk/ZT9kWxgkAHlB1sza1emQyu+0tofhx5yv4emNqKhO7W86V+ZGVCdjQ3HfAPLoCpIyM
         xX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+rz24OMvi/V2SXbGCS1IxK9DxcCEEIjiEZAyA2+zzZc=;
        fh=TdHNMZ8OHJtpmGETXsguxom88UHQqP6xd+te8w86lwo=;
        b=xtb6NVq2/Bw4W7yVCnqSfJGZSUHuh1WLrCOX6+zfoR/wWrO7WvXocXnTQo2aI5Ru9d
         S1kL4xQ+MSc5vL9H/P37wxijFfxneLd4AU25MUFxYZdxFyCV3X/e39WdvKlzvOT6dygh
         WKBCuY4ZXGtm1xZB/418Zj0mHn8gAD9lK5tdkcKvIPycxyWe2cKSR5xy/uZkim1tR0FM
         P8GX1n/nWO+LAWMSpy6fBOpf1v7PBE0pAZZvommJmkGsjKMK4is721EHiibXRS/UBBMy
         +4souJgdCwzokF/IhXM+sBp6AWavTlOWUVT5+JMzJ/YUsp+IvUdVkJytqlAaBg8Y5TCj
         3WQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EfGNpItu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s28-20020a05640217dc00b0055881087bb1sor544089edy.11.2024.01.13.05.37.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 13 Jan 2024 05:37:26 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EfGNpItu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705153046; x=1705757846; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rz24OMvi/V2SXbGCS1IxK9DxcCEEIjiEZAyA2+zzZc=;
        b=EfGNpItuHUJoT1oHE87IbkDTYQcww0AKnoQfSB5s44xEw+ilfIDsV8IqF96rbM+9s1
         ZWdmOYZNH0rEKE4vpV8yMpSTbMmmIkm6Gr1EggGjwp3DG7w+MXvakhvGFHU6mKFgnnon
         zcuUEycMTM8Tk0F3J8Xs15Dj3QqNdN/7b7GWX0zTIDtUakKXHB0z8PDK433u2Srp/zHN
         c/BLv6O4ygS9vy8Uriiq6VBnN0+n1zZEvCvXNxGXalKWRfiPP7Ef1mLuJlXcbAmD/pad
         trxQxj3Kl8kPd4KOOBTNX2/Ra3/9ELdMocLLTRUmuNvj+xJSGZFWD09JGMdSUTFScM+p
         /bCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705153046; x=1705757846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rz24OMvi/V2SXbGCS1IxK9DxcCEEIjiEZAyA2+zzZc=;
        b=TB5hs5Loz1BcsUV2gwXotZ00So7XxxC7w8GJ2JHsWhH3OensfmCREZgVIMzdTH6dN3
         wNWdgyLj4UDfvlaT3dHY9HAEHUzH5cXAl2GQJSA5hQdNqOj5G+8jNH0jiLIK+Wqb5BHu
         s1AuW3pqVAqj8mrK4MEHsTR7JZgXMnHL9M6pXfOS3RI1dRur6TTRHExuQgo5CCUDhFt7
         mSBM/tS9yyvFy/2245IGHoJQ10jiiidbTIRbW6louxi7z7vr5KWe5Nz1g7YiWfjlaCST
         PMmQuj1bmWcafI/PfoOyjAo1G3qO7/iAyh1gOCfO+Fs1pRd8AqtrionQcAclYWtLQQQF
         XFMg==
X-Gm-Message-State: AOJu0Yx12Xvw/zQDVrvl+T0oArdCYTq/DSnCGKOz6UUToonTcw6T8M93
	ROupbEfzryP3Us/bnnvjgg5x6Xx2Wy0JU+xPl4IoWOMKkwD1/z1L
X-Google-Smtp-Source: AGHT+IEFatFmxhqUzrc60Lqwqt/8ztwxYuxm8NO3lDTfOsUB6qyjMzekHJGP1a1zywT026F3xSTSBFFp4HzydNpglIU=
X-Received: by 2002:aa7:cd62:0:b0:557:9018:9980 with SMTP id
 ca2-20020aa7cd62000000b0055790189980mr1356731edb.52.1705153045887; Sat, 13
 Jan 2024 05:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20240110195329.3995-1-philmd@linaro.org>
In-Reply-To: <20240110195329.3995-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Jan 2024 13:36:53 +0000
Message-ID: <CAFEAcA9c58iVvgW4wnNT1H3tzsdYbxyU-kT7bJP=A3E+B-t7PA@mail.gmail.com>
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
X-TUID: wdy8CGKEz6ux

On Wed, 10 Jan 2024 at 19:53, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Since v2 [2]:
> - Dropped "Simplify checking A64_MTE bit in FEATURE_ID register"
> - Correct object_property_get_bool() uses
> - Update ARM_FEATURE_AARCH64 && aa64_mte
>
> Since RFC [1]:
> - Split one patch per feature
> - Addressed Peter's review comments
>
> [1] https://lore.kernel.org/qemu-devel/20231214171447.44025-1-philmd@lina=
ro.org/
> [2] https://lore.kernel.org/qemu-devel/20240109180930.90793-1-philmd@lina=
ro.org/
>
> Based-on: <20231123143813.42632-1-philmd@linaro.org>
>   "hw: Simplify accesses to CPUState::'start-powered-off' property"
>
> Philippe Mathieu-Daud=C3=A9 (14):
>   hw/arm/armv7m: Introduce cpudev variable in armv7m_realize()
>   hw/arm/armv7m: Ensure requested CPU type implements ARM_FEATURE_M
>   hw/arm/armv7m: Move code setting 'start-powered-off' property around
>   hw/arm/armv7m: Always set 'init-nsvtor' property for Cortex-M CPUs
>   hw/arm: Prefer arm_feature(M_SECURITY) over object_property_find()
>   hw/arm: Prefer arm_feature(THUMB_DSP) over object_property_find(dsp)
>   hw/arm: Prefer arm_feature(V7) over
>     object_property_find(pmsav7-dregion)
>   hw/arm: Prefer arm_feature(EL3) over object_property_find(has_el3)
>   hw/arm: Prefer arm_feature(EL2) over object_property_find(has_el2)
>   hw/arm: Prefer arm_feature(CBAR*) over
>     object_property_find(reset-cbar)
>   hw/arm: Prefer arm_feature(PMU) over object_property_find(pmu)
>   hw/arm: Prefer arm_feature(GENERIC_TMR) over 'kvm-no-adjvtime'
>     property
>   hw/arm: Prefer arm_feature(AARCH64) over object_property_find(aarch64)
>   hw/arm: Prefer cpu_isar_feature(aa64_mte) over
>     property_find(tag-memory)

The first part of this is fine and reasonable cleanup, but I
continue to disagree about the later parts. What we want to do is
"if this property is present, then set it", and that's what we do.
Conversion to "if <some condition we know that the CPU is using to
decide whether to define the property> then set it" is duplicating
the condition logic in two places and opening the door for bugs
where we change the condition in one place and not in the other.
Where the <some condition> is a simple "feature X is set" it doesn't
look too bad, but where it gets more complex it makes it IMHO more
obvious that this is a bad idea, for example with:

-        if (object_property_find(cpuobj, "reset-cbar")) {
+        if (arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
+            arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO)) {

thanks
-- PMM
