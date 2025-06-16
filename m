Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1785464njc;
        Mon, 16 Jun 2025 04:24:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjPDbAj9lfVDcJIKh+sEo1e26HdltpXwzOOn5IOJ1wKa+WWwuIdQ6TeiVIALXZhcuxwKGtrn+9k5sCGQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGhefa4jZCbUAvLjmnUy6ZloXTg6uz8NqH08zNaB3MvhWwCcjIK68GmUbmdyWVtJAaSua8j
X-Received: by 2002:a05:6214:2348:b0:6f4:c742:7a7b with SMTP id 6a1803df08f44-6fb47795f09mr123917826d6.43.1750073095234;
        Mon, 16 Jun 2025 04:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750073095; cv=none;
        d=google.com; s=arc-20240605;
        b=Z9VwqcPy7sxkrhnIgjjhQcpPn+IP0U/dg7RHHwEJ2OUxU/+AdEemSD6hnL8PML6R8H
         QHKhkfU1T53u3uAMOamHKnrYL/02QSC1ygxqsi6X/qXLYD2xvDvqWtqMBx07t3D7ORWs
         +t1uqFPQt5tw6Ky0Pkx7bma/egtSYQTAK8E+NpKe30/t+1OVODaKUyNtVMp0HJnuCPT6
         lOqQj/3V/fcgekA1cwOE4to2NQthBM0zXv4t8vf2/mYMeaZwHkBax+2B1E7Gq0qA8aii
         CPxK0UfvWzJv43lFE0tA2KCn2zxcnKqdu+1/ZDWWGNi4inS2Sv6YxWt0juvAIODYGGRt
         XJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=zXjSnk0dxN83vcOgqdUjvfQ32n1e9J9sGuLVSSeNZak=;
        fh=M+FVb7brxN1+lXD0/JCk6BEPvLdfCowl9TrFyc8YJkQ=;
        b=QGzIZVTX4Rm0+flknN88uFLFuRjmPZrwBhbr7sl1o/PfnYkiyDyVRnq2StytF1LnIi
         flNJdivtt/h2Y06wKuItBdgx407chIkb2hGOhOtLYzjgcc1qd2O4qzB8dnLfecgOvHFG
         rV+PY8rUfOcZZSFm+14vT2afvJzGBEbYBy2WHjp6O1pnrIhdC3+Y7xi+YN7twQBFHgSw
         tk702sljY0DWEqA1heFcGYDhhSVRgnKhqV8Dtaj2MOIXKGTHAafqEgtsGep8eVmufksf
         NghaBm6MZ2s1oUOfLpcdmt1SGQNXtEh5ADjBhqTv4LLvrkj/JPNmBPQiJsWPjR+2oVSQ
         kDPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb507b82cfsi39548456d6.412.2025.06.16.04.24.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 04:24:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uR7xD-0007Hf-A1; Mon, 16 Jun 2025 07:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uR7x9-0007Gs-F6; Mon, 16 Jun 2025 07:24:39 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uR7x5-0005O8-Vw; Mon, 16 Jun 2025 07:24:38 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bLSLl3SK0z6M4YZ;
 Mon, 16 Jun 2025 19:23:59 +0800 (CST)
Received: from frapeml500006.china.huawei.com (unknown [7.182.85.219])
 by mail.maildlp.com (Postfix) with ESMTPS id 8C327140119;
 Mon, 16 Jun 2025 19:24:31 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500006.china.huawei.com (7.182.85.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Jun 2025 13:24:31 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 16 Jun 2025 13:24:31 +0200
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
Subject: RE: [PATCH v4 7/7] qemu-options.hx: Document the arm-smmuv3 device
Thread-Topic: [PATCH v4 7/7] qemu-options.hx: Document the arm-smmuv3 device
Thread-Index: AQHb3HJQOaCTlODNok60fpRTGyj5n7QFhL+AgAAkWOA=
Date: Mon, 16 Jun 2025 11:24:31 +0000
Message-ID: <4ef54e9145e7488298fb9ef3c9f48835@huawei.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-8-shameerali.kolothum.thodi@huawei.com>
 <20250616121245.00005b4b@huawei.com>
In-Reply-To: <20250616121245.00005b4b@huawei.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: edrQWqsJm5IY



> -----Original Message-----
> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Monday, June 16, 2025 12:13 PM
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
> Subject: Re: [PATCH v4 7/7] qemu-options.hx: Document the arm-smmuv3
> device
>=20
> On Fri, 13 Jun 2025 15:44:49 +0100
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > Now that arm,virt can have user-creatable smmuv3 devices, document it.
> >
> > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  qemu-options.hx | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 7eb8e02b4b..3edbde45bb 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -1226,6 +1226,12 @@ SRST
> >      ``aw-bits=3Dval`` (val between 32 and 64, default depends on machi=
ne)
> >          This decides the address width of the IOVA address space.
> >
> > +``-device arm-smmuv3,primary-bus=3Did``
> > +    This is only supported by ``-machine virt`` (ARM).
> > +
> > +    ``primary-bus=3Did``
> > +        The PCIe Root Complex to be associated with.
>=20
> Hmm.  Root complex or host bridge?
> I think an RC is allowed to have multiple heirarchy and hence multiple
> host bridges. Figure 1.2 in the PCI spec. So my gut feeling is this
> should be host bridge.

Ok. I will change the documentation and other comments where it matters
in this series to host bridge.

Thanks,
Shameer
