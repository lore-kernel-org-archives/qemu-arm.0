Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2806810eja;
        Mon, 6 Nov 2023 06:40:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5AnFRQaMFoGwt8gAWrxXxk5lGTg9k2ulh/JcGyYuNPiaYueVVIg2C2ekDoeJWaFpEskEj
X-Received: by 2002:a05:600c:3d0e:b0:408:3bbd:4a82 with SMTP id bh14-20020a05600c3d0e00b004083bbd4a82mr24638281wmb.15.1699281639526;
        Mon, 06 Nov 2023 06:40:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699281639; cv=none;
        d=google.com; s=arc-20160816;
        b=Qu6nB8ZCiK537z+8lvTCSb0GEuLSCQBgD0bRRwr05idi38dg1QCg2RaBKyEQAHzvfs
         7NoV2VvR6BWXweBiWRPNZ5W7Z7tuBYni8P+QA4+rqM3JFLV8goKFjfeIGUe/aijKL5d0
         OZ4HNId8D/shPFcahWTA6rJo3JXd/KG8si6o+rRwBbzJiLFjjoa4a0vvcMVBjuHavy9E
         qMFzp6Co7qn8f2t4tMZjTSjjBXHMFoNbnbN+c2gmwcLh0Ah+8OOp8XIbF5ELHShOWolX
         nkCWy1V5xj2vhIaIZmWIxaijGgpiEU1WM7nm0Pd9pHozD+Sg46NsS7UM786xrJdWzubm
         Vhng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=NpvmMmjUFrp6LQw0N5k3nHF8UyNuxhSTZ3pTmUbrELg=;
        fh=kANT3D++wurOQU1BOFSp5pyqxd/rDLTFW2yMBofHfAU=;
        b=S1ViI37FrgD4FLOvUsUKei2nP4kNea6alLVDriB3fXXyyCh4UYPWdkdCKoMyjx162O
         iUM/DVlm+CXj313z0n4yjd9POYWbc4BVOBbYW6zIzOMCvizOc007AXwraoYgcaKoEDOk
         UgiXcRbBDp6BOaVRBVkHu0BtdeG8K3wyb+hHKkL5BiCHMrw5gltG/04WRx5Wgg3T5smR
         GTIHG0jufJZL4LVDmAmyYb7t4y//piIXY9vPqAJhg2YYQXzuv790UWJQcSVs1n0uEOLD
         sKOxlI4BGUso2YgvU9EABZ70GsckSye1QUnTHIi1ORJQzMtv4jJGpFivdDjVTU3k+0Sz
         C3JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id t18-20020a05600c41d200b0040913eb22e0si6217564wmh.207.2023.11.06.06.40.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Nov 2023 06:40:39 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4SPDWs5w1Kz6K9BG;
	Mon,  6 Nov 2023 22:39:37 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 6 Nov 2023 14:40:37 +0000
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 6 Nov 2023 14:40:37 +0000
From: Salil Mehta <salil.mehta@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "andrew.jones@linux.dev"
	<andrew.jones@linux.dev>, "david@redhat.com" <david@redhat.com>,
	"philmd@linaro.org" <philmd@linaro.org>, "eric.auger@redhat.com"
	<eric.auger@redhat.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com"
	<mst@redhat.com>, "will@kernel.org" <will@kernel.org>, "gshan@redhat.com"
	<gshan@redhat.com>, "rafael@kernel.org" <rafael@kernel.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
	<vishnu@os.amperecomputing.com>, "karl.heubaum@oracle.com"
	<karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian
	<zhukeqian1@huawei.com>, "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>, "jiakernel2@gmail.com"
	<jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, Linuxarm
	<linuxarm@huawei.com>
Subject: RE: [PATCH V6 3/9] hw/acpi: Add ACPI CPU hotplug init stub
Thread-Topic: [PATCH V6 3/9] hw/acpi: Add ACPI CPU hotplug init stub
Thread-Index: AQHZ/cNvZAwhAw6k7UmuT7OTRFemlbBdoEIAgA/iYFA=
Date: Mon, 6 Nov 2023 14:40:37 +0000
Message-ID: <53b571766ce7445c828badc2b45db598@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
	<20231013105129.25648-4-salil.mehta@huawei.com>
 <20231027150536.3c481246@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231027150536.3c481246@imammedo.users.ipa.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.148.208]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: 7b7ZRooR9731

Hi Igor,

> From: Igor Mammedov <imammedo@redhat.com>
> Sent: Friday, October 27, 2023 2:06 PM
> To: Salil Mehta <salil.mehta@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; maz@kernel.org; jean-
> philippe@linaro.org; Jonathan Cameron <jonathan.cameron@huawei.com>;
> lpieralisi@kernel.org; peter.maydell@linaro.org;
> richard.henderson@linaro.org; andrew.jones@linux.dev; david@redhat.com;
> philmd@linaro.org; eric.auger@redhat.com; oliver.upton@linux.dev;
> pbonzini@redhat.com; mst@redhat.com; will@kernel.org; gshan@redhat.com;
> rafael@kernel.org; alex.bennee@linaro.org; linux@armlinux.org.uk;
> darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
> vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
> miguel.luis@oracle.com; salil.mehta@opnsrc.net; zhukeqian
> <zhukeqian1@huawei.com>; wangxiongfeng (C) <wangxiongfeng2@huawei.com>;
> wangyanan (Y) <wangyanan55@huawei.com>; jiakernel2@gmail.com;
> maobibo@loongson.cn; lixianglai@loongson.cn; Linuxarm <linuxarm@huawei.co=
m>
> Subject: Re: [PATCH V6 3/9] hw/acpi: Add ACPI CPU hotplug init stub
>=20
> On Fri, 13 Oct 2023 11:51:23 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>=20
> > ACPI CPU hotplug related initialization should only happen if ACPI_CPU_=
HOTPLUG
> > support has been enabled for particular architecture. Add cpu_hotplug_h=
w_init()
> > stub to avoid compilation break.
>=20
> merge this with 4/9 that actually requires this to be done.

Sure. No issues.


Thanks
Salil.


> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > Tested-by: Xianglai Li <lixianglai@loongson.cn>
> > ---
> >  hw/acpi/acpi-cpu-hotplug-stub.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug=
-
> stub.c
> > index 3fc4b14c26..c6c61bb9cd 100644
> > --- a/hw/acpi/acpi-cpu-hotplug-stub.c
> > +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> > @@ -19,6 +19,12 @@ void legacy_acpi_cpu_hotplug_init(MemoryRegion
> *parent, Object *owner,
> >      return;
> >  }
> >
> > +void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
> > +                         CPUHotplugState *state, hwaddr base_addr)
> > +{
> > +    return;
> > +}
> > +
> >  void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList
> ***list)
> >  {
> >      return;
>=20
