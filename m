Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp164846lfj;
        Wed, 15 Dec 2021 05:36:18 -0800 (PST)
X-Received: by 2002:a05:600c:2f01:: with SMTP id r1mr4621793wmn.153.1639575378396;
        Wed, 15 Dec 2021 05:36:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639575378; cv=none;
        d=google.com; s=arc-20160816;
        b=jbadMnedugT2CejAdMACKKD/CRiaBHRERtNB4j84pm44IQr70N29mD8JuqrRsgGZUI
         zDPzssblrm1M8cgq7dDN4LddJZZzeQqo8iHsuYciWQA2dvxdE4C/2hnoHqTKvoZnrgpl
         pMB4ifEtVuwPiO2+sNE2mkms67V9XaquwPAqNP1llaCh56oRIVHs/cVV1P1RK1qDXxCq
         u0Zlrq8M9GcTRv5MhF2UiCcYDEuDN177H2cHfFMm/mS700ldet5V4K9VP1iJhQAK2NK0
         wAfmpdH5o7oqTsnq1dCsTiBYLK4+XnLUtdJdmVBcdYcwxCqjDDWUFR+Y8JokZ1/Q/lmC
         KelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EPRwErRmLGlIXg9dNaURh+XfvKs8o+o7Xh6lQ5YpXno=;
        b=BaihiMJbIGvwYjecq2CUV6EYy6vNpldPkVS5U7RdJLBcTIydoZ1sR7Bv6n7fquPIbl
         PLVPf+bj2a5+Wr8SebUZkLtcmiyrh+wSoOb8hvMT4Vj2O5kuLB/sEW2QwtTqoINufMJD
         EbQU8/SYd5ZpoWIOvs5KZefjc7GFFn3oimcceo8G2Y+bUj0i9lMRDTH4Pu63SA/Qg89t
         1c4QMyIZ1LA98HE89p6B3hLnZBrN6gf2pWqaiJG38iWsFP6WxRkecPEg9AFHLkl6kBRV
         qOHtUiXh688ZLlpeZx95/7ucYQ7uxSTu9ZCzKSD8D0ybiJD39FGoskEKC+Wt1f9GEGGP
         7tMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CvfJNV4N;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m32sor2928660wms.14.2021.12.15.05.36.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Dec 2021 05:36:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CvfJNV4N;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EPRwErRmLGlIXg9dNaURh+XfvKs8o+o7Xh6lQ5YpXno=;
        b=CvfJNV4NpSVfPDB/A/BcqI6jcvy6pFq8vdv/yMG+LpPbtGujvFldMnQKQd5PVc2j8K
         Q3CKTPOnrWQyTQFg45gF7mymG8V1nG52qoiBz0SxtDKneF8ObdiYcTjlEQ8paYzH1Axm
         Meboyf7wgi9bfyFJvbs6YtY5fuoP0ghd+e9X10qv9uHM9u2kneXdjbiWi/oCn1IMql8c
         rqdshNta7PrVk1JeDVg5bGedK+/mKBS+fUsFlygKA3XedGxp9Qt5+yFXphovmpPObSip
         dXjO8TjyN7rjeU6ClYPkFQoH5dPqerJnbYiKAXmkY9MlQyotDvJRmBlduabNAlQCykIZ
         P87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EPRwErRmLGlIXg9dNaURh+XfvKs8o+o7Xh6lQ5YpXno=;
        b=TXBAHWf0P5mwle4bPT7MoRR/u1oswoyGz6FT8PcDz64yweofGglHWe5zyWZaPAD6j6
         jRNjfHHLpJ8oBUW3EeiWFEWRmCOQByEcv2t6Coh31yE3Qlvsn04z+g8KzExeuhLS8QA7
         zOxpHZy/41eIL9ajGV14BNNR4HrIr0Uc6pibKJNGRIzil0R+3RizLpb/ddLCPKie8YR9
         SlrgJgbi8f8y3E5ukwHav5HVJ7PcqzwIHHFKIJpmHZAi4f6InPjAdiwrjrImk8p9Mksw
         /+ZBTIMpmmSW811GZfORKxfBB45cUVmGk09AKCbIEVXrBgauQV6TBc5i3LMtizxEk/+C
         EAAQ==
X-Gm-Message-State: AOAM530NVlh2J2QANeXYUn2hqnWYTMwFzCfzyPrzxzaiAC/iAZaypZhd
	F7gEHNat40dHQqWcTlMYQsbu/3SPHQP7Mrq9BJJBeVe3owfkzg==
X-Google-Smtp-Source: ABdhPJyBNwpWvWLaiOwupqrNTPHD1uhZZxOIjVGnTG1x8JlyeST3A3COxBy3iDaf77o48d0C0FiocB43hsU049UY0Vw=
X-Received: by 2002:a05:600c:3486:: with SMTP id a6mr4602176wmq.32.1639575378070;
 Wed, 15 Dec 2021 05:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20211215120926.1696302-1-alex.bennee@linaro.org>
In-Reply-To: <20211215120926.1696302-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Dec 2021 13:36:07 +0000
Message-ID: <CAFEAcA_psjs5vaCZ06oU_OwSYorED4zgg+y-eD4nN5X2sRBVRg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add control knob to disable kaslr_seed via DTB
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Jerome Forissier <jerome@forissier.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: bj2GsWkIiZG5

On Wed, 15 Dec 2021 at 12:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Generally a guest needs an external source of randomness to properly
> enable things like address space randomisation. However in a trusted
> boot environment where the firmware will cryptographically verify
> components having random data in the DTB will cause verification to
> fail. Add a control knob so we can prevent this being added to the
> system DTB.

Given that the DTB is automatically generated for the virt board,
firmware has no way to guarantee that it's the same every time
anyway, surely ?

-- PMM
