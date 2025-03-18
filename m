Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2805171njb;
        Tue, 18 Mar 2025 02:51:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWM/wScRbJhwmRmB1EBTbOd76QKC/VVZ7TslKYqceKIKWhtflGHWX3SnWt/PVmeKwY6nbXvl1j5O0T4JA==@linaro.org
X-Google-Smtp-Source: AGHT+IF5rDAU2e0JgW7G+uAGfYtnvMeuiYv0lVIp1uY6bbAyXiUHtO9x3hJ6XIa+dZCzPgNJvomE
X-Received: by 2002:a05:622a:4105:b0:471:9e02:365e with SMTP id d75a77b69052e-476fcc8cc0cmr46871981cf.8.1742291462490;
        Tue, 18 Mar 2025 02:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742291462; cv=none;
        d=google.com; s=arc-20240605;
        b=ET6g5yWZClUUc8ZG1XPGF/0qOXdYSrvcmGNZ4h2NHI/PXbXcbLpnbmLVkwgkIbvCLu
         BnaoohY6sVcmezxUtY7kHYKS6V/U3JGjKqFqcUZ/8z1Sc2a3Y8YF4dqR0m6l6xcOfyfP
         on+m3BlWtC3scEsJ1eEzI5hUA0JodGcea2nRAMBEEdwYCrHZ1lPinp82ub7Br2rrruDl
         Y/Vn9AwIaONokYZlI2A9dBtubcFbL4eK2fPp1kUvpTeJIPNWIid/wA1ZgOIkY+o1HdeU
         fJt7saWzOVODvsFk5iLtdSwDCfQPYrw5etsQ2lyfKaRiwgzhvoYerG9GxOiB8tirjjNu
         SM5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=vBdfE+guMoOUroKckxnfsDJE3UOhXwPDekz00ea/M0M=;
        fh=1WEkewTK78k3qlRvWY5Q2wxh/YxNm3fek+uXiKnkXXw=;
        b=ZY9E8HiwiHJGTxvR5gc/TiDOQjrI2HudkjS2jLmpNVdX/DlEIfs+EYqrwPRgusqYpZ
         nsJ99sw88DLv8d85gU98IQIeUWylIbkHhkScKdDAEQpHKTLP1gw2IT47UAFk34CYSXZk
         HfJoYyTIZ0QkpbzuS+brLQTNi2jCZV5Jda++zeoMrgynzU13IBvvW3g/uz2AMtMNVvqO
         aEDN3qAjmR8BQihFWMaoX7QLxg57mOVFUHgPqzx4xbRco3NOEYR00rVjuiLqmj8fEvpI
         KKNyY0yQNp2n3mI7qg1iEVwdqGNTEsqH2nEoHFMnBC+9ACQWb++m9W9Y/6ZWQliKRV3b
         T8pA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb7e191esi120236021cf.292.2025.03.18.02.51.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 02:51:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuTaw-0002rb-GG; Tue, 18 Mar 2025 05:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tuTap-0002pH-Fq; Tue, 18 Mar 2025 05:50:40 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tuTan-00086H-JM; Tue, 18 Mar 2025 05:50:39 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZH6T958vMz6K9SG;
 Tue, 18 Mar 2025 17:47:41 +0800 (CST)
Received: from frapeml100006.china.huawei.com (unknown [7.182.85.201])
 by mail.maildlp.com (Postfix) with ESMTPS id 960411406AF;
 Tue, 18 Mar 2025 17:50:33 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100006.china.huawei.com (7.182.85.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Mar 2025 10:50:33 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Tue, 18 Mar 2025 10:50:33 +0100
To: Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
CC: Eric Auger <eric.auger@redhat.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "ddutile@redhat.com"
 <ddutile@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>, "mochs@nvidia.com"
 <mochs@nvidia.com>, "smostafa@google.com" <smostafa@google.com>, Linuxarm
 <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
Thread-Topic: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
Thread-Index: AQHbkpt/2E04sj23iE6hCb84oIWO4LNvjRwAgAgITACAAAOdAIAAEXKAgAAEEoCAAA8zgIAA8qWA
Date: Tue, 18 Mar 2025 09:50:33 +0000
Message-ID: <674203f67b8a4fc49b529c9adba62f1f@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-4-shameerali.kolothum.thodi@huawei.com>
 <d75feb00-72d3-4d79-a7ac-2548eadb6a77@redhat.com>
 <Z9hh8MIAQNQcvNlG@Asurada-Nvidia>
 <71b73212-3d8f-4c9d-93a4-bf07c0f169e3@redhat.com>
 <Z9hzmzHfWw18OyGO@Asurada-Nvidia> <20250317192453.GR9311@nvidia.com>
 <Z9iDxSvZVsgtasGj@Asurada-Nvidia>
In-Reply-To: <Z9iDxSvZVsgtasGj@Asurada-Nvidia>
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
X-TUID: +dmItEnhI+G+



> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Monday, March 17, 2025 8:19 PM
> To: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Eric Auger <eric.auger@redhat.com>; Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
> qemu-devel@nongnu.org; peter.maydell@linaro.org; ddutile@redhat.com;
> berrange@redhat.com; nathanc@nvidia.com; mochs@nvidia.com;
> smostafa@google.com; Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>;
> zhangfei.gao@linaro.org
> Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
> infrastructure for smmuv3-accel device
>=20
> On Mon, Mar 17, 2025 at 04:24:53PM -0300, Jason Gunthorpe wrote:
> > On Mon, Mar 17, 2025 at 12:10:19PM -0700, Nicolin Chen wrote:
> > > Another question: how does an emulated device work with a
> vSMMUv3?
> > > I could imagine that all the accel steps would be bypassed since
> > > !sdev->idev. Yet, the emulated iotlb should cache its translation
> > > so we will need to flush the iotlb, which will increase complexity
> > > as the TLBI command dispatching function will need to be aware what
> > > ASID is for emulated device and what is for vfio device..
> >
> > I think you should block it. We already expect different vSMMU's
> > depending on the physical SMMU under the PCI device, it makes sense
> > that a SW VFIO device would have it's own, non-accelerated, vSMMU
> > model in the guest.
>=20
> Yea, I agree and it'd be cleaner for an implementation separating
> them.
>=20
> In my mind, the general idea of "accel=3Don" is also to keep things
> in a more efficient way: passthrough devices go to HW-accelerated
> vSMMUs (separated PCIE buses), while emulated ones go to a vSMMU-
> bypassed (PCIE0).
>=20
> Though I do see the point from QEMU prospective that user may want
> to start a VM with HW-accelerated vSMMU for one passthrough device
> using a simple setup without caring about the routing via command.

For now we don't use iotlb for accel cases with emulated devices. So probab=
ly
can document/warn the user about possible performance degradation if they
attach such a device rather than blocking.

Thanks,
Shameer
=20
