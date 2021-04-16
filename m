Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp520654lfr;
        Fri, 16 Apr 2021 09:06:56 -0700 (PDT)
X-Received: by 2002:a17:906:e949:: with SMTP id jw9mr9409898ejb.433.1618589215995;
        Fri, 16 Apr 2021 09:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618589215; cv=none;
        d=google.com; s=arc-20160816;
        b=z3qgzmaUS3HZGZscx90gwlN9HMW3xVNrJiIIK8V0x7Rvna86nuZveoVAeLxgdskPYp
         vugnJa0WKeiZhzOjjUk6W1hq1niMX3I6rKgmCxI1IHmSGqAjjv4Co2Z/+hFdd6APLcNz
         SbdnII6JLWzeHy5k+5Tx9/mflxu/Nm9EPZ2R0aJSrX5bSiN2qYeoJtFarCVA5+d4Qk7L
         /ELcW9PfZ6UfiSJ26ibrnMWE/i/OpQvWdZhOudN27UFi7I5OT4bbsfeqgQT4yz6Gfe7A
         E8TIN3qwJTHJnPwD/BEsGcVWgkxb9Of6JSUr59o5YTwmHCmFAiWkvaxBFmWDMahP0jn0
         PbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zoxxo4HldSkZ1gqc5kBkjBHOS87a3eWa93bTMsHIzUQ=;
        b=tHU5+3fYiVIv+S7RAddAUxh5DDK1cJrhhyibkXKQkNn2kdsP80bhNDboJLlO+oc7az
         AtlZ7A4QvaSFhwtP14bJB3Or1qqbpG3BYuS9xzfgizh2Hmm3r7wsDzu8tvvjLXIRhkqK
         1/1V1dZxzVjQlC6u7wZdBwrgQ5gyXG4vxlJvw9dLqsy3V0dbb7fO6XiEcZS7pYm/F4ty
         q6UwWwh9Gae0Afs4ekLlTJBSj/9ks9MNwgVa21jXb8A/+0Mepn7x2+X0CxjsdEzT2xQL
         HdrjuDPtgnkWkoUmyiwE51eeDsTn+CxM5iR024SResCHKjLdyYocTngmOB+mJ3AAiihf
         MRgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yifA/OMm";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r11sor3955678ejj.44.2021.04.16.09.06.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Apr 2021 09:06:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yifA/OMm";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Zoxxo4HldSkZ1gqc5kBkjBHOS87a3eWa93bTMsHIzUQ=;
        b=yifA/OMmcEzdBZt/LMxb1W+foc2mE4Vh9rzla0deE3gQ5T2LCfb/SBYZcnb+YDot7P
         p+mQGROEbNMTYa8r1FirmKI6WzUhkqhK5hEPH6Eb8KSDhH2UjfFDrj7LsVMoJZ1EA9Qs
         lyjIhnm+NIImmWQRvmw0MjbmipXUf9zxAPkL/hYhB3Kh4o9cT/XE7cYB2FdUpPCFbiId
         tAHtWoZYd4tblqCWmdeK3J6BBg7/TEN1qufO+0VOLbMMbWakto0J5cruTFwmv44oklP1
         5k358cwOFUCdBccx1gXbNr0INHxo894QfyXzzqhU6prbf0rS23wqd2G4nerFJBNZ3F/R
         XyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Zoxxo4HldSkZ1gqc5kBkjBHOS87a3eWa93bTMsHIzUQ=;
        b=iPzcH2VXD8rs1hXM2tRiWvmaq6SjpNQVr1UkyfZIjxTey/GRgoksjGoOdqZ8ketvqL
         6OnxjbY6T0llOa76Wpj3dndTFgcP8FTU2Zt49bOJ7ETUqP/uwdlAUDKQ4iAw7L/vEa76
         Q+/ZLUtXJfwXAEjDaR8qYy1fMDoZaQ5TTVAKITzTnm9aiN09HaEx4jkhUOePWJqvmqYR
         cF43Q6rGYCBNaJOgjTq6XPW3lOR3zhv4mAUb6Ho4xe0GT0pIS6eGgx9XJ3kv6V8m92Tu
         cxxulxHbirq1+yV6lmqko9j3auJjIk9wPTLvXVUhxhStSNELKloT8ycK9gzhZFaK5vEE
         LazQ==
