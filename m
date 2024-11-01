Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp648250njc;
        Fri, 1 Nov 2024 11:35:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXipxuTz0jfCiJo4TjReYBKyKXsbXn1KW3pixAyFxBoREpF1k4R5pDrfzeLDAqCTxGi7zNxfBOSSjvE7A==@linaro.org
X-Google-Smtp-Source: AGHT+IEMCdbtOuTpFD/Af7SB36e+gHRD/UVjxoZKpufbEA6WBQHNKzDAwlYSYYfrJh/N2KfxhYXJ
X-Received: by 2002:a05:620a:2484:b0:7a9:c2d5:a9d9 with SMTP id af79cd13be357-7b2fb95815dmr621296185a.9.1730486149092;
        Fri, 01 Nov 2024 11:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730486149; cv=none;
        d=google.com; s=arc-20240605;
        b=P9uxZfYjFAQ/YBiJQW3N2OVBoaPI6BjLGmr0qikqcscbrrH4ieHTQJ/ydhOqgxYXKY
         Cdg8pJ1jRkc/z96+HnMqBAvS8+UhohzGaTiPOtdWqDshMBijvrRRNPCY8wXDvIG9fE2Q
         kp6HLmBvTbLVl5ebimKmFyLu7cuoma0DIydQc1KFY1xs5JLHL1mUJv2VTwCeiCNFu/Ne
         7aCzgIdKoX+42T5nbTnqEoQS/kln/2QFqbIGz0chki4A7BSAZIfiKQBwOlmYdVitDTZt
         PUHMwgXeEk5ae9X/EWadqd+B0Rlhs1ziQLB9SwdZlhwu9DPeXdDN0+NvIfv+0U6Y6Ix/
         t9Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=wyL4HAmhw5QC7T/GCe0CS8WPVoSAv3v9ECTBAg0sK9Y=;
        fh=RNJ+0uUWiIBO2ZtF9AoBFZekqv+LKBL1Ue5ZuxB+6h4=;
        b=hwj7kyYz/+uSOIuiihvxksaIACHvURlAEbV2MDlWcP1LBJr6IhBlgWAu6UjCs9+0yE
         kAzGgRbDMeRVoGxXNhzoBDFNCRlldpdBG9f9XFTDFrsxEFVeYfpMVBzo/h+pkoeFwAij
         Nvo92AQzkEP1z39u2180lzdunsLb7I38LSyxuzRjdaWxLN99QOCB8YamhIuwkHpZw4FY
         vBoIIs2fkRDzLmdNw+17JQZyIZoCotiZWOkkCh5ZmyulqzOb0SGlniX9G/1637xPY3Tt
         /k3+oVPQN0RURt1mMRsKLlkWDCzCziaHwZ903urukIdwe46OLpglWJrARhFsGhM3Knr+
         egsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3a9ce9dsi486362785a.474.2024.11.01.11.35.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2024 11:35:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t6wUk-00021n-NM; Fri, 01 Nov 2024 14:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1t6wUj-00021a-NP; Fri, 01 Nov 2024 14:35:37 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1t6wUg-00072r-Sn; Fri, 01 Nov 2024 14:35:37 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xg8cM6jNwz6K6NM;
 Sat,  2 Nov 2024 02:32:51 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 1B634140517;
 Sat,  2 Nov 2024 02:35:24 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 19:35:23 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Fri, 1 Nov 2024 19:35:23 +0100
To: Nicolin Chen <nicolinc@nvidia.com>
CC: Eric Auger <eric.auger@redhat.com>, Mostafa Saleh <smostafa@google.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, "Jason
 Gunthorpe" <jgg@nvidia.com>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, Moritz Fischer <mdf@kernel.org>, Michael Shavit
 <mshavit@google.com>, "Andrea Bolognani" <abologna@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, "Peter Xu" <peterx@redhat.com>, Zhangfei Gao
 <zhangfei.gao@linaro.org>, "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "arighi@nvidia.com" <arighi@nvidia.com>, "ianm@nvidia.com" <ianm@nvidia.com>, 
 "jan@nvidia.com" <jan@nvidia.com>, "mochs@nvidia.com" <mochs@nvidia.com>
