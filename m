Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5045979wrv;
        Tue, 6 Aug 2019 03:00:14 -0700 (PDT)
X-Received: by 2002:aca:6044:: with SMTP id u65mr1829291oib.25.1565085614077;
        Tue, 06 Aug 2019 03:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565085614; cv=none;
        d=google.com; s=arc-20160816;
        b=mmNE+j3Q6j+0nFKBHiXmV1NkvZxMbXu/rzaUFwCx4gBy8yuGB0HNzRoSU4r9lr7dgO
         B1x3EiBs4xPIgBPSKfeFY9Jv8sOVZjqhm73vtdGFX32DRK3OEefuFSiGHXwtdAfv6y93
         q8ve3adj5kV3BvRnM7c9HLlqeGmt5Ozd/u+fezL6YR6ne+eGg/DN8HqoaT6adKLinvZu
         5AXHMakS/ljCF74sdiFHmvA4qWo7TnsXnsR4cVBfvTefzDjW9gwunoOy+aTJKErN00Fl
         qGcizdzmDwPfz8KWJePVA+ysCRz0mf2wcoUjKqKyy+DYBCZxLVPP1VxfIbifI7iizIHG
         wVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xQ9rvOA4yllu34jtpdFTkP3+LnU6bZ5qPXS670owBSU=;
        b=mhCeDOZm1VxbdBQWc12pIQDrb4Ci8WCPaG+sB5tOjm1O3/Eq0S/jDOCNas4KCJDswO
         Q3qkGS7BN0tsFzAumLVtOc935+cAiiQhHpudr/QCKGol5ldRCXsBXEZ3KvfejYkhgB9F
         ky8Pc7/DJZHQrmZxTIDB7ohuVVvka+s7HpzCV1M74mzr4U4WFaGKSx5cRSG/xEHP8uac
         WiSMFaz8QFcJSBQDL7+O82ldebcsQEi8hkqvx+mhz9Il/6WzXw4M2xdmkugSXRUlm1uU
         xhaJisdDWAacP5tpAjdm71CVCqT6qEYK7Sl6osE+abH1I8JTj+YkzdRyaWBXNrg9jKXF
         /dag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A4bSsgDw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n191sor39626636oig.148.2019.08.06.03.00.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Aug 2019 03:00:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A4bSsgDw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xQ9rvOA4yllu34jtpdFTkP3+LnU6bZ5qPXS670owBSU=;
        b=A4bSsgDwGdLXvvBrIrUF8zO060rddgpaM5bUEW4IZuraj7dpvhtesrdZ+nV31JXpYY
         9roDFpcintRFriFmq9zAtsQtyMjxG/Cpn9yW1+UXN1LSfOKdUTvNHiRyblSBSqdhUeGI
         bZi/sZEGXtANhbrNIum2mzG1nxXjd9NquOKWDvD5sSBjwsoVZPCTxYOqJJVt8KSho9gB
         Y7QlRSpPQKllkv8kNKAVrhjEfkN+YiiPAltBukPg+xgnofpExf1JEzCowpB47c/55TAL
         1ra1fX/BqB1CIwt9AZKZnhy3HIT1N5Ao5GY7FPORl6JqLy/yyKDqCbM5jyuEa+ztDFf7
         Tp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xQ9rvOA4yllu34jtpdFTkP3+LnU6bZ5qPXS670owBSU=;
        b=p5UBzEIxmt/dOLH1BJwmj/YL5e7S7I3GI2BQByEJ/nArZV2zvu9OG2mY9Bij9m+Voe
         OvYDny9HXhr3MnMsOMbWLgWnPHwpzDEd4Sb/oDifud4BLH9b9pvCKahpAedB9q/xmD1s
         3xCdCKmaPgZ6rgqaTbxDILT2VN6mxRQP4hnFfimoozIaxQfnf0kIAu3kAb8423WyZOM3
         fr+EybhCa17oDMz/AU+/4sfvbJQx5Eqt+22MNgLuODHh7qKq+l+6jI0l6pTP2kLnGb0I
         sH+gf8y9xiGIdGMhqX9QdUaLm3z2FXLOKvrkHvwl96Vy5mqNG17KBTrZP23Vr/+VYtjU
         CZ9w==
