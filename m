Received: by 10.25.208.194 with SMTP id h185csp1164927lfg;
        Sat, 23 Apr 2016 00:57:49 -0700 (PDT)
X-Received: by 10.140.146.10 with SMTP id 10mr16416358qhs.30.1461398269189;
        Sat, 23 Apr 2016 00:57:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i94si5132613qkh.186.2016.04.23.00.57.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Apr 2016 00:57:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49013 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atsRn-0005bk-Nl
	for alex.bennee@linaro.org; Sat, 23 Apr 2016 03:57:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1atsRk-0005Yz-Pc
	for qemu-arm@nongnu.org; Sat, 23 Apr 2016 03:57:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1atsRh-0000DS-IH
	for qemu-arm@nongnu.org; Sat, 23 Apr 2016 03:57:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1atsRh-0000DF-AU; Sat, 23 Apr 2016 03:57:41 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B31A385A02;
	Sat, 23 Apr 2016 07:57:39 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-18.brq.redhat.com [10.40.204.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3N7vZh3020330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sat, 23 Apr 2016 03:57:37 -0400
Date: Sat, 23 Apr 2016 09:57:35 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160423075735.kgtarkxyi6puwca7@hawk.localdomain>
References: <1458899181-17896-1-git-send-email-zhaoshenglong@huawei.com>
	<1458899181-17896-3-git-send-email-zhaoshenglong@huawei.com>
	<20160422143233.aunjwn6l37toqtqc@hawk.localdomain>
	<571AC94D.20004@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571AC94D.20004@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] hw/arm/virt: Add PMU node
 for virt machine
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
Cc: peter.maydell@linaro.org, peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hRghWyOnzEIw

