Received: by 10.103.86.15 with SMTP id k15csp614302vsb;
        Thu, 15 Dec 2016 01:53:16 -0800 (PST)
X-Received: by 10.55.118.65 with SMTP id r62mr392648qkc.21.1481795596739;
        Thu, 15 Dec 2016 01:53:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a8si666442qtc.0.2016.12.15.01.53.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Dec 2016 01:53:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHSiw-0006Kv-6T
	for alex.bennee@linaro.org; Thu, 15 Dec 2016 04:53:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cHSir-0006BA-EQ
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 04:53:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cHSim-0000td-It
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 04:53:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48970)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cHSim-0000tH-A2; Thu, 15 Dec 2016 04:53:04 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40B77338860;
	Thu, 15 Dec 2016 09:53:03 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBF9r0YQ020251; Thu, 15 Dec 2016 04:53:01 -0500
Date: Thu, 15 Dec 2016 10:53:00 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20161215105300.08136939@nial.brq.redhat.com>
In-Reply-To: <20161213214522.25548-2-drjones@redhat.com>
References: <20161213214522.25548-1-drjones@redhat.com>
	<20161213214522.25548-2-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 15 Dec 2016 09:53:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 01/11] hw/arm/virt: parameter passing cleanups
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
X-TUID: LPf+8RSi5dvz

On Tue, 13 Dec 2016 22:45:12 +0100
Andrew Jones <drjones@redhat.com> wrote:

> Some simple cleanups made possible by "hw/arm/virt: Merge
> VirtBoardInfo and VirtMachineState"
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7eec50a82494..d451bc4f6b9b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -570,10 +570,10 @@ static void create_v2m(VirtMachineState *vms, qemu_irq *pic)
>      fdt_add_v2m_gic_node(vms);
>  }
>  
> -static void create_gic(VirtMachineState *vms, qemu_irq *pic, int type,
> -                       bool secure, bool no_its)
> +static void create_gic(VirtMachineState *vms, qemu_irq *pic, int type)
>  {
>      /* We create a standalone GIC */
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      DeviceState *gicdev;
>      SysBusDevice *gicbusdev;
>      const char *gictype;
> @@ -589,7 +589,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic, int type,
>       */
>      qdev_prop_set_uint32(gicdev, "num-irq", NUM_IRQS + 32);
>      if (!kvm_irqchip_in_kernel()) {
> -        qdev_prop_set_bit(gicdev, "has-security-extensions", secure);
> +        qdev_prop_set_bit(gicdev, "has-security-extensions", vms->secure);
>      }
>      qdev_init_nofail(gicdev);
>      gicbusdev = SYS_BUS_DEVICE(gicdev);
> @@ -643,7 +643,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic, int type,
>  
>      fdt_add_gic_node(vms, type);
>  
> -    if (type == 3 && !no_its) {
> +    if (type == 3 && !vmc->no_its) {
>          create_its(vms, gicdev);
>      } else if (type == 2) {
>          create_v2m(vms, pic);
> @@ -1005,8 +1005,7 @@ static void create_pcie_irq_map(const VirtMachineState *vms,
>                             0x7           /* PCI irq */);
>  }
>  
> -static void create_pcie(const VirtMachineState *vms, qemu_irq *pic,
> -                        bool use_highmem)
> +static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
>  {
>      hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
>      hwaddr size_mmio = vms->memmap[VIRT_PCIE_MMIO].size;
> @@ -1049,7 +1048,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic,
>                               mmio_reg, base_mmio, size_mmio);
>      memory_region_add_subregion(get_system_memory(), base_mmio, mmio_alias);
>  
> -    if (use_highmem) {
> +    if (vms->highmem) {
>          /* Map high MMIO space */
>          MemoryRegion *high_mmio_alias = g_new0(MemoryRegion, 1);
>  
> @@ -1098,7 +1097,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic,
>      qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
>                                   2, base_ecam, 2, size_ecam);
>  
> -    if (use_highmem) {
> +    if (vms->highmem) {
>          qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "ranges",
>                                       1, FDT_PCI_RANGE_IOPORT, 2, 0,
>                                       2, base_pio, 2, size_pio,
> @@ -1428,7 +1427,7 @@ static void machvirt_init(MachineState *machine)
>  
>      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>  
> -    create_gic(vms, pic, gic_version, vms->secure, vmc->no_its);
> +    create_gic(vms, pic, gic_version);
>  
>      fdt_add_pmu_nodes(vms, gic_version);
>  
> @@ -1441,7 +1440,7 @@ static void machvirt_init(MachineState *machine)
>  
>      create_rtc(vms, pic);
>  
> -    create_pcie(vms, pic, vms->highmem);
> +    create_pcie(vms, pic);
>  
>      create_gpio(vms, pic);
>  

