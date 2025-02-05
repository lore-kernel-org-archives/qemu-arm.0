Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp793447njb;
        Wed, 5 Feb 2025 02:44:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFEGNI4L50WHvg1fB1iiA8fp3a68t7z5X2dR0qR8POMvbLzyvQsr6Js18vOfSYGuUdb14Rhf4D/cIfKQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHdzmyM5N3S8AmlE/a/BMZb5dRvbRKJhnT1FPFvYkO1S/iAFz1ngjyXA8foqk/ciBm1iLiZ
X-Received: by 2002:a05:620a:bd4:b0:7b6:f998:3368 with SMTP id af79cd13be357-7c03a042570mr265957985a.57.1738752288258;
        Wed, 05 Feb 2025 02:44:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738752288; cv=none;
        d=google.com; s=arc-20240605;
        b=DqinC3n5jAPJ00SgZSMbpQxRT6q6RoimVmhotSstYMiaUbUprIoA1gfOCZWC0zIPAu
         YNaGIjvH+JQ9g7clCVtuNZTCfStr6HU1JJZwwv7mMBvGP/N46XK4kxBnTICyaSCeukiw
         1lLBKg2ymOKdlPI/tzzSmhp+3+ARzLLAKRLlPcb7Va5pVroMuX0E9vG1wU6x2emRSP5u
         rnlLoracyF2aKlPO3A9b/8HuDnli4m1Die6LZ00rWCe19YuRpiPOuQyQSpdh2lAnCiK0
         AVTXqAZTekOMEln4watfe/Yymk7GpM5qrJ3V2BtnSsHR/eiu0tJrhCJeXZRMfP46vvxz
         iD+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=cvlOU8rut4jfEFt+d0/lVGJGUDlpGPQ3b+K0nJMlgtc=;
        fh=nmpT9UunnqPBqTHH72Bg9QGpqQocxcryizfdCLtWIR0=;
        b=bNBWxW/EOQVTzVgCbnU6vJBazugJkSMd4X790TrvyR+1wwVBAOcWHcDetYhghnitNM
         /GYktS/CTI8oQOp5Ht1qe82c2wBEEu2LIx/sTjWxah6PnIEo07g2onWOO7aRd1/VK/bp
         3SBowIN4yxF3E5lPs0nJ8k6hQtiZe/9YerDrNTJZ3EFR4JwUKvtokZyG/RB+OSrFkSf9
         qDwIx0B1xdPAoWNDb2a9cqIphIhNa5CLXQnA6gFiEb9eFA5vH4GJ1XS04XUjwxBipDNf
         c+875m7epkEAnHn6SsKGGkKdSDeLQUcvlo/2tWJkMxXP3GINgb8CYdT+6QaZX+oOmpht
         BM1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02dbe91d2si484498185a.404.2025.02.05.02.44.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2025 02:44:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfctJ-0006SO-1S; Wed, 05 Feb 2025 05:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tfctF-0006RK-Pd; Wed, 05 Feb 2025 05:44:17 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tfctB-0005zA-SY; Wed, 05 Feb 2025 05:44:16 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YnxcR1jRmz6D8X1;
 Wed,  5 Feb 2025 18:41:43 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id B0895140CB1;
 Wed,  5 Feb 2025 18:43:58 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Feb 2025 11:43:53 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Wed, 5 Feb 2025 11:43:53 +0100
To: Nicolin Chen <nicolinc@nvidia.com>, Eric Auger <eric.auger@redhat.com>
CC: "ddutile@redhat.com" <ddutile@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Jason Gunthorpe <jgg@nvidia.com>,
 =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)"
 <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, "zhangfei.gao@linaro.org"
 <zhangfei.gao@linaro.org>
