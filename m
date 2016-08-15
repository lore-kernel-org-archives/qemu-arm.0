Received: by 10.25.21.156 with SMTP id 28csp1624113lfv;
        Mon, 15 Aug 2016 14:05:20 -0700 (PDT)
X-Received: by 10.55.114.69 with SMTP id n66mr36216256qkc.174.1471295120415;
        Mon, 15 Aug 2016 14:05:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p129si13720746qka.153.2016.08.15.14.05.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Aug 2016 14:05:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZP4R-0004Ab-QL
	for alex.bennee@linaro.org; Mon, 15 Aug 2016 17:05:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bZP4N-0004AU-Ek
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 17:05:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bZP4I-0007Vk-8Z
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 17:05:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54964)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1bZP4H-0007VO-Vd; Mon, 15 Aug 2016 17:05:10 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64042C056818;
	Mon, 15 Aug 2016 21:05:09 +0000 (UTC)
Received: from [10.10.58.150] (vpn-58-150.rdu2.redhat.com [10.10.58.150])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7FL57tu012097
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 15 Aug 2016 17:05:08 -0400
To: Andrew Jones <drjones@redhat.com>
References: <1471067570-7503-1-git-send-email-wei@redhat.com>
	<20160815100938.vve6hknieytt2ys7@kamzik.localdomain>
From: Wei Huang <wei@redhat.com>
Message-ID: <5db15b5a-4ac7-ec19-dbc6-e5fec562c1e5@redhat.com>
Date: Mon, 15 Aug 2016 16:05:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <20160815100938.vve6hknieytt2ys7@kamzik.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 15 Aug 2016 21:05:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V1 1/1] arm64: Add an option to
 turn on/off host-backed vPMU support
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	abologna@redhat.com, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hBRYOWmNlfWH



On 08/15/2016 05:09 AM, Andrew Jones wrote:
> On Sat, Aug 13, 2016 at 12:52:50AM -0500, Wei Huang wrote:
>> This patch adds a pmu=[on/off] option to enable/disable host vPMU
>> support in guest VM. There are several reasons to justify this option.
>> First, host-backed vPMU can be problematic for cross-migration between
>> different SoC as perf counters are architecture-dependent. It is more
>> flexible to have an option to turn it on/off. Secondly this option
>> matches the "pmu" option as supported in libvirt tool.
>>
>> Note that, like "has_el3", the "pmu" option is only made available on
>> CPUs that support host-backed vPMU. They include:
>>     * cortex-a53 + kvm
>>     * cortex-a57 + kvm
>>     * host + kvm
>> This option is removed in other configs where it doesn't make sense
>> (e.g. cortex-a57 + TCG); and the default pmu support is off. This patch
> 
> Some of the PMU registers are already emulated with TCG. While it
> doesn't make much sense to use perf counters in a TCG guest for
> measuring anything, it may have merit for emulation completeness
> and debug. With that in mind, then I think we need to add the PMU
> feature to all processors that support it, and thus the 'has_pmu'

The TCG case you mentioned was one reason I changed the naming. The
existing "has_pmu" variable was introduced recently and it didn't cover
the case of TCG. Reading 5c0a3819, it is only turned on when KVM is
enabled and PMU_V3_extension is available. If we want to extend the
meaning of "has_pmu" for all PMU cases (i.e. KVM + TCG), we probably
need to address cases of has_pmu=ON + TCG=ON.

> name is better. As the feature is optional, I agree it does make
> sense that it's off by default, and only available with the pmu=on
> property.
> 
> I think there are more processors than just A53 and A57.

host-backed vPMU is only available on A53/A57/host. But TCG supports
more than A53/A57.

