Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp97936njb;
        Fri, 7 Feb 2025 02:21:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXwKjfeOBjIODxvpft7vG+0ZR8dWYl2ETvkGkS14uCXLTHl6/jZdfKQrp8WkjE6M3q58t9BeCFXLZshvQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEOr4hTXJgkIjNSQbuLGW9gIRQjpHkNjt8NIOwWBuwH06UFs+fjv1930znzhoDiBxvWppHh
X-Received: by 2002:a05:620a:4391:b0:7b8:627c:5fc3 with SMTP id af79cd13be357-7c047ba4ed4mr396798385a.5.1738923704654;
        Fri, 07 Feb 2025 02:21:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738923704; cv=none;
        d=google.com; s=arc-20240605;
        b=DZBIcsD8uelHlvBRqIM8+lamci6cfoMpp2vUdaYMMDJ3hTkhp9o8C1gBlU8ugZM1JJ
         rqM3t9N/oaNgI0Xsf1W0FMexpWfUeYcdxgPDFnfNdIFCq6RkeKFCWt34E/bS/bCRugss
         cgTZXoZqQn55esK6Y/y7LGxbN+mgwoYzQ2tlmUqDdRgDu3+8rGSiW0623aSfqtwSI0m1
         wur0YZ+cZWcwMP+3dLke41HhSxaRZwGHf9dXSdwK3V5hGFyR+VRZxA2v+Ts77G4Fvp7V
         S7sOPmwu79Lw7c1Alt0Kfk6mZTVSZ7fu9OPwgsvsCB5+od7c3wYKb0t+HMbbPkaH30XR
         OtTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=7QEuKW4plteOz1SQfS04jlk2Ivfw5nENFTpvFuqdxOE=;
        fh=acErM0gvRoA9u08W/1DPYoBmUi/e+28vtO0Pm83TyGg=;
        b=Kc3c1xZSXoXpDN/sTr4HS9CfysMM91Acw7ISqjn77gNXnZHXgdQmNM1bVdE9rNIyVJ
         5F9Ffic0kW8faYnPBdM6y369OZ2bC+mp6E5uxULfCRUJEmPlFTt7AJgskJWnAtk9nEKy
         aneYyYYZ92MA+5t0lbGW2XeZgiyH/YZH6RTjngkNYL8Vadc75pWkr1E5M1i7bHkfbVwH
         TMiDhd/8GNDs9kdWnmmLxM/+eZzS13o9XaG2YsSM94JwV91fYTAHSD+e78F7u99AyEEE
         LGgAemGceBMSGq7HVDYRVn0QFMJRv+Wbem4M9sE4A1mjr4a31Bz44lgrJI0myHkJSq0G
         lutw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041ee7312si294679185a.638.2025.02.07.02.21.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 02:21:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgLUG-0007v3-E3; Fri, 07 Feb 2025 05:21:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tgLUD-0007uX-7N; Fri, 07 Feb 2025 05:21:25 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tgLUA-0006GW-3h; Fri, 07 Feb 2025 05:21:24 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Yq90n37prz6L55T;
 Fri,  7 Feb 2025 18:18:33 +0800 (CST)
Received: from frapeml500005.china.huawei.com (unknown [7.182.85.13])
 by mail.maildlp.com (Postfix) with ESMTPS id AF4FE1408F9;
 Fri,  7 Feb 2025 18:21:17 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500005.china.huawei.com (7.182.85.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Feb 2025 11:21:17 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Fri, 7 Feb 2025 11:21:17 +0100
To: Nicolin Chen <nicolinc@nvidia.com>,
 =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "ddutile@redhat.com"
 <ddutile@redhat.com>, Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)"
 <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, "zhangfei.gao@linaro.org"
 <zhangfei.gao@linaro.org>, "nathanc@nvidia.com" <nathanc@nvidia.com>
Subject: RE: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Thread-Topic: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Thread-Index: AQHbMeB0+Q5BEZc9JkeH/U6Jz+dF4rMv66IAgAA0HqCAAb2VAIAIsUnQgAADD4CAAB6MsIAAJxaAgAATMvCAABLUAIAAAjUAgAAKIYCAAAJIgIAAAQ2AgAARRyD///K+AIAAERgA///xZoCAACSvgIAA9kUQ
Date: Fri, 7 Feb 2025 10:21:17 +0000
Message-ID: <9112ba0694bd42199e279e37fbfc9dd0@huawei.com>
References: <71116749d1234ab48a205fd2588151ec@huawei.com>
 <20250206170238.GG2960738@nvidia.com> <Z6TtCLQ35UI12T77@redhat.com>
 <20250206174647.GA3480821@nvidia.com> <Z6T3cX_fM-aeYbMI@redhat.com>
 <20250206175843.GI2960738@nvidia.com>
 <13b1d8b97a314cb28b87563fa9b45299@huawei.com>
 <20250206181306.GK2960738@nvidia.com>
 <02a0080a4a1642d69b7f5dd4707a5b3d@huawei.com>
 <20250206182201.GL2960738@nvidia.com> <Z6Ucj/u3wt9muakb@Asurada-Nvidia>
In-Reply-To: <Z6Ucj/u3wt9muakb@Asurada-Nvidia>
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
X-TUID: po1FRjl42KYN



> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Thursday, February 6, 2025 8:33 PM
> To: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; Daniel P. Berrang=E9
> <berrange@redhat.com>; Jason Gunthorpe <jgg@nvidia.com>
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org; ddutile@redhat.com;
> Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>;
> zhangfei.gao@linaro.org; nathanc@nvidia.com
> Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
> nested SMMUv3
>=20
> On Thu, Feb 06, 2025 at 02:22:01PM -0400, Jason Gunthorpe wrote:
> > On Thu, Feb 06, 2025 at 06:18:14PM +0000, Shameerali Kolothum Thodi
> wrote:
> >
> > > > So even if you invent an iommu ID we cannot accept it as a handle t=
o
> > > > create viommu in iommufd.
> > >
> > > Creating the vIOMMU only happens when the user does a  cold/hot
> plug of
> > > a VFIO device. At that time Qemu checks whether the assigned id
> matches
> > > with whatever the kernel tell it.
> >
> > This is not hard up until the guest is started. If you boot a guest
> > without a backing viommu iommufd object then there will be some more
> > complexities.
>=20
> Yea, I imagined that things would be complicated with hotplugs..
>=20
> On one hand, I got the part that we need some fixed link forehand
> to ease migration/hotplugs.
>=20
> On the other hand, all IOMMUFD ioctls need a VFIO device FD, which
> brings the immediate attention that we cannot even decide vSMMU's
> capabilities being reflected in its IDR/IIDR registers, without a
> coldplug device -- if we boot a VM (one vSMMU<->pSMMU) with only a
> hotplug device, the IOMMU_GET_HW_INFO cannot be done during guest

Right. I forgot about the call to smmu_dev_get_info() during the reset.
That means we need at least one dev per Guest SMMU during Guest
boot :(

Thanks,
Shameer
