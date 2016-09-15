Received: by 10.80.163.71 with SMTP id 65csp1775411edn;
        Thu, 15 Sep 2016 00:13:45 -0700 (PDT)
X-Received: by 10.55.200.220 with SMTP id t89mr7407708qkl.125.1473923625499;
        Thu, 15 Sep 2016 00:13:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id u65si1555255qkb.94.2016.09.15.00.13.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Sep 2016 00:13:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bkQrh-0005qO-0N
	for alex.bennee@linaro.org; Thu, 15 Sep 2016 03:13:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bkQrS-0005jQ-Vi
	for qemu-arm@nongnu.org; Thu, 15 Sep 2016 03:13:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bkQrM-0002zk-An
	for qemu-arm@nongnu.org; Thu, 15 Sep 2016 03:13:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bkQrM-0002zJ-1N; Thu, 15 Sep 2016 03:13:24 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F682824;
	Thu, 15 Sep 2016 07:13:23 +0000 (UTC)
Received: from kamzik.localdomain (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8F7DJx8026313
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 15 Sep 2016 03:13:21 -0400
Date: Thu, 15 Sep 2016 09:13:19 +0200
From: Andrew Jones <drjones@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20160915071319.ueimaa7uq5mm23xr@kamzik.localdomain>
References: <1473915856-23801-1-git-send-email-wei@redhat.com>
	<1473915856-23801-2-git-send-email-wei@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1473915856-23801-2-git-send-email-wei@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 15 Sep 2016 07:13:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V3 1/2] arm64: Add an option to
 turn on/off vPMU support
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
Cc: peter.maydell@linaro.org, shannon.zhao@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, abologna@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O+zU//EnayxH

On Thu, Sep 15, 2016 at 01:04:15AM -0400, Wei Huang wrote:
> This patch adds a pmu=[on/off] option to enable/disable vPMU support
> in guest vCPU. This option is only available for cortex-a57/cortex-53/
> host under both TCG and KVM modes, but unavailable on ARMv7 and other
> processors. It allows virt tools, such as libvirt, to determine the
> exsitence of vPMU and configure it. Note that this option, turned off
> by default, can only be turned on under KVM mode; otherwise a warning
> message will be printed out.

Nice improvement to the message.

