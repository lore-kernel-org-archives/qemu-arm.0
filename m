Received: by 10.25.208.194 with SMTP id h185csp1466776lfg;
        Tue, 26 Apr 2016 05:07:07 -0700 (PDT)
X-Received: by 10.55.145.6 with SMTP id t6mr1762707qkd.206.1461672427582;
        Tue, 26 Apr 2016 05:07:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si13298635qkg.231.2016.04.26.05.07.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Apr 2016 05:07:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37667 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1av1lh-00022D-V1
	for alex.bennee@linaro.org; Tue, 26 Apr 2016 08:07:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1av1le-0001yj-FU
	for qemu-arm@nongnu.org; Tue, 26 Apr 2016 08:07:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1av1lb-0001nD-8H
	for qemu-arm@nongnu.org; Tue, 26 Apr 2016 08:07:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58543)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1av1lb-0001mn-1C; Tue, 26 Apr 2016 08:06:59 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1853C057FA6;
	Tue, 26 Apr 2016 12:06:57 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-112.brq.redhat.com [10.34.1.112])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3QC6rIn005376
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 26 Apr 2016 08:06:56 -0400
Date: Tue, 26 Apr 2016 14:06:53 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160426120653.dq54gylt3d5gxv5h@hawk.localdomain>
References: <1461670846-13196-1-git-send-email-zhaoshenglong@huawei.com>
	<1461670846-13196-3-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461670846-13196-3-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 2/3] hw/arm/virt: Add PMU
 node for virt machine
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
Cc: peter.maydell@linaro.org, peter.huangpeng@huawei.com, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bLK69WxUbpph

On Tue, Apr 26, 2016 at 07:40:45PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Add a virtual PMU device for virt machine while use PPI 7 for PMU
> overflow interrupt number.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/arm/virt.c         | 33 +++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h |  4 ++++
>  include/sysemu/kvm.h  |  1 +
>  stubs/kvm.c           |  5 +++++
>  target-arm/kvm64.c    | 41 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 84 insertions(+)

Reviewed-by: Andrew Jones <drjones@redhat.com>

> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 56d35c7..376cb87 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -428,6 +428,37 @@ static void fdt_add_gic_node(VirtBoardInfo *vbi, int type)
>      qemu_fdt_setprop_cell(vbi->fdt, "/intc", "phandle", vbi->gic_phandle);
>  }
>  
> +static void fdt_add_pmu_nodes(const VirtBoardInfo *vbi, int gictype)
> +{
> +    CPUState *cpu;
> +    ARMCPU *armcpu;
> +    uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
> +
> +    CPU_FOREACH(cpu) {
> +        armcpu = ARM_CPU(cpu);
> +        if (!armcpu->has_pmu ||
> +            !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ))) {
> +            return;
> +        }
> +    }
> +
> +    if (gictype == 2) {
> +        irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
> +                             GIC_FDT_IRQ_PPI_CPU_WIDTH,
> +                             (1 << vbi->smp_cpus) - 1);
> +    }
> +
> +    armcpu = ARM_CPU(qemu_get_cpu(0));
> +    qemu_fdt_add_subnode(vbi->fdt, "/pmu");
> +    if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
> +        const char compat[] = "arm,armv8-pmuv3";
> +        qemu_fdt_setprop(vbi->fdt, "/pmu", "compatible",
> +                         compat, sizeof(compat));
> +        qemu_fdt_setprop_cells(vbi->fdt, "/pmu", "interrupts",
> +                               GIC_FDT_IRQ_TYPE_PPI, VIRTUAL_PMU_IRQ, irqflags);
> +    }
> +}
> +
>  static void create_v2m(VirtBoardInfo *vbi, qemu_irq *pic)
>  {
>      int i;
> @@ -1246,6 +1277,8 @@ static void machvirt_init(MachineState *machine)
>  
>      create_gic(vbi, pic, gic_version, vms->secure);
>  
> +    fdt_add_pmu_nodes(vbi, gic_version);
> +
>      create_uart(vbi, pic, VIRT_UART, sysmem);
>  
>      if (vms->secure) {
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index ecd8589..b50f095 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -40,6 +40,10 @@
>  #define ARCH_TIMER_NS_EL1_IRQ 14
>  #define ARCH_TIMER_NS_EL2_IRQ 10
>  
> +#define VIRTUAL_PMU_IRQ 7
> +
> +#define PPI(irq) ((irq) + 16)
> +
>  enum {
>      VIRT_FLASH,
>      VIRT_MEM,
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 0e18f15..4522043 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -523,4 +523,5 @@ int kvm_set_one_reg(CPUState *cs, uint64_t id, void *source);
>   * Returns: 0 on success, or a negative errno on failure.
>   */
>  int kvm_get_one_reg(CPUState *cs, uint64_t id, void *target);
> +int kvm_arm_pmu_create(CPUState *cs, int irq);
>  #endif
> diff --git a/stubs/kvm.c b/stubs/kvm.c
> index ddd6204..667e269 100644
> --- a/stubs/kvm.c
> +++ b/stubs/kvm.c
> @@ -6,3 +6,8 @@ int kvm_arch_irqchip_create(MachineState *ms, KVMState *s)
>  {
>      return 0;
>  }
> +
> +int kvm_arm_pmu_create(CPUState *cs, int irq)
> +{
> +    return 0;
> +}
> diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
> index b364789..893f983 100644
> --- a/target-arm/kvm64.c
> +++ b/target-arm/kvm64.c
> @@ -382,6 +382,47 @@ static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
>      return NULL;
>  }
>  
> +static bool kvm_arm_pmu_support_ctrl(CPUState *cs, struct kvm_device_attr *attr)
> +{
> +    return kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr) == 0;
> +}
> +
> +int kvm_arm_pmu_create(CPUState *cs, int irq)
> +{
> +    int err;
> +
> +    struct kvm_device_attr attr = {
> +        .group = KVM_ARM_VCPU_PMU_V3_CTRL,
> +        .addr = (intptr_t)&irq,
> +        .attr = KVM_ARM_VCPU_PMU_V3_IRQ,
> +        .flags = 0,
> +    };
> +
> +    if (!kvm_arm_pmu_support_ctrl(cs, &attr)) {
> +        return 0;
> +    }
> +
> +    err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, &attr);
> +    if (err < 0) {
> +        fprintf(stderr, "KVM_SET_DEVICE_ATTR failed: %s\n",
> +                strerror(-err));
> +        abort();
> +    }
> +
> +    attr.group = KVM_ARM_VCPU_PMU_V3_CTRL;
> +    attr.attr = KVM_ARM_VCPU_PMU_V3_INIT;
> +    attr.addr = 0;
> +    attr.flags = 0;
> +
> +    err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, &attr);
> +    if (err < 0) {
> +        fprintf(stderr, "KVM_SET_DEVICE_ATTR failed: %s\n",
> +                strerror(-err));
> +        abort();
> +    }
> +
> +    return 1;
> +}
>  
>  static inline void set_feature(uint64_t *features, int feature)
>  {
> -- 
> 2.0.4
> 
> 
> 
