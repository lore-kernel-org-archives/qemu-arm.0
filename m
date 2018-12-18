Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3838891wrt;
        Tue, 18 Dec 2018 07:08:13 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WeehY4iCR8wda0C7puoX71toWUgQgOrfgkwv88E8OrDWn+F7oM/pMHLT6u3/p6VKv9NCC4
X-Received: by 2002:a0c:872a:: with SMTP id 39mr17434274qvh.1.1545145692984;
        Tue, 18 Dec 2018 07:08:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545145692; cv=none;
        d=google.com; s=arc-20160816;
        b=vpFaL8vFpcUJemMPtHEtvCLiyW6OGrGQjusgg8eszF0eDlHgJmInrCzJhLOwxZZSOl
         YknzN+iQeFeMUjyJwu0KIsKlblX1qNNhYso5ONEF6IAFsqX9cS77MWEQpnU0LcmbcWG5
         nohNG10VkI6ERM4JPcjkxiSBI1MVcsZ+bertCfNH8JjCJ2NCFx6oSqXJpUZiC4gbt6L/
         k84IcDprmtq5P3/WcU5vWTu7/XYOnUFfqiNo67xlowN1TcyH8JL8cimH+VnZy/n1YW5m
         7pQjpfRHjbxYVTdFo+N9oZ5yalrA2XdNtZ6FkaIs991giGpSDCD5bhAZzuF5GNSrFWgq
         OpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=jl+SAkjE/dT8/eHifV28RV1NVw4O4W/9YSrZPWHDQ5A=;
        b=sDjNlfWcsReK6U2L9eA7fZWfGPxq7+3hB3XbcCWgKcmX7oqF1cNcTEKFFC+u612V5f
         1zQA8CI3ECG6uuBjPBiNtZY9B2REBv0V/RB5lpTg/wqlCPPNQ/RDOemGPOIdfpKH+vjv
         lWS/9GLVsQSPdJWcTUGcYB+2iHw6rAaii7PlAuz/faFjbnPlI0DZw9Q14SIf0rLJyZvM
         fKJihcctiH7yq80BCAT5LdEHl6TaXQF5AgRFhn1CCnUND4jbd5cMNqMwMJ8PZblGSI73
         vH4inmzIiX9ivWMKqW+Sf8/v6SxCC6TLyEwP9bjU8jrd+cnZ5/ojBE5veKxldVRJ9+yo
         qvbg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o5si4011qta.399.2018.12.18.07.08.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Dec 2018 07:08:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54253 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gZGyi-0000W7-Di
	for alex.bennee@linaro.org; Tue, 18 Dec 2018 10:08:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gZGPS-0002qX-2K
	for qemu-arm@nongnu.org; Tue, 18 Dec 2018 09:31:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gZGPQ-0002Ux-Kw
	for qemu-arm@nongnu.org; Tue, 18 Dec 2018 09:31:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48410)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gZGPQ-0002UR-C8; Tue, 18 Dec 2018 09:31:44 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B18788E4A;
	Tue, 18 Dec 2018 14:31:43 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21021600C9;
	Tue, 18 Dec 2018 14:31:41 +0000 (UTC)
Date: Tue, 18 Dec 2018 15:31:39 +0100
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20181218143139.525cd76jeiblvgxg@kamzik.brq.redhat.com>
References: <20181206170733.7469-1-eric.auger@redhat.com>
	<20181206170733.7469-3-eric.auger@redhat.com>
	<20181217162701.nzdqhccpnhypj2z7@kamzik.brq.redhat.com>
	<f253b6f6-2d2c-1e75-75ee-0dd0072924d1@redhat.com>
	<20181217182546.zym4jhmambkzyigi@kamzik.brq.redhat.com>
	<efbeed1b-2941-dce1-f8e9-14c05733e01e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efbeed1b-2941-dce1-f8e9-14c05733e01e@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 18 Dec 2018 14:31:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.0 v2 2/2]
 hw/arm/virt-acpi-build: IORT Update for revision D
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uGB4RuDWHsMZ