X-Gm-Message-State: APjAAAW8JG/2bfg/acQ0oEVzq+WWIbn/oVgbjD7qhcMd35EKlMaG5va9
	E+Gb2t6Dv1RsFZEG1AqY3q9PSKjYVdpiykp6dxsQ7I3UIPk=
X-Google-Smtp-Source: APXvYqw+2Uxt4JSnPwPPQlJ202JF81PmBI8uuAXbbcBcCVVdTrSqzJoKv5AGSXJvH5pdGgDtpOi6Jt7dIRxCI4kig+o=
X-Received: by 2002:aca:ac48:: with SMTP id v69mr1073152oie.48.1565085613691;
 Tue, 06 Aug 2019 03:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-7-richard.henderson@linaro.org> <CAFEAcA_kmuX6bxR50eU_3nTdRcjON2nVTqVWiRamSRe6jui3ig@mail.gmail.com>
 <09b930e2-0a92-25a3-4e26-8bea1f437039@linaro.org>
In-Reply-To: <09b930e2-0a92-25a3-4e26-8bea1f437039@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Aug 2019 11:00:03 +0100
Message-ID: <CAFEAcA9yQQSYnwEeSNbx4P94deuG5v5fKs7gW4VgG7LFzBX03w@mail.gmail.com>
Subject: Re: [PATCH 06/67] target/arm: Introduce pc_read
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: TyvLbxl4cKgI

On Tue, 30 Jul 2019 at 01:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/29/19 7:05 AM, Peter Maydell wrote:
> > On Fri, 26 Jul 2019 at 18:50, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> We currently have 3 different ways of computing the architectural
> >> value of "PC" as seen in the ARM ARM.
> >>
> >> The value of s->pc has been incremented past the current insn,
> >> but that is all.  Thus for a32, PC = s->pc + 4; for t32, PC = s->pc;
> >> for t16, PC = s->pc + 2.  These differing computations make it
> >> impossible at present to unify the various code paths.
> >>
> >> Let s->pc_read hold the architectural value of PC for all cases.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>  target/arm/translate.h | 10 ++++++++
> >>  target/arm/translate.c | 53 ++++++++++++++++++------------------------
> >>  2 files changed, 32 insertions(+), 31 deletions(-)
> >>
> >> diff --git a/target/arm/translate.h b/target/arm/translate.h
> >> index a20f6e2056..2dfdd8ca66 100644
> >> --- a/target/arm/translate.h
> >> +++ b/target/arm/translate.h
> >> @@ -9,7 +9,17 @@ typedef struct DisasContext {
> >>      DisasContextBase base;
> >>      const ARMISARegisters *isar;
> >>
> >> +    /*
> >> +     * Summary of the various values for "PC":
> >> +     * base.pc_next -- the start of the current insn
> >> +     * pc           -- the start of the next insn
> >
> > These are confusingly named -- logically "pc_next" ought to
> > be the PC of the next instruction and "pc" ought to be
> > that of the current one...
>
> Yes, well.  I don't quite remember why "pc_next" was chosen for this field.  It
> is the "next" upon entry to tr_foo_disas_insn().  Often the target will
> increment s->base.pc_next immediately, so it will also be the "next" insn
> throughout translation.  Though that isn't currently the case for ARM.
>
> Once most of the uses of s->pc get moved to s->pc_read, it might be reasonable
> to rename the remaining "s->base.pc_next" -> "s->pc_orig" and "s->pc" ->
> "s->base.pc_next".  Perhaps that would be clearer, I'm not sure.

Renaming pc_next would be a cross-target change, so let's put that
on the shelf for the moment. Maybe just put a TODO comment to the
effect that we could consider renaming in future ?

Or we could just copy s->base.pc_next into s->some_field_we_choose_the_name_of,
eating 8 unnecessary bytes in the DisasContext struct but giving us a more
uniform s->something for all of the different PC variants rather than
having one of them be in s->base.something.

thanks
-- PMM
