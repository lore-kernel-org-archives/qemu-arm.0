Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1145111njc;
        Mon, 30 Sep 2024 03:46:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3g714Equ2Xfa+MkooyhcrLNJ4o9jCrRndsRZfTnZUX4uN3jbYyv41uSnIPMhRiGV2TZXwaMxaRHHTHA==@linaro.org
X-Google-Smtp-Source: AGHT+IFGQCfTW7I+s34tdFXqnVJcFsM4c84xqoXMDE5pNy5ZXKeuBf2/nbrj50z/MWfr4YsGMgP2
X-Received: by 2002:ad4:580c:0:b0:6cb:3b6d:2775 with SMTP id 6a1803df08f44-6cb3b6d2d88mr152537536d6.17.1727693161052;
        Mon, 30 Sep 2024 03:46:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727693161; cv=none;
        d=google.com; s=arc-20240605;
        b=NY2+D6UouCouuoPy2Zt0BfIeSnULnpvwF+QkIx7g+OEULO5Rg2aBBmZ5Hp8D8iumWx
         mNP6sPFJ10IRY8PSIj5KUjd6koCSmE/Mb5iXSXqjfaIWDNHlraSY/bHPPIy7+Ii/Qi46
         mx41MBGkBJF67FZfaE30FVeevAO5Li6KBjuHp9Mns9gGeZliwceP4gyoUNRcZBsICLhc
         JPxPftE9k92jTwREqs+KQzYiXsxDPzkZnLZfajLyhFwp+WabthbP/XUoG01lXxd4bTb+
         5cMI/QuNBffSAUp4TIm1zKAkgmWQ586F/wdR5OOL3lpbxNuw7IJZwxOT6kbnQXAuhkq7
         uuAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=PBaiiS2lVIsy7oyY5vLMBP0XjHPTjZXbJcJDUR4ZD0I=;
        fh=qHbTlUvH9hirluH49f+3XUL62Ma18bVGa8JiRRXB6ho=;
        b=WtJvpAXHpKjD30oU2ix2ND+NOeny6HOR4R3YcgCy6HDmF9PNipBeIp8C0FdFkrVt1T
         DqfhlbkJ+4xzJvOFEVNt9QI+xu/53zTM80EPeAGWGEn6/er+KG8eEgTtXlOPFcoAKrNS
         v+BLdZWKGubaZV2CQ2mJ5qKqQkMPDiKxc9cc6L4I+AEuaXQVVjXYwaapvmdp07Ac+WsH
         zK5xyGedEW/o4yYsYwmThGa6A4FMZsrcuv7BYup7ShiC60fblu7frpdtk151lB+kLC47
         Y3C/+/ymIivqP3QqbWo8ctEu5YJMKpY0w0EtpefHa4wpkvdrIKLv+onhg0TBiCo+n84d
         DsOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b6c53f7si82227786d6.554.2024.09.30.03.46.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 03:46:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svDuV-0007MY-Rz; Mon, 30 Sep 2024 06:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1svDuU-0007La-DW; Mon, 30 Sep 2024 06:45:46 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1svDuR-00072r-K0; Mon, 30 Sep 2024 06:45:45 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XHHgB1rhQz6LD6x;
 Mon, 30 Sep 2024 18:41:26 +0800 (CST)
