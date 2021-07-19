Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3818577lfc;
        Mon, 19 Jul 2021 05:56:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOKW5X7+ZbvUwQF3c/OCarKubYx2UHv3LdzQ8/cCFCCp99+qR8q0bnyqcq5z5tKHTgXOn7
X-Received: by 2002:a25:c050:: with SMTP id c77mr31196967ybf.223.1626699369916;
        Mon, 19 Jul 2021 05:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626699369; cv=none;
        d=google.com; s=arc-20160816;
        b=Q4SMzaTAMhtovCxcbALVTrCbT3/BAHWUCz2yoO78Lvj8RRf0WOqI2n1KlIelVmZzEJ
         seH0qeX/WZqvfSYNMKzkeYJFJTNr7w1+Tx6SfLChWXgvGg4RGOsH68kJRPBt69AuHnSY
         bneSTnhlrblxv32Dh70nf7ntgDHcx03nhzaxOCp4QQOOH0o37lA6yWq1C10tj07Vtikk
         pI8AmxDQFodRdjCkecAabBCIhIV+DvdD1EQJvF+Y3eDhu75wEzcioc85DPNly1OKYFqw
         YCGCnxi9lDYl4hUt+Ln6F2B6NhNzjYcd+HGZQ4tbXJcams9TRVlue3611PCNioyENAU+
         a85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uyihC1LlTA6tIpPcBOw8WdzuJ4FHQ9i1TOvcpt/n+T4=;
        b=A5MWEIOdkvg2nNoKzBHBD+5vmtUZVQw6IyF7pk6wgKnmrNdl+adi0HMxZ/NhCaoeVn
         6r1b9uOFkRxzf0OzMtyQfWkdhblK9Ep8+lfQUc2HY+os+DqBKQ1Hf5dAl7oHPcUrukXv
         BAEDj/R6Z655pzDIlS4ubrASud5SkmePyoKDdd/0bXnVMPTJBipw+r2bMEPk/Ks8tllM
         2hUuBj59ZqTVqbirtr+ukO7rOCugFZbb5Ep3qQv72LnDo3oJqVp/Ae0OW7FTJddYk/vx
         fSR8/HxIKIaT2r1jeIUhhr2HHm6vnDFH3EodzGxMhppRod29Zy19cxwlDauaNm9PFKdq
         OrbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WNuaCtW6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13si10296398ybm.350.2021.07.19.05.56.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jul 2021 05:56:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WNuaCtW6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m5Sob-0002ep-8j
	for alex.bennee@linaro.org; Mon, 19 Jul 2021 08:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Sny-0001pJ-3D
 for qemu-arm@nongnu.org; Mon, 19 Jul 2021 08:55:30 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Snw-0005Rl-Bv
 for qemu-arm@nongnu.org; Mon, 19 Jul 2021 08:55:29 -0400
Received: by mail-ed1-x52e.google.com with SMTP id h8so23829070eds.4
 for <qemu-arm@nongnu.org>; Mon, 19 Jul 2021 05:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uyihC1LlTA6tIpPcBOw8WdzuJ4FHQ9i1TOvcpt/n+T4=;
 b=WNuaCtW6Pmg7gD10fBTI5a+goO+7PYGkyt8dHDk1z+/e9Dr5RKhQWbrpmwE0T8vSNV
 mWRLTMj5T2ByT+04ULuR/W7rFUUhmBFKmAjTW5AtuGLFKcjDDWaoS9wZcT50N4Ik2ZEI
 TbAjiG5EeOlzQdkj1TFkVR++P3M4iMs4/8BPJv9kunbd3FCjGqqXGx2192p4mL4Y0WlW
 oGAGgD1QDM6JK6jtmjzvujJ3l1yKwKCvqJTQnMAarls6J6AAWT/pkBi/bnn56NMq2ZfN
 aieoURv9pr2ywE/v8pVXEUX8XNhmkuiEnDh/1bS4705JVwkS/ymBnVR5jUdlwTFzRoFT
 OQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uyihC1LlTA6tIpPcBOw8WdzuJ4FHQ9i1TOvcpt/n+T4=;
 b=nNCdS9BskwKIkiwHb+etEM0Md1T2W06mYtKi2I8RUKxqXgUKsBJnFBxKIK1YGGVWXi
 KtzbiyAlEEaSu/8vFqVL9yFOR7c+gqwPMPU7tmCLu5F+w0zfYSuMIOkutl0C3mpGVpMB
 hhK/044AK7tww8c15C0C97om71pbRaHTUwu5qA79xn4MNMmRliGdXTsGuiRPI2WuU7hX
 hrKI72Gx2Dl5my6lrtZv7hlR7wITxhEsyQ4pnDDPYQr/kRDHvyXOouqIvkpsUAOpQ3vA
 TKuWNLC5T2T1O+T0/aQhfcM7dfaCu2vVzxVmOV3X/2h/MoAlqRGJlPWw8dNIq4MEuS8x
 JI+g==
