Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp207520njk;
        Tue, 17 Dec 2024 05:35:02 -0800 (PST)
X-Received: by 2002:a05:690c:74ca:b0:6ef:97a2:49e6 with SMTP id 00721157ae682-6f279b7c8efmr143104767b3.31.1734442502602;
        Tue, 17 Dec 2024 05:35:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734442502; cv=none;
        d=google.com; s=arc-20240605;
        b=ZEbFPm4bS3b5ubvn143Nd0Q2E7D+TucQF4pl/vfdvaZobxFN2Iu/hWU690Q5bZhqoO
         mJz3gS1sRkoSApBP5A7WxB6kpeqWT+u/XdIe6SAKZft+SigS3Lxc2eHaKbn8j5JPTemq
         e2Iql19T0fDom9+xPWvSH+zS+xkRVuOYl9Cqf6flN70TNNYo1vOYg3KP5fNdHxyo+AYC
         KiuX8t7cFYt5UY7B2kdeDTlbx80DIitNxevGRtBQ+Wt3PQmI8ZpzKSt6YQMQWZs1h+lz
         pDca1N8hkycLa+aze8TfmxLATKmw9j8syE8sUWw/lWi8GcfWtp+cj3QuHfpfPQv1FhTx
         I3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CoOj9OMhVreh957qfVVVxCYR32RQIhKvGlDk3hpkOtc=;
        fh=CK4xvtBf7wvdSkFQWqr//NOFasnvoXLneAc10k2Os0w=;
        b=N2MvLos1tBUS1dpeXob8EX4vLqqZvg0XX9SeO0BAblkuUFNiTr5+gE8cnC1icsp1PL
         sy9rY0REg6cxbu7X3ijHRbVecfNI8L6mpY56y1VyyIKxWccESIbMjXjJ6mwEvLWWXyjz
         bWnW+2pR0aRLDaXtGL56Cl9v9vfmAOLXcLewAPAG2jfQLGVas6aZSAd8BeRzhuLkhFJZ
         pS3RI3pQbA/L7vbq2J/tMZURGA8ELMSnAvdrhl/QSLBkMZn/m/lrXF44pzudaW1Wz40I
         EG/apOzCAOZQTGN9Ez+ICt5BLmNQJLl0BomiD0KHlh2u5MJzCw8kcd/dStgVNNDlPzS4
         oksA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="o2p/V5gX";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f289212c07sor42121127b3.11.2024.12.17.05.35.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Dec 2024 05:35:02 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="o2p/V5gX";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734442501; x=1735047301; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoOj9OMhVreh957qfVVVxCYR32RQIhKvGlDk3hpkOtc=;
        b=o2p/V5gXUdxzXuUVvdFvgPf3EkiivEnWGs1AwfM0eQne2dlxklxMbze8En4nFWn9xN
         VCj4i22ufKEUtSpybtmDjsD4pHpicMw+U8aL40hqRePAYthKR1kUOrFj1/qxod843MuS
         foIC7BN8AzoDMCq7OKPnfWYPbDJdWoX4Q8iIe4l9LfwgTN8c1lqyWk5f70mmes3ST7hI
         RCQ5SVCEw4oC6lJh8MCcWuByi72IEUlWp4kgJiAOAZxWcPQSiz2uvooVqWX6h9/n+bhU
         TTSXU8o5yvVYUygTBwcJc81Z7NgS4SQOJmK1IPj+ZiL1isjYYUcv2MZPc8IigBwuAa58
         Zczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734442501; x=1735047301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoOj9OMhVreh957qfVVVxCYR32RQIhKvGlDk3hpkOtc=;
        b=C4b0K/5iaxfxWCR9PJWoqQM3tVTjnegIUIdYeLYW95DSLO8P4bF4hk8Tud9tf6kLhm
         O40VZX+4YhJufDVxAoV52ok1LD+DXZkXKr8fLXM3C8j6fSkvx9FVa9jaMr2d3IhtOHem
         ml9eODv7vBrjFTSBqHYNCm5WTBPRWeyKlsKDgwV5LPCa+gAGv57kzz2C9iT0Uop3t52D
         4HjR3nOPQ3y+LaHjgnvzMxpFzIjIUjVoyOZpEdNW2ezbB4gregHAR3EIfe+oHtejS5na
         r7HDdYTuNPPf9yg6HSmLzC+FYqWD8EvUO6oJnG3BUl6nVAOIDP8KtUpE6Mzy7diAgrX6
         ePGQ==
