Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp830117njc;
        Fri, 20 Jun 2025 04:51:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSgdOaB16xv41t1ZgRdI8E2fRyGzMpmreOY+KNuqUKuEtzpe7/xvsCPsVUGh/Xp8q6jIywovcJ5ALTnQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEkBQFflBGB4mcms4C1rbgp40urCov2TyuZjTfleDtBC25VHjsyl8Px1XilZxCX0xLXOTSO
X-Received: by 2002:ac8:6f0b:0:b0:4a5:a447:679f with SMTP id d75a77b69052e-4a77a1c727bmr41614061cf.22.1750420273698;
        Fri, 20 Jun 2025 04:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750420273; cv=none;
        d=google.com; s=arc-20240605;
        b=cy2dFA4UOPrznlnHz4Bw270PW7TK2rX3bjByFZpVg2paZct6b4O4BkeLzKmZfcNK1d
         4b929uHXQFQ39ItpLWcpobk8Ozv6DsY9RxSFui4MBmyqcYsvO5vrbn+OkT1PLYrPHCo7
         voN3B7OPND0mVU8XfcnngC4s4CHpiFGQHH4j/ktJRP3k53m3+ty9otk5B0KsPNvzVWjU
         m09HASjngOG5q25/r4GzFoo8HLeBWEz0j3yEOYEJTGCiDlxGk5dvM1WiiSBFIDHPVURG
         2w92rr4a9W0wI49eC9+ASUBNUioLsSRPiwpgv+SYuuo/RaCxYv7Pu0GEGpupbnGe4fHS
         RZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=yK1PQAqnWnzmU/uMc8vTHgS9hJyLoWJ4obvR6nVHCLk=;
        fh=UascvB08epqB4QOB4kS/cBSiOX/r6mYqGoFIsLRFc7A=;
        b=gYGIoD05M4ShF8j4SHnNSYmOW0sRypEEop5Mh2aISlWocvWT3od6QOkWswSN7JOSei
         J22z1RGLWZZIJG5/FFQaiykjmbzbqMtkJxW3hT9DrYMqK5ZO39n+rE4Fx/O82h2tZEQh
         Mjf2U8/CPbOnz7W407xpiq6iOk0I4MNQ116BrYfzPumVmnpkS4B7k4OnURW5JI17KQVe
         inGEnasXSZmwUpFp4MLlLoA5wx/sg6STBEnSDl6iYWeqMwSTO3yN/T4vhc1IApympmce
         KT008wG4UxImHXgJXoHUR5rx4O0+DQjrVjhOAfcAIB3iJWloFONLaN+xjTvYosfPsonX
         QAuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a77a0d5ee9si16006661cf.523.2025.06.20.04.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jun 2025 04:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uSaGu-0004lg-5n; Fri, 20 Jun 2025 07:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uSaGS-0004ix-7Z; Fri, 20 Jun 2025 07:50:36 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uSaGL-0002pw-Kh; Fri, 20 Jun 2025 07:50:34 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNwdm38vCz6L5TF;
 Fri, 20 Jun 2025 19:45:32 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id C8A35140142;
 Fri, 20 Jun 2025 19:50:18 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 13:50:18 +0200
Date: Fri, 20 Jun 2025 12:50:15 +0100
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 <linuxarm@huawei.com>
CC: "eric.auger@redhat.com" <eric.auger@redhat.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "imammedo@redhat.com" <imammedo@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>, "mochs@nvidia.com"
 <mochs@nvidia.com>, "smostafa@google.com" <smostafa@google.com>, "Wangzhou
 (B)" <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe Root
 Complex association
Message-ID: <20250620125015.000002aa@huawei.com>
In-Reply-To: <20250619103802.00000dfa@huawei.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-2-shameerali.kolothum.thodi@huawei.com>
 <20250616112019.00003bce@huawei.com>
 <fcd05844-d2d9-450e-b962-59b0f3964185@redhat.com>
 <20250617175247.00007d43@huawei.com>
 <49d4c4b73e9a44a783332ddfe9a2fbdf@huawei.com>
 <327b5515-467c-4666-86d6-fb2a99925a8c@redhat.com>
 <e4879b1e26f941b5baa419824e4c928c@huawei.com>
 <6e180d39-b1eb-4935-98b0-3ac73766e8aa@redhat.com>
 <5fd7717fcd7e45d9aaff3e293cf63683@huawei.com>
 <20250619103028.00000277@huawei.com>
 <20250619103802.00000dfa@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PNd66MjSSyJ7

