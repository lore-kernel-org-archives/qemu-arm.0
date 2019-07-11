Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp728346wrv;
        Thu, 11 Jul 2019 06:21:22 -0700 (PDT)
X-Received: by 2002:aca:5d84:: with SMTP id r126mr2352485oib.28.1562851281870;
        Thu, 11 Jul 2019 06:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562851281; cv=none;
        d=google.com; s=arc-20160816;
        b=JgHGyTWlKpbJxMxOluOxqwu2wuJDk/KmjAox8RJexV1X6J5VzNju88jjUH3KrZfPae
         owh1MGK8ya3TCPTknZhjRGYBSH6anTqmTzIyXIym8BT+yCADd/IM8IUu1ibEPcYX/9Pg
         b0VdiryjAWdlwAQfh9Zs8GTcx5hrIJHAIFUbM+IoeDo7YZFuGLLXS63Hm4HKq6YMcs9Y
         oILQNTFW5Uva3PmX8zDrPVFKu+aWQSFw1canh1PPfe1lsF4u5e8CsYANu2EmXMX5AFG1
         3UtaqZzBKufHtuYvkDfJS8J3nvS6HuqX94YSW9E6Aq4x/5Y2DZMLen5qX0JcQoiOlKgN
         5tcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=92ellZOm05UMkS5hSEgbchKPqTqBtjV0iybFNfwJX/8=;
        b=Fi3iiVTWHJ68z22JLEjn/LJik081GShBeIvf/bKGL1q41lTZFuBGpOmlzgV1l6Jzvv
         ZzNGcpwSfUAUinYUw2sEellC5K4++IoSJx4M5dqAtfPpYeQ0vC3NUk31+KLpvm+18aYS
         8paG2Asuby4bj7HFKlnRcn1EmGnrid22Tb26UjrBFftinboeEs/befwR33CMnLXVTves
         kaeBSFwbegUyTBHuwcOjbE9ehJsRUdD3aDR7tYlSTv6693ytcKtpjoCu/G7UqLbhCJXA
         RkXCketp/ms7VQurHAqx1awakFrjPxM4WGA30QfkJcFHjUhGSQhqNuXw5yh26wv1gQI1
         7SgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WDf9XjTq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 40sor2850509otj.175.2019.07.11.06.21.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jul 2019 06:21:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WDf9XjTq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=92ellZOm05UMkS5hSEgbchKPqTqBtjV0iybFNfwJX/8=;
        b=WDf9XjTqwsKHeTf3x8tmX4xoKv6mf/UquKFlRXCcRO7jMxSZMdp2GQ7JAU0buBMC+R
         I2WaDyNS2eBH2z49HCgPekB9Ith2zbYzdw1POkwcRch0de8q6K+vEQaueBSNEluT4Lsy
         ctLhxHoEdPeZpamWFqH998tn+WdP8QpQRu8My2I6UZaFT2APyO/ZqK6sfrdEZ+DTr57V
         Ra47cDKcQdUuy4OBAYeUicjf0IdogX6CUoS9yJmiP0KLJF0eB/DqbYtKAAu6SsEPhANF
         jGuwLigiTeuVEMk5bPD9ux56f3u2c5esN67gge6xLk6zdASCA6CBDgUxNhdXzf3I0snR
         IE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=92ellZOm05UMkS5hSEgbchKPqTqBtjV0iybFNfwJX/8=;
        b=jrJVTNpmiCT7w7n8rpLEjPEPvu4k19ky3uYdZrSbB5sJObo/za+Hj7tx6KsoS2XjZ3
         fPMyjGK4BG+7SZkkxUuUTdQ476oP/EusE6KquTifbW1rCJwPu5Jlw0RUTWblmYTUPYYJ
         /ssABNZ7PjUuMwcdTn0yGgAjKBkUoQuub0OAyEPwRj1agR5HkasSN9J17Gji6T0liVHT
         kPyic2k0RAeOUnP1QJxOq4J1mMFRFkAYgA0qFkGP1DAbNykKiYYwGpYZauIsvsNTV/B0
         RSdAPevrX71fxaWkuqMHU/UdkILJ6zlf6ApyFrwemwsWwasePlMEyZj+s5LLBgijsBc0
         PnQw==
X-Gm-Message-State: APjAAAUlMJDAxa4PoJxy0KpthPLbSg3bJvpeStYP+nNpfr+dUC8rcSQQ
	s60u0YJDfM2kgbpJX/4hehqcTcFFQJkP3NTbudTzI9qiuDuoxQ==
X-Google-Smtp-Source: APXvYqxqkLZIlHPsf1zfx/MZTTlqWqYqyOm0OqmQTBT52CrMXrLXfB8XzYhOpLH0Ai7NyZOE5XuxSDK8GcU5t8YcGn4=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr3475889otn.135.1562851281128;
 Thu, 11 Jul 2019 06:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190710131325.21442-1-alex.bennee@linaro.org>
In-Reply-To: <20190710131325.21442-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jul 2019 14:21:10 +0100
Message-ID: <CAFEAcA_NsoUcOC3Xq4gZNS=J0egnvmgxcaiLUwNGFNtFt1OFiA@mail.gmail.com>
Subject: Re: [PATCH for semihosting-tests 1/2] semihosting_tests: include a32
 and t32 hlt variants in all target
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: zO1pYZNV4Ban

On Wed, 10 Jul 2019 at 14:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> While this would likely be triggered by "make run" we should also
> include them in the default "make (all)" build target.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 1fea97e..7ad2512 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -60,7 +60,9 @@ QEMU_SYSTEM_ARM =3D $(QEMU_BUILDDIR)/arm-softmmu/qemu-s=
ystem-arm $(SYSGDB)
>  QEMU_SYSTEM_AARCH64 =3D $(QEMU_BUILDDIR)/aarch64-softmmu/qemu-system-aar=
ch64 $(SYSGDB)
>
>  all: usertest-a32 usertest-a64 usertest-t32 \
> -       systest-a32.axf systest-t32.axf systest-a64.axf
> +       systest-a32.axf systest-t32.axf \
> +       systest-a32-hlt.axf systest-t32-hlt.axf \
> +       systest-a64.axf
>
>  usertest-srcs =3D usertest.c semihosting.c semicall.S printf/printf.c

Applied to the semihosting-tests repo, thanks.

-- PMM
