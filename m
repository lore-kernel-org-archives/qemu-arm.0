Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1676497lfj;
        Tue, 11 Jan 2022 06:11:03 -0800 (PST)
X-Received: by 2002:a5d:5601:: with SMTP id l1mr4050822wrv.213.1641910263844;
        Tue, 11 Jan 2022 06:11:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641910263; cv=none;
        d=google.com; s=arc-20160816;
        b=t6zCGPtXglvlLrdt7zirMoIDnJIjAqb/qC0c9vvZkMf9jB7A1MgGsQUsmE1oiEfv2+
         2jO/eGqQbam+Lb9NDj1qXZ+Ig33isFKTspkAH1Byn+n0MGemmtTKQgmqB+6cgrMEzVB7
         cIuXdpkR4kQxTWEx53U71asrbukscEoRCuKNs3aUxXVP/B6jv6Mh8H4n/NQbKg5/iPvQ
         gI6fHPqcaNclybTelH1l2K5H7+hZiDFmjJRwmiPurA4RHOxNKr84LnjKBi703YHYIP6q
         KmLTwXcmzkvOol6AhVjQrxrR2XTr/rtDXh3vyPUQqF4ob8Wxp3QJ3pziyZaZMM0Vc4A9
         dPuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NFMhHhfWiBZy4qJwt2VavywlR7RjlIm8hHw7X8pLnHo=;
        b=06v/uRyP2cgW2IT+1snNxNU5pqlzZ3IBlRb3vrN+Z3PppKp76gXl0nVaVU20H5mZ1N
         OoR1c1R3REZlAju6DjGRkFPgW9jHRszYn5NUQuyivxh25v1+N2fIt5r6kqBSZglyVYhW
         Aakc8HsF8xqJpts6vz0EVUdF7bOzUKuJm1R1Lo22AjspxFX2/awvE/JiqQ1oCrRSUFuv
         6TTzQzuC0pn9MAGRfcxKNbIoAzwBiTWcZA9xYZkB7ePKXvlCysdUvw+6ZWd8Tt1pVkkB
         ZK7KiWKDBp04fvn+ylC/i2QTBuxi8aYSVOJrqllGuQFHOoRvT9z7CcAGE9zqQ5S1iOCJ
         HrOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AQGQqBU4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j19sor1041404wmq.0.2022.01.11.06.11.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Jan 2022 06:11:03 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AQGQqBU4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NFMhHhfWiBZy4qJwt2VavywlR7RjlIm8hHw7X8pLnHo=;
        b=AQGQqBU4VfVAcUyfQPVOrms8cfIeLEDqjIVXsB9MpiC8ZxVA0cLhU7m1oO50t5T2YA
         xZtRsUc8Fd5cNPWtE8IFdpWLqfYxfYxGSm8ff1SsRby01VfDqNracOkj5wG1SSYbHKhU
         v+TaKI/wq5BycQYhBk0ue0VjT23y4B46UEDNJs0dx/Px75R1TKmkauhiRAXTrg9VJD7V
         z1+byvNbYtr6199mtH/ME8JgOh3zXpYq4tDAJk9oqe3Zbyuda7OQ2ez+zDVTacbb1RaV
         HNx7B7p2X0rg372zXOjckhq+vhPKp3ToEfYHn2Sem0RFCyEXnCgVhSCZlh83Ez9eVAw1
         6CtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NFMhHhfWiBZy4qJwt2VavywlR7RjlIm8hHw7X8pLnHo=;
        b=afoJavdoqqsz1G6NPNFq/nzkvCjPT5llamboPLOtIRZhoP3/ztMT1cXYRzUtXLUALq
         keHf2qytLByd+Ihua7kYHAHIaMly7NQQpMnPghWhcp4NVyLHPoms/wL6z36yRpRac2P/
         ZJ2tDczNdPkKVhlPd5R9mzEun/xtXuRqpzqTP8mdwRbJLOKDolRo4fLZl9573w53N2Xj
         sUZjJ5GzfSwOTzfNGhMkuIKP7mQCzJ1raiiRO//vZp3yyQqxKKsOjedB7N/PYyrx7rEG
         8iyfOlW+gMtPYZTPpQVZoWALN5XwC+f4pJz1lIekTLfq8VjY7tHPd5ZnHZebNzPETt72
         fuhw==
