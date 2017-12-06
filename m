Received: by 10.223.159.74 with SMTP id f10csp4130729wrg;
        Wed, 6 Dec 2017 06:39:50 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYHgwMAimftWDbkpzqE8qpd/ULVzZiG17IzaE3fCBMejnOZacgiVxTglA6/jwpXJFuofC7M
X-Received: by 10.37.132.13 with SMTP id u13mr15396550ybk.10.1512571190522;
        Wed, 06 Dec 2017 06:39:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512571190; cv=none;
        d=google.com; s=arc-20160816;
        b=cTPSdoeB3atL2Lkd1J8AfJnWwScKbz9Ut3RgjCFGq0JOguh1SCqv2BC+7/fJxfGByx
         Ze2Xboyyykzm5eBBfaKftwkNmU/xF7tOfxBuZaI46KXZE7nq7RBXJ8dGkndcU1r4L2p7
         LT4CS3TwmfmEkJiqE3aySxkDeFnlBYsrJwmMcADZUUGDRf7xRCkovobyQ/8s2jH+1/4K
         gI4C4JIMIBiZawGkNRtn/W7rz8z3Iw0xVfnrTj6MUlbcVTL0HKzgHdeyOExlQ0YhPoRO
         Rw61aBq9FwG32LIk787S/mSQiGmtsBqn3vmG9SzkcF2ZRaAy9Bx2Hno6ixb4CW4Mt2PH
         zNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=Ptzj58U0pIC8faumXATSb41MDTp0yVRu++8KP77fL8E=;
        b=EFtpc25chgiLDUwkXLGhBs1b2jC1NhwAspNvDDYpDszwTHj6YF/n49ytL/0oAxDnV3
         pcFufeSIyvp+/k8ikCmFBro1lcN3e2oca4LQt7+jmpYh/dQCHAdAmswZrLRJIDZb3tFO
         Yow3WTJTwqo9S4mmHWvW73rFj0KoWA69H7tFKdkdE46NePQae8ifbllejEHhL24FZW9I
         65jC7c/YitqL26gszkhi5EY8ikruJV6me+QCWl0liDJ4PcmddPUVG96QlZ4C/waT5J63
         wkSoPxLtGAkOqH1j4790h+l8f6lRa445dUq+CYu+h7BRlWWHTuENAf7FK9InzLv9hBgC
         tMRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c1si676386ybe.502.2017.12.06.06.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Dec 2017 06:39:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55983 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMarV-0002ym-W4
	for alex.bennee@linaro.org; Wed, 06 Dec 2017 09:39:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eMaqh-0002OA-5u
	for qemu-arm@nongnu.org; Wed, 06 Dec 2017 09:39:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eMaqd-0005G0-W3
	for qemu-arm@nongnu.org; Wed, 06 Dec 2017 09:38:59 -0500
Received: from lhrrgout.huawei.com ([194.213.3.17]:33214 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eMaqd-0005EU-LV; Wed, 06 Dec 2017 09:38:55 -0500
Received: from lhreml705-cah.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id 592CA3E2CD5C7;
	Wed,  6 Dec 2017 14:38:51 +0000 (GMT)
Received: from FRAEML702-CAH.china.huawei.com (10.206.14.33) by
	lhreml705-cah.china.huawei.com (10.201.108.46) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 6 Dec 2017 14:38:52 +0000
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.156]) by
	fraeml702-cah.china.huawei.com ([10.206.14.33]) with mapi id
	14.03.0361.001; Wed, 6 Dec 2017 15:38:42 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, Alex Williamson
	<alex.williamson@redhat.com>
Thread-Topic: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
	reserved_region of device iommu group
Thread-Index: AQHTXOYm3ZL42BZvgkuK5iju3HzTnqMT9TeAgAE4uHCAAIWogIAHZLxQgABNuYCAABLrkIAYxg5wgAAryYCAABYKEA==
Date: Wed, 6 Dec 2017 14:38:41 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA838622A1D@FRAEML521-MBX.china.huawei.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-2-git-send-email-zhuyijun@huawei.com>
	<20171114084735.68e87546@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA83845EDBF@FRAEML521-MBX.china.huawei.com>
	<20171115112513.3c035023@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA8384704C0@FRAEML521-MBX.china.huawei.com>
	<20171120085745.0147df5c@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA838622618@FRAEML521-MBX.china.huawei.com>
	<e500dd54-04b6-5f19-316f-0598655751ea@redhat.com>
In-Reply-To: <e500dd54-04b6-5f19-316f-0598655751ea@redhat.com>
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
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Zhaoshenglong <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O3ppwV98ihNa

Hi Eric,

