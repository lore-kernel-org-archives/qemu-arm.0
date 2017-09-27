Received: by 10.223.172.38 with SMTP id v35csp4844109wrc;
        Wed, 27 Sep 2017 08:39:59 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAk2s5KKoXRuZyvhJgn6OCCwQh8GdJmnI1D0ZRIOBglusl9h7ZqOEEW5STjmvDU1nXQyD95
X-Received: by 10.55.25.29 with SMTP id k29mr2857946qkh.229.1506526799541;
        Wed, 27 Sep 2017 08:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506526799; cv=none;
        d=google.com; s=arc-20160816;
        b=zdhfNz9lxP4r8MyDL/FM6HH/bbCRTVseh55unAeKMTCioeZq8m+F6FqCNgUQgrcSB/
         Pxd2HwQLnUr/4Oph+0ERF77Cii2TntugMqDHrzxKmIGC79pQJg6eAJ13uGNSkOds70s2
         sdkrUC/xhiu5JYZBtf3y8UiKPgQocpZ1k/+ZzyG5uIi5HawG2scaNL0F9z7UUMY4sLQY
         p0en0U33g4teej0EJUHHzrLc7bVzNkJ4+yFyIv4h9BlctHCeHHh5U47tzTiYyz8Wx5Yr
         0Ta97GycE21G1RPBunAnYk1ry68nuxH+rU1m6NB4b2HsiDjddzc7ZJitk1ilQyN1HU96
         HZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=ht3Xlx5Pi8RRZP+oJnq+EN1wUHJ1z9lhXzPPg+gdSx4=;
        b=n/OBiR96ohzXZ0KDJ83xgAULSXPBpkfUM5e43wwbxGkH+Bnor7eH00VuNer7gCWNJC
         Km8BbQiuMFRBXdO64ZRM/0THBRZAhfarPi+dZjLRrXBk2MVdBRiibqZ8U9fAu6uTOAeA
         nBNgc5kklhQ3CkEOtUDH/L4EXhYxoh9UtgmZ3xKdaAoqo3CRdcxnuXr7L+AxgIhNIcZ2
         +F/ODRFTPUstJTifOLeBW8JcOHbjt/rNZHAk0vGOPQRqxXlHuCPmX80RKEHk8RBUg/Z0
         CVKNdIQdnM1vTH++sMcp7k/vYbXFoovSrmgP32oBlmPsm4U98NNTPY1B4ZLFiaLse5Dw
         YEgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f89si5742080qtd.360.2017.09.27.08.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 08:39:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55278 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxERJ-0007tC-BZ
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 11:39:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dxERC-0007t0-9M
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 11:39:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dxER8-0003ve-SN
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 11:39:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56498)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dxER8-0003ut-JE; Wed, 27 Sep 2017 11:39:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DEFEC0079A5;
	Wed, 27 Sep 2017 15:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4DEFEC0079A5
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-163.ams2.redhat.com
	[10.36.116.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAA7981EFB;
	Wed, 27 Sep 2017 15:38:54 +0000 (UTC)
To: Tomasz Nowicki <tnowicki@caviumnetworks.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, alex.williamson@redhat.com, mst@redhat.com,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
	<0062ede1-54d4-7e13-2986-374ec62c0a2a@caviumnetworks.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <25c896c5-81db-e64a-92b0-7b2e270f530e@redhat.com>
Date: Wed, 27 Sep 2017 17:38:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <0062ede1-54d4-7e13-2986-374ec62c0a2a@caviumnetworks.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 27 Sep 2017 15:39:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v4 00/16] VIRTIO-IOMMU device
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e86KOwFv0yr4

Hi Tomasz

On 27/09/2017 13:07, Tomasz Nowicki wrote:
> Hi Eric,
> 
> Out of curiosity, I compared your SMMUv3 full emulation against
> virtio-iommu. For virtio-net device behind the virtio-iommu I get 50%
> performance of what I can get for SMMUv3 emulation.
> 
> Do you have similar observations? Since there is no need to emulate HW
> behaviour in QEMU I expected virtio-iommu to be faster. I will run some
> more benchmarks.

No I don't have formal comparative figures at the moment. Benchmarking
is also on the top of my todo list though.

One reason could be that virtio-iommu sends requests for each map
operations whereas this does not happen for vsmmuv3 (in non caching
mode). You could try to turn the vsmmuv3 caching-mode option and I guess
you should have more similar perf figures between virtio-iommu and
vsmuv3.

Thanks

