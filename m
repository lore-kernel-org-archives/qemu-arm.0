Received: by 10.223.188.70 with SMTP id a6csp6425140wrh;
        Tue, 29 Aug 2017 12:43:22 -0700 (PDT)
X-Received: by 10.200.55.148 with SMTP id d20mr7206941qtc.59.1504035801939;
        Tue, 29 Aug 2017 12:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504035801; cv=none;
        d=google.com; s=arc-20160816;
        b=YxxZnSqVe5Kn/XZE5k8pIoaGJ0Fa99gCxcvrTXq5FqHhNBS4M1nXv9W307qJwU+L9a
         I4mdqptT3JxKnzCJixzVomqvymJjccfijuo1Pp2PtAF2cF0/yMAsf0gxCmxuYbU7ZWOg
         A9G0g+qNZuiuF45I2ptqiscES5gnlZkj9/Dbq61HkqfMaN+UzLGx8SrjLY1/ObxTAOJq
         dnFIpDRMbhzguJa5g6GIUstRLDWQTO5RvJPJwXsA5XLf2/hSLekG3DRB12beXjd4Sd5R
         I5nWnAdJ4BZRnJku1KGghx4kI/m4UO0bfOKmmZJNi+QltdTCUNP3ThfyivFaoqHLhlnr
         9ucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=CYe0ee7wvGoHc5HhXqkBvnzB662F0MVw9q+bJxmnm68=;
        b=VuC0bH5hySNkRAYFOPJWhTR9IMDnJu1809TvWi76Ri6oUpvHTev8aFKIUqGH2659uL
         XRGaeGzJhjXtydCe6EbaJe44UlQCqnMlloD2eD0NgH3OK5jkqB8XGtKR8k7ZsSgzWlI2
         yfalxP+bgH6qTXYtPIl1ZJtEitRJdhjM0YFx0IkKhzb2f/tdWA9ItsczC1eZu/VaIa/d
         hALZmcv6k2Kmh6q7wcLc3y3PF/FIARkZj8ljl3RZKnxd7G1bx4faGP00psKDQP/Qrc5u
         qitNGI+HV/4tK+nwqVYKgePSSe8EqNaFo1doug0dB2ZkvNxoIlVw/+5HpTHgQZhxTc90
         +Zig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i123si3503871qkd.124.2017.08.29.12.43.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 12:43:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46716 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmmPv-0003Bv-MO
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 15:43:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dmmPp-0003BY-8z
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 15:43:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dmmPl-0007nE-Cl
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 15:43:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35182)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dmmPl-0007mW-21; Tue, 29 Aug 2017 15:43:09 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B37DA5D686;
	Tue, 29 Aug 2017 19:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B37DA5D686
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D4995D732;
	Tue, 29 Aug 2017 19:42:57 +0000 (UTC)
To: Linu Cherian <linuc.decode@gmail.com>,
	Bharat Bhushan <Bharat.Bhushan@nxp.com>
References: <1503312534-6642-1-git-send-email-Bharat.Bhushan@nxp.com>
	<20170829170630.GA2622@virtx40>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <1698021f-3b2b-84aa-01de-ba042097a9ee@redhat.com>
Date: Tue, 29 Aug 2017 21:42:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20170829170630.GA2622@virtx40>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 29 Aug 2017 19:43:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 0/2] virtio-iommu: VFIO
 integration
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, mst@redhat.com,
	marc.zyngier@arm.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	linu.cherian@cavium.com, robin.murphy@arm.com,
	christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cakk7DKD5Qbg

Hi Linu,

On 29/08/2017 19:06, Linu Cherian wrote:
> Hi,
> 
> On Mon Aug 21, 2017 at 04:18:52PM +0530, Bharat Bhushan wrote:
>> This V3 version is mainly about rebasing on v3 version on Virtio-iommu device
>> framework from Eric Augur and addresing review comments.
>>
>> This patch series allows PCI pass-through using virtio-iommu.
>>   
>> This series is based on:
>>  - virtio-iommu specification written by Jean-Philippe Brucker
>>    [RFC 0/3] virtio-iommu: a paravirtualized IOMMU,
>>  
>>  - virtio-iommu driver by Jean-Philippe Brucker
>>    [RFC PATCH linux] iommu: Add virtio-iommu driver
>>  
>>  - virtio-iommu device emulation by Eric Augur.
>>    [RFC v3 0/8] VIRTIO-IOMMU device
>>
>> PCI device pass-through and virtio-net-pci is tested with these changes using dma-ops
>>
> 
> Facing issues while trying to test with VFIO.
> 
> vfio_dma_map fails as below, 
> qemu-system-aarch64: vfio_dma_map(0x1ff0da0, 0xfdfc7000, 0x1000, 0xffff79acc000) = -22 (Invalid argument)
> Very likely this seem to be an issue with map size. Kernel PAGE_SIZE 
> is 64k on my host and hence the map size for the physical SMMU also will
> start with 64k.
Most probably. I currently use 4KB on both host/guest.  Also the devices
I assign have BARs smaller than 64kB and this causes issue with DPDK.

> 
> Qemu source: https://github.com/eauger/qemu.git + this patch series
>              on branch v2.10.0-rc0-virtio-iommu-rfcv3
> Linux source: git://linux-arm.org/linux-jpb.git
>              on branch virtio-iommu/v0.1
> Any pointers ?
Looks good.
> 
> The other related questions i had,
> 1.  In, virtio_iommu_device_realize in qemu,
>    s->config.page_sizes = TARGET_PAGE_MASK;
> 
>   Same is being taken as pgsize_bitmap in virtio_iommu guest kernel driver.
>   In, viommu_probe 
>   virtio_cread(vdev, struct virtio_iommu_config, page_sizes,
>                      &viommu->pgsize_bitmap);
> 
>   Should s->config.page_sizes be initialized with page bitmap instead
>   of page mask ?
We currently support all page size bits greater or equal than the guest
page size
define TARGET_PAGE_MASK ~(TARGET_PAGE_SIZE - 1)

We evoked the problem you seem to face in
https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg05308.html

and the temporary solution was to use TARGET_PAGE_MASK
> 
> 2. Should we not populate the supported page sizes based on  
>    host kernel size and SMMU hardware capability rather than 
>    based on the machine emulated on qemu? Atleast that makes
>    sense for VFIO case.

I think Jean's proposal to address this issue is to enhance the PROBE
API. The driver would fetch for each device an accurate page_size_mask
that would characterize either the virtual iommu or the underlying
physical iommu. This would override the global page_size_mask. I think
the plan was to issue that for v0.5

Thanks

Eric
> 
>> This patch series does not implement RESV_MEM changes proposal by Jean-Philippe "https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg01796.html"
>>
>> v2->v3:
>>  - This series is based on "[RFC v3 0/8] VIRTIO-IOMMU device"
>>    Which is based on top of v2.10-rc0 that 
>>  - Fixed issue with two PCI devices
>>  - Addressed review comments
>>
>> v1->v2:
>>   - Added trace events
>>   - removed vSMMU3 link in patch description
>>
>> Bharat Bhushan (2):
>>   target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
>>   virtio-iommu: vfio integration with virtio-iommu
>>
>>  hw/virtio/trace-events           |   5 ++
>>  hw/virtio/virtio-iommu.c         | 163 +++++++++++++++++++++++++++++++++++++++
>>  include/hw/virtio/virtio-iommu.h |   6 ++
>>  target/arm/kvm.c                 |  27 +++++++
>>  target/arm/trace-events          |   3 +
>>  5 files changed, 204 insertions(+)
>>
>> -- 
>> 1.9.3
>>
>>
> 
