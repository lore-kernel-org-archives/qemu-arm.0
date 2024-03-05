Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp194019ejc;
        Tue, 5 Mar 2024 02:39:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV6z5vMnBNMpbdZYnLWpyAhYOI9CSSzbak9lxkwK+O7VWEkWrjNqhM1Oqg/BPpf8OJwVG9AEEVxzdesjRGK7EuVRi5HPmS+
X-Google-Smtp-Source: AGHT+IEQVch3J62cBItG6oiN9ofS2Hs6eMcPek9CcXim14UxU7GC60srLhXrXYcb0JczO6j2LIGc
X-Received: by 2002:a5b:11:0:b0:dc2:2d0a:4d55 with SMTP id a17-20020a5b0011000000b00dc22d0a4d55mr7207692ybp.63.1709635151967;
        Tue, 05 Mar 2024 02:39:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709635151; cv=none;
        d=google.com; s=arc-20160816;
        b=Tc5ydloJW3qHmRp8l4oW+pYo69X1jkpukrmBbTYEcdiOD6Y45acmadh54NMzAxh8C8
         sptY4nIj44WH7Fpc9yaSjAcm2jci7EzhSWoATJULAZmx5MKL3lPRFU2qG4wdXS2Wut3k
         FLQDICFNct0+zua2fNdlVtDiAyEcD7ACPON69esVoEnjcBDcgtNxtJxstIINXwrQCRJY
         nLs3IpMNw34igxePHFOaQJvEq3G+qjlx+3925sKmq/FbJPutW9actAUVX2IRdXc8w3Ng
         d9ntowEMqnUpWEvJALpwfgqO5i0zePQ1NA9TOXBX4V8fHHZWxACVoVX9RQJ+ikP/s4y/
         Fv9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=0RJXQ54P7BtOv5/pkepl4/W1V8PKL7BXJNMfpBFY7Dg=;
        fh=jIy6WsDFJ+KptA+PwUkgsWgm4TeBegQDtDSD0bIpv0I=;
        b=V+6/Yo3Fih0dPWzVYNd43/6D3NKm9d9/vq3Z6ISKBmYm3qqMB5vHELDOHYF0a+kS9/
         WEyr9YIcZxW40SHBMxgg68NOOVj7vIsohdkJKyXXqo83DMIgrWdyGBWInhyyktzjv1jC
         jcUty23U+iRRBhFqulYe0PRxZch9uXxdGuX+Q6qeAMQzAB1s04gozDmukBcCZh933DcK
         T5v2hgr855hOCDdtv3kkEY/SoDVwUX1LkB2JYHWH4srFpbB02L3hcUXLhTrwOPHEC5wt
         QlMUaCdLiuiYYl6q+CtPXSFe0a6/tJuhXeRLz2W5UQLzSk83cZdV8WPJxO98CbTIPNjc
         mcRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3-20020ac85ac3000000b0042e67e4b0efsi11765552qtd.395.2024.03.05.02.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 02:39:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhSC5-0004P2-Qc; Tue, 05 Mar 2024 05:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rhSC4-0004Oj-3a; Tue, 05 Mar 2024 05:38:44 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rhSC1-0004hM-6b; Tue, 05 Mar 2024 05:38:43 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TpsNg5Lx8z6J9Tw;
 Tue,  5 Mar 2024 18:33:39 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 12E7B1404F5;
 Tue,  5 Mar 2024 18:38:36 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 5 Mar
 2024 10:38:35 +0000
Date: Tue, 5 Mar 2024 10:38:34 +0000
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
Message-ID: <20240305103834.00004d49@Huawei.com>
In-Reply-To: <SA1PR12MB7199E6243CD2838335893CFCB0222@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20240223124223.800078-1-ankita@nvidia.com>
 <20240223124223.800078-3-ankita@nvidia.com>
 <20240226164229.00001536@Huawei.com>
 <SA1PR12MB71995AAADE78D3D0052FAC01B0222@SA1PR12MB7199.namprd12.prod.outlook.com>
 <533ccbfc-7d90-42cd-9183-a5b128c41fad@redhat.com>
 <SA1PR12MB7199E6243CD2838335893CFCB0222@SA1PR12MB7199.namprd12.prod.outlook.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
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
X-TUID: YG8ihVd/RosK

On Tue, 5 Mar 2024 08:17:18 +0000
Ankit Agrawal <ankita@nvidia.com> wrote:

> >>> Please add a test.=A0 tests/qtest/bios-tables-test.c
> >>> + relevant table dumps. =20
> >>
> >> Here I need to add a test that creates a vfio-pci device and numa
> >> nodes and link using the acpi-generic-initiator object. One thing
> >> here is that the -device vfio-pci needs a host=3D<bdf> argument. I
> >> probably cannot provide the device bdf from my local setup. So
> >> I am not sure how can I add this test to tests/qtest/bios-tables-test.=
c.
> >> FYI, the following is a sample args we use for the
> >> acpi-generic-initiator object.
> >>
> >>=A0=A0=A0=A0=A0=A0=A0=A0 -numa node,nodeid=3D2
> >>=A0=A0=A0=A0=A0=A0=A0=A0 -device vfio-pci-nohotplug,bus=3Dpcie.0,addr=
=3D04.0,rombar=3D0,id=3Ddev0 \
> >>=A0=A0=A0=A0=A0=A0=A0=A0 -object acpi-generic-initiator,id=3Dgi0,pci-de=
v=3Ddev0,node=3D2 \
> >>
> >> Moreover based on a quick grep, I don't see any other test that
> >> have -device vfio-pci argument.
> >>
> >> Jonathan, Alex, do you know how we may add tests that is dependent
> >> on the vfio-pci device? =20
> >
> > There are none.
> >
> > This would require a host device always available for passthrough and
> > there is no simple solution for this problem. Such tests would need to
> > run in a nested environment under avocado: a pc/virt machine with an
> > igb device and use the PF and/or VFs to check device assignment in a
> > nested guests.
> >
> > PPC just introduced new tests to check nested guest support on two
> > different HV implementations. If you have time, please take a look
> > at tests/avocado/ppc_hv_tests.py for the framework.
> >
> > I will try to propose a new test when I am done with the reviews,
> > not before 9.0 soft freeze though. =20
>=20
> Thanks for the information. As part of this patch, I'll leave out
> this test change then.

For BIOS table purposes it can be any PCI device. I've been testing
this with a virtio-net-pci but something like virtio-rng-pci will
do fine.  The table contents doesn't care if it's vfio or not.

I can spin a test as part of the follow up Generic Port series that
incorporates both and pushes the limits of the hmat code in general.
Current tests are too tame ;)

Given I don't think we have clarification from ACPI spec side on
the many to one mapping you are using, I'd just use a 1-1 in any
test.


Jonathan
