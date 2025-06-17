Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2648201njc;
        Tue, 17 Jun 2025 09:53:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnZjei8lrGgpEIROioqdAfgKOPc8l86099N7gnRSBMisjlq1t4ASntsT4vgfZf2ec1u7l25+Nv5y8hKA==@linaro.org
X-Google-Smtp-Source: AGHT+IHemZ4Mpiim4zANWuB+KoAlSSrYNoiVb9nL8VoMc5Gi1tfJeqMI6y+NY3QHlbwGtKzPV4Y5
X-Received: by 2002:a05:620a:3728:b0:7c5:a2f8:e6e4 with SMTP id af79cd13be357-7d3c6cd9f30mr1928370785a.29.1750179203118;
        Tue, 17 Jun 2025 09:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750179203; cv=none;
        d=google.com; s=arc-20240605;
        b=ienxDur4sxAsiKzFdQVuh9X/pHRCwOTjFqcbUSgbifVhNU0+5QRYP5eT9NnQR/HTgR
         0mdV3dSrdoD5+rA6388//ZNmidRKL6NcZtg8F1fZlTtkhaLLXz/NHPaRWbSAx4BzbrtN
         7q/FbI61yUqEySccCDyC5VxzvXSjNw+EJGPGQ7E0+BwpugGv62Y7OmThTb6GwapEtx5c
         o1j8b0zzEaKwXsP5XPKg05Kzc9mNMtmcQvrH4DkpYeTJXTgH6N7UMp0WGYpoB6xG3kEB
         /hvL4wriUqvMC3th0CFe9wlk4AGyaF+6HZzmhdOKnzcNW/NHF9WCrzjFeZzKY/9+cG6M
         SThg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=Oh9t9FePPeBQUPn3VbCRAqhYms+rFlV/D1nfHmy9OC4=;
        fh=8xY/DYhzWq+uYW2qsMAbsQ/c52rTeig8fka6bv6XWd4=;
        b=etmwE7iPlbktFW3txc5urafj9nsSnyj5JhYUWwRNsX5umeaHd90DQxkzcEQEybghoW
         058xDwkFkjXsfKDfZaC5sBF7hnm8sU7xWuwQAdyK8o23gwXIJh4Koc4LoC3nAu8IXlhV
         ci2YUuXMe8Tiej+LHUhO3RvzG+e0qZ116+vYyftgX9UYZcKiCUTo7x8c0YAtHWD+1anJ
         oMn2HTL5byzLUM7wU4gQBH0Zxxqq5zNxmBLPmjn5L5j0YkRczlB1HwGoa7u/FuN3E5T4
         /9tMl0o9L0SwIN85VJBhhtdvjQBkLHmT/PHttBYbN5mGKLPTSDPDy0h9dwF4WSTzbQMl
         3wZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f20ac9si1257587085a.491.2025.06.17.09.53.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jun 2025 09:53:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRZYc-0004Cw-Vr; Tue, 17 Jun 2025 12:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uRZYa-0004CX-6d; Tue, 17 Jun 2025 12:53:08 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uRZYW-0002xc-3V; Tue, 17 Jun 2025 12:53:07 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bMCb4063Wz6M4WJ;
 Wed, 18 Jun 2025 00:52:16 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id E3A041404C4;
 Wed, 18 Jun 2025 00:52:49 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Jun
 2025 18:52:49 +0200
Date: Tue, 17 Jun 2025 17:52:47 +0100
To: Eric Auger <eric.auger@redhat.com>
CC: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <nicolinc@nvidia.com>,
 <ddutile@redhat.com>, <berrange@redhat.com>, <imammedo@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe Root
 Complex association
Message-ID: <20250617175247.00007d43@huawei.com>
In-Reply-To: <fcd05844-d2d9-450e-b962-59b0f3964185@redhat.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-2-shameerali.kolothum.thodi@huawei.com>
 <20250616112019.00003bce@huawei.com>
 <fcd05844-d2d9-450e-b962-59b0f3964185@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3NPvh5Iowijb

On Tue, 17 Jun 2025 09:49:54 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> On 6/16/25 12:20 PM, Jonathan Cameron wrote:
> > On Fri, 13 Jun 2025 15:44:43 +0100
> > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> > =20
> >> Although this change does not affect functionality at present, it is =
=20
> > Patch title says PCIe.  This check is vs PCI host bridge.
> >
> > No idea which one you wanted, but if it is PCIe needs to be
> > TYPC_PCIE_HOST_BRIDGE from pcie_host.h not the pci_host.h one
> > I think. =20
> I think we need TYPE_PCI_HOST_BRIDGE as we want to check against pxb
>=20
> pci-bridge/pci_expander_bridge.c:=A0=A0=A0 .parent=A0=A0=A0=A0=A0=A0=A0 =
=3D TYPE_PCI_HOST_BRIDGE,

Hmm. That's awkward and I'd forgotten that wrinkle.
Need a stronger test but which one?  The PXB root bus has a parent of
TYPE_PCIE_BUS.  Maybe we can check that?


>=20
> Besides the commit title/desc suggested by Jonathan you may also refine
> the error msg which can stem now from 2 different causes
>=20
> Thanks
>=20
> Eric
> > =20
> >> required when we add support for user-creatable SMMUv3 devices in
> >> future patches.
> >>
> >> Tested-by: Nathan Chen <nathanc@nvidia.com>
> >> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> >> ---
> >>  hw/arm/smmu-common.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> >> index f39b99e526..7890aa12c1 100644
> >> --- a/hw/arm/smmu-common.c
> >> +++ b/hw/arm/smmu-common.c
> >> @@ -20,6 +20,7 @@
> >>  #include "trace.h"
> >>  #include "exec/target_page.h"
> >>  #include "hw/core/cpu.h"
> >> +#include "hw/pci/pci_bridge.h"
> >>  #include "hw/qdev-properties.h"
> >>  #include "qapi/error.h"
> >>  #include "qemu/jhash.h"
> >> @@ -937,7 +938,8 @@ static void smmu_base_realize(DeviceState *dev, Er=
ror **errp)
> >>                                       g_free, g_free);
> >>      s->smmu_pcibus_by_busptr =3D g_hash_table_new(NULL, NULL);
> >> =20
> >> -    if (s->primary_bus) {
> >> +    if (s->primary_bus && object_dynamic_cast(OBJECT(s->primary_bus)-=
>parent,
> >> +                                              TYPE_PCI_HOST_BRIDGE)) {
> >>          pci_setup_iommu(s->primary_bus, &smmu_ops, s);
> >>      } else {
> >>          error_setg(errp, "SMMU is not attached to any PCI bus!"); =20
>=20
>=20

