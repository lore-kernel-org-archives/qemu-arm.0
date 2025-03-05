Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp936615njm;
        Wed, 5 Mar 2025 08:52:34 -0800 (PST)
X-Received: by 2002:a05:6902:100d:b0:e5e:6fa:80a7 with SMTP id 3f1490d57ef6-e611e19a0b4mr4885903276.9.1741193554067;
        Wed, 05 Mar 2025 08:52:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741193554; cv=none;
        d=google.com; s=arc-20240605;
        b=IvlhL3Z/mrlmNRqrJqx0xx2wJCXliFxgRCTSMisRy5VbJUNcq53o1yUcduyrJ3xWBg
         qbkecD1uvj8CuOBV71bQJXVcIlm/SlpXp8TJA34Tq8uVV3aa1VkgQDuBNyax9KdwRaMn
         x5vnZM12wDBZGww70FyBTm3zRpPTx/LA/YtDd9oqNJkZFFUBKo6Hx4gMvgLkeV4m9aAA
         kldI5omjfC2jLUEszPOiowLhf/uXkZV/EuMW7GdKFNUmaqdyST+Lnm0CvZvbiXBKVQB5
         sBf9fQQJMqoULwjgmxuY6DRpovUdlxvDd7yPEBr19rylAdBPbisWyvgwUDN/CtU6rIoD
         a+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=igUrSwpM829khWSgnZtJRplZak9Hy3/fYvzPQ4teyss=;
        fh=7S0X+7aLvcVPXWZT6h+3bFUTZvFFo1UCImWQnq7Oh4M=;
        b=FYIfabiH5OT+wjKyR/dNXZEmKie6M16JaTTIMsyrY7csUzauSBLwC+lY/d0HV8Bwcg
         Jy3dICdkgILx9Sdp3qvAlPEDmu+82oPRQfUBnWLy7CYuNH9c0cHfNnTRASoBugNaLSvp
         j8THJF6BkMtqNyvORiyIrQpDenYnzhYSDUSFNBi0iQyIbCrNOSoB8fQh+3sJWCpmDgMc
         L9Zhe3lxRnMavRfPLAJ4zp1hJYUHw6v7Kv/Gtlz5NihqdwEForMOeZbxO3B2v1j2Lndz
         WC74wzhA6vpismO9JvkHkgdVH10LanW+wgeHQ8UIi1qoPzqtNG61yap/i2nnJaU/LT29
         62BQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RKlBie5U;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e61117f7e8bsor2405087276.7.2025.03.05.08.52.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Mar 2025 08:52:34 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RKlBie5U;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741193553; x=1741798353; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=igUrSwpM829khWSgnZtJRplZak9Hy3/fYvzPQ4teyss=;
        b=RKlBie5UT1QIJVqneVEDFAgPBWaKDS82vEP6Qsm36U+PLRDk6PmwVLpO3dCIvYbwSF
         weW59DLTA+uQCUU+J5yVS5MVU724e++2mWJbMCrzPc2/v+/+ziHqMNT+wF7SU1Va+1lK
         PFG43jeQbmyAX3R8pHH4AntZY8uCqFqNchWfooC+YCAeg1DlTTZr3NMeRL/zAciXAdMs
         wBhe9A0ZyJidIrnxLEnNAL1konyzz8T6GDWg6ZyTVPPulXi9AKx/eTT7PLcHHIBv7h9q
         BK/tUZiMo+p5li03N60YnHLRlBI0cq1PGwn/XEiGY4CRAy8SyAnQ8hOEdyE4J5PYFVdf
         CC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741193553; x=1741798353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igUrSwpM829khWSgnZtJRplZak9Hy3/fYvzPQ4teyss=;
        b=t6zuwybxG01L+blpLY3msm6q+U+ASIoENFR0ee3BifDnvg/LwQ6S/rDYdQbYfOlHik
         Cd1jhxnHLRmWDmbPUSXyw+tlyeDpFERA0tT0X0edSQETexeNKvinLVKRaPaamZO04cUB
         j/P5isLpIEucipQ8peEwvpUJjyIqot+dYEs/HGLMPD3bE5E8U2OFfBdeXapHywPqxT6F
         yE7ywY/HjLBuH0T8Q1OTzwVTT0V6MexmqgYypSNnx9eS9iPq9GtaLOqZjsPY6kkJkaZ1
         Ns2Gd/KcARhDrP4oiPKJwvuV5Xhb9CMK7G99y9e0fxL8up2JcVu0s+idfCYDEPY5IR5R
         6qZg==
