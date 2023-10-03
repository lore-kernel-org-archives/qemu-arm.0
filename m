Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1901398ejb;
        Tue, 3 Oct 2023 04:31:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGce4IuPH6kYXSuN84SgxrYoBULpSNBmy+ufjMNccDLD8lPybAzO0tgeRlUTlTpo/nPSwb
X-Received: by 2002:a05:600c:d1:b0:405:348e:aa43 with SMTP id u17-20020a05600c00d100b00405348eaa43mr12337265wmm.12.1696332703743;
        Tue, 03 Oct 2023 04:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696332703; cv=none;
        d=google.com; s=arc-20160816;
        b=C6jClFrwuQHmTMunuRUVIoMX5z7XMByaAg+PpZJgaOJCVEjX3Tatm0DK0Hbqo9Mrv1
         jIxhxRwRrttSCs85H2Jf8SeORLIqVXPhlj8cRSlhJC2okd6OWnOd5EUk8HX3yFeQ5i/H
         34weUip5yMF77WL9GJAsiYgMlHTOWzsBtRTw6Actnp7hOhj4v1XVlDahPd9V3jdY8gfs
         /9cHJg4vx3/1ZrzeNYuyqkgpsaGLueJ0RZxdQuiFnlAZXWpezcNfXBXNEX1HxT60anlK
         hf96aEp1HFxUm1UBG/+Rnq8ANYJxkezQ5ksl5VZz51o4ynXfa0HbCzPHb18pX4Tsg0uT
         jmWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=JyXY8GnPiMyvd3fNJm2B9wWg4oodvYPrL6RnoD3WlT8=;
        fh=7ClhMSyX8VLsf+4fXGm2a1j5PzlUyMO+epTSYFeQdDs=;
        b=gxCCYvmTiG/1vM3fa96VicKefMUeuGDmoaOPWSO8HdtiVj30mqSXFR8Eo6XktnNCis
         TIsNZn9cftfj7OqWqhgl+x/oGKGqnx6ArmFhFxnipfuRl1eVH2T80JBsWNYn3tIAW/2T
         KcdfGqDWfsq7UVLanLqq0gbm3SZWQdoOxQqcsgELBcyH7sp4u8lodhLwZXiZHYvLSrFg
         hahScSJOw6NTNuicVssf3tex0E4JjPTWaLlTd0vjA46O+6m3RQWN49NZVMz4y4/8mVYa
         QK1YFYI6npGelFx5f1FmSORa7NfXcK69Kp5wcSy9KwRZdcX306phsEWHjgLXFIbpdStb
         ydVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id az39-20020a05600c602700b003f9d7ff24c9si646758wmb.155.2023.10.03.04.31.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:31:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100006.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0Fvf1xNCz6H8xS;
	Tue,  3 Oct 2023 19:29:02 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100006.china.huawei.com (7.191.160.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 12:31:42 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 12:31:42 +0100
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
Subject: RE: [PATCH V2 05/10] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
Thread-Topic: [PATCH V2 05/10] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
Thread-Index: AQHZ8zQYC4/+Jpm3GUq+5/2Z200pcbA2npYAgAFVDEA=
Date: Tue, 3 Oct 2023 11:31:41 +0000
Message-ID: <714adebf61184e439f1f5c331d90b1c2@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-6-salil.mehta@huawei.com>
 <20231002170954.000016ba@Huawei.com>
In-Reply-To: <20231002170954.000016ba@Huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: Y6eKGcepqdz5

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Monday, October 2, 2023 5:10 PM
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
> Subject: Re: [PATCH V2 05/10] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
> change
>=20
> On Sat, 30 Sep 2023 01:19:28 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>=20
> > CPUs Control device(\\_SB.PCI0) register interface for the x86 arch is =
based on
> > PCI and is IO port based and hence existing cpus AML code assumes _CRS =
objects
> > would evaluate to a system resource which describes IO Port address. Bu=
t on ARM
> > arch CPUs control device(\\_SB.PRES) register interface is memory-mappe=
d hence
> > _CRS object should evaluate to system resource which describes memory-m=
apped
> > base address.
> >
> > This cpus AML code change updates the existing inerface of the build cp=
us AML
> > function to accept both IO/MEMORY type regions and update the _CRS obje=
ct
> > correspondingly.
>=20
> This also makes a change to make the event_handler_method optional.
> Would be good to explain why or leave that for a future patch.

Will add.

Thanks
Salil.


>=20
> Otherwise looks fine.
>=20
> >
> > Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > ---
> >  hw/acpi/cpu.c         | 23 ++++++++++++++++-------
> >  hw/i386/acpi-build.c  |  2 +-
> >  include/hw/acpi/cpu.h |  5 +++--
> >  3 files changed, 20 insertions(+), 10 deletions(-)
> >
> > diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> > index 45defdc0e2..66a71660ec 100644
> > --- a/hw/acpi/cpu.c
> > +++ b/hw/acpi/cpu.c
> > @@ -338,9 +338,10 @@ const VMStateDescription vmstate_cpu_hotplug =3D {
> >  #define CPU_FW_EJECT_EVENT "CEJF"
> >
> >  void build_cpus_aml(Aml *table, MachineState *machine,
> CPUHotplugFeatures opts,
> > -                    hwaddr io_base,
> > +                    hwaddr base_addr,
> >                      const char *res_root,
> > -                    const char *event_handler_method)
> > +                    const char *event_handler_method,
> > +                    AmlRegionSpace rs)
> >  {
> >      Aml *ifctx;
> >      Aml *field;
> > @@ -367,13 +368,19 @@ void build_cpus_aml(Aml *table, MachineState
> *machine, CPUHotplugFeatures opts,
> >          aml_append(cpu_ctrl_dev, aml_mutex(CPU_LOCK, 0));
> >
> >          crs =3D aml_resource_template();
> > -        aml_append(crs, aml_io(AML_DECODE16, io_base, io_base, 1,
> > +        if (rs =3D=3D AML_SYSTEM_IO) {
> > +            aml_append(crs, aml_io(AML_DECODE16, base_addr, base_addr,
> 1,
> >                                 ACPI_CPU_HOTPLUG_REG_LEN));
> > +        } else {
> > +            aml_append(crs, aml_memory32_fixed(base_addr,
> > +                               ACPI_CPU_HOTPLUG_REG_LEN,
> AML_READ_WRITE));
> > +        }
> > +
> >          aml_append(cpu_ctrl_dev, aml_name_decl("_CRS", crs));
> >
> >          /* declare CPU hotplug MMIO region with related access fields =
*/
> >          aml_append(cpu_ctrl_dev,
> > -            aml_operation_region("PRST", AML_SYSTEM_IO,
> aml_int(io_base),
> > +            aml_operation_region("PRST", rs, aml_int(base_addr),
> >                                   ACPI_CPU_HOTPLUG_REG_LEN));
> >
> >          field =3D aml_field("PRST", AML_BYTE_ACC, AML_NOLOCK,
> > @@ -699,9 +706,11 @@ void build_cpus_aml(Aml *table, MachineState
> *machine, CPUHotplugFeatures opts,
> >      aml_append(sb_scope, cpus_dev);
> >      aml_append(table, sb_scope);
> >
> > -    method =3D aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
> > -    aml_append(method, aml_call0("\\_SB.CPUS." CPU_SCAN_METHOD));
> > -    aml_append(table, method);
> > +    if (event_handler_method) {
> > +        method =3D aml_method(event_handler_method, 0, AML_NOTSERIALIZ=
ED);
> > +        aml_append(method, aml_call0("\\_SB.CPUS." CPU_SCAN_METHOD));
> > +        aml_append(table, method);
> > +    }
> >
> >      g_free(cphp_res_path);
> >  }
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 4d2d40bab5..611d3d044d 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1550,7 +1550,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
,
> >              .fw_unplugs_cpu =3D pm->smi_on_cpu_unplug,
> >          };
> >          build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
> > -                       "\\_SB.PCI0", "\\_GPE._E02");
> > +                       "\\_SB.PCI0", "\\_GPE._E02", AML_SYSTEM_IO);
> >      }
> >
> >      if (pcms->memhp_io_base && nr_mem) {
> > diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> > index 999caaf510..b87ebfdf4b 100644
> > --- a/include/hw/acpi/cpu.h
> > +++ b/include/hw/acpi/cpu.h
> > @@ -56,9 +56,10 @@ typedef struct CPUHotplugFeatures {
> >  } CPUHotplugFeatures;
> >
> >  void build_cpus_aml(Aml *table, MachineState *machine,
> CPUHotplugFeatures opts,
> > -                    hwaddr io_base,
> > +                    hwaddr base_addr,
> >                      const char *res_root,
> > -                    const char *event_handler_method);
> > +                    const char *event_handler_method,
> > +                    AmlRegionSpace rs);
> >
> >  void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList
> ***list);
> >
