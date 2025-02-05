Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp924765njb;
        Wed, 5 Feb 2025 06:39:52 -0800 (PST)
X-Received: by 2002:a05:6902:2604:b0:e54:666e:22ea with SMTP id 3f1490d57ef6-e5b259d4e65mr2781276276.11.1738766392333;
        Wed, 05 Feb 2025 06:39:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738766392; cv=none;
        d=google.com; s=arc-20240605;
        b=ctyvgoE1BI9Y3TmsNSAIvwkiDgZ5DDRLlaNomAMKW2PolDwjmO7eQZnbFpRspARtAU
         H+NvoI5WH4iSrETpEeIZ8qwRcNfisdV11ZXYy8fJhLkWs8jYT8ML5RYKMZBofE2ExeWH
         iWA6k5gXdPZ6nUm9fNTKiNo4XM2bbiEJfRJJj97k7IFi9emPQ4BQMfHHaKmBNCVc68Dz
         zEfuCbk9at+CYY++U/AgOP8priUmm85wOL0PcI6d19Yd6DaTnGZWc9x9xJ31ocqOiLGR
         2LZkVBmLbD5P0v6YTKSMj3IvrLsZrEP0kLf7fjiT0JM15NY9OvEDlvHvhb+8Sl8AjpkM
         HCZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NY4DsnPGBuvuLgxrqN9iTbzl7NxQMO536XcOPp7VMAs=;
        fh=lyYd5u/xP7MkSXnqR0B3Lug5GOOGoEqAPzvNtygcaUQ=;
        b=U9c9s3W+HSDm6i+JDdnavjKsABGeNG+XhNIZqkByqJw0maAQoUNt+DpVvz4TAzhgpU
         Nan++2fzGfPlqAhH6scOwgDP+uGO7oK94746hn6/iI2Zts1FQt50f1bSKdvTz6Br6/pP
         2kKqrhuE12Esy9HelT3ofaHj8MuZfIFaXWUMhRb1m1+PdpoGfKHVf0BuE0JDi+AIpwjE
         mXg5RU1HQG56syeXvyvhWYuWvPtBzwDt8EKDB/1pjL4r8Ii1OeqodW8m6hvqTIsVB6lU
         kxDGK7OKzYNJcuUghfU4ZVAMjTBpBtxeGtQmSUDdordzcwyL2YD6Ajzua7lkbPWhx+H8
         Wyzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BH0KJ5CL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5b27630ef4sor782233276.7.2025.02.05.06.39.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Feb 2025 06:39:52 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BH0KJ5CL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738766392; x=1739371192; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NY4DsnPGBuvuLgxrqN9iTbzl7NxQMO536XcOPp7VMAs=;
        b=BH0KJ5CLoRcDImLUkeMb+6fCGRLS3xRgnxdrP03KlRMe3r9u6w29fIEjCrjP1YhR+u
         hqvioy4/OWM6K9pA7w+gEImntm51VtoajPm4/z6lMtHsCbjLmf0rWEnIoO6ZKUY8f3d0
         It13loWozUulkPdGxQUtr2UrF52wW8VRXD6zxaujKBnNDbY27AHLi0wzMB8HeUBS1x0r
         EpsPL6ra9zThfGgIo5r9zhCsKkMV0+fgD/G3x0/qpGs7QnGzlYQJqruS7GIM5IqW2YKj
         xu+qPS96po1DZ9/lZCRGERabasseRa8K5ufhtB4CSZbNG3h65sbzY+J+S3AW6uF7RqoW
         xMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738766392; x=1739371192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NY4DsnPGBuvuLgxrqN9iTbzl7NxQMO536XcOPp7VMAs=;
        b=UzjyuxIV3RL3tH9bWRYyDkypKucsqe6uceBnPj16FCiFjJXlRJ3/q0Xg0cu0h6aLUn
         puDwammdDrMr21xr0FTmngz4xzHhaWy8BecaFIjzPgxC5ye6h8hQBrMUhWvhD5AkdgT2
         WpmHPp4O2KXviAYPw8imPTKsZaXWSDpTVNbfEQYZExef9pk9It3ZONyqF3cwSIlfoGaJ
         lJfNnbs3vE/jmDUEZRVUkevtz5w5EuKrroGROXkZmyDuT7yXJ+5B3/E5hXeoi3ZzGjHA
         0Usn5tRITSaxlwNf5bFMmJhsTRO1ZlZ8cy/D+jmc+ULGo7XQSErJGK2l5tLAfajAzYEb
         XfTw==
