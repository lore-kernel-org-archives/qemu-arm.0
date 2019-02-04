Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3607593wrt;
        Mon, 4 Feb 2019 05:53:06 -0800 (PST)
X-Received: by 2002:a05:6830:165a:: with SMTP id h26mr5991051otr.299.1549288386818;
        Mon, 04 Feb 2019 05:53:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549288386; cv=none;
        d=google.com; s=arc-20160816;
        b=R9a2QnWzaMfAS5hPBPRIn8/LHn+p6XcZach0tIzXo3Twz3XjTaU0JI1L7YIpIROupy
         guuiF3SziWzYL8GRfQnnoXgdmCHEeLNHeLUQWqxSdxkkDmK7czUnEFCFP7DIXIyw0IiH
         77Qcn0u1oM7B12KG4DgOR6yR64RnxuAhSm5SJ4BL7BCEMCyS/iunfJauIqgX7VSNBm4I
         2QUjPlTi9RjRdjjmBLQNKDbvnhuOl1gYIeENZlsMeCJkVkdhtiRg0j81N6Ftsr5zGTvm
         YyMKFpYocYN4hEMDPLkWQRWG/gvO63Vj6MMvxtQbzDnPToxhuZwEAa2S4PUXRyzCXJZv
         Eeyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yY4mF+q+4xfEZfP1X12YeJeICrOwqSLLsqINxtPYRSQ=;
        b=FSrfUoPwHnYPljWZgUiphhUnL9sMQKuHLwycVNp9RXpGRnZeczXGqtep4CnKmtBD3w
         nGOa8doH3RAkvWVd3ngnX6z6vCDhlLb5FDa0wOctAwC2EYa8f4XDG7gSYzB7pUNdupFc
         ENygRKcBwT6VKuKMZsuSqKEP4KHagksJvCQQAf9rj4MJXHq8icR1TOIme5+FsNxPkamu
         pA3h1U10yj8GfvSO84deWJSj2zWLSCPowe93dmQmpAbumpyRIZjCAlmu4w19uXE1Yo7T
         5Puhrz9OExdtk9pC6Iexi4M2JzADuJK0gSLRICQKRS3Sbt9SiwT4fzWl3vPYz2iZhZe8
         ceGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GTVj255t;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f64sor10582567otf.178.2019.02.04.05.53.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Feb 2019 05:53:06 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GTVj255t;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yY4mF+q+4xfEZfP1X12YeJeICrOwqSLLsqINxtPYRSQ=;
        b=GTVj255tXcDsTKSF+CTP3xOlEGlHhPLGLrNj2zEgVtF0jpXPQZJfZwpcjRbVDYhRp6
         FoPwH+Ez9TFzoPPIEacrABtv/ufxRwhC9PJqoQXE+lj36F0fNWmI72nL+3O6nG7cNAgz
         LrLRrDTo6GWKuT2YMK7KbUbixUGrBbkWWzceM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yY4mF+q+4xfEZfP1X12YeJeICrOwqSLLsqINxtPYRSQ=;
        b=c+zml3KNvO98LeS0Uo4J28W3utwiq1hiUUBu7+xd+uy3yGJFJyCi8XszHrc2gfaDas
         jjhUc7DXG7Lhl3bCKW2lB3xK+YWE5weSyjEqhwlosH/Of9tQTWQpdWIyrQs6iWiDsOZr
         8GeDVKcHb52eERieOqp/Pi67/iOZ55u0nV61hQQhsSZhHT1EfkoG+T4LMsmxgCblYJYB
         yi8GyAH7WYSpwH5+PxxHzM9lobLN4SyVqg+luO3op+wKZxqBCjmP71jSNTAdTSgdsTzn
         L9E0RpXPAbu//e1KPDMfvVpqyAoexcPDAYRSwnwWpHsiMbE/z5Edx+NHg9A6/O1NKt+s
         onEQ==
