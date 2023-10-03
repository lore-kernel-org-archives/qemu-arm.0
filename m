Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1900223ejb;
        Tue, 3 Oct 2023 04:29:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGFVM4ZFwACH65jGUJ4MECrsri7Xc7pooQSdBTeIZtPCtGIeREcA8Q8MxZNmoeqxnF/0rS
X-Received: by 2002:a05:600c:3b11:b0:406:45c1:4dd with SMTP id m17-20020a05600c3b1100b0040645c104ddmr1913198wms.14.1696332587245;
        Tue, 03 Oct 2023 04:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696332587; cv=none;
        d=google.com; s=arc-20160816;
        b=vMh1FUTckfZkd8EKvAXgguCWJMUL9FIvWGSDuttFTgNhiMKWLvh5tzjDk7OmKrmFjT
         1Tg1ZYvgShIGl8g/Svl0hVCcV91cUTCOvqVgJCGhruuKqDsBRE5dKRrq0MVn5rrZCbZI
         /L6CQM3DSfTXIKBykTHuqNoTv8qIBkOhac822ZC+XVDLbLCK6fB1Ml8hUEZGL+I15bi+
         wggeddGiBW/qEyYfQXLtxNLLOAANh+A2VMIr44RB3yz8iFpUUtkQFeNcE3G4ZHSMv74m
         v2Eia6bEJKwMiTPT+4K6pCekUlXAK0UJ+/CcYITQwZWvsHVC6BgIx076PTmgDj/yLD6i
         kuig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=trN70sKCiDm1xaZMxvZx6jwGD3yulJyVOo7nA5stX8c=;
        fh=7ClhMSyX8VLsf+4fXGm2a1j5PzlUyMO+epTSYFeQdDs=;
        b=GSOxt+pXBel4jP7I22g6iNwNGtxpC46s8YE6+5B6yRpm2lPaZd9RizFzbVtRmPSGYx
         wYq5a26tqNzRjoqmGR5Y4POrfaJFlWEtsI25XWosMgHwORx7B3vj6yi7tT7B0K9sl9ol
         2TtTsscopMu2rXji/tzB4LCsevKqd34/fJySfY6c5kQQLTZQEEmYWXEgXzDjsFcrpoHh
         2yZvF/RhmKM8D3lswLzeQWXI7YYpaJ1rPQlTX2Drgt6O4s7InbOcaiyKGP0/MAac0Twh
         AYqrRpTLeUoVGYuECZUJBLIfRVGQs5RfD6CgFbyvEQdIb2PMB+PTbUeYzn64FRSJ4MsN
         g88Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id o3-20020a05600c4fc300b00402ea504d23si5248307wmq.66.2023.10.03.04.29.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:29:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0FsP4fmrz6H8xS;
	Tue,  3 Oct 2023 19:27:05 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 12:29:45 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 12:29:45 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH V2 04/10] hw/acpi: Init GED framework with cpu hotplug
 events
Thread-Topic: [PATCH V2 04/10] hw/acpi: Init GED framework with cpu hotplug
 events
Thread-Index: AQHZ8zQN9sMvHl8IPkGIhb6MBPCp2bA2nciAgAFVejA=
Date: Tue, 3 Oct 2023 11:29:45 +0000
Message-ID: <086e60085a8e4dbba5d110f9c03e286b@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-5-salil.mehta@huawei.com>
 <20231002170701.00002967@Huawei.com>
In-Reply-To: <20231002170701.00002967@Huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: XP1A+cGx3pYK

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Monday, October 2, 2023 5:07 PM
> To: Salil Mehta <salil.mehta@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; maz@kernel.org; jean-
> philippe@linaro.org; lpieralisi@kernel.org; peter.maydell@linaro.org;
> richard.henderson@linaro.org; imammedo@redhat.com; andrew.jones@linux.dev=
;
> david@redhat.com; philmd@linaro.org; eric.auger@redhat.com;
> oliver.upton@linux.dev; pbonzini@redhat.com; mst@redhat.com;
> will@kernel.org; gshan@redhat.com; rafael@kernel.org;
> alex.bennee@linaro.org; linux@armlinux.org.uk;
> darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
> vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
> miguel.luis@oracle.com; salil.mehta@opnsrc.net; zhukeqian
> <zhukeqian1@huawei.com>; wangxiongfeng (C) <wangxiongfeng2@huawei.com>;
> wangyanan (Y) <wangyanan55@huawei.com>; jiakernel2@gmail.com;
> maobibo@loongson.cn; lixianglai@loongson.cn; Linuxarm <linuxarm@huawei.co=
m>
> Subject: Re: [PATCH V2 04/10] hw/acpi: Init GED framework with cpu hotplu=
g
> events
>=20
> On Sat, 30 Sep 2023 01:19:27 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>=20
> > ACPI GED(as described in the ACPI 6.2 spec) can be used to generate ACP=
I
> events
> > when OSPM/guest receives an interrupt listed in the _CRS object of GED.
> OSPM
> > then maps or demultiplexes the event by evaluating _EVT method.
> >
> > This change adds the support of cpu hotplug event initialization in the
> > existing GED framework.
> >
> > Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Oops. I replied to v1 I think.
>=20
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks
Salil.
