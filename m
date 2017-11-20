Received: by 10.223.153.116 with SMTP id x107csp753881wrb;
        Mon, 20 Nov 2017 07:58:09 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZNb91JKCjTX7Fg4M+gJO0yVg6GZLDUtWlBFipNwB1YIwZCtanknETLSNImaT5J9yNkiy/Y
X-Received: by 10.37.35.81 with SMTP id j78mr8359345ybj.517.1511193489487;
        Mon, 20 Nov 2017 07:58:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511193489; cv=none;
        d=google.com; s=arc-20160816;
        b=KCGVg36rpnemjrBP4N855Ij/bZL7vLMADV5YsJ8pDEkImIXf+qAXfcNL1qcf7NGoln
         LKTHW8WCHxrp1wJyVAQDVWyGhCKNkK96CRU9hgKcjbY9VQdZZs8SzCTgM2EhgSN6VFhW
         Tp581D8EV3oGu+9IBZmipq+BEz+a6iF6i1IquECbgdR77b7+ZOp8ywDLH/Z5tNGITPWj
         abhernoMHAmAk7m/NO/4FmcECptbCT58OvNLI1XmjKdw43OoCqhg9Sg5a+Zn01UCOB+X
         laS1cjH/QxdnPFrz4ufbDSnLokYgo7NauK5ESbpmrrLC2XXzCL07g6artkzgFcoSuBvc
         ZFeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=+9o+9oC7umZKwe6MgVQYxLfOOOniIP9NQ5eow/lP4vc=;
        b=Pb98Q7hunk4XAi4VeXybKP0J03KhUQR3SU1EkOBQp5mb5PD6bdMYkFa52GuhkCPmQ3
         3OHgZPCHaIbxlEykIWudoiSEH4mhga2Zh2/vYWMIHw5S2hX1w03r1kwbzAgFY9Ha1Fmq
         MHYYcCTNIvfDu4O/4qMGO9532IoHbpb/ZGbRjtOPoOa853TrUfg773E1CoSo+nDbG1E/
         2J/iTC4YwLKC2SZ90DXOV/OTVmPdBTkf/dUGEUnIDY0nLjZNsHn7sQsM5oL4UEd9ZxWz
         vNn7FYYzIITmrqPfog4GVl81P2iGaU/7tGcdg7L2PwOOF9bsUFU68+ohSn7GQwwOzSVH
         sXYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e78si2245319ywa.638.2017.11.20.07.58.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Nov 2017 07:58:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eGoSW-0002OF-VK
	for alex.bennee@linaro.org; Mon, 20 Nov 2017 10:58:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1eGoSI-0002Ki-Pl
	for qemu-arm@nongnu.org; Mon, 20 Nov 2017 10:57:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1eGoSE-000696-Pg
	for qemu-arm@nongnu.org; Mon, 20 Nov 2017 10:57:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42802)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1eGoSE-00068M-Gz; Mon, 20 Nov 2017 10:57:50 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B36A380C14;
	Mon, 20 Nov 2017 15:57:48 +0000 (UTC)
