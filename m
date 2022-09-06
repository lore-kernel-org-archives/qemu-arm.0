Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp3171793ejh;
        Tue, 6 Sep 2022 13:18:24 -0700 (PDT)
X-Received: by 2002:a17:903:2406:b0:174:f1c8:76bc with SMTP id e6-20020a170903240600b00174f1c876bcmr197826plo.168.1662495504361;
        Tue, 06 Sep 2022 13:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662495504; cv=none;
        d=google.com; s=arc-20160816;
        b=KHqz9DkKmxmO3NAZEPSPNkRbcxYtTi1VD4k03zd1LgrSc9TJTYyPFadnbNjo/UFj4L
         QACKr3t7TVduoVO9qcvYC1ULyN6KT4XKrUy1X2vZyY+7hAhSvqRWqVlUg4NjUKokQodS
         5Beb5AcoW9TNo5e5rAj04v1SWaGTg70hP70rFNx6YvHbrSYcMImg5I++b85RcRLWW7IX
         uR8PcHc7XpM20n34EnwVcMqdAXPJqWU9SDEdmTR935W2U93gEgW+PZvVKqb9rLyHpj5W
         We/qXpw8+CR1CrKkEHo1z3hYNtjEBFLocBMJbvbwqH6TDg3i45FsOWrX7gxCH38gax6J
         UIlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/YxiTg2Y6r3+thsfbPvWqS+5O+fxjOgLKEFsE1+gNSI=;
        b=vGdUrTXmFBEakRdeH5SpYvm1fQZHVi/S/mJyG3SudmwYIowaYDOUPIVVHZaJc67NQx
         yHf5XjbPY9dxKeOYXCvRNui52s20P8VcS9n3KM5WNFMalNhpfMhIdhVZ26QjWXBlXEt2
         98EqLdrS1HE9K+cuBufn/g8vnjGvet35dpZblIQyMan1Ow1TfF/hbIv62NH8mmDygsv3
         yy7l5eSUqskFH1H2PpxmL25Kl6pfHl4gtbHqJzotIUhP/s9BZptS3k3mJVuG9yw3PyEh
         RB3SyCgZ6tGc09IgHj2EPy4IjIIkj4THB759NXGxgZZMDGQsYD/Y7zA6GAJfUwErDdMm
         Ub5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uL+fQgVE;
       spf=pass (google.com: domain of anders.roxell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=anders.roxell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <anders.roxell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e24-20020a63db18000000b00429f4f47d57sor6385840pgg.63.2022.09.06.13.18.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Sep 2022 13:18:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of anders.roxell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uL+fQgVE;
       spf=pass (google.com: domain of anders.roxell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=anders.roxell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=/YxiTg2Y6r3+thsfbPvWqS+5O+fxjOgLKEFsE1+gNSI=;
        b=uL+fQgVEDu4MRlQ0u8cbG281G+tvyc/X8iPKz7EGN421EBcTZbTf5dWXejAfWZEAYN
         1U3F6Sbj/RIp/P7LKzxfX+WV+aieO23eg1alUEeENM2xoOgCX+FsUuq84eBow49MWeFr
         ccA95NTnBRQ06/Kle+y8LReNsC610ZQvGVOj1MjH2Vt3c7zzMT9D81uj5sHL0PE1COwI
         1x+RS5p6UefNDdJuHl+3sirXM2guRLHTAYuyRtxPXhfZFd4s9pmLBtTgtl1RdhUttmPp
         8nkKxCu++QsPZQEi5vUrIiY2cjrk2v8kHpRbVgg8/WXc8d09eBrqAP50cKdwCuMbInsA
         9hqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/YxiTg2Y6r3+thsfbPvWqS+5O+fxjOgLKEFsE1+gNSI=;
        b=2g7YTuGvKCJLF48OU3LnPu14Ue0+BYdgff5oWZNdN87LfEjrHpBYT1kYd6Ktc9RPa1
         qWGFXf8far2F6pGjB7h8Bwn3WGbI5nzvCiOQuXlBYr/8qjnqolqRnfshuaR5u+yyDEZv
         Z+EfXdCTyKQDSgvQ73GGmWZ3fSCftgXyMfvLrJdxtrCi8AoxSwjzeNRki05Cwiaa7rsd
         qIOGCAMMHBBldtW5FxuJoaBcUpKC/gY8YzaPzlt2ADkao4B7QYsRNaYWYjwinsHGkhMH
         PXqAbaYGZ8uz74HhcVQk1A7oR8/za3BlImjlVAP3kIPF/3OALRQNh9Dmu9WC5VNZOwnV
         Ci/g==
X-Gm-Message-State: ACgBeo1C++jTQMta3rl2Q8omr3RspnNBIn4s7uyhyYqqobpz6m3EBTtk
	bDdyCE8RaY9XbPFmplMUBtwfBNGCU3Ll76XhkIXq126bcIXOeQni
X-Google-Smtp-Source: AA6agR6fMAF7Zguaa+BET1ao/WK9IgTzwkxBBX/Jo8KhPB9FsxFqblriqgvezh5xaBHHYmhVAKh5Zbuh5jUi9FnyRF8=
X-Received: by 2002:a63:e516:0:b0:434:9462:69cd with SMTP id
 r22-20020a63e516000000b00434946269cdmr268765pgh.503.1662495503821; Tue, 06
 Sep 2022 13:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220906172257.2776521-1-alex.bennee@linaro.org>
In-Reply-To: <20220906172257.2776521-1-alex.bennee@linaro.org>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 6 Sep 2022 22:18:12 +0200
Message-ID: <CADYN=9LQe1793vWY8agasHSLazFVkMkLPOLOApxDBdXpYtOGfw@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: update the cortex-a15 MIDR to latest rev
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Arnd Bergmann <arnd@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: cMkNXW1cFJTo

On Tue, 6 Sept 2022 at 19:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> QEMU doesn't model micro-architectural details which includes most
> chip errata. The ARM_ERRATA_798181 work around in the Linux
> kernel (see erratum_a15_798181_init) currently detects QEMU's
> cortex-a15 as broken and triggers additional expensive TLB flushes as
> a result.
>
> Change the MIDR to report what the latest silicon would (r4p0) as well
> as setting the IMPDEF revidr bit to indicate these flushes are not
> needed. This cuts about 5s from my Debian kernel boot with the latest
> 6.0rc1 kernel (29s->24s).
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Arnd Bergmann <arnd@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>

Tested-by: Anders Roxell <anders.roxell@linaro.org>

> ---
>  target/arm/cpu_tcg.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 3099b38e32..59d5278868 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -588,7 +588,9 @@ static void cortex_a15_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>      set_feature(&cpu->env, ARM_FEATURE_PMU);
>      cpu->kvm_target =3D QEMU_KVM_ARM_TARGET_CORTEX_A15;
> -    cpu->midr =3D 0x412fc0f1;
> +    /* r4p0 cpu, not requiring expensive tlb flush errata */
> +    cpu->midr =3D 0x414fc0f0;
> +    cpu->revidr =3D 0x200;
>      cpu->reset_fpsid =3D 0x410430f0;
>      cpu->isar.mvfr0 =3D 0x10110222;
>      cpu->isar.mvfr1 =3D 0x11111111;
> --
> 2.34.1
>
