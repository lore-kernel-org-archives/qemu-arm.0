Received: by 10.28.91.67 with SMTP id p64csp866124wmb;
        Mon, 12 Mar 2018 08:02:36 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtk2BxcXKFLNfSk1VTC6fAICI6tJeVTmWbCRepwoROiLz2439XFSKqHbMutNyeMtvcycrv+
X-Received: by 10.13.232.150 with SMTP id r144mr3980868ywe.489.1520866956187;
        Mon, 12 Mar 2018 08:02:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520866956; cv=none;
        d=google.com; s=arc-20160816;
        b=HMiVCPuE6st4uXIQq6b0T2QjBdT3567VqhbfxzgncPgM/bYzy4zG8w+RJkQ0vRant+
         VGEkaLD2x/GRnC8wsPvP98rWA34YgheNaiLRFgvlbLF6qhChu+4RGVeS/Ztd+m4w5td/
         Emub+OPTTASseO8tRLJ8ulPEuNemouVJOUn6hYDssHTS481XvCKUckdREdIU6IpGxq2Y
         woN+8jg52s9Hf56V65ksPqUx8tjEr64ZNkNE4PZHTOQYRGgLXHdYfod84g4zAHmqnLcV
         22cAh/oX3Kw9ky9Oc035kubsuMy1EJ54N52XpmdZleL9IHY9ZuhqiyFulIehNKUzTa9U
         ixfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=ZNZqX9F50r7akKGu7RWoU/8B8vGol93v3R85fVheORA=;
        b=d1+Ja/LGEDLN1TawDUWhhfx6gRcQE1kEBMjgTQZaSM8dqgUYXAmK1fw4wk/4TDkN0h
         v+8c85pRESNebSfKcHOa+CH1wBlLrAC8Q87qS8egp2ushNNyWJXO+NKhkPg3IyYC3asi
         Ceh28FXwCN4TCbvtLRBAKJylA2cmzG0FdhkhQd005LsNpvI2SozS4WkWSXFVu4MpcokG
         LW6zWSvUSelKthoAXtKwq5/oxU8QuXWYrr9RVIbOKzTi5AqqT8lDYnnTJW5DdEcekXGT
         VOFt1U7hB2QE2W8uhtOdrQ6LZEZ9qIQEX9gQKiT4P/Yj8YwgKiGbEj2CjtJM/UBTfUVc
         fbrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k206-v6si865785ybk.564.2018.03.12.08.02.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 08:02:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59371 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evOy9-0004Mg-Qa
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 11:02:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1evOxP-0003ta-57
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 11:01:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1evOxJ-0001nj-6X
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 11:01:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42954 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1evOxJ-0001mu-1U; Mon, 12 Mar 2018 11:01:41 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDA0E4000B6E;
	Mon, 12 Mar 2018 15:01:39 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23A3E2166BAE;
	Mon, 12 Mar 2018 15:01:36 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-13-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-BZ=wcpEKVQnX0dBh7tZVPNfHRm1E39DYEMZ=UStEamA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f22e252d-463e-78ed-f405-6164b0c8d566@redhat.com>
Date: Mon, 12 Mar 2018 16:01:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-BZ=wcpEKVQnX0dBh7tZVPNfHRm1E39DYEMZ=UStEamA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 12 Mar 2018 15:01:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 12 Mar 2018 15:01:40 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 12/14] hw/arm/virt: Add
 SMMUv3 to the virt board
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Prem Mallappa <prem.mallappa@gmail.com>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OaP7yLMy5HqF

Hi Peter,

