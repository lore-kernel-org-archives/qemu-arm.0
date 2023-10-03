Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1907763ejb;
        Tue, 3 Oct 2023 04:44:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjmQ9K0FZkepFab5c+FnovUMsPbB+q7QTqZehIPZlhtRN8Kv9ysX1W48jtMDWsTKyXz9IQ
X-Received: by 2002:adf:e592:0:b0:31f:f9de:6a4e with SMTP id l18-20020adfe592000000b0031ff9de6a4emr13561086wrm.69.1696333490893;
        Tue, 03 Oct 2023 04:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696333490; cv=none;
        d=google.com; s=arc-20160816;
        b=Le6tutsSC7zVXhg+tzMRZ10syuyHcw+eJ9zNY+c2tL1+fmsissHwrTbQB8FNX9dcv5
         j1tzHembh/YzNEVZWi5yiKH/HI3To3rAx3IzeYI8j49Dez3xQFG0/+YbCHZxSGe02QyX
         zDy7gaJFW5IOIarvbDuoqmMq3i+Iy4vsPhlP9K5v+6olUJ0NYSnbXiABGz6V2ZwyCNnU
         yO1azha7qbUnJUWkztOLEQJqAhCEYprhCZNp5UN/DakH5Ng7bCfyXZmUTfi2CgmIYreR
         2A9X8FBqqYT5kuK52Os5JsCAxno9mTjUKX0r6eWz8rfEplY3qvS+iQzv48dVpKzIWGc7
         eggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=0WOJSseGs9hZcaqTj+F1AnpOhXWSrLgURxzzITLfLDQ=;
        fh=7ClhMSyX8VLsf+4fXGm2a1j5PzlUyMO+epTSYFeQdDs=;
        b=WoGY5gPlJrMqQkVVGc5AG5hteEgwdb6OSxWnZiYlYCP0ezFblRqiaqgZXkYWDW9I8j
         nhsvfhWrCUYbjHNkS7rP9Vz/DLRuR2abfunQv33ll2AlDiDqZx27nC+XVyc/6m3uY3NS
         UAVVyTH/zNzIKyIeWXcizo7+UrpwpGQKuz/fOzbyo/No8ph4leE7YWu7icOw+uCFmlIG
         m+JpEuU9BNdizDQu7rBdCPGwSYOo/Oa8c5gwgYFe7L9DMrz6vIFckZdrU/XFTIu1WZdK
         fdv5Aue+M6aOtBOK0oQ0NYawCs/rMJyZsV4hbvrm/bRKyv29rnc+67H/UT62v7HQvAwl
         8EUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id m11-20020a5d56cb000000b00324abcac4f0si680421wrw.990.2023.10.03.04.44.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:44:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500003.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0GBn1cFZz6H8xS;
	Tue,  3 Oct 2023 19:42:09 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 12:44:49 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 12:44:48 +0100
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
Subject: RE: [PATCH V2 07/10] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Thread-Topic: [PATCH V2 07/10] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Thread-Index: AQHZ8zQvM2IN4l39W0uWcRE2hMPQGbA2oFyAgAFXDzA=
Date: Tue, 3 Oct 2023 11:44:48 +0000
Message-ID: <c1e3e44bf6c144ef8e8410d11e82215d@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-8-salil.mehta@huawei.com>
 <20231002171615.00007a66@Huawei.com>
In-Reply-To: <20231002171615.00007a66@Huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: eTGOvdcq0+cp

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Monday, October 2, 2023 5:16 PM
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
> Subject: Re: [PATCH V2 07/10] hw/acpi: Update ACPI GED framework to suppo=
rt
> vCPU Hotplug
>=20
> On Sat, 30 Sep 2023 01:19:30 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>=20
> > ACPI GED shall be used to convey to the guest kernel about any CPU hot-=
(un)plug
> > events. Therefore, existing ACPI GED framework inside QEMU needs to be =
enhanced
> > to support CPU hotplug state and events.
> >
> > Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks
Salil.

