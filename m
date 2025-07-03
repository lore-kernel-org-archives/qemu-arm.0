Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp546888dyc;
        Thu, 3 Jul 2025 06:46:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVm7f3cYtBSR1G7b41rMKb8GMzlcPyIaxTFSttt6NP6L6ZYvTGZBSqyIexK0ef8n5kxhSd+DDCJ5jsoDw==@linaro.org
X-Received: by 2002:a05:690c:6806:b0:70e:711f:43bf with SMTP id 00721157ae682-716590aea41mr52853047b3.20.1751550404243;
        Thu, 03 Jul 2025 06:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751550404; cv=none;
        d=google.com; s=arc-20240605;
        b=kUrTr1TR0/MTPMI6RoPCFEhfOIDI+jWRqIyBYI82sJFXfQhOCcfIXYGFWhyZUI6fKe
         84EoctxNEVH9JcjovvjedbDGsX9TO4ZnaFfJn7qyRtJQN5qDYCV8SyM68LQjw5a/VaCy
         mCF1m1t8NSzp8tSv8h/4CmOeM+dt6iRqYKyVzchg95Io8R4AHZxd5QgI6AFUdywIM37V
         2kcU3HF7gRRUB0zBxFaoVDQjhavU+9B3yoKjwLoYQyK4OZKE/O0s6NKrlOS71fj3sniv
         Ip/xbQWPk55EnQy2kIq8fSLpEYOElM9VhAzcIuiGliksvjlsu4b9F7nCbS4MOnXVFhuW
         HD/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=flS6TFeOZvoyt/ARcs3LNzYAUhneQXJ5kq+dG0ggD4s=;
        fh=4odRaPQQ1ehxuOuP0qgy7BPTesDtTwlJGa2wSSMgBdA=;
        b=U7Uu+iaxpC/BswR7ytnbopTrVq+TyJ7XM09FbIhHUHMHD0MHrHg/XaVDhcan+s9lgs
         uCBbj99mua2AIoEEG587TLxjc7nAf3md3KXw0CJ3PKZSM+1feBVjzhThNd9Nej5VBzX4
         5Kc7N4SMOis/Yd32h3CAnHOCrnNrsExnaDpsw/oKRLfIw8oJzZaHqa9xoa3ZaOrqRQ1M
         exkwsIaf41iioLQzI4GgzYCIPbp6keK8ljEJR3ch40LBBB+33CGWUX8XtQP+ZL/SM4Lg
         OgDRXeoLrDZFhhxyCWYIW9Ev2wL+beEc9z4jz4+V3TcHISIP6/OLuYwuyEJFmiYJrFgy
         4JGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mq+NfJzt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71515c03cb5sor90665857b3.5.2025.07.03.06.46.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Jul 2025 06:46:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mq+NfJzt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751550404; x=1752155204; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flS6TFeOZvoyt/ARcs3LNzYAUhneQXJ5kq+dG0ggD4s=;
        b=Mq+NfJztqUeEX55sfCPmVIBUy5qFXaNoXLO5cQdPBDb3KpW9v6LYFhg5L640rWRyl5
         Oi9SpjoviK2hCV1IR4loOELK8tw1DvMBy9Kcjc/I2U2JMzsHDymiFGsaIzvsS3TzrULj
         bS+/k1MZ8OMd4LikhETvi41jksxyG6xSJIauqc20MBmaWq93yF/sHtnz1uSLynXio0LD
         pgo3DMH3uXkIjWEHw91XCaTymPqIdZtekvIgFYS13QvqefmXLQRRzHK9QUIaZleWWGOl
         2ITFtL8nRgFOet9PTTU/7TX4xROC3SJRRn45nkTlejUYot3c3ar1ZwHRSDPAy/nh6G1j
         Dr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751550404; x=1752155204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flS6TFeOZvoyt/ARcs3LNzYAUhneQXJ5kq+dG0ggD4s=;
        b=onxH9n6Mg97QI5LH8BLyg5U2lHE2ahBTy72hpT4P6AVHU+2Qs0wREDgYbvWDaZDmv2
         GuwSlVB6PoElsIwCeqUiFOPeNKmzJINzhcbQWrlacWwG+3CsyWwW3oJbchNoPNM1OokC
         vYfBSeTxlmLAifq3KeQ7yFC00sP9jEVoTGWyNUUxHOWFkSvdrZyI6kuRyOS1eQqrGihy
         IuZu7FX9KvRt1ekN7ucZMCpl/ktrlFNomT6CRpUzcFqaTchr8zre2zl51G/bZGvculan
         PmF6hu/7SnUq7plC8z0i88boVTbhGWaXIqcb9tBu46CkUHM5oXZ6y8nqDGxiTkorR1lB
         JjdA==
