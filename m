Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp162315njc;
        Thu, 14 Nov 2024 00:01:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZ2aTEvNFvR0lBbqiRo106xsEsL5rIeJbX/W4amJXNI6Fn9WQqFkeOIHWbRRk7cd1SQfKIKQQRc1gkcQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFavD4Fmlar+k/1K7anRRVdzXqc0M4UCyUpvSaCoCtnk1CCG5Uy7KFCkgJPZSS/KajPlgGw
X-Received: by 2002:a05:6808:200c:b0:3e6:5347:8e17 with SMTP id 5614622812f47-3e79470a1f6mr24995113b6e.31.1731571313524;
        Thu, 14 Nov 2024 00:01:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731571313; cv=none;
        d=google.com; s=arc-20240605;
        b=Qc4d4uuEP7FAEnIjJ8Jw/4VrFNz0o+047y+J3ZlzH+Y0aPNzZmHa9GSgpgtfNYz2zC
         3/1ETqsDNpbGtPSPhW0t9ITELc8+/3WOw6Ee//QnMWZRMwWC6BjPvNdd8rSfiSy6+u7p
         vA7ETjLKqKrBBaMj85i2GIwyFaEcMOFYo3uJBIa4zQ3Qw+VLxqGFra05KGemEzcOCZIx
         kGUiA4GhH3DqVgWdaAMPAvUO7P+zV/iB6ofUDT4oFcEVUjoGl4k08v6ZNJrWSHI2Dxgw
         QhVvaew0nPKHdGBjFe1lBfzKFld96XYhCVCKsSi38FfYiPVgx/wRLRVIdwkGjCh19q/N
         c+vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=iEiXflid8zB7uV74HeCRNQqo/8YpPfYiYNbYneYXkiw=;
        fh=x0GfwJZL9sKMawJWDxK69B0nTIE1xQuGFi17xCt7ST4=;
        b=lCvRZZT5RFsmomxp5MTQzhfpaciavV8GdzVa1+MSBTJsoyZFTCDqj+G0u4f1G5C50F
         oj4YQTXek70naPVl4Ex8UIzqCadYmbuSEBGT61dU5TsVklLPyMmNh8B8fe+hq2Jj0m55
         73W+Ztd3vhLD5zjuOP/iJoG3xNjVznQp3Np4+EhAXGLtTdYiVaXZQzPC2ET6N0w3WwZl
         tElquYiO8kdC6A0+8fyG1sirt8CrSu3PMAzXVqqK9axMsJuD/7Z/CRcTpNxoDF5szZGK
         3Sj51/fXCVyKv3RgVPy2WnPNdVrMV+kcaZS7JCJaNLKJhXgkj+yfWHzGH97XQd2XuLFI
         R6Sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3ee75eb5esi6545116d6.38.2024.11.14.00.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 00:01:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBUnL-0006Y8-Gw; Thu, 14 Nov 2024 03:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tBUnI-0006Xc-6m; Thu, 14 Nov 2024 03:01:36 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tBUnE-0001tX-PI; Thu, 14 Nov 2024 03:01:35 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XpsxY5RdJz6K9Ff;
 Thu, 14 Nov 2024 15:59:29 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 42D23140B55;
 Thu, 14 Nov 2024 16:01:29 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 09:01:29 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 14 Nov 2024 09:01:29 +0100
To: Mostafa Saleh <smostafa@google.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Thread-Topic: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Thread-Index: AQHbMeB0+Q5BEZc9JkeH/U6Jz+dF4rK1Wk4AgAEXftA=
Date: Thu, 14 Nov 2024 08:01:28 +0000
Message-ID: <200df57473694689a914e16f3db8db59@huawei.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <ZzTQ5Dn8ckIJjxc-@google.com>
In-Reply-To: <ZzTQ5Dn8ckIJjxc-@google.com>
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
X-TUID: 78EgQzN1cIaw

Hi Mostafa,

> -----Original Message-----
> From: Mostafa Saleh <smostafa@google.com>
> Sent: Wednesday, November 13, 2024 4:17 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> nicolinc@nvidia.com; ddutile@redhat.com; Linuxarm
> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
> Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
> nested SMMUv3
>=20
> Hi Shameer,
>=20
> On Fri, Nov 08, 2024 at 12:52:37PM +0000, Shameer Kolothum via wrote:
> > Hi,
> >
> > This series adds initial support for a user-creatable "arm-smmuv3-neste=
d"
> > device to Qemu. At present the Qemu ARM SMMUv3 emulation is per
> machine
> > and cannot support multiple SMMUv3s.
> >
>=20
> I had a quick look at the SMMUv3 files, as now SMMUv3 supports nested
> translation emulation, would it make sense to rename this? As AFAIU,
> this is about virt (stage-1) SMMUv3 that is emulated to a guest.
> Including vSMMU or virt would help distinguish the code, as now
> some new function as smmu_nested_realize() looks confusing.

Yes. I have noticed that. We need to call it something else to avoid the=20
confusion. Not sure including "virt" is a good idea as it may indicate virt
machine. Probably "acc" as Nicolin suggested to indicate hw accelerated.=20
I will think about a better one. Open to suggestions.

Thanks,
Shameer

