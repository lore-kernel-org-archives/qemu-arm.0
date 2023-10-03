Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1924594ejb;
        Tue, 3 Oct 2023 05:13:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUYSt2yBmGYl5KR+4pmXdGCdRlULpTz2WfTp545ge1ijSflbkfSuM3o3VjeZy1c9hAWfuC
X-Received: by 2002:a5d:6505:0:b0:313:f94f:3b15 with SMTP id x5-20020a5d6505000000b00313f94f3b15mr11379309wru.2.1696335198172;
        Tue, 03 Oct 2023 05:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696335198; cv=none;
        d=google.com; s=arc-20160816;
        b=MjtkQ9rY/GBvFAQyxnpav6DiyWpfLbdylrxLfkp/yMVpugvMnZC7PyKA10t9v6AnVI
         4gZvQi5kM9bsnXC2P7iEEMJq1IRRczF7UEvnodUQ+UB70O5KiwCs6GdC4+Ki5lObWQ0Q
         Z1ir87rQMVLEfB5PON5YHjHqLAFMkXdjMQcmHOft3Wn/WBpoMYV+lhPkI6zqBUgHJ1cb
         rQTEO4Awkl81hrbboPAG+rlDEwLE+0F+H671j0USHUSIqq+z/wDk60G6xr8YyoGqz4Ja
         flTSk0qRAeRaRkqVzsspirK4ScHYsFLoL7pnGP6AEANwl5lMsn6zmvlwXp1iRueqi1oK
         8P5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=PPHETYKl1kbFXHa+ZxQmjln47hnEp1NOPngjIbha3bk=;
        fh=7ClhMSyX8VLsf+4fXGm2a1j5PzlUyMO+epTSYFeQdDs=;
        b=vw4VQu9Xzj5rob0KbFt0qPm4A+A4jhhj2K/Qc0nZghXAoDsnbotrigXzmbB+FGXP5Y
         K+oCLNL2rYEXP8UGrepWX+uwItgIT0jhtuRm1L9QKbDlBT0/XcaBDfA0WieFtKVdF+IU
         m21BNR7DXef9NCaXpFwZcqc0JFF+rjwiR5lhiOwIf83EoYtB/lw3Ng5sccxkcoqfpChm
         JMMOnkzIk4LbGchWJYWmXgnvDn/93av9SXlxqBiXAMyWhvrjooHl2IzbjYHFvnbcJN/o
         ZUKrDPrC3l6ypEDzWdOXRlYUDck/HSBKzKukOrQBrazp9VikoGLJmbkTFZsoT1Ql9cmG
         MpTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id j3-20020a5d6183000000b00323285e9144si696794wru.393.2023.10.03.05.13.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 05:13:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0Gqc3kD3z6HJc8;
	Tue,  3 Oct 2023 20:10:36 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 13:13:16 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 13:13:16 +0100
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
Subject: RE: [PATCH V2 06/10] hw/acpi: Update GED _EVT method AML with cpu
 scan
Thread-Topic: [PATCH V2 06/10] hw/acpi: Update GED _EVT method AML with cpu
 scan
Thread-Index: AQHZ8zQk6MAP2ANe7ES6Fefhb3Wj6LA2n9eAgAFUrJD///TegIAAFHVQ
Date: Tue, 3 Oct 2023 12:13:16 +0000
Message-ID: <50e3672784984b6b85602dd68a6965cd@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-7-salil.mehta@huawei.com>
	<20231002171423.00003c39@Huawei.com>
	<ed93b18d03ef44c5b37815449bdc10c3@huawei.com>
 <20231003125351.00004788@Huawei.com>
In-Reply-To: <20231003125351.00004788@Huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: ZEQju/WmHmc8

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Tuesday, October 3, 2023 12:54 PM
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
> Subject: Re: [PATCH V2 06/10] hw/acpi: Update GED _EVT method AML with cp=
u
> scan
>=20
>=20
> > > aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
> > > > diff --git a/include/hw/acpi/cpu_hotplug.h
> > > b/include/hw/acpi/cpu_hotplug.h
> > > > index 48b291e45e..ef631750b4 100644
> > > > --- a/include/hw/acpi/cpu_hotplug.h
> > > > +++ b/include/hw/acpi/cpu_hotplug.h
> > > > @@ -20,6 +20,8 @@
> > > >  #include "hw/acpi/cpu.h"
> > > >
> > > >  #define ACPI_CPU_HOTPLUG_REG_LEN 12
> > > > +#define ACPI_CPU_SCAN_METHOD "CSCN"
> > >
> > > This seems to already be defined in hw/acpi/cpu.c
> > > Can we drop it from there given that file now includes this
> > > header anyway.
> >
> > Perhaps I can assign this to the macro in the hw/acpi/cpu.c?
> hw/acpi/cpu.c includes this header now anyway I think.
> So just drop that definition and should all be good.

Ok.

