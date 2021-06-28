Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4297253lfg;
        Mon, 28 Jun 2021 13:02:13 -0700 (PDT)
X-Received: by 2002:a05:622a:108:: with SMTP id u8mr23437723qtw.326.1624910533043;
        Mon, 28 Jun 2021 13:02:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624910533; cv=none;
        d=google.com; s=arc-20160816;
        b=MSeDiELdnYMyZadEO+I3HF2HhEQtZ97SVTf/u5zADXaYK7zmqXUg5tY8IDgdu/FnsL
         eTKNrJSE2LxvCtmlmHfL+youvBjqnLH3rAX6EXimDOiHHeVV6zs6J9lXZxBXQFNr4oMZ
         bawHRsXeZqZSu2wi2pwTU4R8MuwjNAun4WMHUs6l1ZcBtxBmq49BPY6OUPjHbvHytZoW
         zzlxiuEFnp4QumLfAO6Pnh/wGXV8hb1+kwKiP141nT1pmrqEReZAgndW0CuIinmXwVL3
         JG+9c6ZL33xhSxMNJezzyyp8uWH44B+vez7QOAGslofbiOReDXv/8btWySyWUdOuH+t+
         3Hyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SJGXWSQqZqpp78kNZXI1pjCnN4IFLVvgnZNfWDe9g+8=;
        b=BqvpXAMwmBLddEHWD6pP8RI2DXtW/xYLKuw665FnsU87N3IHY/eYTrH6PCzQc4VH04
         OSyVuqaonV9GA5aXf6tUwOBZIGTMOC3RzMYA99sdiUzPf6Zmnl4HFu2Yw99TQghj2s/o
         phxzgxNVs+ZmPDyIGj7LkBOzyYeFb67d4t+euMDD+bVfpztdLzg67/DU35MF52Dl6Y+i
         S2zZtCyFF46ECK3qHAUze4URb3L9btYhJwQiGDLUvKDmB8d5dH+PhYyVXXJAPXUIH4Ui
         YmTPXENH4QiIKTRpr8Iyo59FNQIFxnk3ZVpBSK+lTcIiyfqM8sbbgb/ZGcguPLmeXsDJ
         EGWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uUbc12sC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d6sor3816161qkl.177.2021.06.28.13.02.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Jun 2021 13:02:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uUbc12sC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SJGXWSQqZqpp78kNZXI1pjCnN4IFLVvgnZNfWDe9g+8=;
        b=uUbc12sC5H8QxpgmHay1oM/EJglgmL2ipkNUMxNWLPJ/umMNcGU5foZmp22oiBHtVS
         33oZQUYOFcaodFWuVyxJrV6SGxT+VvJBqdeVfi47fESrWRmUny1SFvQsqZTdAcmx4Hdc
         oDb92TUP6r955N8DPtw+G1GdJszVgOXcn6N/n7837o1gJIs8/fCiL098JGgOijP6ugJH
         lMMnzdDyyD4CfXXdAfmT9Dg8TcnBYRJINwVAdnFWtNGVZ2vDYqy8xwVIB4gJ6wLpzRJp
         TcZDDQ7sXGwDgnfoxC3yjtDQw8O0Qho2wcx8DwiJHlTWAgCFzWf7tTf69L83/dWAl6lx
         6Oiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SJGXWSQqZqpp78kNZXI1pjCnN4IFLVvgnZNfWDe9g+8=;
        b=MwyN5/jwPdxcoB5B9F7AFIdFGgFWESem+dYVPlVRkHLvO8Bib84wIrktqwvmjVCEBd
         r49yY9yFhKrp2zeej+OH992e1MJ8yv90GVRntyN9vhdY13Imu4qbuDk0XYw0FJ1kAZ4K
         WvOns68qHZt8BZFZfSwUq7P68Lo0tr30/cfFfJPGFTWBbTnDLh0HfZkXfgYtJR/UHsJa
         EeQl+nnEqjghWNQxhIdmTFMjrQslw0SdDiFbb2USO+r9A9KWSQb9GYPPGm6guesvx5vr
         YbsXy7OHvepdt1j67/ERxmKtrpeGME6NGx024kbNtiI8dqn3xwW+ocfxEFnMhsvk2G5u
         kMdg==
X-Gm-Message-State: AOAM53038CVTD2YRM8dhf3Lkc4Hy8wmIIGuEpoLcQskXG/u9ouIGCVF1
	STmiZJtGBiuEZfVAOKpisfi51ef50ABRUgEZ6KsvyslQxEPD6+jM