X-Gm-Message-State: AJcUukcdLGDMKglOT8tyalqSk0tTS22HuhWGZyIKUuAaA90NJUNPIJ+M
	4Ccf5WLdRpTBuVCNxldoheBE9Q7N0S5+PckEb3uBj9wt/UzPvA==
X-Google-Smtp-Source: ALg8bN59CHY/6ogT4vZ96Wih9THSC/bu3io8xe2oH+MxVnzgRVijylu3XZ3iJugGcNnTE0UaU97XF17WORDpdCTh8OE=
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr37610224otc.238.1549288386249;
 Mon, 04 Feb 2019 05:53:06 -0800 (PST)
MIME-Version: 1.0
References: <20190128173940.25813-1-alex.bennee@linaro.org> <20190128173940.25813-5-alex.bennee@linaro.org>
In-Reply-To: <20190128173940.25813-5-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Feb 2019 13:52:54 +0000
Message-ID: <CAFEAcA_NoLsU2kg7TDhSH-Uv7+19B3-vC+=DwS=vLkCHuyNMcw@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] tests/tcg/aarch64: userspace system register test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: kkxjRw+iYU0J

On Mon, 28 Jan 2019 at 17:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This tests a bunch of registers that the kernel allows userspace to
> read including the CPUID registers.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v4
>   - also test for extra bits that shouldn't be exposed
> ---
>  tests/tcg/aarch64/Makefile.target |   2 +-
>  tests/tcg/aarch64/sysregs.c       | 120 ++++++++++++++++++++++++++++++
>  2 files changed, 121 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/aarch64/sysregs.c
>
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefi=
le.target
> index 08c45b8470..cc1a7eb486 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -7,7 +7,7 @@ VPATH           +=3D $(AARCH64_SRC)
>
>  # we don't build any of the ARM tests
>  AARCH64_TESTS=3D$(filter-out $(ARM_TESTS), $(TESTS))
> -AARCH64_TESTS+=3Dfcvt
> +AARCH64_TESTS+=3Dfcvt sysregs
>  TESTS:=3D$(AARCH64_TESTS)
>
>  fcvt: LDFLAGS+=3D-lm
> diff --git a/tests/tcg/aarch64/sysregs.c b/tests/tcg/aarch64/sysregs.c
> new file mode 100644
> index 0000000000..8e11288ee3
> --- /dev/null
> +++ b/tests/tcg/aarch64/sysregs.c
> @@ -0,0 +1,120 @@
> +/*
> + * Check emulated system register access for linux-user mode.
> + *
> + * See: https://www.kernel.org/doc/Documentation/arm64/cpu-feature-regis=
ters.txt
> + */

This needs the usual copyright line and license statement.

> +
> +#include <asm/hwcap.h>
> +#include <stdio.h>
> +#include <sys/auxv.h>
> +#include <signal.h>
> +#include <string.h>
> +#include <stdbool.h>
> +
> +int failed_mask_count;
> +
> +#define get_cpu_reg(id) ({                                      \
> +            unsigned long __val =3D 0xdeadbeef;                   \
> +            asm("mrs %0, "#id : "=3Dr" (__val));                  \
> +            printf("%-20s: 0x%016lx\n", #id, __val);            \
> +            __val;                                               \
> +        })
> +
> +#define get_cpu_reg_check_mask(id, mask) ({                     \
> +            unsigned long __cval =3D get_cpu_reg(id);             \
> +            unsigned long __extra =3D __cval & ~mask;             \
> +            if (__extra) {                                      \
> +                printf("%-20s: 0x%016lx\n", "  !!extra bits!!", __extra)=
;   \
> +                failed_mask_count++;                            \
> +            }                                                   \
> +})

A brief comment describing what the arguments to these macros
do would be helpful if we ever have to add more registers in future.

