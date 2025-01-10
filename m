Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp101582dlj;
        Fri, 10 Jan 2025 04:53:30 -0800 (PST)
X-Received: by 2002:a05:690c:9a8f:b0:6ef:7fc0:a378 with SMTP id 00721157ae682-6f531203393mr82742217b3.9.1736513609908;
        Fri, 10 Jan 2025 04:53:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736513609; cv=none;
        d=google.com; s=arc-20240605;
        b=ZjwOn3OBKr7Eh/0U9HA47N71g/ErgktZeCQ18vjzrxFp3dEqFwjy6/6rAlq3vYa2mt
         +kVm9ViOpF04KV+fabkR9U3femgUrzRpLK153Q91Ajt614oFBWv7NTH1NeVI5XlSOOgd
         yMPH7/2cx5zFljwa8FTUChSCQfdEZMD6gb9xvtcgc+9Vehtp0ITcX1I3LCLntEzvlObs
         Tr8VuAwa6lLMdP57NqainCO9gdvCQeAXLHms10gZl2lK0IyVFVPUA/ag+77q2Y6WkVYT
         92NBX5SrD1xKvZZ9e8cFTBfLvFrO5P/G4cU0DMWBxgzi62FvGIGmL1AbbFegKVn5uMkx
         +Xfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kWegaTGjGYYZdIDVVNgoD88AutCLkQYnxatFZ5TUBgo=;
        fh=0dEHpm7CLeytPF9N51HizGtG8CHQ717rb/E353tUr9E=;
        b=G04aUKhj8whQsM6ggq1WslKo4PBO00wGBcXLhUBj9e5DU26dHpdWXEgx4nBhPM02yC
         t8x+86Z490VTAENgZjKCls2NNsFbPm3KtKkiMnRoGyPqIdJPj3dKlgXbm/ZgpOeCuPnR
         g/aAYsAd7+k4aHguFR3kVLZkyuqftKkhHTfHY9PZ2sCfl5P+gpPK7d1JDwy85v+BSagL
         p6smWTVy0rr9DO9F2apYRJ+49+lt2PzSChrsnIFEMlN8mclRgl5sjKKsdun9GJr1WmA+
         OVG+BgdijEREGfuzlRGG7IXiBoVZEC1Q9czIi4Ctq/yzweF4Z8pc6L+h19R/58PEMlxc
         7vFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CuNtDRRz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f546bd0912sor22320507b3.2.2025.01.10.04.53.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Jan 2025 04:53:29 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CuNtDRRz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736513609; x=1737118409; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWegaTGjGYYZdIDVVNgoD88AutCLkQYnxatFZ5TUBgo=;
        b=CuNtDRRzYWOR/E2UQwW+SsgDVP4bDqeh5YTr2Ry/4oVrCxEY2lBpeNvxma7C7VrBZS
         e+aax47ZQk6i/8j854eKmLEWB/pYFe0zz85I7LWGoA/BTa8DdSpP1je5kpnFhJLTFTyj
         M3hCjpdRsH+ZzJZvZd7Ypj9l7KMCOU/UaZVDwB5xMyPo55tFQTL6dbhlk+xL+nCWIZVx
         DR5uqYXOQjePlqPQb9icmzykzO6RHUn/4vKtiZa45lbGuS4Qm3+3nY746wldMHF/da62
         rQ7iAdFre077WgWZbLHQx/WkdNKJZvAzXCWjGfaKXRf5kqUqoGnOs2N8P9zXyYm03ND1
         Yk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736513609; x=1737118409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWegaTGjGYYZdIDVVNgoD88AutCLkQYnxatFZ5TUBgo=;
        b=tvYu6Q6stO/9km5UQEL/z/B47j6H1t0JI55kXzRvpq34WpjL80do3ADMkGBNDr4AtQ
         hFMz6xHy1+Sl9lCn0UDgGSGIxN6K3trdiyYLsj+Hul0+EBDAkDfCapeQtLi5eexqnMcP
         BJoVdrG8xGI52q4QaGEMCA5Zc4+3tM3oCEfJob+LnrV79cabswgVN+RLIKLgHD7i2QNu
         sBbYxSemyaLXEPAOJLWXbSMu1dfVtdxMxuvKsHkgGj3vbqFyMLTvA5WG9aiRt8ic4S8t
         e4htFCdejA2qhvs3twFazjsr11E1Ck2grL0PBP3QvQskBRUMX8LCCyNx/ehoplWrtAeY
         Wu1w==
X-Gm-Message-State: AOJu0Yz1w+ebmY4zRVjs47s4nYszx2Edp/KUh7cyemdGeDzsckK03fmf
	ijopVH2dWyDWF+9chTMWz0WoJud6Zq6CdH1JVz5ncCRNFqUP/RGGaofOQdA8rU+qp8ZuuNFEJEj
	jXW5clopHephjWZbA1a43+z8LP7vCp7rM1aKg7fJrHsTCqFwohBE=
X-Gm-Gg: ASbGncvN3krTuEwt0mxxVivzxWc5jgt+mVh4xHl3F0Nhbfr3y+UtACsEd1QtoK6zvm+
	h0gnObDeVVY/WeWibVIVRbafmR87XgmZbzlWbp/Q=
X-Google-Smtp-Source: AGHT+IELVji2idLYe2nhfhTZuG3Le1/4nA74O7PSpXkG4lcOo3MhkV4Rq2r6cRnpaBLukdxm1T4JzJco6XfELTZbKUw=
X-Received: by 2002:a05:690c:6707:b0:6ef:6edb:fab2 with SMTP id
 00721157ae682-6f5312d3fdamr84293377b3.37.1736513609553; Fri, 10 Jan 2025
 04:53:29 -0800 (PST)
MIME-Version: 1.0
References: <20241218181511.3575613-1-alex.bennee@linaro.org> <20241218181511.3575613-5-alex.bennee@linaro.org>
In-Reply-To: <20241218181511.3575613-5-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jan 2025 12:53:18 +0000
X-Gm-Features: AbW1kva2apTDuTAPBwwn8gcJVFVpyAT4uoeSNDEdmmFIVrCjtAZcwESwZ9k-g5E
Message-ID: <CAFEAcA_yqw2DJ_iPpwYXjsR_h1gAZdOs29b-2ar0QOg4k4D0hQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] hw/arm: enable secure EL2 timers for virt machine
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org, 
	qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: grJjCS+hXm2y

On Wed, 18 Dec 2024 at 18:15, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: qemu-stable@nongnu.org
> ---
>  hw/arm/virt.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 333eaf67ea..5e3589dc6a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -873,6 +873,8 @@ static void create_gic(VirtMachineState *vms, MemoryR=
egion *mem)
>              [GTIMER_HYP]  =3D ARCH_TIMER_NS_EL2_IRQ,
>              [GTIMER_SEC]  =3D ARCH_TIMER_S_EL1_IRQ,
>              [GTIMER_HYPVIRT] =3D ARCH_TIMER_NS_EL2_VIRT_IRQ,
> +            [GTIMER_SEC_PEL2] =3D ARCH_TIMER_S_EL2_IRQ,
> +            [GTIMER_SEC_VEL2] =3D ARCH_TIMER_S_EL2_VIRT_IRQ,
>          };
>
>          for (unsigned irq =3D 0; irq < ARRAY_SIZE(timer_irq); irq++) {

Do these timer interrupts have a defined devicetree binding that
we need to set up in fdt_add_timer_nodes()? How about ACPI?

thanks
-- PMM
