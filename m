Received: by 10.28.71.27 with SMTP id u27csp5109000wma;
        Tue, 27 Feb 2018 10:09:38 -0800 (PST)
X-Received: by 10.202.98.193 with SMTP id w184mr9887024oib.286.1519754978861;
        Tue, 27 Feb 2018 10:09:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519754978; cv=none;
        d=google.com; s=arc-20160816;
        b=IJYGzIwUb98RwyktvMIKE+10u3bOT5UG0JN0PtLu23OMSGLeQH03ms6I+9MczV2DM0
         DAmmFjJhk1Dv6fL9leibLX7EIs4ZJqWrRZVIpRFM+DTGTiMQBAjaegKqdTLI8SRm5Nzk
         afmODnJviYCVNF09KT9zDjj4pBcbPHDs0syUDWN0WbrCjSC30cfV4GjTsAjIeEKcgmVg
         Uul4B++JI0B3KBCRRS8ortG/k7yCYO5pckmPfzrTxq8eDTIAxT616geLEdxBBEuvUklj
         py9vLGMpXUTsr2reaRrtmP0m/VCPUOYEsX//vGVDDukyiQj1XF7Y11OtSY2DBAZpvZtb
         hPkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=lfOPg0BsWo1LJNcGW3NTU3tANej6Sdue7Yj0qi1sOdY=;
        b=0MwQD4gOykVdP5hB4gvkRns/dM9A7bdx+mgvMWw7xWpLv/IdecoLqwPJzTRdkNQAuy
         j/BZsRXsPEfkaEDzydw4WazlZk/+V3hCuVCj5D6hROYv0mdNnzW9UEFONH62P3SBBJ/K
         +S00B1OOATVyhrWB8+HI9r1oakJwkbCMoRDIEJB/mmncyenys2z/xeyOsxmB32QUwO+5
         Ujio/BzzjUk7rAClFAD7FZBH1MW4FWKHUmLh0yX14zfaFeJ+4R3a9l5FdqhJlN0aEvtj
         qj3B39SivjXhDPu3P3rWaC/TF5bLwAbS3IaZWhRq1tt1qjhns9eeCyfWZMkHGaxmm6es
         qhDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CCx6gFhV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v138sor4019667oia.78.2018.02.27.10.09.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Feb 2018 10:09:38 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CCx6gFhV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lfOPg0BsWo1LJNcGW3NTU3tANej6Sdue7Yj0qi1sOdY=;
        b=CCx6gFhVFStn1kPC8OyFzyGCeyl5nNjNdywOsh6gtEwXXGm4dCfFlEzzkwk72XlDng
         XT2tNSgNjmuIrluNe3IwHCeuJXMIA3k+SkI4vn6ABqX4eWFntdSSWpaXKSVtaa+sTwmc
         j3NH6byurGbtKf5AetFFzXBmIdJOv/zpgP5fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lfOPg0BsWo1LJNcGW3NTU3tANej6Sdue7Yj0qi1sOdY=;
        b=qvMLxofEQW7QLul6xeAPUff8hqmVZtez+fbzEWrlq/C9fJVGNXAmZwP+nkXvzNdG7Q
         dOIBSmz8hwpvGtQd9YKiJGV4t4fvpkrRy46Acu1m2+b41XKnrX2Z8dKdRs3CGNqDK0gO
         4JdSLGQArffe1SxhuML43H4365dTj5n1cd0ehB5G5SdrVT9mmDRa5Y8ElFYFXklAZeLN
         LX+620yJAWhJ5qTERcfqNbcv+1908KCDr6Abkz7bYrDxtpyUd2g01tVnFkWSlxl1LtBf
         uWfgcrIKNh06CB2PYpGcj0pPgB/hEYHIPWP1nYWnPyF4txzwODvylmCD7/Refky8HGX6
         NVFg==
X-Gm-Message-State: APf1xPDxslr25vFFEIUZA3Djy2vHvXS4mnHFGD/tnSS9AxMsZqCN54TW
	CQ3XXW44Wzq4ikIdapLmsdcRV3Oh8PXIWieNyYG2ThHYEQc=
X-Google-Smtp-Source: AG47ELvHQt5DZlQ2/aL9g+ifwf+RkP+TZDe8g5TmoTXVCzvsarR99yazjLuFlbOvHOI5ezWVASVl71yuAa0Etu2896I=
X-Received: by 10.202.90.138 with SMTP id o132mr3742905oib.11.1519754978370;
 Tue, 27 Feb 2018 10:09:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 10:09:18 -0800 (PST)
In-Reply-To: <20180227143852.11175-3-alex.bennee@linaro.org>
References: <20180227143852.11175-1-alex.bennee@linaro.org> <20180227143852.11175-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 18:09:18 +0000
Message-ID: <CAFEAcA_uYRwKMz09B1E_TV3fb2xJd-D4UdF2kyDhNkwNLDiVnA@mail.gmail.com>
Subject: Re: [PATCH v4 02/31] target/arm/cpu64: introduce ARM_V8_FP16 feature bit
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: IdRIaV69ufJk

On 27 February 2018 at 14:38, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h   | 1 +
>  target/arm/cpu64.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8c839faa8f..267a9d7e2f 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1408,6 +1408,7 @@ enum arm_features {
>      ARM_FEATURE_V8_SHA3, /* implements SHA3 part of v8 Crypto Extensions=
 */
>      ARM_FEATURE_V8_SM3, /* implements SM3 part of v8 Crypto Extensions *=
/
>      ARM_FEATURE_V8_SM4, /* implements SM4 part of v8 Crypto Extensions *=
/
> +    ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
>  };
>
>  static inline int arm_feature(CPUARMState *env, int feature)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 1c330adc28..9743bdc8c3 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -230,6 +230,7 @@ static void aarch64_any_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_SM4);
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
>      cpu->ctr =3D 0x80038003; /* 32 byte I and D cacheline size, VIPT ica=
che */
>      cpu->dcz_blocksize =3D 7; /*  512 bytes */
>  }

I'm just going to split out the second half of this patchset into its
own commit, because we shouldn't enable the feature until after we've
implemented it.

thanks
-- PMM