Eric
> 
> Thanks,
> Tomasz
> 
> On 19.09.2017 09:46, Eric Auger wrote:
>> This series implements the virtio-iommu device.
>>
>> This v4 is an upgrade to v0.4 spec [1] and applies on QEMU v2.10.0.
>> - probe request support although no reserved region is returned at
>>    the moment
>> - unmap semantics less strict, as specified in v0.4
>> - device registration, attach/detach revisited
>> - split into smaller patches to ease review
>> - propose a way to inform the IOMMU mr about the page_size_mask
>>    of underlying HW IOMMU, if any
>> - remove warning associated with the translation of the MSI doorbell
>>
>> The device gets instantiated using the "-device virtio-iommu-device"
>> option. It currently works with ARM virt machine only, as the machine
>> must handle the dt binding between the virtio-mmio "iommu" node and
>> the PCI host bridge node.
>>
>> The associated VHOST/VFIO adaptation is available on the branch
>> below but is not officially delivered as part of this series.
>>
>> Best Regards
>>
>> Eric
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/v2.10.0-virtio-iommu-v4
>>
>> References:
>> [1] [RFC] virtio-iommu version 0.4
>>      git://linux-arm.org/virtio-iommu.git branch viommu/v0.4
>>
>> Testing:
>> - guest kernel with v0.4 virtio-iommu driver (4kB page)
>> - tested with guest using virtio-pci-net and vhost-net
>>    (,vhost=on/off,iommu_platform,disable-modern=off,disable-legacy=on  )
>> - tested with VFIO and guest assigned with 2 VFs
>> - tested with DPDK on guest with 2 assigned VFs
>>
>> Not tested:
>> - hot-plug/hot-unplug of EP: not implemented
>>
>> History:
>> v2-> v4:
>> - see above
>>
>> v2 -> v3:
>> - rebase on top of 2.10-rc0 and especially
>>    [PATCH qemu v9 0/2] memory/iommu: QOM'fy IOMMU MemoryRegion
>> - add mutex init
>> - fix as->mappings deletion using g_tree_ref/unref
>> - when a dev is attached whereas it is already attached to
>>    another address space, first detach it
>> - fix some error values
>> - page_sizes = TARGET_PAGE_MASK;
>> - I haven't changed the unmap() semantics yet, waiting for the
>>    next virtio-iommu spec revision.
>>
>> v1 -> v2:
>> - fix redifinition of viommu_as typedef
>>
>> Eric Auger (16):
>>    update-linux-headers: import virtio_iommu.h
>>    linux-headers: Update for virtio-iommu
>>    virtio-iommu: add skeleton
>>    virtio-iommu: Decode the command payload
>>    virtio-iommu: Add the iommu regions
>>    virtio-iommu: Register attached devices
>>    virtio-iommu: Implement attach/detach command
>>    virtio-iommu: Implement map/unmap
>>    virtio-iommu: Implement translate
>>    virtio-iommu: Implement probe request
>>    hw/arm/virt: Add 2.11 machine type
>>    hw/arm/virt: Add virtio-iommu to the virt board
>>    memory.h: Add set_page_size_mask IOMMUMemoryRegion callback
>>    hw/vfio/common: Set the IOMMUMemoryRegion supported page sizes
>>    virtio-iommu: Implement set_page_size_mask
>>    hw/vfio/common: Do not print error when viommu translates into an mmio
>>      region
>>
>>   hw/arm/virt.c                                 | 115 +++-
>>   hw/vfio/common.c                              |   7 +-
>>   hw/virtio/Makefile.objs                       |   1 +
>>   hw/virtio/trace-events                        |  24 +
>>   hw/virtio/virtio-iommu.c                      | 923
>> ++++++++++++++++++++++++++
>>   include/exec/memory.h                         |   4 +
>>   include/hw/arm/virt.h                         |   5 +
>>   include/hw/vfio/vfio-common.h                 |   1 +
>>   include/hw/virtio/virtio-iommu.h              |  61 ++
>>   include/standard-headers/linux/virtio_ids.h   |   1 +
>>   include/standard-headers/linux/virtio_iommu.h | 177 +++++
>>   linux-headers/linux/virtio_iommu.h            |   1 +
>>   scripts/update-linux-headers.sh               |   3 +
>>   13 files changed, 1312 insertions(+), 11 deletions(-)
>>   create mode 100644 hw/virtio/virtio-iommu.c
>>   create mode 100644 include/hw/virtio/virtio-iommu.h
>>   create mode 100644 include/standard-headers/linux/virtio_iommu.h
>>   create mode 100644 linux-headers/linux/virtio_iommu.h
>>
> 
