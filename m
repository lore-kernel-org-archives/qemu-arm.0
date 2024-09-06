Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp127155njb;
        Fri, 6 Sep 2024 08:33:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaidhxOsfvpCfZiRpJwbsyUmOOw2AezVXFJ4y1VNYSraX6j6lhuDFaAAz20w/Hb2YC4+FN2PXtFGaSRw==@linaro.org
X-Received: by 2002:a2e:bc0c:0:b0:2f5:a29:5a42 with SMTP id 38308e7fff4ca-2f751eb8802mr21215101fa.14.1725636795126;
        Fri, 06 Sep 2024 08:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725636795; cv=none;
        d=google.com; s=arc-20160816;
        b=VgIQUaccSuSAepLNN40UnJx1AZ2RVNjOxUnDXkgCO3Tie6mAvdG2tvK5xPpalhjk0x
         Tmy96WbJ9jd8Zb9SM/iK6S7tzCkVY4+TZtQtiE+ZPyUjBqK+ehGXpOKzV7zW8KSgWdLN
         OfCWHvtPg1DKNz9fX4DnPnikMesVh4nvQkFdi6b+XwJe/8roJV2cS4JcVBrZ5eZBb81o
         fU9xBB78v7HyjEvgaM2NXuIqYLNvLab6SSgByW2LQShpJUUP3jfFYKaOczT67sFX3ojT
         PbKdbtpeQGDFx/R/pCqCeWxr4xOgSQfQmKYbP0mN5LNlM+HRnnfcW9K/BAW2pxGYP6mN
         S5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qp7kpq6d0ncLVzd3V57W1r3ObwEk60cjmR4mFc4gBas=;
        fh=d9BHqGIQ7hrkDFRPu6BgiVd6huOFojYyyLzNlnihfL8=;
        b=M5KZngVzOsWuUgCSScFiCk4dw2Cn43p+qbb5YQIQJwUaILZHaDv7MdkxQiP+h7yBMJ
         /6XgUndcfuq39fAWcYLORgVXqdcU3IFfw+7zMoQ26KQesEsgT4D8iK4GTDlNxSw6K4R3
         Ul0IdnyL8x5LesuHJJMSOu8yPtzTf45s8VM2LXrHAvCecJ0hmvHjPpR4CNQMAJJrTnTf
         e6jFkdlWoW+gVo7m+Y6X72Zv8J6mfRHr5waYYkmpKgAhOMDAaY17tP6m0mGKm0cEIWuB
         GQiQZ0LcGlGXjzoMrQsmdPVpLFgfFG+10+7ZcJDa6JQmzzqZ7lx1sglhMSNIwHE1hlBy
         bQRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G6QVutbR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2f6577b52cdsor19961511fa.9.2024.09.06.08.33.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Sep 2024 08:33:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G6QVutbR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725636794; x=1726241594; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qp7kpq6d0ncLVzd3V57W1r3ObwEk60cjmR4mFc4gBas=;
        b=G6QVutbRyah+q8lg+mnCRkbbTDdoz7StZatFpOcWxYKoRlvNNMdegAQNvspU+Jr6u+
         4DqQ29tEPI8ia/uuGhleLaSz5PLvWzMUB5qKTCNZwmIQ4KtvGLnQ820nbZ7bsOSQrGUx
         tKIdo4eOBCMwHF9PsYfVZBSuDi6QT4jmm4ILD2d+ZZXIU/+xy6KsNpQJDgrSHUI0E4Qb
         kQwFCUlDQNctQndW0CTwzGao2gsVpcXUnKxyXQL9nT2WB8PzTxctnFjbQiNHwMgEhMew
         DpT9OJjaoyCqHxb/9heiErtRXdY8b3VR3nA8pyZPf2Oxv8tMxj4ApcmCkvkwhe1z3XM5
         5nSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725636794; x=1726241594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qp7kpq6d0ncLVzd3V57W1r3ObwEk60cjmR4mFc4gBas=;
        b=sWGm2tC0CJvMgbv7n+XNhVsvgRB3fh/FqXY1wcyhf7mzALmCy82Da22NwlYLnPgK+9
         ShWGu07DWCU0YO1OJ9wzFQYXFbnX/sFGnwiQJl5NJZJXGjUVqOOrTaFiVDMplTNvFXVz
         wSJxkeUm0WLPdkPU9/LZa46OyE0UxgmtlY9sGoipHBXUoDFKHvsykRGRj/YEnTo6NF2p
         XEkb4FJh8ymqF4Yi3aCKhfU+mxFX6/4mxtDU4nxVIvrFDXPmFh1lBKcURWgOXsoQD2em
         MZX+xYat7vYrgbjhq4hNy0t4ZXHXb6nA1ePeeShlPfPSPg5CZC3aXeOCTF3DKy5xAUkU
         e44g==
