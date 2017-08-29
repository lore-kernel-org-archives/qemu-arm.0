Received: by 10.223.188.70 with SMTP id a6csp6245466wrh;
        Tue, 29 Aug 2017 10:06:54 -0700 (PDT)
X-Received: by 10.200.26.239 with SMTP id h44mr6708410qtk.270.1504026414297;
        Tue, 29 Aug 2017 10:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504026414; cv=none;
        d=google.com; s=arc-20160816;
        b=BKK7AS06f+5pGIsxvAscQENS9D1GGOAs2HXhMKCSLdlSBKgh1bjix+up+EhWVxUIgn
         3uneE6gHl4JEyLhugQJXwtIJ+rDF7WhZ4HdaAbGab9+v2G/doXui42DCbDDUej/vxX0V
         446XttcBkhPhgmM9fE90uJDdWB7ALIMWv60zz7yQS1Fi3U9GGuB+NA0/1jdbDDG+KNzt
         +tF2US2mS6ECbTSzGd42si5cMZV042TGFShc4Pqn9UCw9q4q+XEhX+om7guepzWdF4pp
         ZA7OmguHcqgxhpv1Je6DDByGP6qdgYG7IIPv8ydKxNkjRJ2ni1VFLT/Sa/zjKLeOilFN
         GgmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=jXvf8iSmtBPWk6QCl9PSMt2g6/xg709lpx2ZZjm1OPA=;
        b=EStFcypSEWHpCOAkUISBlt9XWViyUSfElDIGwlZqQH0seF8+EDfKWyYHAXzoeVLAB9
         z2hZmFaXU7J3wyuSebJ7HTN+8/CQhGrlivmcjrF4O6Q+f55ib/TfsZjYy90poH6MipLY
         OOMJTKRkviUMD60fLM9P7tNJts2gKVpi354FbmGvBhWllo0VLLNMZz9JPiMd6xj7PaXa
         X+sMczNZMYm1/HWhlLd9GMvCHIxALDSgqMyK9F8HdrVxhqTAu0y9OaqN71tj2U0epf2E
         8MkCAA7+XCyBJrnYIhqrPqspO5qWWOS6kqx74GUWjXt0UgluHdGMHp88jf94JRdpabqQ
         9bvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cz1gT97x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g23si3344758qte.73.2017.08.29.10.06.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 10:06:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cz1gT97x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46176 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmjyV-0002YP-S4
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 13:06:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dmjyO-0002Y6-Pm
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 13:06:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dmjyL-0001RI-Lp
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 13:06:44 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:38574)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linuc.decode@gmail.com>)
	id 1dmjyL-0001QL-Fl; Tue, 29 Aug 2017 13:06:41 -0400
Received: by mail-pf0-x244.google.com with SMTP id r187so2694160pfr.5;
	Tue, 29 Aug 2017 10:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jXvf8iSmtBPWk6QCl9PSMt2g6/xg709lpx2ZZjm1OPA=;
	b=cz1gT97x0BiVRRave4z2mIH1ob3CcU4y9+XwyhWegU+CwOxp4xib3Wg+e/xhroPxFa
	opjs+1+VV99liqyvDuACGe1BLleAXtfD1se/62fudzQ6fUe76YWDZcRNGeU6SgyUAh4l
	hedTV3nyOVXc96mWbTsKbSJJG6Pavqt4uR/v4a7+cF/4B+xOXiITb+A2AknY3+JurTEU
	TzJw2oo5A+cV15rTjKScCZaioHHJ1wCQ5yjF7/AMJbXGiN2kcXdkyktJFJUo9OxoxT/d
	I+OoGxPTOYHSFO3jcJ70+5INYe9aqADxxqEXFkayXTVDle1U+eCqMLygtcnLTAVHyJxT
	6bFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jXvf8iSmtBPWk6QCl9PSMt2g6/xg709lpx2ZZjm1OPA=;
	b=jMSBfLt/NeLYs8oacP1RloJFp6tRb613Sf6pBeSAXb1zv9nNX5a7k6q/VQ6/oeCInR
	3ZexBHrBgOfpoMB0oIW+SPq1eET2NqnBjsxik0vkSH3fxFS5l8sRS6LotaE1pI/RD0Jq
	9k98f6W0cNuwbkmkOLWwSuELmRDSmGcs9H+EHS0jFezBmEqRGr39ya1R8o/Hp5z6E1YP
	7GA9BzNlW9bp+mZLf1z4/5UfWsJ6eBu085Tag151pHJfy9z1KfVnQ7d/je1J8HxE4vUC
	P5pDZQIuOdSJIE2INN+2uFSiKG69hURVlXrxm5+aH8Dtr1IdICzC6uE8C1Sz88VvxUDq
	hMag==
