Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2026098lfb;
        Thu, 7 May 2020 07:39:14 -0700 (PDT)
X-Received: by 2002:a6b:d10c:: with SMTP id l12mr3091358iob.44.1588862354514;
        Thu, 07 May 2020 07:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588862354; cv=none;
        d=google.com; s=arc-20160816;
        b=KJxQPJmEP9DzeOb9vhFmoJMp+jgJdYhtDXQkiJy2Fk4vIISk/d6eTyXxzV8WJEzGuF
         xOeu5yN5zX6ywFAmekUe4PDviWGM70ECO1zqI1SA7MVq0ITXeEBIexhluY+NMSnnj/Tb
         D6yLe4tVd7YMMYJrssCC5dkW27G5zBnvXgVDwawFA8Dhs4N1xD1MGccIxXCBNltnjWXp
         ogOJ00nQ5Vp1Pc80sEMGcMm6bqsq/4SAY7xrr27vfpIs01uoXZfF4L+vM32hiJNEchh8
         zZs1sB/diQShmP00oy+cIBLAwdsxXXrRnRQ3q2M5ar6+agw/Lqrd+Iq0SxgUttpJgMf9
         qlQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hCOO5I/BSp4UILMcui5em2mtGw/peN7kCZALbU8+zZU=;
        b=q/AI+3zpXoXxFL7odtqlc31tMRSn8fq4E/1FWcGOHuiLSf07Ux2byqdwUWI8Bhe8fU
         MpyIv7oYDVPmyOLsiOc6hYM8p5q+1R+1Uz0hV1VTgx9E8//oSU1WUINg+JeuOUdczCVw
         bEXnyKxRRO0/oZ5Sgruoz2hsfXp4viTmjS81WcGsvIbHUMrRqteW1MBVatIvkjwCOCcs
         oJN2JVBjkV95mGyHcSbLGkwlzrJEZSbxoUjdWXRSF3zjJx6uNg24pcjSsFqJdLx8NapP
         gy7EdsxUkbnIxY/cGs0sWImKmu89U4K+MbtG28RCDMD+Q6OepkCAPy9O1A8GX8oxUoWl
         eZHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kGYFd8MO;
       spf=pass (google.com: domain of laurent.desnogues@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=laurent.desnogues@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <laurent.desnogues@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x8sor5351234ill.33.2020.05.07.07.39.14
        (Google Transport Security);
        Thu, 07 May 2020 07:39:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of laurent.desnogues@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kGYFd8MO;
       spf=pass (google.com: domain of laurent.desnogues@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=laurent.desnogues@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hCOO5I/BSp4UILMcui5em2mtGw/peN7kCZALbU8+zZU=;
        b=kGYFd8MODA1NRnNssYU9oFKKNdh/i2NJdD+Wjp9TYo0vs4baiBeLZRrbU0tqQbKVXG
         k9xAUs8rX0wQLr5fqGHCVkQfUracAQwip1CXCoTWn1xgieGvd9jROIFoI6t3uCCA3aFh
         3G72W8VvfGO12vSboqB/4CRQRICGj6KBEyHWeJVy6a4ly1b4m+K9dkiqqcZm9nMibHKl
         eNp95kq3V/RQAOdULaRvmMF40ZHMDlMWU3kfyjbRoJ0RL4H+7G5XmR7W9552irhaV477
         es/cbCb3Os1sdGIYxDRpYp5ZfJrKAH4k8QGg0lDAdKBhe3ohaj5PAeDteTKZWF/hF5l6
         H6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hCOO5I/BSp4UILMcui5em2mtGw/peN7kCZALbU8+zZU=;
        b=BQlUd8vZr+RL1lyEL3bZbpCuJ0ZrlQRMVz+pKhKiyHUL6pCGUQEvrE3Jk0eLtypkm3
         9L3CUrdY5ptff0ie6jtt+wPnKUdzVAYU1TuT5kjUa6hnNQvxsKopp60zZGzC8adu47+D
         lWFQ3+J5HYzOui03fq0z+D5HYaTKHRtf9F2Pp0VClfSv7fMMMR6Z1aZTj+iBbjhcwOiq
         mWqAf3z0WMfd7xLdXvn0b2t9uRK8d9OJCCyf4yvWLNH9WuSvuMHkM6fwY8Xz79XaFR0l
         cqToBabVo1GP9devfIVcS93UTCoq7fda1DCzrAzt55Pcpy+EGOPrSvY51mb9DkhHhMg5
         5bTg==
X-Gm-Message-State: AGi0PuY16PkfbodcVSFNoS8EylPALIiDuCHUEbE9cI/aMTUnzmnqSC2D
	nFNpsIBDrWnZ0007bC+fKqGVO9P5UDwgjA+RMOwWm2T/
X-Google-Smtp-Source: APiQypK/aEf6jyDD5LHBc8xRwSBi4zBxyl1FY0EHqV26HmXNBWpN/Y0Tb2a+m+o0rbPM/Vtzlxpq4Grrp2WDbOHP6BM=
X-Received: by 2002:a05:6e02:68b:: with SMTP id o11mr14351664ils.245.1588862353869;
 Thu, 07 May 2020 07:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200506183002.3192-1-richard.henderson@linaro.org> <20200506183002.3192-5-richard.henderson@linaro.org>
In-Reply-To: <20200506183002.3192-5-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Thu, 7 May 2020 16:39:02 +0200
Message-ID: <CABoDooPCvC4Y+G4CGBUhPT_ce3rY6_ZZvTnvv8M+sXPkpN4raQ@mail.gmail.com>
Subject: Re: [PULL 04/10] target/arm: Use tcg_gen_gvec_dup_imm
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: aIGn4Tqq2zt2

Hello,

On Wed, May 6, 2020 at 8:30 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In a few cases, we're able to remove some manual replication.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 10 +++++-----
>  target/arm/translate-sve.c | 12 +++++-------
>  target/arm/translate.c     |  9 ++++++---
>  3 files changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index a896f9c4b8..62e5729904 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
[...]
> @@ -2044,7 +2044,7 @@ static bool trans_DUP_x(DisasContext *s, arg_DUP_x =
*a)
>              unsigned nofs =3D vec_reg_offset(s, a->rn, index, esz);
>              tcg_gen_gvec_dup_mem(esz, dofs, nofs, vsz, vsz);
>          } else {
> -            tcg_gen_gvec_dup64i(dofs, vsz, vsz, 0);
> +            tcg_gen_gvec_dup_imm(esz, dofs, vsz, vsz, 0);

For an indexed DUP, size can be 128-bit so that will fail the first
assert in tcg-op-gvec.c:do_dup.

Thanks,

Laurent
