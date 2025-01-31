Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp460435njb;
        Fri, 31 Jan 2025 06:40:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVvH5p2HodEWO3VjQATGeMeqTdvwrtDfgdYKPrdaPee75TTWZWwAuaEuPPVHgMqPMlmjRvK9ck/kHFbJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGq7Gy9CdH6Gs7ERXgFNwmPnyqqMQAQmVuSOKlDeiQkR5HwMb1I7H8P4e/ndg7zwVnd5WSV
X-Received: by 2002:a05:6122:4009:b0:517:4fca:86d4 with SMTP id 71dfb90a1353d-51e9e55ba0amr9540119e0c.11.1738334425201;
        Fri, 31 Jan 2025 06:40:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738334425; cv=none;
        d=google.com; s=arc-20240605;
        b=L8Q8NEUP+pNUPf0hOD/L/6thfAoVjCFGCPzGOBr95zb/XQx5hPgp8CPU0dwq+rP3bV
         Z4Tsv2CtjjQwYeXM3+PxnH+OPAFEqOIO2H8WFRxF3ZMR1LVk45wDLx3nFDmOtRsee1Q7
         LlkPD16EH7ZC4hYzaEypIEjkLd4bMT77YqA9379G4DXhNaj1xR8z1RVImVfVXAv+7x15
         Su6PaNPQ5mFsmzDIwh5Dchxy6n3T3AmeaTquUxlRmjtxnevSATB1JsUdYSnAyq+4P1i3
         GAcK/OmMTVwUEniotSympmp/j9Hx8sQ/PMm239pKl58vYpi7h/CcqBuXc5mgTbtIWVm2
         dfPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=VfH7A34nBB3XcI3yeXh5ecf1mvce2chxP551ICzI2lg=;
        fh=IcEDmsuoIwI32oCCQSz9RTY/WzcFi1usxudWGdy/eZo=;
        b=H9jKIhtYfKFqDxKgs9b1/IJKkMnOXw1J3vyBRxa+vPPtQb5W5wQX5iAuZ/uBzZG8WO
         K8nKAe0QGB1XTWxckqrEpbwt/huvu88STQSnmTOTmCsvZAxCRQpGg83zZd5XpH86aEAj
         zv3rzIYPEl4SJaEcMIigZghRTghLYqHStieBxkMWyWU2YHzEESsmpmD6SBnuADl0DLgR
         MF4LMwzAhH5y4OKo1Mur3Ty/1TkvjFw9C4H61b7PWMKY9RqfrGkEI7oo2TTKLKi25TFh
         2RZKMZOMB23GmLFS789zXya8PYxiEf/bqZAWpM7It+Z2015HwtwWEptlFXpSI8poTUpf
         x3dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51eb1c176a4si1022075e0c.89.2025.01.31.06.40.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2025 06:40:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdsBr-0003yV-Hn; Fri, 31 Jan 2025 09:40:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tdsBn-0003xR-8t; Fri, 31 Jan 2025 09:40:12 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tdsBk-0001sL-5b; Fri, 31 Jan 2025 09:40:10 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ykz554C6vz6D94X;
 Fri, 31 Jan 2025 22:37:45 +0800 (CST)
Received: from frapeml500005.china.huawei.com (unknown [7.182.85.13])
 by mail.maildlp.com (Postfix) with ESMTPS id 14CAF140B25;
 Fri, 31 Jan 2025 22:39:54 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500005.china.huawei.com (7.182.85.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 Jan 2025 15:39:53 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Fri, 31 Jan 2025 15:39:53 +0100
To: Jason Gunthorpe <jgg@nvidia.com>
CC: =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm
 <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>, Nathan Chen
 <nathanc@nvidia.com>
Subject: RE: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Thread-Topic: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Thread-Index: AQHbMeB0+Q5BEZc9JkeH/U6Jz+dF4rMv66IAgAA0HqCAAPMSYIAAUDgAgAAS6wA=
Date: Fri, 31 Jan 2025 14:39:53 +0000
Message-ID: <3efcea1171af4b2f81be842f2c55fe51@huawei.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <Z5uiGnAxUf4jXTEI@redhat.com> <7ecabe74e0514367baf28d67675e5db8@huawei.com>
 <fc91e1a798324390b2a556fae5d40f46@huawei.com>
 <20250131142404.GP5556@nvidia.com>
In-Reply-To: <20250131142404.GP5556@nvidia.com>
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
X-TUID: i3ha1G5tQLOz



> -----Original Message-----
> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Friday, January 31, 2025 2:24 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: Daniel P. Berrang=E9 <berrange@redhat.com>; qemu-arm@nongnu.org;
> qemu-devel@nongnu.org; eric.auger@redhat.com;
> peter.maydell@linaro.org; nicolinc@nvidia.com; ddutile@redhat.com;
> Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>;
> zhangfei.gao@linaro.org; Nathan Chen <nathanc@nvidia.com>
> Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
> nested SMMUv3
>=20
> On Fri, Jan 31, 2025 at 09:33:16AM +0000, Shameerali Kolothum Thodi
> wrote:
>=20
> > And Qemu does some checking to make sure that the device is indeed
> associated
> > with the specified phys-smmuv3.  This can be done going through the
> sysfs path checking
> > which is what I guess libvirt is currently doing to populate the topolo=
gy.
> So basically
> > Qemu is just replicating that to validate again.
>=20
> I would prefer that iommufd users not have to go out to sysfs..
>=20
> > Or another option is extending the IOMMU_GET_HW_INFO IOCTL to
> return the phys
> > smmuv3 base address which can avoid going through the sysfs.
>=20
> It also doesn't seem great to expose a physical address. But we could
> have an 'iommu instance id' that was a unique small integer?

Ok. But how the user space can map that to the device?

Something like,
/sys/bus/pci/devices/0000:7d:00.1/iommu/instance.X ?

Thanks,
Shameer
