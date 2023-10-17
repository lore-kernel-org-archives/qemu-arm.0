Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3889028ejc;
        Tue, 17 Oct 2023 05:40:23 -0700 (PDT)
X-Received: by 2002:a05:6402:520b:b0:526:5c70:7318 with SMTP id s11-20020a056402520b00b005265c707318mr1712565edd.6.1697546423124;
        Tue, 17 Oct 2023 05:40:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697546423; cv=none;
        d=google.com; s=arc-20160816;
        b=GSbIIQtk4i6L/HroFrIUUnvNUpKcsWlCkPkFHoes/WDE8TWGO2CVLi47VCVAZJMHuD
         bTkOsBjlN4pVIhbuQktkeULHfBxTt/GrnFzcPQAJNDk//jLQLUJ/ZnOJ+J0qQtkAt518
         d4bIiKzZCBlAuuPGY9HElpv/BGaZCnmgdr3RFnq2qxLL2/pAZ7Tskyv8wqp5Bi957kgL
         8HYXddVZ7vWGGuo55sfa6IqvwTGqrkx3SBhSuEVmIAF6jWdQeZ0YT9Lsw9UI6/LwzYDC
         punSx8yMTY30mCMREoB7Z8ezfGlbE1ZaIGX9sEmVWJ6e5izj4b3CamiCAFrRlVB/cU0e
         t36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r0QIgBtowzSJ55PrgABlXL74OTmeFvX5QvUBMAW1EAs=;
        fh=ULANnUNAmSuH4sheoaawq3/FCOGkml8D1FbHtbsXyu0=;
        b=v1M1I//orEyQsUpLnHI/z4hVdez86ui1ALgA/LVqmtI2+jRs/E1A92aLehvPg/50zj
         bLDqsgUGDvaXRrwJcpyK2ZtDyGYULFKwKXcWgziRSwx5TNY54S7KgUiq4I0QqmFsUDqI
         friU+tnr0ODOcNTln/Z+CrRAGyHMM66cRRmKfptopWOq52aPt0NhJt1ZU0+ayUxz6Qp5
         LMRPrqU3Iv/wRViIU4o7MIPUTUmohiHJHa1gmnR9OI6KLAyefiw/VeUhwWy3iX9WvnTS
         HMP2dMJwINn1nMI3NnPkHGWGDFHAZM+UCY2h3D7Q+PuVJCV8SLq70TzC+JNafQsHHftD
         39Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UCjiUU9S;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g1-20020a50d5c1000000b005377830246bsor532672edj.5.2023.10.17.05.40.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Oct 2023 05:40:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UCjiUU9S;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697546423; x=1698151223; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r0QIgBtowzSJ55PrgABlXL74OTmeFvX5QvUBMAW1EAs=;
        b=UCjiUU9SqVsmC4XdRE2cPCNz3yVCEXk4oRXV7GqcB4gAA8FCobOjpqXS0hlyp1CPe3
         YGcMRI/lBxZto9EF8Rc/iU3DsZJxKV20pWz0YEysqCxkgy6/Xw70ghkZaL3qx8Qg9O8k
         ooko2PeP3yhphXO3fHpjm546rEKIjuLtHQaTC4XvofQf+LrhbmakCzy8k88dSUmwoy3m
         KCQoofjECfhR4HT2nnZRVitDcb6dRbDkdtiCbuGHidGhNr+bw9lIRG4Q3ApLrN8m/bv2
         Mllvvgrx6fdWSiK6WVvH7snsIJmYgkG07qoIHZUUD/yrybEzkhnFeq9h2Xt1Y9JNYmGn
         4vRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697546423; x=1698151223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0QIgBtowzSJ55PrgABlXL74OTmeFvX5QvUBMAW1EAs=;
        b=qbJM0CxqnFRKKVp26EK2w0yDoyjrj2gyAIAqjUg4R07ZP2qP+yH/3QyKB7ywyLaJ4B
         KSM9lu6u1R4X4E5TahZoTUicivGfuAFkvzCOFnMdpxzZNGXMXLD+AwRDHCHRrIu42WSV
         ALYYedLP9nO8lBDuPXsEjyE0YtpFNZtf4KvVwyOXuxiwHbP+2sXoMC5mq6D2kan4PFlU
         tHJSCs194mBXELoSmWWsSwXu+n+8wppCkjVu02KuMrl3KienY35k5Whu1HEJnyBYuPYW
         GSm39RpVD4xJE2OtopIjTM8T5VedjQ64qVBe1tYm4h2uXYjcoi+fD8u/zEluyWl/iIJf
         Ic/w==
X-Gm-Message-State: AOJu0YxK3veKl6kuqa1T2gwLylOhR3PA4NhjyqV9x+8RoTDxhn6nDsxg
	jxgOzqEicJkB4Doi4uhKpiabYkgreuxHB88d7atNyCfj
X-Google-Smtp-Source: AGHT+IGCIAMcIuVHuVdGJhWmnffWavr+gGhpF0aBbYnLS8xnH4MidD3t/6krAOzIG2H016Zgf+fqJIN4YdRpFGN8rHE=
X-Received: by 2002:a05:6402:5194:b0:53e:395:59d with SMTP id
 q20-20020a056402519400b0053e0395059dmr1782315edd.8.1697546422752; Tue, 17 Oct
 2023 05:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230915185453.1871167-1-peter.maydell@linaro.org>
In-Reply-To: <20230915185453.1871167-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2023 13:40:11 +0100
Message-ID: <CAFEAcA_Lppdk-aEXRC1vd0OZpiCvh3kK+mqz8OpaAe01Vy_bFg@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Implement Neoverse-N2
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Radoslaw Biernacki <rad@semihalf.com>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: i4YmFUDOwBlt

Ping for code review -- Richard or Alex, maybe ?

thanks
-- PMM

On Fri, 15 Sept 2023 at 19:54, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset implements a model of the Neoverse-N2 CPU.
> Because it's very similar to the Cortex-A710 we don't
> need to implement any new features for it; but because it
> supports 48 bit physical addresses we can use it in the
> sbsa-ref board.
>
> Patch 1 fixes a few minor errors in the A710 definition
> that I spotted while I was cross-checking it against the
> N2 TRM to see what had changed.
>
> Patch 2 is the new CPU model.
>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   target/arm: Correct minor errors in Cortex-A710 definition
>   target/arm: Implement Neoverse N2 CPU model
>
>  docs/system/arm/virt.rst |   1 +
>  hw/arm/sbsa-ref.c        |   1 +
>  hw/arm/virt.c            |   1 +
>  target/arm/tcg/cpu64.c   | 114 ++++++++++++++++++++++++++++++++++++++-
>  4 files changed, 115 insertions(+), 2 deletions(-)
