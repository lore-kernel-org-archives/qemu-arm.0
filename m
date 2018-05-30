Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4825852wre;
        Wed, 30 May 2018 07:44:17 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKCyaoI0Yc4xeCkYM57eT6yk/T/zyvXMcbPmqlk9AUv3iE5Fzk4ZJpb3crrFRquu+xKcmE7
X-Received: by 2002:aed:3b49:: with SMTP id q9-v6mr2835291qte.331.1527691457741;
        Wed, 30 May 2018 07:44:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527691457; cv=none;
        d=google.com; s=arc-20160816;
        b=Jxt18S93ZTBWIGJ7WNzPvTVvNQtY5WVdOi7z5paTz7H4O3RsYiSLTprau37dmuhe3c
         j5sC5uy+kntywNqnzaNklpmmqpxH2eYHV/4bjDQsQZ0XeBZT3E9Gvhyyx2zCn4lEoxyB
         06e/fNxGIHtckcNu2BZ2n5YmzqNsFrOvfMEzxU3SnM4lwv7zjiDjuAsQ6yr6CZl+ddDN
         haRAC8D+mdiKr3RRmVXsOSYs2YKTvz+NJu2XY4NzBKw03jTeh3KQ0QZfhmHstKEA+9H1
         jR6io3v6owjI/sqL2n2kHwWlR2Do25raf/u7pK4o5Y59JlFHSx100q2Oy2345DPQgVN1
         WeCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=20Ei6KpizVYm9aJomp1OqkWfRNpXmH8jbbA6jFNANlM=;
        b=ZjSh0EY1qVpDypxk0HA23hob6ebcIev39Ubwm10Bt0/Ms6t9NX1f+pOL/IQG/dgRuI
         mgNfe1G+WSN4I2UpM/ZGKGB7v6UGFyX3IoZ0Lxo64x8OnSjL5cA+U57ZKJP2Qi9wQLOx
         t/RGnY4R8tlij0Ck6reV/XqeI47wX6EsWwKwWIKyxP0bHB3/tk5pgpHrSMa679+I94AT
         GXw0qEgWLHfsnisl5Av+qHoi6QCc4/bu0RKveNCdRSf0rUgVn3ALxJXGdwYu+6aIjK38
         NNEKGy+q+LfBBXdo/+JqfnZmVsP5Tv0qoXcNGyjEHFHI2x0561LzZ84r4cdhdqyyQ/Mp
         llLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h19-v6si3348990qta.374.2018.05.30.07.44.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 07:44:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39065 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO2Kn-00056H-8f
	for alex.bennee@linaro.org; Wed, 30 May 2018 10:44:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2Kb-00052c-3w
	for qemu-arm@nongnu.org; Wed, 30 May 2018 10:44:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2KZ-00085o-Nw
	for qemu-arm@nongnu.org; Wed, 30 May 2018 10:44:05 -0400
Received: from lhrrgout.huawei.com ([194.213.3.17]:4227 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2KZ-00085A-HJ; Wed, 30 May 2018 10:44:03 -0400
Received: from lhreml704-cah.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id 185A413BA44B;
	Wed, 30 May 2018 15:44:00 +0100 (IST)
Received: from FRAEMA707-CHM.china.huawei.com (10.206.14.56) by
	lhreml704-cah.china.huawei.com (10.201.108.45) with Microsoft SMTP
	Server (TLS) id 14.3.382.0; Wed, 30 May 2018 15:44:01 +0100
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.176]) by
	FRAEMA707-CHM.china.huawei.com ([169.254.7.63]) with mapi id
	14.03.0382.000; Wed, 30 May 2018 16:43:55 +0200
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: [RFC v2 2/6] hw/arm/virt: Enable dynamic generation of guest
	RAM memory regions
Thread-Index: AQHT7SmgQBrabppeFUSzP8q+EArFi6RFIp4AgAMZHaA=
Date: Wed, 30 May 2018 14:43:54 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8386F17BD@FRAEML521-MBX.china.huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-3-shameerali.kolothum.thodi@huawei.com>
	<58fb3661-8c2a-7fef-aeaa-ab175ea5bdd9@redhat.com>
In-Reply-To: <58fb3661-8c2a-7fef-aeaa-ab175ea5bdd9@redhat.com>
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
Subject: Re: [Qemu-arm] [RFC v2 2/6] hw/arm/virt: Enable dynamic generation
 of guest RAM memory regions
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
	"drjones@redhat.com" <drjones@redhat.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	Zhaoshenglong <zhaoshenglong@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UuWygQQEwjeO

Hi Eric.

> -----Original Message-----
> From: Auger Eric [mailto:eric.auger@redhat.com]
> Sent: Monday, May 28, 2018 3:22 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> qemu-devel@nongnu.org; qemu-arm@nongnu.org
> Cc: drjones@redhat.com; imammedo@redhat.com; peter.maydell@linaro.org;
> alex.williamson@redhat.com; Zhaoshenglong <zhaoshenglong@huawei.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>; Linuxarm
> <linuxarm@huawei.com>
> Subject: Re: [RFC v2 2/6] hw/arm/virt: Enable dynamic generation of guest
> RAM memory regions
>=20
> Hi Shameer,
> On 05/16/2018 05:20 PM, Shameer Kolothum wrote:
> > Register ram_memory_region_init notifier to allocate memory region
> > from system memory.
>=20
> At this stage the commit message does not explain why you need a machine
> init done notifier. Also the commit title does not summarize the actual
> change.
> Thanks

Right. I will reword/rephrase the text.

Thanks,
Shameer

> Eric
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
> >
