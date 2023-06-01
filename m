Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp423926ejb;
        Thu, 1 Jun 2023 06:01:04 -0700 (PDT)
X-Received: by 2002:ac2:51b2:0:b0:4ec:7b87:931a with SMTP id f18-20020ac251b2000000b004ec7b87931amr1414541lfk.13.1685624464006;
        Thu, 01 Jun 2023 06:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685624463; cv=none;
        d=google.com; s=arc-20160816;
        b=tED/5Mox1DVM5sz7Y8qjhpfVjwOj4OCKFLNksHI6+s918+wcU1OaG4T3Xm9JGS1q78
         cYPPb0SLc4BZPsgtDppiL4OZYDAfiCZykoC8OZolUKnNmk6ksP5ZN9UVHI1L25jrphw/
         AxOXPYTeiDyF4Eof5tW6z772xQzHdhGewVhYNONQSOcgLIKWu4Rtem9iGE8rUswBl9Ix
         JkAfClr/n5/qAjoAcU7E4kO7YPyDbiwTQYTrGpDn6f2eFhk7p5WBHBLrrFA4W0T5Flfu
         tsY4inWPQ6xMx5wm2UUMH8BbMnav9j5OQ1mKT4eXzgOOVYZRvtX70HttSfj57xtrLYjB
         ipqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Jf+2LrbrzbTmkdZVcT04IKm82iTnVpk5mMk8DbFhBDU=;
        b=ghEIDDNNG725SUK3jw1kiRnkL/uNGZXrWM8mgk2B/r21BV9DxrzU4OpFovbc1MdqfO
         Xa0kCEOj/qTeePBaWBzjyJ5XHK7/RFHtQlIENmho51tDDJOsaAiixMODOZNEiefxV8jO
         TyEfGA3vun1MZ7depWDDKHa4R0eucyIiAcjOMnrlIhvPOrcm1YVDdxcVBct3ya9rl9c/
         ujFE8MzsIt8Q6PtFlLEDb8hxvqiGoEhsDBPTUnHHndBr22AYSrrzA7usRIkYC9dR0lFj
         eoSG9Z8/KX5b7+DDOp/xrwA/RoYMy5FrdKGVfUw2QDiP52jxVV1p+QLEOz3xFDs1IS/E
         0Fwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lCLZfu35;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t15-20020a19910f000000b004e7fc2c0519sor2475719lfd.8.2023.06.01.06.01.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 Jun 2023 06:01:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lCLZfu35;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685624463; x=1688216463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jf+2LrbrzbTmkdZVcT04IKm82iTnVpk5mMk8DbFhBDU=;
        b=lCLZfu35eQJ9jU1Xc3SvlozzX7Jxjj8HckNfnwRXQqOxhi6EP/zu+LWPeFRtMglajJ
         +0f9PcP8JYH3EEU0l9yvFXrY7sdvAC16Z+eHmFKj4glhp7GLcdhLcodGI+NNvp+pPaGC
         JcfNmbeQ9WF5L6U0i4UnTKycu6LPsKgEvTFURtkldZlXVW+971MxX7yIULmQAjO/Y2EI
         CX/OYOa9mc2a4S6KnpTbzuKoq3QFL43b0ZPleC7tE4izYcIcBJEi2gD1yfg1oKr5V9UW
         +xapPqigYXa5gjXGKyWI/ik5DH7zhxWCYdQIYgwCUwCOefAZlyJnAo98KRaYR7GKVNCM
         YsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685624463; x=1688216463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jf+2LrbrzbTmkdZVcT04IKm82iTnVpk5mMk8DbFhBDU=;
        b=fHPn73mZSB8I91AdgXETEtFjhiigduT/EzNWU4WsAoEArjz6mQSLpoxYzdG4toGe37
         BLvrlM6kektwTtEpR9+XbyN7Ajt2H0YIJsfdnq99FSCUBFQQBX2ZaMkOCjmYHqXqFKye
         YEx6UFgZoM3eAmL6QSBFpLxSbwckzysr3RT0rjmNEWYx1NJbzIJXQdADuz9D4/2TbqhV
         MOX2MOuw+HExhejZA+L5L2noPHRPbKs10IefPofxvmMuYPBWvSf/Kv99LqRDm/UNn8zW
         aK8BVbMgQsFmqmT4+RCX9aPnxciVYHgEeUBPOG2CCAawbdSy8v2sgx2CtzcA8OgpuJaq
         1r1w==
