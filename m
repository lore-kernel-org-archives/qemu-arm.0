Received: by 10.223.172.38 with SMTP id v35csp4474421wrc;
        Wed, 27 Sep 2017 02:06:49 -0700 (PDT)
X-Received: by 10.55.50.79 with SMTP id y76mr1332287qky.352.1506503209855;
        Wed, 27 Sep 2017 02:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506503209; cv=none;
        d=google.com; s=arc-20160816;
        b=RO7ElJvCTLKaxAMirdo6MP2w0We9HgDCFKzy7+oVTxKYefDhqoaC480xIOooN/Y7NE
         Qvrw5/CpLUHPathIVHYtpXkfQTiEwtZbWGBueqtLHgqeVKV7QL3JybJQqNMQN8jWJiR2
         zBq1gQQl24ozPYgH7twIHKO/pVzdjOYwH+IuA1WnMKV3b4quaumjabiuYUtaWe2nvf9g
         uawUa/AXB/i5lqtY6VmRZLuvbo64R2Yc5rXctIaJ4yY0zT0rc9PysL/Be8axH5y2TCrP
         Zu2dJT7mlzwcIG9wWe0O8k7ZWO0PnqjEBN4Vfphd87Il6gnx7lITdfTW4/r0gNGicdg4
         bFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=M1ZALkPYnPvZE+GqJ+hTyC4Xtda4wSk7gzSomF4YNXI=;
        b=Byl/N1d7evLYTPNxuuqIUs72ChtU76shO3RhP22UOivJqkXMjoMorR8/H/wxPcpDh5
         RKS41QeVTutKzdUuVEhJYkC6OQw6rA30/28qLqnE+3FLsucXzeObC5vcW6z0cdufOOuM
         kPNAlRTib1I1X8nZn0brShdikOYkcGXS8o2TibQGv3BgPkkXZYArpUJcMeqIr0w7Ifl/
         +YMNpsL6MbluD4X6J0AGtnAqrQfnhsnv6723O8HKqJjXbhYgFnSjyxIJMkmVUnzj4gMH
         sfw17GnH2iixyWwWGECPUk+8X4hRb+joT9wMY8hKYx2w80twaXYNcEArKJYM+1Ph5xp+
         5aPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=amk359c5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f9si970206qtl.146.2017.09.27.02.06.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 02:06:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=amk359c5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx8Ip-0000BR-DQ
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 05:06:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dx8IY-0000Am-Hq
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 05:06:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dx8IU-0000Mv-1U
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 05:06:30 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:36470)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linuc.decode@gmail.com>)
	id 1dx8IT-0000MQ-OF; Wed, 27 Sep 2017 05:06:25 -0400
Received: by mail-pg0-x243.google.com with SMTP id d8so8559216pgt.3;
	Wed, 27 Sep 2017 02:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=M1ZALkPYnPvZE+GqJ+hTyC4Xtda4wSk7gzSomF4YNXI=;
	b=amk359c5sOW5CRUpaeEy7Nfx+iq3hRRY8jwsrwu4zIDPkDAp3PpDkYY9KdM8X2Wrx6
	D4wMEpmuhj1+Woeuw3j8eYZtX+ZkaaXIsqaGTFqlD5YjpJHVsRtCmDhJNaCwS0bvNQzY
	LcljlHJP1h83d7M0QW+O0I4wEw38WC4nRkPytmimgyzsevl0ujHyt0WWlHwlfhugtt/e
	d6Sry5cDOeqsKdfGCEyDAQ0aNFo+D/KhFUaZP8FV9qHXrsRikk2PNONLMBQTp9dFw5iq
	q+20WZUl3R9zTWaDtVyxv8SrGF6rtHmx+7bhyN2finiamyjt0Kwc+Jv2M7D1x1ENDVIm
	K2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=M1ZALkPYnPvZE+GqJ+hTyC4Xtda4wSk7gzSomF4YNXI=;
	b=ibTADESmvEhDwP2XF+0dKbPGlchBgzLfbxiweQJE99/he9W/8OpwgtJYlBQKs35wV2
	Dp+8ebj+EKacXnJoCKYDXAHFGm4h7LK700wlbNqu5epXnZ28IOfQvHh230VB97m55Vqo
	0FLqPBWPCGUoSitIc8QYGLqUWU1zqyIG/ZafXyAoVt7ubE6QxcJCW8FfRSzFiGUeTeQ6
	BzuQ4ni389Pe3RSI0Bu7j+X4PiLAJ5AalwYgVrbyb3ojfCp2BxvH6bftJy593D/tSD5D
	2tTvXcFToU+/FfPIEeiaFn9OCTaaT665chQCGGbkJ8OG4o05cJppbaitYSB+Bi5I/C6u
	APOg==