> 
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c |  2 +-
>  hw/arm/virt.c            |  2 +-
>  target-arm/cpu.c         | 22 ++++++++++++++++++++++
>  target-arm/cpu.h         |  1 +
>  target-arm/cpu64.c       |  2 ++
>  target-arm/kvm64.c       | 19 +++++++++++++++----
>  6 files changed, 42 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 295ec86..8b3083e 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -540,7 +540,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>          gicc->uid = i;
>          gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
>  
> -        if (armcpu->has_pmu) {
> +        if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
>              gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
>          }
>      }
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a193b5a..a781ad0 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -477,7 +477,7 @@ static void fdt_add_pmu_nodes(const VirtBoardInfo *vbi, int gictype)
>  
>      CPU_FOREACH(cpu) {
>          armcpu = ARM_CPU(cpu);
> -        if (!armcpu->has_pmu ||
> +        if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU) ||
>              !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ))) {
>              return;
>          }
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index ce8b8f4..d304597 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -19,6 +19,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "internals.h"
> @@ -509,6 +510,10 @@ static Property arm_cpu_rvbar_property =
>  static Property arm_cpu_has_el3_property =
>              DEFINE_PROP_BOOL("has_el3", ARMCPU, has_el3, true);
>  
> +/* use property name "pmu" to match other archs and virt tools */
> +static Property arm_cpu_has_pmu_property =
> +    DEFINE_PROP_BOOL("pmu", ARMCPU, has_pmu, false);
> +
>  static Property arm_cpu_has_mpu_property =
>              DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
>  
> @@ -552,6 +557,11 @@ static void arm_cpu_post_init(Object *obj)
>  #endif
>      }
>  
> +    if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_pmu_property,
> +                                 &error_abort);
> +    }
> +
>      if (arm_feature(&cpu->env, ARM_FEATURE_MPU)) {
>          qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property,
>                                   &error_abort);
> @@ -576,6 +586,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      ARMCPU *cpu = ARM_CPU(dev);
>      ARMCPUClass *acc = ARM_CPU_GET_CLASS(dev);
>      CPUARMState *env = &cpu->env;
> +    static bool pmu_warned;
>  
>      /* Some features automatically imply others: */
>      if (arm_feature(env, ARM_FEATURE_V8)) {
> @@ -648,6 +659,17 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          cpu->id_aa64pfr0 &= ~0xf000;
>      }
>  
> +    if (cpu->has_pmu && !kvm_enabled()) {
> +        cpu->has_pmu = false;
> +        if (!pmu_warned) {
> +            error_report("warning: pmu can't be enabled without KVM acceleration");
> +            pmu_warned = true;
> +        }
> +    }
> +    if (!cpu->has_pmu) {
> +        unset_feature(env, ARM_FEATURE_PMU);
> +    }
> +
>      if (!arm_feature(env, ARM_FEATURE_EL2)) {
>          /* Disable the hypervisor feature bits in the processor feature
>           * registers if we don't have EL2. These are id_pfr1[15:12] and
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 76d824d..5d9e6e7 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -1129,6 +1129,7 @@ enum arm_features {
>      ARM_FEATURE_V8_SHA256, /* implements SHA256 part of v8 Crypto Extensions */
>      ARM_FEATURE_V8_PMULL, /* implements PMULL part of v8 Crypto Extensions */
>      ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodings */
> +    ARM_FEATURE_PMU, /* has PMU support */
>  };
>  
>  static inline int arm_feature(CPUARMState *env, int feature)
> diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
> index 1635deb..549cb1e 100644
> --- a/target-arm/cpu64.c
> +++ b/target-arm/cpu64.c
> @@ -111,6 +111,7 @@ static void aarch64_a57_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
>      cpu->midr = 0x411fd070;
>      cpu->revidr = 0x00000000;
> @@ -166,6 +167,7 @@ static void aarch64_a53_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
>      cpu->midr = 0x410fd034;
>      cpu->revidr = 0x00000000;
> diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
> index 5faa76c..4e0124c 100644
> --- a/target-arm/kvm64.c
> +++ b/target-arm/kvm64.c
> @@ -428,6 +428,11 @@ static inline void set_feature(uint64_t *features, int feature)
>      *features |= 1ULL << feature;
>  }
>  
> +static inline void unset_feature(uint64_t *features, int feature)
> +{
> +    *features &= ~(1ULL << feature);
> +}
> +
>  bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
>  {
>      /* Identify the feature bits corresponding to the host CPU, and
> @@ -469,6 +474,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
>      set_feature(&features, ARM_FEATURE_VFP4);
>      set_feature(&features, ARM_FEATURE_NEON);
>      set_feature(&features, ARM_FEATURE_AARCH64);
> +    set_feature(&features, ARM_FEATURE_PMU);
>  
>      ahcc->features = features;
>  
> @@ -482,6 +488,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      int ret;
>      uint64_t mpidr;
>      ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
>  
>      if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
>          !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
> @@ -501,10 +508,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
>      }
> -    if (kvm_irqchip_in_kernel() &&
> -        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
> -        cpu->has_pmu = true;
> -        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
> +    /* enable PMU based on KVM mode, hw capability, and user setting */

This comment is just stating what the code is doing. I'd drop it.

> +    cpu->has_pmu &= kvm_irqchip_in_kernel() &&
> +        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3);
> +    cpu->kvm_init_features[0] |= cpu->has_pmu << KVM_ARM_VCPU_PMU_V3;

The above line is no longer needed with the if-else below

> +    if (cpu->has_pmu) {
> +        cpu->kvm_init_features[0] |= cpu->has_pmu << KVM_ARM_VCPU_PMU_V3;

Here we know cpu->has_pmu is true so we should just shift 1.

> +    } else {
> +        unset_feature(&env->features, ARM_FEATURE_PMU);
>      }
>  
>      /* Do KVM_ARM_VCPU_INIT ioctl */
> -- 
> 1.8.3.1
> 
> 
