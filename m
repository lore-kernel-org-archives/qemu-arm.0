Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp736912lfr;
        Thu, 15 Apr 2021 10:35:08 -0700 (PDT)
X-Received: by 2002:a50:9fa1:: with SMTP id c30mr5663282edf.66.1618508108834;
        Thu, 15 Apr 2021 10:35:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618508108; cv=none;
        d=google.com; s=arc-20160816;
        b=Z2xfL+LeeXOg4KwFTZhEyMoBCKfR+u6Q06O/9LNka87RtcdGhwTbewwkwGwOFBooEi
         oBl2K3uer/oQoovuZSvXIxpF5DIHGN9JaDnOEIu6gAaqVGJQsT6ia7f2pJuimOnJvyOX
         TrZQPglHQ6mz0z3bme5zXbf0/idpMRQ2bsqFEnHuZmvbUFxNzAVBhTYcoFcl9uQ2k8/f
         ZN4pHtZJNcoJkAPKwvwJYziXPL1ac/L6h9HHDjoHZ3txCdXeM3+mDfr+EBYbiEMeTtGz
         42C/AYvYWvFsqyIbqtQRjdSAJoAe4wk+0q7rJfZjSm8dELD18+kkN4h8ZlxEHiIha6S1
         UsdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wtD98WdQcA0AbtawXI5Ih4VPg30HhlDeZrK5SpBi5wI=;
        b=CjsdVjhMMVC4Ib3etDNteoiBntmvaKKvjVw2ci8YhYSC8a8/bBgZGz3LMhIk4Pwa39
         9/M82ETzmg2kMFWp7Un6CRlLqIQN3R9qwKxpNH2BQ+YCUVL5GY+DEToOufGiasmob7V3
         VTmkAZJ+EGUUM8pLDFtxsTb84KJSyYnXB4Hurl42iJeJnf1ZWeYQmkrZsX49Kk6xPPAh
         JQp++IrwJv5dFK0vGeDiDiYFuHAWv7JH5/hbbUETRY6XN05TlkhiI+ikVrhwuytC4Df2
         HIKoCuGD/Qgg+quiJH3WnNuxx56KnRE7lEjMyNHVG82Ipdv8WzK/bzvEpRm0qdkS9Dju
         WGvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DCu4ylfO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k5sor3954649edo.16.2021.04.15.10.35.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Apr 2021 10:35:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DCu4ylfO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wtD98WdQcA0AbtawXI5Ih4VPg30HhlDeZrK5SpBi5wI=;
        b=DCu4ylfOUcbULZvcwFw0rquq65UHTkO5mhk2f8/zykIMPVNb0An5ioAGfbhpl7McQS
         jF2RXzz1qbkbHaCkDwS5YOBYQ3aBkBni7jIQabfekpgV5LKPNbPC9NEBST8rGT8v26Ew
         vHjAzRMGFL/JXHgXCeTQE/E1EP5k9+KXE2SGxrkPU0cSrmgYokg8mmqXRxgJYy0nlTf+
         5Q/t+p5L3qV996jMdShxM9rg9UwKmfzvmNtOA0aERBpvYDmDRP3JWYOKWEMWKBEXAfku
         gwQRF9aJIjOD+TnbF5LZ4zsyrbMY8QXAtqJFkUOJV+k8xWQ4Gi+PP6z1/9Vq8+td3gY6
         787Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wtD98WdQcA0AbtawXI5Ih4VPg30HhlDeZrK5SpBi5wI=;
        b=SDXMK8QCgwAnUtHeKO32SifQ/7mZenSGnDGzzCsltOLgccci9YAVmPe/5WQAXWECIy
         MuUb6ozEIWnJCzhPYlHJWmDS+ZPCIbIkPSCH1a2uVh5T74Cuv5xBBEqKQR/xuTIFQTGX
         hlfMxfY4zBzJzX3jKx6pyyZkJXICRlGNMsntvMSgMvy186d4Kp8Q2qU9xZhUXvaJFfES
         lZ5Kc+vNfZcelxPSvSUxH8THLug3rMiZd4eHo0feR9i/hleYGw86qrRMdEZC3noLMC//
         J/LqQ4cLcgwmEmxfKf/pisvaEJi6k9bAaLhVdwXJeFgiXgtd+mdulGAO3vstZupfiRUq
         KZpg==
