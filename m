Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1724287njb;
        Thu, 6 Feb 2025 10:18:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVr/+l/sLgVq0S6W81HrBXeHBZ2totgcUaXvkjQ6iU2bsdFh5hoG2uZ0/Iez41Ol8vqA7dVDQlqllaPow==@linaro.org
X-Google-Smtp-Source: AGHT+IEbfQyge4mNiJ1DmMT+9eD5T/4Sbmu+FzkJnTj/St/MvdyjJM/v5HBvzXdDYWrpFi+GFKo9
X-Received: by 2002:a05:6214:2621:b0:6d8:af66:6344 with SMTP id 6a1803df08f44-6e4455c1f88mr197616d6.2.1738865919930;
        Thu, 06 Feb 2025 10:18:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738865919; cv=none;
        d=google.com; s=arc-20240605;
        b=OHFagbpdFMSdSMsCNSrAqSlqHHCHXuAhEpbeX3BmiZFKQfw2Iuaewz9A5H5pPsISvg
         IDgOzFP03o7RZ5n2RCMMCjHEFtnrZyo6aUEbtScQyUGVlsiqy5UfFUsoghpDpXZMElT3
         ys+PkyBnj64b0R76bKDf5mjSa2sLN9wCa3FPNNE/utMCmvnxhp7VV7F9pcHaUZutzLYm
         9sqjpwXQSXANXnXzJC+wKq0AWT01407Im+Ua0Vo7fd5Xcg4WXMOE8fxNP0xvJqp1R3M5
         RsqCr7oOwfFOuQYCMWz5tsYxULZmvgM5wO+gwrv1Ymhj/OSGPFM7tyU3sLx8krzJT2WE
         tZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=vGEvc0FcaunFy84QE+165SaeTn1K7bjt+dX8PALP1sE=;
        fh=yFj9hWScSv9DwnbjhfKzaTbCbb9qWMrFsLaG4jFm/ko=;
        b=KKwrZeS6M2pPZGPJ2gnlv/FK7OUHPoIfR0LkisbAMR3e8YJ0jVSa5486EuYq0zJErm
         WEs807I9DZVkg32fTiSSwPmfiN9tCdGsXnB4qxt0E0OHl8S2HujqPouFzWgQGEsowWs3
         /cHK0uHlCm6+NWs0qm9RT9Qpn8RtB5g1SD/nQNJVXiu0vXtE88h9HAkCzhz1grig5rqQ
         wx3hQ1TYYd3qeughVk3CLZE7891+YNxP68o9tsX0z810yDm64iUzBA5dQLAcl8Boi67U
         tYJC0m2YXHh+wNZP3Tie16sK9vxVE6IjT07S0MsVSmS1QPwwneCAUfYs1Ox4pwRcWPUB
         tYug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43ba3acbasi15898996d6.156.2025.02.06.10.18.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 10:18:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg6SF-0007X7-DC; Thu, 06 Feb 2025 13:18:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tg6SD-0007Wr-P2; Thu, 06 Feb 2025 13:18:22 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tg6SB-0006Gu-FL; Thu, 06 Feb 2025 13:18:21 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Yplf6092gz67Cwc;
 Fri,  7 Feb 2025 02:15:58 +0800 (CST)
Received: from frapeml100006.china.huawei.com (unknown [7.182.85.201])
 by mail.maildlp.com (Postfix) with ESMTPS id 81DB21402C4;
 Fri,  7 Feb 2025 02:18:15 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100006.china.huawei.com (7.182.85.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Feb 2025 19:18:15 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 6 Feb 2025 19:18:15 +0100
To: Jason Gunthorpe <jgg@nvidia.com>
CC: =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm
 <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>, "nathanc@nvidia.com"
 <nathanc@nvidia.com>
Subject: RE: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Thread-Topic: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Thread-Index: AQHbMeB0+Q5BEZc9JkeH/U6Jz+dF4rMv66IAgAA0HqCAAb2VAIAIsUnQgAADD4CAAB6MsIAAJxaAgAATMvCAABLUAIAAAjUAgAAKIYCAAAJIgIAAAQ2AgAARRyD///K+AIAAERgA
Date: Thu, 6 Feb 2025 18:18:14 +0000
Message-ID: <02a0080a4a1642d69b7f5dd4707a5b3d@huawei.com>
References: <Z6SQ3_5bcqseyzVa@redhat.com>
 <f898b6de4a664fe8810b06b7741e3120@huawei.com> <Z6TLSdwgajmHVmGH@redhat.com>
 <71116749d1234ab48a205fd2588151ec@huawei.com>
 <20250206170238.GG2960738@nvidia.com> <Z6TtCLQ35UI12T77@redhat.com>
 <20250206174647.GA3480821@nvidia.com> <Z6T3cX_fM-aeYbMI@redhat.com>
 <20250206175843.GI2960738@nvidia.com>
 <13b1d8b97a314cb28b87563fa9b45299@huawei.com>
 <20250206181306.GK2960738@nvidia.com>
In-Reply-To: <20250206181306.GK2960738@nvidia.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.156.189]
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
X-TUID: 8fMgaJU8AvPo



> -----Original Message-----
> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, February 6, 2025 6:13 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: Daniel P. Berrang=E9 <berrange@redhat.com>; qemu-arm@nongnu.org;
> qemu-devel@nongnu.org; eric.auger@redhat.com;
> peter.maydell@linaro.org; nicolinc@nvidia.com; ddutile@redhat.com;
> Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>;
> zhangfei.gao@linaro.org; nathanc@nvidia.com
> Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
> nested SMMUv3
>=20
> On Thu, Feb 06, 2025 at 06:04:57PM +0000, Shameerali Kolothum Thodi
> wrote:
> > > Some kind of hot plug smmu would have to create a vSMMU without
> any
> > > kernel backing and then later bind it to a kernel implementation.
> >
> > Not sure I get the problem with associating vSMMU with a pSMMU.
> Something
> > like an iommu instance id mentioned before,
> >
> > -device arm-smmuv3-accel,id=3Dsmmuv2,bus=3Dpcie.2,host-smmu=3Diommu.1
> >
> > This can realize the vSMMU without actually creating a vIOMMU in kernel=
.
> > And when the dev gets attached/realized, check (GET_HW_INFO)the
> specified
> > iommu instance id matches or not.
> >
> > Or the concern here is exporting an iommu instance id to user space?
>=20
> Philisophically we do not permit any HW access through iommufd without
> a VFIO fd to "prove" the process has rights to touch hardware.
>=20
> We don't have any way to prove the process has rights to touch the
> iommu hardware seperately from VFIO.

It is not. Qemu just instantiates a vSMMU and assigns the IOMMU=20
instance id to it.

>=20
> So even if you invent an iommu ID we cannot accept it as a handle to
> create viommu in iommufd.

Creating the vIOMMU only happens when the user does a  cold/hot plug of
a VFIO device. At that time Qemu checks whether the assigned id matches
with whatever the kernel tell it.=20

Thanks,
Shameer
