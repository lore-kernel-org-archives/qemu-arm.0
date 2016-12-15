Received: by 10.25.205.13 with SMTP id d13csp1182lfg;
        Thu, 15 Dec 2016 02:23:16 -0800 (PST)
X-Received: by 10.55.76.150 with SMTP id z144mr432260qka.194.1481797396211;
        Thu, 15 Dec 2016 02:23:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id t1si690899qkf.231.2016.12.15.02.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Dec 2016 02:23:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53442 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHTBx-0005dY-4D
	for alex.bennee@linaro.org; Thu, 15 Dec 2016 05:23:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cHTBs-0005VP-J4
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 05:23:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cHTBm-0004Tt-Lt
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 05:23:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46388)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cHTBm-0004Sj-Df; Thu, 15 Dec 2016 05:23:02 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 82ACE3B72D;
	Thu, 15 Dec 2016 10:23:01 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBFAMxpU007817; Thu, 15 Dec 2016 05:23:00 -0500
Date: Thu, 15 Dec 2016 11:22:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20161215112259.45463fcf@nial.brq.redhat.com>
In-Reply-To: <20161213214522.25548-3-drjones@redhat.com>
References: <20161213214522.25548-1-drjones@redhat.com>
	<20161213214522.25548-3-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 15 Dec 2016 10:23:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 02/11] hw/arm/virt: use
 VirtMachineState.gic_version
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XRwcJzgM8/IF

On Tue, 13 Dec 2016 22:45:13 +0100
Andrew Jones <drjones@redhat.com> wrote:

