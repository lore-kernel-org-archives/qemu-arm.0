Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1810130lfq;
        Mon, 11 Apr 2022 11:10:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdCqDTfPSKpC2QWZHUeMzyS5Ponox5fKB8LbysoIhEYQW1oIOnexDVD7cryZzrACaB+R6J
X-Received: by 2002:a5b:f0b:0:b0:63c:bd4e:2b60 with SMTP id x11-20020a5b0f0b000000b0063cbd4e2b60mr24027648ybr.473.1649700611682;
        Mon, 11 Apr 2022 11:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649700611; cv=none;
        d=google.com; s=arc-20160816;
        b=xx6Gh8xhFdFtL6sJR+rMFB4DJtfJn9VMEseum9Z83jKkJW5wx6nmom8vHRuIIotoHP
         qx1CNfGNv+4v2WyxNk2CFZN6ixQC0YIIGCGa/l6su975blkRl8LhP94gSZFMfNannnaJ
         5BnYSgXtZQ9uuq5Wzux6cDdNb7zqQhVh3dKFqeeqPc5VKPXmAsKJEtp3LCmhBZcHgkVP
         Z3IWqQwIYuflnpLmeI1L0A3bkMCBqGrFAxjZ1ADMo9/lVnhGnyxGba2UI1KZU/7MW5cI
         ZXpOk/IS959fDGr/puqbzbyekIdce0S11Tc0hP+euONVH8Or94cp+RNcNqrRqH7Sb9Y+
         yQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tFAe+E+dxneP4F8LaD7EJBwQLR1eFUHnt803fOIlUwc=;
        b=yi/4bPVRMAvgVf1nUoQNvxYaX3l0KRx13X+G7u4GBzUpfF50Cu1DwoifTjhTF/ARIQ
         D9wHUcJoudKjJS9RhwVHvEjM/qcSdGIu5HmKOlQ8NGlY2v4issFURsFBIhIemrN0DMf8
         pJbJKNn/b7QG2r9ExhCm0Q0itiioz/4oRInhi10lUxRrHfbilCwRyfovuh6tBNY8SmDv
         3syRm37N6yx28CzaoUUKGq72xAEKs4jptmE9uXiBXGTF2H99aJWqsv/pYxlJ40EpJd0Q
         GkNKf+aUN6sKvQsz4ECnDkkRstqjvF1d6w5FYu65eK97zHXgBvfx2dCI9TI3Fhkd1Tq4
         TKdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SJGjMrgr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u204-20020a2560d5000000b0063e4f5e0576si4675319ybb.125.2022.04.11.11.10.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 11:10:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SJGjMrgr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndyUN-0000Uf-1t
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 14:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndyTp-000837-3c
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 14:09:37 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:44981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndyTl-0007tI-T4
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 14:09:36 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2eafabbc80aso174738827b3.11
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 11:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tFAe+E+dxneP4F8LaD7EJBwQLR1eFUHnt803fOIlUwc=;
 b=SJGjMrgreUi/aTr1a8o1PnbB8cIv1i/H0YyE7UQ8WtLmEt93whvnWt2UivL9tbNNRo
 Z+lVsBtjWLA8mwZrnVu3qMCaC06Pfe1izhrx6uRtz1sftuRzOjoLmbpYzaLPSLEEPM5u
 rnN/c1WJdJw6wFXTBWYzrOihWgPTGnqNbWnhFfe/WWco44qvV6YQxupoNzDA2SVcIYqV
 2ty3gGXq3jgaNXvBPeG/VWURGQhLXd7u+FG6FXEvQbpi/GravwNx6XyrhHyfgjxp0UQp
 VgkFTqbLBha3ylewSfnMEMQ1MDfva2UUEZz6g8R2W3tUEvGIxQ2bQ438rZC3/cWtV8lV
 utYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tFAe+E+dxneP4F8LaD7EJBwQLR1eFUHnt803fOIlUwc=;
 b=Tzn0mdTpJg29wBiz5qFoA1pVz/bmYy6NBTXjOwPZzqGP9Z88cG9MkcNZ+6XSFdlGuN
 HJzxwUApgGJt6iays4JT/6dU4q+s70S/IlFyJ3V2r+gKnN0q93ffN7A0iuBOKMi9hd92
 0wo0b1tgapU1o6CXSLSE05SLyGGHDfxkCh4J8FpNanVO9IGleZXXJIv6i+6gskOB5XDy
 tv5sOBl6dEwQzE3dD1hXEYbam8K+uvRFRY547DS4IWoZBp+yWNwbmhxYdt9RAK5hk1A9
 UCr91XgDEcSThhjSBIkCnqQxpWF7/s0ByK4xe0jwZRkB8HuG+TUOnqNy6+gcVxbqawL+
 iRHg==
X-Gm-Message-State: AOAM5309ErsOX35/v0vdX9Tqcz92zE5je7AN0jGAW4NHM2PQiTojE6jn
 EoIW+oJW8H6CDGciiVL/6Gx+/SaP2Idn0W3J0w7yqQ==
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr27176476ywf.347.1649700572789; Mon, 11
 Apr 2022 11:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220410055725.380246-1-richard.henderson@linaro.org>
 <20220410055725.380246-7-richard.henderson@linaro.org>