X-Google-Smtp-Source: ABdhPJydp+Xl452A5QRMgDvVJUgZTGlq67WeKkDRI0BlQbnhhZSR0awtyMLd8J3uSgiai/6oUSzLDzfgA+8XOs1WUEs=
X-Received: by 2002:aa7:c644:: with SMTP id z4mr34760822edr.204.1624910532099;
 Mon, 28 Jun 2021 13:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210623134756.30930-1-alex.bennee@linaro.org> <20210623134756.30930-3-alex.bennee@linaro.org>
In-Reply-To: <20210623134756.30930-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 21:01:35 +0100
Message-ID: <CAFEAcA-UPE5+moyVM-1pJ_gi9fj3t1nWtWfZaZ13hkd6-=L5nw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] tests/tcg: port SYS_HEAPINFO to a system test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 7nnoZq87xo26

On Wed, 23 Jun 2021 at 14:48, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This allows us to check our new SYS_HEAPINFO implementation generates
> sane values.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/tcg/aarch64/system/semiheap.c | 74 +++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 tests/tcg/aarch64/system/semiheap.c
>
> diff --git a/tests/tcg/aarch64/system/semiheap.c b/tests/tcg/aarch64/syst=
em/semiheap.c
> new file mode 100644
> index 0000000000..d5613dca59
> --- /dev/null
> +++ b/tests/tcg/aarch64/system/semiheap.c
> @@ -0,0 +1,74 @@
> +/*
> + * Semihosting System HEAPINFO Test
> + *
> + * Copyright (c) 2021 Linaro Ltd
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include <inttypes.h>
> +#include <stddef.h>
> +#include <minilib.h>
> +
> +#define SYS_HEAPINFO    0x16
> +
> +uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
> +{
> +    register uintptr_t t asm("x0") =3D type;
> +    register uintptr_t a0 asm("x1") =3D arg0;
> +    asm("hlt 0xf000"
> +        : "=3Dr" (t)
> +        : "r" (t), "r" (a0));

You should include "memory" in the clobbers list here, or the compiler
has license to assume that the semihosting call doesn't actually
write to the struct info.

> +
> +    return t;
> +}
> +
> +int main(int argc, char *argv[argc])
> +{
> +    struct {
> +        void *heap_base;
> +        void *heap_limit;
> +        void *stack_base;
> +        void *stack_limit;
> +    } info;
> +    void *ptr_to_info =3D (void *) &info;
> +
> +    ml_printf("Semihosting Heap Info Test\n");
> +
> +    /* memset(&info, 0, sizeof(info)); */

Why is this here but commented out ? (If you want to zero initialize
the struct, using "=3D { }" when you define it above is simpler.)

> +    __semi_call(SYS_HEAPINFO, (uintptr_t) &ptr_to_info);
> +
> +    if (info.heap_base =3D=3D NULL || info.heap_limit =3D=3D NULL) {
> +        ml_printf("null heap: %p -> %p\n", info.heap_base, info.heap_lim=
it);
> +        return -1;
> +    }
> +
> +    /* Error if heap base is above limit */
> +    if ((uintptr_t) info.heap_base >=3D (uintptr_t) info.heap_limit) {
> +        ml_printf("heap base %p >=3D heap_limit %p\n",
> +               info.heap_base, info.heap_limit);
> +        return -2;
> +    }
> +
> +    if (info.stack_base =3D=3D NULL) {
> +        ml_printf("null stack: %p -> %p\n", info.stack_base, info.stack_=
limit);
> +        return -3;
> +    }
> +
> +    /*
> +     * We don't check our local variables are inside the reported
> +     * stack because the runtime may select a different stack area (as
> +     * our boot.S code does). However we can check we don't clash with
> +     * the heap.
> +     */
> +    if (ptr_to_info > info.heap_base && ptr_to_info < info.heap_limit) {
> +        ml_printf("info appears to be inside the heap: %p in %p:%p\n",
> +               ptr_to_info, info.heap_base, info.heap_limit);

I'm not sure this test is valid -- the 'struct info' is on our stack,
so it could be anywhere in RAM, including possibly in the big
range we got back from SYS_HEAPINFO.

You could if you liked check that for instance the address of 'main'
is not inside the heap (assuming that you load this test case with
the ELF loader, it should be in a rom blob and thus excluded from
the heap range.)

> +        return -4;
> +    }
> +
> +    ml_printf("heap: %p -> %p\n", info.heap_base, info.heap_limit);
> +    ml_printf("stack: %p <- %p\n", info.stack_limit, info.stack_base);
> +    ml_printf("Passed HeapInfo checks\n");
> +    return 0;
> +}

It would also be useful to check that you can write to the memory and
read back the value written (ie that we have not been given
back a range that's read-only or which is not backed by anything).
(You might need to jump through a hoop or two to check where your
current stack is before potentially stomping on it...)

thanks
-- PMM
