Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4677284wre;
        Wed, 30 May 2018 05:22:10 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIZROgBOYFoqEmK6XahJqTJeAzif8r5ftJT0Juk+aBiEsXR5QV/9mM/zzKrKR8BsaTqBVB5
X-Received: by 2002:a0c:81e1:: with SMTP id 30-v6mr2148083qve.187.1527682930825;
        Wed, 30 May 2018 05:22:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527682930; cv=none;
        d=google.com; s=arc-20160816;
        b=J4Sev0zeD1mnJVdJqQ0r3O2Z/6Mcowl9IpQGBfAJEdz2Y3yszd2gdPQ+z6oBk3fME0
         QMwVSVHohtw3vPfXP6KaAC4a0HCQ2CtN9Y/B5E4yEq15C/BQgWlL1AS6SougFt0NObCr
         hnl1ePocpTlh4vd5iYkUd5rtry8QDVRQvDpTeIn4++Z49y/ufXLg4H6/iu5fsWd2OeXc
         Nu7Y5+9UxvVtGDoYDSpC50bnlXUWuFudg/ASV8Xz6o7L0amp7BkNyBOGlvhHTy8lvoMC
         lzC9HGikM/xyreDLU8yacaMLFbykPPQ3f2wh/yuPySVJVW8586OaYa69TwnKnerHPBIx
         UvAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=iVGERnF668larUYSJKxuGGvkRrtSD6wc7g5JlUiO4Yw=;
        b=HhJlPoYUZ2+gWHLW63VUslkj+C/fjwtUwnjjJNUM4My+mgbAd1xb/oz5qhegxFkpuq
         HmxQJpUqj6y9Pz4MQJthahuNVo4Qm0HPHVHIjUP8Whf0Vc+bqUY2Y7BC3qL2u7XtxVRp
         NIcJPUAg2GeoWdW8J1ktLGCSj758dUSNWDvCShmeEiqKlqusJHKIm2vpOjAqYofWwHXq
         0x8YGkJgQoSNeEC1zhrbb5vkCfNMwisAU6o3E7UB4DQPTtdvW9WOq90OwCPlnToRDqdh
         Fam1xfkJM8NeL9IypVei99yNLknBbAg5zu8HemNxiQypSitLQvgAI5Th4oOpiIxqx6IG
         pHjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v30-v6si1859771qtg.262.2018.05.30.05.22.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 05:22:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO07G-00057O-8u
	for alex.bennee@linaro.org; Wed, 30 May 2018 08:22:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fO070-00054y-G7
	for qemu-arm@nongnu.org; Wed, 30 May 2018 08:21:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fO06w-0004xc-3m
	for qemu-arm@nongnu.org; Wed, 30 May 2018 08:21:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39494 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fO06v-0004xS-So; Wed, 30 May 2018 08:21:50 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7763DBB405;
	Wed, 30 May 2018 12:21:49 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A54A6217B409;
	Wed, 30 May 2018 12:21:47 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <1527680741-2725-1-git-send-email-eric.auger@redhat.com>
	<1527680741-2725-6-git-send-email-eric.auger@redhat.com>
	<20180530141333.39c030ed@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5f697ff8-4bf1-0718-f970-70a5ec7afcc6@redhat.com>
Date: Wed, 30 May 2018 14:21:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180530141333.39c030ed@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 12:21:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 12:21:49 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 5/8] hw/arm/virt: GICv3 DT node
 with one or two redistributor regions
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, marc.zyngier@arm.com,
	qemu-devel@nongnu.org, christoffer.dall@arm.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HkN6eLDDidUO

Hi Igor,

