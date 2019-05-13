Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3049408wrg;
        Mon, 13 May 2019 10:00:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxTmt14sDuCiQPMtLVqHgm0BTgHyW3DZ3jio6srYVv5Umryjmb61g1jHDjvf/HST+VCFzlm
X-Received: by 2002:a50:ab1d:: with SMTP id s29mr30686682edc.56.1557766852823;
        Mon, 13 May 2019 10:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557766852; cv=none;
        d=google.com; s=arc-20160816;
        b=iBxm2WxlzIiRgYRnXKAZjbqZvUZ52c2KcUlEtsEiRkWVRYKZ/DCjohjj+XVqCcNqEy
         c25Z0+S9bwJusErFZWIhc9UF29t+UxWboIGoser+ylUIFnmtuCrp2XHTkRwvZg/Qmvs8
         mPx4p9MxB48/cDeNJU+5DxzgDdreDDHDlJivaSsVQS8GxmVcUkF7hK+l/WR8xKfOUkp8
         GNUcYW1neoK2G2ErocS/+Qw+r6ei43FwKctNm3CyGJMtvJd2lB/pFZbZ+Ro3Y/dajLlA
         HaTOR8n/I7sA42mtqWbX+1KPGbSD1A8DE6n93RUScmHrZ+TUd6DrDNE4HhIDunP+uayU
         s1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=PdbfAW+vAHCEPptfTrsdl0++7QQWNbFCZ+SKZm1o+Gw=;
        b=kxKGhfZBBiTcrx85jN2JWATJVyBObK6hx9r0pR6Hkxb0+oXHjhCOp9Ed1eIR/+ddbD
         JzfN6UoiboyG8RNv+scmWcMdYO+HIWppmDJtzUunMFvnB/d8GLbAAiA6f4+XG3mMdrB7
         Ou0A6HeOjSZ7TWQw0xCdKGqeI2dxL8rf5BrTxC9tXJXwPV8aea8g/92ksSBrvshTumP0
         58hcjlEqoKTTW9KpEcdpKGKcfOW+/zk5FDjr89doYvqIltx95332lLUlScYR+CXatZRH
         smeEU1/T8tWnRCuatWROivaxCzY6k73cxb84E/OONFzZsSZxo5wKVd3UXtVLcrTWNteq
         n6og==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h58si1085021eda.50.2019.05.13.10.00.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 May 2019 10:00:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:60572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQEJn-000403-NQ
	for alex.bennee@linaro.org; Mon, 13 May 2019 13:00:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hQEJN-0003xq-VN
	for qemu-arm@nongnu.org; Mon, 13 May 2019 13:00:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hQEJL-00040t-Qq
	for qemu-arm@nongnu.org; Mon, 13 May 2019 13:00:25 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45405 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hQEJL-0003x4-3a; Mon, 13 May 2019 13:00:23 -0400
Received: from LHREML712-CAH.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id 280EEB014FD4D9AA97E0;
	Mon, 13 May 2019 18:00:19 +0100 (IST)
Received: from LHREML524-MBB.china.huawei.com ([169.254.3.57]) by
	LHREML712-CAH.china.huawei.com ([10.201.108.35]) with mapi id
	14.03.0415.000; Mon, 13 May 2019 18:00:13 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [PATCH v4 3/8] hw/acpi: Add ACPI Generic Event Device Support
