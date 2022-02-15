Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp600623lfl;
        Tue, 15 Feb 2022 13:27:58 -0800 (PST)
X-Received: by 2002:a5d:4008:: with SMTP id n8mr686090wrp.156.1644960478370;
        Tue, 15 Feb 2022 13:27:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644960478; cv=none;
        d=google.com; s=arc-20160816;
        b=YcithzOYVgCkrvrMwWV3Gajd/mZJqwdmoz7tRZnKq+wnZOgcJP4wjBG3o+SYfph/1u
         z9wao5nVkbpT5iOvfTTLcPXkQA3fEfwT38vkKDhfWWribKr7OLRQow9JRu8YUG1L/yIc
         T5yuCdV80MQQUDsVvihuVl1V8kuzTSa2/8LZE2rQzG1ikxyPfwEVsb9FKRrD5TQE4Er0
         lfXAeNhknrm0zmynxQjeAJbynEFrIK9vwPNa8s//e/p1fxIv6XNovZzcxKZ2/mLJeR3T
         ZOR6/CUgqeUlyKknQjxYZCKbDjNFisTPxmHYK/aD8o8ULXgOL4q3BwXmjrVAcHQlh8yQ
         8ZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6qFJaQMy1Mp3x+eN5HPTrrshRZWsfwxyWNZq/IaXYQM=;
        b=0xg6EgQEVqI+YsG8pJ5J6ZrKlNjaZ8dU+ZOVGyywtpgM7Bz5oE3kQmoPzyL+nD7I20
         /tuPKLzoCD4dD22ARtkaxMAkZTjPhQ8vfJsLAnMRYXrI9YzchMGT117OLjMgiUSLAsR+
         66hNngnArQ8o4T5aW5V7bCwh7b+1gjRq0GFP5lmQ1iGFz9i6SrvYHtG6kujcULjACESo
         Uc/uYdr/6xLn7AIos23zN5OvwIpN+ilETtH66W7z8KTuHf9RzyKP0ItGEoFbsaT0gdOi
         wIC3mhG03GcHptbcmG5C7qmexc9UZoiznUsJ4ur4u4sohHl/wmuqk2GNqD8r9o6lGVkc
         oPkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m2zqYZC4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o205sor7570144wme.24.2022.02.15.13.27.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Feb 2022 13:27:58 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m2zqYZC4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6qFJaQMy1Mp3x+eN5HPTrrshRZWsfwxyWNZq/IaXYQM=;
        b=m2zqYZC4qc8XLotrnOxsRnFXf1HAlTXyoSVSRXVVLKrdH7wnHpAEvNp8HcWQGG6kx5
         A1mGhFOxzuIGU/y8KoD0lpJmJ5Xw2V8D8RQ2yocNLsBazjj8VZKzezr2viE5DcX/sOO4
         tgjTxrKwhKo5e8jLAejG4UQ/EN/hIl5BM3F94vQYsCu4bN8X9AqBsi1EmKCJY5MCt1rw
         AejnCaDlZWtNodN1aH/VGCx65btwzVLjQIt3fxT2tJBxR//WaPkAaiIZnBUAXRWJJ+dT
         NVLmMapf23eK97TfnKc4GaB3ZNpyfmcSEswJgasFUNLIdeXwN2NyxmbJeXNhYpiHx6Qr
         AH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6qFJaQMy1Mp3x+eN5HPTrrshRZWsfwxyWNZq/IaXYQM=;
        b=qtABi057uf/jQcCMY33iw0ZkQ9T4SIOsMjx9ZbzSMn0yxjgRZeMDvgnSufnjYPIb+A
         r4VUFoiipd6PG3E4XiTOdRTtd0SZvgxHG/I88ySJMrikyAqOig5YZ2KGU1wMQVYseEpq
         j7/y12zb2A+9hhklNcPIcU4X00PaPr8xqz8eybojReuAmmrOB7WhV8/kVSsJUMYBn0QL
         rCkS5KroHVmuMkAr/AqEqggCcR3w9ZrcVJRFAiBG/Ki7XkLulp49wN+NNQJrT1Q4+Xf4
         V3wW6OSpI8sAnYTjujmovTFLO53qEYkR0hJuzz94BH4SkIOB5j9DSKVZUdzssBUdv89C
         2pqw==