On Tue, Dec 18, 2018 at 11:54:32AM +0100, Auger Eric wrote:
> Hi Drew,
> 
> On 12/17/18 7:25 PM, Andrew Jones wrote:
> > On Mon, Dec 17, 2018 at 05:49:02PM +0100, Auger Eric wrote:
> >> Hi Drew,
> >>
> >> On 12/17/18 5:27 PM, Andrew Jones wrote:
> >>> On Thu, Dec 06, 2018 at 06:07:33PM +0100, Eric Auger wrote:
> >>>> Let's update the structs according to revision D of the IORT
> >>>> specification and set the IORT node revision fields.
> >>>>
> >>>> In IORT smmuv3 node: the new proximity field is not used as
> >>>> the proximity domain valid flag is not set. The new DeviceId
> >>>> mapping index is not used either as all the SMMU control
> >>>> interrupts are GSIV based.
> >>>>
> >>>> In IORT RC node: the new memory address size limit field is
> >>>> set to 64 bits.
> >>>>
> >>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>>>
> >>>> ---
> >>>>
> >>>> v1 -> v2:
> >>>> - separate patches for SMMUv3 DMA coherency issue and struct
> >>>>   update to revision D.
> >>>> - revision fields set
> >>>> ---
> >>>>  hw/arm/virt-acpi-build.c    |  4 ++++
> >>>>  include/hw/acpi/acpi-defs.h | 10 +++++++++-
> >>>>  2 files changed, 13 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >>>> index aa177ba64d..a34a0958a5 100644
> >>>> --- a/hw/arm/virt-acpi-build.c
> >>>> +++ b/hw/arm/virt-acpi-build.c
> >>>> @@ -423,6 +423,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>>>       */
> >>>>      iort_node_offset = sizeof(*iort);
> >>>>      iort->node_offset = cpu_to_le32(iort_node_offset);
> >>>> +    iort->revision = 0;
> >>>>  
> >>>>      /* ITS group node */
> >>>>      node_size =  sizeof(*its) + sizeof(uint32_t);
> >>>> @@ -445,6 +446,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>>>  
> >>>>          smmu->type = ACPI_IORT_NODE_SMMU_V3;
> >>>>          smmu->length = cpu_to_le16(node_size);
> >>>> +        smmu->revision = cpu_to_le32(2);
> >>>>          smmu->mapping_count = cpu_to_le32(1);
> >>>>          smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
> >>>>          smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
> >>>> @@ -470,6 +472,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>>>  
> >>>>      rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
> >>>>      rc->length = cpu_to_le16(node_size);
> >>>> +    rc->revision = cpu_to_le32(1);
> >>>>      rc->mapping_count = cpu_to_le32(1);
> >>>>      rc->mapping_offset = cpu_to_le32(sizeof(*rc));
> >>>>  
> >>>> @@ -477,6 +480,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>>>      rc->memory_properties.cache_coherency = cpu_to_le32(1);
> >>>>      rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
> >>>>      rc->pci_segment_number = 0; /* MCFG pci_segment */
> >>>> +    rc->memory_address_limit = 64;
> >>>
> >>> Hmmm... IIUC this provides the size of the IOVA space. When it's 64 the
> >>> size of the space is U64_MAX, which gets added to the DMA base (also 64
> >>> bits) when calculating things like the last PFN. It seems strange to use
> >>> a value that will surely overflow those calculations. Is it common to
> >>> put 64 here? Can you elaborate on this?
> >>
> >> I looked at drivers/acpi/arm64/iort.c nc_dma_get_range.
> >> There you can find
> >>
> >>         *size = ncomp->memory_address_limit >= 64 ? U64_MAX :
> >>                         1ULL<<ncomp->memory_address_limit;
> >>
> >> So I was expecting the value "64" to be properly handled by the kernel.
> > 
> > I traced the code further and see that the size gets added to the u64
> > dma base without any special checks in both iort_dma_setup() and
> > iommu_dma_init_domain(). Also iommu_dma_init_domain() function has this
> > comment
> > 
> >  * @base and @size should be exact multiples of IOMMU page granularity to
> >  * avoid rounding surprises. If necessary, we reserve the page at address 0
> >  * to ensure it is an invalid IOVA. It is safe to reinitialise a domain, but
> >  * any change which could make prior IOVAs invalid will fail.
> > 
> > U64_MAX is not a multiple of any page size. Maybe that U64_MAX assignment
> > is a kernel bug?
> Yes most probably the kernel should check address wraps and alignment.
> Do you want to send a kernel patch yourself or shall I do?

I could write a patch, but I'm not equipped to test it. I'm also not that
familiar with it's purpose, or even with IOVA ranges in general...

FWIW, I'd probably leave the U64_MAX assignment as is, but then check the
addition everywhere it's used. E.g. in iommu_dma_init_domain() we could
replace all occurrences of 'base + size' with 'max_addr', where 'max_addr'
is defined as

  dma_addr_t max_addr;

  if (base != ALIGN(base, iommu_page_size)) {
     pr_warn("specified DMA base is not on a %d boundary\n", iommu_page_size);
     return -EINVAL;
  }

  max_addr = base + size;

  if (max_addr < base)
     max_addr = U64_MAX;

And I'd remove the '@size' from the 'should be exact multiples of IOMMU
page granularity' comment.

And at least iort_dma_setup() also needs an overflow check.

If you agree, then I can send that myself, otherwise feel free to send
what you think is best.

> > 
> > 
> >> If one decides to select something less than the whole range, which
> >> value would you suggest?
> > 
> > I don't know. Isn't it host/guest/device specific? Should we ask KVM what
> > the supported IPA is first? What kind of values are showing up in the
> > IORTs of real hardware?
> Digging into https://lkml.org/lkml/2017/7/31/472, the field is motivated
> for cases where the bus connecting devices to the IOMMU is smaller in
> size than the IOMMU input address bits. Architecturally the SMMU input
> address space is 64 bits. As the vSMMUv3 only implements stage 1, the
> input address is treated as a VA and when bypassed as intermediate
> physical address.
> 
> My understanding is the VAS (VA size) is max 2x52bits=53 bits for
> ARMv8.2. IPA is max 52 bits for 8.2.
> 
> But there are cases where the 64b upper byte is used (when TBI is set)
> in the translation. I still feel difficult to understand SMMU spec 3.4.1
> chapter (Input address size and Virtual Address size).
> 
> But anyway I think the kernel should support setting the value to 64bits.
> 
> The machines I have access to have Rev 0 IORT table so this field is not
> used :-(

I'll take your word for it :-)

Thanks,
drew
