Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1783246njc;
        Mon, 16 Jun 2025 04:20:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmxGW/N0ByzPHBiMzQvXmSQMxULfGIiCBfuXqTm4tsLBp66W+SJo6QQV8r3cMUjIc/G2EUUW0qYUI5iQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE0iOT/bm/dCAwz4XFd5fL1iqX+TL9crpe409bLhPRdX2TVVzyHSdr436JeMPHUS8eDV9R0
X-Received: by 2002:a05:622a:64a:b0:4a4:3798:3276 with SMTP id d75a77b69052e-4a73c60a0a5mr135899001cf.45.1750072847464;
        Mon, 16 Jun 2025 04:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750072847; cv=none;
        d=google.com; s=arc-20240605;
        b=E5JpTwjGS3Md5sy3dCk/ELuh3OxgWS0L4ppuOPAdQaDj7oQCtwlG/4Lz41O9Vq1vkO
         JKg6yk+ACSSavWQ8q4xEPSMAxMoQL23TsEzY2c8n+GFKlxJ5FOuqC5T7uExxGyAsfslx
         NtGpXnVngFkEcFZbDK5n46qyHHv4QmTDthReUJfMmC8xYCeuIEwLCzvsavrRRUKF/Tp4
         /PnhDsxnvQaTQL42R2+LJFkGajDg5ac8nzAMaSrdY2FEErk7oRkOD3EKgs3ftRx3NbeY
         YXTduapBDOsTn6DP1qZeSFP8p2ygvYo7jzPoLyvKBXgAmvkEVo/SNph7PoAIOgIvo8k1
         xBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=yaZ7qRAWEJWcv54gGgyj1HtyjV+AuTR8G0gF/yfO8uE=;
        fh=M+FVb7brxN1+lXD0/JCk6BEPvLdfCowl9TrFyc8YJkQ=;
        b=Ls9bt92LwINVHekUwnxUPBzpgb9OxpBxDgo8GAQQ9vdPQWI3kfRH01Lww7ZIYPg4v1
         cigpfdGe+vIpm3HjSiNB14bFrLbVrxE0UA0SHqPOVkrxElV3CYfw51UUH0mLRLF+eK/B
         8/sXXRmWGD8+A0f1476nUVXRO7mY3d2ChazdKXBpL1dL9enKE5XZaAr3mLyr8YOM7/K6
         iGiCm0U4DPSzfm3eJBY7v7if4mIX2UYQdiR0c/wvw6qiNj+Puwr12RcgNZFGgvE8ElAS
         zZC3nEiLzxnb7shQx3qDap+mIGQK0InB85sSDOJesABjk8EUXgVDiNDwM49VRzJnfR/T
         7rdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b9d0fsi96108551cf.21.2025.06.16.04.20.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 04:20:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR7tG-0005Tq-PK; Mon, 16 Jun 2025 07:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uR7tD-0005TW-V9; Mon, 16 Jun 2025 07:20:36 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uR7t7-00059S-0w; Mon, 16 Jun 2025 07:20:34 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bLSFl5FlRz6M54K;
 Mon, 16 Jun 2025 19:19:39 +0800 (CST)
Received: from frapeml500005.china.huawei.com (unknown [7.182.85.13])
 by mail.maildlp.com (Postfix) with ESMTPS id C819C140119;
 Mon, 16 Jun 2025 19:20:11 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500005.china.huawei.com (7.182.85.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Jun 2025 13:20:11 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 16 Jun 2025 13:20:11 +0200
To: Jonathan Cameron <jonathan.cameron@huawei.com>, Linuxarm
 <linuxarm@huawei.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "imammedo@redhat.com" <imammedo@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>, "mochs@nvidia.com"
 <mochs@nvidia.com>, "smostafa@google.com" <smostafa@google.com>, "Wangzhou
 (B)" <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe Root
 Complex association
Thread-Topic: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe Root
 Complex association
Thread-Index: AQHb3HJK5cxfqqKOvUqssRJx2PlFXrQFdhmAgAAxU/A=
Date: Mon, 16 Jun 2025 11:20:11 +0000
Message-ID: <5c8491549a844014b363ed3ba9fd5956@huawei.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-2-shameerali.kolothum.thodi@huawei.com>
 <20250616112019.00003bce@huawei.com>
In-Reply-To: <20250616112019.00003bce@huawei.com>
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
X-TUID: vet8ESdrraa8



> -----Original Message-----
> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Monday, June 16, 2025 11:20 AM
> To: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; Linuxarm
> <linuxarm@huawei.com>
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> nicolinc@nvidia.com; ddutile@redhat.com; berrange@redhat.com;
> imammedo@redhat.com; nathanc@nvidia.com; mochs@nvidia.com;
> smostafa@google.com; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
> Subject: Re: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe
> Root Complex association
>=20
> On Fri, 13 Jun 2025 15:44:43 +0100
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > Although this change does not affect functionality at present, it is
>=20
> Patch title says PCIe.  This check is vs PCI host bridge.
>=20
> No idea which one you wanted, but if it is PCIe needs to be
> TYPC_PCIE_HOST_BRIDGE from pcie_host.h not the pci_host.h one
> I think.

Looking at the code in virt.c and virt-acpi-build.c , this should be=20
TYPE_PCI_HOST_BRIDGE. I will change the documentation to=20
refer to PCI host bridge.

Thanks,
Shameer

>=20
> > required when we add support for user-creatable SMMUv3 devices in
> > future patches.
> >
> > Tested-by: Nathan Chen <nathanc@nvidia.com>
> > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  hw/arm/smmu-common.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > index f39b99e526..7890aa12c1 100644
> > --- a/hw/arm/smmu-common.c
> > +++ b/hw/arm/smmu-common.c
> > @@ -20,6 +20,7 @@
> >  #include "trace.h"
> >  #include "exec/target_page.h"
> >  #include "hw/core/cpu.h"
> > +#include "hw/pci/pci_bridge.h"
> >  #include "hw/qdev-properties.h"
> >  #include "qapi/error.h"
> >  #include "qemu/jhash.h"
> > @@ -937,7 +938,8 @@ static void smmu_base_realize(DeviceState *dev,
> Error **errp)
> >                                       g_free, g_free);
> >      s->smmu_pcibus_by_busptr =3D g_hash_table_new(NULL, NULL);
> >
> > -    if (s->primary_bus) {
> > +    if (s->primary_bus && object_dynamic_cast(OBJECT(s->primary_bus)-
> >parent,
> > +                                              TYPE_PCI_HOST_BRIDGE)) {
> >          pci_setup_iommu(s->primary_bus, &smmu_ops, s);
> >      } else {
> >          error_setg(errp, "SMMU is not attached to any PCI bus!");

