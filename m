Received: by 10.182.158.201 with SMTP id ww9csp2305732obb;
        Tue, 1 Dec 2015 05:22:26 -0800 (PST)
X-Received: by 10.140.85.102 with SMTP id m93mr62241396qgd.83.1448976146028;
        Tue, 01 Dec 2015 05:22:26 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b83si50060682qhc.118.2015.12.01.05.22.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Dec 2015 05:22:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52573 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a3ksz-0004Tg-NQ
	for alex.bennee@linaro.org; Tue, 01 Dec 2015 08:22:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a3ksb-00048m-Si
	for qemu-devel@nongnu.org; Tue, 01 Dec 2015 08:22:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a3ksa-0001ZG-Ly
	for qemu-devel@nongnu.org; Tue, 01 Dec 2015 08:22:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1a3ksR-0001WK-Ll; Tue, 01 Dec 2015 08:21:51 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 742B41136FA;
	Tue,  1 Dec 2015 13:21:50 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tB1DLlc4012838; Tue, 1 Dec 2015 08:21:48 -0500
Date: Tue, 1 Dec 2015 14:21:46 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: shannon.zhao@linaro.org
Message-ID: <20151201142146.2bcda69f@nial.brq.redhat.com>
In-Reply-To: <1447680189-2128-2-git-send-email-shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
	<1447680189-2128-2-git-send-email-shannon.zhao@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: wei@redhat.com, peter.maydell@linaro.org, graeme.gregory@linaro.org,
	mst@redhat.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Subject: Re: [Qemu-devel] [PATCH v3 1/8] hw/arm/virt: Add a GPIO controller
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9chCSqhw7ahW

On Mon, 16 Nov 2015 21:23:02 +0800
shannon.zhao@linaro.org wrote:

> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> ACPI 5.0 supports GPIO-signaled ACPI Events. This can be used for
> powerdown, hotplug evnets. Add a GPIO controller in machine virt,
s/evnets/events/

> to support powerdown, maybe can be used for cpu hotplug. And
> here we use pl061.
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> Reviewed-by: Wei Huang <wei@redhat.com>
> Tested-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt.c         | 30 ++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 31 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9c6792c..7977e3c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -120,6 +120,7 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_UART] =               { 0x09000000, 0x00001000 },
>      [VIRT_RTC] =                { 0x09010000, 0x00001000 },
>      [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
> +    [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -135,6 +136,7 @@ static const int a15irqmap[] = {
>      [VIRT_UART] = 1,
>      [VIRT_RTC] = 2,
>      [VIRT_PCIE] = 3, /* ... to 6 */
> +    [VIRT_GPIO] = 7,
>      [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
>      [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
>      [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
> @@ -538,6 +540,32 @@ static void create_rtc(const VirtBoardInfo *vbi, qemu_irq *pic)
>      g_free(nodename);
>  }
>  
> +static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
> +{
> +    char *nodename;
> +    hwaddr base = vbi->memmap[VIRT_GPIO].base;
> +    hwaddr size = vbi->memmap[VIRT_GPIO].size;
> +    int irq = vbi->irqmap[VIRT_GPIO];
> +    const char compat[] = "arm,pl061\0arm,primecell";
> +
> +    sysbus_create_simple("pl061", base, pic[irq]);
> +

vvvvv
> +    nodename = g_strdup_printf("/pl061@%" PRIx64, base);
> +    qemu_fdt_add_subnode(vbi->fdt, nodename);
> +    qemu_fdt_setprop_sized_cells(vbi->fdt, nodename, "reg",
> +                                 2, base, 2, size);
> +    qemu_fdt_setprop(vbi->fdt, nodename, "compatible", compat, sizeof(compat));
> +    qemu_fdt_setprop_cell(vbi->fdt, nodename, "#gpio-cells", 2);
> +    qemu_fdt_setprop(vbi->fdt, nodename, "gpio-controller", NULL, 0);
> +    qemu_fdt_setprop_cells(vbi->fdt, nodename, "interrupts",
> +                           GIC_FDT_IRQ_TYPE_SPI, irq,
> +                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> +    qemu_fdt_setprop_cell(vbi->fdt, nodename, "clocks", vbi->clock_phandle);
> +    qemu_fdt_setprop_string(vbi->fdt, nodename, "clock-names", "apb_pclk");
> +
> +    g_free(nodename);
could you split off DT parts into a separate patch pls.

> +}
> +
>  static void create_virtio_devices(const VirtBoardInfo *vbi, qemu_irq *pic)
>  {
>      int i;
> @@ -1041,6 +1069,8 @@ static void machvirt_init(MachineState *machine)
>  
>      create_pcie(vbi, pic, vms->highmem);
>  
> +    create_gpio(vbi, pic);
> +
>      /* Create mmio transports, so the user can create virtio backends
>       * (which will be automatically plugged in to the transports). If
>       * no backend is created the transport will just sit harmlessly idle.
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index f464586..925faa7 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -59,6 +59,7 @@ enum {
>      VIRT_PCIE_ECAM,
>      VIRT_PLATFORM_BUS,
>      VIRT_PCIE_MMIO_HIGH,
> +    VIRT_GPIO,
>  };
>  
>  typedef struct MemMapEntry {

