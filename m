Received: by 10.223.139.210 with SMTP id w18csp28192wra;
        Mon, 20 Nov 2017 08:31:50 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYTycOdh+WKQ+LyMZwJAudxLPXAy0HicOdcmZDk76iBPmQsyV7DPlvzcefPfXi+rJtGKsDt
X-Received: by 10.13.229.131 with SMTP id o125mr8694945ywe.377.1511195510735;
        Mon, 20 Nov 2017 08:31:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511195510; cv=none;
        d=google.com; s=arc-20160816;
        b=RBiceZrnx2uk2rcOFuYcV73rQY2OJ/BK5Z5Fqynq4CpC3ybSRMkZrgETz7YMwLBYze
         9EqwozCvcVLACZRQe2ovPqoA3+NlryvIYl9noPg4d7Gw/8BTBySsuJBmQyyxxgTiW8Vm
         3ck+xiL8LF/PKNb7lQ5YHpwM+ewE84FSnF3Ed38e+DWY7BxzerF+EMg6u4k5YHU7R6Ov
         k0nmRL0iiHRtm6A5Bhji7To92OozuiZiuPn03obJGfwXM/iFbTvgkPVx4S1FW0yivkqz
         xeNVhvSUjLFyliW/6S/+6aVZ4GFEMNM6dNs1ezQyiQeLVAVmk3gAbbEliRErpYs5HSD9
         ucZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=gm6qOQ2z91vbxbH9Hnwl0HUkOJz2GZ3bfz+mTQ3Pm8A=;
        b=WEHSeyJU8i+VrEd1hXhJ4tpE4YUqeIjU9ujjP1iL6tCDvd99Q+tGfzKdfb55X0HzAE
         dT9nooKITP/MyMO2kopwroh4//FJ/4NQDm/LcGNFlc66PyubzrqgDBYiEIJhtwxxhKEp
         rDdWtb8X88blZSFl9UWq6HF/93HN403QX8QsUiEebQs1vkyA+h0IB1GorI3fKPZcb7CN
         YQadsfIG4nfjLpUXrkHfYx0DPaasWgB/41E4L3DWNN+mxZEi5POqQSq1iffrR75X1qIH
         JGuFeD42nk0H7ZJZ/TrNhcr2vrqkToYE1HeoNR4d3rDmpshIsNYxGbNDvEVHv5QCD42Z
         ROFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a7si2330900ywm.133.2017.11.20.08.31.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Nov 2017 08:31:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eGoz8-0006Lk-24
	for alex.bennee@linaro.org; Mon, 20 Nov 2017 11:31:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eGoyr-0006K0-7g
	for qemu-arm@nongnu.org; Mon, 20 Nov 2017 11:31:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eGoyo-0005CQ-2O
	for qemu-arm@nongnu.org; Mon, 20 Nov 2017 11:31:33 -0500
Received: from lhrrgout.huawei.com ([194.213.3.17]:31101 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eGoyn-0005Bv-O3; Mon, 20 Nov 2017 11:31:30 -0500
Received: from LHREML710-CAH.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id 73E60B2D1D382;
	Mon, 20 Nov 2017 16:31:26 +0000 (GMT)
Received: from FRAEML702-CAH.china.huawei.com (10.206.14.33) by
	LHREML710-CAH.china.huawei.com (10.201.108.33) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 20 Nov 2017 16:31:27 +0000
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.156]) by
	fraeml702-cah.china.huawei.com ([10.206.14.33]) with mapi id
	14.03.0361.001; Mon, 20 Nov 2017 17:31:18 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>
Thread-Topic: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
	reserved_region of device iommu group
Thread-Index: AQHTXOYm3ZL42BZvgkuK5iju3HzTnqMT9TeAgAE4uHCAAIWogIAHZLxQgABNuYCAABLrkA==
Date: Mon, 20 Nov 2017 16:31:17 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8384726CE@FRAEML521-MBX.china.huawei.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-2-git-send-email-zhuyijun@huawei.com>
	<20171114084735.68e87546@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA83845EDBF@FRAEML521-MBX.china.huawei.com>
	<20171115112513.3c035023@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA8384704C0@FRAEML521-MBX.china.huawei.com>
	<20171120085745.0147df5c@t450s.home>
In-Reply-To: <20171120085745.0147df5c@t450s.home>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.213.3.17
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
X-TUID: NnKjI5EPmBMG



