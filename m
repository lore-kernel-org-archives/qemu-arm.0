Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1135707lfg;
        Fri, 12 Mar 2021 03:27:42 -0800 (PST)
X-Received: by 2002:a17:907:20c7:: with SMTP id qq7mr7781377ejb.528.1615548462239;
        Fri, 12 Mar 2021 03:27:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615548462; cv=none;
        d=google.com; s=arc-20160816;
        b=ZChDaRIojVb+s1GzA79QJZ3hV/1sG0We8/pIMasutOnWlk0T1Nu4dH3oyKL5cOjsOo
         eNoxGd6cdt4zDH011WGoXxg+CHyKWlrRYfFGgtublwZ7hv1CeZvrkLQK3AgE487muU/A
         6X+KEAX08GkfyYh7piAlHvuuJ5Wo6wl+HSOv0jd2b5cxYelS730SmaE3pAX/TihOnNje
         JQSEiIbtu186CYUjgL+aDgwr5QJDD93PZ3+O0MxI0mRFJbmHg9+z3xZgz4wNtugpfbx4
         hMcd2p/peDE8b5mSW+89jMfwHsTsfcRI+NHX92pSugs8zQoOh7C21f9Dr42LNHd8lNCS
         DRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b889pTV0jwB3xmSqwSho9uUp1GcV/P1V0b24gNrbczA=;
        b=cxj+4zoYPLcg49eCN7ajXK0SthIjvn22B3doCTBJ4xhpMZQGPLfwObUQdU89AmLF9x
         /EmNfuzAoWSdn8ERY5VwyRb4UHndegvBcLmqhP5rvKVuHoVBbR3xRbpAK/t6smcgi384
         llUXHJG/JlI/6ZtuVruapMpBgCdJGSknz/CeH99PHRx2qzr6odrznsEVFEzTz5dk8nMW
         QO/KPH0lIAkWKlXMW6p8LQXy+zW4gXMLfMV42fohb0sq1IeRtW9yOmk26gnVqQnZ4FnD
         Sm4pNXbx/peTXmLEc7TvvPmV+LwCLh+xvhbQzWj0lKMsuKxMUIkptl72fljmdCxByT6D
         Q48w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ao4CmjR4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m19sor6180760edq.18.2021.03.12.03.27.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 12 Mar 2021 03:27:42 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ao4CmjR4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=b889pTV0jwB3xmSqwSho9uUp1GcV/P1V0b24gNrbczA=;
        b=ao4CmjR4yN4zkSdHs6Aoe9x5LE4uGnfRpvkjmWgeA9S0yplhIWfeGavx4WlHlbKEpH
         lst5QE1kYtmjJpjQ95aRUusLGgclreQdGoLhERp4IPPTeYjPFRcuaJS+H6UYRRrtamnV
         JCEZgN55/BFDlKhgykEUnLjyuqkOvMQdKuSFK0g6V4V1ViV9OZ6aNSLa16yUvaBzmfXW
         7rvSXcYfJzXMSicnoMSlN7EFcIWEmFt0zpjKZmKEgkOwtrCkaD4EJZZIXbNh5RNwJ2K8
         5NrwYGM5Ol0aEvpUusWD+rX9AAqcj/T3dOnMVzWHstbcVwmJJK3quM6cSNtr9ub+5Tlo
         yO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=b889pTV0jwB3xmSqwSho9uUp1GcV/P1V0b24gNrbczA=;
        b=oijfPCA7+tNwXCsMsZmVZlmeyclIZRNCf3cHeCEzvuSIi+33422e/BQY+WclQ8XvgA
         fHdGOxVcu1pxYCzIPIbBPaeaX4Kc2xtpqmOHuOwkJ2pDK+KOwr5JB9SRUT5D+7JiRKXp
         X8eQ5PsC7k9AT4Ct6u/4MZcIKz4CI/J4QwJRjZ0EiO0K6fx8Tfa6mcpvZrjUka/h3ufT
         8sFZgFCNMgNkMdNRXMB2f5ikpdvy6cWZ4Vz2THIAyQeRLq/kr+JayMG+MPp9Nu9eEUCq
         I1sTvjweSUlRiCVhu99ImxYxJH/xv1cJOkfHwxS3RuV5EnkEEnLfvIZSndzq5R2XuxxH
         OKRQ==
X-Gm-Message-State: AOAM530k42Bk9tIXDt7BZT/PhSFaQGE9qVfHCXOOmh0fiBYIBVpZGGdx
	GCDjR+6gOclVXhTs/5e74auFVo61b3XjCy1mfgRrCWK8m26C2C5N
X-Google-Smtp-Source: ABdhPJzA8LLc96WBjtzYeaBVDWI+AIBFv1JxEmIdYQ+EVRGciJYS+W02eA3AzQ8fbZmyEroL9eLQwOrJF7gDHUP/F/Y=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr13333147edt.251.1615548462041;
 Fri, 12 Mar 2021 03:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20210312102029.17017-1-alex.bennee@linaro.org>
 <20210312102029.17017-6-alex.bennee@linaro.org> <CAFEAcA_7OKauefw7ehAnqF6jmaqWPvNyVba+G2wg+xxsUgpZhQ@mail.gmail.com>
 <87a6r8ehsi.fsf@linaro.org>
In-Reply-To: <87a6r8ehsi.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 11:27:23 +0000
Message-ID: <CAFEAcA_0wKRcwpWODM23QaQi5qu86k=Y-2NHk4hWiz08oL98zQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] tests/tcg: add HeapInfo checking to semihosting test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Keith Packard <keithp@keithp.com>, 
	qemu-arm <qemu-arm@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Ru5egG0/tXIG

On Fri, 12 Mar 2021 at 11:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 12 Mar 2021 at 10:31, Alex Benn=3DC3=3DA9e <alex.bennee@linaro.=
org> wro=3D
> > te:
> >>
> >> Query the SYS_HEAPINFO semicall and do some basic verification of the
> >> information via libc calls.
> >
> > Are we both testing system emulation and linux-user, or just one of the=
 two=3D
> > ?
>
> Currently just linux-user. There is no inherent reason we couldn't add a
> system emulation test but I felt that was already reasonably exercised
> by your semihosting tests.

Do we run those automatically anywhere ? I agree that probably the
best thing is to get those into the CI loop somehow (and then put
a SYS_HEAPINFO test there.)

-- PMM
