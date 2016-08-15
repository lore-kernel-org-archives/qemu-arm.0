Received: by 10.25.21.156 with SMTP id 28csp1669552lfv;
        Mon, 15 Aug 2016 16:08:07 -0700 (PDT)
X-Received: by 10.55.16.78 with SMTP id a75mr36344771qkh.231.1471302487638;
        Mon, 15 Aug 2016 16:08:07 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u8si15393091qtc.132.2016.08.15.16.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Aug 2016 16:08:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39213 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZQzH-0000iH-2t
	for alex.bennee@linaro.org; Mon, 15 Aug 2016 19:08:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bZQxn-00007r-5k
	for qemu-devel@nongnu.org; Mon, 15 Aug 2016 19:06:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bZQxj-0002jB-Px
	for qemu-devel@nongnu.org; Mon, 15 Aug 2016 19:06:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38464)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1bZQxa-0002i7-Mo; Mon, 15 Aug 2016 19:06:22 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E49B82C;
	Mon, 15 Aug 2016 23:06:22 +0000 (UTC)
Received: from [10.10.54.99] (vpn-54-99.rdu2.redhat.com [10.10.54.99])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7FLFMng018607; Mon, 15 Aug 2016 17:15:22 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1471067570-7503-1-git-send-email-wei@redhat.com>
	<CAFEAcA-_hc71ScfUs8WOjJcM2SN+uR3ukjVt+BXUD9tMoRKKjw@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <57B230E9.5070808@redhat.com>
Date: Mon, 15 Aug 2016 16:15:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-_hc71ScfUs8WOjJcM2SN+uR3ukjVt+BXUD9tMoRKKjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 15 Aug 2016 23:06:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V1 1/1] arm64: Add an option to turn on/off
 host-backed vPMU support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pbSvHVoEmUYs



On 8/15/16 11:13, Peter Maydell wrote:
> On 13 August 2016 at 06:52, Wei Huang <wei@redhat.com> wrote:
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
> 
> Can you explain why you renamed this? "has_pmu" matches
> the comment: it indicates that the emulated CPU has a PMU.
> has_host_pmu would be something different (and would only

The existing "has_pmu" was added and only enabled under KVM. So its
existing meaning is a bit misleading. It doesn't address the case of TCG.


> apply to KVM). It also looks weird in the code in the board
> model: we should be saying "if the guest CPU has a PMU, wire
> up its interrupt", not "if the host CPU has a PMU, wire
> up a guest CPU interrupt".

I can change it back to "has_pmu" as suggested by you and Drew; but we
need to be careful of using it, especially under TCG mode. For instance,
with "-M virt,accel=tcg -cpu host,pmu=off", we expect PMU is turned off.
But TCG still emulates some PMU counters (e.g. pmccntr).

> 
>>
>>      /* CPU has memory protection unit */
>>      bool has_mpu;
>> @@ -1129,6 +1129,7 @@ enum arm_features {
>>      ARM_FEATURE_V8_SHA256, /* implements SHA256 part of v8 Crypto Extensions */
>>      ARM_FEATURE_V8_PMULL, /* implements PMULL part of v8 Crypto Extensions */
>>      ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodings */
>> +    ARM_FEATURE_HOST_PMU, /* PMU supported by host */
> 
> ARM_FEATURE_ bits are for guest CPU features, not for
> recording information about the host CPU.

OK, will address it.

> 
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
> This definitely looks like the wrong place to be checking
> kvm_enabled().
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
>>
>>      /* Do KVM_ARM_VCPU_INIT ioctl */
>>      ret = kvm_arm_vcpu_init(cs);
>> --
>> 2.4.11
>>
> 
> thanks
> -- PMM
> 
