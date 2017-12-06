Received: by 10.223.159.74 with SMTP id f10csp3887799wrg;
        Wed, 6 Dec 2017 02:31:10 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbM3wofFLMTZQQfmoY6waD5Ki7qwtBPlwehuXPZ+7YsWzmbmOT/cLgxnNipJeueqb2oxW6r
X-Received: by 10.37.77.65 with SMTP id a62mr10490467ybb.241.1512556269943;
        Wed, 06 Dec 2017 02:31:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512556269; cv=none;
        d=google.com; s=arc-20160816;
        b=xZJXn34EBxEz/Kl6GIlIjyCnIHpFcyrogEXkW729WNDFd/QPsdxd6syc9qQpc70+NM
         uTUS2e/LTJkhYPMdY8UENjErGmQMfjMuBSHc6GR8TxaPN30W901UfNE+xFf8IOkDMurl
         dZ7B0OH72oS+GIT3vv39L9mYZiNRadKXfRL5cTOzwdow4veVAu/wVttUiBIUQXm1FFpo
         w+DRG5gvzGr7bB4QAAGhMRptsbjjGKXUcxYNc5xj/1tIYZeiJT9G66TCf562ptNhBcLm
         POdCC0JOzP9doUO/28jX1te9CxpKbTYZli4Y8CMRRkrDbbI+5pVZ7qoNAQlozWc9xlTr
         Hflg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :references:message-id:date:thread-index:thread-topic:to:from
         :arc-authentication-results;
        bh=Bi4L+EQURRyJzVwu/3JRGGUHeos/elptLMbIKK0mFVY=;
        b=TQjiY9+QHU0NU3r6M/jJ24WdbYrAQbXKGUp9vaIM60ePIUBa+OX4O2SHJGfwkWr3Ng
         7bbyAZcmV6zjZPzCvp5cbkjcHNlXgQrg3VBL/CW6Dq1U7EtG/hmzhMi6tCzi/B/wOENY
         4azDZlj/y+PYI/VNNtS2+bG/ErqgtL/tMuIf0a7axGp7RhyE0tS62jpk10idmZOmQab3
         JhyM8yXCnB2JO/odlFrI+C/XrDbrt/f1N9wNdMCUnNMXL9JW739ppv1X5/Ypobkmpdbf
         s9cbTdNHJR5JgfMLljeVMx0hCMyXioWN2DG1DMm9Gda1HrcljAnauBefOvU1aHaNR2II
         9fcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 11si562190ywy.230.2017.12.06.02.31.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Dec 2017 02:31:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMWyr-0007ZV-Ca
	for alex.bennee@linaro.org; Wed, 06 Dec 2017 05:31:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eMWye-0007ZA-RI
	for qemu-arm@nongnu.org; Wed, 06 Dec 2017 05:30:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eMWya-00085a-P8
	for qemu-arm@nongnu.org; Wed, 06 Dec 2017 05:30:56 -0500
Received: from lhrrgout.huawei.com ([194.213.3.17]:33181 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eMWya-00083O-Ht; Wed, 06 Dec 2017 05:30:52 -0500
Received: from lhreml705-cah.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id E5FEE3DA27D8B;
	Wed,  6 Dec 2017 10:30:42 +0000 (GMT)
Received: from FRAEMA705-CHM.china.huawei.com (10.206.14.54) by
	lhreml705-cah.china.huawei.com (10.201.108.46) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 6 Dec 2017 10:30:43 +0000
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.156]) by
	FRAEMA705-CHM.china.huawei.com ([169.254.5.78]) with mapi id
	14.03.0361.001; Wed, 6 Dec 2017 11:30:34 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>
Thread-Topic: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
	reserved_region of device iommu group
Thread-Index: AQHTXOYm3ZL42BZvgkuK5iju3HzTnqMT9TeAgAE4uHCAAIWogIAHZLxQgABNuYCAABLrkIAYxg5w
Date: Wed, 6 Dec 2017 10:30:33 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA838622618@FRAEML521-MBX.china.huawei.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-2-git-send-email-zhuyijun@huawei.com>
	<20171114084735.68e87546@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA83845EDBF@FRAEML521-MBX.china.huawei.com>
	<20171115112513.3c035023@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA8384704C0@FRAEML521-MBX.china.huawei.com>
	<20171120085745.0147df5c@t450s.home> 
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
X-TUID: 6mXzsiXZtp7t

Hi Alex,

> -----Original Message-----
> From: Shameerali Kolothum Thodi
> Sent: Monday, November 20, 2017 4:31 PM
> To: 'Alex Williamson' <alex.williamson@redhat.com>
> Cc: eric.auger@redhat.com; Zhuyijun <zhuyijun@huawei.com>; qemu-
> arm@nongnu.org; qemu-devel@nongnu.org; peter.maydell@linaro.org;
> Zhaoshenglong <zhaoshenglong@huawei.com>; Linuxarm
> <linuxarm@huawei.com>
> Subject: RE: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
> reserved_region of device iommu group
[...]
> > > > And sysfs is a good interface if the user wants to use it to
> > > > configure the VM in a way that's compatible with a device.  For
> > > > instance, in your case, a user could evaluate these reserved
> > > > regions across all devices in a system, or even across an entire
> > > > cluster, and instantiate the VM with a memory map compatible with
> > > > hotplugging any of those evaluated devices (QEMU implementation of
> allowing the user to do this TBD).
> > > > Having the vfio device evaluate these reserved regions only helps
> > > > in the cold-plug case.  So the proposed solution is limited in
> > > > scope and doesn't address similar needs on other platforms.  There
> > > > is value to verifying that a device's IOVA space is compatible
> > > > with a VM memory map and modifying the memory map on cold-plug or
> > > > rejecting the device on hot-plug, but isn't that why we have an
> > > > ioctl within vfio to expose information about the IOMMU?  Why take
> > > > the path of allowing QEMU to rummage through sysfs files outside
> > > > of vfio, implying additional security and access concerns, rather
> > > > than filling the gap within the vifo API?
> > >
> > > Thanks Alex for the explanation.
> > >
> > > I came across this patch[1] from Eric where he introduced the IOCTL
> > interface to
> > > retrieve the reserved regions. It looks like this can be reworked to
> > accommodate
> > > the above requirement.
> >
> > I don't think we need a new ioctl for this, nor do I think that
> > describing the holes is the correct approach.  The existing
> > VFIO_IOMMU_GET_INFO ioctl can be extended to support capability
> > chains, as we've done for VFIO_DEVICE_GET_REGION_INFO.
>=20
> Right, as far as I can see the above mentioned patch is doing exactly the=
 same,
> extending the VFIO_IOMMU_GET_INFO ioctl with capability chain.
>=20
> > IMO, we should try to
> > describe the available fixed IOVA regions which are available for
> > mapping rather than describing various holes within the address space
> > which are unavailable.  The latter method always fails to describe the
> > end of the mappable IOVA space and gets bogged down in trying to
> > classify the types of holes that might exist.  Thanks,
>=20

I was going through this and noticed that it is possible to have multiple=20
iommu domains associated with a container. If that's true, is it safe to
make the assumption that all the domains will have the same iova
geometry or not?

Thanks,
Shameer
