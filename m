Received: by 10.25.208.194 with SMTP id h185csp795854lfg;
        Mon, 25 Apr 2016 02:22:52 -0700 (PDT)
X-Received: by 10.55.117.5 with SMTP id q5mr17212688qkc.195.1461576172522;
        Mon, 25 Apr 2016 02:22:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u8si10000149qkl.122.2016.04.25.02.22.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 02:22:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aucjD-0002MC-AV
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 05:22:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aucj9-0002IN-UT
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 05:22:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aucj5-0004YH-SX
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 05:22:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43652)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aucj5-0004Y7-Lh; Mon, 25 Apr 2016 05:22:43 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27AF5C03E9;
	Mon, 25 Apr 2016 09:22:43 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-112.brq.redhat.com [10.34.1.112])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3P9MdnA017413
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 25 Apr 2016 05:22:41 -0400
Date: Mon, 25 Apr 2016 11:22:39 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160425092239.qhmyqjlrvms3auim@hawk.localdomain>
References: <1461568306-14624-1-git-send-email-zhaoshenglong@huawei.com>
	<1461568306-14624-3-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461568306-14624-3-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 2/3] hw/arm/virt: Add PMU
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
X-TUID: jNBwHo5pQf0Q

On Mon, Apr 25, 2016 at 03:11:45PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Add a virtual PMU device for virt machine while use PPI 7 for PMU
> overflow interrupt number.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/arm/virt.c         | 34 ++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h |  4 ++++
>  include/sysemu/kvm.h  |  1 +
>  stubs/kvm.c           |  5 +++++
>  target-arm/kvm64.c    | 39 +++++++++++++++++++++++++++++++++++++++
>  5 files changed, 83 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 56d35c7..c3632d8 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -428,6 +428,38 @@ static void fdt_add_gic_node(VirtBoardInfo *vbi, int type)
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
> +        if (!armcpu->has_pmu) {
> +            return;
> +        }
> +
> +        kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ));

I think we need to return a failure code from kvm_arm_pmu_create, and
then do

           if (!kvm_arm_pmu_create(...)) {
               return;
           }

Otherwise we create a /pmu node for the guest that won't work.

> +    }
> +
> +    if (gictype == 2) {
> +        irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
> +                             GIC_FDT_IRQ_PPI_CPU_WIDTH,
> +                             (1 << vbi->smp_cpus) - 1);

So, if we're using gicv3, then we're level triggered and these cpu
mask bits aren't defined by the arm,gic-v3.txt bindings spec. Good.

If we're using gicv2, then we're edge triggered and this mask is
defined. Assuming the GIC implementation requires using edge
triggered interrupts (as the comment in fdt_add_timer_nodes says),
then OK.

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
> @@ -1246,6 +1278,8 @@ static void machvirt_init(MachineState *machine)
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
> index 0e18f15..90c2c54 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -523,4 +523,5 @@ int kvm_set_one_reg(CPUState *cs, uint64_t id, void *source);
>   * Returns: 0 on success, or a negative errno on failure.
>   */
>  int kvm_get_one_reg(CPUState *cs, uint64_t id, void *target);
> +void kvm_arm_pmu_create(CPUState *cs, int irq);
>  #endif
> diff --git a/stubs/kvm.c b/stubs/kvm.c
> index ddd6204..58a348a 100644
> --- a/stubs/kvm.c
> +++ b/stubs/kvm.c
> @@ -6,3 +6,8 @@ int kvm_arch_irqchip_create(MachineState *ms, KVMState *s)
>  {
>      return 0;
>  }
> +
> +void kvm_arm_pmu_create(CPUState *cs, int irq)
> +{
> +    return;
> +}
> diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
> index b364789..22fe2a3 100644
> --- a/target-arm/kvm64.c
> +++ b/target-arm/kvm64.c
> @@ -382,6 +382,45 @@ static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
>      return NULL;
>  }
>  
> +static bool kvm_arm_pmu_support_ctrl(CPUState *cs, struct kvm_device_attr *attr)
> +{
> +    return kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr) == 0;
> +}
> +
> +void kvm_arm_pmu_create(CPUState *cs, int irq)
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
> +        return;
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
> +}
>  
>  static inline void set_feature(uint64_t *features, int feature)
>  {
> -- 
> 2.0.4
> 
> 
>

Thanks,
drew 