X-Gm-Message-State: AOAM533VT5628FC565dUMSxEccU7+C+Vmc84hiTjlfyCHHt/hh3Cl8pK
	yBI36Re/hxM8Vur14k1TedQSPuKy64UH0oTlTcqjAbgu
X-Google-Smtp-Source: ABdhPJxPGpa5fJDieO4b+cWDmvtN30OAItGNHfw7OdZuplgvJii8f1HH803kNyW2AMPpdu7J6gxqvt+3FssC4uezVwU=
X-Received: by 2002:a05:600c:3ac5:: with SMTP id d5mr2673926wms.32.1641910263590;
 Tue, 11 Jan 2022 06:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20220108150952.1483911-1-ardb@kernel.org>
In-Reply-To: <20220108150952.1483911-1-ardb@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 14:10:52 +0000
Message-ID: <CAFEAcA9DCzNJ8q7wLqSW-4pCzGM4gSvo2FLVhkG94cdriYj4zQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm/cpu64: Use 32-bit GDBstub when running in
 32-bit KVM mode
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, Alex Bennee <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: nr8jUdhFc6Vn

On Sat, 8 Jan 2022 at 15:10, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> When running under KVM, we may decide to run the CPU in 32-bit mode, by
> setting the 'aarch64=off' CPU option. In this case, we need to switch to
> the 32-bit version of the GDB stub too, so that GDB has the correct view
> of the CPU state. Without this, GDB debugging does not work at all, and
> errors out upon connecting to the target with a mysterious 'g' packet
> length error.
>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Alex Bennee <alex.bennee@linaro.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> v2: refactor existing CPUClass::gdb_... member assignments for the
>     32-bit code so we can reuse it for the 64-bit code
>
>  target/arm/cpu.c   | 16 +++++++++++-----
>  target/arm/cpu.h   |  2 ++
>  target/arm/cpu64.c |  3 +++
>  3 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a211804fd3df..ae8e78fc1472 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2049,6 +2049,15 @@ static const struct TCGCPUOps arm_tcg_ops = {
>  };
>  #endif /* CONFIG_TCG */
>
> +void arm_cpu_class_gdb_init(CPUClass *cc)
> +{
> +    cc->gdb_read_register = arm_cpu_gdb_read_register;
> +    cc->gdb_write_register = arm_cpu_gdb_write_register;
> +    cc->gdb_num_core_regs = 26;
> +    cc->gdb_core_xml_file = "arm-core.xml";
> +    cc->gdb_arch_name = arm_gdb_arch_name;
> +}

Most of these fields are not used by the gdbstub until
runtime, but cc->gdb_num_core_regs is used earlier.
In particular, in cpu_common_initfn() we copy that value
into cpu->gdb_num_regs and cpu->gdb_num_g_regs (this happens
at the CPU object's instance_init time, ie before the
aarch64_cpu_set_aarch64 function is called), and these are the
values that are then used when registering dynamic sysreg
XML, coprocessor registers, etc.

> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -906,6 +906,7 @@ static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
>  static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> +    CPUClass *cc = CPU_GET_CLASS(obj);

This is called to change the property for a specific CPU
object -- you can't change the values of the *class* here.
(Consider a system with 2 CPUs, one of which has aarch64=yes
and one of which has aarch64=no.)

>      /* At this time, this property is only allowed if KVM is enabled.  This
>       * restriction allows us to avoid fixing up functionality that assumes a
> @@ -919,6 +920,8 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
>              return;
>          }
>          unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +
> +        arm_cpu_class_gdb_init(cc)

This fails to compile because of the missing semicolon...

>      } else {
>          set_feature(&cpu->env, ARM_FEATURE_AARCH64);

If the user (admittedly slightly perversely) toggles the
aarch64 flag from on to off to on again, we should reset the
gdb function pointers to the aarch64 versions again.

>      }

thanks
-- PMM
