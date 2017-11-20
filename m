Received: by 10.223.153.116 with SMTP id x107csp504951wrb;
        Mon, 20 Nov 2017 03:59:18 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZna/Lvd5LDcbY2tL8mbojoE6WqKJ36XTP5n6OGADi84MKWxy/h48c8KjQjzQKjYFjLpPgx
X-Received: by 10.37.87.8 with SMTP id l8mr8125112ybb.199.1511179158574;
        Mon, 20 Nov 2017 03:59:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511179158; cv=none;
        d=google.com; s=arc-20160816;
        b=wldfVSjftSnj6/XQLdn8Lpk+BCJhS/i6EwfoIPaeuvr/fXaDyv1fjmKvX1DLz5sL2G
         IK7WpyR8zDIcUQrK+O4axbnadbYO0HtlyRYVyXoRBRhajafizotZf2cA2PQZdN5fg7Lo
         HKzTX8eLc19lH7tqO9DcomYIBr8/X8LPBwhl1YGQyHTy1d8uMXidg4e44lboqpkVq+oG
         495ZVIexeCOGOftBolb6Ae82J3GdsKcx1bz6+lhkdIQ6v4gq/9zbHlE8wgc4NzUmHqIK
         LXL+1sqW8hF85eLY7bWbG86xrq1vtCmihJ3XAyHh+2TtPXvgLRoHHgXQ8akoEekh2Joe
         veRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=D+4vhdrrJ+2IqTjRQkylH7kLaP2TqB1/1DIg65HdKII=;
        b=0YGHkngH/m0L9FQgip4z7kdFWAv2ZwyQ1hzOMqIDUlrxOxNgjMhnrqYMF7sOgCjQzk
         qI25xKICJ4554whQVhohbq9HXHqRIfIZ5h7zj908cv4XOpih73FcYKvlVPbRFZo6+YXx
         agR6Uj6ubQwERrIj7zpev+FWv1Bpmpmq7CEzUxv9nb5KkdGlLfA8SQgf7l6iG5MPLcZb
         9xcLDefrZKKT5ypCiMovYvkCXlM+lUQq0F77fqIpRL7fBZ/OWFm12kGjuKuFHmNk/RXp
         jv/ZjOJl+Bjl1s9a+eBPutaKtbiqY9l9RVxp0qnXXF1ncV1u2equXJyXbYo8NXv3zcC6
         4cDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x63si1659066ybc.770.2017.11.20.03.59.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Nov 2017 03:59:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56743 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eGkjN-0002zr-UM
	for alex.bennee@linaro.org; Mon, 20 Nov 2017 06:59:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eGkjG-0002ze-15
	for qemu-arm@nongnu.org; Mon, 20 Nov 2017 06:59:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eGkjC-0004uJ-4i
	for qemu-arm@nongnu.org; Mon, 20 Nov 2017 06:59:10 -0500
Received: from lhrrgout.huawei.com ([194.213.3.17]:31079 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eGkjB-0004sg-UA; Mon, 20 Nov 2017 06:59:06 -0500
Received: from LHREML710-CAH.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id 08EB72BB11008;
	Mon, 20 Nov 2017 11:58:55 +0000 (GMT)
Received: from FRAEML703-CAH.china.huawei.com (10.206.14.34) by
	LHREML710-CAH.china.huawei.com (10.201.108.33) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 20 Nov 2017 11:58:54 +0000
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.156]) by
	fraeml703-cah.china.huawei.com ([10.206.14.34]) with mapi id
	14.03.0361.001; Mon, 20 Nov 2017 12:58:44 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, "eric.auger@redhat.com"
	<eric.auger@redhat.com>
Thread-Topic: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
	reserved_region of device iommu group
Thread-Index: AQHTXOYm3ZL42BZvgkuK5iju3HzTnqMT9TeAgAE4uHCAAIWogIAHZLxQ
Date: Mon, 20 Nov 2017 11:58:43 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8384704C0@FRAEML521-MBX.china.huawei.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-2-git-send-email-zhuyijun@huawei.com>
	<20171114084735.68e87546@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA83845EDBF@FRAEML521-MBX.china.huawei.com>
	<20171115112513.3c035023@t450s.home>
In-Reply-To: <20171115112513.3c035023@t450s.home>
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
	Linuxarm <linuxarm@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Zhaoshenglong <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5FfQ3iHjqX23