X-Gm-Message-State: AOAM530/YrtGZ6Pw/Dqx6wnChoFsRkIq8t4Tl+hT/MgPXHtAfhhD6zGA
	sbhhI7VK7+/ExHDvojktBwgp5Mq2GvIUtSFxhPtqVCDm/GYWiDkH
X-Google-Smtp-Source: ABdhPJwM2ias87249zz9diZ1jelihuM3AL1UkkBjIGsz0UTnljHe/ohRsAbgI6wKqivqxI65zjBnI338PWsXTxv3btk=
X-Received: by 2002:a17:907:629e:: with SMTP id nd30mr8995333ejc.407.1618589214863;
 Fri, 16 Apr 2021 09:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210416154908.21673-1-alex.bennee@linaro.org>
In-Reply-To: <20210416154908.21673-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Apr 2021 17:06:06 +0100
Message-ID: <CAFEAcA-kO0Zs8eDQHheJyf2Top9GWYTW66XUw_aknx2DSYtf4g@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: drop CF_LAST_IO/dc->condjump check
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: nN+UT+ErTR+0

On Fri, 16 Apr 2021 at 16:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This is a left over erroneous check from the days front-ends handled
> io start/end themselves. Regardless just because IO could be performed
> on the last instruction doesn't obligate the front end to do so.
>
> This fixes an abort faced by the aspeed execute-in-place support which
> will necessarily trigger this state (even before the one-shot
> CF_LAST_IO fix). The test still seems to hang once it attempts to boot
> the Linux kernel but I suspect this is an unrelated issue with icount
> and the timer handling code.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: C=C3=A9dric Le Goater <clg@kaod.org>

Here's some expanded text explaining why this is safe to remove,
which I think would be useful to include in the commit message:

=3D=3D=3D=3Dbegin=3D=3D=3D
The original intention of the cpu_abort (added in commit 2e70f6efa8b9
when the icount stuff was first added) seems to have been to act as
an assert() to catch an unhandled corner case where the generated code
would be something like:
    conditional branch to condlabel if its cc failed
    implementation of the insn (a conditional branch or trap)
    code emitted by gen_io_end()
 condlabel:
    gen_goto_tb or equivalent thing to go to next insn

At runtime the cc-failed case would skip over the code emitted by
gen_io_end(), leaving the can_do_io flag incorrectly set.

In commit ba3e7926691ed33 we switched to an implementation which
always clears can_do_io at the start of the following TB instead
of trying to clear it at the end of a TB that did IO. So the corner
case that this cpu_abort() was trying to flag is no longer possible,
because the gen_io_end() call has been deleted. We can therefore
safely remove the no-longer-valid assertion.
=3D=3D=3Dendit=3D=3D=3D

> ---
>  target/arm/translate.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 62b1c2081b..7103da2d7a 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9199,11 +9199,6 @@ static void arm_tr_tb_stop(DisasContextBase *dcbas=
e, CPUState *cpu)
>  {
>      DisasContext *dc =3D container_of(dcbase, DisasContext, base);
>
> -    if (tb_cflags(dc->base.tb) & CF_LAST_IO && dc->condjmp) {
> -        /* FIXME: This can theoretically happen with self-modifying code=
. */
> -        cpu_abort(cpu, "IO on conditional branch instruction");
> -    }
> -
>      /* At this stage dc->condjmp will only be set when the skipped
>         instruction was a conditional branch or trap, and the PC has
>         already been written.  */

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
