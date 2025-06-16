Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1822299njc;
        Mon, 16 Jun 2025 05:31:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUj3B0dsIIFZ3CopR7RDm2V9kDBZI1/23SlgS/TsG4+ejXHPw7BqCgYcjVXMjGYIBj1DSAdjF5mlO7Hcg==@linaro.org
X-Google-Smtp-Source: AGHT+IErv909Y33QUMXQ+7WSG6UobU/TMfi33ywuTiZB7qLeLl5w08P2na3KQtyPlWgrCotJ+sMt
X-Received: by 2002:a05:622a:216:b0:478:f4bd:8b8e with SMTP id d75a77b69052e-4a73c5b880amr148613071cf.39.1750077113146;
        Mon, 16 Jun 2025 05:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750077113; cv=none;
        d=google.com; s=arc-20240605;
        b=aWBmGd78j0KnzWaAj1cnb/uOHb8K/FzvXmR8QgJmCyUaPn7KTLRR5n6nLB0Af5RkUT
         bkF12ibo+55IgRX8L/nMnIM5I3+F9s3ysE+VYYzj3DrgOma5z3B4eFNHAita8H8P2287
         2IRAUwGAbJN+5xvuuxZFzduTM9PzqLVe6GwqvUKTPvHrsx5RCSudEN/zp9b66gVgnQA1
         4rJ1uUt5KVDUG5swHN7rD+9zk3dFQ2i9DWUvWkP2wpTAF0g/uJkhUKPOb+id0vp+Hj2A
         HrzJICXf6KlcqR74pD/AFuJ7mPjdVm8W12T1WcSWJp95Axwg7aO9mRty+pzaTxnidjOK
         AoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=6EEB8MlUWf2lgDxi7pWb0etj0BWJa3Bvj2ViGGvFiP4=;
        fh=zNnD6dvJ9j8+jKbpPyzNfkeJkr4w60LDw4OcMsEo3ds=;
        b=lHi6lzcQRXXqM/aKPSAiKQSmoD5ObiijyoWSyi2f4DsBSXmNnzVypQ3ru1yUOjvUux
         WcpG2nSCPVLTpoKhZkn722XS+sX6kVo4GHuFy5daXCmK5RfoMQWxkQdhWViyc+pqIiY+
         imvil+rlAOpF3Rq6VaOKQvHTp/f1LlaW1Qs9kTgwZIjyNol0RORESWo2332Ut7eEeSu1
         TBYhsE7cDbeStBxkxTAyzTPgzN7jNGLnko9cjL1vIF2gR8r+UpJyYE4dIdGj3O6eZIvG
         q0iz+acnkI8mQhNOj4eJlTak1OEJX5gRqytSvkr9BFftndyk5le3PttVeh+FpuUx1FFE
         evFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a4b34ccsi95093011cf.330.2025.06.16.05.31.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 05:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR902-0008Bv-QZ; Mon, 16 Jun 2025 08:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uR901-000881-5T; Mon, 16 Jun 2025 08:31:41 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uR8zs-0006x6-Kp; Mon, 16 Jun 2025 08:31:40 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bLTqv2BM4z6M4MK;
 Mon, 16 Jun 2025 20:30:51 +0800 (CST)
Received: from frapeml100008.china.huawei.com (unknown [7.182.85.131])
 by mail.maildlp.com (Postfix) with ESMTPS id 7144B140119;
 Mon, 16 Jun 2025 20:31:23 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100008.china.huawei.com (7.182.85.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Jun 2025 14:31:23 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 16 Jun 2025 14:31:23 +0200
To: Nicolin Chen <nicolinc@nvidia.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>, "smostafa@google.com"
 <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)"
 <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, "zhangfei.gao@linaro.org"
 <zhangfei.gao@linaro.org>
Subject: RE: [PATCH v4 6/7] hw/arm/virt: Allow user-creatable SMMUv3 dev
 instantiation
Thread-Topic: [PATCH v4 6/7] hw/arm/virt: Allow user-creatable SMMUv3 dev
 instantiation
Thread-Index: AQHb3HJRgldM06OyzEmi9P7BI/E2ibQFJWAAgACU3JA=
Date: Mon, 16 Jun 2025 12:31:23 +0000
Message-ID: <470e44e8be524b1bbeb9b841f16cfeca@huawei.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-7-shameerali.kolothum.thodi@huawei.com>
 <aE+sLJ+LfvIIngKI@nvidia.com>
In-Reply-To: <aE+sLJ+LfvIIngKI@nvidia.com>
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
X-TUID: 4f70TXmHFGg9



> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Monday, June 16, 2025 6:31 AM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> ddutile@redhat.com; berrange@redhat.com; imammedo@redhat.com;
> nathanc@nvidia.com; mochs@nvidia.com; smostafa@google.com; Linuxarm
> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
> Subject: Re: [PATCH v4 6/7] hw/arm/virt: Allow user-creatable SMMUv3 dev
> instantiation
>=20
> On Fri, Jun 13, 2025 at 03:44:48PM +0100, Shameer Kolothum wrote:
> > Allow cold-plug of smmuv3 device to virt if there is no machine
> > wide legacy smmuv3 or a virtio-iommu is specified.
> >
> > Device tree support for new smmuv3 dev is limited to the case where
> > it is associated with the default pcie.0 RC.
>=20
> I forgot the detail for this limitation. Maybe spare a few more
> words briefly describing why?

Qemu lacks support for presenting PCI device tree bindings for the primary
PCIe bus and PXB bus instances completely.

Please see the details here:
https://lore.kernel.org/qemu-devel/20230421165037.2506-1-Jonathan.Cameron@h=
uawei.com/

I will add bit more description here to make it more clear.

>=20
> > Tested-by: Nathan Chen <nathanc@nvidia.com>
> > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
>=20
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

Thanks,
Shameer