> +
> +bool should_fail;
> +int should_fail_count;
> +int should_not_fail_count;
> +uintptr_t failed_pc[10];
> +
> +void sigill_handler(int signo, siginfo_t *si, void *data)
> +{
> +    ucontext_t *uc =3D (ucontext_t *)data;
> +
> +    if (should_fail) {
> +        should_fail_count++;
> +    } else {
> +        uintptr_t pc =3D (uintptr_t) uc->uc_mcontext.pc;
> +        failed_pc[should_not_fail_count++] =3D  pc;
> +    }
> +    uc->uc_mcontext.pc +=3D 4;
> +}
> +
> +int main(void)
> +{
> +    struct sigaction sa;
> +
> +    /* Hook in a SIGILL handler */
> +    memset(&sa, 0, sizeof(struct sigaction));
> +    sa.sa_flags =3D SA_SIGINFO;
> +    sa.sa_sigaction =3D &sigill_handler;
> +    sigemptyset(&sa.sa_mask);
> +
> +    if (sigaction(SIGILL, &sa, 0) !=3D 0) {
> +        perror("sigaction");
> +        return 1;
> +    }
> +
> +    /* since 4.12 */

This is a rather cryptic comment.

> +    printf("Checking CNT registers\n");
> +
> +    get_cpu_reg(ctr_el0);
> +    get_cpu_reg(cntvct_el0);
> +    get_cpu_reg(cntfrq_el0);
> +
> +    /* when (getauxval(AT_HWCAP) & HWCAP_CPUID), since 4.11*/

Missing space before "*/".

> +    if (!(getauxval(AT_HWCAP) & HWCAP_CPUID)) {
> +        printf("CPUID registers unavailable\n");
> +        return 1;
> +    } else {
> +        printf("Checking CPUID registers\n");
> +    }
> +
> +    /*
> +     * Some registers only expose some bits to user-space. Anything
> +     * that is IMDEF is exported as 0 to user-space.

IMPDEF

> +     */
> +    get_cpu_reg_check_mask(id_aa64isar0_el1, 0x000fffffff0ffff0ULL);

I can't make sense of this mask value. Presumably it's supposed to be
1s where the value is visible, but the docs say that the visible
bits for ID_AA64ISAR0_EL1 are [23..4] and [55..28], whereas the
mask value here has 1s in [51..24] and [20..4], unless I've miscounted.

> +    get_cpu_reg_check_mask(id_aa64isar1_el1, 0x00000000ffffffffULL);
> +    get_cpu_reg(id_aa64mmfr0_el1);
> +    get_cpu_reg(id_aa64mmfr1_el1);
> +    get_cpu_reg_check_mask(id_aa64pfr0_el1, 0x000f000f0ff0000ULL);

This seems to have [31..28] set but not [35..32]. The bits that
should be [51..48] are also in the wrong place, and the whole
number has one hex digit too few to be 64 bits.

> +    get_cpu_reg(id_aa64pfr1_el1);
> +    get_cpu_reg(id_aa64dfr0_el1);
> +    get_cpu_reg(id_aa64dfr1_el1);
> +
> +    get_cpu_reg_check_mask(midr_el1, 0x00000000ffffffffULL);
> +    get_cpu_reg(mpidr_el1);
> +    /* REVIDR is all IMPDEF so should be all zeros to user-space */
> +    get_cpu_reg_check_mask(revidr_el1, 0x0);

Missing check of the mask value for ID_AA64MMFR2_EL1 ? Should have
bits [35..32] visible.

Missing checks for:
 ID_AA64ZFR0_EL1
 ID_AA64AFR0_EL1
 ID_AA64AFR1_EL1

Missing checks for all the parts of the ID space that are currently
unallocated (and which should be exposed as RAZ/WI).

Missing checks for registers which are exposed but with all
features hidden, eg ID_PFR0_EL1 and the other aarch32 ID regs.

The kernel returns some value, ie does not fault, all the
architecturally defined registers in Op0=3D3, Op1=3D0, CRn=3D0,
CRm=3D0,4,5,6,7. For CRm =3D 0 only op2 =3D {0,5,6} [MIDR_EL1,
MPIDR_EL1, REVIDR_EL1] are valid, but for CRm =3D {4,5,6,7}
the whole set of op2 =3D {0..7} are defined (and RAZ if not
yet given some meaning).

thanks
-- PMM
