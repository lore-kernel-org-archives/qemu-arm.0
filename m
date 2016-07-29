Received: by 10.25.21.156 with SMTP id 28csp1074521lfv;
        Thu, 28 Jul 2016 18:03:56 -0700 (PDT)
X-Received: by 10.237.59.79 with SMTP id q15mr61026639qte.77.1469754236203;
        Thu, 28 Jul 2016 18:03:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e70si5370366qka.15.2016.07.28.18.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 18:03:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56473 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSwDT-0000EI-Iv
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 21:03:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bSwDO-0000Bo-MK
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 21:03:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bSwDM-0004Xf-Dq
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 21:03:49 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:54008)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bSwDF-0004TN-1M; Thu, 28 Jul 2016 21:03:42 -0400
Received: from 172.24.1.36 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.36])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DOK31096; Fri, 29 Jul 2016 09:00:02 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 29 Jul 2016 08:59:58 +0800
Message-ID: <579AAA8E.4060703@huawei.com>
Date: Fri, 29 Jul 2016 08:59:58 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Wei Huang <wei@redhat.com>, <qemu-arm@nongnu.org>
References: <1469723896-28049-1-git-send-email-wei@redhat.com>
In-Reply-To: <1469723896-28049-1-git-send-email-wei@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090204.579AAA93.00D6, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 49c62be70d229348b8c911b483c640ea
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
	abologna@redhat.com, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YuoRXcjXgKFn



On 2016/7/29 0:38, Wei Huang wrote:
> This patch adds a pmu=[on/off] option to enable/disable vpmu support
> in guest vm. There are several reasons to justify this option. First
> vpmu can be problematic for cross-migration between different SoC as
> perf counters is architecture-dependent. It is more flexible to
> have an option to turn it on/off. Secondly it matches the -cpu pmu
> option in libivrt. This patch has been tested on both DT/ACPI modes.
> 
> Signed-off-by: Wei Huang <wei@redhat.com>
Reviewed-by：Shannon Zhao <shannon.zhao@linaro.org>

> ---
>  hw/arm/virt-acpi-build.c |  2 +-
>  hw/arm/virt.c            |  2 +-
>  target-arm/cpu.c         |  1 +
>  target-arm/cpu.h         |  5 +++--
>  target-arm/kvm64.c       | 10 +++++-----
>  5 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 28fc59c..dc5f66d 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -540,7 +540,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>          gicc->uid = i;
>          gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
>  
> -        if (armcpu->has_pmu) {
> +        if (armcpu->enable_pmu) {
>              gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
>          }
>      }
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a193b5a..6aea901 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -477,7 +477,7 @@ static void fdt_add_pmu_nodes(const VirtBoardInfo *vbi, int gictype)
>  
>      CPU_FOREACH(cpu) {
>          armcpu = ARM_CPU(cpu);
> -        if (!armcpu->has_pmu ||
> +        if (!armcpu->enable_pmu ||
>              !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ))) {
>              return;
>          }
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index ce8b8f4..f7daf81 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -1412,6 +1412,7 @@ static const ARMCPUInfo arm_cpus[] = {
>  };
>  
>  static Property arm_cpu_properties[] = {
> +    DEFINE_PROP_BOOL("pmu", ARMCPU, enable_pmu, true),
>      DEFINE_PROP_BOOL("start-powered-off", ARMCPU, start_powered_off, false),
>      DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
>      DEFINE_PROP_UINT32("midr", ARMCPU, midr, 0),
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 76d824d..f2341c0 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -579,8 +579,9 @@ struct ARMCPU {
>      bool powered_off;
>      /* CPU has security extension */
>      bool has_el3;
> -    /* CPU has PMU (Performance Monitor Unit) */
> -    bool has_pmu;
> +
> +    /* CPU has vPMU (Performance Monitor Unit) support */
> +    bool enable_pmu;
>  
>      /* CPU has memory protection unit */
>      bool has_mpu;
> diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
> index 5faa76c..ca21670 100644
> --- a/target-arm/kvm64.c
> +++ b/target-arm/kvm64.c
> @@ -501,11 +501,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
>      }
> -    if (kvm_irqchip_in_kernel() &&
> -        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
> -        cpu->has_pmu = true;
> -        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
> -    }
> +
> +    /* enable vPMU based on KVM mode and hardware capability */
> +    cpu->enable_pmu &= (kvm_irqchip_in_kernel() &&
> +        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3));
> +    cpu->kvm_init_features[0] |= cpu->enable_pmu << KVM_ARM_VCPU_PMU_V3;
>  
>      /* Do KVM_ARM_VCPU_INIT ioctl */
>      ret = kvm_arm_vcpu_init(cs);
> 

-- 
Shannon