Received: from frapeml100006.china.huawei.com (unknown [7.182.85.201])
 by mail.maildlp.com (Postfix) with ESMTPS id 1E038140155;
 Mon, 30 Sep 2024 18:45:32 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100006.china.huawei.com (7.182.85.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 12:45:31 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 30 Sep 2024 12:45:31 +0200
To: Nicolin Chen <nicolinc@nvidia.com>
CC: Eric Auger <eric.auger@redhat.com>, Mostafa Saleh <smostafa@google.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, "Jason
 Gunthorpe" <jgg@nvidia.com>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, Moritz Fischer <mdf@kernel.org>, Michael Shavit
 <mshavit@google.com>, "Andrea Bolognani" <abologna@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, "Peter Xu" <peterx@redhat.com>
Subject: RE: nested-smmuv3 topic, Sep 2024
Thread-Topic: nested-smmuv3 topic, Sep 2024
Thread-Index: AQHa/21fMRq+vkBZBEO3I0aIbruIbrJJJAMQgABy+wCAJrBFsA==
Date: Mon, 30 Sep 2024 10:45:31 +0000
Message-ID: <e06e0a8a89d74d88b653d4f49d0b08fe@huawei.com>
References: <ZtlrLJzZqpnUrZQf@Asurada-Nvidia>
 <d0e3a60713da4ff1bb10245e789ecf24@huawei.com> <ZtoWVjmSXfQStlkF@nvidia.com>
In-Reply-To: <ZtoWVjmSXfQStlkF@nvidia.com>
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
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: 462jZUW506vH



> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Thursday, September 5, 2024 9:37 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: Eric Auger <eric.auger@redhat.com>; Mostafa Saleh
> <smostafa@google.com>; qemu-arm@nongnu.org; qemu-
> devel@nongnu.org; Peter Maydell <peter.maydell@linaro.org>; Jason
> Gunthorpe <jgg@nvidia.com>; Jean-Philippe Brucker <jean-
> philippe@linaro.org>; Moritz Fischer <mdf@kernel.org>; Michael Shavit
> <mshavit@google.com>; Andrea Bolognani <abologna@redhat.com>;
> Michael S. Tsirkin <mst@redhat.com>; Peter Xu <peterx@redhat.com>
> Subject: Re: nested-smmuv3 topic, Sep 2024
>=20
> Hi Shameer,
>=20
> Thanks for the reply!
>=20
> On Thu, Sep 05, 2024 at 12:55:52PM +0000, Shameerali Kolothum Thodi
> wrote:
> > > The main takeaway from the discussion is to
> > > 1) Turn the vSMMU module into a pluggable one, like intel-iommu
> > > 2) Move the per-SMMU pxb bus and device auto-assign into libvirt
> > >
> > > Apart from the multi-vSMMU thing, there's basic nesting series:
> > > 0) Keep updating to the latest kernel uAPIs to support nesting
> >
> > By this you mean the old HWPT based nested-smmuv3 support?
>=20
> HWPT + vIOMMU. The for-viommu/virq branches that I shared in my
> kernel series have those changes. Invalidations is done via the
> vIOMMU infrastructure.
>=20
> > >
> > > I was trying to do all these three, but apparently too ambitious.
> > > The kernel side of work is still taking a lot of my bandwidth. So
> > > far I had almost-zero progress on task (1) and completely-zero on
> > > task (2).
> > >
> > > <-- Help Needed --->
> > > So, I'm wondering if anyone(s) might have some extra bandwidth in
> > > the following months helping these two tasks, either of which can
> > > be a standalone project I think.
> > >
> > > For task (0), I think I can keep updating the uAPI part, although
> > > it'd need some help for reviews, which I was hoping to occur after
> > > Intel sends the QEMU nesting backend patches. Once we know how big
> > > the rework is going to be, we may need to borrow some help at that
> > > point once again..
> >
> > I might have some bandwidth starting October and can take a look at
> > task 1 above. I haven't gone through the VIOMMU API model completely
> > yet and plan to do that soon.
>

I had  an initial look at this and also had some discussions with Eric at K=
VM
Forum(Thanks Eric!).

Going through the code, is it ok to introduce a "pci-bus" for the proposed
nested SMMUv3 device which will create the link between the SMMUv3 dev=20
and the associated root complex(pxb-pcie).

Something like below,

-device pxb-pcie,id=3Dpcie.1,bus_nr=3D2,bus=3Dpcie.0 \
-device arm-nested-smmuv3,pci-bus=3Dpcie.1 \
-device pcie-root-port,id=3Dpcie.port1,bus=3Dpcie.1 \
-device vfio-pci,host=3D0000:75:00.1, bus=3Dpcie.port1 \
...
-device pxb-pcie,id=3Dpcie.2,bus_nr=3D8,bus=3Dpcie.0 \
-device arm-nested-smmuv3,pci-bus=3Dpcie.2 \
-device pcie-root-port,id=3Dpcie.port2,bus=3Dpcie.2 \
-device vfio-pci,host=3D0000:75:00.2, bus=3Dpcie.port2 \

This way we can invoke the pci_setup_iommu() with the=20
right PCIBus during the nested SMMUv3 device realize fn.

Please let me know, if this works/scales with all the use cases we have.

Also Eric mentioned that when he initially added the support for SMMUv3,
the initial approach was -device based solution, but later changed to machi=
ne
option instead based on review comments. I managed to find the link where
this change was proposed(by Peter),

https://lore.kernel.org/all/CAFEAcA_H+sraWNVhEZc48eS11n6dC9CyEwTL44tPERiPBO=
+hbw@mail.gmail.com/

I hope the use cases we now have make it reasonable to introduce a "-device=
 arm-nested-smmuv3" model.
Please let me know if there are still objections to going this way.

Thanks,
Shameer



