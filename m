Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp381645lfa;
        Thu, 10 Jun 2021 03:57:55 -0700 (PDT)
X-Received: by 2002:a17:906:49ce:: with SMTP id w14mr3882368ejv.273.1623322675663;
        Thu, 10 Jun 2021 03:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623322675; cv=none;
        d=google.com; s=arc-20160816;
        b=Q7aElT9me/mn5zeHqeDrerCr9+5P6gDpOM/G2JtRGtt5oYEWrOBjNO+Jw+xR/N4WiW
         HIDQW/nFSIjEbqaGbqQhHI/P35z0QJ3ft2HrEW6F690qI0MYtsHeNZSsA/awdYaNGGGQ
         2t5AGlSPwMRV77WQdyMMsJ6lrxOeWfrr+6vu1NinWwpJepWoqcOwnfyN3Wctrt/XsrO8
         p48DW4EOStnwSIfPWk/CDllPoF33nqbMjGwEa30IOsFJu52M/wX/MkOIt90yMhjG+EuB
         xU5OG8q490oXyJUtqV1Ugj9Gkon0Jpeu+rRYAPRSoEiwrBR7MrbPdaCPxEAr1AVSWBUH
         1tMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rn766lPQ0fIipGun9ZkiWOP1Xw8apb4bZeB9cJpUiI8=;
        b=FY63XK/WTpXVpwJ46/DPW1Vg2w9SAAAqvruIcsp+NWpBtKcHw9ZqwBD/BbYs30EsHi
         p8SbWnRixxgR5zqMEhKAmzJk+PbW7oCx0z6nYRexd3Bti9NdwcUmSXA7fLoCt5Ml3NLE
         G4Mmkz05QILs3BJ6WycZcAuz2gboahSyb766oNTer+E3DMpn/zgtFgI+mkxXLjXmkubg
         aQytJTc+3ynm+EkrEGeJ5pZ+SkY5r1deBVMc5++7f4pgpHq2HHUt4baVZh74jaTMUVT5
         PLZ5UnOEEBPK5x3yH7mls+Q5s9L2vZ6lEYW8v3C+XGWZtJxtko/TmgOCNgKoIFwMlVCk
         ArAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eLsLUqAK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r23sor2657537edy.15.2021.06.10.03.57.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Jun 2021 03:57:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eLsLUqAK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Rn766lPQ0fIipGun9ZkiWOP1Xw8apb4bZeB9cJpUiI8=;
        b=eLsLUqAKtIRwRpv1IwKdfkfE5EXCAZFZlSX/kQojZXAtDaSTNWnWpuXdKEVxTWiP2W
         kySZeceI9XRnwVaqnwoAsnvuErn+7uRAKcD3aVQEcdvEw+4iRExSF0EcfyhMK7fzeqph
         yqJqnrnjYprHTLqr0/sdgoLJqoikarFWPlEaVfgjafLKT1TSKhjDJXOB4+sXlXYoWSyq
         68g0Xhb4ryVwLXwIdjw57Ep+FKiLjjndcVWc7Bfc6bKpMA7HPkuBOx7qfeAkdus0aH5K
         nnOZN65phqD3txySCEv0ono9NE0jWj7fZJgWZxCUD9T0pUpqCVYnOlMbn+hzy0qtJVF/
         CEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Rn766lPQ0fIipGun9ZkiWOP1Xw8apb4bZeB9cJpUiI8=;
        b=dlLWtRaxsrONqz2QAZStuLlE9MAD10z2z6+aa42q3cAvTS25ZUNEkNjdbMilc/hy7R
         UJOkGwCVcRQhC81hQag9D9b8GDZU+Xl73bDFET9VUcVMqVY2Z7QxveW8m4HqWAtJp26z
         pj85G4lISsKKSKZ+PWF7UB1csi4u3UZUexwl03BRsCFJp1ULtjkLuj+EBr7+UqYVenzo
         Q80H49rhh7axX66o/DBtAODNNDGEHfVMTt0XZgqRcMz0AMqvYHXpZBVOF4g2KPJq0TRx
         V1yDvtng1kXMroxD020d/B02/PkaXhhoTSGnwM1iwFc9cNeLYzbyWdW668rP+Yt6o0Bn
         rCLg==
X-Gm-Message-State: AOAM53113jNIIp2eiT6bcNp4Yp2ZCoRUt01RZdRDwZc9rnnNjW6RC8MB
	2v3sMRDy2/qoEj08sgi5HC1pFZ4lqkAPx+eYbGhZZbViI2DdDT3z
X-Google-Smtp-Source: ABdhPJyctY+UVbXbXUS8Hj0IdqcAHEUW2X7tROlBaZ4p4skkg9ADhGzXiwSxd8iiP7cM88qUolyFCNLH/xBv6Lr7S+8=
X-Received: by 2002:aa7:d755:: with SMTP id a21mr4164595eds.146.1623322675275;
 Thu, 10 Jun 2021 03:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210610102617.17281-1-alex.bennee@linaro.org>
In-Reply-To: <20210610102617.17281-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 11:57:21 +0100
Message-ID: <CAFEAcA8O1Cca2BnNp5c=0yYbKExYH1sUYe68C_msG_oBSUGW3g@mail.gmail.com>
Subject: Re: [PATCH v2] semihosting/arm-compat: remove heuristic softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Andrew Strauss <astrauss11@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: jqg9UElfTuVR

On Thu, 10 Jun 2021 at 11:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The previous numbers were a guess at best. While we could extract the
> information from a loaded ELF file via -kernel we could still get
> tripped up by self decompressing or relocating code. Besides sane
> library code like newlib will fall back to known symbols to determine
> of the location of the heap. We can still report the limits though as
> we are reasonably confident that busting out of RAM would be a bad
> thing for either stack or heap.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Andrew Strauss <astrauss11@gmail.com>
> Reviewed-by: Andrew Strauss <astrauss11@gmail.com>
> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>
> ---
> v2
>   - report some known information (limits)
>   - reword the commit message
> ---
>  semihosting/arm-compat-semi.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.=
c
> index 1c29146dcf..8873486e8c 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -1202,10 +1202,14 @@ target_ulong do_common_semihosting(CPUState *cs)
>              retvals[3] =3D 0; /* Stack limit.  */
>  #else
>              limit =3D current_machine->ram_size;
> -            /* TODO: Make this use the limit of the loaded application. =
 */
> -            retvals[0] =3D rambase + limit / 2;
> -            retvals[1] =3D rambase + limit;
> -            retvals[2] =3D rambase + limit; /* Stack base */
> +            /*
> +             * Reporting 0 indicates we couldn't calculate the real
> +             * values which should force most software to fall back to
> +             * using information it has.
> +             */
> +            retvals[0] =3D 0; /* Heap Base */
> +            retvals[1] =3D rambase + limit; /* Heap Limit */
> +            retvals[2] =3D 0; /* Stack base */
>              retvals[3] =3D rambase; /* Stack limit.  */

The spec:
https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihosting.rs=
t#sys-heapinfo-0x16

doesn't document that 'return 0 for "I don't know"' is valid, so if we're
going to do it we ought to at least note that we're deviating from the
spec here.

-- PMM
