Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1506360ejc;
        Mon, 13 Nov 2023 09:46:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMPGDWI1oT2l/vOGVZvrzyfVOdYShuFiVPofu2v1q/WHSwevZKqupaBMGyr1RRJTkFqvNp
X-Received: by 2002:a9d:7ac2:0:b0:6d3:1e5a:d927 with SMTP id m2-20020a9d7ac2000000b006d31e5ad927mr7689528otn.5.1699897561992;
        Mon, 13 Nov 2023 09:46:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699897561; cv=none;
        d=google.com; s=arc-20160816;
        b=GuEgP5SfuS+ZilVmaCJvr/seydOP5Mgnn9RbehIMxLxoRVK1n/j2w+vmPH1XG2FzqK
         N842wO1grL+eqFRc9KCxlVeJnTUzPfhy1wmOJJzt9wrchiwfHTa2um8N6MeugAokkDzt
         3w9eChmxaDfhA9kGnvhnzAO0/qMT09dz91KwU42uQljLvzTn7gfLs5TLvxpZwUwrNe7C
         c1KqNvi6ZluZ7iDDYihL/2Ib6WBrNwsmlgtP1E9ILkBkvessRw/Cfa1snlMmeg+dHPSb
         80NE8S4t2Zhg3mvQNl7qzEzHLVFS2Rpfa3LZ3Ekq40p0eooL6wzh9j6mwjeBD3nKw0nE
         iu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=zsKucUFCk2WWXYgG/C2AxnTEOYVy40npLr/HHUUwpuE=;
        fh=oNMgJYvEZb4Skb11VmLWULXQY38V/rTNkfNBu6N4W+I=;
        b=iwNAlOKAhnRb/tD10J3BG4UFsAyzA9MONYiYET67yDJqMhF1XuUdElWxXiq/sfOzyS
         i9kfxFwTAK2UXOjHSxEf7lx5bwdglnRixPlSincAOxKqoi0XWeeowcVAEQCLIEwNnW8I
         JwgCiVXRwR0ZgDC4YNCQnbD252FmQ5U/2B9pkgKSC6KzQK2KOwGIzniFo4oPCGWhecJ2
         RUdXsIQq07I2LtTX3LWMBABza8fOiPHup2LTHEBg3d0FTkoiSteesDkgG/dOxXXr0fFz
         bPCvEd0MVs/W5ZWUBeFe2PUDdOSTwElWCURrybYn3/e8XkT3vpIs83kSaebk+3qUKCFy
         0Xmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id z125-20020a633383000000b005c1b27f8ef2si322171pgz.49.2023.11.13.09.46.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Nov 2023 09:46:01 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4STcJG2qJ5z6K8qY;
	Tue, 14 Nov 2023 01:44:46 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 13 Nov 2023 17:45:57 +0000
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 13 Nov 2023 17:45:57 +0000
From: Salil Mehta <salil.mehta@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>, "mst@redhat.com" <mst@redhat.com>
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
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
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
Subject: RE: [PATCH V6 5/9] hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
Thread-Topic: [PATCH V6 5/9] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
Thread-Index: AQHZ/cODKHUfJSIF00G1epHE+O7UK7Bdq8UAgBsIlcA=
Date: Mon, 13 Nov 2023 17:45:56 +0000
Message-ID: <48236d35d7f7468285226a47b0c0a4fd@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
	<20231013105129.25648-6-salil.mehta@huawei.com>
 <20231027154648.2ce47292@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231027154648.2ce47292@imammedo.users.ipa.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.147.128]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: x+Ki/bvQrVE2

Hi Igor,
Sorry, I missed this as well.

> From: Igor Mammedov <imammedo@redhat.com>
> Sent: Friday, October 27, 2023 2:47 PM
> To: Salil Mehta <salil.mehta@huawei.com>; mst@redhat.com
>=20
> On Fri, 13 Oct 2023 11:51:25 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>=20
> > CPUs Control device(\\_SB.PCI0) register interface for the x86 arch is =
based on
> > PCI and is IO port based and hence existing CPUs AML code assumes _CRS =
objects
>                                ^^^^
> being placed in PCI0 context is no the reason why resource was described =
as IO.
> being IO is probably historical thing (as legacy hp was implemented as IO=
)


I just meant that because it is IO port based therefore existing CPUs AML c=
ode
would evaluate to a system resource which describes IO Port address.



> _CRS could have been at _SB level as motherboard resource but, in that ca=
se
> we would need to carve out hole in PCI's _CRS  explicitly to exclude it.
> Hence it was placed in PCI0 context as a hack that helps to avoid us that=
.
> Perhaps it also applies to other targets.

