Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2958759njj;
        Tue, 6 May 2025 01:14:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8365+gGzLFPuTKAyB1FOWM2cgB3V3aLN/45Suokf1Rvsnh+l2pn7EJefyLf9O0SCchR+7vHlcGBe3pw==@linaro.org
X-Google-Smtp-Source: AGHT+IExb1OT/Y7GAS+o49JGws1g6lhO6V4DO3FXyzlGUafeAPzafH1AdhbG10oI8rdv+YWUSaNw
X-Received: by 2002:ad4:5cec:0:b0:6f4:c84d:d1bd with SMTP id 6a1803df08f44-6f528c3ec59mr148617006d6.6.1746519297850;
        Tue, 06 May 2025 01:14:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746519297; cv=none;
        d=google.com; s=arc-20240605;
        b=SwPDbj4ZBMBwzn3ltreqafLpV+cC/joUfPQ7RfYlzITa/IPEWEuZU7Hjc+Wb7Dvysx
         5U1g0HntBFsIzayfbOQNXjv2hfUxrcYFuDKMsnsga5O6mpSVdZnRd+wmf5YDiNsM619X
         JawXLr4iwqAf5xoZFuScHOOjR4pyyvq7njp+HwfkAKMj3PwZwoLkQH3UMpeIdbZv5Lq7
         4unHe3gy2P9T5FgnEWh09FcLu59CHp9cwcNoVafp9ElQr79XLaP4o9DLGFWMQ8rBHF62
         aL6TeutzjmHDKRC+oEcCKOTRaNOwNggjnhLf9b/xP06iQTKp7M28+7HqkYg7687ykCgs
         aLAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=wYUrvCtk/YEXa7P8PAlWeoUfjBOVlKDnfbdaBHA8MeQ=;
        fh=L5k2mRSqinh8rv+X+K9B0cKsw7VXHEq5HuwmzaH9KTE=;
        b=W6G3jvQp2pImsZ4cv77KDZsYl/zuvZFOzckE1QuQpQkI7AXN0SlzN9nLFRSF51ilmP
         FrMjJaghmB4r0/ambcpQNRDPHffTpnbwOxuM3k8ufNzbC/o0MxauuKl4aqq16UESljri
         qBwiiqxBz3PNi6vbFhmMOci8u73TdQmYZBQEs9lmEJOcK4ohLYFUyrGel7K+zL/KIn78
         4+vckQFdmIcP1uKFUgtYC9zQsJ/EGBLVPdyjt+iImK577xJ8PYxuEjR6Jh+YiWcADyCT
         W7YlzNg5tcnvJ4aXxo0OURBvVjDYz1w9qDBCRt3GZ3OqZ+Ql7ZWSAUfl2P66b0JgOD5M
         7Ytw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f4c2c5esi112452476d6.500.2025.05.06.01.14.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 May 2025 01:14:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCDRj-0007kt-MP; Tue, 06 May 2025 04:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uCDRg-0007jT-N7; Tue, 06 May 2025 04:14:32 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uCDRe-0002Z9-DF; Tue, 06 May 2025 04:14:32 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zs9zn4gKzz6M53T;
 Tue,  6 May 2025 16:09:57 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
 by mail.maildlp.com (Postfix) with ESMTPS id E469F1402ED;
 Tue,  6 May 2025 16:14:26 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 May 2025 10:14:26 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Tue, 6 May 2025 10:14:26 +0200
To: Nicolin Chen <nicolinc@nvidia.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "nathanc@nvidia.com"
 <nathanc@nvidia.com>, "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a PCIe RC
Thread-Topic: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a PCIe RC
Thread-Index: AQHbu1V0fvNxmQCU0kS/eGPfhGB2G7O/dXYAgAXRX2A=
Date: Tue, 6 May 2025 08:14:26 +0000
Message-ID: <ce59282671674258a6dacd38fe09207c@huawei.com>
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
 <20250502102707.110516-2-shameerali.kolothum.thodi@huawei.com>
 <aBT/DKnSpdV1SEmb@Asurada-Nvidia>
In-Reply-To: <aBT/DKnSpdV1SEmb@Asurada-Nvidia>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
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
X-TUID: KiXusExsCxiN



> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Friday, May 2, 2025 6:23 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> ddutile@redhat.com; berrange@redhat.com; nathanc@nvidia.com;
> mochs@nvidia.com; smostafa@google.com; Linuxarm
> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
> Subject: Re: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a
> PCIe RC
>=20
> On Fri, May 02, 2025 at 11:27:02AM +0100, Shameer Kolothum wrote:
> > Although this change does not affect functionality at present, it lays
> > the groundwork for enabling user-created SMMUv3 devices in future
> > patches
> >
> > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
>=20
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
>=20
> With some nits:
>=20
> > ---
> >  hw/arm/smmuv3.c | 26 ++++++++++++++++++++++++++
> >  hw/arm/virt.c   |  3 ++-
> >  2 files changed, 28 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c index
> > ab67972353..605de9b721 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -24,6 +24,7 @@
> >  #include "hw/qdev-properties.h"
> >  #include "hw/qdev-core.h"
> >  #include "hw/pci/pci.h"
> > +#include "hw/pci/pci_bridge.h"
>=20
> Could probably replace the pci.h since pci_bridge.h includes it.

I think it is best not to as it is indirect inclusion.

>=20
> > +static int smmuv3_pcie_bus(Object *obj, void *opaque) {
> > +    DeviceState *d =3D opaque;
> > +    PCIBus *bus;
> > +
> > +    if (!object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> > +        return 0;
> > +    }
> > +
> > +    bus =3D PCI_HOST_BRIDGE(obj)->bus;
> > +    if (d->parent_bus && !strcmp(bus->qbus.name, d->parent_bus-
> >name)) {
> > +        object_property_set_link(OBJECT(d), "primary-bus", OBJECT(bus)=
,
> > +                                 &error_abort);
> > +        /* Return non-zero as we got the bus and don't need further
> > + iteration.*/
>=20
> Missing a space behind the '.'

Sure.

>=20
> > +        return 1;
> > +    }
> > +    return 0;
> > +}
>=20
> > @@ -1442,7 +1443,7 @@ static void create_smmu(const
> VirtMachineState *vms,
> >      }
> >      object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
> >                               &error_abort);
> > -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > +    qdev_realize_and_unref(dev, &bus->qbus, &error_fatal);
>=20
> Could add a line of note in the commit message for this change?

Will do.=20

Thanks,
Shameer
