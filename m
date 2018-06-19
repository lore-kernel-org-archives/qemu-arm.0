Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5493128wrq;
        Tue, 19 Jun 2018 12:03:07 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLyEGExUN9INGKV7SWD550Lag3RihA/V+HnI12D54Y2KemlKGDBSA93KSdu8s2BeXiKHHRL
X-Received: by 2002:ac8:3159:: with SMTP id h25-v6mr15768995qtb.162.1529434987084;
        Tue, 19 Jun 2018 12:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529434987; cv=none;
        d=google.com; s=arc-20160816;
        b=bZMpRMDe2uIs6R80IOI0YxDF80AQj/KahwWWC7VKHt5nHSVy30Jr07FifQ2dlJg9mE
         A7v/MS5eL6zWttyVmjxv6vN70sNCvfRrTEonTviJII9h0vNovLrLLIr58PmS/XonaoZd
         p3bysi5hJck+ZpVVvIGEwlHs/YZUTNEu6wxSow26HI06uRdxuG+xEtizVN8g6ihAiCVr
         wTFKaVAitf9bl/kGtNBq43o0kqX0kI54ORUXCME8BMCr9s0ZIQH+bu1cyJ3k4Gv7XTwK
         5Gjpytkbdg/Xp1FE88FWNRj6KC8r/BoR/zQ8GA9arMDKaMAR6OwCYg99aGJm6rOAxQHj
         0FfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Ac+Ef9pFgNzQMJcGalO9y8lZZqAgpeDVaYi5iW0cAdo=;
        b=K0Kg61s3WVjYBh+IB8zTmG2RpVwJRz5uC3j9AqpdQhZn+nPv/BUu26uF6INtG5hgzi
         77kY1bZb2HJQZ7C7Q1jz8n8mLMcUgbJzV7TrYRaS+SzEMqx/Tv0wzluUA/FLMAMoosvT
         vOcWtPTqPPUI2HF8eJ9a4+SSBsyT0cIT5656C2+hh/020RcbsWvRJyuMdHhwAu3/ALvB
         ujymp5lciBzwX1/A6m318WqtU8cy/JoL6NXmcCko5p2UviaWRDB84/timWXzZR3Qf0dD
         DCCKBBUd4igyHOfQsbx5E3lrM5GyhhHOX2iQ4arEJEuZS/sEcm+wPLfSqEmV/I5KeFEQ
         7Tlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HHBR2JVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w13-v6si399262qvi.32.2018.06.19.12.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jun 2018 12:03:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HHBR2JVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44523 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVLuE-0008FM-Im
	for alex.bennee@linaro.org; Tue, 19 Jun 2018 15:03:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1fVLti-00081U-Hu
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 15:02:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1fVLth-0002xd-0v
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 15:02:34 -0400
Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244]:45876)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1fVLtg-0002wh-RF
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 15:02:32 -0400
Received: by mail-io0-x244.google.com with SMTP id l25-v6so1183731ioh.12
	for <qemu-arm@nongnu.org>; Tue, 19 Jun 2018 12:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ac+Ef9pFgNzQMJcGalO9y8lZZqAgpeDVaYi5iW0cAdo=;
	b=HHBR2JVJpJae1ws1J0AYjMJuvEvjKV79O/R8yW1/cZvZ0VvDok7AC0pfTj6z+KR8mF
	d4ktAm4WZOHdAQTKY+flVexEQ0s5WTAPDMgb+rOZvAuwa1L8bWy42dFaTrLcEyI7DCg8
	E7pWCOZGUC0iJyJY3QpoKPb5oGSsHiOuV3jbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ac+Ef9pFgNzQMJcGalO9y8lZZqAgpeDVaYi5iW0cAdo=;
	b=HmC7vn/a0RkiHLKbhVFfvMqfa9gAQ3pT8Cfh1jVGqxODe0NEIUxhwXTJyTfqz4i0DD
	qAL/tl0UiVly1spCEGr2ECTuYrIkUIgfMO4tK7/FivH89Mp7hseUGC7UbctDBeMSpN5N
	xC9TPCZ1M/Xw1wiRFWMrZRLRYbudUI0v+CsftTyqasxGMXcc/2UbVan/08JZz0NBjsle
	15O/c6eDsd8oF8VspTin3cG7gDDEIce1cbtEaORUEtSSBtOY0daGLdg0t/WL65FThXOW
	Y+kv5MwqYq/h4fglyI6c09FrzKR1LUGAv05ptAjiQWL8LqkRmoMvsT8QdUoF74oLWkhU
	1W4Q==
X-Gm-Message-State: APt69E1HeyQwsqvuP1AAtm5myYOhWHQ365YvFpKuVNEd8g0NmiGnwyhS
	uhDMy10WH/w3V5pR/GXZw+U+IPmWRRKsY3EqCnWzMw==
X-Received: by 2002:a6b:6709:: with SMTP id
	b9-v6mr14141200ioc.170.1529434951877; 
	Tue, 19 Jun 2018 12:02:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:bbc7:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 12:02:31
	-0700 (PDT)
