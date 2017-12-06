Received: by 10.223.159.74 with SMTP id f10csp4177407wrg;
        Wed, 6 Dec 2017 07:21:46 -0800 (PST)
X-Google-Smtp-Source: AGs4zMY4QY56FeVesn46MHvtVtTIgGjK9Rpr8xm5p64Pmr55ILNuED/Qeh43ZKtXXwjAerKrpPFV
X-Received: by 10.37.161.195 with SMTP id a61mr15666914ybi.425.1512573706738;
        Wed, 06 Dec 2017 07:21:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512573706; cv=none;
        d=google.com; s=arc-20160816;
        b=oXUkOgabYEFSTy42cypFpgKKNavwI6zHubQxc1AXCDfdfvnpTPns4Pow23xh8iiUYF
         +7rnXTdpavZMGrLmJEnFo9YrOfB73M5qJlYN+rNLrrOyHyg24uZqo2GaWSYUkNQUzbUx
         nIorlTPVXbnnhIqKEyZ2NdFsRPIZo4znNJnxUhaozRmqFKHL1AiVAqpfyok6VGvOlfDO
         bbS/lr4aVF82dra+lwWuJJCXcZ+wPYeF4jmdlJ7PtOB4WlwWMxqnA0OQWBy9bUEdTkvW
         TExKEesQEZ2XTyaREzxjb7sh4W4UKx5FJSt9FJalYDY9n9Mlz/Kk4US9WjP6WM82u3Z/
         /RQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=f4ShEhsU7PbbK+jR1uU4EOZ5JelMrM5FHqdZPCO9Atw=;
        b=vLCUOpc8DRyHuIbH87ZSA9vUyDM83FuENlRhzl8dgRkzsicVkh4RSTjXRrchllkdRM
         tw80hSSYnN2fsOu9vIYmGnbq+9kltzs9zvznpZw+PRLmrvSvadSYMmoDtNUZsK7MzbsS
         oHp50ywJkBiksbuSpvsNmCz+u5Z38zr8ZHraQceHZG6THtrvaW7SCC2mbIlie6Kl2Onp
         +Y/A37i52GyOM389+PfpqoTZ70IpFhUbhW59+rQD44tmFrioEvTDwxqPeqDB5BN1ptC1
         eRL6Q/trXGaqS3879PcDK45ZH9qriKt9ESvzj3A/5+R982GJ30vtrECRy56+I7gF1z//
         YH7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a9si660212ybc.276.2017.12.06.07.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Dec 2017 07:21:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56218 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMbW6-00068y-4h
	for alex.bennee@linaro.org; Wed, 06 Dec 2017 10:21:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eMbUQ-0004xS-Er
	for qemu-arm@nongnu.org; Wed, 06 Dec 2017 10:20:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eMbUM-0004GI-Cq
	for qemu-arm@nongnu.org; Wed, 06 Dec 2017 10:20:02 -0500
Received: from lhrrgout.huawei.com ([194.213.3.17]:33215 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eMbUM-0004FA-1J; Wed, 06 Dec 2017 10:19:58 -0500
Received: from lhreml706-cah.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id 78555BAABE272;
	Wed,  6 Dec 2017 15:19:53 +0000 (GMT)
Received: from FRAEML702-CAH.china.huawei.com (10.206.14.33) by
	lhreml706-cah.china.huawei.com (10.201.108.47) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 6 Dec 2017 15:19:54 +0000
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.156]) by
	fraeml702-cah.china.huawei.com ([10.206.14.33]) with mapi id
	14.03.0361.001; Wed, 6 Dec 2017 16:19:45 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, Alex Williamson
	<alex.williamson@redhat.com>
Thread-Topic: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
	reserved_region of device iommu group
