Received: by 10.223.197.9 with SMTP id q9csp5556375wrf;
        Wed, 4 Oct 2017 04:49:40 -0700 (PDT)
X-Received: by 10.200.23.36 with SMTP id w33mr2986376qtj.50.1507117780499;
        Wed, 04 Oct 2017 04:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507117780; cv=none;
        d=google.com; s=arc-20160816;
        b=l/6uF/c5lYMvo3zVqQBIc2Pf7mjSd+CDCZCK7GFwwm/XfQTJGyiX1rpeEwrY6pxEdq
         jhb2p6la4VRdbULKuSa/5hqrPhfpRYQxf0poNVk71+64MREULa9Rhg6BeaXV+DHIdYUD
         hBx9JQH1+jhNTli99LNYwA1tp0moAQtc5pIAsccSxZDYujBpykL5W43MbQ2kh6DIf6VS
         3zs4+TW6ex7FdCEG58KJOwQX3AdHzsdRdp/Bffsxbk4Y2uqrF1XPB5pedD6pTMBnIzvV
         t/3ExhZDDxJFZcKdiqqk0JUQy8pSpggSquVnQCqXpjRK9rCe8CMIjTPt9AQR0GvDplSY
         8hGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=6eMqCb7SOJ1LmDwACqMO7RKL9LMgn+8bobmYRMY8p1w=;
        b=09LUlbiS89PzUJiW/xouLvKgMbrhw+3utL3mgEBDJut3GbM4XRS4hJumHPewg3OgYp
         cAKoY2Gf8kARynVHdG0AsIuJoipWCyEuK3XbtGZzRXTK1f0jiugm8+3j/hLAF5VVUxru
         DUV3hFPyxGrseLqIh7wzNxNwhZ+tLgUcv1CF8jHnpCJysVvijBdxK316ezPrA1ZMxl4N
         kmuU4aBJNIHmZVSDloquHgJdQnh4Hxx2zHg59BgBx3ZZsHnZWuHMr3fAy/R4ui6tnw+L
         B8kT+y48SNoMccezHZU9bwilcLSEBW+I7Kw1JUNs3+sDkluHIvGq1pqUFO1jd83bHmnQ
         s6og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Io88f86z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w198si579534qkw.302.2017.10.04.04.49.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 04:49:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Io88f86z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dziBH-00053r-Tv
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 07:49:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dziB5-00051p-2g
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 07:49:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dziB1-00065C-Ax
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 07:49:27 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:36295)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linuc.decode@gmail.com>)
	id 1dziB1-00064m-4O; Wed, 04 Oct 2017 07:49:23 -0400
Received: by mail-pf0-x242.google.com with SMTP id f84so12165766pfj.3;
	Wed, 04 Oct 2017 04:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6eMqCb7SOJ1LmDwACqMO7RKL9LMgn+8bobmYRMY8p1w=;
	b=Io88f86zJV8yq5SU1mXT0A8ZcE4eYldNsY6BI0YyRzntY6bbFxNsCBlztBIt9v3Kjq
	vaj469Tv4bxuY/1la5+3m9Donr5+5YOK+dhzZKT3tdWiroQ+ZF4c6EYA+3UhHc8ye6dR
	yReM4vF2rle4aWlH/DiJPUJWx60vKbQkmOqp2P2lRk51+ZH9Z2At8hqSVdfyLl5vyz8W
	yidj4Bfn02cgk32sTyfK86O+R22GvowFp93MpPHDwkcWDu5MQdkWhQ1y/w8W5jO3vJIw
	KNGF873sYrLRhJi5wrXOChz14waYYl3uWAmi5R7XwmG8/AF8jpnAH2IBgO03h13WEIJU
	sIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6eMqCb7SOJ1LmDwACqMO7RKL9LMgn+8bobmYRMY8p1w=;
	b=nhbMRmIr8Qlxnn4zJVNtGMr7KqbLjccRSRaTSDqd7+qE9O6OQw4LMSKKZJbvA3/cks
	ChwQuKGhtQlehSXTwNf1a69/TmOQB58q5Pf+2ieI/+0XLyxKgyL+9dV0HQEqPqMvzhm6
	rm2XneFegQ8YGct15t2xcavjTLf2Pin5Mwy7/h9uAUQ7GmFyWMkWN6banMLR73+ugNrD
	vKEAjYa42TR78qwMsadlKSeYOvKjq+uyitUtb8ivyFQ4UCqNX53TYhulnoKugIc40moV
	R1gmlntqIBNUXjA5e6QEJKx3/8X0v0XgC+aouxOOSsv7nVaL5I5XGfaVOLpXpqINLQl1
	/QGw==
X-Gm-Message-State: AHPjjUgKpe4q+bNvs8sBMcMyTPfzGvB862v1N1LTurSsV9K4G6oNiak7
	x0gK52vnMYliSINEPjBkDvM=
