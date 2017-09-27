Received: by 10.223.172.38 with SMTP id v35csp4413724wrc;
        Wed, 27 Sep 2017 00:42:11 -0700 (PDT)
X-Received: by 10.55.220.2 with SMTP id v2mr1166894qki.64.1506498131086;
        Wed, 27 Sep 2017 00:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506498131; cv=none;
        d=google.com; s=arc-20160816;
        b=gWZzM5IVSCGCtgHUMo5EgnSpnmeA4PxI6GDtwrI4nPD613VioO6HqJ/EoWWkXjeFyF
         1nYzxprRAxDAbZmvQpBBV6Qt/PoECouscWrTis1vM5EItbHW1yUMpRjx0PMP1zDxKT4Y
         Yl5LKoojUwb/vu2NimSu1T3xwV/KfWD6ExUV0C6l2HiwOhcaXX6chKpwW0q0mgO41Zh+
         3VU/Evkb2/AXE+vBMS52wWEqHL42kawusPKvrQcR6Jk3B5ZEw9//8gfuTXPx/KxL5ATh
         FYNvE6kCCeTaFufdGuFO/sb73Xx8WTWwOdQSqyTl6o0b0Tt7AO3iXdTIjjHIMuHH0FLJ
         QXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=5XWg9QzKjncdYCcV4bdklKMCePEET1KO708rxi9aLjA=;
        b=xY6DzMV8bysD6MOgTdqjODfgQg3CbvM6B+G2AKFfgBp4wXDRv7b2sB6R2Blb08V9qV
         o0rWoDjdOYeRPNvlChTxK8CKY6pK1ILqrZqxrIcIHdwyL9R8gzaZQLwHMNHE9AyKrMo/
         ir9mlLOEF2alEOa/ZQNWCHL3pIU0nTM7nEsou8zpcM1rFC/KHAlzt+HZohwO48aIehNQ
         gAgWs8QOVTIHSbuxKSFnrRlxSglvDJL+bZEMECRAkdd/D8Qi6xwZBDrBYTeky3iME9/b
         zLfi3KIxn+zt9Io227O5WJfW5qI5tWO/TVzHn5cg9iP3BEsjoM94c59FDsnpWCtw5p9W
         uFJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JF5vbp6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i1si972487qkc.127.2017.09.27.00.42.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 00:42:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JF5vbp6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx6yu-0008Vm-QV
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 03:42:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dx6yX-0008MY-80
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 03:41:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dx6yU-0002TI-3u
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 03:41:45 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:38487)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linuc.decode@gmail.com>)
	id 1dx6yT-0002SK-TY; Wed, 27 Sep 2017 03:41:42 -0400
Received: by mail-pf0-x241.google.com with SMTP id a7so6091836pfj.5;
	Wed, 27 Sep 2017 00:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5XWg9QzKjncdYCcV4bdklKMCePEET1KO708rxi9aLjA=;
	b=JF5vbp6WJwmoSXNNtU1l1Hc7sJo+3tgJrg6MwH8hJvjeN9pWMybIDQ9rADQavFbgzY
	8KktjjOM+p2WgqBxB9aGUaCUkThqFfmCZzdIL2s7hQsKqMeARqzhO/CgFkqVAp4XsXD3
	ixgZ0XIjmABJN+K0g7P20gVvyvcSRD/PJPOcnBaVo2Wf//rWWaX17uPp4OgOyQLEVRU5
	uq3SXJ/v75vmcYTfVS6HCbfHmpUTSLs3rMjHE/tikirkwcbcTZZbKRR5xw52wT24jB9Z
	c/VoqNMYkpMgYkXaoQX0Yo7vZDoVZZKksVGnZ+YSO3D0F51G5rH9kRn/J6DxN+4Jj47p
	/jJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5XWg9QzKjncdYCcV4bdklKMCePEET1KO708rxi9aLjA=;
	b=HI9mlDSJUTEMEqtdYQezwKVDsIwc4sIAukNxZBpg6M7viTmZ1sooamdJvzXqu+2BLv
	FteQxvAVXnKZrMk+Ya1Qts+2Ha/uysmAY3Vg/VixhOsFLJDKeJHCeiiWSGXucXuLbBH2
	PhkW3VjMWsmZ9K1ywUNv/qDzCGcKo+yZCXTx9nvX4aaPjW0SCT1Py/aCedgblK4s1axf
	rKzKqnKvJJ4AZ7+ZSrdNrC6poVaBvfdIi5Ipx3xAdv0/8+r5XoPileVkUkXXY0rPg5XK
	BGcski+03xX3bkBIYkBMxXgGkdnukMr/yitRDEf9Vq8v1MIAvFFf3ZqRlm1iemsDZCCW
	73Lg==
