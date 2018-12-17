Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2813747wrt;
        Mon, 17 Dec 2018 10:26:24 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XmEj5iIvYnswuVl5eWeYMctSrwErFAHbp/x33PM95cyCSrCKTDoUz1ZOOZQvns2vzu8xjy
X-Received: by 2002:a37:1ba5:: with SMTP id m37mr13346934qkh.117.1545071184587;
        Mon, 17 Dec 2018 10:26:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545071184; cv=none;
        d=google.com; s=arc-20160816;
        b=uY9OTRPSE4r1fk+rLu+/2gpcwsfo3taJ4pj080HPtwIn8+6w/2ca7mjzABqIIzMlx2
         VKGS/NWWm4jZ0leA3TFALsByYWXRLKqmiH3CONhnPNzIL/qFgq7eshoeeAA9ILWgECT0
         AjiQQ3g2Ugq+L6M3wDzvvVxGm2lDkyAcp+RYzLkk8FgRED24RWMfLlTwzTFmPhW3HbFs
         CkE6d4Ugl5NH/3XPNft+2iErYaPhx3eClESv2W26+asrgIfjdCnrvroqr4Tkox0t5e5W
         myB+eyexT4noJvCecfNgrURC9SMji4KaSRPGDb2J+AomkASVYbBPn3k0ZIpyzZAcMpYv
         /iog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=1MQG6NGJw3+T3u3Yu81KyUn+Mk5K0BEaDfFbRJ2eO3s=;
        b=DJoetkRyF7FxW4bW/wQLA6TG8kRobGA3T5IhUkX0pl1lNNOibkbp3iXBqtUgPyY/3v
         U4J6NCgoAkX2Z/bKhdVBcBtY0AP8Yk4isPyLkwHdeNzgvcVYz+Nki+l8CI6f/aVeEO+X
         fqDe/afDfYlXKcLkdzHvyFzr3+a7ESkaqB7cEjk2HdyT4s2DAzBufngFcvzAFR/LXdfv
         qO1g7+OCFKsqVer74JKXA67QbTE7yhUiqK64SnTRcTNs4QzNwbM2KjXd9lZr51Xj302A
         3KW/kdEjxOV6AwD8UnMxAl44x/Bb7GYIwbjV6GX7ymsvtRjRde3DMTGWl6a9salwj2ev
         3BlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k60si157344qtd.396.2018.12.17.10.26.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 10:26:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48325 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYxay-00072L-35
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 13:26:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gYxal-00070i-PU
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 13:26:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gYxae-0006N0-4K
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 13:26:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45052)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gYxac-0006FZ-3O; Mon, 17 Dec 2018 13:26:02 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ECC057F6B3;
	Mon, 17 Dec 2018 18:25:54 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2DF65C579;
	Mon, 17 Dec 2018 18:25:48 +0000 (UTC)
Date: Mon, 17 Dec 2018 19:25:46 +0100
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20181217182546.zym4jhmambkzyigi@kamzik.brq.redhat.com>
References: <20181206170733.7469-1-eric.auger@redhat.com>
	<20181206170733.7469-3-eric.auger@redhat.com>
	<20181217162701.nzdqhccpnhypj2z7@kamzik.brq.redhat.com>
	<f253b6f6-2d2c-1e75-75ee-0dd0072924d1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f253b6f6-2d2c-1e75-75ee-0dd0072924d1@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 17 Dec 2018 18:25:55 +0000 (UTC)
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
X-TUID: mppA04s5nfXZ

