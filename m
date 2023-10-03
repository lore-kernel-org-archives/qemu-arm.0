Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1907031ejb;
        Tue, 3 Oct 2023 04:43:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGV9UOxWpb6j7URsjMTte1AmT816aSzVXJbyMyqwUx/7+vjhccGeUawu6FKq8MAg66bqCM
X-Received: by 2002:a05:600c:ac4:b0:405:784a:d53e with SMTP id c4-20020a05600c0ac400b00405784ad53emr1730950wmr.20.1696333393272;
        Tue, 03 Oct 2023 04:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696333393; cv=none;
        d=google.com; s=arc-20160816;
        b=D2ppec7/r5o4w1X4NBcKRyB1qtmCGJmiUODc8o6t689At9tc+TCZyUa8AKQx6Kq/Hk
         aaJpomT2I4fGum+zj2ZDV7VJ85792xTcG92497Kq1/XrWNDIIYdA7eR8HlnqMIEaRhGg
         TbsOJrX0Pza/9rRxqZdrJMXXnj3WJsjRNV8+ySkCparknbu1LNzoVl6O/qld1Wdft9Ah
         GVAFeSXGd27AxEIJHoOnqboe0Krnf4gP4Z+tyrSyW9Hkbimjn+r/hBTZbm2VcepyygQ9
         zxgtGnlhazcv7mTPJ8RatFFansansVacrkFCWZeBaXaPUoyy9yB3yb5hWrdPKuyQPY7z
         spMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=raoasLefYhOiebrssURDiez1LdCc7DWvSkM7pCUrQoo=;
        fh=7ClhMSyX8VLsf+4fXGm2a1j5PzlUyMO+epTSYFeQdDs=;
        b=e0jt6LhZ63GkeMaSVOWAairGWPbmjugSeP+0X72+cGU7iC8rYDvjAT0hy4JfrrnE56
         0plnRA1gCskVBFkMzrdpFEuTfTVrfNDqRVBakP0bSlFKsgPcSOrnLC2zKZ4zxJw55sA/
         /4FGwl96Y7JnI18hl0284ervQtSXZI+CQLc9GYveVx104u2QjwWmK5zRrTXKpDE6egXq
         wD+wqvcFv9d6e/3oWAjYBHMGK3sTaodU8L1/SFGqnfDUJP4XiMWv/DKrGJv8+ZaalsX/
         Zit280VaK/7ydxk61KrHr+ZfLNrHQ1KkWvDIDvpVaUVGAQ/hJZf1VLgukzxyae+Xg7Xl
         OYpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id n9-20020adfe789000000b00317e9c05d2fsi666126wrm.691.2023.10.03.04.43.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:43:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100006.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0GB81s8xz6K6Ds;
	Tue,  3 Oct 2023 19:41:36 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100006.china.huawei.com (7.191.160.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 12:43:11 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 12:43:11 +0100
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
Thread-Index: AQHZ8zQk6MAP2ANe7ES6Fefhb3Wj6LA2n9eAgAFUrJA=
Date: Tue, 3 Oct 2023 11:43:11 +0000
Message-ID: <ed93b18d03ef44c5b37815449bdc10c3@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-7-salil.mehta@huawei.com>
 <20231002171423.00003c39@Huawei.com>
In-Reply-To: <20231002171423.00003c39@Huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: Yn+pNQwZVgLU

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Monday, October 2, 2023 5:14 PM
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
> On Sat, 30 Sep 2023 01:19:29 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>=20
> > OSPM evaluates _EVT method to map the event. The cpu hotplug event even=
tually
> > results in start of the cpu scan. Scan figures out the cpu and the kind=
 of
> > event(plug/unplug) and notifies it back to the guest.
> >
> > The change in this patch updates the GED AML _EVT method with the call =
to
> > \\_SB.CPUS.CSCN which will do above.
> >
> > Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> One trivial suggested addition inline (dropping existing definition that =
this
> replicates). With that tidied up
>=20
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks
Salil.

>=20
> > ---
> >  hw/acpi/generic_event_device.c | 4 ++++
> >  include/hw/acpi/cpu_hotplug.h  | 2 ++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/hw/acpi/generic_event_device.c
> b/hw/acpi/generic_event_device.c
> > index d2fa1d0e4a..62d504d231 100644
> > --- a/hw/acpi/generic_event_device.c
> > +++ b/hw/acpi/generic_event_device.c
> > @@ -108,6 +108,10 @@ void build_ged_aml(Aml *table, const char *name,
> HotplugHandler *hotplug_dev,
> >                  aml_append(if_ctx, aml_call0(MEMORY_DEVICES_CONTAINER
> "."
> >                                               MEMORY_SLOT_SCAN_METHOD))=
;
> >                  break;
> > +            case ACPI_GED_CPU_HOTPLUG_EVT:
> > +                aml_append(if_ctx, aml_call0(ACPI_CPU_CONTAINER "."
> > +                                             ACPI_CPU_SCAN_METHOD));
> > +                break;
> >              case ACPI_GED_PWR_DOWN_EVT:
> >                  aml_append(if_ctx,
> >
> aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
> > diff --git a/include/hw/acpi/cpu_hotplug.h
> b/include/hw/acpi/cpu_hotplug.h
> > index 48b291e45e..ef631750b4 100644
> > --- a/include/hw/acpi/cpu_hotplug.h
> > +++ b/include/hw/acpi/cpu_hotplug.h
> > @@ -20,6 +20,8 @@
> >  #include "hw/acpi/cpu.h"
> >
> >  #define ACPI_CPU_HOTPLUG_REG_LEN 12
> > +#define ACPI_CPU_SCAN_METHOD "CSCN"
>=20
> This seems to already be defined in hw/acpi/cpu.c
> Can we drop it from there given that file now includes this
> header anyway.

Perhaps I can assign this to the macro in the hw/acpi/cpu.c?

Thanks
Salil.