Thread-Index: AQHU7r9fDZwDNe9r+EiYOfOuYN+yBqZYFYcAgAFHvsCAD8XcEIAAWT3w
Date: Mon, 13 May 2019 17:00:13 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83F1F0EB5@lhreml524-mbb.china.huawei.com>
References: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
	<20190409102935.28292-4-shameerali.kolothum.thodi@huawei.com>
	<20190502181252.2e3ae0d4@Igors-MacBook-Pro>
	<5FC3163CFD30C246ABAA99954A238FA83F1EF349@lhreml524-mbb.china.huawei.com>
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA83F1EF349@lhreml524-mbb.china.huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-arm] [PATCH v4 3/8] hw/acpi: Add ACPI Generic Event
 Device Support
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
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "xuwei
	\(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
	"lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5uu9KTtRlqMJ

> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 13 May 2019 17:25
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Subject: Re: [PATCH v4 3/8] hw/acpi: Add ACPI Generic Event Device Suppor=
t
>=20
> On Mon, 13 May 2019 11:53:38 +0000
> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > Hi Igor,
> >
> > > -----Original Message-----
> > > From: Shameerali Kolothum Thodi
> > > Sent: 03 May 2019 13:46
> > > To: 'Igor Mammedov' <imammedo@redhat.com>
> > > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> > > eric.auger@redhat.com; peter.maydell@linaro.org;
> > > shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> > > sebastien.boeuf@intel.com; xuwei (O) <xuwei5@huawei.com>;
> > > lersek@redhat.com; ard.biesheuvel@linaro.org; Linuxarm
> > > <linuxarm@huawei.com>
> > > Subject: RE: [PATCH v4 3/8] hw/acpi: Add ACPI Generic Event Device
> Support
> > >
> > > Hi Igor,
> > >
> > > > -----Original Message-----
> > > > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > > > Sent: 02 May 2019 17:13
> > > > To: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>
> > > > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> > > > eric.auger@redhat.com; peter.maydell@linaro.org;
> > > > shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> > > > sebastien.boeuf@intel.com; xuwei (O) <xuwei5@huawei.com>;
> > > > lersek@redhat.com; ard.biesheuvel@linaro.org; Linuxarm
> > > > <linuxarm@huawei.com>
> > > > Subject: Re: [PATCH v4 3/8] hw/acpi: Add ACPI Generic Event Device
> Support
> > > >
> >
> > [...]
> >
> > > > > +}
> > > > > +
> > > > > +static Property acpi_ged_properties[] =3D {
> > > > > +    /*
> > > > > +     * Memory hotplug base address is a property of GED here,
> > > > > +     * because GED handles memory hotplug event and
> > > > MEMORY_HOTPLUG_DEVICE
> > > > > +     * gets initialized when GED device is realized.
> > > > > +     */
> > > > > +    DEFINE_PROP_UINT64("memhp-base", AcpiGedState,
> memhp_base,
> > > > 0),
> > > > > +    DEFINE_PROP_BOOL("memory-hotplug-support", AcpiGedState,
> > > > > +                     memhp_state.is_enabled, true),
> > > > > +    DEFINE_PROP_PTR("gsi", AcpiGedState, gsi),
> > > >
> > > > PTR shouldn't be used in new code, look at object_property_add_link=
() &
> co
> > >
> > > Ok. I will take a look at that.
> >
> > I attempted to remove _PROP_PTR for "ged-events" and use _PROP_LINK
> and
> > _set_link(),
> >
> >
> > diff --git a/hw/acpi/generic_event_device.c
> b/hw/acpi/generic_event_device.c
> > index 856ca04c01..978c8e088e 100644
> > --- a/hw/acpi/generic_event_device.c
> > +++ b/hw/acpi/generic_event_device.c
> > @@ -268,7 +268,8 @@ static Property acpi_ged_properties[] =3D {
> >      DEFINE_PROP_PTR("gsi", AcpiGedState, gsi),
> >      DEFINE_PROP_UINT64("ged-base", AcpiGedState, ged_base, 0),
> >      DEFINE_PROP_UINT32("ged-irq", AcpiGedState, ged_irq, 0),
> > -    DEFINE_PROP_PTR("ged-events", AcpiGedState, ged_events),
> > +    DEFINE_PROP_LINK("ged-events", AcpiGedState, ged_events,
> TYPE_ACPI_GED,
> > +                     GedEvent *),
> >      DEFINE_PROP_UINT32("ged-events-size", AcpiGedState,
> ged_events_size, 0),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 8179b3e511..c89b7b7120 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -537,7 +537,8 @@ static inline DeviceState
> *create_acpi_ged(VirtMachineState *vms)
> >      qdev_prop_set_ptr(dev, "gsi", vms->gsi);
> >      qdev_prop_set_uint64(dev, "ged-base",
> vms->memmap[VIRT_ACPI_GED].base);
> >      qdev_prop_set_uint32(dev, "ged-irq", vms->irqmap[VIRT_ACPI_GED]);
> > -    qdev_prop_set_ptr(dev, "ged-events", ged_events);
> > +    object_property_set_link(OBJECT(dev), OBJECT(ged_events),
> "ged-events",
> > +                             &error_abort);
> >      qdev_prop_set_uint32(dev, "ged-events-size",
> ARRAY_SIZE(ged_events));
> >
> >      object_property_add_child(qdev_get_machine(), "acpi-ged",
> > diff --git a/include/hw/acpi/generic_event_device.h
> b/include/hw/acpi/generic_event_device.h
> > index 9c840d8064..588f4ecfba 100644
> > --- a/include/hw/acpi/generic_event_device.h
> > +++ b/include/hw/acpi/generic_event_device.h
> > @@ -111,7 +111,7 @@ typedef struct AcpiGedState {
> >      hwaddr ged_base;
> >      GEDState ged_state;
> >      uint32_t ged_irq;
> > -    void *ged_events;
> > +    GedEvent *ged_events;
> >      uint32_t ged_events_size;
> >  } AcpiGedState;
> >
> >
> > And with this I get,
> >
> > Segmentation fault      (core dumped) ./qemu-system-aarch64-ged-v5
> > -machine virt, -cpu cortex-a57 -machine type=3Dvirt -nographic -smp 1 -=
m
> > 4G,maxmem=3D8G,slots=3D10 -drive if=3Dnone,file=3Dubuntu-est-5.0,id=3Df=
s -device
> > virtio-blk-device,drive=3Dfs -kernel Image_memhp_remove -bios
> > QEMU_EFI_Release.fd -object memory-backend-ram,id=3Dmem1,size=3D1G
> -device
> > pc-dimm,id=3Ddimm1,memdev=3Dmem1 -numa node,nodeid=3D0 -append
> > "console=3DttyAMA0 root=3D/dev/vda rw acpi=3Dforce movable_node"
> >
> > It looks like struct pointer cannot be used directly and has to make a =
QOM
> object
> > for DEFINE_PROP_LINK use. Not sure there is an easy way for setting ptr
> property
> > using link() functions. Please let me know if there any reference
> implementation I
> > can take a look.
>=20
> Simple 'struct' won't work with link, it has to be QOM object.
>=20
> Question is do we still need GedEvent array?
> We handle only 1 irq and several event types, why not replace GedEvent
> with with a 32bit bitmap (1 bit per event type) and pass that to
> ged device from machine as 'int' property?

Right. That might solve the ged_events ptr issue. But we need to set the ir=
q as
well for the GED device. Is there a way to set the irq directly for a TYPE_=
DEVICE
object?=20

(I think Eric mentioned a way of setting it directly earlier but that time =
GED was=20
a TYPE_SYS_BUS_DEVICE. May be that is a reason to go back to SYS_BUS_DEVICE=
 )

Thanks,
Shameer

> >
> > Appreciate your help,
> >
> > Thanks,
> > Shameer
> >
