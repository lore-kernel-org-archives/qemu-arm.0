Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11696435wrv;
        Fri, 26 Jul 2019 02:54:46 -0700 (PDT)
X-Received: by 2002:a9d:77d5:: with SMTP id w21mr62558139otl.330.1564134886636;
        Fri, 26 Jul 2019 02:54:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564134886; cv=none;
        d=google.com; s=arc-20160816;
        b=tiRho8jzLZj8xM3RBzeO9JgsLk3KT9DwzgHESgSYqW54Ek9hnaAK4AdDfYPjOKwhhP
         739FS8BkSVa5iYzj+xgDBhmMLa1KHEtPap8/ac+/X74n8O1AgllfEeVoBCxym8xDlZRw
         W+T5aNwuYSUejQSq3Qqd/+u16gCQW3ViWOFQCe+OYBpePgZY1mvk1ErWyvJo6lkqa1mu
         YSQoXztOrpb2FTTvLkRYiVcuNvrKgPPe5p3UXgyWyfzmEA/KQVVpdVdEPFJds7Nhnh4G
         Qv1zsh2cQ0+vzcT+/k4CvRXZ1tVhHqWLJotrTm63UOU0o+MCSwlFpY4V+7nOlSLsrORe
         WxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aKhk4erY9ZehA+G4HHOTM66gQZJGI/LlLhKy6+qIZ6o=;
        b=pBHX/7RIoluVB0BbJRmD94+YBR23i4SBe1hd4XWrAMz2MCyNNyJ91raGpbdjPympqs
         1bY/6MiDfbDS1+7Txy4SFEB0nqkckJqC8MX2oMJYNyJ1Z0D0AT2b9buCL8O2Ugkfv17x
         fKZ/haO1IsK1G4oHE4KdqP142uoTVSPmrsBoPtL6y8mTsk6acor+lq1KWaXl59Daslyo
         D7EAiyZrckzgv5mXELFE/CYeyrt/MrdVjNnJckHgNtLAIIKGVCAl9JFy8BF+ddOy1hQX
         2AflEC88SWSnyNWAX+Og6ttz+302QgfHb6EfDjPn938/Xr9sQq//3BL3tL/nafPv8T/v
         QvBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cCQZkC8E;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h25sor27400435otr.133.2019.07.26.02.54.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 02:54:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cCQZkC8E;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aKhk4erY9ZehA+G4HHOTM66gQZJGI/LlLhKy6+qIZ6o=;
        b=cCQZkC8EZfhw3i4wc4kvU/iNlPr9n7AHtibh53G2DUeo8Mtx9JTa+OxXLA+TpESAWO
         Hu87v1/DVUYeM+/mmiMV77H+IHNb0+R9GZ9EF/5NMzcuPgExEdkWaS55gaOe7qhNvWpq
         nRc4EFapGFeGHI6i0EdAPZ17ye+gSv5tVjkwYk5TuE8+BrmHLsb8eL5NiibCpDdfESw0
         uxfyiomVAz99hBBLD0rO2DyuXgVA+YBY9rw38ZHA3c5EcC6jBq1gWDnJm9ziYV4WSzj1
         AVNJWNO5hCRiXKcle6UV/vmTmW9oYzmirkHCOQHQ8y2v7BdsyTlOalWooaPxF95LrrTT
         RmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aKhk4erY9ZehA+G4HHOTM66gQZJGI/LlLhKy6+qIZ6o=;
        b=NfuGqKXb1eTeiIQfCdn0km1JrpZfmQJcLGzYweraxA+5VkFzUgEMpZ3W5XBNO+jFF7
         BmRCfC33UD0Y04UQhoxpHgPL3CThahMJkzevmOijYtiRo5els8t8p49LunGRo0n7fWpN
         oSRgdDiHsDPdfrTPiYlWuwAoj/xSt9mVfSypGBga267xn3ynQxYJNIuScrmoMnefa069
         SHAYwV5roNvH78bfcp2d7WQmLIqndd04MiKnoV+DZEb17IiSYHmwiKOIxKADIRihc7GM
         cs+0jL3+O84Do+BwzsqkavOCiCpZNl9tbu+YFJe32RS7K1B4fSYuYL1bA5j7cI+xwfaH
         QOhw==
X-Gm-Message-State: APjAAAWhtt7s+rCPkbq3WvRWXJsmoD4STRijkOgcXc5glCbi4d/u/lS3
	zYF1v42wo2cp0f8LNUgFIAg0O8KDOqjJdiN0y8QLA2Fi7ZZ0sg==
X-Google-Smtp-Source: APXvYqz0D+R1n4qaO5wNZ3Kknmxr9TTLH6t37Ndva5LSbwJM1SzAPESYMn0iMTPsaVCG64Hk2xtCm+avxEn1AbaXUcE=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr10686844oti.91.1564134886035;
 Fri, 26 Jul 2019 02:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190726094757.17779-1-alex.bennee@linaro.org>
In-Reply-To: <20190726094757.17779-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 10:54:35 +0100
Message-ID: <CAFEAcA9hZm3yDxjAceR5EB3-sS5b2qpRRj2x8gT=j-HhJDEHhA@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: generate a custom MIDR for -cpu max
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: UOarqdD0yGat

On Fri, 26 Jul 2019 at 10:48, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> While most features are now detected by probing the ID_* registers
> kernels can (and do) use MIDR_EL1 for working out of they have to
> apply errata. This can trip up warnings in the kernel as it tries to
> work out if it should apply workarounds to features that don't
> actually exist in the reported CPU type.
>
> Avoid this problem by synthesising our own MIDR value.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - don't leak QEMU version into ID reg
> v3
>   - move comment into one block
>   - explicit setting of more fields
> ---
>  target/arm/cpu.h   |  6 ++++++
>  target/arm/cpu64.c | 17 +++++++++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 94c990cddbd..67f2af0e169 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1611,6 +1611,12 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
>  /*
>   * System register ID fields.
>   */
> +FIELD(MIDR_EL1, REVISION, 0, 4)
> +FIELD(MIDR_EL1, PARTNUM, 4, 12)
> +FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
> +FIELD(MIDR_EL1, VARIANT, 20, 4)
> +FIELD(MIDR_EL1, IMPLEMENTER, 24, 8)
> +
>  FIELD(ID_ISAR0, SWAP, 0, 4)
>  FIELD(ID_ISAR0, BITCOUNT, 4, 4)
>  FIELD(ID_ISAR0, BITFIELD, 8, 4)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 1901997a064..f99008d7da1 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -296,6 +296,23 @@ static void aarch64_max_initfn(Object *obj)
>          uint32_t u;
>          aarch64_a57_initfn(obj);
>
> +        /*
> +         * Reset MIDR so the guest doesn't mistake our 'max' CPU type fo=
r a real
> +         * one and try to apply errata workarounds or use impdef feature=
s we
> +         * don't provide.
> +         * An IMPLEMENTER field of 0 means "reserved for software use";
> +         * ARCHITECTURE must be 0xf indicating "v7 or later, check ID re=
gisters
> +         * to see which features are present";
> +         * the VARIANT, PARTNUM and REVISION fields are all implementati=
on
> +         * defined and we choose to set VARIANT and leave the versions a=
t zero.
> +         */
> +        t =3D FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
> +        t =3D FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
> +        t =3D FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
> +        t =3D FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
> +        t =3D FIELD_DP64(t, MIDR_EL1, REVISION, 0);

Comment says we set VARIANT and leave the "versions" (what are they?)
at 0, but the code says we set PARTNUM...

With the comment text fixed to match the code,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
