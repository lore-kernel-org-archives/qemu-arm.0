Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp384468lfo;
        Thu, 28 Jan 2021 08:56:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwO+TgsSc44bUCABki4kqamEFiLtTTd8nvmbmvOqO0QjbxhuHBITE/lmWWDQVYYIzcgTijf
X-Received: by 2002:a25:888f:: with SMTP id d15mr177109ybl.12.1611852983094;
        Thu, 28 Jan 2021 08:56:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611852983; cv=none;
        d=google.com; s=arc-20160816;
        b=VTYjBThJ99c8AnK5227+dCHKUcPPSzBN42itIVQ8WMpGYkyDb99KBCICpdUS3gcge3
         Z2oLmWHM29T3hz8bpvAREyHgZiD30Aioo7EuTYdAY4/lv7m882RZLTtLbqgPDpmLCqMv
         S5DEPWZXrLBaYleknrGe82lLUr7XLd8fB3QWJqr6mK+aqz5HFEf9RcRHJM3nke6NdMIs
         1lBP3+hu7kcN7qXvcgOI5mC0QzViJ/Rp3ppbj0/7sZ4de1eRlpmJQNR4ToIb+Iasn4E6
         8TkVXq+tK21e+JwfqP1WRq1CQ+3i/6xwcNcTiNlXP/pAW5UMMFhf2KK5IdqzasitWXMo
         WCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZOpokNEvr8TY21lt4Tg0K+O4N2vmlcKhBZUpPguMbw=;
        b=ZevLwqbbYWmDrvjGFx39mJG5WZwFHexbQHh3HkObFbJB1eB1ueWJKgU2qbaqtZCP3U
         2tf7i+Iv13+szgNIFdkq3ZwqElXu6PnQKEXIPE1uQME5CGytZrL7T/yU/b8Hvkx0/fW8
         2eVY3OnQ8JfTgOr+e71gi4UfxtS9pd1XAySx1r8YI3sAT3bOWcLKy93Ytjg9FJ5Er2vf
         u+WJXJftwmXdpfSQcpIYUfR7qyTOKw7Vm2afsRN7YL2yrdJIAt97NqyccXP7VZKoCqJj
         DnC8cC+TNBQht1DO+FaFTKAhEHysoXy8pBmiiBL0zJuh/KntWUxpPXZzElfFDouoPYOu
         9Vaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dBfKOD+X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si4117898ybc.255.2021.01.28.08.56.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 08:56:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dBfKOD+X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5Aak-0001zG-Ex
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 11:56:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5AaX-0001wg-TX
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 11:56:09 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:34519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5AaS-0008F7-Qo
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 11:56:09 -0500
Received: by mail-ed1-x52b.google.com with SMTP id d22so7430849edy.1
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 08:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LZOpokNEvr8TY21lt4Tg0K+O4N2vmlcKhBZUpPguMbw=;
 b=dBfKOD+XZGg5AvPsyHtTwfUkOEOY5+o4jlpV9MIHgVOZT2JgLCVCmqNUdOf122OEfh
 dta/uYeZL09KH7tuK75B0kicyZvfMUOX5nQ07w2Ep/qIK7WMJGJAJuVMOfLWBfwKlFMi
 px0lQzgJYdH1tBJQDvQHGX2VKNnBzrHJYs5LHSqBFXm3gkO2dsBb7kQGzB244o1ajytV
 B6dnCzGp22whgIvtcCPRzB4/qm3i/CtjMmLy/xI4TguXUnIyUxiZlZUms2XdkSbqWJ00
 Cvggeg3EiT+71+2O2DnB6bpPCGhFwpi/RzqxroJbTP8ZGDRsxrm/DdRyZcYbcmsXmCeu
 MuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LZOpokNEvr8TY21lt4Tg0K+O4N2vmlcKhBZUpPguMbw=;
 b=QGT0Z0ZblnuEatkBH4Xzka3JdHeBpH9W2kmCujVbF8bIkBeGY94HZsjBmoQt6QAhfv
 4qtFUs5Wphb3QkDSFtVhM2NB2RHHwIy5x6oNNH3QH55Ryn619/kLwVORVO8tCmRmgUzw
 bEMCGZ1J3Er8CL8ZmdUby3A4yjYealyNwBhePuRpuf0ztqaDVegxmfnQ+W1KxIai3bOm
 T3cMnR2ImMOlANVQni1/ckgshxupFUkrR+r4MSN8hgjvZ7/Hbxzpc5mDzwrB9HwU5ojZ
 Y+YfPeM7tXJe+OA9ES720ysZhYM6OwdY/SD7pjtoqkX6tuX3ieDfbmYJRAsmSF9W75K8
 sAoQ==
X-Gm-Message-State: AOAM532Jlt4tDLy0vguZG/KNJI6Q4vChDlJcD+g7pT6Xgv52vMvESaR+
 uWnc0TVY057TNNc3oxzJ1LdchcI5DE+g9Df2zxHBQw==
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr519235edd.100.1611852963101; 
 Thu, 28 Jan 2021 08:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-12-agraf@csgraf.de>
In-Reply-To: <20210120224444.71840-12-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 16:55:51 +0000
Message-ID: <CAFEAcA-021U3ehg_jnAHtako-A-GRxqwjqZWotroumUxfPhdGA@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] hvf: arm: Implement -cpu host
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RxCj5WmVSqhF