> 
>> has been tested under both DT/ACPI modes.
>>
>> Signed-off-by: Wei Huang <wei@redhat.com>
>> ---
>>  hw/arm/virt-acpi-build.c |  2 +-
>>  hw/arm/virt.c            |  2 +-
>>  target-arm/cpu.c         | 13 +++++++++++++
>>  target-arm/cpu.h         |  3 ++-
>>  target-arm/cpu64.c       |  6 ++++++
>>  target-arm/kvm64.c       | 10 +++++-----
>>  6 files changed, 28 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 28fc59c..22fb9d9 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -540,7 +540,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>>          gicc->uid = i;
>>          gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
>>  
>> -        if (armcpu->has_pmu) {
>> +        if (armcpu->has_host_pmu) {
>>              gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
>>          }
>>      }
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index a193b5a..4975f38 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -477,7 +477,7 @@ static void fdt_add_pmu_nodes(const VirtBoardInfo *vbi, int gictype)
>>  
>>      CPU_FOREACH(cpu) {
>>          armcpu = ARM_CPU(cpu);
>> -        if (!armcpu->has_pmu ||
>> +        if (!armcpu->has_host_pmu ||
>>              !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ))) {
>>              return;
>>          }
>> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
>> index ce8b8f4..a527128 100644
>> --- a/target-arm/cpu.c
>> +++ b/target-arm/cpu.c
>> @@ -509,6 +509,10 @@ static Property arm_cpu_rvbar_property =
>>  static Property arm_cpu_has_el3_property =
>>              DEFINE_PROP_BOOL("has_el3", ARMCPU, has_el3, true);
>>  
>> +/* use property name "pmu" to match with other archs and libvirt */
>> +static Property arm_cpu_has_host_pmu_property =
>> +    DEFINE_PROP_BOOL("pmu", ARMCPU, has_host_pmu, false);
>> +
>>  static Property arm_cpu_has_mpu_property =
>>              DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
>>  
>> @@ -552,6 +556,11 @@ static void arm_cpu_post_init(Object *obj)
>>  #endif
>>      }
>>  
>> +    if (arm_feature(&cpu->env, ARM_FEATURE_HOST_PMU)) {
>> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_host_pmu_property,
>> +                                 &error_abort);
>> +    }
>> +
>>      if (arm_feature(&cpu->env, ARM_FEATURE_MPU)) {
>>          qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property,
>>                                   &error_abort);
>> @@ -648,6 +657,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>          cpu->id_aa64pfr0 &= ~0xf000;
>>      }
>>  
>> +    if (!cpu->has_host_pmu) {
>> +        unset_feature(env, ARM_FEATURE_HOST_PMU);
>> +    }
> 
> I think this is the right approach. But we should add the feature to all
> processors that can have it, and then, after checking the property's
> value, we remove it when it's not desired.
> 
>> +
>>      if (!arm_feature(env, ARM_FEATURE_EL2)) {
>>          /* Disable the hypervisor feature bits in the processor feature
>>           * registers if we don't have EL2. These are id_pfr1[15:12] and
>> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
>> index 76d824d..f3f6d3f 100644
>> --- a/target-arm/cpu.h
>> +++ b/target-arm/cpu.h
>> @@ -580,7 +580,7 @@ struct ARMCPU {
>>      /* CPU has security extension */
>>      bool has_el3;
>>      /* CPU has PMU (Performance Monitor Unit) */
>> -    bool has_pmu;
>> +    bool has_host_pmu;
>>  
>>      /* CPU has memory protection unit */
>>      bool has_mpu;
>> @@ -1129,6 +1129,7 @@ enum arm_features {
>>      ARM_FEATURE_V8_SHA256, /* implements SHA256 part of v8 Crypto Extensions */
>>      ARM_FEATURE_V8_PMULL, /* implements PMULL part of v8 Crypto Extensions */
>>      ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodings */
>> +    ARM_FEATURE_HOST_PMU, /* PMU supported by host */
>>  };
>>  
>>  static inline int arm_feature(CPUARMState *env, int feature)
>> diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
>> index 1635deb..19e8127 100644
>> --- a/target-arm/cpu64.c
>> +++ b/target-arm/cpu64.c
>> @@ -111,6 +111,9 @@ static void aarch64_a57_initfn(Object *obj)
>>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>>      set_feature(&cpu->env, ARM_FEATURE_CRC);
>>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>> +    if (kvm_enabled()) {
>> +        set_feature(&cpu->env, ARM_FEATURE_HOST_PMU);
>> +    }
> 
> We shouldn't need the if (kvm_enabled()) here.
> 
>>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
>>      cpu->midr = 0x411fd070;
>>      cpu->revidr = 0x00000000;
>> @@ -166,6 +169,9 @@ static void aarch64_a53_initfn(Object *obj)
>>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>>      set_feature(&cpu->env, ARM_FEATURE_CRC);
>>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>> +    if (kvm_enabled()) {
>> +        set_feature(&cpu->env, ARM_FEATURE_HOST_PMU);
>> +    }
> 
> Or here.
> 
>>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
>>      cpu->midr = 0x410fd034;
>>      cpu->revidr = 0x00000000;
>> diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
>> index 5faa76c..588e5e3 100644
>> --- a/target-arm/kvm64.c
>> +++ b/target-arm/kvm64.c
>> @@ -469,6 +469,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
>>      set_feature(&features, ARM_FEATURE_VFP4);
>>      set_feature(&features, ARM_FEATURE_NEON);
>>      set_feature(&features, ARM_FEATURE_AARCH64);
>> +    set_feature(&features, ARM_FEATURE_HOST_PMU);
>>  
>>      ahcc->features = features;
>>  
>> @@ -501,11 +502,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>      if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
>>      }
>> -    if (kvm_irqchip_in_kernel() &&
>> -        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
>> -        cpu->has_pmu = true;
>> -        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
>> -    }
>> +    /* enable vPMU based on KVM mode, hw capability, and user setting */
>> +    cpu->has_host_pmu &= kvm_irqchip_in_kernel() &&
>> +        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3);
>> +    cpu->kvm_init_features[0] |= cpu->has_host_pmu << KVM_ARM_VCPU_PMU_V3;
> 
> Hmm... so now if the user doesn't specify pmu=on (off by default) then we
> silently disable it (I think that's a 2.6 compat issue), and if they do
^^^^^^^^^^^^^ True. I will see if I can create a patch backward
compatible with 2.6.

> specify pmu=on, but KVM doesn't support it, then it's silently disabled,
> which isn't nice. I think QEMU should error out in that case, explaining
> that the user specified incompatible options, i.e. they selected accel=kvm
> and pmu=on, but their KVM version (or cpu model) doesn't support PMU
> emulation.

True. This can be fixed.

> 
>>  
>>      /* Do KVM_ARM_VCPU_INIT ioctl */
>>      ret = kvm_arm_vcpu_init(cs);
>> -- 
>> 2.4.11
>>
>>
> 
> Thanks,
> drew 
> 