Sure.

> > would evaluate to a system resource which describes IO Port address. Bu=
t on ARM
> > arch CPUs control device(\\_SB.PRES) register interface is memory-mappe=
d hence
> > _CRS object should evaluate to system resource which describes memory-m=
apped
> > base address. Update build CPUs AML function to accept both IO/MEMORY r=
egion
> > spaces and accordingly update the _CRS object.
>=20
> Also x86 should be able to switch to and work with MMIO region
> (I think QEMU wise IO and MMIO are the same)
> and we can just use MMIO, likely without any compat machinery.
>=20
> aka. existing/running/migrated x86 guests will use IO instructions to acc=
ess region
> (since CRS they have read, says it is IO), while new VMs will access regi=
on as MMIO.


Ok got it. But I guess existing CPUs AML code for ctrl-dev did not have thi=
s
change. Or did I miss anything?

=20
> I might be wrong though,
>   Michael?
>=20
> > On x86, Legacy CPU Hotplug uses Generic ACPI GPE Block Bit 2 (GPE.2) ev=
ent
> > handler to notify OSPM about any CPU hot(un)plug events. Latest CPU Hot=
plug is
> > based on ACPI Generic Event Device framework and uses ACPI GED device f=
or the
> > same. Not all architectures support Legacy CPU Hotplug. Hence, make AML=
 for
> > GPE.2 event handler conditional.
>=20
> x86 has support for Legacy and Modern CPU hotplug (the later is enabled a=
t runtime).
> And both use GPE for event delivery, so above statement is not entirely c=
orrect/confusing.

Ok yes. I will rephrase part of it.


Thanks
Salil.

> > Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Tested-by: Xianglai Li <lixianglai@loongson.cn>
> > ---
> >  hw/acpi/cpu.c         | 23 ++++++++++++++++-------
> >  hw/i386/acpi-build.c  |  3 ++-
> >  include/hw/acpi/cpu.h |  5 +++--
> >  3 files changed, 21 insertions(+), 10 deletions(-)
> >
> > diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> > index 4b24a25003..596b6d9d81 100644
> > --- a/hw/acpi/cpu.c
> > +++ b/hw/acpi/cpu.c
> > @@ -339,9 +339,10 @@ const VMStateDescription vmstate_cpu_hotplug =3D {
> >  #define CPU_FW_EJECT_EVENT "CEJF"
> >
> >  void build_cpus_aml(Aml *table, MachineState *machine,
> CPUHotplugFeatures opts,
> > -                    build_madt_cpu_fn build_madt_cpu, hwaddr io_base,
> > +                    build_madt_cpu_fn build_madt_cpu, hwaddr base_addr=
,
> >                      const char *res_root,
> > -                    const char *event_handler_method)
> > +                    const char *event_handler_method,
> > +                    AmlRegionSpace rs)
> >  {
> >      Aml *ifctx;
> >      Aml *field;
> > @@ -366,13 +367,19 @@ void build_cpus_aml(Aml *table, MachineState
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
> > @@ -696,9 +703,11 @@ void build_cpus_aml(Aml *table, MachineState
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
> > index 3f2b27cf75..f9f31f9db5 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1550,7 +1550,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
,
> >              .fw_unplugs_cpu =3D pm->smi_on_cpu_unplug,
> >          };
> >          build_cpus_aml(dsdt, machine, opts, pc_madt_cpu_entry,
> > -                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_GPE._E02"=
);
> > +                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_GPE._E02"=
,
> > +                       AML_SYSTEM_IO);
> >      }
> >
> >      if (pcms->memhp_io_base && nr_mem) {
> > diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> > index bc901660fb..b521a4e0de 100644
> > --- a/include/hw/acpi/cpu.h
> > +++ b/include/hw/acpi/cpu.h
> > @@ -60,9 +60,10 @@ typedef void (*build_madt_cpu_fn)(int uid, const
> CPUArchIdList *apic_ids,
> >                                    GArray *entry, bool force_enabled);
> >
> >  void build_cpus_aml(Aml *table, MachineState *machine,
> CPUHotplugFeatures opts,
> > -                    build_madt_cpu_fn build_madt_cpu, hwaddr io_base,
> > +                    build_madt_cpu_fn build_madt_cpu, hwaddr base_addr=
,
> >                      const char *res_root,
> > -                    const char *event_handler_method);
> > +                    const char *event_handler_method,
> > +                    AmlRegionSpace rs);
> >
> >  void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList
> ***list);
> >
