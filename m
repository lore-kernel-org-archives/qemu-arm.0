Received: by 10.223.172.38 with SMTP id v35csp4468031wrc;
        Wed, 27 Sep 2017 01:59:30 -0700 (PDT)
X-Received: by 10.200.40.146 with SMTP id i18mr822282qti.94.1506502770488;
        Wed, 27 Sep 2017 01:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506502770; cv=none;
        d=google.com; s=arc-20160816;
        b=QzPqqCxN9GPCYwg/ddZ3/9a6gbRoDwu4qkgzm5UxlSwmiDaU817goteJlkY9Jugvhf
         wBc85RjuRmi9HSkhVWMPjG/jTbyCQ91n74U+liDN8qLIei/I1xMc049p+V9KHmZe0IVC
         3Mo+EuUI+ag9rmJXRtzCjdOml9W1hDyr9aXayY5l9FIU6OH20WgrggFh8wwPmdwFW4iN
         N6C8daMjGb7edcq5hCdjdIyxaEni3D9t32pwwuQjXfDANoa65BBxT4UDL+uMMIHNrG7n
         mLT0My7cwEpxUIrX4INkcl1YHX1YiyHLDss9l4OtBCgaUZbKBp1ASgz7TL78VIUnfG+r
         JUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=udiiD4Q0ABJeAHLEhiCSVzQ/oTc0N2J6LLIgR9VnC2E=;
        b=ysS5La3hpmfEz0ePxzMgUQShtmmhi+WKmmJ9mB/V7cVXbFHDDfvxtS1XbwwZJdX4ic
         9vh8vNVGISKgWCpMrxFiSsKGElI/y5zxqxWOqrVuo6V7SUs3oHEf5xBV3EhQNyoOqQLY
         fgkCOELNH3N15ljuFYw0MB6mEWBb1iq4k2U+WnCOND1pVy3865iSVfIu5NB9CW23w9Wa
         B4tkDYDZSGYNmmwr/3NZR9HGy5FN9LZabsvRI6btKzdeckK60CMnkQ2tE6Xe9rFbGYLU
         sulVYqxmmj31OEdXtrkmYVWef/I/EhFT8hNH65dnFtP1oncZMFXw3d0n1zYfaLJ/PSQd
         mdEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sxP8TZzl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e65si10073734qtd.543.2017.09.27.01.59.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 01:59:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sxP8TZzl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx8Bk-0003Mo-41
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 04:59:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dx8BV-0003L7-AP
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 04:59:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dx8BR-0003UI-K3
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 04:59:13 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:38731)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linuc.decode@gmail.com>)
	id 1dx8BR-0003Tq-C2; Wed, 27 Sep 2017 04:59:09 -0400
Received: by mail-pg0-x242.google.com with SMTP id m30so8546096pgn.5;
	Wed, 27 Sep 2017 01:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=udiiD4Q0ABJeAHLEhiCSVzQ/oTc0N2J6LLIgR9VnC2E=;
	b=sxP8TZzlr5re48FwIHJRQAcWS/c60on5y9C5y1vMDyDlW6zeRND4kE3fYj6mtn2sJH
	oEAFAYLxE3WhEFHz05ipnTr9RJQF9YA5raNTG51BZgL5vRTnmjvL41JkSEHhnYopXyY4
	0CCNPfiJyOLlBoY/fKi9pdrD/Ne1sWM09aqDXDe59u39Ft1bwxnmbK1DTinkJgp7r5X0
	ecDQMgoBoY62o+eQIIyztTxbK4ktiZKMhfA25X8xkg1lvq4XtRRZshQZvgXkLX+ldc/a
	eY8oYd8xzNh2u5eNXtXt5F4wKwu+PbGqCL3EBbGiFrnQgbU7fkOqrbBycBHEP5Dkb4XS
	Zbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=udiiD4Q0ABJeAHLEhiCSVzQ/oTc0N2J6LLIgR9VnC2E=;
	b=hrWQpIiqkvUvyNbeCYU6gxjgave9zlBGbtDV+m0TU+dEzH8Xy0WjeL8JhT/6Cn5rTE
	VJNkkdX6dp+GpeHLpzUiTZLOEu9Iouoh7b/rKnJyV13pnXYUsVCHrEk2S9u76vadJkTt
	M9y5Oz+JliFHrC7ebzouuSSMgl80M0ljNrL3c0E4LjbvWxRv+8dSj8KtCtfWDuyivrrF
	a850GTgLkQJSTe3UE0Irm2MzFy/eP8VnDjxVpaFwTkw5jMSx2js1DpPH687/NexgyaQ4
	gxrGZetp+lQqNf8EfAxO4wX2OhCYKWAp/YvSWnXhSqe7s9v5m2It6xq6CmjUGILwpa4c
	V+tA==
X-Gm-Message-State: AHPjjUgRaKMzxMYoJ3vDEi2zkypa5eKUK44aMkBADjSdQwaKfQn9bPLY
	QKnpA+xl/6pR5At14QqP/Tn7ijWB
X-Google-Smtp-Source: AOwi7QCiahr2npoNc6/iR5mESfO5jDc0NNdEniVvbe8iCxz6nLQ8yDkPX/nOxKrNf0pkpwvaM0ySQA==
X-Received: by 10.101.91.66 with SMTP id y2mr709921pgr.235.1506502748118;
	Wed, 27 Sep 2017 01:59:08 -0700 (PDT)
