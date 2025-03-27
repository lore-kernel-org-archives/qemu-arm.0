Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3826642njc;
        Thu, 27 Mar 2025 00:47:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/kt5Lv8gmrRdu3pXWlfq+P4w/+gcFR9Pr/gRgdeDNlBOPF7MQLnZJw9FpQ0RxyE3XDrG25DYI3sWx6A==@linaro.org
X-Google-Smtp-Source: AGHT+IE26fR5pcGy4voUFwwdyn6tfOMxsy4UZsGZoMO/TZrzZycu/iEYVmgZgHdQdM0QTWYXmS8p
X-Received: by 2002:a05:622a:4aca:b0:476:8225:dacc with SMTP id d75a77b69052e-4776e25c835mr44035421cf.49.1743061640491;
        Thu, 27 Mar 2025 00:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743061640; cv=none;
        d=google.com; s=arc-20240605;
        b=QrCR3dnW34MjTcnemb9nTcp1j453C3+0uQ1NgRUPLmwUmP4OFMqrSPMSswE+hYdai8
         6CxmQsxMB+Ergud2swjWuHQHuRWLHMfl7zr7smL5e+IapxF+Ci89Qsj/3pPsGUMZuusc
         ffp75Y/Df17uADJF0Q4gqHsMZFvh1h14RBGXx64YNKKAwWMUY5r9a5B3msfcxwzlMEZE
         X/JdtfhQZx/K69yKzB6VJrpOOdFlkf/xteeIiV9iOyENdj04Ey5MepYnD5Y7l6+mqFUl
         JI5EJTHRqLi+UUX7Ls064Xrgk2OAPUm1Ap+m0p4TCrL+adk4F7mzUkNjSqxQI+BfkSr/
         hkWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=rJfSEg/l1JvAGVQRzuX+eefQkMtN/4OjTyH/LiYkSG0=;
        fh=/qL1VtEaSszD21vlBRg+K82xeheMymc1It3EtD/hFIU=;
        b=dTyKEyD/pES9M1A5who8LAN667tgBEea31+1zNBkKoTWJAqY8wQfS+i1N7hn0KGgAC
         yHqV65FzTRkXjigQWgPBiPutEfgLE2j4zSx4iWtFmj3W84NZUWAg0Bc/Vh8WHGXo70gA
         zpWvbuyUWj74ob1MfhFQgxk661uf6XIlcHGxc8CSRx4JDkKSgHCspUHGPoYDrWV2bd/f
         Gj/QN78GyTpmT2QNqNiRI583t4LfDdJpZJzsWi/rXzKtZGUKu/bjTovHrK3gpNTjRw8s
         PIUe9Jwk/ZepttZK8rtlqtH34wDRb71skOAJEw4WTNBR3xNSzx80EJQuQ/eDPkXqyWLg
         9YNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d65a817si128407741cf.666.2025.03.27.00.47.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Mar 2025 00:47:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1txhx1-0000Oo-Ka; Thu, 27 Mar 2025 03:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1txhwz-0000OO-N3; Thu, 27 Mar 2025 03:46:53 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1txhwx-00031e-83; Thu, 27 Mar 2025 03:46:53 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZNbHM4g40z6L6tJ;
 Thu, 27 Mar 2025 15:43:11 +0800 (CST)
Received: from frapeml100006.china.huawei.com (unknown [7.182.85.201])
 by mail.maildlp.com (Postfix) with ESMTPS id 5972D14010C;
 Thu, 27 Mar 2025 15:46:41 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100006.china.huawei.com (7.182.85.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Mar 2025 08:46:41 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 27 Mar 2025 08:46:41 +0100
To: Nicolin Chen <nicolinc@nvidia.com>, Eric Auger <eric.auger@redhat.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>, "smostafa@google.com"
 <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)"
 <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, "zhangfei.gao@linaro.org"
 <zhangfei.gao@linaro.org>
Subject: RE: [RFC PATCH v2 13/20] hw/arm/smmuv3-accel: Introduce helpers to
 batch and issue cache invalidations
Thread-Topic: [RFC PATCH v2 13/20] hw/arm/smmuv3-accel: Introduce helpers to
 batch and issue cache invalidations
Thread-Index: AQHbkuuEEgiH8g4VGkW4jjcernEsFrOFcf4AgABedQCAAOH9sA==
Date: Thu, 27 Mar 2025 07:46:41 +0000
Message-ID: <0dfb9baf9b0a435e9916ff76bcea4e4e@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-14-shameerali.kolothum.thodi@huawei.com>
 <e23b4803-02d1-4850-8b6e-ad398a66a31c@redhat.com>
 <Z+RSeDAuUFtryi4E@nvidia.com>
In-Reply-To: <Z+RSeDAuUFtryi4E@nvidia.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.173.48]
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
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: OfgDVDX4I9Kt



> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Wednesday, March 26, 2025 7:16 PM
> To: Eric Auger <eric.auger@redhat.com>
> Cc: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
> qemu-devel@nongnu.org; peter.maydell@linaro.org; jgg@nvidia.com;
> ddutile@redhat.com; berrange@redhat.com; nathanc@nvidia.com;
> mochs@nvidia.com; smostafa@google.com; Linuxarm
> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
> Subject: Re: [RFC PATCH v2 13/20] hw/arm/smmuv3-accel: Introduce helpers
> to batch and issue cache invalidations
>=20
=20
> > can it happen? in the positive can you add some comment to describe in
> > which condition?
>=20
> I recall this is for device cache specifically (i.e. CGFI_CD[_ALL]
> and ATC_INV) that I had in smmuv3_cmdq_consume(). Perhaps it gets
> here because Shameer separated the accel code from the non-accel
> smmuv3 file.

Yes. It is because I moved the code the around.
>=20
> This condition is to check if the device is attached to an accel
> HWPT, particularly to exclude commands being issued for emulated
> devices. Surely, if a device isn't attached to an accel stage-1
> HWPT any more, we probably shouldn't forward the commands to the
> kernel? Though I start to suspect that we might need a lock for
> accel_dev->s1_hwpt?

I will double check this whether we require this or not.

Thanks,
Shameer