X-Gm-Message-State: AHPjjUhzPPKYKCWYdWfsq/2VYVJiG69wLpDS4fSTMAcW5Ias7cNx6S0J
	U36rPGCZKfr5kR4BfruiBvc=
X-Google-Smtp-Source: AOwi7QDFKZi+pGZV1bkiiC1hdxhezWWjDn9SnAcgi2lUOOuH4m0P48sLu/wVodjN6nlIKMwxk9ElxA==
X-Received: by 10.159.247.131 with SMTP id e3mr504598pls.296.1506498099360;
	Wed, 27 Sep 2017 00:41:39 -0700 (PDT)
Received: from virtx40 ([111.93.218.67]) by smtp.gmail.com with ESMTPSA id
	a29sm18589033pfj.88.2017.09.27.00.41.34
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 27 Sep 2017 00:41:38 -0700 (PDT)
Date: Wed, 27 Sep 2017 13:11:10 +0530
From: Linu Cherian <linuc.decode@gmail.com>
To: Bharat Bhushan <Bharat.Bhushan@nxp.com>
Message-ID: <20170927074109.GA31587@virtx40>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO integration
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, drjones@redhat.com,
	mst@redhat.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, qemu-devel@nongnu.org,
	eric.auger@redhat.com, alex.williamson@redhat.com,
	qemu-arm@nongnu.org, bharatb.yadav@gmail.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LsoU0foO6qdO

Hi,

On Wed Sep 27, 2017 at 12:03:15PM +0530, Bharat Bhushan wrote:
> This patch series integrates VFIO/VHOST with virtio-iommu.
> 
> This version is mainly about rebasing on v4 version on
> virtio-iommu device framework from Eric Augur and
> addresing review comments.
> 
> This patch series allows PCI pass-through using virtio-iommu.
>   
> This series is based on:
>  - virtio-iommu kernel driver by Jean-Philippe Brucker
>     [1] [RFC] virtio-iommu version 0.4
>     git://linux-arm.org/virtio-iommu.git branch viommu/v0.4
> 
>  - virtio-iommu device emulation by Eric Augur.
>    [RFC v4 00/16] VIRTIO-IOMMU device
>    https://github.com/eauger/qemu/tree/v2.10.0-virtio-iommu-v4
> 
> Changes are available at : https://github.com/bharaty/qemu.git virtio-iommu-vfio-integration-v4
> 

# With the above sources, was trying to test the vfio-pci device assigned to 
  guest using Qemu.
# Both guest and host kernels are configured with 4k as page size.
# releavant qemu command snippet,
  -device virtio-iommu-device -device virtio-blk-device,drive=hd0 \
  -net none -device vfio-pci,host=xxx


On guest booting, observed mutliple messages as below,

qemu-system-aarch64: iommu has granularity incompatible with target AS

# On adding necessary prints, 0x5000 is len, 0x4fff is address mask
  and the code expects the address mask to be 0xfff.

if (len & iotlb->addr_mask) {
        error_report

# vfio_dma_map is failing due to this error.

Any pointers ?


> v3->v4:
>  - Rebase to v4 version from Eric
>  - Fixes from Eric with DPDK in VM
>  - Logical division in multiple patches
> 
> v2->v3:
>  - This series is based on "[RFC v3 0/8] VIRTIO-IOMMU device"
>    Which is based on top of v2.10-rc0 that
>  - Fixed issue with two PCI devices
>  - Addressed review comments
> 
> v1->v2:
>   - Added trace events
>   - removed vSMMU3 link in patch description
> 
> Bharat Bhushan (5):
>   target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
>   virtio-iommu: Add iommu notifier for map/unmap
>   virtio-iommu: Call iommu notifier for attach/detach
>   virtio-iommu: add iommu replay
>   virtio-iommu: add iommu notifier memory-region
> 
>  hw/virtio/trace-events           |   5 ++
>  hw/virtio/virtio-iommu.c         | 181 ++++++++++++++++++++++++++++++++++++++-
>  include/hw/virtio/virtio-iommu.h |   6 ++
>  target/arm/kvm.c                 |  27 ++++++
>  target/arm/trace-events          |   3 +
>  5 files changed, 219 insertions(+), 3 deletions(-)
> 
> -- 
> 1.9.3
> 
> 

-- 
Linu cherian