In-Reply-To: <a4204e03-735d-28b9-7cc5-d51fd727b91f@redhat.com>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
	<1529072910-16156-6-git-send-email-eric.auger@redhat.com>
	<a4204e03-735d-28b9-7cc5-d51fd727b91f@redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 19 Jun 2018 21:02:31 +0200
Message-ID: <CAKv+Gu9wYtzo86-hqVDX=79cKix_BfVGCh5Wn08ApRZ5Km_Vjg@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 05/11] hw/arm/virt: GICv3 DT
 node with one or two redistributor regions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Marc Zyngier <marc.zyngier@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aeRX1hqYLEeT

On 19 June 2018 at 20:53, Laszlo Ersek <lersek@redhat.com> wrote:
> Hi Eric,
>
> sorry about the late followup. I have one question (mainly for Ard):
>
> On 06/15/18 16:28, Eric Auger wrote:
>> This patch allows the creation of a GICv3 node with 1 or 2
>> redistributor regions depending on the number of smu_cpus.
>> The second redistributor region is located just after the
>> existing RAM region, at 256GB and contains up to up to 512 vcpus.
>>
>> Please refer to kernel documentation for further node details:
>> Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>
>> ---
>> v1 (virt3.0) -> v2
>> - Added Drew's R-b
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
>> index 2885d18..d9f72eb 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -148,6 +148,8 @@ static const MemMapEntry a15memmap[] = {
>>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
>>      [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
>> +    /* Additional 64 MB redist region (can contain up to 512 redistributors) */
>> +    [VIRT_GIC_REDIST2] =        { 0x4000000000ULL, 0x4000000 },
>>      /* Second PCIe window, 512GB wide at the 512GB boundary */
>>      [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
>>  };
>> @@ -401,13 +403,30 @@ static void fdt_add_gic_node(VirtMachineState *vms)
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
>
> In edk2, we have the following code in
> "ArmVirtPkg/Library/ArmVirtGicArchLib/ArmVirtGicArchLib.c":
>
>   switch (GicRevision) {
>
>   case 3:
>     //
>     // The GIC v3 DT binding describes a series of at least 3 physical (base
>     // addresses, size) pairs: the distributor interface (GICD), at least one
>     // redistributor region (GICR) containing dedicated redistributor
>     // interfaces for all individual CPUs, and the CPU interface (GICC).
>     // Under virtualization, we assume that the first redistributor region
>     // listed covers the boot CPU. Also, our GICv3 driver only supports the
>     // system register CPU interface, so we can safely ignore the MMIO version
>     // which is listed after the sequence of redistributor interfaces.
>     // This means we are only interested in the first two memory regions
>     // supplied, and ignore everything else.
>     //
>     ASSERT (RegSize >= 32);
>
>     // RegProp[0..1] == { GICD base, GICD size }
>     DistBase = SwapBytes64 (Reg[0]);
>     ASSERT (DistBase < MAX_UINTN);
>
>     // RegProp[2..3] == { GICR base, GICR size }
>     RedistBase = SwapBytes64 (Reg[2]);
>     ASSERT (RedistBase < MAX_UINTN);
>
>     PcdStatus = PcdSet64S (PcdGicDistributorBase, DistBase);
>     ASSERT_RETURN_ERROR (PcdStatus);
>     PcdStatus = PcdSet64S (PcdGicRedistributorsBase, RedistBase);
>     ASSERT_RETURN_ERROR (PcdStatus);
>
>     DEBUG ((EFI_D_INFO, "Found GIC v3 (re)distributor @ 0x%Lx (0x%Lx)\n",
>       DistBase, RedistBase));
>
> (I vaguely recall that I may have quoted this already, but I'm not
> sure.)
>
> My understanding is that this will continue working -- as long as we
> don't want to boot up multiple CPUs in UEFI, anyway.
>
> I think we have no plans for adding (well, for implementing)
> EFI_PEI_MP_SERVICES_PPI or EFI_MP_SERVICES_PROTOCOL for ARM -- do you
> agree, Ard?
>

Yes I agree. Only the boot cpu should enter UEFI, and although there
are some remnants of multi core ARM stuff in the EDK2 tree, I would
prefer to get rid of that as soon as we can.

> (That PPI and PROTOCOL are totally unnecessary unless it is
> architecturally required to configure various CPU features on each
> (V)CPU *individually*, before leaving the firmware. Unfortunately, x86
> has some CPU warts like that, and said PPI and PROTOCOL implementations
> for x86 have given us a good dose of grief over time. I very much hope
> the PPI and the PROTOCOL will never be needed on ARM!)
>

That kind of configuration typically occurs in the secure firmware on
an ARM system, and not at all on a virtual machine.

>
> Eric, I reckon you tested this patch with the ArmVirtQemu firmware too,
> covering both branches of the code, and with multiple VCPUs in both
> cases. Can you please confirm?
>
> Thanks
> Laszlo