X-Gm-Message-State: AOJu0YxkSaGuz4mqzXfWu54bi6oHpQdB3QQi4K646Rnx7O6TWpUr813m
	Pr92lgmVv/q5UD8ArrasXLx7xklqbE18HQuxeQ8ey6ZjSZv05H2janqnlrfwcWYWVMPpd0cmxHB
	GAMxPNnRAeQtKLUCk2YRagoPIQ9fNjZMuRToUurLrPs2ROOP2GvI=
X-Gm-Gg: ASbGncut2JMJWMrxS8gPu5e3vKyrJFn5UAzVfcjQGvAUaQqVGRBR2Daip6ymWqEMS/B
	oBNDiXzQ884/VTP08nMblAAljwAFWtGoylkjKABM=
X-Google-Smtp-Source: AGHT+IHF/uU2nxHNccfbJ0gCojA/PuCP89exwJRGMM4RC+XG8cLu91ow9w50SI5xIveSRU0wkQ1srxA9lVrqbBn8vzs=
X-Received: by 2002:a05:690c:6ac2:b0:6ef:63cb:61d0 with SMTP id
 00721157ae682-6f279af6ca2mr135353347b3.10.1734442501308; Tue, 17 Dec 2024
 05:35:01 -0800 (PST)
MIME-Version: 1.0
References: <20241206160239.3229094-1-alex.bennee@linaro.org> <20241206160239.3229094-4-alex.bennee@linaro.org>
In-Reply-To: <20241206160239.3229094-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Dec 2024 13:34:49 +0000
Message-ID: <CAFEAcA_AgkVcVm5nfCNb=PjB5qnYahTUuQxi-U=um92BFokccw@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/arm: implement SEL2 physical and virtual timers
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, qemu-stable@nongnu.org, 
	Andrei Homescu <ahomescu@google.com>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@google.com>, 
	=?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 8ez0VbhTrDGU

On Fri, 6 Dec 2024 at 16:02, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> When FEAT_SEL2 was implemented the SEL2 timers where missed. This
> shows up when building the latest Hafnium with SPMC_AT_EL=3D2. The
> actual implementation utilises the same logic as the rest of the
> timers so all we need to do is:
>
>   - define the timers and their access functions
>   - conditionally add the correct system registers
>   - create a new accessfn as the rules are subtly different to the
>     existing secure timer

> diff --git a/include/hw/arm/bsa.h b/include/hw/arm/bsa.h
> index 8eaab603c0..b4ecca1b1c 100644
> --- a/include/hw/arm/bsa.h
> +++ b/include/hw/arm/bsa.h
> @@ -22,6 +22,8 @@
>  #define QEMU_ARM_BSA_H
>
>  /* These are architectural INTID values */
> +#define ARCH_TIMER_S_VIRT_EL2_IRQ  19

Can we call this ARM_TIMER_S_EL2_VIRT_IRQ please?
We currently have ARCH_TIMER_NS_EL2_VIRT_IRQ
so we should be consistent about where in
the name we put the "VIRT" bit.

> +#define ARCH_TIMER_S_EL2_IRQ       20
>  #define VIRTUAL_PMU_IRQ            23
>  #define ARCH_GIC_MAINT_IRQ         25
>  #define ARCH_TIMER_NS_EL2_IRQ      26

-- PMM