On 05/30/2018 02:13 PM, Igor Mammedov wrote:
> On Wed, 30 May 2018 13:45:38 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> This patch allows the creation of a GICv3 node with 1 or 2
>> redistributor regions depending on the number of smu_cpus.
>> The second redistributor region is located just after the
>> existing RAM region, at 256GB and contains up to up to 512 vcpus.
>>
>> Please refer to kernel documentation for further node details:
>> Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v2 -> v3:
>> - VIRT_GIC_REDIST2 is now 64MB large, ie. 512 redistributor capacity
>> - virt_gicv3_redist_region_count does not test kvm_irqchip_in_kernel
>>   anymore
>> ---
>>  hw/arm/virt.c         | 29 ++++++++++++++++++++++++-----
>>  include/hw/arm/virt.h | 14 ++++++++++++++
>>  2 files changed, 38 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index ed79460..3018ec2 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -149,6 +149,8 @@ static const MemMapEntry a15memmap[] = {
>>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
>>      [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
>> +    /* Additional 64 MB redist region (can contain up to 512 redistributors) */
>> +    [VIRT_GIC_REDIST2] =        { 0x4000000000ULL, 0x4000000ULL },
> could it be placed after VIRT_PCIE_MMIO_HIGH,
> so we would have some space here to increase RAM without
> creating the second RAM region upto 512GB boundary?

Personally I don't have any objection but see my reply to Shannon's
similar query in
http://lists.gnu.org/archive/html/qemu-arm/2018-03/msg00465.html

* If we need to provide more RAM to VMs in the future then we need to:
 *  * allocate a second bank of RAM starting at 2TB and working up
 *  * fix the DT and ACPI table generation code in QEMU to correctly
 *    report two split lumps of RAM to the guest
 *  * fix KVM in the host kernel to allow guests with >40 bit address spaces
 * (We don't want to fill all the way up to 512GB with RAM because
 * we might want it for non-RAM purposes later.

Thanks

Eric


> 
>>      /* Second PCIe window, 512GB wide at the 512GB boundary */
>>      [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
>>  };
>> @@ -402,13 +404,30 @@ static void fdt_add_gic_node(VirtMachineState *vms)
>>      qemu_fdt_setprop_cell(vms->fdt, "/intc", "#size-cells", 0x2);
>>      qemu_fdt_setprop(vms->fdt, "/intc", "ranges", NULL, 0);
>>      if (vms->gic_version == 3) {
>> +        int nb_redist_regions = virt_gicv3_redist_region_count(vms);
>> +
>>          qemu_fdt_setprop_string(vms->fdt, "/intc", "compatible",
>>                                  "arm,gic-v3");
>> -        qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
>> -                                     2, vms->memmap[VIRT_GIC_DIST].base,
>> -                                     2, vms->memmap[VIRT_GIC_DIST].size,
>> -                                     2, vms->memmap[VIRT_GIC_REDIST].base,
>> -                                     2, vms->memmap[VIRT_GIC_REDIST].size);
>> +
>> +        qemu_fdt_setprop_cell(vms->fdt, "/intc",
>> +                              "#redistributor-regions", nb_redist_regions);
>> +
>> +        if (nb_redist_regions == 1) {
>> +            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
>> +                                         2, vms->memmap[VIRT_GIC_DIST].base,
>> +                                         2, vms->memmap[VIRT_GIC_DIST].size,
>> +                                         2, vms->memmap[VIRT_GIC_REDIST].base,
>> +                                         2, vms->memmap[VIRT_GIC_REDIST].size);
>> +        } else {
>> +            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
>> +                                         2, vms->memmap[VIRT_GIC_DIST].base,
>> +                                         2, vms->memmap[VIRT_GIC_DIST].size,
>> +                                         2, vms->memmap[VIRT_GIC_REDIST].base,
>> +                                         2, vms->memmap[VIRT_GIC_REDIST].size,
>> +                                         2, vms->memmap[VIRT_GIC_REDIST2].base,
>> +                                         2, vms->memmap[VIRT_GIC_REDIST2].size);
>> +        }
>> +
>>          if (vms->virt) {
>>              qemu_fdt_setprop_cells(vms->fdt, "/intc", "interrupts",
>>                                     GIC_FDT_IRQ_TYPE_PPI, ARCH_GICV3_MAINT_IRQ,
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 4ac7ef6..308156f 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -35,6 +35,8 @@
>>  #include "qemu/notify.h"
>>  #include "hw/boards.h"
>>  #include "hw/arm/arm.h"
>> +#include "sysemu/kvm.h"
>> +#include "hw/intc/arm_gicv3_common.h"
>>  
>>  #define NUM_GICV2M_SPIS       64
>>  #define NUM_VIRTIO_TRANSPORTS 32
>> @@ -60,6 +62,7 @@ enum {
>>      VIRT_GIC_V2M,
>>      VIRT_GIC_ITS,
>>      VIRT_GIC_REDIST,
>> +    VIRT_GIC_REDIST2,
>>      VIRT_SMMU,
>>      VIRT_UART,
>>      VIRT_MMIO,
>> @@ -130,4 +133,15 @@ typedef struct {
>>  
>>  void virt_acpi_setup(VirtMachineState *vms);
>>  
>> +/* Return the number of used redistributor regions  */
>> +static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
>> +{
>> +    uint32_t redist0_capacity =
>> +                vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
>> +
>> +    assert(vms->gic_version == 3);
>> +
>> +    return vms->smp_cpus > redist0_capacity ? 2 : 1;
>> +}
>> +
>>  #endif /* QEMU_ARM_VIRT_H */
> 
