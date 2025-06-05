Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp211887njc;
        Thu, 5 Jun 2025 05:37:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0oX/zkBssWEBzTzeeuI0x8noD7cSoKGzjRuWsczjuZK4G5roJPmRY0ruq+QRqBvJThjeaXtfCD60KTw==@linaro.org
X-Google-Smtp-Source: AGHT+IGW5H0sOTDgmYxh7LO+FafmJb2xjzfzfhEhkX8bpASUbdNzFK1cSO/fZqzvloh48moQ95+p
X-Received: by 2002:a05:620a:390f:b0:7ce:e283:10b8 with SMTP id af79cd13be357-7d2223a6ed0mr494758685a.1.1749127069164;
        Thu, 05 Jun 2025 05:37:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749127069; cv=none;
        d=google.com; s=arc-20240605;
        b=B7HeTENx+/OLuGf+y+vwKBsZg4j2vYy713fhLVtJjfKt/kRdgbWXMK2irYFqhJJelw
         TTUrMV+HgHdkdKt9c2xmXtxK3P2jyQK3sDh5QecuqRLw6eIF/KrfrgSByBmLEcfz07FK
         0cFo8p7spSoqFEeiUQ7WGJ9iyKCKcUI5IviugKPYuS08HTsAJB7/5jOG3tGLRH+ujU0S
         p2/Yta5a5tDUZEiO8QGiphwAs2ye8Ge5MUylYjBgV/xhgdhvMxs5lDMucch6yV3Uvkkc
         3yR5fUw8qLycBqMWb6PLrarWIzrjQnsWJRGjtz+mwh8kREuykymizdIH2ts2DZHRcYXf
         9Vcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=q6pBV3eWEtYwZD54GPnyGZRZcvMu1p4kfYxR/Rl7Urw=;
        fh=V5Nr+P5cf8zuHu0WdnCJEEWfAc0wg3WFmq4tpmKNKQ8=;
        b=Der3+Ly9UQxtsv1YGbwq4xHRoIlEjZuZbMbggqeAFse0Qtp5fi2PcV6hPmFIdA/eUJ
         YedNevuqwzYBCLOHniGfZVVBTy1upOwEYHvry1ekG0TRicoH6qpgb99FF5t76dZ15uXj
         ghXh6R1Qjs2R//9sJSko6kLsXa4mHIO7We9v4EKGLEoJrbRqU7liYCfzAFEhvoUXauyC
         1JVyTiajPjkY5AR2/9Zo2X36RYcXcky7wmfnFAD9/hZ23V12wfMc6M9EnHSxfciKcM0o
         Ye6HR2tp/rD+cMj8AC1Mma1vld/99HojMa5OVA7xa3pyULxfQ7l03uKh4CDM3a7SdzlK
         nBgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d09a1135c3si1678680685a.78.2025.06.05.05.37.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 05:37:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uN9qR-0000If-8C; Thu, 05 Jun 2025 08:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uN9qJ-0000FN-U7; Thu, 05 Jun 2025 08:37:13 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uN9qD-0008E2-U4; Thu, 05 Jun 2025 08:37:11 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bCkS5374nz6K9bj;
 Thu,  5 Jun 2025 20:35:17 +0800 (CST)
Received: from frapeml500005.china.huawei.com (unknown [7.182.85.13])
 by mail.maildlp.com (Postfix) with ESMTPS id 37BA61402FE;
 Thu,  5 Jun 2025 20:36:53 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500005.china.huawei.com (7.182.85.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Jun 2025 14:36:53 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 5 Jun 2025 14:36:52 +0200
To: Igor Mammedov <imammedo@redhat.com>
CC: Shameer Kolothum via <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>, "smostafa@google.com"
 <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)"
 <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, "zhangfei.gao@linaro.org"
 <zhangfei.gao@linaro.org>
Subject: RE: [PATCH v3 1/6] hw/arm/smmuv3: Check SMMUv3 has PCIe Root Complex
 association
Thread-Topic: [PATCH v3 1/6] hw/arm/smmuv3: Check SMMUv3 has PCIe Root Complex
 association
Thread-Index: AQHb09UMySB7lOszwECrIiqSkZXavbP0R3UAgAAnHLD///BrgIAAJS4g
Date: Thu, 5 Jun 2025 12:36:52 +0000
Message-ID: <83a0966672fc4785817784dbdf08aef3@huawei.com>
References: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
 <20250602154110.48392-2-shameerali.kolothum.thodi@huawei.com>
 <20250605125518.138f5172@imammedo.users.ipa.redhat.com>
 <065bbd4ee15442b58e15b298614cf5dd@huawei.com>
 <20250605141931.1704c6a5@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250605141931.1704c6a5@imammedo.users.ipa.redhat.com>
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
X-TUID: 9klwq+jBv32I



> -----Original Message-----
> From: Igor Mammedov <imammedo@redhat.com>
> Sent: Thursday, June 5, 2025 1:20 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: Shameer Kolothum via <qemu-devel@nongnu.org>; qemu-
> arm@nongnu.org; eric.auger@redhat.com; peter.maydell@linaro.org;
> jgg@nvidia.com; nicolinc@nvidia.com; ddutile@redhat.com;
> berrange@redhat.com; nathanc@nvidia.com; mochs@nvidia.com;
> smostafa@google.com; Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>;
> zhangfei.gao@linaro.org
> Subject: Re: [PATCH v3 1/6] hw/arm/smmuv3: Check SMMUv3 has PCIe Root
> Complex association

[..]

> > > in QEMU with PCI, usually we specify bus to attach to with 'bus'
> property,
> > > wouldn't it better to rename "primary-bus" to 'bus' to be consistent
> with
> > > the rest of PCI code (and before "primary-bus" shows up as a CLI opti=
on,
> > > so far (before this series) it looks like it's an internal property)?
> >
> > That was tried in v2 and since SMMUv3 is not a pci device by itself(it =
is a
> > sysbus device) reusing the default "bus" property to establish an
> association
> > with a PCI bus created problems,
> > https://lore.kernel.org/qemu-devel/877c2ut0zk.fsf@pond.sub.org/
>=20
> that was an approach was trying to workaround by patching dc->bus_type,
> which is obviously wrong.
>=20
> I'm not talking about changing device type or something similar,
> but about renaming 'primary-bus' property name to 'bus'

I have tried that earlier and gets this,
-device arm-smmuv3,bus=3Dpcie.0,id=3Dsmmuv3.0: Device 'arm-smmuv3' can't go=
 on PCIE bus

IIRC, the above mentioned patched dc->bus_type =3D TYPE_PCIE_BUS was used=20
to avoid that.

Or am I missing something here?

> so it would be consistent interface wise with PCI or other QEMU devices
> that are attached to a bus.
>=20
> > > > +    if (!bus || !object_dynamic_cast(bus->parent,
> > > TYPE_PCI_HOST_BRIDGE)) {
> > > Also looking at smmu_base_realize, it has NULL pointer check already.
> > > Which also rises question, shouldn't smmu_base_realize check for
> > > TYPE_PCI_HOST_BRIDGE as well (aka can smmu be attached to anything
> > > else but a host bridge)?
> >
> > Not at the moment in Qemu. Though the SMMUv3 specification allows it
> to
> > be associated with non-pci devices as well.
>=20
> then perhaps move, the check to smmu_base_realize() for now?
>=20
> if smmu + non-pci ever materialize, it can be refactored at that time.

Ok.

Thanks,
Shameer