X-Gm-Message-State: AOJu0Yx76srUkXD/6zYfan2O05Vd002m7DKZASU8nvszIIwVfpShTNJV
	O9/WQSagLVPH0USriIkCCdlg6CC9oBlzFtcDjrzeVliouFaoRfNoZKWKxmcn62FRZCgeGuH1QZF
	vvD80lkUiE1Al2aRaRnen6ofOptb5XYxDAN+Emc9gafBjVFO4tUc=
X-Gm-Gg: ASbGncsxKOsslO8OyL81Gu9DxiB6II4Jkoz6SywUP4l2UiUaIuyPB8pxsPgFOxpiWSf
	1KPNhkQ9n6E/SbEhmz7sKlyb2kZotUSoEtWpd3bmdS2k5kaLz4FwLiWchMFnK6q0iOJ4j7ljBtg
	==
X-Google-Smtp-Source: AGHT+IHfe65u0iaenSEqIDexUjch9CShW+vA4OkZYJN7ly2iuH3Ms2IfP1iFLdC7AjSxN0hubBQn91Yh6Z/TpIzGlzA=
X-Received: by 2002:a05:6902:2210:b0:e57:3f93:c756 with SMTP id
 3f1490d57ef6-e5b136173b8mr6035707276.21.1738766391925; Wed, 05 Feb 2025
 06:39:51 -0800 (PST)
MIME-Version: 1.0
References: <20250130182309.717346-1-peter.maydell@linaro.org>
 <20250130182309.717346-6-peter.maydell@linaro.org> <874j18a70w.fsf@draig.linaro.org>
In-Reply-To: <874j18a70w.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Feb 2025 14:39:40 +0000
X-Gm-Features: AWEUYZkgu2kQAOap1W_NFZeq1zdW5e5cXDz54VTmJowLHzoefzFNHj0hjBYW2oQ
Message-ID: <CAFEAcA_rFHm=HwS7-vsbywkvr5LcV1_7a4AOdy2r_JCFysaQgA@mail.gmail.com>
Subject: Re: [PATCH 05/14] target/arm: Make CP_ACCESS_TRAPs to AArch32 EL3 be
 Monitor traps
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 1sa6Cd37fJtL

On Wed, 5 Feb 2025 at 12:52, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > In system register access pseudocode the common pattern for
> > AArch32 registers with access traps to EL3 is:
> >
> > at EL1 and EL2:
> >   if HaveEL(EL3) && !ELUsingAArch32(EL3) && (SCR_EL3.TERR =3D=3D 1) the=
n
> >      AArch64.AArch32SystemAccessTrap(EL3, 0x03);
> >   elsif HaveEL(EL3) && ELUsingAArch32(EL3) && (SCR.TERR =3D=3D 1) then
> >      AArch32.TakeMonitorTrapException();
> > at EL3:
> >   if (PSTATE.M !=3D M32_Monitor) && (SCR.TERR =3D=3D 1) then
> >      AArch32.TakeMonitorTrapException();
>
> I was confused a little by my copy which was:
>
>     elsif HaveEL(EL3) && !ELUsingAArch32(EL3) && SCR_EL3.TERR =3D=3D '1' =
then
>         if EL3SDDUndef() then
>             UNDEFINED;
>         else
>             AArch64.AArch32SystemAccessTrap(EL3, 0x03);
>
> But I think EL3SDDUndef() is always false for us as we don't have an
> external debug interface.

Yes, that's correct; I simplified the pattern a bit above
to remove some of the irrelevant detail. (EL3SDDUndef is also
hiding an IMPDEF choice about what order to prioritize the traps
in if you do implement external debug.)

-- PMM