On Thu, 19 Jun 2025 10:38:02 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Thu, 19 Jun 2025 10:30:28 +0100
> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
>=20
> > On Thu, 19 Jun 2025 09:05:07 +0100
> > Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:
> >  =20
> > > > -----Original Message-----
> > > > From: Eric Auger <eric.auger@redhat.com>
> > > > Sent: Thursday, June 19, 2025 8:41 AM
> > > > To: Shameerali Kolothum Thodi
> > > > <shameerali.kolothum.thodi@huawei.com>; Jonathan Cameron
> > > > <jonathan.cameron@huawei.com>
> > > > Cc: Linuxarm <linuxarm@huawei.com>; qemu-arm@nongnu.org; qemu-
> > > > devel@nongnu.org; peter.maydell@linaro.org; jgg@nvidia.com;
> > > > nicolinc@nvidia.com; ddutile@redhat.com; berrange@redhat.com;
> > > > imammedo@redhat.com; nathanc@nvidia.com; mochs@nvidia.com;
> > > > smostafa@google.com; Wangzhou (B) <wangzhou1@hisilicon.com>;
> > > > jiangkunkun <jiangkunkun@huawei.com>; zhangfei.gao@linaro.org
> > > > Subject: Re: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe
> > > > Root Complex association
> > > >=20
> > > > Hi Shameer,
> > > >=20
> > > > On 6/19/25 9:24 AM, Shameerali Kolothum Thodi wrote:     =20
> > > > > Hi Eric,
> > > > >     =20
> > > > >> -----Original Message-----
> > > > >> From: Eric Auger <eric.auger@redhat.com>
> > > > >> Sent: Wednesday, June 18, 2025 6:00 PM
> > > > >> To: Shameerali Kolothum Thodi
> > > > >> <shameerali.kolothum.thodi@huawei.com>; Jonathan Cameron
> > > > >> <jonathan.cameron@huawei.com>
> > > > >> Cc: Linuxarm <linuxarm@huawei.com>; qemu-arm@nongnu.org; qemu-
> > > > >> devel@nongnu.org; peter.maydell@linaro.org; jgg@nvidia.com;
> > > > >> nicolinc@nvidia.com; ddutile@redhat.com; berrange@redhat.com;
> > > > >> imammedo@redhat.com; nathanc@nvidia.com; mochs@nvidia.com;
> > > > >> smostafa@google.com; Wangzhou (B) <wangzhou1@hisilicon.com>;
> > > > >> jiangkunkun <jiangkunkun@huawei.com>; zhangfei.gao@linaro.org
> > > > >> Subject: Re: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has  =
   =20
> > > > PCIe     =20
> > > > >> Root Complex association
> > > > >>
> > > > >> Hi Shameer, Jonathan,
> > > > >>
> > > > >> On 6/18/25 10:35 AM, Shameerali Kolothum Thodi wrote:     =20
> > > > >>>> -----Original Message-----
> > > > >>>> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> > > > >>>> Sent: Tuesday, June 17, 2025 5:53 PM
> > > > >>>> To: Eric Auger <eric.auger@redhat.com>
> > > > >>>> Cc: Shameerali Kolothum Thodi
> > > > >>>> <shameerali.kolothum.thodi@huawei.com>; Linuxarm
> > > > >>>> <linuxarm@huawei.com>; qemu-arm@nongnu.org; qemu-
> > > > >>>> devel@nongnu.org; peter.maydell@linaro.org; jgg@nvidia.com;
> > > > >>>> nicolinc@nvidia.com; ddutile@redhat.com; berrange@redhat.com;
> > > > >>>> imammedo@redhat.com; nathanc@nvidia.com; mochs@nvidia.com;
> > > > >>>> smostafa@google.com; Wangzhou (B) <wangzhou1@hisilicon.com>;
> > > > >>>> jiangkunkun <jiangkunkun@huawei.com>; zhangfei.gao@linaro.org
> > > > >>>> Subject: Re: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has=
     =20