X-Gm-Message-State: AHPjjUiNfq270PKYHnpS1jx2Kyw0Knbotu8yDQVsPRjVf9tjBCPH//bd
	p5aJ4Huy3/EvF9h9T7ja7so=
X-Google-Smtp-Source: AOwi7QDoLEOcHQvawIo8ra8LEayJnm+/7CIUzydHqW/BCvmynw2NUe7nK/tJFCi8RN/WX1f+bRs0eA==
X-Received: by 10.84.133.111 with SMTP id 102mr690287plf.204.1506503184903;
	Wed, 27 Sep 2017 02:06:24 -0700 (PDT)
Received: from virtx40 ([111.93.218.67]) by smtp.gmail.com with ESMTPSA id
	f3sm20826024pfd.82.2017.09.27.02.06.19
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 27 Sep 2017 02:06:23 -0700 (PDT)
Date: Wed, 27 Sep 2017 14:35:55 +0530
From: Linu Cherian <linuc.decode@gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20170927090555.GB32011@virtx40>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
	<20170927074109.GA31587@virtx40>
	<AM5PR0401MB25450ACC804B20D93C4F2D9D9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<9700cf30-65ed-9c55-c1b9-14bb8deb669f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9700cf30-65ed-9c55-c1b9-14bb8deb669f@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sJ5eHuPczgDb

On Wed Sep 27, 2017 at 10:55:07AM +0200, Auger Eric wrote:
> Hi Linu,
> 
> On 27/09/2017 10:30, Bharat Bhushan wrote:
> > Hi,
> > 
> >> -----Original Message-----
> >> From: Linu Cherian [mailto:linuc.decode@gmail.com]
> >> Sent: Wednesday, September 27, 2017 1:11 PM
> >> To: Bharat Bhushan <bharat.bhushan@nxp.com>
> >> Cc: eric.auger@redhat.com; eric.auger.pro@gmail.com;
> >> peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
> >> qemu-arm@nongnu.org; qemu-devel@nongnu.org; kevin.tian@intel.com;
> >> marc.zyngier@arm.com; tn@semihalf.com; will.deacon@arm.com;
> >> drjones@redhat.com; robin.murphy@arm.com; christoffer.dall@linaro.org;
> >> bharatb.yadav@gmail.com
> >> Subject: Re: [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO integration
> >>
> >> Hi,
> >>
> >> On Wed Sep 27, 2017 at 12:03:15PM +0530, Bharat Bhushan wrote:
> >>> This patch series integrates VFIO/VHOST with virtio-iommu.
> >>>
> >>> This version is mainly about rebasing on v4 version on virtio-iommu
> >>> device framework from Eric Augur and addresing review comments.
> >>>
> >>> This patch series allows PCI pass-through using virtio-iommu.
> >>>
> >>> This series is based on:
> >>>  - virtio-iommu kernel driver by Jean-Philippe Brucker
> >>>     [1] [RFC] virtio-iommu version 0.4
> >>>     git://linux-arm.org/virtio-iommu.git branch viommu/v0.4
> 
> Just to make sure, do you use the v0.4 virtio-iommu driver from above
> branch?

Yes, Eric i have that.

From guest kernel,
  0.000000] Linux version 4.13.0-rc1-gd1949df