Thread-Index: AQHTXOYm3ZL42BZvgkuK5iju3HzTnqMT9TeAgAE4uHCAAIWogIAHZLxQgABNuYCAABLrkIAYxg5wgAAryYCAABYKEP//+ksAgAASuBA=
Date: Wed, 6 Dec 2017 15:19:44 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA838622AF1@FRAEML521-MBX.china.huawei.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-2-git-send-email-zhuyijun@huawei.com>
	<20171114084735.68e87546@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA83845EDBF@FRAEML521-MBX.china.huawei.com>
	<20171115112513.3c035023@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA8384704C0@FRAEML521-MBX.china.huawei.com>
	<20171120085745.0147df5c@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA838622618@FRAEML521-MBX.china.huawei.com>
	<e500dd54-04b6-5f19-316f-0598655751ea@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA838622A1D@FRAEML521-MBX.china.huawei.com>
	<3fcae1c1-6195-59ce-68f2-1a0b13a130c2@redhat.com>
In-Reply-To: <3fcae1c1-6195-59ce-68f2-1a0b13a130c2@redhat.com>
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
X-TUID: HCAThkIgYh+u



> -----Original Message-----
> From: Auger Eric [mailto:eric.auger@redhat.com]
> Sent: Wednesday, December 06, 2017 3:00 PM
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
> On 06/12/17 15:38, Shameerali Kolothum Thodi wrote:
> > Hi Eric,
> >
> >> -----Original Message-----
> >> From: Auger Eric [mailto:eric.auger@redhat.com]
> >> Sent: Wednesday, December 06, 2017 2:01 PM
> >> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> >> Alex Williamson <alex.williamson@redhat.com>
> >> Cc: peter.maydell@linaro.org; qemu-devel@nongnu.org; Linuxarm
> >> <linuxarm@huawei.com>; qemu-arm@nongnu.org; Zhaoshenglong
> >> <zhaoshenglong@huawei.com>; Zhuyijun <zhuyijun@huawei.com>
> >> Subject: Re: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
> >> reserved_region of device iommu group
> >>
> >> Hi Shameer,
> >>
> >> On 06/12/17 11:30, Shameerali Kolothum Thodi wrote:
> >>> Hi Alex,
> >>>
> >>>> -----Original Message-----
> >>>> From: Shameerali Kolothum Thodi
> >>>> Sent: Monday, November 20, 2017 4:31 PM
> >>>> To: 'Alex Williamson' <alex.williamson@redhat.com>
> >>>> Cc: eric.auger@redhat.com; Zhuyijun <zhuyijun@huawei.com>; qemu-
> >>>> arm@nongnu.org; qemu-devel@nongnu.org; peter.maydell@linaro.org;
> >>>> Zhaoshenglong <zhaoshenglong@huawei.com>; Linuxarm
> >>>> <linuxarm@huawei.com>
> >>>> Subject: RE: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for gettin=
g
> >>>> reserved_region of device iommu group
> >>> [...]
> >>>>>>> And sysfs is a good interface if the user wants to use it to
> >>>>>>> configure the VM in a way that's compatible with a device.  For
> >>>>>>> instance, in your case, a user could evaluate these reserved
> >>>>>>> regions across all devices in a system, or even across an entire
> >>>>>>> cluster, and instantiate the VM with a memory map compatible with
> >>>>>>> hotplugging any of those evaluated devices (QEMU implementation o=
f
> >>>> allowing the user to do this TBD).
> >>>>>>> Having the vfio device evaluate these reserved regions only helps
> >>>>>>> in the cold-plug case.  So the proposed solution is limited in
> >>>>>>> scope and doesn't address similar needs on other platforms.  Ther=
e
> >>>>>>> is value to verifying that a device's IOVA space is compatible
> >>>>>>> with a VM memory map and modifying the memory map on cold-plug
> or
> >>>>>>> rejecting the device on hot-plug, but isn't that why we have an
> >>>>>>> ioctl within vfio to expose information about the IOMMU?  Why tak=
e
> >>>>>>> the path of allowing QEMU to rummage through sysfs files outside
> >>>>>>> of vfio, implying additional security and access concerns, rather
> >>>>>>> than filling the gap within the vifo API?
> >>>>>>
> >>>>>> Thanks Alex for the explanation.
> >>>>>>
> >>>>>> I came across this patch[1] from Eric where he introduced the IOCT=
L
> >>>>> interface to
> >>>>>> retrieve the reserved regions. It looks like this can be reworked =
to
> >>>>> accommodate
> >>>>>> the above requirement.
> >>>>>
> >>>>> I don't think we need a new ioctl for this, nor do I think that
> >>>>> describing the holes is the correct approach.  The existing
> >>>>> VFIO_IOMMU_GET_INFO ioctl can be extended to support capability
> >>>>> chains, as we've done for VFIO_DEVICE_GET_REGION_INFO.
> >>>>
> >>>> Right, as far as I can see the above mentioned patch is doing exactl=
y the
> >> same,
> >>>> extending the VFIO_IOMMU_GET_INFO ioctl with capability chain.
> >>>>
> >>>>> IMO, we should try to
> >>>>> describe the available fixed IOVA regions which are available for
> >>>>> mapping rather than describing various holes within the address spa=
ce
> >>>>> which are unavailable.  The latter method always fails to describe =
the
> >>>>> end of the mappable IOVA space and gets bogged down in trying to
> >>>>> classify the types of holes that might exist.  Thanks,
> >>>>
> >>>
> >>> I was going through this and noticed that it is possible to have mult=
iple
> >>> iommu domains associated with a container. If that's true, is it safe=
 to
