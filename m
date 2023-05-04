Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp462655ejq;
        Thu, 4 May 2023 10:17:40 -0700 (PDT)
X-Received: by 2002:a05:6402:14c9:b0:506:bda9:e063 with SMTP id f9-20020a05640214c900b00506bda9e063mr2050989edx.16.1683220660610;
        Thu, 04 May 2023 10:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683220660; cv=none;
        d=google.com; s=arc-20160816;
        b=qyJtRHY4KiRe4EWe0/tmXuliSRyf6fNc1hY9TyfEJVy+J/R5noZI1DrdiUisowOgqQ
         wGY/pYPcB8Kt08SaPcm0w63ypu9VRKS6caSVTa5YijDqQkvtz3DUICix0neaheUIhwPw
         1DC3QEPB7M2leJOUi5d25rrnJTKYn1rnkRtw99/WFdBJoQuTkuJKHIsdpYlFnmnSyJiw
         ZOnmwtnQS8IkyzESOV2SQPInwF6HQC5nHRCuBuJPG8GiAdacoyIlEMfI6mUrbO/aR3xE
         iZwxkPvE4JplQU7UQoyJRJ/owSdHSPI112yh49lrIbDUKUG+2VylGr1xDiYPZ8hY1il0
         TNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Erwkmn1QWtJmCFitJ+opzK7v1RucZrsKO1MzaSjGX2s=;
        b=yScHDvzKSnEJlu5s0hxlx/i2qZmp2CgXQ+AD9VLhlN8GpL/aSCjkWSb39xI8FlFrvi
         KvvYwFHMj0EQ84GUOoLMIxW/PzFVAUPeqjNseKJYWVcISI0l7kwNcgeq6PuE077tM6E6
         ebSlU/7NTBnYLvGSoPDrzFz4g//c6A7QRkQO6IADVktbWpI4kuzOsWdlithkkXM1OGy5
         8hNUPiwbixLdZ5aHfMkNKSztjSke4mYFmbGEixYaKo77PAWueUcKNgX13cwrPPyL8rGH
         Fh28Q5PTPCSPW83QetnRlqFSfI/mMI4aGAjWw3TlFpljP/tmS/REfufZSOnTYluft6Ja
         PJoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uIVcIz2e;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u21-20020a509515000000b004c3c3de1249sor2753352eda.2.2023.05.04.10.17.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 May 2023 10:17:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uIVcIz2e;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683220660; x=1685812660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Erwkmn1QWtJmCFitJ+opzK7v1RucZrsKO1MzaSjGX2s=;
        b=uIVcIz2eYILTkfhEygnb2LFFUzND6Ko8zMJjkdjf8p7yrJgopLVi2IZIYMG6RnqvCL
         /EecPduq4zjGqLVDv7FsQjo4KVlAwdo281mPzz+E4JbEw+S6igGECLaPD3nGLNtR2yMg
         rjmlRkAJtO2djoPJK3Vpyv0mB9h4Pz4E9bLIyAmDcTFyN82fj17JLDvnW3MvkwORE4qH
         mWRhvxKjxmbQ8VtfqAzg2KzMIeMdwyeMv2Lv4mOgkvMvA2Qi02CtxJsJBcKmuXqfgqBC
         RRm4OFv7Tpk4P295GUkQAuktGPhmOlJz/gpTlDYOtBD7jK5Y2H9TfX6pLT6hUbBt3fHX
         FKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683220660; x=1685812660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Erwkmn1QWtJmCFitJ+opzK7v1RucZrsKO1MzaSjGX2s=;
        b=GdIkoyr0/CouSYBf/C8xZQPy9hK18N7g5sTxk9xqdP0sB7h+ICOoIv63I4/l5LRQIt
         jIRq0pirlekqOMHzSoqNHsvtNkDAypTMMo1Ezho6MbXYXjHtrKPmXYnnOCowt0peX8Qh
         /T4aeJHeQViEt7JgnlX9nuGU0f0R8p3exkV7cikHLWHShPN441FXGYJwTtIaIO5yQRGG
         eGR2Lt06wEU6x2kfUvojKkehdJROGfqZ+gCA+Z6KESXoI73okDsNYfw6pKyBknxQeCtt
         gQmOfpe2T/jpwPt5C27cWIeAZGsXt8Xm15faTsEXJZUG0O/AG3jF/zQm8VVO6bOO029w
         YipQ==
X-Gm-Message-State: AC+VfDxAjSr7TmmZUrnGDEFcSmMzxj6bImjH3XlUiZAV3wDd7vTp2R4n
	Uqk+2UsWUTLRCredU0KL4XVOHTJm3fSAjZDEmIKR6qGO
X-Google-Smtp-Source: ACHHUZ4PYLD5Zp8P1GGVois+ol+CtZncpTj0iseOci6f+fQJLJG+RDQQLrqnaCfPwJNStwP4RUC1AqpSxBK3w4z11Kk=
X-Received: by 2002:a05:6402:31e6:b0:506:bb0e:bc4e with SMTP id
 dy6-20020a05640231e600b00506bb0ebc4emr2471187edb.39.1683220660185; Thu, 04
 May 2023 10:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org> <20230503070656.1746170-7-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 18:17:29 +0100
