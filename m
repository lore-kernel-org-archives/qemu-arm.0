Received: by 10.28.4.212 with SMTP id 203csp2716263wme;
        Mon, 16 Apr 2018 07:29:55 -0700 (PDT)
X-Received: by 2002:a9d:3323:: with SMTP id f32-v6mr11257505otc.221.1523888995407;
        Mon, 16 Apr 2018 07:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523888995; cv=none;
        d=google.com; s=arc-20160816;
        b=iC2XLzFOGrJsSQx43FpGB5ngAKZm2t2uil29Oeyfmy88N9Gzo9dpsK0JRMLzXB8J/Y
         nSaRkfPN6ewqIi1j2I4ochO5XfOIwIHIHfjdCPnQmIuZZUW1hipQhqeOQcG1R/cvOUvT
         0H9kdBdIHuQrrQIbD2LbN60PnyoQ/U+fdkB8DFNNh5WS/VvY0st44tWHTnAs7FsNyoFB
         pdcjHyVIeMgFyu7gXB8H29FWf8h8nocW5dhJcOYqYzE3EnAF7XetAFwvGZxsHEecxuuc
         W/f9cT3zoKh/b40ssskwhUHvsh9+DHBgwPgGjdsd7+5h3Xb45aeLVCpDcRW7AewroXFB
         NuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=JIlnAIYxXuatoKQGKa3XssMMJ/ixVvXYsAkiPK01WrI=;
        b=GlGDGkTJDXhgeno7jVAl2fEtll8/Iu6ne7pXstruZL2YECVXVcrdch+lMqgEGCzcP4
         W4CzkVdFSDYvp2kgHeCA3G2FfBowoviiFy1zT+rusqQMY0sm9FzvKoMxvUoLyVZB95+C
         JCRvPpqtW3RO+AEU53dcbIDSgqUKaW3f6DD2AGsIpOHw/yNAqlbyulB6RwyVFHrz3CpB
         AAQob1zktsnzds+06mCE3M9ub7roOGe9l7hYr+6K4e8gigwHxoXqZaViSCHmilr7Och7
         3Sxm6w9B3kc5fsmTFYsV7ueG46S9KVXqQm+0S7sUZ7zoZ1BwoVKPRL7hDtRU4nJ5JdNa
         V3bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I4gmHISC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i10-v6sor5167683oik.197.2018.04.16.07.29.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Apr 2018 07:29:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I4gmHISC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JIlnAIYxXuatoKQGKa3XssMMJ/ixVvXYsAkiPK01WrI=;
        b=I4gmHISCIXuE8uzwME/AEQc8ptvdRpcw+pK8KGMEJgwJh578rVqwMw19HK8F099MQp
         C8RZ7RCZgTmjz12M6zIzjW4lC1bnSyfc8xpDMS9nGcRRky7AMUyoZwghPkCeKZIVAILk
         b1NWDfIm8qr80xo7zdYFxfmDBL9iqvAXcjqvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JIlnAIYxXuatoKQGKa3XssMMJ/ixVvXYsAkiPK01WrI=;
        b=NPgIRirbBq9H+eJld3sgiGy7W/XAmUvbV6Z5otp6HPA+FRJzwL31qrfpaWEeAfFG9W
         BhHTMgvJVCd54WJpi4E3O9lvTsrcKUteWn+LZNIMwY2GY7yofTsCz2KB8UA+QtKw+nXz
         IB+CK7qrBWPFU/QWnWMc6jRfApsOwJsroMQLrdA6fOnBlSI6bHoX/jGfdAHqbXWQuSrR
         viow8lLy6J2WyqOsoS6x7l7bx3TFQQO8IVZ6J1mcMr+mYMBPa2jJUQoNwa4IwnaXYB0N
         /JaKMG1Gek8ddnuVLo3L+jbWdRugZWu4Su9Pd5Q1DNRkwBuovklV/BeEV78DVvVGJvTc
         x4Qw==
X-Gm-Message-State: ALQs6tBmjIBiv8JfC3sIRNKO7s+YTTGvDzlkq1Bm7WXDx69Tz/JDmi/Z
	BfRZJczq7l6YnAB+yijHEA80S7tgyD6L1QPNW5zwzRcYqMg=
X-Google-Smtp-Source: AIpwx48vdVNgPbDSQB7CDpamz4RveYfYjpDhLhTq2o+wNZ1+lXJhMqdmqdloY1t+EbuCiqwhzdToWmSpnc8+bZCS4+g=
X-Received: by 2002:aca:43d5:: with SMTP id q204-v6mr4914500oia.80.1523888994886;
 Mon, 16 Apr 2018 07:29:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 16 Apr 2018 07:29:34
 -0700 (PDT)
In-Reply-To: <20180416140322.904-1-alex.bennee@linaro.org>
References: <20180416140322.904-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 15:29:34 +0100
Message-ID: <CAFEAcA-1GVMOSJVQ5p8+qpo8P-+fBq0-6TaA2mdvLDbk3fiihg@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: support reading of CNTVCT_EL0 from user-space
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, takeharu.kato@linaro.org, 
	Renato Golin <renato.golin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 74mRCkuUE4a0

On 16 April 2018 at 15:03, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Since kernel commit a86bd139f2 (arm64: arch_timer: Enable CNTVCT_EL0
> trap..) user-space has been able to read this system register. This
> patch enables access to that register although currently it always
> returns 0 as we don't yet have a mechanism for managing timers in
> linux-user mode.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/helper.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b14fdab140..8244badd63 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2121,11 +2121,25 @@ static const ARMCPRegInfo generic_timer_cp_reginf=
o[] =3D {
>  };
>
>  #else
> -/* In user-mode none of the generic timer registers are accessible,
> - * and their implementation depends on QEMU_CLOCK_VIRTUAL and qdev gpio =
outputs,
> - * so instead just don't register any of them.
> +
> +/* In user-mode most of the generic timer registers are inaccessible
> + * however modern kernels (4.12+) allow access to cntvct_el0
>   */
> +
> +static uint64_t gt_virt_cnt_read(CPUARMState *env, const ARMCPRegInfo *r=
i)
> +{
> +    /* Currently we have no support for QEMUTimer in linux-user so we
> +     * can't call gt_get_countervalue(env).
> +     */
> +    return 0;
> +}
> +
>  static const ARMCPRegInfo generic_timer_cp_reginfo[] =3D {
> +    { .name =3D "CNTVCT_EL0", .state =3D ARM_CP_STATE_AA64,
> +      .opc0 =3D 3, .opc1 =3D 3, .crn =3D 14, .crm =3D 0, .opc2 =3D 2,
> +      .access =3D PL0_R, .type =3D ARM_CP_NO_RAW | ARM_CP_IO,
> +      .readfn =3D gt_virt_cnt_read,
> +    },
>      REGINFO_SENTINEL
>  };

CNTVCT_EL0 isn't much use without CNTFRQ_EL0 which tells
you how fast it ticks...

It looks like other targets use cpu_get_host_ticks() for an
arbitrary time-counter thingy. Not sure you can get the frequency
for it, though :-(

thanks
-- PMM
