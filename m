Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1899201ejb;
        Tue, 3 Oct 2023 04:27:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrPgKFbl6qETGGAiPDuUEY/YIT9oHt/GPZzg1M9cPM9GeHi26kbavQNLz1PDecGGfJqTzs
X-Received: by 2002:a7b:cb86:0:b0:402:8c7e:3fc4 with SMTP id m6-20020a7bcb86000000b004028c7e3fc4mr11836683wmi.30.1696332465725;
        Tue, 03 Oct 2023 04:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696332465; cv=none;
        d=google.com; s=arc-20160816;
        b=nwPGv/EdZVjV7PTV5yDWpLDJnC8FVmFu6DsoRkMQtfuenrWCNfuGD2PV/2truUcenE
         +AoQXSJ+PIANKUkDdjAtUzH3b2X3vKPji4ycM8WpLRwaYnP76gLKkWZnzV4ZILLyz1wk
         dOvr7k+27W5GrqDk7r/V55Qi5W2hSJzF+sEsuAAa8TKy7O/KPUoA0mNYa2i0AmZMA3nN
         KCaXIDiQ3rc1aLh31pWv+w3JNZc9XD01JXD6RmU4uFP3P8XDESu0RfIotW2gvBjwXH9m
         bKTVhrCf899PxmGBVJrHWsw3o/MfaXZZwmRUkfsF49fzYgoAKxhRS3/5BFLFtSm7i+Zv
         ky2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=JuwrEqA8ibGlXx2H69jkWNRaF6xuiAz78v9g+IMvOvQ=;
        fh=7ClhMSyX8VLsf+4fXGm2a1j5PzlUyMO+epTSYFeQdDs=;
        b=XKOgQPd/71jVMAXxmebUD62/dkG7OfhpSFL1UCswjvyPlTVmoLPH9hD0EYQV3bnIi8
         jQMcQKzm7XkhsFCKzf2gXRHYOVWSOAFxtEhnw7/x9dAp+B14oB3/pfil+SWynfX+GQrm
         JvhK8u0JlJf4/3xcCkoIBCowaJWM3bIZASUDVR4r30tUztwlst2SqsohPHK5hGI2tETp
         LKjO4RovpxLoVLEKCPQucvxPOIt6nYs47/8W6N2le/Y6UZNC0bUasNOjPzbqRJpQcE68
         e8Y285yG4gPO5oVZOoRPOYF1aBcaXqlEQ+1Q5zY6qA8ViXHYm3rYBw/OLrDhl2d7eu56
         rwGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id j1-20020a5d5641000000b003231a9ac715si673735wrw.561.2023.10.03.04.27.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100006.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0Fsz3RRHz6K7Xd;
	Tue,  3 Oct 2023 19:27:35 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100006.china.huawei.com (7.191.160.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 12:27:44 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 12:27:44 +0100
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
Subject: RE: [PATCH V2 03/10] hw/acpi: Add ACPI CPU hotplug init stub
Thread-Topic: [PATCH V2 03/10] hw/acpi: Add ACPI CPU hotplug init stub
Thread-Index: AQHZ8zQBSEWKLvEbcUWOpyX49Zq1SrA2nA4AgAFWiVA=
Date: Tue, 3 Oct 2023 11:27:43 +0000
Message-ID: <14143ba86c1d4b139c2b488627a8374b@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-4-salil.mehta@huawei.com>
 <20231002170050.00004fd8@Huawei.com>
In-Reply-To: <20231002170050.00004fd8@Huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: WS2jZoKPLQHp

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Monday, October 2, 2023 5:01 PM
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
> Subject: Re: [PATCH V2 03/10] hw/acpi: Add ACPI CPU hotplug init stub
>=20
> On Sat, 30 Sep 2023 01:19:26 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>=20
> > ACPI CPU hotplug related initialization should only happen if
> ACPI_CPU_HOTPLUG
> > support has been enabled for particular architecture. Add
> cpu_hotplug_hw_init()
> > stub to avoid compilation break.
> >
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Seems reasonable.  For the other similar cases a stub isn't needed
> because GED is built when CONFIG_ACPI_HW_REDUCED=3Dy and
> that select ACPI_MEMORY_HOTPLUG and ACPI_NVDIMM
>=20
> You could do the same for the CPU hotplug case and instantiate
> a potentially useless memory region etc.  This seems more sensible to me
>=20
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


Thanks
Salil.

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
