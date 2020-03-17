Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1352953lfe;
        Tue, 17 Mar 2020 03:24:36 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuh9SLAxYwPX9c7WklVJxZMx7Ud5jNkI0wNCWWe28lasZzNCSZXHvBxxtSi511wKLM1jHuh
X-Received: by 2002:a1c:7d88:: with SMTP id y130mr4807766wmc.5.1584440676507;
        Tue, 17 Mar 2020 03:24:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584440676; cv=none;
        d=google.com; s=arc-20160816;
        b=tslxQQC4usOoYPQIb/0a/k44nfXiPFWg0iHn+ml7QfpRYaS+xvzrorpU4izrHmD09K
         nWCmBnx+G7cq7L3nqjv2/qF+1G4GvLcbjmbQZJbQMuucUo+g7JD0E1lEnAUwz5GvDaH0
         wjn0Axw5F5YZyByILIwCMOwsEI+AC2DqcKmdvJP+Vtmn6XxICJZTLY93VVsSXJhjXy6/
         E3WBbv+EqdM80/8OHhIEw30q/tN8of6+J0FhzUzakwIti1GjxJzUfGErHFgqPSq8LXOz
         OByje4kPFiSSM+OQG6Z4ddbbPi0lgIixuzdPq5kB2/C2O4RaenVHqhKpkzsVkEn7T4zt
         HTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=cBG0wUfQjsUCmmLPmdOOlLFEXjl2Ck9aL2Cf+XqWfH4=;
        b=RqQ0zD5tbOhJ2bEwfF3RYcMWoz9uHcEVQjQkwawwnveIjkGtYu8uYlA5tKLi+yYzgJ
         mh1FmBKGgkkHKDweSzJAoBWC7qHT1cyXCOX/cp8foKrmUhkJrYxnS1uo1E9obrIvgqWn
         qcU3t4TFIe+MllY2ehtgXLUCgA5C1L/6e+sZfcydGGQUN2LpGcebhreJbaRi5nYMG5p/
         771of2zN5aslIQYjtNWzPVHZ2H+SkgA0Nka1/FT0B/LKUZkfIW7AGya3BF+ecCDJXxDH
         C0+hKV9R5vbmz/JW7XbOF0rnPEUISrK/30X1VmNd32tM8hFIYtxKZTEXF6wtgH3hPvFO
         sf1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cwG0Yfn6;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [216.205.24.74])
        by mx.google.com with ESMTPS id j1si2487150wrb.87.2020.03.17.03.24.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Mar 2020 03:24:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) client-ip=216.205.24.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cwG0Yfn6;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584440675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBG0wUfQjsUCmmLPmdOOlLFEXjl2Ck9aL2Cf+XqWfH4=;
	b=cwG0Yfn6EVNKnHKOJYb48ytJnuG/HPAqqFYCAkjAIl1zOevM5y240RIUSFpipiY3w3dd+z
	oIxqQGt/WsGpZ30U42Lxol2GAiTHHprMMoIgS7WyBOCcZ76P7ToMzSSQafFXkXQ7saJ1gM
	TuiFV91lEADotDIR2+d3JkVnAwpyWws=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-75pNCF31OHC_xE0qXhW97Q-1; Tue, 17 Mar 2020 06:24:33 -0400
X-MC-Unique: 75pNCF31OHC_xE0qXhW97Q-1
Received: by mail-wm1-f70.google.com with SMTP id p18so2923101wmk.9
        for <alex.bennee@linaro.org>; Tue, 17 Mar 2020 03:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IomYhTzxc9V/qeC4qJVlX3AsWM5b1XTh4VYgJVBlMOA=;
        b=RA5w7Kp7sT8fdI8iyU1bLgwbYUkUjmnJC/nk2wfdfFibbBZRam77ACIkKYm3Pwl7Ph
         5D43qhaKeDg+T7xAb18xaEtqGQx7mWh3eCPFH3Djg6k2XQN7Y0Eh3Cq3MlkjWjNEx0XY
         4IF+Mj1aQWj5/Vdo0HHwoxfZnDa5SBdV5c4D0H3NRRjUCucQNp9Lr99bzGmjFH7gMogd
         wpdaGBTUMNaJbi0Uxjj9QOxZ8FqmpfRDl4TOk6TqlKXb77VFTV4iZ0ViCV6jNVKXhOHl
         PRZSBcaK1WCGfZ24ct8kOGbN7pZbtPMa8uWwjX/5ivWgSrzXZp2KqsmoWjqDqxsT7HfA
         BTPA==