> -----Original Message-----
> From: Auger Eric [mailto:eric.auger@redhat.com]
> Sent: Wednesday, December 06, 2017 2:01 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> Alex Williamson <alex.williamson@redhat.com>
> Cc: peter.maydell@linaro.org; qemu-devel@nongnu.org; Linuxarm
> <linuxarm@huawei.com>; qemu-arm@nongnu.org; Zhaoshenglong
> <zhaoshenglong@huawei.com>; Zhuyijun <zhuyijun@huawei.com>
> Subject: Re: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
> reserved_region of device iommu group
>=20
> Hi Shameer,
>=20
> On 06/12/17 11:30, Shameerali Kolothum Thodi wrote:
> > Hi Alex,
> >
> >> -----Original Message-----
> >> From: Shameerali Kolothum Thodi
> >> Sent: Monday, November 20, 2017 4:31 PM
> >> To: 'Alex Williamson' <alex.williamson@redhat.com>
> >> Cc: eric.auger@redhat.com; Zhuyijun <zhuyijun@huawei.com>; qemu-
> >> arm@nongnu.org; qemu-devel@nongnu.org; peter.maydell@linaro.org;
> >> Zhaoshenglong <zhaoshenglong@huawei.com>; Linuxarm
> >> <linuxarm@huawei.com>
> >> Subject: RE: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
> >> reserved_region of device iommu group
> > [...]
> >>>>> And sysfs is a good interface if the user wants to use it to
> >>>>> configure the VM in a way that's compatible with a device.  For
> >>>>> instance, in your case, a user could evaluate these reserved
> >>>>> regions across all devices in a system, or even across an entire
> >>>>> cluster, and instantiate the VM with a memory map compatible with
> >>>>> hotplugging any of those evaluated devices (QEMU implementation of
> >> allowing the user to do this TBD).
> >>>>> Having the vfio device evaluate these reserved regions only helps
> >>>>> in the cold-plug case.  So the proposed solution is limited in
> >>>>> scope and doesn't address similar needs on other platforms.  There
> >>>>> is value to verifying that a device's IOVA space is compatible
> >>>>> with a VM memory map and modifying the memory map on cold-plug or
> >>>>> rejecting the device on hot-plug, but isn't that why we have an
> >>>>> ioctl within vfio to expose information about the IOMMU?  Why take
> >>>>> the path of allowing QEMU to rummage through sysfs files outside
> >>>>> of vfio, implying additional security and access concerns, rather
> >>>>> than filling the gap within the vifo API?
> >>>>
> >>>> Thanks Alex for the explanation.
> >>>>
> >>>> I came across this patch[1] from Eric where he introduced the IOCTL
> >>> interface to
> >>>> retrieve the reserved regions. It looks like this can be reworked to
> >>> accommodate
> >>>> the above requirement.
> >>>
> >>> I don't think we need a new ioctl for this, nor do I think that
> >>> describing the holes is the correct approach.  The existing
> >>> VFIO_IOMMU_GET_INFO ioctl can be extended to support capability
> >>> chains, as we've done for VFIO_DEVICE_GET_REGION_INFO.
> >>
> >> Right, as far as I can see the above mentioned patch is doing exactly =
the
> same,
> >> extending the VFIO_IOMMU_GET_INFO ioctl with capability chain.
> >>
> >>> IMO, we should try to
> >>> describe the available fixed IOVA regions which are available for
> >>> mapping rather than describing various holes within the address space
> >>> which are unavailable.  The latter method always fails to describe th=
e
> >>> end of the mappable IOVA space and gets bogged down in trying to
> >>> classify the types of holes that might exist.  Thanks,
> >>
> >
> > I was going through this and noticed that it is possible to have multip=
le
> > iommu domains associated with a container. If that's true, is it safe t=
o
> > make the assumption that all the domains will have the same iova
> > geometry or not?
> To me the answer is no.
>=20
> There are several iommu domains "underneath" a single container. You
> attach vfio groups to a container. Each of them is associated to an
> iommu group and an iommu domain. See vfio_iommu_type1_attach_group().
>=20
> Besides, the reserved regions are per iommu group.
>=20

Thanks for your reply. Yes, container can have multiple groups(hence multip=
le=20
iommu domains) and reserved regions are per group. Hence while deciding
the default supported iova geometry we have to go through all the domains
in the container and select smallest aperture as the supported default iova
range.

Please find below snippet from a patch I am working on. Please
let me know your thoughts on this.

Thanks,
Shameer

-- >8 --
+static int vfio_build_iommu_iova_caps(struct vfio_iommu *iommu,
+                               struct vfio_info_cap *caps) {
+       struct iommu_resv_region *resv, *resv_next;
+       struct vfio_iommu_iova *iova, *iova_next;
+       struct list_head group_resv_regions, vfio_iova_regions;
+       struct vfio_domain *domain;
+       struct vfio_group *g;
+       phys_addr_t start, end;
+       int ret =3D 0;
+
+       domain =3D list_first_entry(&iommu->domain_list,
+                                 struct vfio_domain, next);
+       /* Get the default iova range supported */
+       start =3D domain->domain->geometry.aperture_start;
+       end =3D domain->domain->geometry.aperture_end;

This is where I am confused. I think instead I should go over
the domain_list and select the smallest aperture as default
iova range.

+       INIT_LIST_HEAD(&vfio_iova_regions);
+       vfio_insert_iova(start, end, &vfio_iova_regions);
+
+       /* Get reserved regions if any */
+       INIT_LIST_HEAD(&group_resv_regions);
+       list_for_each_entry(g, &domain->group_list, next)
+               iommu_get_group_resv_regions(g->iommu_group,
+                                               &group_resv_regions);
+       list_sort(NULL, &group_resv_regions, vfio_resv_cmp);
+
+       /* Update iova range excluding reserved regions */
 ...
-- >8 --