On 12/03/18 13:46, Peter Maydell wrote:
> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>> From: Prem Mallappa <prem.mallappa@broadcom.com>
>>
>> Add code to instantiate an smmuv3 in virt machine. A new iommu
>> integer member is introduced in VirtMachineState to store the type
>> of the iommu in use.
>>
>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v7 -> v8:
>> - integer iommu member
>> - add primary-bus property
>>
>> v4 -> v5:
>> - add dma-coherent property
>>
>> v2 -> v3:
>> - vbi was removed. Use vms instead
>> - migrate to new smmu binding format (iommu-map)
>> - don't use appendprop anymore
>> - add vms->smmu and guard instantiation with this latter
>> - interrupts type changed to edge
>>
>> Conflicts:
>>         hw/arm/smmuv3.c
>> ---
>>  hw/arm/virt.c         | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++-
>>  include/hw/arm/virt.h | 10 ++++++++
>>  2 files changed, 73 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index dbb3c80..e9dca0d 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -58,6 +58,7 @@
>>  #include "hw/smbios/smbios.h"
>>  #include "qapi/visitor.h"
>>  #include "standard-headers/linux/input.h"
>> +#include "hw/arm/smmuv3.h"
>>
>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>> @@ -141,6 +142,7 @@ static const MemMapEntry a15memmap[] = {
>>      [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
>>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>> +    [VIRT_SMMU] =               { 0x09050000, 0x00020000 }, /* 128K, needed */
> 
> What does the "needed" comment mean here?
removed
> 
>>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
>> @@ -161,6 +163,7 @@ static const int a15irqmap[] = {
>>      [VIRT_SECURE_UART] = 8,
>>      [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
>>      [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
>> +    [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
>>      [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
>>  };
>>
>> @@ -941,7 +944,57 @@ static void create_pcie_irq_map(const VirtMachineState *vms,
>>                             0x7           /* PCI irq */);
>>  }
>>
>> -static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
>> +static void create_smmu(const VirtMachineState *vms, qemu_irq *pic,
>> +                        PCIBus *bus)
> 
> Side suggestion: if you add "algorithm = histogram" to the [diff] section
> of your .gitconfig, you will probably find that it doesn't generate patches
> with this sort of silly patch hunk any more. I only discovered this
> config setting recently but I think it's better than the default.
ah OK thanks for the advice.
> 
>> +{
>> +    char *node;
>> +    const char compat[] = "arm,smmu-v3";
>> +    int irq =  vms->irqmap[VIRT_SMMU];
>> +    int i;
>> +    hwaddr base = vms->memmap[VIRT_SMMU].base;
>> +    hwaddr size = vms->memmap[VIRT_SMMU].size;
>> +    const char irq_names[] = "eventq\0priq\0cmdq-sync\0gerror";
>> +    DeviceState *dev;
>> +
>> +    if (vms->iommu != VIRT_IOMMU_SMMUV3 || !vms->iommu_phandle) {
>> +        return;
>> +    }
>> +
>> +    dev = qdev_create(NULL, "arm-smmuv3");
>> +
>> +    object_property_set_link(OBJECT(dev), OBJECT(bus), "primary-bus",
>> +                             &error_abort);
>> +    qdev_init_nofail(dev);
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>> +    for (i = 0; i < NUM_SMMU_IRQS; i++) {
>> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
>> +    }
>> +
>> +    node = g_strdup_printf("/smmuv3@%" PRIx64, base);
>> +    qemu_fdt_add_subnode(vms->fdt, node);
>> +    qemu_fdt_setprop(vms->fdt, node, "compatible", compat, sizeof(compat));
>> +    qemu_fdt_setprop_sized_cells(vms->fdt, node, "reg", 2, base, 2, size);
>> +
>> +    qemu_fdt_setprop_cells(vms->fdt, node, "interrupts",
>> +            GIC_FDT_IRQ_TYPE_SPI, irq    , GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
>> +            GIC_FDT_IRQ_TYPE_SPI, irq + 1, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
>> +            GIC_FDT_IRQ_TYPE_SPI, irq + 2, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
>> +            GIC_FDT_IRQ_TYPE_SPI, irq + 3, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
>> +
>> +    qemu_fdt_setprop(vms->fdt, node, "interrupt-names", irq_names,
>> +                     sizeof(irq_names));
>> +
>> +    qemu_fdt_setprop_cell(vms->fdt, node, "clocks", vms->clock_phandle);
>> +    qemu_fdt_setprop_string(vms->fdt, node, "clock-names", "apb_pclk");
>> +    qemu_fdt_setprop(vms->fdt, node, "dma-coherent", NULL, 0);
> 
> Is this definitely the right setting for dma-coherent? My (possibly
> naive) thought is that for an emulated SMMU our page-table walks are
> going to be coherent with the CPU's view.

Indeed we add the dma-capable property to make the DMA ops of the SMMU
cache coherent with the CPU. We pass NULL/O since there is just
dma-coherent in the dt property. What am I missing?
> 
>> +
>> +    qemu_fdt_setprop_cell(vms->fdt, node, "#iommu-cells", 1);
>> +
>> +    qemu_fdt_setprop_cell(vms->fdt, node, "phandle", vms->iommu_phandle);
>> +    g_free(node);
>> +}
> 
>> +enum {
>> +    VIRT_IOMMU_NONE,
>> +    VIRT_IOMMU_SMMUV3,
>> +    VIRT_IOMMU_VIRTIO,
>> +};
>> +
>>  typedef struct MemMapEntry {
>>      hwaddr base;
>>      hwaddr size;
>> @@ -96,6 +104,7 @@ typedef struct {
>>      bool its;
>>      bool virt;
>>      int32_t gic_version;
>> +    int32_t iommu;
> 
> This is always one of the VIRT_IOMMU_* values, right?
> I think we should give that enum a typedef name and then
> use the type here.
yes, done.
> 
>>      struct arm_boot_info bootinfo;
>>      const MemMapEntry *memmap;
>>      const int *irqmap;
>> @@ -105,6 +114,7 @@ typedef struct {
>>      uint32_t clock_phandle;
>>      uint32_t gic_phandle;
>>      uint32_t msi_phandle;
>> +    uint32_t iommu_phandle;
>>      int psci_conduit;
>>  } VirtMachineState;
>>
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Thanks!

Eric
> 
> thanks
> -- PMM
> 