On Mon, Dec 17, 2018 at 05:49:02PM +0100, Auger Eric wrote:
> Hi Drew,
> 
> On 12/17/18 5:27 PM, Andrew Jones wrote:
> > On Thu, Dec 06, 2018 at 06:07:33PM +0100, Eric Auger wrote:
> >> Let's update the structs according to revision D of the IORT
> >> specification and set the IORT node revision fields.
> >>
> >> In IORT smmuv3 node: the new proximity field is not used as
> >> the proximity domain valid flag is not set. The new DeviceId
> >> mapping index is not used either as all the SMMU control
> >> interrupts are GSIV based.
> >>
> >> In IORT RC node: the new memory address size limit field is
> >> set to 64 bits.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>
> >> ---
> >>
> >> v1 -> v2:
> >> - separate patches for SMMUv3 DMA coherency issue and struct
> >>   update to revision D.
> >> - revision fields set
> >> ---
> >>  hw/arm/virt-acpi-build.c    |  4 ++++
> >>  include/hw/acpi/acpi-defs.h | 10 +++++++++-
> >>  2 files changed, 13 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index aa177ba64d..a34a0958a5 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -423,6 +423,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>       */
> >>      iort_node_offset = sizeof(*iort);
> >>      iort->node_offset = cpu_to_le32(iort_node_offset);
> >> +    iort->revision = 0;
> >>  
> >>      /* ITS group node */
> >>      node_size =  sizeof(*its) + sizeof(uint32_t);
> >> @@ -445,6 +446,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>  
> >>          smmu->type = ACPI_IORT_NODE_SMMU_V3;
> >>          smmu->length = cpu_to_le16(node_size);
> >> +        smmu->revision = cpu_to_le32(2);
> >>          smmu->mapping_count = cpu_to_le32(1);
> >>          smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
> >>          smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
> >> @@ -470,6 +472,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>  
> >>      rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
> >>      rc->length = cpu_to_le16(node_size);
> >> +    rc->revision = cpu_to_le32(1);
> >>      rc->mapping_count = cpu_to_le32(1);
> >>      rc->mapping_offset = cpu_to_le32(sizeof(*rc));
> >>  
> >> @@ -477,6 +480,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>      rc->memory_properties.cache_coherency = cpu_to_le32(1);
> >>      rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
> >>      rc->pci_segment_number = 0; /* MCFG pci_segment */
> >> +    rc->memory_address_limit = 64;
> > 
> > Hmmm... IIUC this provides the size of the IOVA space. When it's 64 the
> > size of the space is U64_MAX, which gets added to the DMA base (also 64
> > bits) when calculating things like the last PFN. It seems strange to use
> > a value that will surely overflow those calculations. Is it common to
> > put 64 here? Can you elaborate on this?
> 
> I looked at drivers/acpi/arm64/iort.c nc_dma_get_range.
> There you can find
> 
>         *size = ncomp->memory_address_limit >= 64 ? U64_MAX :
>                         1ULL<<ncomp->memory_address_limit;
> 
> So I was expecting the value "64" to be properly handled by the kernel.

I traced the code further and see that the size gets added to the u64
dma base without any special checks in both iort_dma_setup() and
iommu_dma_init_domain(). Also iommu_dma_init_domain() function has this
comment

 * @base and @size should be exact multiples of IOMMU page granularity to
 * avoid rounding surprises. If necessary, we reserve the page at address 0
 * to ensure it is an invalid IOVA. It is safe to reinitialise a domain, but
 * any change which could make prior IOVAs invalid will fail.

U64_MAX is not a multiple of any page size. Maybe that U64_MAX assignment
is a kernel bug?


> If one decides to select something less than the whole range, which
> value would you suggest?

I don't know. Isn't it host/guest/device specific? Should we ask KVM what
the supported IPA is first? What kind of values are showing up in the
IORTs of real hardware?

> > 
> >>  
> >>      /* Identity RID mapping covering the whole input RID range */
> >>      idmap = &rc->id_mapping_array[0];
> >> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> >> index 532eaf79bd..b4a5104367 100644
> >> --- a/include/hw/acpi/acpi-defs.h
> >> +++ b/include/hw/acpi/acpi-defs.h
> >> @@ -628,7 +628,11 @@ struct AcpiIortItsGroup {
> >>  } QEMU_PACKED;
> >>  typedef struct AcpiIortItsGroup AcpiIortItsGroup;
> >>  
> >> -#define ACPI_IORT_SMMU_V3_COHACC_OVERRIDE 1
> >> +enum {
> >> +    ACPI_IORT_SMMU_V3_COHACC_OVERRIDE = 1 << 0,
> >> +    ACPI_IORT_SMMU_V3_HTTU_OVERRIDE   = 3 << 1,
> >> +    ACPI_IORT_SMMU_V3_PXM_VALID       = 1 << 3
> >> +};
> > 
> > We don't usually add flag definitions until we need them. Indeed it'll
> > just be more code to delete when switching to the aml_append* API.
> 
> The rationale was that those flags becomes usable with this revision so
> I decided to expose them. Now I don't have a strong opinion here.

I'd drop the change then.

Thanks,
drew
