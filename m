Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2526012njc;
        Tue, 15 Apr 2025 02:29:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUb7ltTVZbFNzEc3ell6H8quokU+Ck7eS2uB5gx6wHCkPjU6lo/AmO5QPcLvlyfUatAOyGVGBnYsZLX+Q==@linaro.org
X-Google-Smtp-Source: AGHT+IH7Rf2N+/A9ugpwthrhkKCwXQYDA7CnBap+tTT91qvMzJcSIUW2uCaC1+1wcz5iuxle8Udv
X-Received: by 2002:ac8:7e90:0:b0:476:af18:239d with SMTP id d75a77b69052e-479775e365fmr210736211cf.51.1744709341891;
        Tue, 15 Apr 2025 02:29:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744709341; cv=none;
        d=google.com; s=arc-20240605;
        b=FnzTSUnQ9XEytmttO1wwADX0y9kFJfOYzOSgUM102aKOa8iVRFpqErtELC+Q3lOotE
         g13Ur5281EV7Z6AGczxx5AzzQpQvYuDf3xq9KT2y55HrPTN3cR/B4zZlbtIYVDri87PI
         u/0Sl50Gx8Y/9o8HA+uOtihs+w60OY8ygMkvlKKF219AgVprn6LeKVoxO/5Q549sLkVW
         NPFuzqnYCEwVEzj/mYvYhQX9nfF46hDf652MlrtWYRdGw/4L4Xesz6dZCni5ml3uMUtw
         9KTmgyb0ld/Rk36C632Uz3Czv2C+P20gOW3sEGyfeF9bqqRw0x9daGw+4QO1QUIilWYv
         ANAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=brRsqEdNZ1LaBMwnwXJfU2jG10VEEo4YCRZsk/XmMDM=;
        fh=Uu+vKK9o4De3hdgRk3YR9RKepjuL85jyYObnMSKTO68=;
        b=c+wY4sBrfvV5pTD9zeDlXGs/zeGpyBDs4F0fwEx4G18Hcrofl50Ig6oqyxPNm7asxw
         Obz2SVOC5vBV0ZX8/h1XIoNHIzILSrk1/XHTx2F6xewWoTii4F1AFmwF0BsP5PORqf7V
         f8rhkST4NidCYm82F3eeI3jxTJRxd5T/iXAVc571qDnaz+bkJGMp6aV/WmNchtXO+y1W
         b9Y9b+1hhMGxb1vF4+dm1Nt5z794pQhDWEonezsTDij+3OlOVr0AZgSdzbYBWoHtAcTw
         EUDPQ8lrGCab0x416/cjTvbPXaTpV8obyxV+IDSdvqgH7IVFEf2D0OG9v8/y3BmVJVDz
         7TbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796ee1368esi105909511cf.650.2025.04.15.02.29.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 02:29:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4cb4-0003WB-8D; Tue, 15 Apr 2025 05:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1u4caw-0003R8-Gb; Tue, 15 Apr 2025 05:28:42 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1u4cau-0002Y6-KK; Tue, 15 Apr 2025 05:28:42 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZcJdQ2h4cz6K9Tv;
 Tue, 15 Apr 2025 17:24:26 +0800 (CST)
Received: from frapeml100008.china.huawei.com (unknown [7.182.85.131])
 by mail.maildlp.com (Postfix) with ESMTPS id 564571406AD;
 Tue, 15 Apr 2025 17:28:37 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100008.china.huawei.com (7.182.85.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Apr 2025 11:28:37 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Tue, 15 Apr 2025 11:28:37 +0200
To: Jonathan Cameron <jonathan.cameron@huawei.com>, Linuxarm
 <linuxarm@huawei.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>, "smostafa@google.com"
 <smostafa@google.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [PATCH 4/5] hw/arm/virt: Add support for smmuv3 device
Thread-Topic: [PATCH 4/5] hw/arm/virt: Add support for smmuv3 device
Thread-Index: AQHbrehdMuAYIN1si0WJyp5C1dh1B7OkdTzg
Date: Tue, 15 Apr 2025 09:28:37 +0000
Message-ID: <ea6f7c90bef040a690579bcf97e096a3@huawei.com>
References: <20250415081104.71708-1-shameerali.kolothum.thodi@huawei.com>
 <20250415081104.71708-5-shameerali.kolothum.thodi@huawei.com>
 <20250415102542.00007fd7@huawei.com>
In-Reply-To: <20250415102542.00007fd7@huawei.com>
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
X-TUID: RzmCyW3H67ZG



> -----Original Message-----
> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Tuesday, April 15, 2025 10:26 AM
> To: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; Linuxarm
> <linuxarm@huawei.com>
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> nicolinc@nvidia.com; ddutile@redhat.com; berrange@redhat.com;
> nathanc@nvidia.com; mochs@nvidia.com; smostafa@google.com;
> Wangzhou (B) <wangzhou1@hisilicon.com>; jiangkunkun
> <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
> Subject: Re: [PATCH 4/5] hw/arm/virt: Add support for smmuv3 device
>=20
> On Tue, 15 Apr 2025 09:11:03 +0100
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > Allow cold-plug of smmuv3 device to virt If the machine wide smmuv3
> > or a virtio-iommu is not specified.
> >
> > Also restrict the usage if virt <=3D 9.2. This will prevent accidently
> > creating a SMMUv3 device on machines prior to 9.2 and cause failure
> > on migrating to machines with same version but has a legacy smmuv3
> > device.
>=20
> Hi,
>=20
> As we discussed internally I'm not convinced we need to prevent this
> particular
> way for a user to shoot themselves in the foot.
>=20
> To be a problem they have to specifically request an old machine + the
> device that didn't exist for that machine, then migrate to a real old
> version of QEMU.  Agreed it is possible but I'm not sure we need to
> prevent that particular crazy.

Agree. If there is no precedence or requirement for blocking such a use cas=
e
I will remove that check.

Thanks,
Shameer