X-Gm-Message-State: AHYfb5iF4Lvt9RP0iSB20zb8P7b4DcPA2XPDkKD+z9Na9QLP3JCuF6Nj
	6gVR86X11Heu1g==
X-Received: by 10.98.58.220 with SMTP id v89mr999625pfj.19.1504026399129;
	Tue, 29 Aug 2017 10:06:39 -0700 (PDT)
Received: from virtx40 ([111.93.218.67]) by smtp.gmail.com with ESMTPSA id
	u187sm5454528pfu.140.2017.08.29.10.06.33
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 29 Aug 2017 10:06:37 -0700 (PDT)
Date: Tue, 29 Aug 2017 22:36:30 +0530
From: Linu Cherian <linuc.decode@gmail.com>
To: Bharat Bhushan <Bharat.Bhushan@nxp.com>
Message-ID: <20170829170630.GA2622@virtx40>
References: <1503312534-6642-1-git-send-email-Bharat.Bhushan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1503312534-6642-1-git-send-email-Bharat.Bhushan@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: Re: [Qemu-arm] [PATCH v3 0/2] virtio-iommu: VFIO integration
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
	qemu-arm@nongnu.org, linu.cherian@cavium.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jg962PMjAnLU

Hi,

On Mon Aug 21, 2017 at 04:18:52PM +0530, Bharat Bhushan wrote:
> This V3 version is mainly about rebasing on v3 version on Virtio-iommu device
> framework from Eric Augur and addresing review comments.
> 
> This patch series allows PCI pass-through using virtio-iommu.
>   
> This series is based on:
>  - virtio-iommu specification written by Jean-Philippe Brucker
>    [RFC 0/3] virtio-iommu: a paravirtualized IOMMU,
>  
>  - virtio-iommu driver by Jean-Philippe Brucker
>    [RFC PATCH linux] iommu: Add virtio-iommu driver
>  
>  - virtio-iommu device emulation by Eric Augur.
>    [RFC v3 0/8] VIRTIO-IOMMU device
> 
> PCI device pass-through and virtio-net-pci is tested with these changes using dma-ops
> 

Facing issues while trying to test with VFIO.

vfio_dma_map fails as below, 
qemu-system-aarch64: vfio_dma_map(0x1ff0da0, 0xfdfc7000, 0x1000, 0xffff79acc000) = -22 (Invalid argument)
Very likely this seem to be an issue with map size. Kernel PAGE_SIZE 
is 64k on my host and hence the map size for the physical SMMU also will
start with 64k. 

Qemu source: https://github.com/eauger/qemu.git + this patch series
             on branch v2.10.0-rc0-virtio-iommu-rfcv3
Linux source: git://linux-arm.org/linux-jpb.git
             on branch virtio-iommu/v0.1
Any pointers ?

The other related questions i had,
1.  In, virtio_iommu_device_realize in qemu,
   s->config.page_sizes = TARGET_PAGE_MASK;

  Same is being taken as pgsize_bitmap in virtio_iommu guest kernel driver.
  In, viommu_probe 
  virtio_cread(vdev, struct virtio_iommu_config, page_sizes,
                     &viommu->pgsize_bitmap);

  Should s->config.page_sizes be initialized with page bitmap instead
  of page mask ?

2. Should we not populate the supported page sizes based on  
   host kernel size and SMMU hardware capability rather than 
   based on the machine emulated on qemu? Atleast that makes
   sense for VFIO case.

> This patch series does not implement RESV_MEM changes proposal by Jean-Philippe "https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg01796.html"
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
> Bharat Bhushan (2):
>   target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
>   virtio-iommu: vfio integration with virtio-iommu
> 
>  hw/virtio/trace-events           |   5 ++
>  hw/virtio/virtio-iommu.c         | 163 +++++++++++++++++++++++++++++++++++++++
>  include/hw/virtio/virtio-iommu.h |   6 ++
>  target/arm/kvm.c                 |  27 +++++++
>  target/arm/trace-events          |   3 +
>  5 files changed, 204 insertions(+)
> 
> -- 
> 1.9.3
> 
> 

-- 
Linu cherian
