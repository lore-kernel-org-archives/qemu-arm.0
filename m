Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1790846njc;
        Mon, 24 Mar 2025 01:20:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUQd0XwUoefjeiw+sQUzp7dPflfO9txxd4K7uMFFsxrBrpTraA56KJ75BEhk/tcxWnSfeQCPMLNK44BPQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE49/5XZPL1NkL1/7vzCJH3XfC+JmS7yFVIIepNLB2sHP74le1S1mDvjzJtGDWpiSMl8K33
X-Received: by 2002:a05:620a:c4b:b0:7c5:6a40:6a7a with SMTP id af79cd13be357-7c5b04e1a52mr2391198385a.6.1742804422885;
        Mon, 24 Mar 2025 01:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742804422; cv=none;
        d=google.com; s=arc-20240605;
        b=N9O4bH/Vonokh1LWoskno74BhIavrKGxYFOFUTmDe92bPLF+0h9jajcVOKAVH6MECT
         IfhRVmPGSCktwVJE8ybYqPQSxFsFKjxEUkpJ/DvsWIC12dtOYSsNfqgPR0TKId//srpi
         A/9wjF1z5yDMNSj5ytoDVMTU5A5GBrq0TDxJG9qhYtM0ctJUXrtixSEkMsc/jfUQnOBi
         eTzpTCPoKlKl/H26FkeDj36ePdv1kpVrWhRhsx7CMo5kZEikVuYiW8eGrKi5Z0i6McKs
         +tGjbuFAF8tA1+J4SRCrzTnXzE9kXAyKXn2Pli5yZyE4BYmOmiAlliM2Wv0vLDpL4bnD
         b0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=HGI1igpfOf+/GE0b9Y2tfVs+82hCHeF918PHhI+KEfc=;
        fh=IGRVtRYrifQihoXV8Gtpk/63m+w4IipTLSL9Ltel87U=;
        b=J+kCR1Kmg+PAPnGrtYh0AwRJ1lNUoMcOUcXAXAmuxc9p9yCM0GmxJwdiNCE4YDI2lX
         iCOzE/womg0UN1yW4nQp6UPgzz64NZ5BzkknxET9Rmwy92vXW4OxGbtOLvjHy2gncd6U
         25871Vys2ZJIV17kQbbKcWN0lXxDcVBylalhoec0jXwfv72e6fi3b3mkyvUd8f7gxxJw
         GWqGC/O6cgydVgEaUezM5VkzMZ+mqNqv1e+mPS7O66M4XKXeOXVJ0Mh+vnPpVf3ji9B+
         n8DJVIms+R11d4SeMTbaqU0oLwrgP3oNrm2p1gZriInH00ILxrEQb8Ba1U4ctszf0IDr
         n5mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b93622f9si703425385a.509.2025.03.24.01.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Mar 2025 01:20:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twd2F-0005xD-Jk; Mon, 24 Mar 2025 04:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1twd2A-0005wg-Oy; Mon, 24 Mar 2025 04:19:46 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1twd26-0008T5-V3; Mon, 24 Mar 2025 04:19:46 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZLmDS5Tf3z6L4wl;
 Mon, 24 Mar 2025 16:19:20 +0800 (CST)
Received: from frapeml100007.china.huawei.com (unknown [7.182.85.133])
 by mail.maildlp.com (Postfix) with ESMTPS id 77893140441;
 Mon, 24 Mar 2025 16:19:27 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100007.china.huawei.com (7.182.85.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Mar 2025 09:19:27 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 24 Mar 2025 09:19:27 +0100
To: Nicolin Chen <nicolinc@nvidia.com>
CC: Donald Dutile <ddutile@redhat.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "nathanc@nvidia.com"
 <nathanc@nvidia.com>, "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-pcie bus
Thread-Topic: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-pcie
 bus
Thread-Index: AQHbkps6in4QB/PMZUednFRw1zRmILN5b66AgADGVyCAAgfGgIAFxokw
Date: Mon, 24 Mar 2025 08:19:27 +0000
Message-ID: <2f84490d309440a4a2ac56fd893ddab8@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-6-shameerali.kolothum.thodi@huawei.com>
 <b3a4ce7f-41a9-4da9-a8ca-54848b9e9cf1@redhat.com>
 <3d1312b411f04121a3be90879a915982@huawei.com>
 <Z9xKL49nOenvQIsW@Asurada-Nvidia>
In-Reply-To: <Z9xKL49nOenvQIsW@Asurada-Nvidia>
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
 RCVD_IN_MSPIKE_H2=-0.01, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: 2ETPnb0xDh6m



> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Thursday, March 20, 2025 5:03 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: Donald Dutile <ddutile@redhat.com>; qemu-arm@nongnu.org; qemu-
> devel@nongnu.org; eric.auger@redhat.com; peter.maydell@linaro.org;
> jgg@nvidia.com; berrange@redhat.com; nathanc@nvidia.com;
> mochs@nvidia.com; smostafa@google.com; Linuxarm
> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
> Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-
> pcie bus
>=20
> On Wed, Mar 19, 2025 at 09:26:29AM +0000, Shameerali Kolothum Thodi
> wrote:
> > Having said that,  current code only allows pxb-pcie root complexes
> avoiding
> > the pcie.0. The idea behind this was, user can use pcie.0 with a non ac=
cel
> SMMUv3
> > for any emulated devices avoiding the performance bottlenecks we are
> > discussing for emulated dev+smmuv3-accel cases. But based on the
> feedback from
> > Eric and Daniel I will relax that restriction and will allow associatio=
n with
> pcie.0.
>=20
> Just want a clarification here..
>=20
> If VM has a passthrough device only:
>  attach it to PCIE.0 <=3D> vSMMU0 (accel=3Don)

Yes. Basically support accel=3Don to pcie.0 as well.

> If VM has an emulated device and a passthrough device:
>  attach the emulated device to PCIE.0 <=3D> vSMMU bypass (or accel=3Doff?=
)
>  attach the passthrough device to pxb-pcie <=3D> vSMMU0 (accel=3Don)

This can be other way around as well:
ie,=20
pass-through to pcie.0(accel=3Don) and emulated to any other pxb-pcie with =
accel =3D off.

I think the way bus numbers are allocated in Qemu for pcie.0 and pxb-pcie a=
llows
us to support this in IORT ID maps.

Thanks,
Shameer