On Sat, Apr 23, 2016 at 09:01:01AM +0800, Shannon Zhao wrote:
> 
> 
> On 2016/4/22 22:32, Andrew Jones wrote:
> > On Fri, Mar 25, 2016 at 05:46:20PM +0800, Shannon Zhao wrote:
> >> From: Shannon Zhao <shannon.zhao@linaro.org>
> >>
> >> Add a virtual PMU device for virt machine while use PPI 7 for PMU
> >> overflow interrupt number.
> >>
> >> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> >> ---
> >>  hw/arm/virt.c         | 31 +++++++++++++++++++++++++++++++
> >>  include/hw/arm/virt.h |  2 ++
> >>  include/sysemu/kvm.h  |  1 +
> >>  stubs/kvm.c           |  5 +++++
> >>  target-arm/kvm64.c    | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
> >>  5 files changed, 90 insertions(+)
> >>
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index 95331a5..94c2beb 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -427,6 +427,35 @@ static void fdt_add_gic_node(VirtBoardInfo *vbi, int type)
> >>      qemu_fdt_setprop_cell(vbi->fdt, "/intc", "phandle", vbi->gic_phandle);
> >>  }
> >>  
> >> +static void fdt_add_pmu_nodes(const VirtBoardInfo *vbi)
> >> +{
> >> +    CPUState *cpu;
> >> +    ARMCPU *armcpu;
> >> +    uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
> >> +
> >> +    CPU_FOREACH(cpu) {
> >> +        armcpu = ARM_CPU(cpu);
> >> +	if (!armcpu->has_pmu) {
> >> +	    return;
> > 
> > funny indentation here
> > 
> >> +	}
> >> +
> >> +        kvm_arm_pmu_create(cpu, VIRTUAL_PMU_IRQ + 16);
> > 
> > I think we should have a PPI(irq) ((irq) + 16) type of macro.
> > 
> >> +    }
> >> +
> >> +    irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
> >> +                         GIC_FDT_IRQ_PPI_CPU_WIDTH, (1 << vbi->smp_cpus) - 1);
> >> +
> >> +    armcpu = ARM_CPU(qemu_get_cpu(0));
> >> +    qemu_fdt_add_subnode(vbi->fdt, "/pmu");
> >> +    if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
> >> +        const char compat[] = "arm,armv8-pmuv3";
> >> +        qemu_fdt_setprop(vbi->fdt, "/pmu", "compatible",
> >> +                         compat, sizeof(compat));
> >> +        qemu_fdt_setprop_cells(vbi->fdt, "/pmu", "interrupts",
> >> +                               GIC_FDT_IRQ_TYPE_PPI, VIRTUAL_PMU_IRQ, irqflags);
> >> +    }
> > 
> > else what? I guess it's not possible to have has_pmu and !ARM_FEATURE_V8
> > at the same time right now, but it seems strange to create a /pmu node,
> > but then only conditionally populate it.
> > 
> Yeah, currently kvm only supports guest PMU for ARMv8, but maybe in the
> future it will support ARMv7.
> 
> >> +}
> >> +
> >>  static void create_v2m(VirtBoardInfo *vbi, qemu_irq *pic)
> >>  {
> >>      int i;
> >> @@ -1242,6 +1271,8 @@ static void machvirt_init(MachineState *machine)
> >>  
> >>      create_gic(vbi, pic, gic_version, vms->secure);
> >>  
> >> +    fdt_add_pmu_nodes(vbi);
> >> +
> >>      create_uart(vbi, pic, VIRT_UART, sysmem);
> >>  
> >>      if (vms->secure) {
> >> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> >> index ecd8589..864eb49 100644
> >> --- a/include/hw/arm/virt.h
> >> +++ b/include/hw/arm/virt.h
> >> @@ -40,6 +40,8 @@
> >>  #define ARCH_TIMER_NS_EL1_IRQ 14
> >>  #define ARCH_TIMER_NS_EL2_IRQ 10
> >>  
> >> +#define VIRTUAL_PMU_IRQ 7
> > 
> > Can we find a way to make this configurable? a cpu property?
> > 
> Of course we can. But as we are the maker of the virt machine board, we
> can decide the design of the hardware. In addition, what's the purpose
> for making it configurable?

Yeah, nevermind. I can't think of any good reason right now. I was only
thinking about it because your KVM interface allows for either SPI or
PPI. But, even considering that, I guess we still don't need to allow
the number(s) to be configurable, just the type. For SPI we'd need to
reserve a range of numbers though, since each cpu needs their own.

> 
> >> +
> >>  enum {
> >>      VIRT_FLASH,
> >>      VIRT_MEM,
> >> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> >> index 6695fa7..80b6cb3 100644
> >> --- a/include/sysemu/kvm.h
> >> +++ b/include/sysemu/kvm.h
> >> @@ -514,4 +514,5 @@ int kvm_set_one_reg(CPUState *cs, uint64_t id, void *source);
> >>   * Returns: 0 on success, or a negative errno on failure.
> >>   */
> >>  int kvm_get_one_reg(CPUState *cs, uint64_t id, void *target);
> >> +void kvm_arm_pmu_create(CPUState *cs, int irq);
> >>  #endif
> >> diff --git a/stubs/kvm.c b/stubs/kvm.c
> >> index ddd6204..58a348a 100644
> >> --- a/stubs/kvm.c
> >> +++ b/stubs/kvm.c
> >> @@ -6,3 +6,8 @@ int kvm_arch_irqchip_create(MachineState *ms, KVMState *s)
> >>  {
> >>      return 0;
> >>  }
> >> +
> >> +void kvm_arm_pmu_create(CPUState *cs, int irq)
> >> +{
> >> +    return;
> >> +}
> >> diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
> >> index b364789..b97b9ef 100644
> >> --- a/target-arm/kvm64.c
> >> +++ b/target-arm/kvm64.c
> >> @@ -382,6 +382,57 @@ static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
> >>      return NULL;
> >>  }
> >>  
> >> +static bool kvm_arm_pmu_support_ctrl(CPUState *cs, struct kvm_device_attr *attr)
> >> +{
> >> +    return kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr) == 0;
> >> +}
> >> +
> >> +static void kvm_arm_pmu_init(CPUState *cs)
> >> +{
> >> +    int err;
> >> +
> >> +    struct kvm_device_attr attr = {
> >> +        .group = KVM_ARM_VCPU_PMU_V3_CTRL,
> >> +        .attr = KVM_ARM_VCPU_PMU_V3_INIT,
> >> +        .flags = 0,
> >> +    };
> >> +
> >> +    if (!kvm_arm_pmu_support_ctrl(cs, &attr)) {
> >> +        return;
> >> +    }
> > 
> > I don't think we need to do this check again here. kvm_arm_pmu_init is
> > only called from a function that already checked for the IRQ attribute,
> > and both IRQ and INIT were added to the kernel at the same time.
> > 
> > Actually I think we could just opencode kvm_arm_pmu_init in
> > kvm_arm_pmu_create.
> > 
> Sure. Thanks.
> 
> -- 
> Shannon
> 
> 
