Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1869736ejb;
        Tue, 3 Oct 2023 03:24:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEtTec5/hY5c5mnNtxwuDFecD/AdqtBxb+CKcMtv3ufDMK9cxRg01iT5SZqB+dJ6nINMzZ
X-Received: by 2002:a1c:741a:0:b0:401:b92f:eec5 with SMTP id p26-20020a1c741a000000b00401b92feec5mr1708412wmc.9.1696328673922;
        Tue, 03 Oct 2023 03:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696328673; cv=none;
        d=google.com; s=arc-20160816;
        b=SrS9RFjUeY2EFiX09/L1X7zg1/13wxpFBTNFPfOvMXLDPCTrrPPuCrZC86FnHMUFtm
         nxEkTj43b6TcGq1vrM0U+Ut/F9tRrO0CixCzzQtmbjx20ZQJqxwEAkil4KxAtAZBV5eG
         pzz1ZA5EwQ6NPHSge5t/n+afz/EkwXL134i4zIvXPyuLm11nswBG3T8AMeBxgXgqdNq4
         +Xm2Fgtt0AAG0u8S192/2Fm/cnFuH9dOBIp+kfluJBlYrU+3E45iUSteLSjTmtmcfwEV
         gZtsY0TT11urFRFiYDSDeeXpLdJmH22PgRPTcM/5tiychotk62SYp1lLXoIbmWqROban
         U0jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=Ge5VTb7lxbFzaG4vj4+UJ5L0m30yAmnNPoMTb8UIJNM=;
        fh=7ClhMSyX8VLsf+4fXGm2a1j5PzlUyMO+epTSYFeQdDs=;
        b=oKVWW+JFkv+cGgYcCfEUKM5qhgA+A0i6CssxaGdln6t9WhPaFfqH3XHVMB+r06dOqc
         UjAZ29HYnGBava0mwL8X1rWjQy6rYE9AW+NPj+RB5NUHDsnZXum31sP+RDjzdSmB1OiR
         PRLEZOCTcNlkVJ2nDEML9a/uaHSRxH8FvJTgLQymIVnhrIDf8Lj7MgUt6UFOlw2S0qVK
         +S3w9ZMWZaoj+KJVfrXxij8xljMcUy0ofcCcf1svRkXqRyRXNx4cb+giJScZJ0q7RBw/
         hXIkFIEm08bD36BIXXH1aLj/0M0VgTQQMob6ePGtjEFWRYorkkM3egkQUqZcR71mca/I
         E/ow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id t1-20020adfe441000000b0032610479700si585540wrm.853.2023.10.03.03.24.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 03:24:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500002.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0DRP0vqXz6K63G;
	Tue,  3 Oct 2023 18:22:57 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500002.china.huawei.com (7.191.160.78) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 11:24:32 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 11:24:32 +0100
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
Subject: RE: [PATCH 4/9] hw/acpi: Init GED framework with cpu hotplug events
Thread-Topic: [PATCH 4/9] hw/acpi: Init GED framework with cpu hotplug events
Thread-Index: AQHZ8tLgHSjbQJaOQUmMJ2ceXEiCmLA2nlaAgAFDUSA=
Date: Tue, 3 Oct 2023 10:24:31 +0000
Message-ID: <b4df7316fc5a4871a55e9cc0d40ad4b7@huawei.com>
References: <20230929124304.13672-1-salil.mehta@huawei.com>
	<20230929124304.13672-5-salil.mehta@huawei.com>
 <20231002170617.000044f2@Huawei.com>
In-Reply-To: <20231002170617.000044f2@Huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: WAHSIFZhM62z

Hi Jonathan,
Thanks for looking at it.

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Monday, October 2, 2023 5:06 PM
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
> Subject: Re: [PATCH 4/9] hw/acpi: Init GED framework with cpu hotplug
> events
>=20
> On Fri, 29 Sep 2023 13:42:59 +0100
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
> FWIW this looks good to me.
>=20
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thank you!
Salil.