X-Forwarded-Encrypted: i=1; AJvYcCUjopX+WyshxfK+DXjw1U0QyrHPKJSLr22oEhZvE8p3QFEEdR9aWdiXZkITwAUI04k2BEvBcThW8/l08g==@linaro.org
X-Gm-Message-State: AOJu0Yz3fkyLxVY+9a7zCLy77Sju9W3hF9oiTRIv0nWA2x3TKO3scc8a
	/OV88OzoLYJe4T9F0cEUj5ETkoZt3OGu7pLI7/zDW1Fp1ZapoyHfBq0URoBg6bnTAoeelQHGZob
	bKV0tLSB+49itIOwQcpZ1FMV1NfMPl5KJRn3zR4Hn
X-Google-Smtp-Source: AGHT+IGQ1TFwAA4RkmmtU1hN7d8gsVWkcs11KtS3jO+qjz4eLvDAxLl3bphQWVAs7LarVgw2G/jjZepcO30sch1BSWE=
X-Received: by 2002:a2e:bc0c:0:b0:2f5:a29:5a42 with SMTP id
 38308e7fff4ca-2f751eb8802mr21214791fa.14.1725636794309; Fri, 06 Sep 2024
 08:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240903144550.280-1-alireza.sanaee@huawei.com>
In-Reply-To: <20240903144550.280-1-alireza.sanaee@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Sep 2024 16:33:02 +0100
Message-ID: <CAFEAcA8ip=+d6JwZJ71P=nUsUa4o2x_7LsWxoqzpnSY7C2G9AQ@mail.gmail.com>
Subject: Re: [PATCH v5] target/arm/tcg: refine cache descriptions with a wrapper
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, linuxarm@huawei.com, 
	richard.henderson@linaro.org, shameerali.kolothum.thodi@huawei.com, 
	Jonathan.Cameron@huawei.com, alex.bennee@linaro.org, philmd@linaro.org, 
	jiangkunkun@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: /xEg2ovLnUa3

On Tue, 3 Sept 2024 at 15:45, Alireza Sanaee <alireza.sanaee@huawei.com> wrote:
>
> This patch allows for easier manipulation of the cache description
> register, CCSIDR. Which is helpful for testing as well. Currently,
> numbers get hard-coded and might be prone to errors.
>
> Therefore, this patch adds a wrapper for different types of CPUs
> available in tcg to decribe caches. One function `make_ccsidr` supports
> two cases by carrying a parameter as FORMAT that can be LEGACY and
> CCIDX which determines the specification of the register.
>
> For CCSIDR register, 32 bit version follows specification [1].
> Conversely, 64 bit version follows specification [2].
>
> [1] B4.1.19, ARM Architecture Reference Manual ARMv7-A and ARMv7-R
> edition, https://developer.arm.com/documentation/ddi0406
> [2] D23.2.29, ARM Architecture Reference Manual for A-profile Architecture,
> https://developer.arm.com/documentation/ddi0487/latest/
>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>



Applied to target-arm.next, thanks.

-- PMM
