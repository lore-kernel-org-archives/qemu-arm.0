Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4832824wre;
        Wed, 30 May 2018 07:51:36 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK029PmhhzqSHA6H9AA1co/C6WAuv+WFX1Sni4Iz168K21njZySpM4kmQ3SU/uUddyHprJ1
X-Received: by 2002:aed:2d07:: with SMTP id h7-v6mr2763979qtd.252.1527691896704;
        Wed, 30 May 2018 07:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527691896; cv=none;
        d=google.com; s=arc-20160816;
        b=G4+qsZ/xgX+VzXVBTb25IJ7dviQfRCMQHGvqvGCV4Q09Ix6lVWAUbnvCk9Javf7XtG
         jUKjDtlRaRogFqL/E2xD32kFWBGSTIzZ/Wd7edxIVaUPtZMbUE4sYePR1vSx0FnKVFrv
         uWn4mMLOVPC4kXRJsX7uu0gP6P550miTb2WziKjk+/bH30XjJse0pH21fEBqSG1Q/1zb
         Qrs32I5j6jRoMhglLx7K9kVnK1oSW1GUKzFcV6IiBZydoudvk7H7jw6a2xVwx1KUDUqV
         AgQIyzRItEleXBXLs4C8FwCcUvPqVxwyVzLD4/2O9SQdCwUsn9cOISTFlfAwWWFNq1lL
         Y25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=wkurIzBG1CqCBhc41xrK/phV0xbH8K8HvsNfrXJhi0A=;
        b=RoXpAUCR5DCqNbYbr42salhKW4MrC+mmN31oLUsDt6raQvPPh1a9t1g5SfPaAjmSTN
         OqlMmB437x9hm1ovpZgJ0pZOExequsMstkZvKLQ8N0APSHMnYO2IR29Ugg/xUjqVziGe
         5OYMRHpJwCO4QyFl6qpluwIeEEQrTLpAn/sZNZPt+myiJ29ho8BeWbrL235GP1WI1MJK
         gvLjwwAmfIb9PegBF73todq+S+zyFwyrJugmauAvYZLWaH97REIKjvySNZ7U5ayfFfb3
         I6bmtxbE66ZttIcDmt+Hlnf0gLRE44jcsuC5lSt8/SfxwIZBNBPMH4XBpK7Aj0hA6S8a
         dI+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v24-v6si7795393qtp.358.2018.05.30.07.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 07:51:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO2Rs-0001Th-4M
	for alex.bennee@linaro.org; Wed, 30 May 2018 10:51:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2Qe-0000dy-80
	for qemu-arm@nongnu.org; Wed, 30 May 2018 10:50:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2QY-0002xL-0U
	for qemu-arm@nongnu.org; Wed, 30 May 2018 10:50:20 -0400
Received: from lhrrgout.huawei.com ([194.213.3.17]:4231 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2QX-0002v1-QJ; Wed, 30 May 2018 10:50:13 -0400
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id 7D06637B207CA;
	Wed, 30 May 2018 15:50:10 +0100 (IST)
Received: from FRAEML704-CAH.china.huawei.com (10.206.14.35) by
	lhreml709-cah.china.huawei.com (10.201.108.32) with Microsoft SMTP
	Server (TLS) id 14.3.382.0; Wed, 30 May 2018 15:50:11 +0100
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.176]) by
	FRAEML704-CAH.china.huawei.com ([10.206.14.35]) with mapi id
	14.03.0382.000; Wed, 30 May 2018 16:50:02 +0200
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Andrew Jones <drjones@redhat.com>
Thread-Topic: [Qemu-devel] [RFC v2 2/6] hw/arm/virt: Enable dynamic
	generation of guest RAM memory regions
Thread-Index: AQHT7SmgQBrabppeFUSzP8q+EArFi6RFSzIAgAMdXDA=
Date: Wed, 30 May 2018 14:50:01 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8386F181E@FRAEML521-MBX.china.huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-3-shameerali.kolothum.thodi@huawei.com>
	<20180528164712.y5rjhu7xixqkjgoe@kamzik.brq.redhat.com>
In-Reply-To: <20180528164712.y5rjhu7xixqkjgoe@kamzik.brq.redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.213.3.17
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 2/6] hw/arm/virt: Enable
 dynamic generation of guest RAM memory regions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	Zhaoshenglong <zhaoshenglong@huawei.com>, Linuxarm <linuxarm@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uxE08alj8Xh2

Hi Drew,

Thanks for going through this.

