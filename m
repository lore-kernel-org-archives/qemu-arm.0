Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp445293ejb;
        Wed, 6 Mar 2024 03:47:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU5ht1CHGpd2M4MgoHvZ0AVLX6FHXOoOY/iII9kod46DumMWaDdf4sFcfOO3Cu56QeGs+E1wh+rzFV945Us5QGcboPbVZG9
X-Google-Smtp-Source: AGHT+IF9S5yDE8y4xCm41hoGwD7VBN27+eP+FYkCFK5iNsLZ96p5PrG2CV9L4r+M+7jtrR/HRRe4
X-Received: by 2002:ae9:e31a:0:b0:788:254b:de89 with SMTP id v26-20020ae9e31a000000b00788254bde89mr4762635qkf.17.1709725646714;
        Wed, 06 Mar 2024 03:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709725646; cv=none;
        d=google.com; s=arc-20160816;
        b=uAG0bUuBOooop8+p0gU7K8GErAcVGVaOZeAMszje9yfWhuWCTLn5NFS+wDZuRfoTDc
         kX86fekRo3BuLVnkr41yKDbTMzyZ7oL4Ud0I9+iGiliU/lKnoCyX8Ids+tBzv8Q9iw6x
         XDRQbJIJsGqnVL/YgvpYIdsaH9BAoN7XCn/m2ircr1SX5M8yg/V67uY1W2qiNbtAawAF
         IdMKBMpjZvW+Sq3DaYSoVYrk1kuJrQgpcMT3pTqLSVKVeRwF4GULvloTT0SEhSlPRAhy
         Pz4KUJfYZoLMky8MySAcetl80PnlK1B2Z1P+JTJTF1TJHEDiS/pIDmRNM0zQyJoKl6Th
         lFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=ZcaGmn2r83GjgXr8MMVV+ZuJ5PI6GSu6V/Zh1WPOdO4=;
        fh=jIy6WsDFJ+KptA+PwUkgsWgm4TeBegQDtDSD0bIpv0I=;
        b=FAb1bIfeG8SVUld7FSchVDIARMicZlcvxRsbRJ/CEUCBi1nflULxhkOKPHPdIOwD5/
         kfYSXXhmKVm9gEqpo5nOy48KC9jL3MsPOeeAhSzkdxTVrgin5V+v+p2XzWuW7zzeKAJ9
         RCBrKMH2/pmPByWn7WuFtHZQOrlhzOPBiQHG+feJZxconcmdWJGEHg7UIAI4Hebh6eOn
         MqaTDCSEiuVvz0fcBohJfHG61YXLmsIq7GQguW3KLX2gKl61tivQYSUpm7+lM28WPEnU
         MVTFS1E2yUZpsowbNdOW2kKv5qe2tnSOlY919MsUqIq0MRNPRigKfKZkwD53Ot9tapvb
         7Cpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22-20020a05620a137600b0078815e42386si11177213qkl.685.2024.03.06.03.47.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 03:47:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhpjy-0004Rr-KA; Wed, 06 Mar 2024 06:47:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rhpjx-0004Re-6w; Wed, 06 Mar 2024 06:47:17 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rhpjt-0007ou-MG; Wed, 06 Mar 2024 06:47:15 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TqVtS2tMpz6J7vQ;
 Wed,  6 Mar 2024 19:43:12 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 24E88140DB0;
 Wed,  6 Mar 2024 19:46:49 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 6 Mar
 2024 11:46:15 +0000
