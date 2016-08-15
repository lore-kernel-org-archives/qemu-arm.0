Received: by 10.25.21.156 with SMTP id 28csp1507064lfv;
        Mon, 15 Aug 2016 09:13:54 -0700 (PDT)
X-Received: by 10.55.167.69 with SMTP id q66mr32466039qke.287.1471277634303;
        Mon, 15 Aug 2016 09:13:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c9si12830382qkb.271.2016.08.15.09.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Aug 2016 09:13:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37893 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZKWP-0001XW-MY
	for alex.bennee@linaro.org; Mon, 15 Aug 2016 12:13:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZKWI-0001Ty-Ll
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 12:13:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZKWG-0004P3-6R
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 12:13:45 -0400
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:35136)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZKWG-0004On-1H
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 12:13:44 -0400
Received: by mail-ua0-x230.google.com with SMTP id n59so80160212uan.2
	for <qemu-arm@nongnu.org>; Mon, 15 Aug 2016 09:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=30vsByCfATnAt3Fhu4KuFYIPQYj+MRS5hHsDca+4Z2Y=;
	b=QCXJPE+VdLMZc8P7YVdQj3hKlhwJaIQQFaYkj+7ryilokm8XuRu5gu7g1JRq2vDdby
	FTHIAAvwZ3QimtLBhI/0qNeIYA4EGCAPTdl1mRvZY3lwMbJu578uY7FXz/VZTfhMnVds
	88cPp5Aouae+TI6i+O03ckd+Bns6pq1z1d/0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=30vsByCfATnAt3Fhu4KuFYIPQYj+MRS5hHsDca+4Z2Y=;
	b=jXjmVOZq5RhkniJlbrywH7SJCVva6P5hAltqF20WenbFZXN/QkNmo8P85601jaIRDs
	akJQeHrQkf5DTIcCztNxCfamfbAtu7jSwiUKFTSEL8FrEuPDh0RHOG+oTVcHe/j246Dm
	/nlTVKDSX2EbtbdeJ5MKKhQypMbPMBhpNnNBFKyMjDDORSoMOeZGy0v0WIjyXmialQ1W
	l9NwQw5LFi4VNSsxxf6FU94Q3CusMkU34pdsq3agmVoxIK99nLiigt/YLS8c7EO/UuGo
	ndeYUJPGoZHZ2a5bBY1qq61vstYyjJZtn8LvqylUistrhFKj/rj1LV5H/WG+C7ZqnL2+
	Z8ow==
X-Gm-Message-State: AEkoout0pkHiY74WlntrhnmvSn95niTQcSssQBEoxo2V1+eidUH8vGO3OG5izQ8SpuvRUwqsqD0pBXLi9NmDmeYk
X-Received: by 10.31.84.69 with SMTP id i66mr14536272vkb.82.1471277622435;
	Mon, 15 Aug 2016 09:13:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Mon, 15 Aug 2016 09:13:21 -0700 (PDT)
In-Reply-To: <1471067570-7503-1-git-send-email-wei@redhat.com>
References: <1471067570-7503-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Aug 2016 17:13:21 +0100
Message-ID: <CAFEAcA-_hc71ScfUs8WOjJcM2SN+uR3ukjVt+BXUD9tMoRKKjw@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-arm] [PATCH V1 1/1] arm64: Add an option to turn on/off
 host-backed vPMU support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F5Z9M0flon3Z

