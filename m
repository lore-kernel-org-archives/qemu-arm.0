Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp11688024njk;
        Mon, 6 Jan 2025 03:32:48 -0800 (PST)
X-Received: by 2002:a05:690c:490c:b0:6e3:323f:d8fb with SMTP id 00721157ae682-6f3f81152c3mr418530287b3.14.1736163167957;
        Mon, 06 Jan 2025 03:32:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736163167; cv=none;
        d=google.com; s=arc-20240605;
        b=QdVCP2nS/n47EpEHNX3OvHkhiwaoOiem4OY578SqRjVIPCPhjD7bTT6f38dwPMnedG
         3OLa5/BY89hShNQPw3h9pq0ZuHEDfbV+Po1NoB9jMF2RTpNaaXATZVVm/ctJat7xocuT
         01JyajjIyvDXAAAwPEToGgnXsThs6E71qGFKf9wcAikBGeXu5JinB2q0s/rG7T0it/ew
         6WlJKD4hNs0OG7TO/HsK7zEoLg5vAPE+CiS/neZFvBYJXnWq8DYYq7Apk/fukuib8C96
         Kg0pjrX2K0MAHVYhP6RvDdAEjHhXABifQBNz1FGqGSMe6YmOVeZ9LNrUjni0J86Ke5LW
         QfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BP9c/i25v5UW7WE+BIN2xQjuUJzNiyXyg8JOLidi03k=;
        fh=w+Zt0kO5Bz12WxOLTpFinZ/QSgIFw+6iGfGjU6/ID0U=;
        b=JPsy9AusnAWSgH9PG6XwYhR/Z/yxeswUArF76PmrHGuD+vvjRSCiOqvwzsx3Keui70
         n/tOpCfS4cLtrSvlbv6SiIXguwELnDjwocD89zomHr8MCyniXg3ZdR90XPdroWsibgSM
         mOvIycsEiIcHJSu0qOLtlQbQ3vKGO1UUlYQ/MvqNEt7drltojpIf8IRhxXqgvoh6ayNH
         udgqp3xW8X5ifiQlGn/49wS5wamvy4Q0VLJxIkidF14ncY2WBS9s6mflneEoU/3VGz6f
         6VxEgkviKdo0zScY3/aeGvbBmO0BcddAye/04d+qHF12ci6jLNyYBU92zLfovuRi3PLW
         ufXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QIIdguDp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f3e7853c3csor172440737b3.16.2025.01.06.03.32.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 06 Jan 2025 03:32:47 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QIIdguDp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736163167; x=1736767967; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BP9c/i25v5UW7WE+BIN2xQjuUJzNiyXyg8JOLidi03k=;
        b=QIIdguDpqGCztiIfPxr2oFZKw/2GKC/Ad+HTl8RQWj1mZeStqXwSjEOO2BQ7uTAgrd
         kjriZhuoVokJAM6WsO8MpkYDwuXVUrNkoo++0KObCkEX/oL7z2UMBah2/RRbNtZzopt1
         ERX4E/BrQJlgiCg95WvXFaMTwTcFyIkhorFyXijJHDmOJV18wNmnq4SMTa/WVg4NAoYi
         F0ac6KnwYKvem1Bd0/oe06pPaGTvCoEETsxhBWmE2Hjrw5LKuhJt6sWnL6EjcUXEKBBG
         qA97V0f5jUjk9PLMO16puQEU9yd04eW2edOBHyM0eDAd2sQHFiXsXWFP0I9uTBrHzFYW
         QAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736163167; x=1736767967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BP9c/i25v5UW7WE+BIN2xQjuUJzNiyXyg8JOLidi03k=;
        b=dBqo/FDM6kbk+BxVgSs2mjROeLsgKOpCQyvOqHPodCthVLa44NUsGuyMI94r8nBne3
         HCQGKCoYMKIau7B2nrStW+1skjJ8WvUSqlw17+Yf4LijQGBzlX9RyL2sFSrtyOB9W99r
         yi3+LThpLZW86RdmFweWqQnwDnBtCxXuA2i46E3n3Ze3ZYFRro27VUr0kNfTQdAzej/A
         SYMnOuqy7ZaLezG2EhiVS0LH/V5VyLcqwU/55H6ISaLNcfvfRZuhtnxnXBW3tSFNEwhZ
         RuYDJPuiAs/hcsW2JRrpstrJ86GBoo3fRcyVd/y6OZD11bRZcyXxi6cnHKiHXk20SpL5
         lWvQ==