> -----Original Message-----
> From: Alex Williamson [mailto:alex.williamson@redhat.com]
> Sent: Wednesday, November 15, 2017 6:25 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: Zhuyijun <zhuyijun@huawei.com>; qemu-arm@nongnu.org; qemu-
> devel@nongnu.org; eric.auger@redhat.com; peter.maydell@linaro.org;
> Zhaoshenglong <zhaoshenglong@huawei.com>
> Subject: Re: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
> reserved_region of device iommu group
>=20
> On Wed, 15 Nov 2017 09:49:41 +0000
> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > Hi Alex,
> >
> > > -----Original Message-----
> > > From: Alex Williamson [mailto:alex.williamson@redhat.com]
> > > Sent: Tuesday, November 14, 2017 3:48 PM
> > > To: Zhuyijun <zhuyijun@huawei.com>
> > > Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> > > eric.auger@redhat.com; peter.maydell@linaro.org; Shameerali Kolothum
> > > Thodi <shameerali.kolothum.thodi@huawei.com>; Zhaoshenglong
> > > <zhaoshenglong@huawei.com>
> > > Subject: Re: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
> > > reserved_region of device iommu group
> > >
> > > On Tue, 14 Nov 2017 09:15:50 +0800
> > > <zhuyijun@huawei.com> wrote:
> > >
> > > > From: Zhu Yijun <zhuyijun@huawei.com>
> > > >
> > > > With kernel 4.11, iommu/smmu will populate the MSI IOVA reserved
> > > > window and PCI reserved window which has to be excluded from Guest
> iova
> > > allocations.
> > > >
> > > > However, If it falls within the Qemu default virtual memory address
> > > > space, then reserved regions may get allocated for a Guest VF DMA i=
ova
> > > > and it will fail.
> > > >
> > > > So get those reserved regions in this patch and create some holes i=
n
> > > > the Qemu ram address in next patchset.
> > > >
> > > > Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
> > > > ---
> > > >  hw/vfio/common.c              | 67
> > > +++++++++++++++++++++++++++++++++++++++++++
> > > >  hw/vfio/pci.c                 |  2 ++
> > > >  hw/vfio/platform.c            |  2 ++
> > > >  include/exec/memory.h         |  7 +++++
> > > >  include/hw/vfio/vfio-common.h |  3 ++
> > > >  5 files changed, 81 insertions(+)
> > >
> > > I generally prefer the vfio interface to be more self sufficient, if =
there are
> > > regions the IOMMU cannot map, we should be describing those via
> capabilities
> > > on the container through the vfio interface.  If we're just scraping =
together
> > > things from sysfs, the user can just as easily do that and provide an=
 explicit
> > > memory map for the VM taking the devices into account.
> >
> > Ok. I was under the impression that the purpose of introducing the
> > /sys/kernel/iommu_groups/reserved_regions was to get the IOVA regions
> > that are reserved(MSI or non-mappable) for Qemu or other apps to
> > make use of.  I think this was introduced as part of the "KVM/MSI passt=
hrough
> > support on ARM" patch series. And if I remember correctly, Eric had
> > an approach where the user space can retrieve all the reserved regions
> through
> > the VFIO_IOMMU_GET_INFO ioctl and later this idea was replaced with the
> > sysfs interface.
> >
> > May be I am missing something here.
>=20
> And sysfs is a good interface if the user wants to use it to configure
> the VM in a way that's compatible with a device.  For instance, in your
> case, a user could evaluate these reserved regions across all devices in
> a system, or even across an entire cluster, and instantiate the VM with
> a memory map compatible with hotplugging any of those evaluated
> devices (QEMU implementation of allowing the user to do this TBD).
> Having the vfio device evaluate these reserved regions only helps in
> the cold-plug case.  So the proposed solution is limited in scope and
> doesn't address similar needs on other platforms.  There is value to
> verifying that a device's IOVA space is compatible with a VM memory map
> and modifying the memory map on cold-plug or rejecting the device on
> hot-plug, but isn't that why we have an ioctl within vfio to expose
> information about the IOMMU?  Why take the path of allowing QEMU to
> rummage through sysfs files outside of vfio, implying additional
> security and access concerns, rather than filling the gap within the
> vifo API? =20

Thanks Alex for the explanation.=20

I came across this patch[1] from Eric where he introduced the IOCTL interfa=
ce to
retrieve the reserved regions. It looks like this can be reworked to accomm=
odate=20
the above requirement.

Hi Eric,

Please let us know if you have any plans to respin this patch or else we ca=
n take a
look at this and do the rework if it is Ok.

Thanks,
Shameer=20

1. https://lists.linuxfoundation.org/pipermail/iommu/2016-November/019002.h=
tml



