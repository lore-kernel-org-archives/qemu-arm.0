Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp173538njc;
        Thu, 5 Jun 2025 04:30:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULznMX6TfSs4MjLdUbf4mvGDA5jqmuSJlMeDAmbCgF0puzBaMqprM6QMu+KzqfxUcXjNFvgO6n4OAThQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEjR1jsbE4MUXx9vEBj06tA8ddE7keoSDB293S1dQHIHPXQigDxtdBoTyeUKAbOyqothCYi
X-Received: by 2002:a05:622a:410e:b0:494:78d5:baea with SMTP id d75a77b69052e-4a5a5848580mr92470771cf.51.1749123040179;
        Thu, 05 Jun 2025 04:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749123040; cv=none;
        d=google.com; s=arc-20240605;
        b=kGb4Z/cMIjRTc4pSHv8apLzODUyIfms5Jcuss24yULvA0zXBCGS9OG1ML+6XHr4dYh
         fFD2rpos3iXb98eADL0bE61tYMgrf6rvxv0EksKS3Sd+TF+WG6WvjLSvyobkV8gyf7ro
         j8WSWJESiwFJetPZzc9tcpNVhDJYV/6Ubrh3m4HiZfWwqYCnSdmWmqYRw3cp6RBozRFC
         fmt/CASIXV5rHMf0MgCWMwNlhtqNqPjsdP+gO5qnkzZ6J9Ki8yiKUCDljYh4KkIULOhk
         Su8Uh8PSV0HGCO1oRRJYj/Q2v7oxP99TeoY/Au5j6de15fN6B0hKsdY2BFtBbyEHpHN+
         zl3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=jdoRubVRQ7NQk4oL5sWoZWLm2Np0lFCW3ubPpS1N+5Q=;
        fh=hE8z3gFtGws1rvrxGo0o21Dl9T9D1xDfsY2tXU8QhDw=;
        b=bhuPvdWf5rXVqmcjrGAbLoJq9FIddsK1hVGAeAw1iOuYK1A+4PHuQc6eMtXBeQz+CF
         qBCXJRhHAqAPJKppGpdgGBzG0GKDbGCmW3QBWWicwOnVAeyoXEl/x14LBi2ISzpYyX8o
         58CUFl8P2D1hjZ769CPLCP2nXDiyUWnw+4sMy1/XfN+GFfVhR0oM1qiG/5gN7yu0LC/X
         dYodjQML5c/DU7CVzwWuvK389v9ScuIf7lvhf/yUBU79BKF0yRIQsjYf4Q64eJ7f7f1N
         dpZN9ZwC5ptoOdx+sk4rjnX6suZgtb7Q1uNvXpAV/lVBww+kX2kRUqDjIKPIm+4U/MMJ
         Gdmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a4358865d4si171191361cf.51.2025.06.05.04.30.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 04:30:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uN8ng-0004JU-Jn; Thu, 05 Jun 2025 07:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uN8nU-0004Ag-Qw; Thu, 05 Jun 2025 07:30:19 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uN8nP-0006lm-VW; Thu, 05 Jun 2025 07:30:11 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bCj0T1DzLz6K91p;
 Thu,  5 Jun 2025 19:29:45 +0800 (CST)
Received: from frapeml100006.china.huawei.com (unknown [7.182.85.201])
 by mail.maildlp.com (Postfix) with ESMTPS id A6B2E1402CB;
 Thu,  5 Jun 2025 19:29:59 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100006.china.huawei.com (7.182.85.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Jun 2025 13:29:59 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 5 Jun 2025 13:29:59 +0200
To: Igor Mammedov <imammedo@redhat.com>, Shameer Kolothum via
 <qemu-devel@nongnu.org>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "eric.auger@redhat.com"
 <eric.auger@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "ddutile@redhat.com"
 <ddutile@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>, "mochs@nvidia.com"
 <mochs@nvidia.com>, "smostafa@google.com" <smostafa@google.com>, Linuxarm
 <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [PATCH v3 1/6] hw/arm/smmuv3: Check SMMUv3 has PCIe Root Complex
 association
Thread-Topic: [PATCH v3 1/6] hw/arm/smmuv3: Check SMMUv3 has PCIe Root Complex
 association
Thread-Index: AQHb09UMySB7lOszwECrIiqSkZXavbP0R3UAgAAnHLA=
Date: Thu, 5 Jun 2025 11:29:59 +0000
Message-ID: <065bbd4ee15442b58e15b298614cf5dd@huawei.com>
References: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
 <20250602154110.48392-2-shameerali.kolothum.thodi@huawei.com>
 <20250605125518.138f5172@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250605125518.138f5172@imammedo.users.ipa.redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-TUID: qxr+04NOuN1L



> -----Original Message-----
> From: Igor Mammedov <imammedo@redhat.com>
> Sent: Thursday, June 5, 2025 11:55 AM
> To: Shameer Kolothum via <qemu-devel@nongnu.org>
> Cc: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> nicolinc@nvidia.com; ddutile@redhat.com; berrange@redhat.com;
> nathanc@nvidia.com; mochs@nvidia.com; smostafa@google.com; Linuxarm
> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
> Subject: Re: [PATCH v3 1/6] hw/arm/smmuv3: Check SMMUv3 has PCIe Root
> Complex association
>=20
> On Mon, 2 Jun 2025 16:41:05 +0100
> Shameer Kolothum via <qemu-devel@nongnu.org> wrote:
>=20
> > Although this change does not affect functionality at present, it is
> > required when we add support for user-creatable SMMUv3 devices in
> > future patches.
> >
> > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  hw/arm/smmuv3.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index ab67972353..7e934336c2 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -24,6 +24,7 @@
> >  #include "hw/qdev-properties.h"
> >  #include "hw/qdev-core.h"
> >  #include "hw/pci/pci.h"
> > +#include "hw/pci/pci_bridge.h"
> >  #include "cpu.h"
> >  #include "exec/target_page.h"
> >  #include "trace.h"
> > @@ -1881,6 +1882,13 @@ static void smmu_realize(DeviceState *d, Error
> **errp)
> >      SMMUv3Class *c =3D ARM_SMMUV3_GET_CLASS(s);
> >      SysBusDevice *dev =3D SYS_BUS_DEVICE(d);
> >      Error *local_err =3D NULL;
> > +    Object *bus;
> > +
> > +    bus =3D object_property_get_link(OBJECT(d), "primary-bus",
> &error_abort);
> I'd replace this with direct field access like in smmu_base_realize

Ok.
=20
> in QEMU with PCI, usually we specify bus to attach to with 'bus' property=
,
> wouldn't it better to rename "primary-bus" to 'bus' to be consistent with
> the rest of PCI code (and before "primary-bus" shows up as a CLI option,
> so far (before this series) it looks like it's an internal property)?

That was tried in v2 and since SMMUv3 is not a pci device by itself(it is a=
=20
sysbus device) reusing the default "bus" property to establish an associati=
on
with a PCI bus created problems,
https://lore.kernel.org/qemu-devel/877c2ut0zk.fsf@pond.sub.org/

=20
> > +    if (!bus || !object_dynamic_cast(bus->parent,
> TYPE_PCI_HOST_BRIDGE)) {
> Also looking at smmu_base_realize, it has NULL pointer check already.
> Which also rises question, shouldn't smmu_base_realize check for
> TYPE_PCI_HOST_BRIDGE as well (aka can smmu be attached to anything
> else but a host bridge)?

Not at the moment in Qemu. Though the SMMUv3 specification allows it to
be associated with non-pci devices as well.

Thanks,
Shameer
