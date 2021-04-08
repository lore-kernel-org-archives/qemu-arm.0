Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp231584lfr;
        Thu, 8 Apr 2021 01:51:17 -0700 (PDT)
X-Received: by 2002:a05:6402:10c6:: with SMTP id p6mr9780253edu.241.1617871877092;
        Thu, 08 Apr 2021 01:51:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617871877; cv=none;
        d=google.com; s=arc-20160816;
        b=vVtkOvgs8w4JYm6eWHolyHal+tox4by0dsYVZH3aULyI2UpeIsPIBMF1C9XXqW/wKB
         0FKuhu3XisulLyS/DKX+Da2/x5DMcmQDBz50vWWTErOyV2YHUH/KPde0KkByta+Q0G9Z
         7ND7EUgIPw7ASbuU77ellbkfxr+f9pR/Z0WqeAzBC0nhDG/bCHnNx5uepFb99Yu4kc+S
         ypekKsZwklmyDa6TWG1USt5jzyHBwLgTFgjYLryvgU6GWq2JAi5sT7N1uOsAXhA20lUm
         Ric3115DZZMMK2sQQBKchuwMdZPOhzL+PVfnX9EGpjhzj3NQURev4Cyh7mWB3zN6LDMn
         5kXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U+318EFWwHmx9RNFegnCSZS7fLEHu0A0/MzU83yeLu0=;
        b=n9D1CxSX9jC+iKrbHauFEU2nCH618FcA6+EuvfU4VUFhSxJluz+ROGQat/Z4H9myXT
         Vaa2807/+pk5AYTp1yyrKeqzhF0MxFJUNCQChzNmmPhzTKfYx5TXyzZ3NjNPf38LwDmU
         5DuoJ4t5kXksfU84Ybpm51CcBJb6Pn5SY5tTSFownAshrZFbhT/9l9X7+yGuLMnLE43P
         6ZTpEN31GMm8YKPy807DQ/G/yagev52Ipn1Af953lVfKqFRuRayz8sP0o3+SxWhfXaJv
         MgMIjeehntTyhdDzgAdsVZEizGLw9qeVoxi36sstVuD7NH6yol3s0H2BgKc4kB8ejdQo
         L82A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rRkf50TV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k5sor27054219edo.16.2021.04.08.01.51.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Apr 2021 01:51:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rRkf50TV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=U+318EFWwHmx9RNFegnCSZS7fLEHu0A0/MzU83yeLu0=;
        b=rRkf50TVAWdC9iNmF3R4atOh+g4F/j6AGW/RS9Xz8+XubQNZZpD8bcb0PGh1lWjQjy
         LpsU2Jmcuv3GxHxHD5TQRETCvIoslhsj40zBhRcgA9/7VMZNzZcVzq2SbJrXW0MQvnj3
         Uoe9eWAgSYU2vY0gK+B2ZKXNIFddewmo+ich50Yz+Zj6rKD2pJ/5Rhp6U1YudOc4+uEh
         B979b3gOXUlzsZv5Mk4meGPgZYffnmXnCX9SfY3VbUFVgpZlMvZosCGc1ORulhSK/T4a
         e2pKexAXcwV7Zn6Bvs+QW2uFv5TO5VsSGIZq5ZZHCTdvWXi4q4bgvct2Uwi+F17TQCXz
         zqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=U+318EFWwHmx9RNFegnCSZS7fLEHu0A0/MzU83yeLu0=;
        b=aHZLygl8m0UJceMGDEzV9JQ1ir+1J1Dl7bkEAg+Mrii3h8Bix4sFzKtnR6VhJEdE94
         MoaycwmFqEuYHKMcwxC0/sz1S+9FaTUweSZg2IQFuropV+fenwMVAmd/nW6yKSj/eWF9
         IzN3xjiSMMa1yS5yNMi3N/8Eb//bKLU7YaR9kO219VRozEi1aXZV0dJ5QAtZCbIprlAC
         DkZOgPdYuLAbkTgw3ctb6cVqMzpB7AQPRF8ilY7sCEttzfu70VToILiIIlDAa8VTht2Z
         bNp1Jz6b2wh77Cn1R5X0WLtDmT6gC5e/6OZUCLLcBrKSkMyVPvNS4aDI6W9uKXJhcThb
         L/fQ==
X-Gm-Message-State: AOAM533r9zsHZwfEF2Ii+dAtmyb05kgEIWGDEF9Py7PEJZAUuFXPoNXy
	viDf9XQejkqP/O4S+ckx0xGEvyrQLC2Fxr81fXaa7XSBSiKD3PBz
X-Google-Smtp-Source: ABdhPJxEGNZikarl8tpW3Kni/wXUPEZhuJWsNtLT/aHZhlmQexuyWoNwMhK1lvvc+0j7PMStODivln3ooW+j3evxFBI=
X-Received: by 2002:aa7:d843:: with SMTP id f3mr4313620eds.52.1617871876821;
 Thu, 08 Apr 2021 01:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-4-richard.henderson@linaro.org> <877dleuds3.fsf@linaro.org>
In-Reply-To: <877dleuds3.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Apr 2021 08:50:36 +0000
Message-ID: <CAFEAcA9Vc=w9d-3DkwuyY8Vzrj4d=f2zHn4OXauQRc-Vr=oQzQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/12] target/arm: Fix mte_checkN
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, 1921948@bugs.launchpad.net, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: zSbCyRWUuecw

On Wed, 7 Apr 2021 at 19:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
> > We were incorrectly assuming that only the first byte of an MTE access
> > is checked against the tags.  But per the ARM, unaligned accesses are
> > pre-decomposed into single-byte accesses.  So by the time we reach the
> > actual MTE check in the ARM pseudocode, all accesses are aligned.
> >
> > Therefore, the first failure is always either the first byte of the
> > access, or the first byte of the granule.
> >
> > In addition, some of the arithmetic is off for last-first -> count.
> > This does not become directly visible until a later patch that passes
> > single bytes into this function, so ptr =3D=3D ptr_last.
> >
> > Buglink: https://bugs.launchpad.net/bugs/1921948
>
> Minor note: you can Cc: Bug 1921948 <1921948@bugs.launchpad.net> to
> automatically copy patches to the appropriate bugs which is useful if
> you don't have the Cc for the reporter.

I'm not sure cc'ing bugs on patches is very useful, though (and especially
not for big series). I usually prefer to just add a note to the bug with
the URL of the series in patchew afterwards.

-- PMM