> >>> make the assumption that all the domains will have the same iova
> >>> geometry or not?
> >> To me the answer is no.
> >>
> >> There are several iommu domains "underneath" a single container. You
> >> attach vfio groups to a container. Each of them is associated to an
> >> iommu group and an iommu domain. See
> vfio_iommu_type1_attach_group().
> >>
> >> Besides, the reserved regions are per iommu group.
> >>
> >
> > Thanks for your reply. Yes, container can have multiple groups(hence
> multiple
> > iommu domains) and reserved regions are per group. Hence while deciding
> > the default supported iova geometry we have to go through all the domai=
ns
> > in the container and select smallest aperture as the supported default =
iova
> > range.
> >
> > Please find below snippet from a patch I am working on. Please
> > let me know your thoughts on this.
> >
> > Thanks,
> > Shameer
> >
> > -- >8 --
> > +static int vfio_build_iommu_iova_caps(struct vfio_iommu *iommu,
> > +                               struct vfio_info_cap *caps) {
> > +       struct iommu_resv_region *resv, *resv_next;
> > +       struct vfio_iommu_iova *iova, *iova_next;
> > +       struct list_head group_resv_regions, vfio_iova_regions;
> > +       struct vfio_domain *domain;
> > +       struct vfio_group *g;
> > +       phys_addr_t start, end;
> > +       int ret =3D 0;
> > +
> > +       domain =3D list_first_entry(&iommu->domain_list,
> > +                                 struct vfio_domain, next);
> > +       /* Get the default iova range supported */
> > +       start =3D domain->domain->geometry.aperture_start;
> > +       end =3D domain->domain->geometry.aperture_end;
> >
> > This is where I am confused. I think instead I should go over
> > the domain_list and select the smallest aperture as default
> > iova range.
> yes that's correct. I Just want to warn you Pierre is working on the
> same topic. May be worth to sync together.
>=20
> [PATCH] vfio/iommu_type1: report the IOMMU aperture info
> (https://patchwork.kernel.org/patch/10084655/)
>=20
> I think he plans to rework his series with capability chain too.

Thanks Eric for the pointer. I will sent out my patch as an RFC then and ta=
ke
it from there (without the default iova aperture changes, as I can see ther=
e are
some discussions  in Pierre's patch to solve that)

Thanks,
Shameer