X-Gm-Message-State: AOAM53165iU2F0SVwNULiaGq2gIlYV12UxDwGw7OuGynJOZNOqaVw6Wm
	G83703eWJWR4UDbKnX1sPESkkRbcwlJtAAq7VM4+1FuByPcz8g==
X-Google-Smtp-Source: ABdhPJx5IXoinLidUvLLjSWyntDOIJR98dkbcDFAKnNiUmFBSFVb7NtKOpvndD4gNPwghupu+x8o0PEgYAtZW20kLBI=
X-Received: by 2002:a05:600c:2d05:: with SMTP id x5mr695075wmf.133.1644960478033;
 Tue, 15 Feb 2022 13:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20220210113021.3799514-1-alex.bennee@linaro.org> <20220210113021.3799514-2-alex.bennee@linaro.org>
In-Reply-To: <20220210113021.3799514-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 21:27:47 +0000
Message-ID: <CAFEAcA8852qLhKhKT9rnr00CG38i97gSnhoh_A0BoEp_xhe_vg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Andrew Strauss <astrauss11@gmail.com>, Keith Packard <keithp@keithp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: qAOOqnrbXR6r

On Thu, 10 Feb 2022 at 11:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The previous numbers were a guess at best and rather arbitrary without
> taking into account anything that might be loaded. Instead of using
> guesses based on the state of registers implement a new function that:
>
>  a) scans the MemoryRegions for the largest RAM block
>  b) iterates through all "ROM" blobs looking for the biggest gap
>
> The "ROM" blobs include all code loaded via -kernel and the various
> -device loader techniques.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Andrew Strauss <astrauss11@gmail.com>
> Cc: Keith Packard <keithp@keithp.com>
> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>


> +/*
> + * Sort into address order. We break ties between rom-startpoints
> + * and rom-endpoints in favour of the startpoint, by sorting the 0->1
> + * transition before the 1->0 transition. Either way round would
> + * work, but this way saves a little work later by avoiding
> + * dealing with "gaps" of 0 length.
> + */
> +static gint sort_secs(gconstpointer a, gconstpointer b)
> +{
> +    RomSec *ra =3D (RomSec *) a;
> +    RomSec *rb =3D (RomSec *) b;
> +
> +    if (ra->base =3D=3D rb->base) {
> +        return ra->se - rb->se;
> +    }
> +    return ra->base > rb->base ? 1 : -1;
> +}

This sort comparator still doesn't report the equality
case as actually equal.

>      /*
> -     * Find the chunk of R/W memory containing the address.  This is
> -     * used for the SYS_HEAPINFO semihosting call, which should
> -     * probably be using information from the loaded application.
> +     * If we have found the RAM lets iterate through the ROM blobs to
> +     * workout the best place for the remainder of RAM and split it

"work out"

> +     * equally between stack and heap.
>       */

> @@ -1201,12 +1205,15 @@ target_ulong do_common_semihosting(CPUState *cs)
>              retvals[2] =3D ts->stack_base;
>              retvals[3] =3D 0; /* Stack limit.  */
>  #else
> -            limit =3D current_machine->ram_size;
> -            /* TODO: Make this use the limit of the loaded application. =
 */
> -            retvals[0] =3D rambase + limit / 2;
> -            retvals[1] =3D rambase + limit;
> -            retvals[2] =3D rambase + limit; /* Stack base */
> -            retvals[3] =3D rambase; /* Stack limit.  */
> +            /*
> +             * Reporting 0 indicates we couldn't calculate the real
> +             * values which should force most software to fall back to
> +             * using information it has.
> +             */

What is this comment referring to? We aren't obviously
reporting 0 here...

> +            retvals[0] =3D info.heapbase;  /* Heap Base */
> +            retvals[1] =3D info.heaplimit; /* Heap Limit */
> +            retvals[2] =3D info.heaplimit; /* Stack base */
> +            retvals[3] =3D info.heapbase;  /* Stack limit.  */
>  #endif
>
>              for (i =3D 0; i < ARRAY_SIZE(retvals); i++) {

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM
