Received: by 10.80.163.71 with SMTP id 65csp1338936edn;
        Wed, 21 Sep 2016 00:53:29 -0700 (PDT)
X-Received: by 10.55.160.145 with SMTP id j139mr39913940qke.167.1474444409759;
        Wed, 21 Sep 2016 00:53:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id i66si27369290qke.14.2016.09.21.00.53.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Sep 2016 00:53:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bmcLR-0002jP-91
	for alex.bennee@linaro.org; Wed, 21 Sep 2016 03:53:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bmcLL-0002hu-77
	for qemu-arm@nongnu.org; Wed, 21 Sep 2016 03:53:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bmcLI-0001gV-0g
	for qemu-arm@nongnu.org; Wed, 21 Sep 2016 03:53:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bmcLH-0001gA-NY; Wed, 21 Sep 2016 03:53:19 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ACF1E89C37;
	Wed, 21 Sep 2016 07:53:18 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-108.brq.redhat.com [10.40.204.108])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8L7rELS001875
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 21 Sep 2016 03:53:16 -0400
Date: Wed, 21 Sep 2016 09:53:14 +0200
From: Andrew Jones <drjones@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20160921075314.x4luqeo6djao2qon@hawk.localdomain>
References: <1474425234-31412-1-git-send-email-wei@redhat.com>
	<1474425234-31412-2-git-send-email-wei@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474425234-31412-2-git-send-email-wei@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 21 Sep 2016 07:53:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V4 1/2] arm64: Add an option to
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
X-TUID: uI5jivON+OSA

On Tue, Sep 20, 2016 at 10:33:53PM -0400, Wei Huang wrote:
> This patch adds a pmu=[on/off] option to enable/disable vPMU support
> in guest vCPU. This option is only available for cortex-a57/cortex-53/
> host under both TCG and KVM modes, but unavailable on ARMv7 and other
> processors. It allows virt tools, such as libvirt, to determine the
> exsitence of vPMU and configure it. Note that, if nothing specified,
> the pmu option is set to AUTO as default, allowing machine-level PMU
> property to override it. Also when pmu is turned on under non-KVM mode,
> a warning message will be printed.
> 
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c |  2 +-
>  hw/arm/virt.c            |  2 +-
>  target-arm/cpu.c         | 23 +++++++++++++++++++++++
>  target-arm/cpu.h         |  5 +++--
>  target-arm/cpu64.c       |  2 ++
>  target-arm/kvm64.c       | 17 ++++++++++++++---
>  6 files changed, 44 insertions(+), 7 deletions(-)
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
> index ce8b8f4..ed7b884 100644
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
> @@ -31,6 +32,7 @@
>  #include "hw/arm/arm.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/qtest.h"
>  #include "kvm_arm.h"
>  
>  static void arm_cpu_set_pc(CPUState *cs, vaddr value)
> @@ -509,6 +511,10 @@ static Property arm_cpu_rvbar_property =
>  static Property arm_cpu_has_el3_property =
>              DEFINE_PROP_BOOL("has_el3", ARMCPU, has_el3, true);
>  
> +/* use property name "pmu" to match other archs and virt tools */
> +static Property arm_cpu_has_pmu_property =
> +    DEFINE_PROP_ON_OFF_AUTO("pmu", ARMCPU, has_pmu, ON_OFF_AUTO_AUTO);
> +
>  static Property arm_cpu_has_mpu_property =
>              DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
>  
> @@ -552,6 +558,11 @@ static void arm_cpu_post_init(Object *obj)
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
> @@ -576,6 +587,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      ARMCPU *cpu = ARM_CPU(dev);
>      ARMCPUClass *acc = ARM_CPU_GET_CLASS(dev);
>      CPUARMState *env = &cpu->env;
> +    static bool pmu_warned;
>  
>      /* Some features automatically imply others: */
>      if (arm_feature(env, ARM_FEATURE_V8)) {
> @@ -648,6 +660,17 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          cpu->id_aa64pfr0 &= ~0xf000;
>      }
>  
> +    if (cpu->has_pmu == ON_OFF_AUTO_ON && !kvm_enabled()) {
> +        cpu->has_pmu = ON_OFF_AUTO_OFF;
> +        if (!pmu_warned && !qtest_enabled()) {

Why do we need this qtest_enabled thing?

> +            error_report("warning: pmu can't be enabled without KVM acceleration");
> +            pmu_warned = true;
> +        }
> +    }
> +    if (cpu->has_pmu == ON_OFF_AUTO_OFF) {
> +        unset_feature(env, ARM_FEATURE_PMU);
> +    }
> +
>      if (!arm_feature(env, ARM_FEATURE_EL2)) {
>          /* Disable the hypervisor feature bits in the processor feature
>           * registers if we don't have EL2. These are id_pfr1[15:12] and
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 76d824d..c8625eb 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -579,8 +579,8 @@ struct ARMCPU {
>      bool powered_off;
>      /* CPU has security extension */
>      bool has_el3;
> -    /* CPU has PMU (Performance Monitor Unit) */
> -    bool has_pmu;
> +    /* CPU PMU (Performance Monitor Unit) config, tri-state */

The comment didn't need to be modified.

> +    OnOffAuto has_pmu;
>  
>      /* CPU has memory protection unit */
>      bool has_mpu;
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
> index 5faa76c..ff86550 100644
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
> +    if (!kvm_irqchip_in_kernel() ||
> +        !kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
> +            cpu->has_pmu = ON_OFF_AUTO_OFF;
> +    }
> +    if (cpu->has_pmu == ON_OFF_AUTO_ON) {
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
> +    } else {
> +        unset_feature(&env->features, ARM_FEATURE_PMU);
>      }
>  
>      /* Do KVM_ARM_VCPU_INIT ioctl */
> -- 
> 1.8.3.1
> 
> 
