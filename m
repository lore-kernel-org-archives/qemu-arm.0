Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp491243njb;
        Fri, 31 Jan 2025 07:23:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWlXlo1Fj/e5nKoNySqDb9za4qCMvr2JgrAxYyLL79nDnzaLWGBa8AcV0mo4moBJOmNcSQZ9j/XqzK8qA==@linaro.org
X-Google-Smtp-Source: AGHT+IHD5G6qcuUvnk6wwVo78ao3auGM4HnNNQqaucIB840njajAq+iuWkrEpkxL0RG5VqQXqynK
X-Received: by 2002:a0c:edca:0:b0:6e2:4e1a:bc82 with SMTP id 6a1803df08f44-6e263751a18mr7053466d6.35.1738337016166;
        Fri, 31 Jan 2025 07:23:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738337016; cv=none;
        d=google.com; s=arc-20240605;
        b=Dv9yyPZFl6FJKSPz5hxMvQxMG1V8Gdxplg7nkN6KeKXfYljlRHueynWU4Ru57zsK75
         83w8fpRbtJK+4A//PQbVRWQRAT3WQLfLkg9q3Wi8Qoy46oJFctcPrynthBtekyGHRhM8
         KbyLvYzjro5hj4DzEuc415o55NzZJvr+yO3TBjXzXWE5uZlRgiKo8TsiSaqf8Fogp+72
         ppZq/xv4+Eh7Dh7zrPEE9a1cs8si5FeDKkNmtSX+pH+xZWC+FJUyTcxWv88Mdw02b8Gi
         9VuMo4guCatgSnuhdtj6zHLBhleiZyZC3op8KNLChURNh1eXtzCgER9Gb/P3grRtBkUX
         ey2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=kLbz/EXBsHeVeWHvsaREmkLVDHC964GzZpbD0ee9CqM=;
        fh=IcEDmsuoIwI32oCCQSz9RTY/WzcFi1usxudWGdy/eZo=;
        b=MRSxNOgpvCtHBvFWfhE0Hh57vJKu4IuYei44qa107E83AZtDK54hrPRwC/UWMyXOEp
         WRDxKjwTdr9hwosu7RdQTEjaIRNHGFTcWdI9pd4qIlHMVsq107pHf69GP+axaKZ5+kUz
         hEQEHIRwzOUi6IiAdk3hMDZ4F2D8cozTZgk3OYHCKL+jVv1+e5FV2k7snmdbqaIwFNtQ
         5wiNiTnwcL8ahG85G65FquCPRSs5ZwWlQNWOICGxkoTyNPWuXmjER5SoCX9XuNck/GCT
         W8PhYhvtxMcAPZ4vzclHR2x9wDHJ6U+GUi7cAyNQ1DpyUv4a529SQ1YpIuKuXPJ94PxZ
         9QXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e254838950si36840976d6.160.2025.01.31.07.23.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2025 07:23:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdsrY-0005Dh-Uu; Fri, 31 Jan 2025 10:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tdsrX-0005DQ-Fa; Fri, 31 Jan 2025 10:23:19 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tdsrV-0007aI-7g; Fri, 31 Jan 2025 10:23:19 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Yl02l59fjz6L4wC;
 Fri, 31 Jan 2025 23:20:47 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
 by mail.maildlp.com (Postfix) with ESMTPS id 2817E140155;
 Fri, 31 Jan 2025 23:23:10 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 Jan 2025 16:23:09 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Fri, 31 Jan 2025 16:23:09 +0100
To: Jason Gunthorpe <jgg@nvidia.com>
CC: =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm
 <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>, Nathan Chen
 <nathanc@nvidia.com>
Subject: RE: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Thread-Topic: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Thread-Index: AQHbMeB0+Q5BEZc9JkeH/U6Jz+dF4rMv66IAgAA0HqCAAPMSYIAAUDgAgAAS6wD///V/gIAAE36Q
Date: Fri, 31 Jan 2025 15:23:09 +0000
Message-ID: <20039bbc40df453a8a41a863d74b9ff9@huawei.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <Z5uiGnAxUf4jXTEI@redhat.com> <7ecabe74e0514367baf28d67675e5db8@huawei.com>
 <fc91e1a798324390b2a556fae5d40f46@huawei.com>
 <20250131142404.GP5556@nvidia.com>
 <3efcea1171af4b2f81be842f2c55fe51@huawei.com>
 <20250131145411.GR5556@nvidia.com>
In-Reply-To: <20250131145411.GR5556@nvidia.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gVTXTvM7yWFS



> -----Original Message-----
> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Friday, January 31, 2025 2:54 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: Daniel P. Berrang=E9 <berrange@redhat.com>; qemu-arm@nongnu.org;
> qemu-devel@nongnu.org; eric.auger@redhat.com;
> peter.maydell@linaro.org; nicolinc@nvidia.com; ddutile@redhat.com;
> Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>;
> zhangfei.gao@linaro.org; Nathan Chen <nathanc@nvidia.com>
> Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
> nested SMMUv3
>=20
> On Fri, Jan 31, 2025 at 02:39:53PM +0000, Shameerali Kolothum Thodi
> wrote:
>=20
> > > > And Qemu does some checking to make sure that the device is indeed
> > > associated
> > > > with the specified phys-smmuv3.  This can be done going through the
> > > sysfs path checking
> > > > which is what I guess libvirt is currently doing to populate the
> topology.
> > > So basically
> > > > Qemu is just replicating that to validate again.
> > >
> > > I would prefer that iommufd users not have to go out to sysfs..
> > >
> > > > Or another option is extending the IOMMU_GET_HW_INFO IOCTL to
> > > return the phys
> > > > smmuv3 base address which can avoid going through the sysfs.
> > >
> > > It also doesn't seem great to expose a physical address. But we could
> > > have an 'iommu instance id' that was a unique small integer?
> >
> > Ok. But how the user space can map that to the device?
>=20
> Why does it need to?
>=20
> libvirt picks some label for the vsmmu instance, it doesn't matter
> what the string is.
>=20
> qemu validates that all of the vsmmu instances are only linked to PCI
> device that have the same iommu ID. This is already happening in the
> kernel, it will fail attaches to mismatched instances.
>=20
> Nothing further is needed?

-device pxb-pcie,id=3Dpcie.1,bus_nr=3D8,bus=3Dpcie.0 \
-device pcie-root-port,id=3Dpcie.port1,bus=3Dpcie.1,chassis=3D1 \
-device arm-smmuv3-accel,bus=3Dpcie.1,id=3Dsmmuv1 \
-device vfio-pci,host=3D0000:7d:02.1,bus=3Dpcie.port1,iommufd=3Diommufd0 \

-device pxb-pcie,id=3Dpcie.2,bus_nr=3D16,bus=3Dpcie.0 \
-device pcie-root-port,id=3Dpcie.port2,bus=3Dpcie.2,chassis=3D2 \
-device arm-smmuv3-accel,pci-bus=3Dpcie.2,id=3Dsmmuv2 \
-device vfio-pci,host=3D0000:75:00.1,bus=3Dpcie.port2,iommufd=3Diommufd0 \

I think it works from a functionality point of view. A  particular
instance of arm-smmuv3-accel(say id=3Dsmmuv1) can only have devices attache=
d
to the same phys smmuv3 "iommu instance id"

But not sure from a libvirt/Qemu interface point of view[0] the concerns
are addressed. Daniel/Nathan?

Thanks,
Shameer
https://lists.libvirt.org/archives/list/devel@lists.libvirt.org/message/X6R=
52JRBYDFZ5PSJFR534A655UZ3RHKN/