.
.
] virtio_iommu virtio0: aperture: 0x0-0xffffffffffffffff
[    0.927886] virtio_iommu virtio0: page mask: 0x40201000
[    0.931682] virtio_iommu virtio0: probe successful


Guest kernel source is on this commit,

commit d1949dfbf5c0d181b290625c28c5359284686e3a
Author: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Date:   Mon Jul 17 19:01:07 2017 +0100

    iommu/virtio-iommu: add MSI window probe
    
    Using the probe request, extract RESV_MEM information. When we encounter a
    MSI doorbell region, set it up as a IOMMU_RESV_MSI region. This will tell
    other subsystems that there is no need to map the MSI doorbell in the
    virtio-iommu, because MSIs bypass it.
    
    Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>

with CONFIG_VIRTIO_IOMMU=y in config.

> 
> Thanks
> 
> Eric
> >>>
> >>>  - virtio-iommu device emulation by Eric Augur.
> >>>    [RFC v4 00/16] VIRTIO-IOMMU device
> >>>    https://github.com/eauger/qemu/tree/v2.10.0-virtio-iommu-v4
> >>>
> >>> Changes are available at : https://github.com/bharaty/qemu.git
> >>> virtio-iommu-vfio-integration-v4
> >>>
> >>
> >> # With the above sources, was trying to test the vfio-pci device assigned to
> >>   guest using Qemu.
> >> # Both guest and host kernels are configured with 4k as page size.
> >> # releavant qemu command snippet,
> >>   -device virtio-iommu-device -device virtio-blk-device,drive=hd0 \
> >>   -net none -device vfio-pci,host=xxx
> >>
> >>
> >> On guest booting, observed mutliple messages as below,
> >>
> >> qemu-system-aarch64: iommu has granularity incompatible with target AS
> >>
> >> # On adding necessary prints, 0x5000 is len, 0x4fff is address mask
> >>   and the code expects the address mask to be 0xfff.
> > 
> > I have not seen these errors, I am also using 4K page-size on both host and guest. Can you share compete qemu command and log. 
> > 
> > Thanks
> > -Bharat
> > 
> >>
> >> if (len & iotlb->addr_mask) {
> >>         error_report
> >>
> >> # vfio_dma_map is failing due to this error.
> >>
> >> Any pointers ?
> >>
> >>
> >>> v3->v4:
> >>>  - Rebase to v4 version from Eric
> >>>  - Fixes from Eric with DPDK in VM
> >>>  - Logical division in multiple patches
> >>>
> >>> v2->v3:
> >>>  - This series is based on "[RFC v3 0/8] VIRTIO-IOMMU device"
> >>>    Which is based on top of v2.10-rc0 that
> >>>  - Fixed issue with two PCI devices
> >>>  - Addressed review comments
> >>>
> >>> v1->v2:
> >>>   - Added trace events
> >>>   - removed vSMMU3 link in patch description
> >>>
> >>> Bharat Bhushan (5):
> >>>   target/arm/kvm: Translate the MSI doorbell in
> >> kvm_arch_fixup_msi_route
> >>>   virtio-iommu: Add iommu notifier for map/unmap
> >>>   virtio-iommu: Call iommu notifier for attach/detach
> >>>   virtio-iommu: add iommu replay
> >>>   virtio-iommu: add iommu notifier memory-region
> >>>
> >>>  hw/virtio/trace-events           |   5 ++
> >>>  hw/virtio/virtio-iommu.c         | 181
> >> ++++++++++++++++++++++++++++++++++++++-
> >>>  include/hw/virtio/virtio-iommu.h |   6 ++
> >>>  target/arm/kvm.c                 |  27 ++++++
> >>>  target/arm/trace-events          |   3 +
> >>>  5 files changed, 219 insertions(+), 3 deletions(-)
> >>>
> >>> --
> >>> 1.9.3
> >>>
> >>>
> >>
> >> --
> >> Linu cherian

-- 
Linu cherian