Date: Wed, 6 Mar 2024 11:46:14 +0000
To: Ankit Agrawal <ankita@nvidia.com>
CC: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>, Jason Gunthorpe
 <jgg@nvidia.com>, "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "ani@anisinha.ca"
 <ani@anisinha.ca>, "berrange@redhat.com" <berrange@redhat.com>,
 "eduardo@habkost.net" <eduardo@habkost.net>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "mst@redhat.com" <mst@redhat.com>, "eblake@redhat.com"
 <eblake@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "david@redhat.com" <david@redhat.com>, "gshan@redhat.com" <gshan@redhat.com>, 
 Zhi Wang <zhiw@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, Aniket Agashe
 <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>, Vikram
 Sethi <vsethi@nvidia.com>, "Andy Currid" <acurrid@nvidia.com>, Dheeraj Nigam
 <dnigam@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v7 2/2] hw/acpi: Implement the SRAT GI affinity structure
Message-ID: <20240306114614.0000284a@Huawei.com>
In-Reply-To: <SA1PR12MB7199F1C81FDAF0DC2ADB26BBB0212@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20240223124223.800078-1-ankita@nvidia.com>
 <20240223124223.800078-3-ankita@nvidia.com>
 <20240226164229.00001536@Huawei.com>
 <SA1PR12MB71995AAADE78D3D0052FAC01B0222@SA1PR12MB7199.namprd12.prod.outlook.com>
 <533ccbfc-7d90-42cd-9183-a5b128c41fad@redhat.com>
 <SA1PR12MB7199E6243CD2838335893CFCB0222@SA1PR12MB7199.namprd12.prod.outlook.com>
 <20240305103834.00004d49@Huawei.com>
 <SA1PR12MB7199F1C81FDAF0DC2ADB26BBB0212@SA1PR12MB7199.namprd12.prod.outlook.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: K8V+EkTi7zYQ

On Wed, 6 Mar 2024 10:33:17 +0000
Ankit Agrawal <ankita@nvidia.com> wrote:

> >> >> Jonathan, Alex, do you know how we may add tests that is dependent
> >> >> on the vfio-pci device? =20
> >> >
> >> > There are none.
> >> >
> >> > This would require a host device always available for passthrough and
> >> > there is no simple solution for this problem. Such tests would need =
to
> >> > run in a nested environment under avocado: a pc/virt machine with an
> >> > igb device and use the PF and/or VFs to check device assignment in a
> >> > nested guests.
> >> >
> >> > PPC just introduced new tests to check nested guest support on two
> >> > different HV implementations. If you have time, please take a look
> >> > at tests/avocado/ppc_hv_tests.py for the framework.
> >> >
> >> > I will try to propose a new test when I am done with the reviews,
> >> > not before 9.0 soft freeze though. =20
> >>
> >> Thanks for the information. As part of this patch, I'll leave out
> >> this test change then. =20
> >
> > For BIOS table purposes it can be any PCI device. I've been testing
> > this with a virtio-net-pci but something like virtio-rng-pci will
> > do fine.=A0 The table contents doesn't care if it's vfio or not. =20
>=20
> Thanks, I was able to work this out with the virtio-rng-pci device.
>=20
> > I can spin a test as part of the follow up Generic Port series that
> > incorporates both and pushes the limits of the hmat code in general.
> > Current tests are too tame ;) =20
>=20
> Sure, that is fine by me.
> FYI, this is how the test change looked like in case you were wondering.

Looks good as a starting point.
Ideally I'd like HMAT + a few bandwidth and latency values
so we test that GIs work with that as well part.

Think you'd just need
"-machine hmat=3Don "
//some values for cpu to local memory
"-numa hmat-lb,initiator=3D0,target=3D0,hierarchy-memory,data-type=3Daccess=
_latency,latency=3D10"
"-numa hmat-lb,initiator=3D0,target=3D0,hierarchy-memory,data-type=3Daccess=
_bandwidth,bandwidth=3D10G"
//some values for the GI node to main memory.
"-numa hmat-lb,initiator=3D1,target=3D0,hierarchy-memory,data-type=3Daccess=
_latency,latency=3D200"
"-numa hmat-lb,initiator=3D1,target=3D0,hierarchy-memory,data-type=3Daccess=
_bandwidth,bandwidth=3D5G"