Received: from t450s.home (ovpn-116-16.phx2.redhat.com [10.3.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0339600CC;
	Mon, 20 Nov 2017 15:57:45 +0000 (UTC)
Date: Mon, 20 Nov 2017 08:57:45 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20171120085745.0147df5c@t450s.home>
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA8384704C0@FRAEML521-MBX.china.huawei.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-2-git-send-email-zhuyijun@huawei.com>
	<20171114084735.68e87546@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA83845EDBF@FRAEML521-MBX.china.huawei.com>
	<20171115112513.3c035023@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA8384704C0@FRAEML521-MBX.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 20 Nov 2017 15:57:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 1/5] hw/vfio: Add function for
 getting reserved_region of device iommu group
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
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Zhaoshenglong <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fj1HbAj7mSzF

On Mon, 20 Nov 2017 11:58:43 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> > -----Original Message-----
> > From: Alex Williamson [mailto:alex.williamson@redhat.com]
> > Sent: Wednesday, November 15, 2017 6:25 PM
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: Zhuyijun <zhuyijun@huawei.com>; qemu-arm@nongnu.org; qemu-
> > devel@nongnu.org; eric.auger@redhat.com; peter.maydell@linaro.org;
> > Zhaoshenglong <zhaoshenglong@huawei.com>
> > Subject: Re: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
> > reserved_region of device iommu group
> > 
> > On Wed, 15 Nov 2017 09:49:41 +0000
> > Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:
> >   
> > > Hi Alex,
> > >  
> > > > -----Original Message-----
> > > > From: Alex Williamson [mailto:alex.williamson@redhat.com]
> > > > Sent: Tuesday, November 14, 2017 3:48 PM
> > > > To: Zhuyijun <zhuyijun@huawei.com>
> > > > Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> > > > eric.auger@redhat.com; peter.maydell@linaro.org; Shameerali Kolothum
> > > > Thodi <shameerali.kolothum.thodi@huawei.com>; Zhaoshenglong
> > > > <zhaoshenglong@huawei.com>
> > > > Subject: Re: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
> > > > reserved_region of device iommu group
> > > >
> > > > On Tue, 14 Nov 2017 09:15:50 +0800
> > > > <zhuyijun@huawei.com> wrote:
> > > >  
> > > > > From: Zhu Yijun <zhuyijun@huawei.com>
> > > > >
> > > > > With kernel 4.11, iommu/smmu will populate the MSI IOVA reserved
> > > > > window and PCI reserved window which has to be excluded from Guest  
> > iova  
> > > > allocations.  
> > > > >
> > > > > However, If it falls within the Qemu default virtual memory address
> > > > > space, then reserved regions may get allocated for a Guest VF DMA iova
> > > > > and it will fail.
> > > > >
> > > > > So get those reserved regions in this patch and create some holes in
> > > > > the Qemu ram address in next patchset.
> > > > >
> > > > > Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
> > > > > ---
> > > > >  hw/vfio/common.c              | 67  
> > > > +++++++++++++++++++++++++++++++++++++++++++  
> > > > >  hw/vfio/pci.c                 |  2 ++
> > > > >  hw/vfio/platform.c            |  2 ++
> > > > >  include/exec/memory.h         |  7 +++++
> > > > >  include/hw/vfio/vfio-common.h |  3 ++
> > > > >  5 files changed, 81 insertions(+)  
> > > >
> > > > I generally prefer the vfio interface to be more self sufficient, if there are
> > > > regions the IOMMU cannot map, we should be describing those via  
> > capabilities  
> > > > on the container through the vfio interface.  If we're just scraping together
> > > > things from sysfs, the user can just as easily do that and provide an explicit
> > > > memory map for the VM taking the devices into account.  
> > >
> > > Ok. I was under the impression that the purpose of introducing the
> > > /sys/kernel/iommu_groups/reserved_regions was to get the IOVA regions
> > > that are reserved(MSI or non-mappable) for Qemu or other apps to
> > > make use of.  I think this was introduced as part of the "KVM/MSI passthrough
> > > support on ARM" patch series. And if I remember correctly, Eric had
> > > an approach where the user space can retrieve all the reserved regions  
> > through  
> > > the VFIO_IOMMU_GET_INFO ioctl and later this idea was replaced with the
> > > sysfs interface.
> > >
> > > May be I am missing something here.  
> > 
> > And sysfs is a good interface if the user wants to use it to configure
> > the VM in a way that's compatible with a device.  For instance, in your
> > case, a user could evaluate these reserved regions across all devices in
> > a system, or even across an entire cluster, and instantiate the VM with
> > a memory map compatible with hotplugging any of those evaluated
> > devices (QEMU implementation of allowing the user to do this TBD).
> > Having the vfio device evaluate these reserved regions only helps in
> > the cold-plug case.  So the proposed solution is limited in scope and
> > doesn't address similar needs on other platforms.  There is value to
> > verifying that a device's IOVA space is compatible with a VM memory map
> > and modifying the memory map on cold-plug or rejecting the device on
> > hot-plug, but isn't that why we have an ioctl within vfio to expose
> > information about the IOMMU?  Why take the path of allowing QEMU to
> > rummage through sysfs files outside of vfio, implying additional
> > security and access concerns, rather than filling the gap within the
> > vifo API?    
> 
> Thanks Alex for the explanation. 
> 
> I came across this patch[1] from Eric where he introduced the IOCTL interface to
> retrieve the reserved regions. It looks like this can be reworked to accommodate 
> the above requirement.

I don't think we need a new ioctl for this, nor do I think that
describing the holes is the correct approach.  The existing
VFIO_IOMMU_GET_INFO ioctl can be extended to support capability chains,
as we've done for VFIO_DEVICE_GET_REGION_INFO.  IMO, we should try to
describe the available fixed IOVA regions which are available for
mapping rather than describing various holes within the address space
which are unavailable.  The latter method always fails to describe the
end of the mappable IOVA space and gets bogged down in trying to
classify the types of holes that might exist.  Thanks,

Alex
