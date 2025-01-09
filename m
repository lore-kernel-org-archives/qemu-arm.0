Received: by 2002:a05:7022:43a6:b0:92:a90b:6588 with SMTP id bo38csp1318099dlb;
        Thu, 9 Jan 2025 02:57:29 -0800 (PST)
X-Received: by 2002:a05:690c:688a:b0:6ef:5973:8273 with SMTP id 00721157ae682-6f5312bf280mr49593677b3.34.1736420248509;
        Thu, 09 Jan 2025 02:57:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736420248; cv=none;
        d=google.com; s=arc-20240605;
        b=IvzX7Ijw7v8pe7bsIz/3kE8YPRgHX7P3HBPxF0ZErBOBxMtDSOf8Z9kGTeEvi0Yu2Q
         Elm9vE9a2mG/d/3Lt2YsE1NP3eTeDmR3aOhBgMqsD44628ed2oqe6GuYCv0fLMtdwKMk
         xBY4xuPoqoGnBef2zu6bbE3EbbyPHkLp5YQvggxpQlOKJSUmQHqGn+cwwk6ZhYC0NwdF
         cBJYorEhwUDj31geGMPXl3o8XegwmgoZTZ3ozikzfhYF1PXuUk0zHVmvicwJtkS09uds
         skUNNdgP83CCZlxsr7SzMGhopbzAlJe3dvFYT52DCoDUWkPipXYiMLt/+6E8sr1GoNcp
         pdWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bHj4hLuF3y3ULgR5Uc6vUTiyHT/K9Q//sI3ccL3JdeE=;
        fh=v3XUH1VLouOJPNi7btMjfCuJW5FR4ve8PSneDx+xJbY=;
        b=YvxvXdqv9bFcJVp+wW1H7YK69ZIh0rGBTETX1jDexdQg13y+AjN+vlEjMPVrEEQmgt
         2q+81kjsQ2F6N48AEWDMH0rv7z+hid4RK/HtJsxl8O2utAMreNikgNhyP73pYOJQUBJa
         n4En3cKUP1exVjAF2F7KkV2Cqo9HcvTO2yr/ahRM/4hoWUlKxQzzJEsh3IAvoun5mnpO
         0u/W5STq73LqMp9uaYCtyeMi7yGvGig3Uja6cUDklHsRs2eQN6nhq6yq/6ISINgVg7Pv
         Grw5gxjdzW5TveC0wmQ1x9O4c7dR3jtkvNuGA+MWBii+7cLtMMx0a8m5Lk7pt4FBmO7J
         rW9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KSKvUyBB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f546e3659bsor6525477b3.16.2025.01.09.02.57.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Jan 2025 02:57:28 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KSKvUyBB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736420248; x=1737025048; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHj4hLuF3y3ULgR5Uc6vUTiyHT/K9Q//sI3ccL3JdeE=;
        b=KSKvUyBBgtIBjNyimj1nuPksEnduKxTSv+Bg09u+MpahFhXaO5DY/gpE8VFGWmtBQJ
         YusSqehirA7SDNjuqwZztDBcdEZ39pNANcBo1Jkck5fJu2uqf3tMQRtTOi9Tdbm/dpUm
         GiIF5+xJkBXc1D+S7z9UVFh9ZpUU+2NZi7Gd5k9EjdiIP7qEBpaiqSAz2JDpLlcvpSvT
         Q06wWesVFTfq/T+ZcucCeMq4GArXSLtrrdXBzv/RmJipMnJHylDBIugyfk6ghmqPyX8x
         jb86/Vl1XFEQHNaM24joUX2dKlourH7X0COUOiYtQuu42S5gL6R+X2mPQVDgesSlZ6tK
         vIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736420248; x=1737025048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHj4hLuF3y3ULgR5Uc6vUTiyHT/K9Q//sI3ccL3JdeE=;
        b=luthLIkYD5Ij1kGEB/83jXym2VjEgPcihAuxWEO8/RWMgW9O5nG2/zO+Fso0Rt0FAL
         zwKDZWzcIx0M9jWuMf6JFK7pVBribzMiX00UDlqwdhltJDYKJd0VXdLHjlqqxsTxUvmB
         jKC6L4WvVPDqL+TS86AQ2g9bkTdvocY69LIRwq1KNixATf1W6lSLKZCNw314MBk4U8v/
         BHaxPG4b6HEgJ6JMmMfXjSXyBpjCmQKmVp2RBLLtYht7SO0bK43bKaUn8CRGbSlesvs5
         efe02YQwAzhdn1hmQPtrdrZw4YayfWaHjkLAEBYSScqXSRzINkQfnKvC/swtwtr9jcnr
         XiKA==
X-Gm-Message-State: AOJu0YxJJKmdVQ4LxOYG772Aw79FzptzNRrLVa8h8Aqo5q/11bAp3zxm
	oY6giXY3qVyLh8alB/AlxlEqvR4wHJZLE4RSNaQSp5VCSZIh11cLLMl/+CuB8b4eqpYjbwYPfRL
	p1OgSzpvQF0scTt2jXwyQ8eBCfQ1xaakF4ecpOCGSldmHt/93sbg=
X-Gm-Gg: ASbGncs7+U1i6Uq/qK1op+2QpawdekNwdtz+ZI0zmRFhpo7T6q255AX8V/nbRPJzQeW
	IpNdDtvzp30uuwEEuG5TsTY5N4Ak6lcxsIuytwUs=
X-Google-Smtp-Source: AGHT+IFPDhsY1f5fYN8UTs1c6wySCRGX4h+rdsaCJLX3s7uMJT2wIbKkXedhQ2FAR8WEJ62xLjU3jTbKXuo26oQqt6c=
X-Received: by 2002:a25:6a8a:0:b0:e4d:d319:b9d with SMTP id
 3f1490d57ef6-e54edf3a172mr3349097276.16.1736420248135; Thu, 09 Jan 2025
 02:57:28 -0800 (PST)
MIME-Version: 1.0
References: <20241218181511.3575613-1-alex.bennee@linaro.org> <87cygw9snv.fsf@draig.linaro.org>
In-Reply-To: <87cygw9snv.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jan 2025 10:57:16 +0000
X-Gm-Features: AbW1kvYdNmoc7BrTcSE-FT9fq4BSthFnB_OvF-FCo6I2GPMrDZF1h9va4GhLofA
Message-ID: <CAFEAcA9PBaHz1=Rix7nXZzHce6Ftb38bgS2H1rD2+mHnNvW-nA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] target/arm: implement SEL2 physical and virtual timers
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: f2/VZ/cTR9Sz

On Thu, 9 Jan 2025 at 10:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
> > Follow Peter's review I've split this into a several patches as there
> > are some other fixes that should be made to other EL2 times that
> > shouldn't be rolled together.
> >
> > v2
> >   - split machine enabling into patches
> >   - rename IRQ
> >   - use CP_ACCESS_TRAP_UNCATEGORIZED for UNDEF cases
> >
> > v1
> >   - improve GTIMER docs
> >   - fix gt_recalc bug
> >   - address review comments for the main patch
> >   - cc qemu-stable (no rush for 9.2.0)
> >
> > The following still need review:
> >
> >   hw/arm: enable secure EL2 timers for sbsa machine
> >   hw/arm: enable secure EL2 timers for virt machine
> >   target/arm: implement SEL2 physical and virtual timers
> >   target/arm: ensure cntvoff_el2 also used for EL2 virt timer
>
> Gentle ping - I think everything is ready for merging.

It's on my queue to test and review, but I'm likely to be lagging
behind on code review til the end of the month :-)

-- PMM