Subject: RE: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Thread-Topic: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Thread-Index: AQHbMeB0+Q5BEZc9JkeH/U6Jz+dF4rLkOMCAgAAM2QCAAAz2gIAEhqeggCVVAYCAI176AIAE12cAgAGBGYCAAGn5AIAAwbpw
Date: Wed, 5 Feb 2025 10:43:53 +0000
Message-ID: <b0ba9582d8bb431da39c115e4c5f1ffb@huawei.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <Z1wh69_gZ9izr1iU@redhat.com> <Z1wsslDnwlth3A8+@nvidia.com>
 <CAFEAcA8TW2RKyFnh-TZRpfaKfZipHD5TZy_hymUr41GJ4rs4xA@mail.gmail.com>
 <329445b2f68a47269292aefb34584375@huawei.com>
 <Z39Ugx2M+FRFVVpB@Asurada-Nvidia>
 <f4e64a3a-5c1d-49f2-ac72-b84ecd353c9d@redhat.com>
 <Z6EQENkHJy7TrkYy@Asurada-Nvidia>
 <77f736f6-9ef9-462b-916e-c8cfff279044@redhat.com>
 <Z6KsAE9wnjWU0xMs@Asurada-Nvidia>
In-Reply-To: <Z6KsAE9wnjWU0xMs@Asurada-Nvidia>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_BTC_ID=0.499,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 THREAD_INDEX_BAD=3.199 autolearn=no autolearn_force=no
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
X-TUID: Z/Z8ZLPzD5K1



> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Wednesday, February 5, 2025 12:09 AM
> To: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; Eric Auger
> <eric.auger@redhat.com>
> Cc: ddutile@redhat.com; Peter Maydell <peter.maydell@linaro.org>; Jason
> Gunthorpe <jgg@nvidia.com>; Daniel P. Berrang=E9 <berrange@redhat.com>;
> qemu-arm@nongnu.org; qemu-devel@nongnu.org; Linuxarm
> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
> Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
> nested SMMUv3
>=20
> On Tue, Feb 04, 2025 at 06:49:15PM +0100, Eric Auger wrote:
> > > In summary, we will have the following series:
> > > 1) HWPT uAPI patches in backends/iommufd.c (Zhenzhong or Shameer)
> > >    https://lore.kernel.org/qemu-
> devel/SJ0PR11MB6744943702EB5798EC9B3B9992E02@SJ0PR11MB6744.nam
> prd11.prod.outlook.com/
> > > 2) vIOMMU uAPI patches in backends/iommufd.c (I will rebase/send)
>=20
> > for 1 and 2, are you taking about the "Add VIOMMU infrastructure
> support
> > " series in Shameer's branch: private-smmuv3-nested-dev-rfc-v1.
> > Sorry I may instead refer to NVidia or Intel's branch but I am not sure
> > about the last ones.
>=20
> That "vIOMMU infrastructure" is for 2, yes.
>=20
> For 1, it's inside the Intel's series:
> "cover-letter: intel_iommu: Enable stage-1 translation for passthrough
> device"
>=20
> So, we need to extract them out and make it separately..
>=20
> > > 3) vSMMUv3 patches for HW-acc/nesting (Hoping Don/you could take
> over)
> > We can start sending it upstream assuming we have a decent test
> environment.
> >
> > However in
> >
> https://lore.kernel.org/all/329445b2f68a47269292aefb34584375@huawei.c
> om/
> >
> > Shameer suggested he may include it in his SMMU multi instance series.
> > What do you both prefer?
>=20
> Sure, I think it's good to include those patches, though I believe
> we need to build a new shared branch as Shameer's branch might not
> reflect the latest kernel uAPI header.
>=20
> Here is a new branch on top of latest master tree (v9.2.50):
> https://github.com/nicolinc/qemu/commits/wip/for_shameer_02042025
>=20
> I took HWPT patches from Zhenzhong's series and rebased all related
> changes from my tree. I did some sanity and it should work with RMR.
>=20
> Shameer, would you please try this branch and then integrate your
> series on top of the following series?
>    cover-letter: Add HW accelerated nesting support for arm SMMUv3
>    cover-letter: Add vIOMMU-based nesting infrastructure support
>    cover-letter: Add HWPT-based nesting infrastructure support
> Basically, just replace my old multi-instance series with yours, to
> create a shared branch for all of us.

Ok. I will take a look at that and rebase.

Thanks,
Shameer
