Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp101971dlj;
        Fri, 10 Jan 2025 04:54:09 -0800 (PST)
X-Received: by 2002:a05:690c:4a12:b0:6ef:805c:ea15 with SMTP id 00721157ae682-6f531240a0fmr79284917b3.23.1736513649176;
        Fri, 10 Jan 2025 04:54:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736513649; cv=none;
        d=google.com; s=arc-20240605;
        b=KTsuV4hCB+VK9HB4v1HjUUyjiSkvDVQ0MZC8GdffBoks3PY6oIBZn/CtErhEHkWiX4
         grcxlKAwIbO0Ao8W98ANLSqM9eazn+y6q5zTypI42M9fJRp7yzJCLJO2LyOeVK1k5ukl
         jSqhKXTsc/D1b8z7/R13Eawp2SpjJpmE8uH5iocWN53xV9I3Y9uMCUGO+io6eh+FhGPL
         7KesPBy3jHOlWe1cfrOBxBQav5rwFEtlQJ/KbaxKWOg6etxIDr5B7zIs3Cm/BXubVF7v
         h3j6Paboref6tXaqfBTJIdJdcGtdPvsXba1b2YGaL5mZW3tyMUQQIpepNMGCPuqDWNup
         1+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U2Pwv5ix08ns8anJXREo7kPYoek+CuMGlSlbWb43ZZg=;
        fh=0dEHpm7CLeytPF9N51HizGtG8CHQ717rb/E353tUr9E=;
        b=XfTH4LKU4VHhGsz3XxyZfM4sdsG9ZBilB5Tp62zxEdgK/Fk0Vubj1jUezGAcvOAq/x
         EphecwSi9t0LhRfhN/g3urSekLJ/rNAmsxg8jfKfM6M0IqN6+Uif+hkvxpboIiNDpGTz
         M+PmfkCWJSBeMIf+cO0FWWAh0Bby3mM8Mnm9vo98kVq4X9R9evyrGJvhcXEaqhkeP//U
         AMHK6nD0ffcpnOcJDPUFRw73M0wx0B7LB8H2RCIhJBaqJVHxLrhWPIUItTBx81REcm49
         lMfY0FOHTt8VvgChDIwQwdxuynV+LVsniu3UyrhTnjzZkdUbryqSvbrNklo6L9Wl1R8j
         wi3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mm8i8WF1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f546d794ddsor20885747b3.17.2025.01.10.04.54.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Jan 2025 04:54:09 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mm8i8WF1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736513649; x=1737118449; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2Pwv5ix08ns8anJXREo7kPYoek+CuMGlSlbWb43ZZg=;
        b=Mm8i8WF1IrybSKCECVKOIA7+L3kYVDjvUJNx9D3ggGsAvoMdCKbnPYKOvNBoDmmzY5
         UUmHbDs2RG4PRPNUsCeecUhorbe/LBrDyxHdLWd50hrDDhAk+qhUOrbYqqcBxD9bHdwf
         ecH72J2HnwkH3VA012odJMHsEIW+aR6rSdiSmC0P5RLKF2e9w0MJoWnENByocipxpVdB
         1iuqb9+cjRGWwwNkTRg0AKPRc6FKPv0/qzLWtjYUoDAVZVWryBrf6d3eACwwXLcezXBu
         o43r/9VOn6GQ50JZUaiicb+Y58FCTm0egRvx9BNZG0toJyGsR4Sj4/3SymGNwpnVOFzm
         wPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736513649; x=1737118449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2Pwv5ix08ns8anJXREo7kPYoek+CuMGlSlbWb43ZZg=;
        b=I7iGMKKQBIQJUouq98+qKXmlGz5rIqKvjSnk/kg1klZQxNmbJLi50eO4rjkPaHNDqx
         RQy/A37N7PtnI9EU2OcpOyW4rU2EkmFRIH+C1VJhj1kQIL/KqEqQ0RWQ4mdnTvNYjyDC
         6etiNoxlXdM1BopsOKs2wIrRwAhGvZkL73nVAstdFpFJPF1heUsH//IWTEOUmNCept1z
         MvrnoiBmPcWhi33zROU8kc8oKLxxgESRNK4YnqTguxHtwACpVdEkTMrKpoZe7fk1fPqn
         9O2ebx7U2Oj1ZVVQqHe2eimyi3P4iLeoRcpZxV7H6qW3XAm3aNuTG5j1CVzBAfhu1lh7
         B8gg==
X-Gm-Message-State: AOJu0YxNZbsN/SFLFwcJB0efGGuzLIwzCLa425bVimIIeuJfi7HD5tSG
	Nnd2bvkq7HihIZqCIcC+m9EFZDqM1mTeEJSRLP8Mrca2KqP6B/J14ZFPhRhFKaorEksh+gETboH
	jCgGc56uQCXxF1QBTy7YXYivxmBcCaqa0nrauXFL+7jOijD8nPuw=
X-Gm-Gg: ASbGncu/5W38zltlyhhF7Pb6mRVH6+0Er4pf3BqVjonmeyrnVPqnufMriOB4EVb49GD
	m5ovkUHNMSyg6bxNAIOMwtKgMPOOq8QQaABnr/Qc=
X-Google-Smtp-Source: AGHT+IFt+d03XrqZkhMQFpLqQChDPMK/VkmFwZgIMFoPc7Zkc4LuBh1EGCNwYk4Vo5J9paq1V5ypDyO2Jt7omVGQB1Q=
X-Received: by 2002:a05:690c:6b02:b0:6e5:9cb7:853c with SMTP id
 00721157ae682-6f5312a2e9cmr94025347b3.31.1736513648785; Fri, 10 Jan 2025
 04:54:08 -0800 (PST)
MIME-Version: 1.0
References: <20241218181511.3575613-1-alex.bennee@linaro.org> <20241218181511.3575613-6-alex.bennee@linaro.org>
In-Reply-To: <20241218181511.3575613-6-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jan 2025 12:53:57 +0000
X-Gm-Features: AbW1kvYBTCbgZxe0lauhdW7RhCOk5dnJDw2p2BNCmSxRLVT_iNaqD9Mh9sXpzcw
Message-ID: <CAFEAcA8aWRwwo_0j7P1YMr0Ez3H-1T132w6ygYYjHfnZMEugUg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] hw/arm: enable secure EL2 timers for sbsa machine
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org, 
	qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Rjebz0rwzBd+

On Wed, 18 Dec 2024 at 18:15, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: qemu-stable@nongnu.org
> ---
>  hw/arm/sbsa-ref.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index e3195d5449..c02344004e 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -484,6 +484,8 @@ static void create_gic(SBSAMachineState *sms, MemoryR=
egion *mem)
>              [GTIMER_HYP]  =3D ARCH_TIMER_NS_EL2_IRQ,
>              [GTIMER_SEC]  =3D ARCH_TIMER_S_EL1_IRQ,
>              [GTIMER_HYPVIRT] =3D ARCH_TIMER_NS_EL2_VIRT_IRQ,
> +            [GTIMER_SEC_PEL2] =3D ARCH_TIMER_S_EL2_IRQ,
> +            [GTIMER_SEC_VEL2] =3D ARCH_TIMER_S_EL2_VIRT_IRQ,
>          };
>
>          for (irq =3D 0; irq < ARRAY_SIZE(timer_irq); irq++) {
> --
> 2.39.5

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