> -----Original Message-----
> From: Andrew Jones [mailto:drjones@redhat.com]
> Sent: Monday, May 28, 2018 5:47 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> peter.maydell@linaro.org; Jonathan Cameron
> <jonathan.cameron@huawei.com>; Linuxarm <linuxarm@huawei.com>;
> eric.auger@redhat.com; alex.williamson@redhat.com; Zhaoshenglong
> <zhaoshenglong@huawei.com>; imammedo@redhat.com
> Subject: Re: [Qemu-devel] [RFC v2 2/6] hw/arm/virt: Enable dynamic
> generation of guest RAM memory regions
>=20
> On Wed, May 16, 2018 at 04:20:22PM +0100, Shameer Kolothum wrote:
> > Register ram_memory_region_init notifier to allocate memory region
> > from system memory.
> >
> > Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  hw/arm/virt.c         | 28 ++++++++++++++++++++++------
> >  include/hw/arm/virt.h |  1 +
> >  2 files changed, 23 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 94dcb12..05fcb62 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1171,6 +1171,19 @@ void virt_machine_done(Notifier *notifier, void
> *data)
> >      virt_build_smbios(vms);
> >  }
> >
> > +static void virt_ram_memory_region_init(Notifier *notifier, void *data=
)
> > +{
> > +    MemoryRegion *sysmem =3D get_system_memory();
> > +    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
> > +    VirtMachineState *vms =3D container_of(notifier, VirtMachineState,
> > +                                         ram_memory_region_init);
> > +    MachineState *machine =3D MACHINE(vms);
> > +
> > +    memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
> > +                                         machine->ram_size);
> > +    memory_region_add_subregion(sysmem, vms-
> >memmap[VIRT_MEM].base, ram);
> > +}
> > +
> >  static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
> >  {
> >      uint8_t clustersz =3D ARM_DEFAULT_CPUS_PER_CLUSTER;
> > @@ -1204,7 +1217,6 @@ static void machvirt_init(MachineState *machine)
> >      MemoryRegion *sysmem =3D get_system_memory();
> >      MemoryRegion *secure_sysmem =3D NULL;
> >      int n, virt_max_cpus;
> > -    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
> >      bool firmware_loaded =3D bios_name || drive_get(IF_PFLASH, 0, 0);
> >
> >      /* We can probe only here because during property set
> > @@ -1361,10 +1373,6 @@ static void machvirt_init(MachineState *machine)
> >      fdt_add_timer_nodes(vms);
> >      fdt_add_cpu_nodes(vms);
> >
> > -    memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
> > -                                         machine->ram_size);
> > -    memory_region_add_subregion(sysmem, vms-
> >memmap[VIRT_MEM].base, ram);
> > -
> >      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
> >
> >      create_gic(vms, pic);
> > @@ -1405,15 +1413,23 @@ static void machvirt_init(MachineState
> *machine)
> >      vms->bootinfo.loader_start =3D vms->memmap[VIRT_MEM].base;
> >      vms->bootinfo.get_dtb =3D machvirt_dtb;
> >      vms->bootinfo.firmware_loaded =3D firmware_loaded;
> > +
> > +    /* Register notifiers. They are executed in registration reverse o=
rder */
> >      arm_load_kernel(ARM_CPU(first_cpu), &vms->bootinfo);
> >
> >      /*
> >       * arm_load_kernel machine init done notifier registration must
> >       * happen before the platform_bus_create call. In this latter,
> >       * another notifier is registered which adds platform bus nodes.
> > -     * Notifiers are executed in registration reverse order.
> >       */
> >      create_platform_bus(vms, pic);
> > +
> > +    /*
> > +     * Register memory region notifier last as this has to be executed
> > +     * first.
> > +     */
> > +    vms->ram_memory_region_init.notify =3D virt_ram_memory_region_init=
;
> > +    qemu_add_machine_init_done_notifier(&vms-
> >ram_memory_region_init);
>=20
> I realize we've been slow to get to this for reviewing, but a lot has
> changed here since this patch was written. virt now only has a single
> machine done notifier. On rebase we should attempt to integrate with
> that one rather than introduce a new one.

Ok. I will take a look on that one.

Thanks,
Shameer

> Thanks,
> drew
>=20
>=20
> >  }
> >
> >  static bool virt_get_secure(Object *obj, Error **errp)
> > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > index ba0c1a4..fc24f3a 100644
> > --- a/include/hw/arm/virt.h
> > +++ b/include/hw/arm/virt.h
> > @@ -91,6 +91,7 @@ typedef struct {
> >  typedef struct {
> >      MachineState parent;
> >      Notifier machine_done;
> > +    Notifier ram_memory_region_init;
> >      FWCfgState *fw_cfg;
> >      bool secure;
> >      bool highmem;
> > --
> > 2.7.4
> >
> >
> >