X-Forwarded-Encrypted: i=1; AJvYcCVle5/+IEqBNEriHlocRbZlwwoNetVRzF/CvzMnWXMKMcork2n3xJo2tQ2D8j6paIXns832GA/iGUccsA==@linaro.org
X-Gm-Message-State: AOJu0YyX4v3lqbpcDftZftyxQ8Jk2hK8zasAi99GiIREPh4P0HOoZhnF
	XLVSQamkbS5Fere0foL/yiqK9XtK3e9JAkpUgOP/xan+QaW6sXVQ22Z9FTlEnc4IqDb/w0hpJ6V
	Ekq1rYJ4xMEbNnU+nnHpC113W86uGXXhzttT0AMlAHdIO
X-Gm-Gg: ASbGnctBAKMAqYTqOI+M54e5botV9afcguT90QTHf8jgv/w33pvoCS+1Qb4ieYaejPw
	qR9V9DAqFQdPiTwMxVFxb8fj/vnYNycnI/ngGyxbSCEjxfyO3Yqjy3WS440jQRWnjukTl0rHCIx
	FqVpmcJwZ3k8ePEu4und196RLtGulGWieYq9gmN26WsS9c
X-Google-Smtp-Source: AGHT+IEMZm719qroFCgdt+NB/P2u1+uK5R7VzorJ6VDNhLe45GJPibffuoP2EDxqdgaryg7WVzX7vUG/Kw6HwGwMdcM=
X-Received: by 2002:a05:690c:60c3:b0:70f:751c:2d8a with SMTP id
 00721157ae682-71658fbc2f8mr48735757b3.3.1751550403709; Thu, 03 Jul 2025
 06:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250703105540.67664-1-philmd@linaro.org> <20250703105540.67664-48-philmd@linaro.org>
 <364dc354-ba78-47c6-ac65-2c0282e28733@linaro.org>
In-Reply-To: <364dc354-ba78-47c6-ac65-2c0282e28733@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 14:46:32 +0100
X-Gm-Features: Ac12FXyjoUMUshc9DoTiWVwetwZ0Q9yjCJVVjro3qKCKC9YYLxR5jkB-AbTrEyo
Message-ID: <CAFEAcA8-ucEJPgVLpBfNyMo8ax-sR6iYr5Zk4DJavYaOkQnfDA@mail.gmail.com>
Subject: Re: [PATCH v5 47/69] target/arm: Use generic hwaccel_enabled() to
 check 'host' cpu type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, kvm@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ApI5XgolzuEQ

On Thu, 3 Jul 2025 at 14:45, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 3/7/25 12:55, Philippe Mathieu-Daud=C3=A9 wrote:
> > We should be able to use the 'host' CPU with any hardware accelerator.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >   target/arm/arm-qmp-cmds.c | 5 +++--
> >   target/arm/cpu.c          | 5 +++--
> >   2 files changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
> > index cefd2352638..ee5eb1bac9f 100644
> > --- a/target/arm/arm-qmp-cmds.c
> > +++ b/target/arm/arm-qmp-cmds.c
> > @@ -30,6 +30,7 @@
> >   #include "qapi/qapi-commands-misc-arm.h"
> >   #include "qobject/qdict.h"
> >   #include "qom/qom-qobject.h"
> > +#include "system/hw_accel.h"
> >   #include "cpu.h"
> >
> >   static GICCapability *gic_cap_new(int version)
> > @@ -116,8 +117,8 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansio=
n(CpuModelExpansionType type,
> >           return NULL;
> >       }
> >
> > -    if (!kvm_enabled() && !strcmp(model->name, "host")) {
> > -        error_setg(errp, "The CPU type '%s' requires KVM", model->name=
);
> > +    if (!hwaccel_enabled() && !strcmp(model->name, "host")) {
> > +        error_setg(errp, "The CPU type 'host' requires hardware accele=
rator");
> >           return NULL;
> >       }
>
> Consider the following hunk squashed:
>
> -- >8 --
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-feature=
s.c
> index eb8ddebffbf..bdd37cafecd 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -456,7 +456,8 @@ static void test_query_cpu_model_expansion(const
> void *data)
>                    "ARM CPU type", NULL);
>       assert_error(qts, "max", "Parameter 'model.props.not-a-prop' is
> unexpected",
>                    "{ 'not-a-prop': false }");
> -    assert_error(qts, "host", "The CPU type 'host' requires KVM", NULL);
> +    assert_error(qts, "host",
> +                 "The CPU type 'host' requires hardware accelerator",
> NULL);

Grammar nit: either "a hardware accelerator" or "hardware acceleration".

-- PMM