X-Gm-Message-State: AOJu0Yzy8nkUU/Q4s3/1m2AijGvQB075zuelZT6VgRlDO8pbkAOttqd1
	kspaR/uX6UtGZXR1hUOrsRvOog4FnCJCw73jPitbqpOSAhoMahGEokuWgNlk9wbiqRAoGv9uly1
	OlrK2Xh6+Kng763dc+GKejGawuTDtbysZ7Rrh047j
X-Gm-Gg: ASbGncvRmTrsSS4KJu5zWmnCrz5gPgvk3RhmmrTL360lCCbrLIaqm9wx2VrtLHI3Rzj
	wtU5h3HG8mVEoR6QDEGATpcVmzau3Lfi8OkpHIic=
X-Google-Smtp-Source: AGHT+IHd9ZvzXjd3AkpbVwFFjOXVXQ1KoBFvg+0XSmZRjue6bvTHg3NX4RZdUtHq8bbYxo9eF/8ugR32fApEwFr/0ww=
X-Received: by 2002:a05:6902:2011:b0:e49:8b2:2022 with SMTP id
 3f1490d57ef6-e538c40bdbbmr43046991276.47.1736163167521; Mon, 06 Jan 2025
 03:32:47 -0800 (PST)
MIME-Version: 1.0
References: <20241226141626.28722-1-tsogomonian@astralinux.ru>
 <87msgikqkq.fsf@draig.linaro.org> <e2773daa-f819-4b71-b5c7-7ff8efc8d6b6@astralinux.ru>
In-Reply-To: <e2773daa-f819-4b71-b5c7-7ff8efc8d6b6@astralinux.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jan 2025 11:32:35 +0000
Message-ID: <CAFEAcA-jJ0qgsxL-vrNkOOMr8Aug8pQtDqpkD=0J8gLFFeqQjA@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: cast nand_getio value to uint64_t
To: =?UTF-8?B?0KLQuNCz0YDQsNC9INCh0L7Qs9C+0LzQvtC90Y/QvQ==?= <tsogomonian@astralinux.ru>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: FIPAEjOjbaQp

On Fri, 27 Dec 2024 at 10:55, =D0=A2=D0=B8=D0=B3=D1=80=D0=B0=D0=BD =D0=A1=
=D0=BE=D0=B3=D0=BE=D0=BC=D0=BE=D0=BD=D1=8F=D0=BD
<tsogomonian@astralinux.ru> wrote:
>
> 27/12/24 01:49, Alex Benn=C3=A9e =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Tigran Sogomonian <tsogomonian@astralinux.ru> writes:
> >
> >> s->buswidth =3D nand_flash_ids[s->chip_id].width >> 3;
> >> <=3D 16 >> 3 <=3D 2.
> >> x <=3D s->ioaddr[offset] << (s->buswidth << 3)
> >> <=3D max_uint8_t << 16
> >> With x << 24 overflow is possible.
> >> Other cases are similar.
> >> Thus, need to cast return value to uint64_t.
> >>
> >> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> >>
> >> Signed-off-by: Tigran Sogomonian <tsogomonian@astralinux.ru>
> > This code was removed in 192f75ad11 (hw/misc: Remove omap_gpmc)
> Yes, I saw that upstream master doesn't have this code, but some users
> use stable-9.1. I suggest adding these changes not to the main branch,
> but to the stable-9.1 branch.

It is not worth the effort. If you want to propose making
a change to be backported to stable it needs more justification
for this, e.g. exactly what the failure is, how users might
run into it, etc. "I ran a static analyser and it produced
a warning" is not enough -- you need to look at the code and
at what the device itself is doing. At which point you'll
find that the function is not used in any situations where
the eventual caller cares about the top 32 bits.

More generally: will you all please *stop* running this
static analyser on anything older than current QEMU
head of git? It is just a waste of your time and ours.

-- PMM
