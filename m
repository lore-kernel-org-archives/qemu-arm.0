Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp444996wrt;
        Thu, 22 Nov 2018 01:27:40 -0800 (PST)
X-Google-Smtp-Source: AJdET5edXeIg29OGeNYerbmCLQmaFwl0BKq1bnbBpoS9gNt+vKqUxJt1fNPNnyz0iYKOkX3doj8e
X-Received: by 2002:a0d:c887:: with SMTP id k129-v6mr10454446ywd.485.1542878859942;
        Thu, 22 Nov 2018 01:27:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542878859; cv=none;
        d=google.com; s=arc-20160816;
        b=U1akOHSJdQSpWkOjI+bI8QLP2R7UIr13EdGCZlX0JqgTm6hmDl2SpAXM7UmhAmXaGZ
         5Hg5OmB5YvfTYAqtvYBcYlPGxjPWH/MOUmwwDblityqvsVtj6ls6MUmdtJlND9iCF88U
         TBEvwTfjRs8wnk2W9ZqA3MqDF4nDV0E9kVuIcjZW1tO/7J5jaq13yhFTpFRh3IzhxWOr
         dJtJ9mhux7V1P9upyOU9ffOr3SFQIiE5Q6I9RF/IckydKw7g+tEnWuAxoY6ynORgTD24
         41TZQvRKnv6ybPlo6PL0wTJPu7LZ0KoFe8oElp4gTbusgaD8zlIbayedatGY2WcBJVkM
         bizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=I9bWtsxFqTGT0KamdojSiWgUhkfwmCsWXoxMmHdRnto=;
        b=BqfxdxMxV8NuCg1pUWzB0xcIunbSRZ6SR5rnHM2PQsHjBBjgcGvsqtxkM2evJdCudG
         BEkJg7/QgKFpzm/59+Hh5AZ3ZnPCuovLIAVaxfKrvzvDTlH3TYHMWnKrgVVi8z7AXdlA
         34PncnNYvoUpghhBfGFDQJddTFyZYCt6HQ5t2pZoRWawBL4cbmdWI+gLqZDOanU0BKx1
         FsfI6b1jrhDLxrSoRxU1Hqza+Uay2+QC8Wgw/cc9E3M56ucHX5EiQ/zDI71F3SVxXIFy
         jU+tlWbZCdQ2Vlwu+CNhRMmStVZAfbrbm1j1ZDFCtnir3c+boRTjYO5qIQRaAx3n8mWJ
         Ed4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b82si11484541ywc.407.2018.11.22.01.27.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 01:27:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPlGt-00044C-DX
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 04:27:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPlGh-000443-1g
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 04:27:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPlEi-0007FY-Rw
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 04:25:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59596)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gPlEi-0007Av-Bh; Thu, 22 Nov 2018 04:25:24 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76550C065F7A;
	Thu, 22 Nov 2018 09:25:20 +0000 (UTC)
Received: from [10.36.116.235] (ovpn-116-235.ams2.redhat.com [10.36.116.235])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8F666EE31;
	Thu, 22 Nov 2018 09:25:13 +0000 (UTC)
To: Bharat Bhushan <bharat.bhushan@nxp.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"mst@redhat.com" <mst@redhat.com>,
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
	<20181109112957.10067-16-eric.auger@redhat.com>
	<VI1PR04MB484558FC4BF5E01E9EB35E8F9ADB0@VI1PR04MB4845.eurprd04.prod.outlook.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3996db72-00a5-600c-a1d3-1415b2b55ebd@redhat.com>
Date: Thu, 22 Nov 2018 10:25:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB484558FC4BF5E01E9EB35E8F9ADB0@VI1PR04MB4845.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 22 Nov 2018 09:25:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v8 15/18] hw/arm/virt: Add virtio-iommu to the
 virt board
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
Cc: "tn@semihalf.com" <tn@semihalf.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"peterx@redhat.com" <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FkwHwLtVZXUK

Hi Bharat,

