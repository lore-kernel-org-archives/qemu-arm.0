Received: by 10.223.150.237 with SMTP id u100csp264376wrb;
        Tue, 7 Nov 2017 09:05:04 -0800 (PST)
X-Received: by 10.28.156.23 with SMTP id f23mr2125460wme.128.1510074304276;
        Tue, 07 Nov 2017 09:05:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510074304; cv=none;
        d=google.com; s=arc-20160816;
        b=YlgBuDgDlU8Zihe36xfj72+l81FJMkSZ/MqMbSNhx+f6d+JFL4dFgXyLac6gWR02zO
         H3KACf+i/3Rx7C1vy+XkejDBUdWRw2Ga+OThA0Un+czapUG4GnlRhwwegqoMiwP8e1WQ
         rPi5PRdkL3HsfGwRVg43t46eDZbqcgaUsMalmQ8y2R6BBJg/8jdIGEfBvdt74kWMVrZn
         6B8GFJPM3cDmm0G6CmrWCERtoenTjo0bobyZK6mWu2oPLgBcYhJMNnnFT9XmT1m++Stl
         W7p19iUSaI0ljSmj83Yho0LCa8GOjSz9PY3NQkKc1zq3zZTjaQqRPc/Jn4qumzx09yO/
         1b8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=LEwIXpXBWu3jupbcznS6Am5YYWVYucgo1MALHs8GPLI=;
        b=bArqZWeBjC3NMMhdHTGAkGhEAiopOWBLAG+Yzwg9XnvQBWnYC2bcEVJcOO2PXgvE8H
         HBD/0OAeAO5TNKSDgrG4wNhnF6AHbCr0o2foxfzBIgIJWQ5+JcRlgZf+ep+lCrToZyBj
         QVAky3rJHN4TB0KkEpb5rQRZRJWzpVzmea88D3s1ppjE0RZiAog2270hYFtYFGsuwGAE
         5Df6WRoefQnWNAqMIMdM7Ctb7rv++GUu279b+jTXppfMOf2izczOlH8LCQpqjG0bEuap
         e65P5xuoeJxLM8GZSc9huHNuZx4cZv4bv4nE00XSC3AavEOrzR0HQdQM7PCzCOSmTJeU
         FIZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AOY/kWQ/;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e20sor584264wmh.22.2017.11.07.09.05.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Nov 2017 09:05:04 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AOY/kWQ/;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LEwIXpXBWu3jupbcznS6Am5YYWVYucgo1MALHs8GPLI=;
        b=AOY/kWQ/S+0p49q9PvS1FQrpSJzo5tDnekOZJPMwMHR3RTBIgcjioV/PZda+m7D/qR
         ZBuPQw7n9fnT1aSBrEVKkTa2Psc3XA5Jp/nyogL/QGOl5zWT/ccQQod473Ldy/8gkea+
         cHKK5XQqoYgUh0Nm2o5MVd+GxkXe4GtX+oBh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LEwIXpXBWu3jupbcznS6Am5YYWVYucgo1MALHs8GPLI=;
        b=nvb672GGmXEAmOAo2olyTMxM9nMzK1HivSHBq/HtL5rPxKFwGqhgWGz6TN0f5HT/cz
         Y5AqQ1DX2We4vG2MqcclFJeJg/FgsVG28nw0X7iytgSdPzfFsUz8HIr03YgbiCSE2Q6H
         9KWKoFebGiyu66i7lWYdJ3uuzqsJdJyiUvQdb0y51lA2xxGunHBpeaNjkEdpPO7PXakk
         Vvt26WY8do4YNLeqInSf8oyX/T0+xrZF/DpSTa8TV4eAmCsZdQ3OIPppSWgzS5oFYMbG
         Tp6IjNAkMVUsgXIy8+nIa0M2tNdHT12MdSf/GJHdHRhFpygB5aOpR/usacs9Pn8rhNf1
         VNWg==
X-Gm-Message-State: AJaThX7HI1a7xLs/izMbHFG2jjjraVYn2JP1IlipoIzytQ1HeSHLgQ6U
	VnpFk6pEziCadtTXmxdz4BRK1ApnOcn4jK6qKTU8p5L8buA=
X-Google-Smtp-Source: ABhQp+QTppC7QaQWw9j+Uo9QFI1RcJ1NHaGZNyKWhH56EMxuGPZpulcS5pFUufIkmv2ZnA18X+Wqdst+tIwBAiks8UU=
X-Received: by 10.28.10.147 with SMTP id 141mr1803987wmk.40.1510074303720;
 Tue, 07 Nov 2017 09:05:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Tue, 7 Nov 2017 09:04:43 -0800 (PST)
In-Reply-To: <20171107165226.22546-1-alex.bennee@linaro.org>
References: <20171107165226.22546-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Nov 2017 17:04:43 +0000
Message-ID: <CAFEAcA-E4Tq0gi3q5z+_5JOy0-j0=59p5WiKNFP9qmKG8=r4bg@mail.gmail.com>
Subject: Re: [PATCH] accel/tcg/translate-all: expand cpu_restore_state retaddr check
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: T8Snsd7BnmrD

On 7 November 2017 at 16:52, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> We are still seeing signals during translation time when we walk over
> a page protection boundary. This expands the check to ensure the
> retaddr is inside the code generation buffer. The original suggestion
> was to check versus tcg_ctx.code_gen_ptr but as we now segment the
> translation buffer we have to settle for just a general check for
> being inside.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>
> ---
>  accel/tcg/translate-all.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 34c5e28d07..eb255af402 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -357,16 +357,20 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t ret=
addr)
>      TranslationBlock *tb;
>      bool r =3D false;
>
> -    /* A retaddr of zero is invalid so we really shouldn't have ended
> -     * up here. The target code has likely forgotten to check retaddr
> -     * !=3D 0 before attempting to restore state. We return early to
> -     * avoid blowing up on a recursive tb_lock(). The target must have
> -     * previously survived a failed cpu_restore_state because
> -     * tb_find_pc(0) would have failed anyway. It still should be
> -     * fixed though.
> +    /* The retaddr has to be in the region of current code buffer. If
> +     * it's not we will not be able to resolve it here. If it is zero
> +     * the calling code has likely forgotten to check retaddr before
> +     * calling here.

This part of the comment isn't correct -- it's entirely expected
that we will get here with a zero retaddr, because that is
how the rest of the code tells this function "no state restoration
required".

> If it is not in the translated code we could be
> +     * faulting during translation itself.
> +     *
> +     * Either way we need return early to avoid blowing up on a
> +     * recursive tb_lock() as we can't resolve it here.
>       */
>
> -    if (!retaddr) {
> +    if (!retaddr ||
> +        (retaddr < (uintptr_t) tcg_init_ctx.code_gen_buffer) ||
> +        (retaddr > (uintptr_t) (tcg_init_ctx.code_gen_buffer +
> +                                tcg_init_ctx.code_gen_buffer_size))) {
>          return r;
>      }

thanks
-- PMM