X-Gm-Message-State: AOAM533c26TfRLT3z/E+wH3j4R2nIuOvQFrpgUAtmYI1caSLIGiW/ntI
	15Ty7z27GH87K0BGzkU8dAQUInphpIFKIEu07+LScOOP
X-Google-Smtp-Source: ABdhPJzVR6r38/amAeYYYd11CbIf3puIsQnsd5nlKtfBTvA/tZuDg09TWdxVdh00TVgBO6Zz/8V7kXN9INHnYF4jp/M=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr5624027edt.36.1618508108534;
 Thu, 15 Apr 2021 10:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210218094706.23038-1-alex.bennee@linaro.org>
 <20210218094706.23038-19-alex.bennee@linaro.org> <CAFEAcA8micdrGgwyS-20mnGkdpJ3mMnq=MEJJFZCh3XGx0uMbg@mail.gmail.com>
 <CAFEAcA9G-WabAM_EdgMzd0Xv6z8xRYjw57DiEqB6Z_Wbj=X1Eg@mail.gmail.com>
 <87blaflit2.fsf@linaro.org> <CAFEAcA_Uqvc5zyJs8XHWDGR1B_jUZ9jY5EdgHSmaczuOc02ykg@mail.gmail.com>
 <b989ebfe-1294-5eef-53a2-9599421e0069@amsat.org> <6597cb54-44d9-0798-0786-098286001fe0@kaod.org>
In-Reply-To: <6597cb54-44d9-0798-0786-098286001fe0@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Apr 2021 18:34:21 +0100
Message-ID: <CAFEAcA-x-eNaH=JROoSgF-ruWJDC2++qLNxz3ZEtziyUO-3aEQ@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [PULL 18/23] accel/tcg: re-factor non-RAM
 execution code
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: DtRtPon7qr2J

On Thu, 15 Apr 2021 at 18:18, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 4/15/21 5:55 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 4/15/21 4:54 PM, Peter Maydell wrote:
> >> On Thu, 15 Apr 2021 at 15:32, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> >>> --8<---------------cut here---------------start------------->8---
> >>> accel/tcg: avoid re-translating one-shot instructions
> >>>
> >>> By definition a single instruction is capable of being an IO
> >>> instruction. This avoids a problem of triggering a cpu_io_recompile o=
n
> >>> a non-cached translation which would only do exactly this anyway.
> >>>
> >>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >>>
> >>> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> accel/tcg/translate-all.c | 2 +-
> >>>
> >>> modified   accel/tcg/translate-all.c
> >>> @@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
> >>>
> >>>      if (phys_pc =3D=3D -1) {
> >>>          /* Generate a one-shot TB with 1 insn in it */
> >>> -        cflags =3D (cflags & ~CF_COUNT_MASK) | 1;
> >>> +        cflags =3D (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
> >>>      }
> >>>
> >>>      max_insns =3D cflags & CF_COUNT_MASK;
> >>> --8<---------------cut here---------------end--------------->8---
> >>
> >> Yes, this fixes the problem. Do we want to put this in for 6.0? My
> >> feeling is that executing from non-RAM is pretty niche, so maybe
> >> if we need an rc4 anyway, but this isn't important enough to cause an
> >> rc4 itself.
> >
> > Isn't it the default for Aspeed machines (with U-Boot)? (Cc'ing C=C3=A9=
dric).
>
> You need to set the 'execute-in-place' machine option to load/execute the
> instructions from the AHB window of CE0. It's not on by default because
> boot can be really slow with some recent u-boot which heavily trash the T=
Bs.
>
> But this seems to work fine with -rc3.

Triggering the bug requires both execute-in-place and -icount -- did
you test with -icount enabled?

thanks
-- PMM
