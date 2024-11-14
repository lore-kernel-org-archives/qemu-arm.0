Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp190802njc;
        Thu, 14 Nov 2024 01:11:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXIrybUTJfGthljbPLJ7asF9CS1rxCtpWB22+cvbhoj26BSgDY3OKTjcBoGhj/ctp8Srj2VIoDtv32Wdw==@linaro.org
X-Google-Smtp-Source: AGHT+IFZ0E2Mn8ju/2c1Zd9jL0YaCI4MTqUDVtYe016AF8yBdvUWXf61zas/mjQuTjEhVuNqBEpe
X-Received: by 2002:a05:6214:1c43:b0:6cc:819:5075 with SMTP id 6a1803df08f44-6d3e906af86mr36717216d6.18.1731575519086;
        Thu, 14 Nov 2024 01:11:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731575519; cv=none;
        d=google.com; s=arc-20240605;
        b=EITNxy8+8upHyYkEPN5AN9orSqIiPhnKZXKGSF2ts2+TWojUKrgPkrr2HZl7AJCnlZ
         GwQ6WQPK2K1v0NzLMFshGliSWPeYnge3Iz8+rVrorODxey5HHLaocaINXsI6/N3x2QGd
         3B3OCheoMZ/iKAAuF1IPCrdi4D19AFy6QiAMqFPFd65xcEe1ObNR96joD3+C7PqnOaFw
         pfAnf/L4/r/N6B6tNGI48x1JEgZaxKMye1d9h4OMki9r7+1YnEezOF9v/MMfpg2vbjr9
         LE3vKaMXvCYhV2bikaSa9pPLxxpNcVMawIlMiHxjEEgbwUqmnn7ldrluJmhbMAzOHzct
         T0Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=SqskdsKcqu7U1KsrUktkXzHzHYXjFd9yKEue5uZ7ENA=;
        fh=SxKlX6GqXD55EMB3sC/XQHOKdHr3I93AWwhAE1qtX1w=;
        b=kNjjCia31TiDKtS/MEoYnuocSYs9YO3eHgK0R0wWLF83kzPunEOiyBzUkhrtIcLHCe
         gl8P4gfwaSpaosOd+ZyC02IMYqeguknMxGF4Vf9J0mxwYblSJnlssG8MFdoOdEjOE5jh
         4b53kc5yAoGVg4b+mg8ES8eAxUxylEb5TZk0OOZz3xHvNVrpJO06ow32SoPvR1dIeiSd
         cmiH2fuJ1v5hPYI/Gs8hobk+8iKz7TW4iLFiGKd57MSYLKztL5pvWZvSv53bJq09BCDg
         f8xDtRX/N6Le7xtNqsU37jBiFQXFUIOk2sJL3q10eEpj7ZvAqVfH4XrDNB6uzVOSnNJw
         VLgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3ee75ecf1si7744126d6.83.2024.11.14.01.11.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 01:11:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBVt3-0007Wv-3l; Thu, 14 Nov 2024 04:11:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tBVt1-0007Vi-EJ; Thu, 14 Nov 2024 04:11:35 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tBVsz-0006zv-9a; Thu, 14 Nov 2024 04:11:35 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XpvXJ5LbXz6K95v;
 Thu, 14 Nov 2024 17:11:12 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
 by mail.maildlp.com (Postfix) with ESMTPS id D48F5140C72;
 Thu, 14 Nov 2024 17:11:26 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 10:11:26 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 14 Nov 2024 10:11:26 +0100
To: Nicolin Chen <nicolinc@nvidia.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm
 <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Thread-Topic: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Thread-Index: AQHbMeB0+Q5BEZc9JkeH/U6Jz+dF4rK1tXyAgADOPsA=
Date: Thu, 14 Nov 2024 09:11:26 +0000
Message-ID: <a42e6e282fa745c0b2047d8b100daad6@huawei.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <ZzUdYWad9HLo/w6t@Asurada-Nvidia>
In-Reply-To: <ZzUdYWad9HLo/w6t@Asurada-Nvidia>
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
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.738, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: Gm8Khjb3vxj8



> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Wednesday, November 13, 2024 9:43 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> ddutile@redhat.com; Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>;
> zhangfei.gao@linaro.org
> Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
> nested SMMUv3
>=20
> On Fri, Nov 08, 2024 at 12:52:37PM +0000, Shameer Kolothum wrote:
> > This RFC is for initial discussion/test purposes only and includes
> > patches that are only relevant for adding the "arm-smmuv3-nested"
> > support. For the complete branch please find,
> > https://github.com/hisilicon/qemu/commits/private-smmuv3-nested-dev-
> rf
> > c-v1/
>=20
> I guess the QEMU branch above pairs with this (vIOMMU v6)?
> https://github.com/nicolinc/iommufd/commits/smmuv3_nesting-with-rmr

I actually based it on top of a kernel branch that Zhangfei is keeping for =
his verification tests.
https://github.com/Linaro/linux-kernel-uadk/commits/6.12-wip-10.26/

But yes, it indeed looks like based on the branch you mentioned above.

Thanks,
Shameer.