X-Google-Smtp-Source: AOwi7QCZB1tyt+at2eG5rNWVl0qQ8Cbr2rfkv6/yOd/nbPF/bTdOK1HBf0laKDkhMcISbJngN0EQ9g==
X-Received: by 10.84.194.1 with SMTP id g1mr19750532pld.74.1507117761538;
	Wed, 04 Oct 2017 04:49:21 -0700 (PDT)
Received: from virtx40 ([111.93.218.67]) by smtp.gmail.com with ESMTPSA id
	c185sm27376961pfb.57.2017.10.04.04.49.16
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 04 Oct 2017 04:49:20 -0700 (PDT)
Date: Wed, 4 Oct 2017 17:19:11 +0530
From: Linu Cherian <linuc.decode@gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20171004114910.GA6932@virtx40>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
	<20170927074109.GA31587@virtx40>
	<AM5PR0401MB25450ACC804B20D93C4F2D9D9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<9700cf30-65ed-9c55-c1b9-14bb8deb669f@redhat.com>
	<20170927092147.GA32183@virtx40>
	<0af599c0-f859-f90c-c999-bc4a0a678768@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0af599c0-f859-f90c-c999-bc4a0a678768@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
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
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, linu.cherian@cavium.com,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R6Izt/BRHqDZ

Hi Eric,


On Wed Sep 27, 2017 at 11:24:01AM +0200, Auger Eric wrote:
> Hi Linu,
> 
> On 27/09/2017 11:21, Linu Cherian wrote:
> > On Wed Sep 27, 2017 at 10:55:07AM +0200, Auger Eric wrote:
> >> Hi Linu,
> >>
> >> On 27/09/2017 10:30, Bharat Bhushan wrote:
> >>> Hi,
> >>>
> >>>> -----Original Message-----
> >>>> From: Linu Cherian [mailto:linuc.decode@gmail.com]
> >>>> Sent: Wednesday, September 27, 2017 1:11 PM
> >>>> To: Bharat Bhushan <bharat.bhushan@nxp.com>
> >>>> Cc: eric.auger@redhat.com; eric.auger.pro@gmail.com;
> >>>> peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
> >>>> qemu-arm@nongnu.org; qemu-devel@nongnu.org; kevin.tian@intel.com;
> >>>> marc.zyngier@arm.com; tn@semihalf.com; will.deacon@arm.com;
> >>>> drjones@redhat.com; robin.murphy@arm.com; christoffer.dall@linaro.org;
> >>>> bharatb.yadav@gmail.com
> >>>> Subject: Re: [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO integration
> >>>>
> >>>> Hi,
> >>>>
> >>>> On Wed Sep 27, 2017 at 12:03:15PM +0530, Bharat Bhushan wrote:
> >>>>> This patch series integrates VFIO/VHOST with virtio-iommu.
> >>>>>
> >>>>> This version is mainly about rebasing on v4 version on virtio-iommu
> >>>>> device framework from Eric Augur and addresing review comments.
> >>>>>
> >>>>> This patch series allows PCI pass-through using virtio-iommu.
> >>>>>
> >>>>> This series is based on:
> >>>>>  - virtio-iommu kernel driver by Jean-Philippe Brucker
> >>>>>     [1] [RFC] virtio-iommu version 0.4
> >>>>>     git://linux-arm.org/virtio-iommu.git branch viommu/v0.4
> >>
> >> Just to make sure, do you use the v0.4 virtio-iommu driver from above
> >> branch?
> >>
> >> Thanks
> > 
> > I am using git://linux-arm.org/linux-jpb.git branch virtio-iommu/v0.4.
> > Hope you are referring to the same.
> 
> Yes that's the right one. I will also investigate on my side this afternoon.
> 
> Thanks
> 
> Eric

With the below workaround, atleast ping works for me.

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 249964a..2904617 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
        .attach_dev             = viommu_attach_dev,
        .map                    = viommu_map,
        .unmap                  = viommu_unmap,
-       .map_sg                 = viommu_map_sg,
+       .map_sg                 = default_iommu_map_sg,
        .iova_to_phys           = viommu_iova_to_phys,
        .add_device             = viommu_add_device,
        .remove_device          = viommu_remove_device,


Looks like the qemu backend doesnt have support to handle the map requests from 
virtio_iommu_map_sg, since it  merges multiple map requests into one with 
mapsize larger than page size(for eg. 0x5000). 

Atleast vfio_get_vaddr called from vfio_iommu_map_notify in Qemu expects 
the map size to be a power of 2.

 if (len & iotlb->addr_mask) {
        error_report("iommu has granularity incompatible with target AS");
        return false;
    }

Just trying to understand how this is not hitting in your case. 
 
-- 
Linu cherian
