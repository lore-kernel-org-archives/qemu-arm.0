Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2484540ejo;
        Thu, 14 Dec 2023 09:25:47 -0800 (PST)
X-Received: by 2002:a17:906:c14f:b0:a1c:f8db:c6a5 with SMTP id dp15-20020a170906c14f00b00a1cf8dbc6a5mr6392889ejc.46.1702574747441;
        Thu, 14 Dec 2023 09:25:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702574747; cv=none;
        d=google.com; s=arc-20160816;
        b=NbBlzEwkxgVxwlf2h+FnaJcIwF6vrqYPVsMgzZG8+s9iSChZR5KTPfXUsuIkfz1txD
         FIvBfrHOGG6pC5hrys+HIU91BDptA2p6ZrJDTD/sV6kIAP59+uLWs9I/5StrbIHQHlik
         0iEHACzvWQ2DErPsSbSUPQVud/IzAtnLlXJkmbH4JWl5YUSPNGk/nMFoKSxKkSSoOzv2
         Y8ZuGYBz8vY9yVc67M6V+6ZWf2W0VI+LEd4Zedm2Hzafl3KCngCiGBac3pZasoVSsyJq
         Z8G63uiyTzUCYTUNK+5lDVx9CEo6J7DSPMhqMAs/nfMoIwkNM3ndKjBpYElyQvaxiWaq
         UEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r6xcYxyGpGh0UMclg4CLI/erDIk3zf90VHoo3HjoFRM=;
        fh=ULK/RLscXAijf4JMmJbcS0BGxDjKNuZXoRrjrLfjySo=;
        b=iM3gCKRNMeIxObyDQGDN3T2WTvycl3upPScbS880dVdm75X2Ar58Sjhk9FLRJrGzhp
         B+RlwkVnnOfK6scG24yv4juZk2J2/ZaJBoe14dNtmE+8mRDNV7iOQqjZQEQxfZDfEXVW
         XaSEjaNvbmBr8cqvwf96vnqxGb3ByDMCFB/9HqzDDlpPCgxGNTy02/xi7NAAiUJqFzln
         FfsVE09sa8a+DCkSHON6IHzn5U2PhGUFc/2IFTxHECmesJoCDnVT/SUw3zL+rn6lPema
         eVAIl75uCDO4p9pgw3XZohhY4dWw8FiAE/lv4s5G+tZictZRJf0dtSJsD10E5qAGf0yn
         iqOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TJ7ClmPb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jz7-20020a17090775e700b00a1d7e660ad2sor4114831ejc.9.2023.12.14.09.25.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Dec 2023 09:25:47 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TJ7ClmPb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702574747; x=1703179547; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6xcYxyGpGh0UMclg4CLI/erDIk3zf90VHoo3HjoFRM=;
        b=TJ7ClmPbH8mn01m1m+iN63awAWNkwYppS3TqcAkl0Az3BlReOgfgccU4qnxGqE/cBR
         y77bSy7N0mO8LPJ5oL23Ve5CsmfpRbfaG6grUrCJ5JMOjyTJ3+aqvPF5SomyOEBh/xCM
         jHpfZjCWshD5JZVGQouqsxBfyVKG6x4YTOP2LojDXkxYoVJiESvCME/x9BNok0I7pkIM
         CKQMVsIEu1TM3cgQrk+pr47v8qkEJCLMjTiNXE4AY7HK0278RRaPL6elTG1bZeVG5wKc
         v2eNCqCNK2yYy+UQvqDpLlcsdf2nExqO2Ckc7JHPa5311k7YdfVahy3TOcpU8q7kqyjN
         MClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702574747; x=1703179547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6xcYxyGpGh0UMclg4CLI/erDIk3zf90VHoo3HjoFRM=;
        b=kH20wnQ7HriXtIXf0hP3oGOzh+3s1PbrWnvgqbbtmvq02hkdi7wFYNDvYvyqV8cLo1
         JVVRPFESHwOsQCzx3LDbR72RTNSpxwbnQQ18nLWJAfKDR4IeTsr0Q7tYEZBlW7trJUNd
         bc1ezIz5hhGcbYsQfHZBeWO7MzvkNCv1xb/yh3C1aABCWo/NjgMdiRl34aRu1DUq92Ye
         KwgYAEy0n2OBYO6QUsS5//4vkpu7/XbsLH/JMqPwMUY3zT9fScUrAPACvj214UB5dV0M
         aIXwZDS+LABaMnmhrjsf1lsJBNcObPlqYYg1e/xfJ448qgCJP27lgTFsy7Zkznp6qRv2
         oVvA==
X-Gm-Message-State: AOJu0YxqgFKEBmC0dJNS5PIPgya3NAHRgIo7Nmf97mIgKgl0yFsbXFLX
	Pjo7q8ssR+CFQf2RG650L94SgytY26WHZuJum4KoFgY1
X-Google-Smtp-Source: AGHT+IFHsQ3NpezhHG0l7weiSCOe76IlSSTIMrAVAoZydlTZk6I9gfG9PDZzZd5eHGXEici9Ku4jIeLrsjRCM97ML0k=
X-Received: by 2002:a50:871b:0:b0:552:7482:ea27 with SMTP id
 i27-20020a50871b000000b005527482ea27mr1025029edb.34.1702574747100; Thu, 14
 Dec 2023 09:25:47 -0800 (PST)
MIME-Version: 1.0
References: <20231214171447.44025-1-philmd@linaro.org>
In-Reply-To: <20231214171447.44025-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Dec 2023 17:25:36 +0000
Message-ID: <CAFEAcA-Je+_tNCwiL_sQb-tDmCRJ2LWm5mAfuowtxbUBNEWQXQ@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/arm: Prefer arm_feature() over object_property_find()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Rob Herring <robh@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 8R6jxUrLrAoU

On Thu, 14 Dec 2023 at 17:14, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> QOM properties are added on the ARM vCPU object when a
> feature is present. Rather than checking the property
> is present, check the feature.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> RFC: If there is no objection on this patch, I can split
>      as a per-feature series if necessary.
>
> Based-on: <20231123143813.42632-1-philmd@linaro.org>
>   "hw: Simplify accesses to CPUState::'start-powered-off' property"

I'm not a super-fan of board-level code looking inside
the QOM object with direct use of arm_feature() when
it doesn't have to. What's wrong with asking whether
the property exists before trying to set it?

thanks
-- PMM