X-Gm-Message-State: AC+VfDynFjTzF+jtU8Ma/marnWnBdOsv11qPT6LURW4XJvLdkcSDNLbt
	o+iRyMcWhqFSVxGDSiIcJQ4FzkWCYoovVu29b9efpUI3
X-Google-Smtp-Source: ACHHUZ685jAnGbXmsLOT2LVFmO4PsIx1cjdBpqSDXY2dgNA4g066aAiWcTXHLidY/C1FxrXP6ItWkQs3oYfC7wwQ/R0=
X-Received: by 2002:a19:f708:0:b0:4f3:b32d:f739 with SMTP id
 z8-20020a19f708000000b004f3b32df739mr1444581lfe.19.1685624463318; Thu, 01 Jun
 2023 06:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230601123332.3297404-1-ardb@kernel.org> <20230601123332.3297404-2-ardb@kernel.org>
In-Reply-To: <20230601123332.3297404-2-ardb@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Jun 2023 14:00:52 +0100
Message-ID: <CAFEAcA_Z_3xNC6HjuyvRtf+s9pJjGsZeSZ87VG03J2yZZ60Wtw@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Use x86 intrinsics to implement PMULL.P64
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: DLc446Ty0LJq

On Thu, 1 Jun 2023 at 13:33, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  host/include/i386/host/cpuinfo.h |  1 +
>  target/arm/tcg/vec_helper.c      | 26 +++++++++++++++++++-
>  util/cpuinfo-i386.c              |  1 +
>  3 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/host/include/i386/host/cpuinfo.h b/host/include/i386/host/cpuinfo.h
> index 073d0a426f31487d..cf4ced844760d28f 100644
> --- a/host/include/i386/host/cpuinfo.h
> +++ b/host/include/i386/host/cpuinfo.h
> @@ -27,6 +27,7 @@
>  #define CPUINFO_ATOMIC_VMOVDQA  (1u << 16)
>  #define CPUINFO_ATOMIC_VMOVDQU  (1u << 17)
>  #define CPUINFO_AES             (1u << 18)
> +#define CPUINFO_PMULL           (1u << 19)
>
>  /* Initialized with a constructor. */
>  extern unsigned cpuinfo;
> diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
> index f59d3b26eacf08f8..fb422627588439b3 100644
> --- a/target/arm/tcg/vec_helper.c
> +++ b/target/arm/tcg/vec_helper.c
> @@ -25,6 +25,14 @@
>  #include "qemu/int128.h"
>  #include "vec_internal.h"
>
> +#ifdef __x86_64__
> +#include "host/cpuinfo.h"
> +#include <wmmintrin.h>
> +#define TARGET_PMULL  __attribute__((__target__("pclmul")))
> +#else
> +#define TARGET_PMULL
> +#endif
> +
>  /*
>   * Data for expanding active predicate bits to bytes, for byte elements.
>   *
> @@ -2010,12 +2018,28 @@ void HELPER(gvec_pmul_b)(void *vd, void *vn, void *vm, uint32_t desc)
>   * Because of the lanes are not accessed in strict columns,
>   * this probably cannot be turned into a generic helper.
>   */
> -void HELPER(gvec_pmull_q)(void *vd, void *vn, void *vm, uint32_t desc)
> +void TARGET_PMULL HELPER(gvec_pmull_q)(void *vd, void *vn, void *vm, uint32_t desc)
>  {
>      intptr_t i, j, opr_sz = simd_oprsz(desc);
>      intptr_t hi = simd_data(desc);
>      uint64_t *d = vd, *n = vn, *m = vm;
>
> +#ifdef __x86_64__
> +    if (cpuinfo & CPUINFO_PMULL) {
> +       switch (hi) {
> +       case 0:
> +               *(__m128i *)vd = _mm_clmulepi64_si128(*(__m128i *)vm, *(__m128i *)vn, 0x0);
> +               break;
> +       case 1:
> +               *(__m128i *)vd = _mm_clmulepi64_si128(*(__m128i *)vm, *(__m128i *)vn, 0x11);
> +               break;
> +       default:
> +               g_assert_not_reached();
> +       }
> +        return;
> +    }
> +#endif

This needs to cope with the input vectors being more than
just 128 bits wide, I think. Also you probably still
need the clear_tail() to clear any high bits of the register.

thanks
-- PMM
