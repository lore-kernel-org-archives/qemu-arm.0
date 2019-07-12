Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp953665wrv;
        Fri, 12 Jul 2019 07:13:50 -0700 (PDT)
X-Received: by 2002:a2e:989a:: with SMTP id b26mr6052588ljj.31.1562940830545;
        Fri, 12 Jul 2019 07:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562940830; cv=none;
        d=google.com; s=arc-20160816;
        b=VC05jgwfDs39HWIlvG6GU8eeQGAG41nZoqFKP6KzYdMsy+hKv/jnEK3kVz/pdE83E1
         TEaCSVqa7yPyT9mUd+NmmY07hGPczvt/H4BZs11suwAZb2NrngH2P8ZHwE3qGP+CONs+
         2W5r3RNqi40QdOuwzLzj+ge5njdtIO9HUuTIp7a0Y6/eDChby81y/wcnAPnoMnUZrqaM
         2ZRx1mWefN6BQQdqDkT1+GRg4Fi1/iGa4KZCanlg5hv53Kdq8AOvbhuCWf7HAS/N8Fzo
         hFp+bxBV/4gvFFDzYacNRWsh1y+DFDPZh0MUojIeCbJZu1AkZDF4/4auXXsdo2RGHTYB
         56Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uhJpzbsC/oFdCLwbLV5P5ufOUnvxcC9mJVeSTRIcE7Y=;
        b=S1miiGKzHDqur2zvs84clGjsQTz4p1Gv1/8/oHKT6FHuNx5ph8bm5TE78RpZPVEm7/
         Tp3hcadM29U0WzoxYDxAHWLisp3p9BEHg6tr2OgChS3sKuzPHIPVbIhCm70aNBtAq9g0
         Z9yDfWju6/3PedvKslyV6qx25gDYC0niTSjnnQ4u5WXxwL1PKKNRRg/ZkRaIL3hkpTve
         JxWivdoDWZOqEj43cQ5TRPnwlW2x2JqOnaQlhJ/hSwuHUV5dUgKpmlcDf2h1np1bDGCo
         2MlFvPCy78TDKGl5mxtAG+xLR/InAiUF+AnHTfiFrwF1K55mkMD4d+gIzepVOJYybxWo
         9+nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zuFfgyAQ;
       spf=pass (google.com: domain of christophe.lyon@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=christophe.lyon@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <christophe.lyon@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x2sor5472194lji.25.2019.07.12.07.13.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 12 Jul 2019 07:13:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of christophe.lyon@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zuFfgyAQ;
       spf=pass (google.com: domain of christophe.lyon@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=christophe.lyon@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uhJpzbsC/oFdCLwbLV5P5ufOUnvxcC9mJVeSTRIcE7Y=;
        b=zuFfgyAQcKdXDsWNwlh5r+NYd4gSQE8Sblm+hI3uVJAEdjjDZAu5c7vLnp1lu7BAAG
         RR36T9i6whI7QR5B9WHbDxCdYnN/QTXTMyHppDra+nErjfRtXYl8naJaWjPLgI0gZLhK
         ulnwtAwgdXvWhAEFu65FR3HUqfHHcp5nGm+1OzrJZcY1DaErAZ0oGuGIzCw8VBzYRQAg
         fOhq8g+Y9+YfnhWzN6iC/IdxwCgOh2BMO8svvVPGwk1E715EBY8F5qGqFsvCEhEC3bPa
         JwoRBe5YrumeurSkW5EapYGgKyFu9S0U9NL6nRA4Sg0Qfpi8wXirZ4VGixRHpf1BThSM
         akYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uhJpzbsC/oFdCLwbLV5P5ufOUnvxcC9mJVeSTRIcE7Y=;
        b=QFIpT/54bWAC9uf1+kviixWi4JyBsdxyY7Grav0zFfF7eNWx7PXdej0ZYVRwwcJf+s
         NOldVvW2RtvICog6oaevuVPHTW1BAFlK8cNmOuQaxZyiE0BopAXFh9/gBNkpSiDsoRM2
         PXa/tVqW6s5gtIZ+Anu2ptNWXdnSH/q/hWypAElJhpZDP/KhFFRwq5jA4bM28TiLLCXe
         ChtG38SHxCIjmoD0P+CTiUZNVdlOI3s/sPw0sVZDgEi6wMTR0QNdFYAgToVfGBqRFdsj
         Z76u94N5br65Xuw0eVsdGQOzkQQVqZZ/Jd4UEhOb/eycjZ4FjDNxY100GvawRP/sB2LH
         aURw==
X-Gm-Message-State: APjAAAWJnegrap8x+aHyyanq1vcbn1z6pvM/xh6x9N8hsmNVXYmk/TEJ
	xUpp8DNpJV3jrIR6yP6+RR37BT2VUeuSVJBoY/xc8QQt
X-Google-Smtp-Source: APXvYqy11XsrnjNSEFKOh9vTkHRmdSkFjA9IPhEHkV0qY2KgiwUig2qolpPayq8LTYOHMpugnv5v+vUcwMYbI3ML/rQ=
X-Received: by 2002:a2e:800c:: with SMTP id j12mr5823282ljg.22.1562940830223;
 Fri, 12 Jul 2019 07:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190711131241.22231-1-peter.maydell@linaro.org>
In-Reply-To: <20190711131241.22231-1-peter.maydell@linaro.org>
From: Christophe Lyon <christophe.lyon@linaro.org>
Date: Fri, 12 Jul 2019 16:13:38 +0200
Message-ID: <CAKdteOYTgv1OenmRhbVMTjC4vtc+8B7w_=ZtaOD3q8Y8zNeqKA@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.1] target/arm: Set VFP-related MVFR0 fields for
 arm926 and arm1026
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: euzsckNCKAEU

On Thu, 11 Jul 2019 at 15:12, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> The ARMv5 architecture didn't specify detailed per-feature ID
> registers. Now that we're using the MVFR0 register fields to
> gate the existence of VFP instructions, we need to set up
> the correct values in the cpu->isar structure so that we still
> provide an FPU to the guest.
>
> This fixes a regression in the arm926 and arm1026 CPUs, which
> are the only ones that both have VFP and are ARMv5 or earlier.
> This regression was introduced by the VFP refactoring, and more
> specifically by commits 1120827fa182f0e76 and 266bd25c485597c,
> which accidentally disabled VFP short-vector support and
> double-precision support on these CPUs.
>
> Reported-by: Christophe Lyon <christophe.lyon@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 1120827fa182f0e
> Fixes: 266bd25c485597c
> Fixes: https://bugs.launchpad.net/qemu/+bug/1836192
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
> v1->v2: just move the arm1026_initfn() part up a few lines;
> this seems trivial so I've retained the reviewed-by tags.
>

For v1:
Tested-by: Christophe Lyon <christophe.lyon@linaro.org>

Works for me, thanks!

>  target/arm/cpu.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index e75a64a25a4..05b78ba2662 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1666,6 +1666,12 @@ static void arm926_initfn(Object *obj)
>       * set the field to indicate Jazelle support within QEMU.
>       */
>      cpu->isar.id_isar1 =3D FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZE=
LLE, 1);
> +    /*
> +     * Similarly, we need to set MVFR0 fields to enable double precision
> +     * and short vector support even though ARMv5 doesn't have this regi=
ster.
> +     */
> +    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
> +    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
>  }
>
>  static void arm946_initfn(Object *obj)
> @@ -1702,6 +1708,12 @@ static void arm1026_initfn(Object *obj)
>       * set the field to indicate Jazelle support within QEMU.
>       */
>      cpu->isar.id_isar1 =3D FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZE=
LLE, 1);
> +    /*
> +     * Similarly, we need to set MVFR0 fields to enable double precision
> +     * and short vector support even though ARMv5 doesn't have this regi=
ster.
> +     */
> +    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
> +    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
>
>      {
>          /* The 1026 had an IFAR at c6,c0,0,1 rather than the ARMv6 c6,c0=
,0,2 */
> --
> 2.20.1
>
