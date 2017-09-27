Received: by 10.223.172.38 with SMTP id v35csp4486273wrc;
        Wed, 27 Sep 2017 02:22:42 -0700 (PDT)
X-Received: by 10.237.34.118 with SMTP id o51mr837607qtc.36.1506504162639;
        Wed, 27 Sep 2017 02:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506504162; cv=none;
        d=google.com; s=arc-20160816;
        b=u5T1ApCOP4APeg3tlx+di35PoRJvq0zJ/araG+UKybLErtGEvOseg7vXNlHaGYdxFw
         zv9yMfshPQheAV3+4Yr8NSAy0N9Ln/s8IAxmkNXdDw2EspUWlIxWanEk9R8VCFjZ1f8j
         n9p2SYRG4LK8DjJVPUZIZGrjuI9SCdYo+9a6sR0Mh0gKuLC1llc7g3GPEPDCFZZX13zS
         EXyvrPkMtKcvZM9AeXH/Xyx0hgqZLMh+B+AOFy9q7aZv7DJYF6UrnzlDbQD4R3IJgsMy
         3fbTz7FEcqQDS4Jlb078x3JrtAFfDEC6fH63XY764AfTRk+UwZj5O/ry7W+YGa9NE7Fl
         P1lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=6P1Y4XJ1B1zlLKsjo0x+7mjQLADT104eKcPqorYFNL4=;
        b=rmnI50KCHxb3D0OJ00GMnd0PHCDyvChLyQJW5i/zjGKl+TDIyqo9UV/uPs6AguQF6k
         Sycg1pGKw08wbLCAAEoQ04qCZ6lCRYrb14Y7faZ+Sm0NMBjeDj8gn7p7I01Q4j8mpMZY
         zZYE4rU0Lx6/wZrco51aoaemjPFsOeVi3bw2e+fKoFfmaEpMdfQ7z1MIRp8PrnUaCfAJ
         UXxpXAB5+pykKJoVU6D8oHow1dw06rDqrRjQG4KbgwQlIrI+2Vuca4yscFLLKw4aYMSB
         rWdi90ilLlbGgN4DaQBeDmFRN6kp6bkX37QqPc7W0/oBW+pema4w885hynYKLRhWMs9P
         DVcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eTjEgVDp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m89si1063405qtd.228.2017.09.27.02.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 02:22:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eTjEgVDp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53607 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx8YC-00073C-EK
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 05:22:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dx8Y0-00071l-Cx
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 05:22:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dx8Xq-00036V-Eo
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 05:22:28 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:35300)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linuc.decode@gmail.com>)
	id 1dx8Xq-00035r-67; Wed, 27 Sep 2017 05:22:18 -0400
Received: by mail-pf0-x244.google.com with SMTP id i23so6365900pfi.2;
	Wed, 27 Sep 2017 02:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6P1Y4XJ1B1zlLKsjo0x+7mjQLADT104eKcPqorYFNL4=;
	b=eTjEgVDpI0CHaKTfatgdi+U+kts3mlfz2T64dT4uXjRGF8c7TgdeqkVPdNPYJub5eF
	H82cDpVcCvgvv2LYygw3dKWzqVG/5HmbeKtA6TaVsCtmOaZagSmpLOHENQX7pFFRMpdJ
	iQjQfEAt0bx5/RdU5cFqekP5pMqF4puOXD32YrWFRDSvECc2IoRWdDCMBwfUCAwgUSyA
	GpHyLph9dsi4Y++x3PUBPtHY/91MhkrQViY3Hs/+J1tncDdl0xv+0nx6YUMfggkmisqL
	E+jigbbrZw5emwrivsvO8U+EaqqPncZjJobkrWJDNRimjrLRmexpNHzghDI8yI68YJmL
	hMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6P1Y4XJ1B1zlLKsjo0x+7mjQLADT104eKcPqorYFNL4=;
	b=DIujcGdX6xfutw6Oxw7cue11gMRKDRpqGu+yTLa6x7wMUw5gL+1PkJASeba+Vj9ElU
	ktCN7Isjm1uGqvwm+fri+838HG+GTQmgCxgvpK8JMhiob7JLPVWE8rcpowBpB+SR361h
	tWQGc4WTRnJRGsj5pDMZDnjao7LAUgahFoPJTNO2C4TgHwtbFbIdDNJ0v/y0admsEdLZ
	RXO7nMQ6ZhQ2Qk5WVTAb5zZ1UhCaSqoPRVbTD9BCLC15WZTupQaoYBpIisHXM0w93cmg
	hvBdzvPU3qHg5CTFyVK9VCwAVAy0gTddDvmbOzFxM3ziFPqbaBDtyfgusTrsj5KdG2HV
	2/5A==
X-Gm-Message-State: AHPjjUjB40ai5OPzs7/obem71JVUgEfC5LUNdvSwTdxJ6Mzn/k554Amj
	BV3z2eMPPeJRLVNK2uj1StI=
X-Google-Smtp-Source: AOwi7QCQ8e5+XHu0t9W+KWrux944OV77kkhIbGsHx6yPylnvEDsCDgao756TfioFbU5BZn3NbrY1Lw==
X-Received: by 10.99.119.11 with SMTP id s11mr735842pgc.398.1506504137161;
	Wed, 27 Sep 2017 02:22:17 -0700 (PDT)
Received: from virtx40 ([111.93.218.67]) by smtp.gmail.com with ESMTPSA id
	k25sm17604249pgf.13.2017.09.27.02.22.11
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 27 Sep 2017 02:22:15 -0700 (PDT)
Date: Wed, 27 Sep 2017 14:51:47 +0530
From: Linu Cherian <linuc.decode@gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20170927092147.GA32183@virtx40>
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
X-Received-From: 2607:f8b0:400e:c00::244
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
X-TUID: Droj8vmzLTmQ

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
> 
> Thanks

I am using git://linux-arm.org/linux-jpb.git branch virtio-iommu/v0.4.
Hope you are referring to the same.


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
