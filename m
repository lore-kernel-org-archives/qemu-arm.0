Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4159960wrs;
        Tue, 20 Aug 2019 09:07:29 -0700 (PDT)
X-Received: by 2002:a05:6830:1699:: with SMTP id k25mr23411192otr.11.1566317249179;
        Tue, 20 Aug 2019 09:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566317249; cv=none;
        d=google.com; s=arc-20160816;
        b=g/sqZDle5O/HJkz6dCGCKEcISePeZBK3uPVFJhsheEvXYfEyFA7Uy5ONytYzAgciRe
         lfWIZP9t/jSnj5eTdMiGPcxzA1zy6dqmSPqpcE2ymNJZCvJBnzztmF7h8QQw3quaIdb3
         la1aee5lzVnx/1i90j0akiSiVcr7egVqSjV0Wwtq1BNihDx/fh20I0xdYVd62r4lyA49
         XFe02emWJCXAJL7kSMui6UtWXVm2mDNCjtvuZ+D6N/j9bUMUngGwiZ0W7rFPr9i1YQNm
         iNvXcV59vqx1QSIqWBFVlWon1iYRvVLL0lezEakoLBTUeCQtuQky+SwRiqtwcPs7CPtX
         iAXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v12VnDYdjo5ioJ04KkdklVuOuXeScNdl+4v4TtfkkmU=;
        b=bye/MC54U8hZeXrgQ+W2t4mI5qsofC0CE2vyrvxK1W2w4LE5vVSlJpUlFhWjW4Qwtp
         U1rxWNXusvIOzLvCwi7r1pqoKJXtHMS6ZClqETcaJLtns4a8wgYkX/vFcfCICyEVvXyI
         pl9JiYZwbomg/UcnM6giopftl55yiNNVwwwVmofCj3M6s6DQyGRtJW8f82BN34jAv/Td
         FQOHs9DY7ksca0uULX57rdn1a5qPbVykJlyZkdXvdlYq4VojJhFsHHlR2H9f/SZ3bHOh
         1zRQm1rrFW+G07x5wifYCYIDvcK+w8A6X/mk5+t1x8mTQaAtLDMFzjDD9Y3LHhFK3R6C
         AYLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gxOBVL/j";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j13sor2189052otl.123.2019.08.20.09.07.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Aug 2019 09:07:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gxOBVL/j";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v12VnDYdjo5ioJ04KkdklVuOuXeScNdl+4v4TtfkkmU=;
        b=gxOBVL/j1EWjQT3xMmwpzMiD/XMYrj0PlFB9dLZvP1qFEZlN/RBdbomkyqSVsCsTM3
         A0ebdbvX50BxjqH1udMGmKNqjgjQ5uaBIwVGkho/JnvLvP1aSZJqunZr08tqQhuFqsnN
         AdYeZx5rLaAW20VRpm7zdBinGHes675l+TamnLbvhdrDS8TiyfEwib9jSN+phsXC/xYg
         oG9kTstyHa0751jvqWIYfymsIZ50R4AsO/t5H8YhfOc5oSkckTQWmXGHZI9uSIXN6ZDN
         YYdaoIN718qwxBRch/omV3SvMVVOaDDcZ9SkPHIj1g5insmL//cMwd5QOColQczglDab
         XPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v12VnDYdjo5ioJ04KkdklVuOuXeScNdl+4v4TtfkkmU=;
        b=F8JKFKr/16BdSxL0LKRc4Fo7opOXnKtMNCjQZdar1oAUlslbLcq+tflnUtiYTAgy4x
         ndQI9OEOwfxqqhVaH2HkDEyl6BOxJ429/BuBytMqDcNZP1qNxNKtNM+rTljRgWu9mfTZ
         HRK/c0GKaWXNUwe8tkDmwFliNH7eHSmjXd6GGncgv1JRSFrBGZUaVQcb7N06vM7BEIUy
         bZuyYU3Q9Wik9mpKqXI2uYbRM/3qaJURBywFacawiJvU0omHmNmrh5hH06p3Krohlu4h
         FOaq0hkTaXP1tuA7S0Sl1HTkF2Jefft4ZcPCvuDQsG1+u2hNijv3vWtAlwcZ/87AZ06V
         XsDQ==
X-Gm-Message-State: APjAAAVeQhPwrRMvdO6HLgvQSvxfnpUQyFkDTyvhY1ObDz0l181c3248
	GRqBpdMDVd9TScWgGhqlI4RaVCnJFDqHF2Fh0Sp6WGPZ
X-Google-Smtp-Source: APXvYqzLtPVtKiKrfsW1G7hbsk2Lvr2a6T/G14TQ0oL2ukaMY6Y+YmsswRvfgMrODTSF4svNRJ4UKNuMCwDbtytMx/w=
X-Received: by 2002:a05:6830:1015:: with SMTP id a21mr18311446otp.232.1566317248726;
 Tue, 20 Aug 2019 09:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190803210803.5701-1-richard.henderson@linaro.org>
 <20190803210803.5701-5-richard.henderson@linaro.org> <CAFEAcA-_gMkE-0kA=xyUyNKxeqX0n6B-9i_7132xfFXQNRqb6w@mail.gmail.com>
 <7c739082-c1d5-ad03-0020-9776cf08694a@linaro.org>
In-Reply-To: <7c739082-c1d5-ad03-0020-9776cf08694a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Aug 2019 17:07:17 +0100
Message-ID: <CAFEAcA9mpXFLsbgJBm0wbfdMapa+605KZ8U=8RFQ94LVDbmGsg@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] include/elf: Add defines related to GNU property
 notes for AArch64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Dave P Martin <Dave.Martin@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: NUPIwmpQclyq

On Tue, 20 Aug 2019 at 16:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/20/19 8:39 AM, Peter Maydell wrote:
> > On Sat, 3 Aug 2019 at 22:08, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> These are all of the defines required to parse
> >> GNU_PROPERTY_AARCH64_FEATURE_1_AND, copied from binutils.
> >> Other missing defines related to other GNU program headers
> >> and notes are elided for now.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >
> > What's the authoritative source for these definitions? I
> > tried looking in glibc, binutils and the kernel without
> > any luck.
>
> Presumably the true "authoritative" source is an ARM document, but I don't have
> that handy.
>
> For binutils, the defines are in include/elf/common.h:
>
> https://sourceware.org/git/?p=binutils-gdb.git;a=blob_plain;f=include/elf/common.h;hb=HEAD

Thanks.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM
