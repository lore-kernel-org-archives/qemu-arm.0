Received: by 10.25.21.156 with SMTP id 28csp1389664lfv;
        Fri, 29 Jul 2016 08:07:35 -0700 (PDT)
X-Received: by 10.129.70.137 with SMTP id t131mr18200489ywa.268.1469804854917;
        Fri, 29 Jul 2016 08:07:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l3si12459490qtb.64.2016.07.29.08.07.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jul 2016 08:07:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bT9Nu-00070S-7D
	for alex.bennee@linaro.org; Fri, 29 Jul 2016 11:07:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bT9Np-0006xW-RG
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 11:07:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bT9Nl-00049l-In
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 11:07:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42706)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1bT9Nl-00049Z-B0; Fri, 29 Jul 2016 11:07:25 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E20E7C057FAD;
	Fri, 29 Jul 2016 15:07:24 +0000 (UTC)
Received: from [10.10.62.40] (vpn-62-40.rdu2.redhat.com [10.10.62.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6TF7N7X030668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 29 Jul 2016 11:07:24 -0400
To: Andrew Jones <drjones@redhat.com>
References: <1469723896-28049-1-git-send-email-wei@redhat.com>
	<20160729065453.qq44y2hxohizk3yw@hawk.localdomain>
From: Wei Huang <wei@redhat.com>
Message-ID: <372c2f00-b1d0-6f52-c969-a80b753a8942@redhat.com>
Date: Fri, 29 Jul 2016 10:07:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <20160729065453.qq44y2hxohizk3yw@hawk.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 29 Jul 2016 15:07:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 1/1] arm64: add an option to
 turn on/off vpmu support
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
X-TUID: tRl4WtW1LBhH



On 07/29/2016 01:54 AM, Andrew Jones wrote:
> On Thu, Jul 28, 2016 at 11:38:16AM -0500, Wei Huang wrote:
>> This patch adds a pmu=[on/off] option to enable/disable vpmu support
>> in guest vm. There are several reasons to justify this option. First
>> vpmu can be problematic for cross-migration between different SoC as
>> perf counters is architecture-dependent. It is more flexible to
>> have an option to turn it on/off. Secondly it matches the -cpu pmu
>> option in libivrt. This patch has been tested on both DT/ACPI modes.
>>
>> Signed-off-by: Wei Huang <wei@redhat.com>
>> ---
>>  hw/arm/virt-acpi-build.c |  2 +-
>>  hw/arm/virt.c            |  2 +-
>>  target-arm/cpu.c         |  1 +
>>  target-arm/cpu.h         |  5 +++--
>>  target-arm/kvm64.c       | 10 +++++-----
>>  5 files changed, 11 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 28fc59c..dc5f66d 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -540,7 +540,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>>          gicc->uid = i;
>>          gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
>>  
>> -        if (armcpu->has_pmu) {
>> +        if (armcpu->enable_pmu) {
>>              gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
>>          }
>>      }
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index a193b5a..6aea901 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -477,7 +477,7 @@ static void fdt_add_pmu_nodes(const VirtBoardInfo *vbi, int gictype)
>>  
>>      CPU_FOREACH(cpu) {
>>          armcpu = ARM_CPU(cpu);
>> -        if (!armcpu->has_pmu ||
>> +        if (!armcpu->enable_pmu ||
>>              !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ))) {
>>              return;
>>          }
>> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
>> index ce8b8f4..f7daf81 100644
>> --- a/target-arm/cpu.c
>> +++ b/target-arm/cpu.c
>> @@ -1412,6 +1412,7 @@ static const ARMCPUInfo arm_cpus[] = {
>>  };
>>  
>>  static Property arm_cpu_properties[] = {
>> +    DEFINE_PROP_BOOL("pmu", ARMCPU, enable_pmu, true),
> 
> x86's pmu property defaults to off. I'm not sure if it's necessary to
> have a consistent default between x86 and arm in order for libvirt to
> be able to use it in the same way. We should confirm with libvirt
> people. Anyway, I think I'd prefer we default off here, and then we
> can default on in machine code for configurations that we want it by
> default (only AArch64 KVM). Or, maybe we don't want it by default at
> all? Possibly we should only set it on by default for virt-2.6, and
> then, from 2.7 on, require users to opt-in to the feature. It makes
> sense to require opting-in to features that can cause problems with
> migration.

This option is default=off on x86. I agree that it is a compatibility
related issue which can break migration. So it is reasonable to turn it
off on ARM as well. Let us wait for libvirt people to voice out.

> 
>>      DEFINE_PROP_BOOL("start-powered-off", ARMCPU, start_powered_off, false),
>>      DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
>>      DEFINE_PROP_UINT32("midr", ARMCPU, midr, 0),
>> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
>> index 76d824d..f2341c0 100644
>> --- a/target-arm/cpu.h
>> +++ b/target-arm/cpu.h
>> @@ -579,8 +579,9 @@ struct ARMCPU {
>>      bool powered_off;
>>      /* CPU has security extension */
>>      bool has_el3;
>> -    /* CPU has PMU (Performance Monitor Unit) */
>> -    bool has_pmu;
>> +
>> +    /* CPU has vPMU (Performance Monitor Unit) support */
>> +    bool enable_pmu;
>>  
>>      /* CPU has memory protection unit */
>>      bool has_mpu;
>> diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
>> index 5faa76c..ca21670 100644
>> --- a/target-arm/kvm64.c
>> +++ b/target-arm/kvm64.c
>> @@ -501,11 +501,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>      if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
>>      }
>> -    if (kvm_irqchip_in_kernel() &&
>> -        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
>> -        cpu->has_pmu = true;
>> -        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
>> -    }
>> +
>> +    /* enable vPMU based on KVM mode and hardware capability */
>> +    cpu->enable_pmu &= (kvm_irqchip_in_kernel() &&
>> +        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3));
> 
> nit: the () aren't necessary
> 

Will fix

>> +    cpu->kvm_init_features[0] |= cpu->enable_pmu << KVM_ARM_VCPU_PMU_V3;
>>  
>>      /* Do KVM_ARM_VCPU_INIT ioctl */
>>      ret = kvm_arm_vcpu_init(cs);
>> -- 
>> 2.4.11
>>
>>
> 
> OK, so this property will be exposed to all ARM cpu types, and if a user
> turns it on, then it will stay on for all types, except when using KVM
> with an aarch64 cpu type, and KVM doesn't support it. This could mislead
> users to believe they'll get a pmu, by simply adding pmu=on, even when
> they can't. I think we'd ideally keep has_pmu, and the current code that
> sets it, and then add code like
> 
>  if (enable_pmu && !has_pmu) {
>    error_report("Warning: ...")
>  }
> 
> somewhere. Unfortunately I don't think there's any one place we could
> add that. We'd need to add it to every ARM machine type that cares about
> not misleading users. Too bad cpu properties aren't whitelisted by
> machines to avoid this issue.
> 
> Anyway, all that said, I see this is just how cpu properties currently
> work, so we probably don't need to worry about it for every machine. I
> do still suggest we add the above warning to mach-virt though.

Will try to keep both has_pmu & enable_pmu in the next re-spin...

> 
> Thanks,
> drew
> 