On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>
> Now that we have working system register sync, we push more target CPU
> properties into the virtual machine. That might be useful in some
> situations, but is not the typical case that users want.
>
> So let's add a -cpu host option that allows them to explicitly pass all
> CPU capabilities of their host CPU into the guest.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  include/sysemu/hvf.h |  2 ++
>  target/arm/cpu.c     |  9 ++++++---
>  target/arm/cpu.h     |  2 ++
>  target/arm/hvf/hvf.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  target/arm/kvm_arm.h |  2 --
>  5 files changed, 51 insertions(+), 5 deletions(-)
>
> diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
> index f893768df9..7eb61cf094 100644
> --- a/include/sysemu/hvf.h
> +++ b/include/sysemu/hvf.h
> @@ -19,6 +19,8 @@
>  #ifdef CONFIG_HVF
>  uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
>                                   int reg);
> +struct ARMCPU;

Yuck.

> +void hvf_arm_set_cpu_features_from_host(struct ARMCPU *cpu);

This is arm-specific, it doesn't belong in the generic hvf.h.

Put it somewhere else, and somewhere that we can get the typedef
from cpu.h, same as with the kvm equivalent.

>  extern bool hvf_allowed;
>  #define hvf_enabled() (hvf_allowed)
>  #else /* !CONFIG_HVF */
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index f1929b5eba..abd129d23f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2288,12 +2288,16 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>  #endif
>  }
>
> -#ifdef CONFIG_KVM
> +#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
>  static void arm_host_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
>
> +#ifdef CONFIG_KVM
>      kvm_arm_set_cpu_features_from_host(cpu);
> +#else
> +    hvf_arm_set_cpu_features_from_host(cpu);
> +#endif
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          aarch64_add_sve_properties(obj);
>      }

This adds all the SVE related properties, so you probably
need to have an equivalent of the kvm_arm_sve_supported()
checks in cpu64.c that make those properties return an error
on HVF.

> @@ -2305,7 +2309,6 @@ static const TypeInfo host_arm_cpu_type_info = {
>      .parent = TYPE_AARCH64_CPU,
>      .instance_init = arm_host_initfn,
>  };
> -
>  #endif

Stray whitespace change.

>
>  static void arm_cpu_instance_init(Object *obj)
> @@ -2364,7 +2367,7 @@ static void arm_cpu_register_types(void)
>
>      type_register_static(&arm_cpu_type_info);
>
> -#ifdef CONFIG_KVM
> +#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
>      type_register_static(&host_arm_cpu_type_info);
>  #endif
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index df0d677833..5cc59df451 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2961,6 +2961,8 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
>  #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
>  #define CPU_RESOLVING_TYPE TYPE_ARM_CPU
>
> +#define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
> +
>  #define cpu_signal_handler cpu_arm_signal_handler
>  #define cpu_list arm_cpu_list
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 98bd6712c0..42dcc23ba0 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -372,6 +372,47 @@ static uint64_t hvf_get_reg(CPUState *cpu, int rt)
>      return val;
>  }
>
> +void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu)
> +{
> +    ARMISARegisters host_isar;
> +    const struct isar_regs {
> +        int reg;
> +        uint64_t *val;
> +    } regs[] = {
> +        { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.id_aa64pfr0 },
> +        { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.id_aa64pfr1 },
> +        { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
> +        { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
> +        { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
> +        { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
> +        { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
> +        { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.id_aa64mmfr1 },
> +        { HV_SYS_REG_ID_AA64MMFR2_EL1, &host_isar.id_aa64mmfr2 },
> +    };

Since there's no AArch32 support in this register list, we should
check and error-out if the ID_AA64PFR0_EL1 value we read has
2 in either the .EL0 or .EL1 fields. (This is a never-happen
case on current hardware AIUI, but we might as well be explicit
about it.)

> +    hv_vcpu_t fd;
> +    hv_vcpu_exit_t *exit;
> +    int i;
> +
> +    cpu->dtb_compatible = "arm,arm-v8";
> +    cpu->env.features = (1ULL << ARM_FEATURE_V8) |
> +                        (1ULL << ARM_FEATURE_NEON) |
> +                        (1ULL << ARM_FEATURE_AARCH64) |
> +                        (1ULL << ARM_FEATURE_PMU) |
> +                        (1ULL << ARM_FEATURE_GENERIC_TIMER);
> +
> +    /* We set up a small vcpu to extract host registers */
> +
> +    assert_hvf_ok(hv_vcpu_create(&fd, &exit, NULL));
> +    for (i = 0; i < ARRAY_SIZE(regs); i++) {
> +        assert_hvf_ok(hv_vcpu_get_sys_reg(fd, regs[i].reg, regs[i].val));
> +    }
> +    assert_hvf_ok(hv_vcpu_get_sys_reg(fd, HV_SYS_REG_MIDR_EL1, &cpu->midr));
> +    assert_hvf_ok(hv_vcpu_destroy(fd));

Nicer to follow the KVM approach of only doing this once
and caching the results in arm_host_cpu_features, so that
for a many-cores VM you don't do it once per core.

> +
> +    cpu->isar = host_isar;
> +    cpu->reset_sctlr = 0x00c50078;
> +}
> +
>  void hvf_arch_vcpu_destroy(CPUState *cpu)
>  {
>  }
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index eb81b7059e..081727a37e 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -214,8 +214,6 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>   */
>  void kvm_arm_destroy_scratch_host_vcpu(int *fdarray);
>
> -#define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
> -
>  /**
>   * ARMHostCPUFeatures: information about the host CPU (identified
>   * by asking the host kernel)
> --
> 2.24.3 (Apple Git-128)

thanks
-- PMM