On 11/22/18 10:15 AM, Bharat Bhushan wrote:
> Hi Eric,
> 
> 
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Friday, November 9, 2018 5:00 PM
>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
>> devel@nongnu.org; qemu-arm@nongnu.org; peter.maydell@linaro.org;
>> mst@redhat.com; jean-philippe.brucker@arm.com
>> Cc: kevin.tian@intel.com; tn@semihalf.com; Bharat Bhushan
>> <bharat.bhushan@nxp.com>; peterx@redhat.com
>> Subject: [RFC v8 15/18] hw/arm/virt: Add virtio-iommu to the virt board
>>
>> Both the virtio-iommu device and its dedicated mmio transport get
>> instantiated when requested.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v6 -> v7:
>> - align to the smmu instantiation code
>>
>> v4 -> v5:
>> - VirtMachineClass no_iommu added in this patch
>> - Use object_resolve_path_type
>> ---
>>  hw/arm/virt.c | 48
>> +++++++++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 45 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c index a2b8d8f7c2..f2994c4359
>> 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -29,6 +29,7 @@
>>   */
>>
>>  #include "qemu/osdep.h"
>> +#include "monitor/qdev.h"
>>  #include "qapi/error.h"
>>  #include "hw/sysbus.h"
>>  #include "hw/arm/arm.h"
>> @@ -49,6 +50,7 @@
>>  #include "qemu/bitops.h"
>>  #include "qemu/error-report.h"
>>  #include "hw/pci-host/gpex.h"
>> +#include "hw/virtio/virtio-pci.h"
>>  #include "hw/arm/sysbus-fdt.h"
>>  #include "hw/platform-bus.h"
>>  #include "hw/arm/fdt.h"
>> @@ -59,6 +61,7 @@
>>  #include "qapi/visitor.h"
>>  #include "standard-headers/linux/input.h"
>>  #include "hw/arm/smmuv3.h"
>> +#include "hw/virtio/virtio-iommu.h"
>>
>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \ @@ -
>> 1085,6 +1088,33 @@ static void create_smmu(const VirtMachineState *vms,
>> qemu_irq *pic,
>>      g_free(node);
>>  }
>>
>> +static void create_virtio_iommu(VirtMachineState *vms,
>> +                                const char *pciehb_nodename, PCIBus
>> +*bus) {
>> +    const char compat[] = "virtio,pci-iommu";
>> +    uint16_t bdf = 0x8; /* 00:01.0 */
> 
> Why we hardcoded "bdf = 8" ?
> When adding the VFIO support I see virtio-iommu PCI device have bdf = x010.

This hardcoding has been removed. I will send a new version today.

Thanks

Eric
> 
> Thanks
> -Bharat
> 
>> +    DeviceState *dev;
>> +    char *node;
>> +
>> +    dev = qdev_create(BUS(bus), TYPE_VIRTIO_IOMMU_PCI);
>> +    object_property_set_bool(OBJECT(dev), true, "realized",
>> + &error_fatal);
>> +
>> +    node = g_strdup_printf("%s/virtio_iommu@%d", pciehb_nodename,
>> bdf);
>> +    qemu_fdt_add_subnode(vms->fdt, node);
>> +    qemu_fdt_setprop(vms->fdt, node, "compatible", compat,
>> sizeof(compat));
>> +    qemu_fdt_setprop_sized_cells(vms->fdt, node, "reg",
>> +                                 1, bdf << 8 /* phys.hi */,
>> +                                 1, 0        /* phys.mid */,
>> +                                 1, 0        /* phys.lo  */,
>> +                                 1, 0        /* size.hi  */,
>> +                                 1, 0        /* size.low */);
>> +
>> +    qemu_fdt_setprop_cell(vms->fdt, node, "#iommu-cells", 1);
>> +    qemu_fdt_setprop_cell(vms->fdt, node, "phandle", vms-
>>> iommu_phandle);
>> +    g_free(node);
>> +}
>> +
>> +
>>  static void create_pcie(VirtMachineState *vms, qemu_irq *pic)  {
>>      hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base; @@ -
>> 1205,10 +1235,22 @@ static void create_pcie(VirtMachineState *vms,
>> qemu_irq *pic)
>>      if (vms->iommu) {
>>          vms->iommu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
>>
>> -        create_smmu(vms, pic, pci->bus);
>> +        switch (vms->iommu) {
>> +        case VIRT_IOMMU_SMMUV3:
>> +            create_smmu(vms, pic, pci->bus);
>> +            qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
>> +                                   0x0, vms->iommu_phandle, 0x0, 0x10000);
>> +            break;
>> +        case VIRT_IOMMU_VIRTIO:
>> +            create_virtio_iommu(vms, nodename, pci->bus);
>> +            qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
>> +                                   0x0, vms->iommu_phandle, 0x0, 0x8,
>> +                                   0x9, vms->iommu_phandle, 0x9, 0xfff7);
>> +            break;
>> +        default:
>> +            g_assert_not_reached();
>> +        }
>>
>> -        qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
>> -                               0x0, vms->iommu_phandle, 0x0, 0x10000);
>>      }
>>
>>      g_free(nodename);
>> --
>> 2.17.2
> 