In-Reply-To: <20220410055725.380246-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 19:09:21 +0100
Message-ID: <CAFEAcA_2sWO0LtKk+10Ktyhrn5WGV=9eqA+yWd5Mt=nUiJpAYg@mail.gmail.com>
Subject: Re: [PATCH 6/7] target/arm: Define cortex-a76
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PMqJqYIlYfxL

On Sun, 10 Apr 2022 at 07:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Enable the a76 for virt and sbsa board use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/arm/sbsa-ref.c  |  1 +
>  hw/arm/virt.c      |  1 +
>  target/arm/cpu64.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 66 insertions(+)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 2387401963..2ddde88f5e 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -145,6 +145,7 @@ static const int sbsa_ref_irqmap[] = {
>  static const char * const valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
> +    ARM_CPU_TYPE_NAME("cortex-a76"),
>      ARM_CPU_TYPE_NAME("max"),
>  };
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d2e5ecd234..ce15c36a7f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -202,6 +202,7 @@ static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
> +    ARM_CPU_TYPE_NAME("cortex-a76"),
>      ARM_CPU_TYPE_NAME("a64fx"),
>      ARM_CPU_TYPE_NAME("host"),
>      ARM_CPU_TYPE_NAME("max"),

Need to update the list in docs/system/arm/virt.rst as well.

> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 199ca437a0..a00c02be2c 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -251,6 +251,69 @@ static void aarch64_a72_initfn(Object *obj)
>      define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
>  }
>
> +static void aarch64_a76_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->dtb_compatible = "arm,cortex-a76";
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> +
> +    /* Ordered by B2.4 AArch64 registers by functional group */
> +    cpu->clidr = 0x82000023;
> +    cpu->ctr = 0x8444C004;
> +    cpu->dcz_blocksize = 4;
> +    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
> +    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
> +    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
> +    cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
> +    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
> +    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
> +    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull;

This has the GIC field clear. On the one hand this is true
also of all our other CPU implementations. On the other hand
if we wire up a GICv3 in the board code then we will be
presenting the GIC CPU interface registers, which is what this
ID register field is supposed to be telling software.
I guess we should handle this by having gicv3_init_cpuif()
arrange for the ID field to be set. Which is mildly painful,
because that will mean the value for the cpreg isn't constant.

(In real hardware the cpuif really is part of the CPU proper,
so it (ie the sysregs for the GICv3) exists whether the
GICv3 proper is present somewhere outside the CPU in the
SoC. But our implementation doesn't put the dividing line
quite where the h/w does.)

> +    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
> +    cpu->isar.id_dfr0  = 0x04010088;
> +    cpu->isar.id_isar0 = 0x02101110;
> +    cpu->isar.id_isar1 = 0x13112111;
> +    cpu->isar.id_isar2 = 0x21232042;
> +    cpu->isar.id_isar3 = 0x01112131;
> +    cpu->isar.id_isar4 = 0x00010142;
> +    cpu->isar.id_isar5 = 0x01011121;
> +    cpu->isar.id_isar6 = 0x00000010;
> +    cpu->isar.id_mmfr0 = 0x10201105;
> +    cpu->isar.id_mmfr1 = 0x40000000;
> +    cpu->isar.id_mmfr2 = 0x01260000;
> +    cpu->isar.id_mmfr3 = 0x02122211;
> +    cpu->isar.id_mmfr4 = 0x00021110;
> +    cpu->isar.id_pfr0  = 0x10010131;
> +    cpu->isar.id_pfr1  = 0x10010000;

Here you have set the GIC field. We should at least be consistent :-)

> +    cpu->isar.id_pfr2  = 0x00000011;
> +    cpu->midr = 0x413fd0b1;

This is r3p1; the r4p1 TRM is available so we might as
well claim to be that.

> +
> +    /* From B2.18 CCSIDR_EL1 */
> +    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
> +    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
> +    cpu->ccsidr[2] = 0x707fe03a; /* 512KB L2 cache */
> +
> +    /* From B2.93 SCTLR_EL3 */
> +    cpu->reset_sctlr = 0x30c50838;
> +
> +    /* From B4.23 ICH_VTR_EL2 */
> +    cpu->gic_num_lrs = 4;
> +    cpu->gic_vpribits = 5;
> +    cpu->gic_vprebits = 5;

(side note, we should really support having the non-virtual
pribits/prebits for the GIC be configurable too. I have a
half-written set of patches for that.)

> +
> +    /* From B5.1 AdvSIMD AArch64 register summary */
> +    cpu->isar.mvfr0 = 0x10110222;
> +    cpu->isar.mvfr1 = 0x13211111;
> +    cpu->isar.mvfr2 = 0x00000043;

Missing (just cross-checking what other CPUs are setting):
  cpu->revidr
  cpu->reset_fpsid
  cpu->id_afr0
  cpu->isar.dbgdidr

> +}
> +
>  void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>  {
>      /*
> @@ -935,6 +998,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
>      { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
>      { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
>      { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
> +    { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
>      { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
>      { .name = "max",                .initfn = aarch64_max_initfn },
>  #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
> --

thanks
-- PMM
