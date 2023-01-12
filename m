Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4694546ejc;
        Thu, 12 Jan 2023 03:03:41 -0800 (PST)
X-Received: by 2002:a05:6a21:6da5:b0:b0:4c16:10a6 with SMTP id wl37-20020a056a216da500b000b04c1610a6mr118922702pzb.0.1673521421738;
        Thu, 12 Jan 2023 03:03:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673521421; cv=none;
        d=google.com; s=arc-20160816;
        b=ONbuLKF2MvYoI7AwKc7baVhFlvPQZJvaborPiewe5IQLxpElZz2G5OuErjG4eq1cE2
         l2MOvWXLEKIuGsLTNiTj/K3ltzwP1NrCJjVAyYf/d4ZXfxApRBrqXSJZPBuGDvB+vt35
         0NmLnrufkbMgAOpsNh8k13jkFFJ6K75mWslWpvny3DY592xBprhhncVV39zQFVMW6Ap/
         J/zcLTfvJlADpO/drvYETYT2ZCfQtwNtp/QeVlIXVzRE9U9eLwHHeQdCL3N5OafCUGfs
         Vs8pMu8CuwBk+EErA+OwuRAxR6bfkUDnAEqlJkdvzrIiKGkVgHoBOz+CBZSqxSFJTm+/
         +9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YRMIxmrMjxFmZ7KhnuQyQ4LQN+JFHEuz988Y3hBKhAY=;
        b=egOHbsWJTElYw4MKIj0M1WwXRq4M+h7R+nCnRynW1rByeLZTbZIXi0pWStfsSTzweY
         8KzvWLAfhRxDH6O2pzHgunYddr+dtRKJ/O6tW+tzoqW5wyhWIHg2nOFI9UKdnxdu73gV
         OzHVTT3p9qz7wqSydAq0h2Z8N0Pal65t3A5DIsh034bBTzPr0NfyIqbafWepjUtiZhdr
         zFhLD75WfKmEll57PNKVUFTkXB7JPaTUwmxx8gIsk7P+v2pV5KkWsFavSm5OnedInmSm
         z/Yu+Pmrgf8rhts//w+LfkykWIntbqAFu7tYWQDEHTx8zFvMB3xTKeL6MV2/mXXpNYgk
         2JkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AE2aKbGl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x184-20020a6386c1000000b00477f5ab8054sor8879511pgd.64.2023.01.12.03.03.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Jan 2023 03:03:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AE2aKbGl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRMIxmrMjxFmZ7KhnuQyQ4LQN+JFHEuz988Y3hBKhAY=;
        b=AE2aKbGlog+nDLpzx6+73PFOKcFOlk7OrHENBBiyt8FPDfJtjJp9iazQfWNk1uJlM0
         QhMv2+Ux9eLUuLYjgMZWUkvqrbE7es6WjuMPIEs60T4Ls+D9q0/MzjqYBaO5D/adYkBZ
         nLgcDr0VnC6f+kKHzeT+m/f66v9V7jsPZreL9Ref5zsYSVjUQMk+NCI/f3XlF9FD4h0p
         wOJxBBhwgklj8lzeQO0DR7laeFBaDePYrZfypE63u0O/Ijnim3Qg/vKTEBQfhWb/FDZ3
         bh9hcjDTqiCPNZ6NKrduBHZtkSr3wrmKYWvOgX+Ta+5LYTfWRaUENMdezVR8C8dPh7E4
         HGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YRMIxmrMjxFmZ7KhnuQyQ4LQN+JFHEuz988Y3hBKhAY=;
        b=agbFbyOJFaEfY7NsP0jSFMzD7+TL0jhRsVikDGK5PZ5YfJDV8Vo8C8Y/oCERbu6plm
         ZUzBXDn/IFIIIdS1MZIl7oCsQIbCeLj4LIIpKKRrafPtFzkdhClvKBpAPPpHme2En5L+
         7eBusABanG2Y839+ss0/WYY5e9s9VK7M8d7CtzBQ4kYbNvtbsC+AK8JJVaAj2HEs/1r2
         DIFii+UOZuqG/6kyyA9RZKiviiAyKyQ3NXxcem75DDtt5xIz/75y0HjS93kFmIHRj1UH
         LeVsB1/mqOdFecx4UA3m7yL9mYrqm5rwXLiG5kY8BbAP2KBWO3Yto5zvkET8pSIjVSkS
         gsbQ==
X-Gm-Message-State: AFqh2kq2mHj7GAVFKloc2aDLZuLJfQQUDYfvmLPCmV/vWcCRJX8G1EJj
	alGQOeXG2oYbkEYr1nBtSLqlNP5PpztScfQMONnyBjrP
X-Google-Smtp-Source: AMrXdXu5V4bX22nwNZjWYHOvPbmvbmEPrM5ZbLD1wZubhZ6omG79rXH/n1MH1qTGUPIgVjvQP0rVQQGio1U3g6Ik/Ao=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr4968225pgh.105.1673521421294; Thu, 12
 Jan 2023 03:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20230110212947.34557-1-philmd@linaro.org> <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
In-Reply-To: <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 11:03:29 +0000
Message-ID: <CAFEAcA-5054ZzubQbZuzb8=D1QfbfKgqwnr48r2kOx5p4=Rchg@mail.gmail.com>
Subject: Re: [PATCH] bulk: Rename TARGET_FMT_plx -> HWADDR_FMT_plx
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
	qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, ale@rev.ng, 
	qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ODD/kpSsUhvb

On Tue, 10 Jan 2023 at 22:04, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Tue, 10 Jan 2023, Philippe Mathieu-Daud=C3=A9 wrote:
> > The 'hwaddr' type is defined in "exec/hwaddr.h" as:
> >
> >    hwaddr is the type of a physical address
> >   (its size can be different from 'target_ulong').
> >
> > All definitions use the 'HWADDR_' prefix, except TARGET_FMT_plx:
> >
> > $ fgrep define include/exec/hwaddr.h
> > #define HWADDR_H
> > #define HWADDR_BITS 64
> > #define HWADDR_MAX UINT64_MAX
> > #define TARGET_FMT_plx "%016" PRIx64
> >         ^^^^^^
> > #define HWADDR_PRId PRId64
> > #define HWADDR_PRIi PRIi64
> > #define HWADDR_PRIo PRIo64
> > #define HWADDR_PRIu PRIu64
> > #define HWADDR_PRIx PRIx64
>
> Why are there both TARGET_FMT_plx and HWADDR_PRIx? Why not just use
> HWADDR_PRIx instead?

TARGET_FMT_plx is part of a family of defines for printing
target_foo types; the rest are in cpu-defs.h. These all include the
'%' character. This is more convenient to use, but it's also
out-of-line with the C standard format macros like PRIx64.
The HWADDR_* macros take the approach of aligning with how you
use the C standard format macros.

As usual in QEMU, where there are two different ways of doing
things, it's probably because one of them is a lot older than
the other and written by a different person. In theory it would
be nice to apply some consistency here but it rarely seems
worth the effort of the bulk code edit.

thanks
-- PMM