> -----Original Message-----
> From: Alex Williamson [mailto:alex.williamson@redhat.com]
> Sent: Monday, November 20, 2017 3:58 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: eric.auger@redhat.com; Zhuyijun <zhuyijun@huawei.com>; qemu-
> arm@nongnu.org; qemu-devel@nongnu.org; peter.maydell@linaro.org;
> Zhaoshenglong <zhaoshenglong@huawei.com>; Linuxarm
> <linuxarm@huawei.com>
> Subject: Re: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
> reserved_region of device iommu group
>=20
> On Mon, 20 Nov 2017 11:58:43 +0000
> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > > -----Original Message-----
> > > From: Alex Williamson [mailto:alex.williamson@redhat.com]
> > > Sent: Wednesday, November 15, 2017 6:25 PM
> > > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > > Cc: Zhuyijun <zhuyijun@huawei.com>; qemu-arm@nongnu.org; qemu-
> > > devel@nongnu.org; eric.auger@redhat.com; peter.maydell@linaro.org;
> > > Zhaoshenglong <zhaoshenglong@huawei.com>
> > > Subject: Re: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
> > > reserved_region of device iommu group
> > >
> > > On Wed, 15 Nov 2017 09:49:41 +0000
> > > Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> wrote:
> > >
> > > > Hi Alex,
> > > >
> > > > > -----Original Message-----
> > > > > From: Alex Williamson [mailto:alex.williamson@redhat.com]
> > > > > Sent: Tuesday, November 14, 2017 3:48 PM
> > > > > To: Zhuyijun <zhuyijun@huawei.com>
> > > > > Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> > > > > eric.auger@redhat.com; peter.maydell@linaro.org; Shameerali
> Kolothum
> > > > > Thodi <shameerali.kolothum.thodi@huawei.com>; Zhaoshenglong
> > > > > <zhaoshenglong@huawei.com>
> > > > > Subject: Re: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for get=
ting
> > > > > reserved_region of device iommu group
> > > > >
> > > > > On Tue, 14 Nov 2017 09:15:50 +0800
> > > > > <zhuyijun@huawei.com> wrote:
> > > > >
> > > > > > From: Zhu Yijun <zhuyijun@huawei.com>
> > > > > >
> > > > > > With kernel 4.11, iommu/smmu will populate the MSI IOVA reserve=
d
> > > > > > window and PCI reserved window which has to be excluded from
> Guest
> > > iova
> > > > > allocations.
> > > > > >
> > > > > > However, If it falls within the Qemu default virtual memory add=
ress
> > > > > > space, then reserved regions may get allocated for a Guest VF D=
MA
> iova
> > > > > > and it will fail.
> > > > > >
> > > > > > So get those reserved regions in this patch and create some hol=
es in
> > > > > > the Qemu ram address in next patchset.
> > > > > >
> > > > > > Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
> > > > > > ---
> > > > > >  hw/vfio/common.c              | 67
> > > > > +++++++++++++++++++++++++++++++++++++++++++
> > > > > >  hw/vfio/pci.c                 |  2 ++
> > > > > >  hw/vfio/platform.c            |  2 ++
> > > > > >  include/exec/memory.h         |  7 +++++
> > > > > >  include/hw/vfio/vfio-common.h |  3 ++
> > > > > >  5 files changed, 81 insertions(+)
> > > > >
> > > > > I generally prefer the vfio interface to be more self sufficient,=
 if there
> are
> > > > > regions the IOMMU cannot map, we should be describing those via
> > > capabilities
> > > > > on the container through the vfio interface.  If we're just scrap=
ing
> together
> > > > > things from sysfs, the user can just as easily do that and provid=
e an
> explicit
> > > > > memory map for the VM taking the devices into account.
> > > >
> > > > Ok. I was under the impression that the purpose of introducing the
> > > > /sys/kernel/iommu_groups/reserved_regions was to get the IOVA regio=
ns
> > > > that are reserved(MSI or non-mappable) for Qemu or other apps to
> > > > make use of.  I think this was introduced as part of the "KVM/MSI
> passthrough
> > > > support on ARM" patch series. And if I remember correctly, Eric had
> > > > an approach where the user space can retrieve all the reserved regi=
ons
> > > through
> > > > the VFIO_IOMMU_GET_INFO ioctl and later this idea was replaced with
> the
> > > > sysfs interface.
> > > >
> > > > May be I am missing something here.
> > >
> > > And sysfs is a good interface if the user wants to use it to configur=
e
> > > the VM in a way that's compatible with a device.  For instance, in yo=
ur
> > > case, a user could evaluate these reserved regions across all devices=
 in
> > > a system, or even across an entire cluster, and instantiate the VM wi=
th
> > > a memory map compatible with hotplugging any of those evaluated
> > > devices (QEMU implementation of allowing the user to do this TBD).
> > > Having the vfio device evaluate these reserved regions only helps in
> > > the cold-plug case.  So the proposed solution is limited in scope and
> > > doesn't address similar needs on other platforms.  There is value to
> > > verifying that a device's IOVA space is compatible with a VM memory m=
ap
> > > and modifying the memory map on cold-plug or rejecting the device on
> > > hot-plug, but isn't that why we have an ioctl within vfio to expose
> > > information about the IOMMU?  Why take the path of allowing QEMU to
> > > rummage through sysfs files outside of vfio, implying additional
> > > security and access concerns, rather than filling the gap within the
> > > vifo API?
> >
> > Thanks Alex for the explanation.
> >
> > I came across this patch[1] from Eric where he introduced the IOCTL
> interface to
> > retrieve the reserved regions. It looks like this can be reworked to
> accommodate
> > the above requirement.
>=20
> I don't think we need a new ioctl for this, nor do I think that
> describing the holes is the correct approach.  The existing
> VFIO_IOMMU_GET_INFO ioctl can be extended to support capability chains,
> as we've done for VFIO_DEVICE_GET_REGION_INFO.=20

Right, as far as I can see the above mentioned patch is doing exactly the s=
ame,=20
extending the VFIO_IOMMU_GET_INFO ioctl with capability chain.

> IMO, we should try to
> describe the available fixed IOVA regions which are available for
> mapping rather than describing various holes within the address space
> which are unavailable.  The latter method always fails to describe the
> end of the mappable IOVA space and gets bogged down in trying to
> classify the types of holes that might exist.  Thanks,

Ok. I guess that is to take care iommu max address width case.

Thanks,
Shameer