> machvirt_init may need to probe for the gic version. If so, then
> make sure the result is written to VirtMachineState. With the
> state up to date, use it instead of a local variable. This is a
> cleanup that prepares for VirtMachineState to be passed to functions
> even outside hw/arm/virt.c
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c | 35 +++++++++++++++++------------------
>  1 file changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d451bc4f6b9b..67c0abb30b5b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -319,7 +319,7 @@ static void fdt_add_psci_node(const VirtMachineState *vms)
>      qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
>  }
>  
> -static void fdt_add_timer_nodes(const VirtMachineState *vms, int gictype)
> +static void fdt_add_timer_nodes(const VirtMachineState *vms)
>  {
>      /* On real hardware these interrupts are level-triggered.
>       * On KVM they were edge-triggered before host kernel version 4.4,
> @@ -347,7 +347,7 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms, int gictype)
>          irqflags = GIC_FDT_IRQ_FLAGS_EDGE_LO_HI;
>      }
>  
> -    if (gictype == 2) {
> +    if (vms->gic_version == 2) {
>          irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
>                               GIC_FDT_IRQ_PPI_CPU_WIDTH,
>                               (1 << vms->smp_cpus) - 1);
> @@ -462,7 +462,7 @@ static void fdt_add_v2m_gic_node(VirtMachineState *vms)
>      qemu_fdt_setprop_cell(vms->fdt, "/intc/v2m", "phandle", vms->msi_phandle);
>  }
>  
> -static void fdt_add_gic_node(VirtMachineState *vms, int type)
> +static void fdt_add_gic_node(VirtMachineState *vms)
>  {
>      vms->gic_phandle = qemu_fdt_alloc_phandle(vms->fdt);
>      qemu_fdt_setprop_cell(vms->fdt, "/", "interrupt-parent", vms->gic_phandle);
> @@ -473,7 +473,7 @@ static void fdt_add_gic_node(VirtMachineState *vms, int type)
>      qemu_fdt_setprop_cell(vms->fdt, "/intc", "#address-cells", 0x2);
>      qemu_fdt_setprop_cell(vms->fdt, "/intc", "#size-cells", 0x2);
>      qemu_fdt_setprop(vms->fdt, "/intc", "ranges", NULL, 0);
> -    if (type == 3) {
> +    if (vms->gic_version == 3) {
>          qemu_fdt_setprop_string(vms->fdt, "/intc", "compatible",
>                                  "arm,gic-v3");
>          qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
> @@ -500,7 +500,7 @@ static void fdt_add_gic_node(VirtMachineState *vms, int type)
>      qemu_fdt_setprop_cell(vms->fdt, "/intc", "phandle", vms->gic_phandle);
>  }
>  
> -static void fdt_add_pmu_nodes(const VirtMachineState *vms, int gictype)
> +static void fdt_add_pmu_nodes(const VirtMachineState *vms)
>  {
>      CPUState *cpu;
>      ARMCPU *armcpu;
> @@ -514,7 +514,7 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms, int gictype)
>          }
>      }
>  
> -    if (gictype == 2) {
> +    if (vms->gic_version == 2) {
>          irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
>                               GIC_FDT_IRQ_PPI_CPU_WIDTH,
>                               (1 << vms->smp_cpus) - 1);
> @@ -570,14 +570,14 @@ static void create_v2m(VirtMachineState *vms, qemu_irq *pic)
>      fdt_add_v2m_gic_node(vms);
>  }
>  
> -static void create_gic(VirtMachineState *vms, qemu_irq *pic, int type)
> +static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>  {
>      /* We create a standalone GIC */
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      DeviceState *gicdev;
>      SysBusDevice *gicbusdev;
>      const char *gictype;
> -    int i;
> +    int type = vms->gic_version, i;
>  
>      gictype = (type == 3) ? gicv3_class_name() : gic_class_name();
>  
> @@ -641,7 +641,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic, int type)
>          pic[i] = qdev_get_gpio_in(gicdev, i);
>      }
>  
> -    fdt_add_gic_node(vms, type);
> +    fdt_add_gic_node(vms);
>  
>      if (type == 3 && !vmc->no_its) {
>          create_its(vms, gicdev);
> @@ -1237,7 +1237,6 @@ static void machvirt_init(MachineState *machine)
>      qemu_irq pic[NUM_IRQS];
>      MemoryRegion *sysmem = get_system_memory();
>      MemoryRegion *secure_sysmem = NULL;
> -    int gic_version = vms->gic_version;
>      int n, virt_max_cpus;
>      MemoryRegion *ram = g_new(MemoryRegion, 1);
>      const char *cpu_model = machine->cpu_model;
> @@ -1258,14 +1257,14 @@ static void machvirt_init(MachineState *machine)
>      /* We can probe only here because during property set
>       * KVM is not available yet
>       */
> -    if (!gic_version) {
> +    if (!vms->gic_version) {
>          if (!kvm_enabled()) {
>              error_report("gic-version=host requires KVM");
>              exit(1);
>          }
>  
> -        gic_version = kvm_arm_vgic_probe();
> -        if (!gic_version) {
> +        vms->gic_version = kvm_arm_vgic_probe();
> +        if (!vms->gic_version) {
>              error_report("Unable to determine GIC version supported by host");
>              exit(1);
>          }
> @@ -1300,7 +1299,7 @@ static void machvirt_init(MachineState *machine)
>      /* The maximum number of CPUs depends on the GIC version, or on how
>       * many redistributors we can fit into the memory map.
>       */
> -    if (gic_version == 3) {
> +    if (vms->gic_version == 3) {
>          virt_max_cpus = vms->memmap[VIRT_GIC_REDIST].size / 0x20000;
>          clustersz = GICV3_TARGETLIST_BITS;
>      } else {
> @@ -1417,7 +1416,7 @@ static void machvirt_init(MachineState *machine)
>  
>          object_property_set_bool(cpuobj, true, "realized", NULL);
>      }
> -    fdt_add_timer_nodes(vms, gic_version);
> +    fdt_add_timer_nodes(vms);
>      fdt_add_cpu_nodes(vms);
>      fdt_add_psci_node(vms);
>  
> @@ -1427,9 +1426,9 @@ static void machvirt_init(MachineState *machine)
>  
>      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>  
> -    create_gic(vms, pic, gic_version);
> +    create_gic(vms, pic);
>  
> -    fdt_add_pmu_nodes(vms, gic_version);
> +    fdt_add_pmu_nodes(vms);
>  
>      create_uart(vms, pic, VIRT_UART, sysmem, serial_hds[0]);
>  
> @@ -1458,7 +1457,7 @@ static void machvirt_init(MachineState *machine)
>      guest_info->memmap = vms->memmap;
>      guest_info->irqmap = vms->irqmap;
>      guest_info->use_highmem = vms->highmem;
> -    guest_info->gic_version = gic_version;
> +    guest_info->gic_version = vms->gic_version;
>      guest_info->no_its = vmc->no_its;
>      guest_info_state->machine_done.notify = virt_guest_info_machine_done;
>      qemu_add_machine_init_done_notifier(&guest_info_state->machine_done);