> > > > >> PCIe     =20
> > > > >>>> Root Complex association
> > > > >>>>
> > > > >>>> On Tue, 17 Jun 2025 09:49:54 +0200
> > > > >>>> Eric Auger <eric.auger@redhat.com> wrote:
> > > > >>>>     =20
> > > > >>>>> On 6/16/25 12:20 PM, Jonathan Cameron wrote:     =20
> > > > >>>>>> On Fri, 13 Jun 2025 15:44:43 +0100
> > > > >>>>>> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>     =
=20
> > > > wrote:     =20
> > > > >>>>>>     =20
> > > > >>>>>>> Although this change does not affect functionality at prese=
nt, it is     =20
> > > > >>>>>> Patch title says PCIe.  This check is vs PCI host bridge.
> > > > >>>>>>
> > > > >>>>>> No idea which one you wanted, but if it is PCIe needs to be
> > > > >>>>>> TYPC_PCIE_HOST_BRIDGE from pcie_host.h not the pci_host.h one
> > > > >>>>>> I think.     =20
> > > > >>>>> I think we need TYPE_PCI_HOST_BRIDGE as we want to check agai=
nst     =20
> > > > >> pxb     =20
> > > > >>>>> pci-bridge/pci_expander_bridge.c:=C2=A0=C2=A0=C2=A0 .parent=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D     =20
> > > > >>>> TYPE_PCI_HOST_BRIDGE,     =20
> > > > >> sorry but I still fail to understand why we can't just check aga=
inst
> > > > >>
> > > > >> TYPE_PCI_HOST_BRIDGE for making sure the SMMU is attached to PXB=
 or
> > > > >> GPEX. What does it fail to check? Why shall we care about PCI vs=
 PCIe?     =20
> > > > > I think the concern is  getting any other TYPE_PCI_HOST_BRIDGE ty=
pes     =20
> > > > attached     =20
> > > > > to SMMUv3 other than pxb-pcie or GPEX. For example you could do,
> > > > >
> > > > > -device pxb-cxl,bus_nr=3D12,bus=3Dpcie.0,id=3Dcxl.1 \
> > > > > -device arm-smmuv3,primary-bus=3Dcxl.1,id=3Dsmmuv3.1 \
> > > > >
> > > > > as pxb-cxl is of type TYPE_PCI_HOST_BRIDGE. I don't know if there=
 are any     =20
> > > > other     =20
> > > > > ones similar to this out there.
> > > > >
> > > > > So the aim is to make the checking more specific to PXB.     =20
> > > >=20
> > > > thank you for the clarification. Is it invalid to have the SMMU
> > > > protecting RIDs comming from the pxb-cxl hierarchy?     =20
> > >=20
> > > That=E2=80=99s a good question. I don't know that for sure.   =20
> >=20
> > It should be fine to support CXL for this but we can work that out late=
r.
> >=20
> > For now limited use cases as there is no CXL VFIO support and the only =
thing
> > emulated devices do that the SMMU might influence is MSIX.
> >=20
> > The one that concerned me is pxb-pci if we only care about pcie.
> > I'm not sure if we need to make that distinction or not. =20
> >  =20
> Hmm. Shameer pointed out I hallucinated the existence of a PCI only expan=
der bridge.
> So ignore that.
After some more discussions...=20

Ah but it does - just called "pxb" - but it's irrelevant anyway as you can =
only add
them to a PCI root bridge (Shameer tested with a PCIe to PCI bridge with a =
pxb below
it and it rejects that config).  So can't plug them into virt anyway.

That's just for the record if I forget the whole discussion in future ;)

Jonathan

>=20
> > Jonathan
> >  =20
> > > Anyway currently the full support for CXL on virt is in progress here,
> > > https://lore.kernel.org/qemu-devel/20250612134338.1871023-1-Jonathan.=
Cameron@huawei.com/
> > >=20
> > > Jonathan?
> > >=20
> > > Thanks,
> > > Shameer
> > >    =20
> > > >      =20
> > >    =20
> >  =20
>=20