Received: from virtx40 ([111.93.218.67]) by smtp.gmail.com with ESMTPSA id
	a1sm21447492pgu.47.2017.09.27.01.59.02
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 27 Sep 2017 01:59:07 -0700 (PDT)
Date: Wed, 27 Sep 2017 14:28:38 +0530
From: Linu Cherian <linuc.decode@gmail.com>
To: Bharat Bhushan <bharat.bhushan@nxp.com>
Message-ID: <20170927085838.GA32011@virtx40>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
	<20170927074109.GA31587@virtx40>
	<AM5PR0401MB25450ACC804B20D93C4F2D9D9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM5PR0401MB25450ACC804B20D93C4F2D9D9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
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
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yiCBo0FCj9xG

On Wed Sep 27, 2017 at 08:30:51AM +0000, Bharat Bhushan wrote:
> Hi,
> 
> > -----Original Message-----
> > From: Linu Cherian [mailto:linuc.decode@gmail.com]
> > Sent: Wednesday, September 27, 2017 1:11 PM
> > To: Bharat Bhushan <bharat.bhushan@nxp.com>
> > Cc: eric.auger@redhat.com; eric.auger.pro@gmail.com;
> > peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
> > qemu-arm@nongnu.org; qemu-devel@nongnu.org; kevin.tian@intel.com;
> > marc.zyngier@arm.com; tn@semihalf.com; will.deacon@arm.com;
> > drjones@redhat.com; robin.murphy@arm.com; christoffer.dall@linaro.org;
> > bharatb.yadav@gmail.com
> > Subject: Re: [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO integration
> > 
> > Hi,
> > 
> > On Wed Sep 27, 2017 at 12:03:15PM +0530, Bharat Bhushan wrote:
> > > This patch series integrates VFIO/VHOST with virtio-iommu.
> > >
> > > This version is mainly about rebasing on v4 version on virtio-iommu
> > > device framework from Eric Augur and addresing review comments.
> > >
> > > This patch series allows PCI pass-through using virtio-iommu.
> > >
> > > This series is based on:
> > >  - virtio-iommu kernel driver by Jean-Philippe Brucker
> > >     [1] [RFC] virtio-iommu version 0.4
> > >     git://linux-arm.org/virtio-iommu.git branch viommu/v0.4
> > >
> > >  - virtio-iommu device emulation by Eric Augur.
> > >    [RFC v4 00/16] VIRTIO-IOMMU device
> > >    https://github.com/eauger/qemu/tree/v2.10.0-virtio-iommu-v4
> > >
> > > Changes are available at : https://github.com/bharaty/qemu.git
> > > virtio-iommu-vfio-integration-v4
> > >
> > 
> > # With the above sources, was trying to test the vfio-pci device assigned to
> >   guest using Qemu.
> > # Both guest and host kernels are configured with 4k as page size.
> > # releavant qemu command snippet,
> >   -device virtio-iommu-device -device virtio-blk-device,drive=hd0 \
> >   -net none -device vfio-pci,host=xxx
> > 
> > 
> > On guest booting, observed mutliple messages as below,
> > 
> > qemu-system-aarch64: iommu has granularity incompatible with target AS
> > 
> > # On adding necessary prints, 0x5000 is len, 0x4fff is address mask
> >   and the code expects the address mask to be 0xfff.
> 
> I have not seen these errors, I am also using 4K page-size on both host and guest. Can you share compete qemu command and log. 

Qemu cmd:

qemu-system-aarch64 -machine virt,gic_version=3 -cpu host -enable-kvm -nographic
 -smp 8 -m 1024 -kernel /boot/Image --append "console=ttyAMA0 root=/dev/vda rw" 
-drive if=none,file=/home/ubuntu/fs_images/ubu1604.img,id=hd0,format=raw 
-device virtio-iommu-device -device virtio-blk-device,drive=hd0 -net none -device vfio-pci,host=0002:01:00.3


Qemu log:
qemu-system-aarch64: iommu has granularity incompatible with target AS
qemu-system-aarch64: iommu has granularity incompatible with target AS
qemu-system-aarch64: iommu has granularity incompatible with target AS
qemu-system-aarch64: iommu has granularity incompatible with target AS
qemu-system-aarch64: iommu has granularity incompatible with target AS
qemu-system-aarch64: iommu has granularity incompatible with target AS
...





> 
> Thanks
> -Bharat
> 
> > 
> > if (len & iotlb->addr_mask) {
> >         error_report
> > 
> > # vfio_dma_map is failing due to this error.
> > 
> > Any pointers ?
> > 
> > 
> > > v3->v4:
> > >  - Rebase to v4 version from Eric
> > >  - Fixes from Eric with DPDK in VM
> > >  - Logical division in multiple patches
> > >
> > > v2->v3:
> > >  - This series is based on "[RFC v3 0/8] VIRTIO-IOMMU device"
> > >    Which is based on top of v2.10-rc0 that
> > >  - Fixed issue with two PCI devices
> > >  - Addressed review comments
> > >
> > > v1->v2:
> > >   - Added trace events
> > >   - removed vSMMU3 link in patch description
> > >
> > > Bharat Bhushan (5):
> > >   target/arm/kvm: Translate the MSI doorbell in
> > kvm_arch_fixup_msi_route
> > >   virtio-iommu: Add iommu notifier for map/unmap
> > >   virtio-iommu: Call iommu notifier for attach/detach
> > >   virtio-iommu: add iommu replay
> > >   virtio-iommu: add iommu notifier memory-region
> > >
> > >  hw/virtio/trace-events           |   5 ++
> > >  hw/virtio/virtio-iommu.c         | 181
> > ++++++++++++++++++++++++++++++++++++++-
> > >  include/hw/virtio/virtio-iommu.h |   6 ++
> > >  target/arm/kvm.c                 |  27 ++++++
> > >  target/arm/trace-events          |   3 +
> > >  5 files changed, 219 insertions(+), 3 deletions(-)
> > >
> > > --
> > > 1.9.3
> > >
> > >
> > 
> > --
> > Linu cherian

-- 
Linu cherian
