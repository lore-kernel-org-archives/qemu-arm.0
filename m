Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp343377eja;
        Thu, 29 Feb 2024 04:18:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW8eulifKFT1irEr6wszZqvXuDRmpiRj82d06ITV1Qnwqk6c7/NkLE9oAoX2yFBfRPIK5fcI7iY0Ac86jDgEHUS4H9Nkg08
X-Google-Smtp-Source: AGHT+IHSA5oTxeomCIq7bDRqAHIIwTzIATGWMeD/2Fo+umJlvc2tN5BulYIMWrugV1sl84RLaCQk
X-Received: by 2002:ac8:5812:0:b0:42e:62ba:464a with SMTP id g18-20020ac85812000000b0042e62ba464amr1840519qtg.5.1709209108240;
        Thu, 29 Feb 2024 04:18:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709209108; cv=none;
        d=google.com; s=arc-20160816;
        b=yE1Xa6sGN2M0xNWBqjIlsARBH9RT+7GSMXxQTTpllpigCLHzaua3Do25eTcE05T/hn
         kyOaGaSXFOlCVnthuHBLVwaaxLK+ZKY8BV/n9DdA96psvQEy1NzKZrTscrg1beSlYBam
         PfLMXmE6Iw5kZR4hK2vA82XjlzeXWSdFYC2s2DLa4uUv7z+43SOJes19Wueq3UmrRori
         2p/qruRWhZi4qkY/isWDk0dgvusfWIyuCmqh0xPOeRqTAibe9CJpH7LdtcXXgj1ndexG
         GRGCa62x9GoDUbmx/MK6kgWnGF4QA2tKNnZUAnstdjq99z6/cBdBatGMFRHWw3HwiOj5
         ooNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=6zBCcreqsajY2v+eZ8Oncqf2kBrdAtV1Sb9M7xbqzs8=;
        fh=7hAnG8mt3O2g0t4S/UvlpYopBIc86fAdUNL/ShLRZ74=;
        b=wU2pk/BTY0lKC5PQdA0AT8D334/ljxbU0EUyYKVwkGpl6QwfEYfPoAtm2L+fVVb3/e
         akkcwXn/tx58430quxis5pbKzFOu8fqG5OtT5R1fYtiN9uLR+vZ3kA3nGcg2csbndT6k
         q3XQ0cdCsgY5IaMHXLMBVNfa7YMxFURW/jTHFqq83i/t7PuzMuskhQzIGtUIanCo1P/A
         kwKtj/Ouzq+Z7d4Qpbx2f/VI0hAVFu+KOlM5n9Cywn69dSskT95QI6u6NaDeeliqTvZi
         SBJQJ3eheb3JpehKdt9umkUgTXeV2CYO8ksoig5BD4yCrdyBWdh7VkMycMW+efYPzywM
         sxmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6-20020a05622a014600b0042e5a12c2e8si1325946qtw.451.2024.02.29.04.18.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 04:18:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rffMP-0000KG-Uf; Thu, 29 Feb 2024 07:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rffMO-0000Jh-Jl; Thu, 29 Feb 2024 07:18:00 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rffML-0004YW-9m; Thu, 29 Feb 2024 07:18:00 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Tlqqn6LKzz6J9YF;
 Thu, 29 Feb 2024 20:13:09 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 0E8681404F9;
 Thu, 29 Feb 2024 20:17:52 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 29 Feb
 2024 12:17:51 +0000
Date: Thu, 29 Feb 2024 12:17:50 +0000
To: Ankit Agrawal <ankita@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "clg@redhat.com" <clg@redhat.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "ani@anisinha.ca"
 <ani@anisinha.ca>, "berrange@redhat.com" <berrange@redhat.com>,
 "eduardo@habkost.net" <eduardo@habkost.net>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "mst@redhat.com" <mst@redhat.com>, "eblake@redhat.com"
 <eblake@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "david@redhat.com" <david@redhat.com>, "gshan@redhat.com" <gshan@redhat.com>, 
 Zhi Wang <zhiw@nvidia.com>, "Matt Ochs" <mochs@nvidia.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, Aniket Agashe
 <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>, "Kirti Wankhede"
 <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>, Vikram
 Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>, Dheeraj Nigam
 <dnigam@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v7 2/2] hw/acpi: Implement the SRAT GI affinity structure
Message-ID: <20240229121750.00004feb@Huawei.com>
In-Reply-To: <SA1PR12MB7199C32D46CF39363F38D2E7B05F2@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20240223124223.800078-1-ankita@nvidia.com>
 <20240223124223.800078-3-ankita@nvidia.com>
 <20240226164229.00001536@Huawei.com>
 <SA1PR12MB7199C32D46CF39363F38D2E7B05F2@SA1PR12MB7199.namprd12.prod.outlook.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gi2gST3dCCv8

On Thu, 29 Feb 2024 11:43:44 +0000
Ankit Agrawal <ankita@nvidia.com> wrote:

> > One thing I forgot.
> >
> > Please add a test.=A0 tests/qtest/bios-tables-test.c =20
>=20
> IIUC, we need to add a test for aarch64 to test the interface with the
> acpi-generic-initiator object.
>=20
> > + relevant table dumps. =20
>=20
> Sorry it isn't clear where do you want me to add this. In the git commit
> message?

I meant as part of the test.  Typically you then include the relevant snipp=
et
as part of the commit message to show what the key part of the test is.

Thanks,

Jonathan