X-Gm-Message-State: ANhLgQ0ry18KdcgBxHoOMLZQrb0PrGSVUhrwN7+O7XDnfyMeSzzpSRUq
	hEYmj3PvZNFhqONIAjX3rwK5ER3ahq4oWvbswSf9qmPUWUoXju1T8jDn98S4hAjKrFegVbeftMp
	Q3E3YoE2cLd6LlEfR
X-Received: by 2002:a05:600c:298:: with SMTP id 24mr4633293wmk.70.1584440672463;
        Tue, 17 Mar 2020 03:24:32 -0700 (PDT)
X-Received: by 2002:a05:600c:298:: with SMTP id 24mr4633277wmk.70.1584440672175;
        Tue, 17 Mar 2020 03:24:32 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.34] (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id x17sm3359873wmi.28.2020.03.17.03.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 03:24:31 -0700 (PDT)
Subject: Re: [PATCH v1 20/28] tests/tcg/aarch64: userspace system register
 test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316172155.971-1-alex.bennee@linaro.org>
 <20200316172155.971-21-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <18254420-c4a6-b8b6-a8cd-cad3b1d6e38b@redhat.com>
Date: Tue, 17 Mar 2020 11:24:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200316172155.971-21-alex.bennee@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: o256P3LohHw8

On 3/16/20 6:21 PM, Alex Benn=C3=A9e wrote:
> This tests a bunch of registers that the kernel allows userspace to
> read including the CPUID registers. We need a SVE aware compiler as we
> are testing the id_aa64zfr0_el1 register in the set.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20190205190224.2198-7-alex.bennee@linaro.org>
>=20
> ---
> vgdbstub
>    - don't build unless using docker or CROSS_CC_HAS_SVE
> ---
>   tests/tcg/aarch64/sysregs.c       | 172 ++++++++++++++++++++++++++++++
>   tests/tcg/aarch64/Makefile.target |   6 ++
>   2 files changed, 178 insertions(+)
>   create mode 100644 tests/tcg/aarch64/sysregs.c
>=20
> diff --git a/tests/tcg/aarch64/sysregs.c b/tests/tcg/aarch64/sysregs.c
> new file mode 100644
> index 00000000000..40cf8d2877e
> --- /dev/null
> +++ b/tests/tcg/aarch64/sysregs.c
> @@ -0,0 +1,172 @@
> +/*
> + * Check emulated system register access for linux-user mode.
> + *
> + * See: https://www.kernel.org/doc/Documentation/arm64/cpu-feature-regis=
ters.txt
> + *
> + * Copyright (c) 2019 Linaro
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include <asm/hwcap.h>
> +#include <stdio.h>
> +#include <sys/auxv.h>
> +#include <signal.h>
> +#include <string.h>
> +#include <stdbool.h>
> +
> +#ifndef HWCAP_CPUID
> +#define HWCAP_CPUID (1 << 11)
> +#endif
> +
> +int failed_bit_count;
> +
> +/* Read and print system register `id' value */
> +#define get_cpu_reg(id) ({                                      \
> +            unsigned long __val =3D 0xdeadbeef;                   \
> +            asm("mrs %0, "#id : "=3Dr" (__val));                  \
> +            printf("%-20s: 0x%016lx\n", #id, __val);            \
> +            __val;                                               \
> +        })
> +
> +/* As above but also check no bits outside of `mask' are set*/
> +#define get_cpu_reg_check_mask(id, mask) ({                     \
> +            unsigned long __cval =3D get_cpu_reg(id);             \
> +            unsigned long __extra =3D __cval & ~mask;             \
> +            if (__extra) {                                      \
> +                printf("%-20s: 0x%016lx\n", "  !!extra bits!!", __extra)=
;   \
> +                failed_bit_count++;                            \
> +            }                                                   \
> +})
> +
> +/* As above but check RAZ */
> +#define get_cpu_reg_check_zero(id) ({                           \
> +            unsigned long __val =3D 0xdeadbeef;                   \
> +            asm("mrs %0, "#id : "=3Dr" (__val));                  \
> +            if (__val) {                                        \
> +                printf("%-20s: 0x%016lx (not RAZ!)\n", #id, __val);     =
   \
> +                failed_bit_count++;                            \
> +            }                                                   \
> +})
> +
> +/* Chunk up mask into 63:48, 47:32, 31:16, 15:0 to ease counting */
> +#define _m(a, b, c, d) (0x ## a ## b ## c ## d ##ULL)
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
> +    /* Counter values have been exposed since Linux 4.12 */
> +    printf("Checking Counter registers\n");
> +
> +    get_cpu_reg(ctr_el0);
> +    get_cpu_reg(cntvct_el0);
> +    get_cpu_reg(cntfrq_el0);
> +
> +    /* HWCAP_CPUID indicates we can read feature registers, since Linux =
4.11 */
> +    if (!(getauxval(AT_HWCAP) & HWCAP_CPUID)) {
> +        printf("CPUID registers unavailable\n");
> +        return 1;
> +    } else {
> +        printf("Checking CPUID registers\n");
> +    }
> +
> +    /*
> +     * Some registers only expose some bits to user-space. Anything
> +     * that is IMPDEF is exported as 0 to user-space. The _mask checks
> +     * assert no extra bits are set.
> +     *
> +     * This check is *not* comprehensive as some fields are set to
> +     * minimum valid fields - for the purposes of this check allowed
> +     * to have non-zero values.
> +     */
> +    get_cpu_reg_check_mask(id_aa64isar0_el1, _m(00ff,ffff,f0ff,fff0));
> +    get_cpu_reg_check_mask(id_aa64isar1_el1, _m(0000,00f0,ffff,ffff));
> +    /* TGran4 & TGran64 as pegged to -1 */
> +    get_cpu_reg_check_mask(id_aa64mmfr0_el1, _m(0000,0000,ff00,0000));
> +    get_cpu_reg_check_zero(id_aa64mmfr1_el1);
> +    /* EL1/EL0 reported as AA64 only */
> +    get_cpu_reg_check_mask(id_aa64pfr0_el1,  _m(000f,000f,00ff,0011));
> +    get_cpu_reg_check_mask(id_aa64pfr1_el1,  _m(0000,0000,0000,00f0));
> +    /* all hidden, DebugVer fixed to 0x6 (ARMv8 debug architecture) */
> +    get_cpu_reg_check_mask(id_aa64dfr0_el1,  _m(0000,0000,0000,0006));
> +    get_cpu_reg_check_zero(id_aa64dfr1_el1);
> +    get_cpu_reg_check_zero(id_aa64zfr0_el1);
> +
> +    get_cpu_reg_check_zero(id_aa64afr0_el1);
> +    get_cpu_reg_check_zero(id_aa64afr1_el1);
> +
> +    get_cpu_reg_check_mask(midr_el1,         _m(0000,0000,ffff,ffff));
> +    /* mpidr sets bit 31, everything else hidden */
> +    get_cpu_reg_check_mask(mpidr_el1,        _m(0000,0000,8000,0000));
> +    /* REVIDR is all IMPDEF so should be all zeros to user-space */
> +    get_cpu_reg_check_zero(revidr_el1);
> +
> +    /*
> +     * There are a block of more registers that are RAZ in the rest of
> +     * the Op0=3D3, Op1=3D0, CRn=3D0, CRm=3D0,4,5,6,7 space. However for
> +     * brevity we don't check stuff that is currently un-allocated
> +     * here. Feel free to add them ;-)
> +     */
> +
> +    printf("Remaining registers should fail\n");
> +    should_fail =3D true;
> +
> +    /* Unexposed register access causes SIGILL */
> +    get_cpu_reg(id_mmfr0_el1);
> +    get_cpu_reg(id_mmfr1_el1);
> +    get_cpu_reg(id_mmfr2_el1);
> +    get_cpu_reg(id_mmfr3_el1);
> +
> +    get_cpu_reg(mvfr0_el1);
> +    get_cpu_reg(mvfr1_el1);
> +
> +    if (should_not_fail_count > 0) {
> +        int i;
> +        for (i =3D 0; i < should_not_fail_count; i++) {
> +            uintptr_t pc =3D failed_pc[i];
> +            uint32_t insn =3D *(uint32_t *) pc;
> +            printf("insn %#x @ %#lx unexpected FAIL\n", insn, pc);
> +        }
> +        return 1;
> +    }
> +
> +    if (failed_bit_count > 0) {
> +        printf("Extra information leaked to user-space!\n");
> +        return 1;
> +    }
> +
> +    return should_fail_count =3D=3D 6 ? 0 : 1;
> +}
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefi=
le.target
> index 8ed477d0d51..a25afc071cc 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -42,4 +42,10 @@ run-semiconsole: semiconsole
>   run-plugin-semiconsole-with-%:
>   =09$(call skip-test, $<, "MANUAL ONLY")
>  =20
> +ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_SVE),)
> +# System Registers Tests
> +AARCH64_TESTS +=3D sysregs
> +sysregs: CFLAGS+=3D-march=3Darmv8.1-a+sve
> +endif
> +
>   TESTS +=3D $(AARCH64_TESTS)
>=20

warning: while parsing target description (at line 47): Vector "vq128hf"=20
references undefined type "ieee_half"
warning: Could not load XML target description; ignoring
*** stack smashing detected ***: <unknown> terminated

(GCC 9.2.1, Fedora 30)