On 13 August 2016 at 06:52, Wei Huang <wei@redhat.com> wrote:
> This patch adds a pmu=[on/off] option to enable/disable host vPMU
> support in guest VM. There are several reasons to justify this option.
> First, host-backed vPMU can be problematic for cross-migration between
> different SoC as perf counters are architecture-dependent. It is more
> flexible to have an option to turn it on/off. Secondly this option
> matches the "pmu" option as supported in libvirt tool.
>
> Note that, like "has_el3", the "pmu" option is only made available on
> CPUs that support host-backed vPMU. They include:
>     * cortex-a53 + kvm
>     * cortex-a57 + kvm
>     * host + kvm
> This option is removed in other configs where it doesn't make sense
> (e.g. cortex-a57 + TCG); and the default pmu support is off. This patch
> has been tested under both DT/ACPI modes.
>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c |  2 +-
>  hw/arm/virt.c            |  2 +-
>  target-arm/cpu.c         | 13 +++++++++++++
>  target-arm/cpu.h         |  3 ++-
>  target-arm/cpu64.c       |  6 ++++++
>  target-arm/kvm64.c       | 10 +++++-----
>  6 files changed, 28 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 28fc59c..22fb9d9 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -540,7 +540,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>          gicc->uid = i;
>          gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
>
> -        if (armcpu->has_pmu) {
> +        if (armcpu->has_host_pmu) {
>              gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
>          }
>      }
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a193b5a..4975f38 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -477,7 +477,7 @@ static void fdt_add_pmu_nodes(const VirtBoardInfo *vbi, int gictype)
>
>      CPU_FOREACH(cpu) {
>          armcpu = ARM_CPU(cpu);
> -        if (!armcpu->has_pmu ||
> +        if (!armcpu->has_host_pmu ||
>              !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ))) {
>              return;
>          }
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index ce8b8f4..a527128 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -509,6 +509,10 @@ static Property arm_cpu_rvbar_property =
>  static Property arm_cpu_has_el3_property =
>              DEFINE_PROP_BOOL("has_el3", ARMCPU, has_el3, true);
>
> +/* use property name "pmu" to match with other archs and libvirt */
> +static Property arm_cpu_has_host_pmu_property =
> +    DEFINE_PROP_BOOL("pmu", ARMCPU, has_host_pmu, false);
> +
>  static Property arm_cpu_has_mpu_property =
>              DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
>
> @@ -552,6 +556,11 @@ static void arm_cpu_post_init(Object *obj)
>  #endif
>      }
>
> +    if (arm_feature(&cpu->env, ARM_FEATURE_HOST_PMU)) {
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_host_pmu_property,
> +                                 &error_abort);
> +    }
> +
>      if (arm_feature(&cpu->env, ARM_FEATURE_MPU)) {
>          qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property,
>                                   &error_abort);
> @@ -648,6 +657,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          cpu->id_aa64pfr0 &= ~0xf000;
>      }
>
> +    if (!cpu->has_host_pmu) {
> +        unset_feature(env, ARM_FEATURE_HOST_PMU);
> +    }
> +
>      if (!arm_feature(env, ARM_FEATURE_EL2)) {
>          /* Disable the hypervisor feature bits in the processor feature
>           * registers if we don't have EL2. These are id_pfr1[15:12] and
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 76d824d..f3f6d3f 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -580,7 +580,7 @@ struct ARMCPU {
>      /* CPU has security extension */
>      bool has_el3;
>      /* CPU has PMU (Performance Monitor Unit) */
> -    bool has_pmu;
> +    bool has_host_pmu;

Can you explain why you renamed this? "has_pmu" matches
the comment: it indicates that the emulated CPU has a PMU.
has_host_pmu would be something different (and would only
apply to KVM). It also looks weird in the code in the board
model: we should be saying "if the guest CPU has a PMU, wire
up its interrupt", not "if the host CPU has a PMU, wire
up a guest CPU interrupt".

>
>      /* CPU has memory protection unit */
>      bool has_mpu;
> @@ -1129,6 +1129,7 @@ enum arm_features {
>      ARM_FEATURE_V8_SHA256, /* implements SHA256 part of v8 Crypto Extensions */
>      ARM_FEATURE_V8_PMULL, /* implements PMULL part of v8 Crypto Extensions */
>      ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodings */
> +    ARM_FEATURE_HOST_PMU, /* PMU supported by host */

ARM_FEATURE_ bits are for guest CPU features, not for
recording information about the host CPU.

>  };
>
>  static inline int arm_feature(CPUARMState *env, int feature)
> diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
> index 1635deb..19e8127 100644
> --- a/target-arm/cpu64.c
> +++ b/target-arm/cpu64.c
> @@ -111,6 +111,9 @@ static void aarch64_a57_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    if (kvm_enabled()) {
> +        set_feature(&cpu->env, ARM_FEATURE_HOST_PMU);
> +    }
>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
>      cpu->midr = 0x411fd070;
>      cpu->revidr = 0x00000000;
> @@ -166,6 +169,9 @@ static void aarch64_a53_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    if (kvm_enabled()) {
> +        set_feature(&cpu->env, ARM_FEATURE_HOST_PMU);
> +    }

This definitely looks like the wrong place to be checking
kvm_enabled().

>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
>      cpu->midr = 0x410fd034;
>      cpu->revidr = 0x00000000;
> diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
> index 5faa76c..588e5e3 100644
> --- a/target-arm/kvm64.c
> +++ b/target-arm/kvm64.c
> @@ -469,6 +469,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
>      set_feature(&features, ARM_FEATURE_VFP4);
>      set_feature(&features, ARM_FEATURE_NEON);
>      set_feature(&features, ARM_FEATURE_AARCH64);
> +    set_feature(&features, ARM_FEATURE_HOST_PMU);
>
>      ahcc->features = features;
>
> @@ -501,11 +502,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
>      }
> -    if (kvm_irqchip_in_kernel() &&
> -        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
> -        cpu->has_pmu = true;
> -        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
> -    }
> +    /* enable vPMU based on KVM mode, hw capability, and user setting */
> +    cpu->has_host_pmu &= kvm_irqchip_in_kernel() &&
> +        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3);
> +    cpu->kvm_init_features[0] |= cpu->has_host_pmu << KVM_ARM_VCPU_PMU_V3;
>
>      /* Do KVM_ARM_VCPU_INIT ioctl */
>      ret = kvm_arm_vcpu_init(cs);
> --
> 2.4.11
>

thanks
-- PMM