Subject: RE: nested-smmuv3 topic for QEMU/libvirt, Nov 2024
Thread-Topic: nested-smmuv3 topic for QEMU/libvirt, Nov 2024
Thread-Index: AQHbLBPkDYWW/RlwrUqSJByfpx0jw7KisNtQ
Date: Fri, 1 Nov 2024 18:35:23 +0000
Message-ID: <cf4359b18f0d44f09b8901141b678a09@huawei.com>
References: <ZyRUcGKKS6NbIV5O@Asurada-Nvidia>
In-Reply-To: <ZyRUcGKKS6NbIV5O@Asurada-Nvidia>
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
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: gmwl/WCTG+HB


Hi Nicolin,

> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Friday, November 1, 2024 4:09 AM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: Eric Auger <eric.auger@redhat.com>; Mostafa Saleh
> <smostafa@google.com>; qemu-arm@nongnu.org; qemu-
> devel@nongnu.org; Peter Maydell <peter.maydell@linaro.org>; Jason
> Gunthorpe <jgg@nvidia.com>; Jean-Philippe Brucker <jean-
> philippe@linaro.org>; Moritz Fischer <mdf@kernel.org>; Michael Shavit
> <mshavit@google.com>; Andrea Bolognani <abologna@redhat.com>;
> Michael S. Tsirkin <mst@redhat.com>; Peter Xu <peterx@redhat.com>;
> Zhangfei Gao <zhangfei.gao@linaro.org>; nathanc@nvidia.com;
> arighi@nvidia.com; ianm@nvidia.com; jan@nvidia.com; mochs@nvidia.com
> Subject: nested-smmuv3 topic for QEMU/libvirt, Nov 2024
>=20
> Hi,
>=20
> This is a continued discussion following previous month's:
> https://lore.kernel.org/qemu-devel/Zvr%2Fbf7KgLN1cjOl@Asurada-Nvidia/
>=20
> Kernel changes are getting closer to merge, as Jason's planning to
> take vIOMMU series and smmuv3_nesting series into the iommufd tree:
> https://lore.kernel.org/all/cover.1730313494.git.nicolinc@nvidia.com/
> https://lore.kernel.org/all/cover.1730313494.git.nicolinc@nvidia.com/
> https://lore.kernel.org/all/0-v4-9e99b76f3518+3a8-
> smmuv3_nesting_jgg@nvidia.com/
>=20
> So, I think it's probably a good time to align with each others and
> talk about kicking off some QEMU upstream work in the month ahead.
>=20
> @Shameer,
> Do you have some update on the pluggable smmuv3 module?

I have a bare minimum prototype code that works with a pluggable smmuv3.

...
-device pxb-pcie,id=3Dpcie.1,bus_nr=3D2,bus=3Dpcie.0 \
-device pcie-root-port,id=3Dpcie.port1,bus=3Dpcie.1 \
-device arm-smmuv3-nested,id=3Dsmmuv1,pci-bus=3Dpcie.1 \
-device vfio-pci-nohotplug,host=3D0000:75:00.1,bus=3Dpcie.port1,iommufd=3Di=
ommufd0 \
-device pxb-pcie,id=3Dpcie.2,bus_nr=3D8,bus=3Dpcie.0 \
-device pcie-root-port,id=3Dpcie.port2,bus=3Dpcie.2,chassis=3D8 \
-device arm-smmuv3-nested,id=3Dsmmuv2,pci-bus=3Dpcie.2 \
-device vfio-pci-nohotplug,host=3D0000:7d:02.1,bus=3Dpcie.port2,iommufd=3Di=
ommufd0 \
...

Something like above can now boot a Guest with the latest kernel. But I am =
not
sure it actually works correctly. I need a bit more time to update this and=
 carry
out some tests. Will target that in Nov.

>=20
> Updates on my side:
> 1) I have kept uAPI updated to the latest version and verified too.
>    There should be some polishing changes depending on how the basic
>    nesting infrastructure would look like from Intel/Duan's work.
> 2) I got some help from NVIDIA folks for the libvirt task. And they
>    have done some drafting and are now verifying the PCI topology
>    with "iommu=3Dnone".
>=20
> Once the pluggable smmuv3 module is ready to test, we will make some
> change to libvirt for that and drop the auto-assigning patches from
> the VIRT code, so as to converge for a libvirt+QEMU test.

One query I have is, do Qemu still need to check whether the VFIO devices a=
re
assigned correctly behind the nested vSMMUv3 w.r.t the phys SMMUv3s or not?
Or we can just trust whatever the user/libvirt specifies?

(I think even if we don't explicitly check, at present  it will eventually =
fail in s2
HWPT attach  for the viommu if it belongs to a different phys SMMUv3).

Thanks,
Shameer
