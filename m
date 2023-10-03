Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1897652ejb;
        Tue, 3 Oct 2023 04:24:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz/yW0lhwu8FQ4bJmyHfgns8/2lG1ksEXe7ZtNW9k/KlZ0bt/J7QX132FoAuXa8pHwD52C
X-Received: by 2002:a05:6870:63a4:b0:1e1:372:1f5d with SMTP id t36-20020a05687063a400b001e103721f5dmr17865924oap.21.1696332253018;
        Tue, 03 Oct 2023 04:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696332253; cv=none;
        d=google.com; s=arc-20160816;
        b=v4yzapupKzqilOvY/OeYUF49djY7Iq5T4diSVGRCQLXzzzuQEtmU1SCzG9vWyL5FfL
         SweiwUQdlsZEcl/Y2PnhG/imOE1gEJ61T1ZccyRC4mbEwVAFL1ENgizF9lzCnmhrnNE7
         ZtihvIhmbhHGYIqH1FmAFPoebq6fsztNrce/Dn/jVM5050ZKnjMXs503+dDwptyCE5Sn
         MKj6KPGaVzpJNj3ZAx8Wf2VWLX8n0+hTe8e6nYHBHi7jpvJelkdkQKmbAlxKo8MV+fua
         S2wiZKcra0WXtMVPkLN+9RzYbX8HO3qWq7ToZuf1zhnirolNj6TIZTGC6cLG+K/FkgUs
         kT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=yP6F/qiVTr3NAGLbYEe589jBY/pDIfLqocKCwnlpsec=;
        fh=7ClhMSyX8VLsf+4fXGm2a1j5PzlUyMO+epTSYFeQdDs=;
        b=LC3EUzXrV2fQpcMk2EF3ngla0TkOyernHQXrJmV9kgj4w0w81SsTiqycS1+wS6CAQV
         6p8mbRFzxzDBVrbhDJbsTEvtBUVx1yD0kQf9LUvyRnXUlLJLQizg9cfFqFeyBcyCZ9ae
         kMTFz/ho5Gh7jbMguGFlHYzY/MKey5NDk1EIu3we5+WpiDvKNS9Nc52zZCpM4BrnkUWI
         3TjhJ2etpbIyW+KGLl7zrRub08zjq7I7Vtd2WtGZvvfcoGA2mxvykM4NoyAn4llNZk3B
         A+c+r7zYzl3e4Q2myOvHMWFuuLBEVruNFHo3ywr/eZ6ZrNbn2Gbhwgh0nOlyp/rkm4zE
         Mzrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id m23-20020a056870889700b001dd0e418865si368834oam.235.2023.10.03.04.24.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:24:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0Fky2XZCz6HJb6;
	Tue,  3 Oct 2023 19:21:30 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100001.china.huawei.com (7.191.160.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 12:24:10 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 12:24:10 +0100
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
Subject: RE: [PATCH V2 02/10] hw/acpi: Move CPU ctrl-dev MMIO region len macro
 to common header file
Thread-Topic: [PATCH V2 02/10] hw/acpi: Move CPU ctrl-dev MMIO region len
 macro to common header file
Thread-Index: AQHZ8zP1LrysHzRY/k+39C2qQDqLGrA2mmCAgAFXQzA=
Date: Tue, 3 Oct 2023 11:24:09 +0000
Message-ID: <8eb2c7e980934b53818b0e80ecfe048b@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-3-salil.mehta@huawei.com>
 <20231002165449.00004e17@Huawei.com>
In-Reply-To: <20231002165449.00004e17@Huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: 57EZeWVYAGNr

Hi Jonathan,

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Monday, October 2, 2023 4:55 PM
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
> Subject: Re: [PATCH V2 02/10] hw/acpi: Move CPU ctrl-dev MMIO region len
> macro to common header file
>=20
> On Sat, 30 Sep 2023 01:19:25 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>=20
> > CPU ctrl-dev MMIO region length could be used in ACPI GED and various
> other
> > architecture specific places. Move ACPI_CPU_HOTPLUG_REG_LEN macro to mo=
re
> > appropriate common header file.
> >
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
> LGTM
>=20
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks
Salil.