Message-ID: <CAFEAcA8muJ84GMqSBuU0P2YhfERM-kftfq07N8BVO2yG9p6jBw@mail.gmail.com>
Subject: Re: [PATCH v4 06/57] accel/tcg: Honor atomicity of loads
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
	qemu-s390x@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: CGmt2QOQ2Vlo

On Wed, 3 May 2023 at 08:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create ldst_atomicity.c.inc.
>
> Not required for user-only code loads, because we've ensured that
> the page is read-only before beginning to translate code.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---



> +/**
> + * required_atomicity:
> + *
> + * Return the lg2 bytes of atomicity required by @memop for @p.
> + * If the operation must be split into two operations to be
> + * examined separately for atomicity, return -lg2.
> + */
> +static int required_atomicity(CPUArchState *env, uintptr_t p, MemOp memo=
p)
> +{
> +    int atmax =3D memop & MO_ATMAX_MASK;
> +    int size =3D memop & MO_SIZE;
> +    unsigned tmp;
> +
> +    if (atmax =3D=3D MO_ATMAX_SIZE) {
> +        atmax =3D size;
> +    } else {
> +        atmax >>=3D MO_ATMAX_SHIFT;
> +    }
> +
> +    switch (memop & MO_ATOM_MASK) {
> +    case MO_ATOM_IFALIGN:
> +        tmp =3D (1 << atmax) - 1;
> +        if (p & tmp) {
> +            return MO_8;
> +        }
> +        break;
> +    case MO_ATOM_NONE:
> +        return MO_8;
> +    case MO_ATOM_SUBALIGN:
> +        tmp =3D p & -p;
> +        if (tmp !=3D 0 && tmp < atmax) {
> +            atmax =3D tmp;
> +        }
> +        break;

I don't understand the bit manipulation going on here.
AIUI what we're trying to do is say "if e.g. p is only
2-aligned then we only get 2-alignment". But, suppose
p =3D=3D 0x1002. Then (p & -p) is 0x2. But that's MO_32,
not MO_16. Am I missing something ?

(Also, it would be nice to have a comment mentioning
what (p & -p) does, so readers don't have to try to
search for a not very-searchable expression to find out.)

> +    case MO_ATOM_WITHIN16:
> +        tmp =3D p & 15;
> +        if (tmp + (1 << size) <=3D 16) {
> +            atmax =3D size;

OK, so this is "whole operation is within 16 bytes,
whole operation must be atomic"...

> +        } else if (atmax =3D=3D size) {
> +            return MO_8;

...but I don't understand the interaction of WITHIN16
and also specifying an ATMAX value that's not ATMAX_SIZE.

> +        } else if (tmp + (1 << atmax) !=3D 16) {

Why is this doing an exact inequality check?
What if you're asking for a load of 8 bytes at
MO_ATMAX_2 from a pointer that's at an offset of
10 bytes from a 16-byte boundary? Then tmp is 10,
tmp + (1 << atmax) is 12, but we could still do the
loads at atomicity 2. This doesn't seem to me to be
any different from the case it does catch where
the first ATMAX_2-sized unit happens to be the only
thing in this 16-byte block.

The doc comment in patch 1 could probably be beefed
up to better explain the interaction of WITHIN16
and ATMAX_*.

> +            /*
> +             * Paired load/store, where the pairs aren't aligned.
> +             * One of the two must still be handled atomically.
> +             */
> +            atmax =3D -atmax;
> +        }
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    /*
> +     * Here we have the architectural atomicity of the operation.
> +     * However, when executing in a serial context, we need no extra
> +     * host atomicity in order to avoid racing.  This reduction
> +     * avoids looping with cpu_loop_exit_atomic.
> +     */
> +    if (cpu_in_serial_context(env_cpu(env))) {
> +        return MO_8;
> +    }
> +    return atmax;
> +}
> +

> +/**
> + * load_atomic8_or_exit:
> + * @env: cpu context
> + * @ra: host unwind address
> + * @pv: host address
> + *
> + * Atomically load 8 aligned bytes from @pv.
> + * If this is not possible, longjmp out to restart serially.
> + */
> +static uint64_t load_atomic8_or_exit(CPUArchState *env, uintptr_t ra, vo=
id *pv)
> +{
> +    if (HAVE_al8) {
> +        return load_atomic8(pv);
> +    }
> +
> +#ifdef CONFIG_USER_ONLY
> +    /*
> +     * If the page is not writable, then assume the value is immutable
> +     * and requires no locking.  This ignores the case of MAP_SHARED wit=
h
> +     * another process, because the fallback start_exclusive solution
> +     * provides no protection across processes.
> +     */
> +    if (!page_check_range(h2g(pv), 8, PAGE_WRITE)) {
> +        uint64_t *p =3D __builtin_assume_aligned(pv, 8);
> +        return *p;
> +    }

This will also do a non-atomic read for the case where
the guest has mapped the same memory twice at different
addresses, once read-only and once writeable, I think.
In theory in that situation we could use start_exclusive.
But maybe that's a weird corner case we can ignore?

> +#endif
> +
> +    /* Ultimate fallback: re-execute in serial context. */
> +    cpu_loop_exit_atomic(env_cpu(env), ra);
> +}
> +

thanks
-- PMM