X-Gm-Message-State: AOAM530CbD842k6y4LALpz8gOR2mNa02B217bFasJw3c9284Ta13FRch
 oZU+E4QCXfXDmqWkIHomhKHXZbOPiNhErXFy7KjL1w==
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr33720206eds.204.1626699326848; 
 Mon, 19 Jul 2021 05:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <1626413223-32264-3-git-send-email-ishii.shuuichir@fujitsu.com>
In-Reply-To: <1626413223-32264-3-git-send-email-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:54:46 +0100
Message-ID: <CAFEAcA_EYdeLzdWmRyv0+YJgPS0qgKMJ=5aLwWv9r-z7GAPpYw@mail.gmail.com>
Subject: Re: [PATCH 2/4] target-arm: cpu64: Add support for Fujitsu A64FX
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +kSTMXeJzNmR

On Fri, 16 Jul 2021 at 06:27, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> Add a definition for the Fujitsu A64FX processor.
>
> The A64FX processor does not implement the AArch32 Execution state,
> so there are no associated AArch32 Identification registers.
>
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  hw/arm/virt.c      |  1 +
>  target/arm/cpu64.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 50 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 93ab9d2..2e91991 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -202,6 +202,7 @@ static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a72"),
>      ARM_CPU_TYPE_NAME("host"),
>      ARM_CPU_TYPE_NAME("max"),
> +    ARM_CPU_TYPE_NAME("a64fx"),
>  };
>
>  static bool cpu_type_valid(const char *cpu)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index c7a1626..a2c22a2 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -787,11 +787,60 @@ static void aarch64_max_initfn(Object *obj)
>                          cpu_max_set_sve_max_vq, NULL, NULL);
>  }
>
> +static const ARMCPRegInfo a64fx_cp_reginfo[] = {
> +    /* TODO  Add A64FX specific HPC extensinos registers */

"extension".

Rather than defining a reginfo array with no contents, just put
the TODO comment into the initfn. We can add the array and the
call to define_arm_cp_regs() when we actually add the first
a64fx-specific register.

> +    REGINFO_SENTINEL
> +};
> +static void aarch64_a64fx_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->dtb_compatible = "arm,a64fx";
> +    set_feature(&cpu->env, ARM_FEATURE_A64FX);
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> +    cpu->midr = 0x461f0010;
> +    cpu->revidr = 0x00000000;
> +    cpu->ctr = 86668006;
> +    cpu->reset_sctlr = 0x30000180;
> +    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS Extensions */
> +    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
> +    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
> +    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
> +    cpu->id_aa64afr0 = 0x0000000000000000;
> +    cpu->id_aa64afr1 = 0x0000000000000000;
> +    cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
> +    cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
> +    cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
> +    cpu->isar.id_aa64isar0 = 0x0000000010211120;
> +    cpu->isar.id_aa64isar1 = 0x0000000000010001;
> +    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
> +    cpu->clidr = 0x0000000080000023;
> +    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
> +    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
> +    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
> +    cpu->dcz_blocksize = 6; /* 256 bytes */
> +    cpu->gic_num_lrs = 4;
> +    cpu->gic_vpribits = 5;
> +    cpu->gic_vprebits = 5;
> +    define_arm_cp_regs(cpu, a64fx_cp_reginfo);
> +
> +    aarch64_add_sve_properties(obj);
> +    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
> +                        cpu_max_set_sve_max_vq, NULL, NULL);
> +}
> +
>  static const ARMCPUInfo aarch64_cpus[] = {
>      { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
>      { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
>      { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
>      { .name = "max",                .initfn = aarch64_max_initfn },
> +    { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },

Leave "max" at the end of the list, please.

>  };
>
>  static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)

Otherwise this patch looks good to me.

thanks
-- PMM
