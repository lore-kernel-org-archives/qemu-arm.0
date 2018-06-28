Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j131-v6sm9286997wmb.25.2018.06.28.07.05.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jun 2018 07:05:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id C9B8A3E07DD;
	Thu, 28 Jun 2018 15:05:20 +0100 (BST)
References: <20180627043328.11531-1-richard.henderson@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v6 00/35] target/arm SVE patches
In-reply-to: <20180627043328.11531-1-richard.henderson@linaro.org>
Date: Thu, 28 Jun 2018 15:05:20 +0100
Message-ID: <87r2kruhun.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xcwR+eaOkqyD


Richard Henderson <richard.henderson@linaro.org> writes:

> This is the remainder of the SVE enablement patches,
> with an extra bonus patch to enable ARMv8.2-DotProd.
>
> V6 updates based on review.
>
<snip>
> Patches lacking reviews:
>   0002-target-arm-Implement-SVE-Contiguous-Load-first-fa.patch
>   0007-target-arm-Implement-SVE-FP-Multiply-Add-Group.patch
>   0013-target-arm-Implement-SVE-gather-loads.patch
>   0030-target-arm-Pass-index-to-AdvSIMD-FCMLA-indexed.patch
>   0031-target-arm-Implement-SVE-fp-complex-multiply-add-.patch
>   0033-target-arm-Implement-SVE-dot-product-indexed.patch

OK I have finished sweeping through the un-reviewed patches.

>
>
> r~
>
>
> Richard Henderson (35):
>   target/arm: Implement SVE Memory Contiguous Load Group
>   target/arm: Implement SVE Contiguous Load, first-fault and no-fault
>   target/arm: Implement SVE Memory Contiguous Store Group
>   target/arm: Implement SVE load and broadcast quadword
>   target/arm: Implement SVE integer convert to floating-point
>   target/arm: Implement SVE floating-point arithmetic (predicated)
>   target/arm: Implement SVE FP Multiply-Add Group
>   target/arm: Implement SVE Floating Point Accumulating Reduction Group
>   target/arm: Implement SVE load and broadcast element
>   target/arm: Implement SVE store vector/predicate register
>   target/arm: Implement SVE scatter stores
>   target/arm: Implement SVE prefetches
>   target/arm: Implement SVE gather loads
>   target/arm: Implement SVE first-fault gather loads
>   target/arm: Implement SVE scatter store vector immediate
>   target/arm: Implement SVE floating-point compare vectors
>   target/arm: Implement SVE floating-point arithmetic with immediate
>   target/arm: Implement SVE Floating Point Multiply Indexed Group
>   target/arm: Implement SVE FP Fast Reduction Group
>   target/arm: Implement SVE Floating Point Unary Operations -
>     Unpredicated Group
>   target/arm: Implement SVE FP Compare with Zero Group
>   target/arm: Implement SVE floating-point trig multiply-add coefficient
>   target/arm: Implement SVE floating-point convert precision
>   target/arm: Implement SVE floating-point convert to integer
>   target/arm: Implement SVE floating-point round to integral value
>   target/arm: Implement SVE floating-point unary operations
>   target/arm: Implement SVE MOVPRFX
>   target/arm: Implement SVE floating-point complex add
>   target/arm: Implement SVE fp complex multiply add
>   target/arm: Pass index to AdvSIMD FCMLA (indexed)
>   target/arm: Implement SVE fp complex multiply add (indexed)
>   target/arm: Implement SVE dot product (vectors)
>   target/arm: Implement SVE dot product (indexed)
>   target/arm: Enable SVE for aarch64-linux-user
>   target/arm: Implement ARMv8.2-DotProd
>
>  target/arm/cpu.h           |    1 +
>  target/arm/helper-sve.h    |  682 +++++++++++++
>  target/arm/helper.h        |   44 +-
>  linux-user/elfload.c       |    2 +
>  target/arm/cpu.c           |    8 +
>  target/arm/cpu64.c         |    2 +
>  target/arm/helper.c        |    2 +-
>  target/arm/sve_helper.c    | 1855 ++++++++++++++++++++++++++++++++++++
>  target/arm/translate-a64.c |   57 +-
>  target/arm/translate-sve.c | 1688 +++++++++++++++++++++++++++++++-
>  target/arm/translate.c     |  102 +-
>  target/arm/vec_helper.c    |  311 +++++-
>  target/arm/sve.decode      |  427 +++++++++
>  13 files changed, 5116 insertions(+), 65 deletions(-)


--
Alex Benn=C3=A9e