X-Gm-Message-State: AOJu0Yz98wE/tfWjlhzwhXSwqsWDYUfxhuqZz8WhUc3zXCEzl/94gUOl
	0OBTqlwDdRAiDYc4lcgKgcMmU2wV47kcpecE0ppBHaRYMXX6PouWROXi1iQBKWttg/68KmmDobB
	oWmB0fL5/838r8mon7uqbcXu45ISu6XYTNTuRqapy
X-Gm-Gg: ASbGnctiLfb+UsO45bw5udKFXHSeLWXwybMefJkvUVf8sxGqI/NhcLk7og3DWOVZNHc
	d5uRjXYPJnD0CLq4G5CC05Hic6Le+ADkH/N068jGW0clpsfuLXvnpGqx9ECbNF7RNe4hWrK6oPT
	uxFnxdJnvISElNik87dQmWmlxU+iI=
X-Google-Smtp-Source: AGHT+IGHip7qXEwbF37JJ6dixVrpeF/0m+R7g/3VkH1lK5+kgrfYR83hCS2uCgWf3JaaNMRAwsZD+rGFL+WRbG/SUaY=
X-Received: by 2002:a05:6902:18c7:b0:e60:9d12:c1db with SMTP id
 3f1490d57ef6-e611e311923mr4854866276.31.1741193553720; Wed, 05 Mar 2025
 08:52:33 -0800 (PST)
MIME-Version: 1.0
References: <20250227141343.1675415-1-peter.maydell@linaro.org>
 <87o6yh57r2.fsf@draig.linaro.org> <CAFEAcA9VDtWKoQ09dOt+ZxJ2MhdRTFY_X1ON58pEjYTM_NtZ-A@mail.gmail.com>
 <2de21adf-204b-4417-aa2b-2d16d22148f8@oss.qualcomm.com>
In-Reply-To: <2de21adf-204b-4417-aa2b-2d16d22148f8@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Mar 2025 16:52:22 +0000
X-Gm-Features: AQ5f1Jpk-Z9MGBddkvVIDe2HIHLlXKILHqmEwGs4hxl2GYZ50_JBxVRQi-oyRB0
Message-ID: <CAFEAcA-ya3qjG4P500p7=PwWdiX4yRWKxAv1Q_SKeJSgiqXZpw@mail.gmail.com>
Subject: Re: [PATCH] tests/tcg: Suppress compiler false-positive warning on sha1.c
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: Wt+oES+tThF2

On Wed, 5 Mar 2025 at 14:56, Brian Cain <brian.cain@oss.qualcomm.com> wrote:
> I was going to volunteer to update the toolchain used for hexagon to
> address this.  But unfortunately this warning is still not supported in
> clang 21.
>
> https://github.com/llvm/llvm-project/issues/72455 sounds like it's not
> very likely to arrive any time soon.
>
>
> So "-Wno-unknown-warning-option" does indeed seem like a good workaround.

I think the main problem with clang is that it doesn't default to
"don't complain about unknown warning options", whereas gcc does:

e104462:noble:qemu$ gcc -Wno-bang -o /tmp/hello /tmp/hello.c
e104462:noble:qemu$ clang -Wno-bang -o /tmp/hello /tmp/hello.c
warning: unknown warning option '-Wno-bang' [-Wunknown-warning-option]
1 warning generated.

-- PMM
