Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1758423ejc;
        Wed, 27 Sep 2023 04:02:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY9Oh/7HXW26mXW892dHcX/Rx5x3sbUirjG2r/hFnyXYQN/Ss88X6y0OrSn2qpPk9fswok
X-Received: by 2002:a0c:9cca:0:b0:656:3fa4:6016 with SMTP id j10-20020a0c9cca000000b006563fa46016mr1533841qvf.62.1695812555588;
        Wed, 27 Sep 2023 04:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695812555; cv=none;
        d=google.com; s=arc-20160816;
        b=YZ+szk+SnCkL/dvAUm9QVfnwOFmCwqQkb5u+Z00aozINsA5MPgXr1HCAsCUNhEGk2s
         8DIJ3b9MTKbqGFBwp+F2ju+3VlJl9KuW1zrE4wObVSmQJG55um5k5Rdtc7jVcioG7dF6
         BKC5+YNlbufM2hVWnJseQ0GmHOzuwvOAcU0eq60NcyFH31PouL90uo+yBRBY1TU1+8Ac
         Sqqs3plNXEM+KCFaNtmCvU76uE8FmFZ8dt8VI/uxXsu2ScVJp8ygRcd+vPNaWUFmJT90
         uAv+L47VvAQueTTXFZTZxUJoXsJtmka3R5btpfBzryFEa2m9CRwt1I+3qVgGFM6DdH+q
         YVFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=5pDQ0+S/GZ4G/A3kjjU+xUy8u5g9VwppemJdnpo+xnw=;
        fh=JPmNNWFdLCeIR/gHn7wexEFwWDIgPmmG87UPgxIk2jk=;
        b=rPNZUR6wfaV8QCG88z9zaTO+4pL2OYWNitsGz8xuphaGydRpsj2GX5WzPCcEMMNP/P
         YOe82fKgOs67Xw5zPH/I+SbnTf8MuSIrAw9JYtB8ArL0bErjWXwaX+0htQQHEBLYAwLH
         34dhPW25MCVesSYpH2geBN592eGIuO/HIli/07diptDA+IVprwH/PFK6hqQOlyz4MAcC
         A4uIYDhZkY4kgdPjm+O8kHkQcf88abWrNhIR6VZkiJj7EQIiYDQy+kAKvAb22F+2BcCV
         e0wUG+zE6Yt49d8dTEm7hbNwaF2AmeHRt/Nqc8mShSfpwF1nEtX4px0YUeXQijqKMiXy
         YN4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a0cb309000000b0065166c4cf34si5595725qve.312.2023.09.27.04.02.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Sep 2023 04:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlSJ4-0008Vr-7a; Wed, 27 Sep 2023 07:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qlSIy-0008V6-Gt; Wed, 27 Sep 2023 07:02:08 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qlSIv-0001k1-1P; Wed, 27 Sep 2023 07:02:07 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RwYYY068Sz6K7yw;
 Wed, 27 Sep 2023 19:00:32 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 27 Sep
 2023 12:01:48 +0100
Date: Wed, 27 Sep 2023 12:01:48 +0100
To: Ankit Agrawal <ankita@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "clg@redhat.com" <clg@redhat.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "ani@anisinha.ca"
 <ani@anisinha.ca>, Aniket Agashe <aniketa@nvidia.com>, Neo Jia
 <cjia@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, "Tarun Gupta
 (SW-GPU)" <targupta@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, "Andy
 Currid" <ACurrid@nvidia.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 3/4] hw/arm/virt-acpi-build: patch guest SRAT for
 NUMA nodes
Message-ID: <20230927120148.000037a0@Huawei.com>
In-Reply-To: <BY5PR12MB37637E2A77DC8A9AB064ABCEB0C3A@BY5PR12MB3763.namprd12.prod.outlook.com>
References: <20230915024559.6565-1-ankita@nvidia.com>
 <20230915024559.6565-4-ankita@nvidia.com>
 <20230915153740.00006185@Huawei.com>
 <BY5PR12MB3763BC1EB9402223B020ABF8B0FFA@BY5PR12MB3763.namprd12.prod.outlook.com>
 <20230925145440.00005072@Huawei.com>
 <20230925140328.GF13733@nvidia.com>
 <20230925155351.00000638@Huawei.com>
 <20230925160043.GH13733@nvidia.com>
 <20230925180038.00003879@Huawei.com>
 <BY5PR12MB37637E2A77DC8A9AB064ABCEB0C3A@BY5PR12MB3763.namprd12.prod.outlook.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SErYAAzpIBvd

On Tue, 26 Sep 2023 14:54:36 +0000
Ankit Agrawal <ankita@nvidia.com> wrote:

> > With an ACPI spec clarification agreed then I'm fine with
> > using this for all the cases that have come up in this thread.
> > Or a good argument that this is valid in under existing ACPI spec.  
> 
> Hi Jonathan
> 
> I looked at the Section 5.2.16 in ACPI spec doc, but could not see
> any mention of whether size == 0 is invalid or be avoided. 
> https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf
> 
> If that is not convincing, do you have suggestions as to how I may
> confirm this?
>

It's not so much whether 0 size is valid that concerns me (as you
say it isn't ruled out, though given the explanatory text is
is non sensical) but rather whether you are allowed to use
such an entry to add memory that is not within the range later.

To my reading the statement under "Memory Affinity Structure" suggests
not.

"The Memory Affinity structure provides the following topology information
statically to the operating system:

* The association between a _memory range_ and the proximity to which it belongs.
* Information about whether the memory range can be hot-plugged.
"

That doesn't leave space for using it to define a proximity node without
providing the range.  With my 'occasional' contributor to ACPI spec hat on,
(obviously there are people way more versed in this than me!)
I'd suggest that ASWG will ask the obvious question of why does the ACPI
table needs to describe a software entity that is entirely discoverable by
other means?  After all your driver is clearly going to pick up these
nodes and assign them later - so it can just create them.  ACPI spec
doesn't care if Linux can do this or not :(

There are some hacks in place in the kernel (or at least under review)
to deal with a CXL case where there are BIOSes that assign part of the
CXL Fixed Memory Window (a bit of host PA space) to an SRAT entry, but
not the whole of it.  However, I think those are a workaround for a bug
(maybe not everyone agrees with that though).

Perhaps I'm being overly hopeful for clarity and it is fine to
do what you have here.

Jonathan
