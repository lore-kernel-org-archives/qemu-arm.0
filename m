Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5373926njc;
        Wed, 28 May 2025 03:15:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+2OWw0r7MB9t/3kC2DnBtOUHsVz6z9codu0SgZFBplsWj2r//Egk1kAiE8sbhkPnTnwHmehGJ7AZ7aw==@linaro.org
X-Google-Smtp-Source: AGHT+IF+d/2DjBk9ao6fv3Hltt03880qMe44EIcMCULTjelnZKCZ4Ofzw557uFP463V4jverMtl+
X-Received: by 2002:a05:620a:2952:b0:7ce:e010:88bb with SMTP id af79cd13be357-7cfc5d3bea0mr179428285a.22.1748427318779;
        Wed, 28 May 2025 03:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748427318; cv=none;
        d=google.com; s=arc-20240605;
        b=NqFK9zFzoe2wQtB0bBN0BXV4RPRspdHMNiyOk94vFqAsS/oTNbDa/guAnhhZHFZ6qh
         ZO1JhjX+O8YyUomvMdbkCr+nCatyMLVe4Y/FH1UJUY+fbnULrMIZHf80GIbOtXC+TQSv
         FWRCD1b5WbdcoKqosIHzohb7ExqhBu85YbX6yRt2TwX8B1uISNF11K3XwoNnh9bKJVeB
         mhMVkX/6qedHGFHdD6D+vw8yHDp+ayLBrjgaRcL9VkqVly9+NOjpfM5X9IjVzWCD3ij4
         rwy6H6a2DRHVvSoOrsyY1RTAriILvBaUzQGC932QJuLL48+GwBWx42QoCvQjcony9qJb
         MG6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=g2f4n+w+Mhhm5ES8fLtWZe8X6uz7USJsvXzpfMtWXIY=;
        fh=cZIMiwO22I8sb0wQ+fH/2yfgVaer+2rP+NOZ1i2LZMk=;
        b=Yx4Wg1vQQCa1mcHnT+Rnar7xYEEdXJAkfzlHo5h1IgeV72HR/FzgMoAshFnNQeqDCJ
         oxLHLuRvhROJbvgJ9sne7mTUhTlgAZI1oOimTgdznbCdUO2z82l1qRyFoc7ak0zEr/NM
         br94ajfMSbkqjnf+09/YNJeEVq2oAK3vovAspCB5m3kM1z1+/kVWaehlE2u/XYsF7TqX
         Yw3gY4KZDmNxKABQWbg74DQU6lkZOgxWHbhpuAZWeRmrN8L8fiF75xOvFeTLJvzNeQiv
         1HTaQxMlT5G4Ow5dNFnxRt7nZJlTA14bPbt+B65voYxaTTXf9nE5xFLqa6tKNssOnCN4
         muZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AVBXF+n8;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d09494795csi56479585a.278.2025.05.28.03.15.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:15:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AVBXF+n8;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748427318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2f4n+w+Mhhm5ES8fLtWZe8X6uz7USJsvXzpfMtWXIY=;
	b=AVBXF+n8KPiMea1c4TmnylO0U8Pp4EKygbstjs6zRAymFBKCT+T06YnetcUMZNDBPq7kBf
	ey0ysaoIsPYbBwTI+/5DhQZdwkeRgOzuQrMEa37YGqyi/NeiMc9653b+UzOuQdfEsgpwjK
	i1sg3ud1dEYQpKxOHRnzUwsUH9sCG5w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-MpUPBLWdPWWO--WHkYMP8g-1; Wed, 28 May 2025 06:15:15 -0400
X-MC-Unique: MpUPBLWdPWWO--WHkYMP8g-1
X-Mimecast-MFC-AGG-ID: MpUPBLWdPWWO--WHkYMP8g_1748427314
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-442ffaa7dbeso32841605e9.3
        for <alex.bennee@linaro.org>; Wed, 28 May 2025 03:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748427314; x=1749032114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D5/EqYuJ+LBdMAwVzlVRlyL1+xbWXiH+2gUZZ1TPZI4=;
        b=KBsqCJ3B1lFrLddyYz4SQ3PJJKAk6qGa1mQakcN7R6UY3S6rHiRvbFWImlAnWpvtAj
         /q3aJpOgBNRK6HyRcx2wlPXccRLMw79KEIIsWpeWI4/tdV8FUTE5pOQeiv7VI+8Bk6Jx
         kaBX5W92ioziUGwnsK+jF97m1wEvj52aeiDl2g9/XCCsuXBd50yD5qkDvhGoJzQftS18
         2YFRKrAjhJjACZTJRhqpg37iWq1UwVy7IlJdKYhGcs3ogDJnuSX6S67eul2eveAsityN
         9EPC2lmWmv994gRHRyuIZ+yGUJ0ys4cenQkvGDb812fRX7Z3W4pYfgIyqzZex+ROBPPm
         q+KA==
X-Forwarded-Encrypted: i=1; AJvYcCVPuzNoPNDZHLFhhwfCCIYNH1jux3MOTkdsEs0gvqJ8Z8POvw2hnMo5HixNbLrereNPwGbZghdS1loWjA==@linaro.org
X-Gm-Message-State: AOJu0Yx3/dqfMkOm7WCALFLmZ7L2atEDY+9FbEJTKktDPbBQEkKesIOw
	4fc3nzIw7PvB+p8kUtOy/4w6+7njv8Yjl/WyPbyFj3Sji7sXeQzexiu74SiZXY8RD8iKfzX1/bx
	BjC5ToNK0i4/6MG+lIXENNPOOngrjGXMp83HTDcQW778lwQih6N+2Rkk6xA==
X-Gm-Gg: ASbGncsGYWbL9Yy7emmXGmejb0aIVmIksJhsCD3p0lHJxS4Qde8+X4DzPkgMSCmhxdU
	93K8LUPr2WGbMaWnHLZrYiF3JoshwbN0h9K4IwQGeLB3GEDDmynXCHhdWsttYnpnNvdHYt73Aef
	kl90gzPvc5BKV2XLRNcquXqSbh1tnePeBEuTXpek25xPDYupXSbzdwyOgkal3xZIl/QkRmJXaYX
	mvj5H3zC+EbQMQkt0g4CWdV/XArJ5pRJHJH874RzSOgM/7Jb0/f+WOXRzpB3b3JjMRD3XmpxvSV
	SJ0cRjz2lw6bX9VghasrscQvtX/lMEUJ
X-Received: by 2002:a05:600c:154f:b0:441:d438:505c with SMTP id 5b1f17b1804b1-44c935dd818mr114901875e9.32.1748427314005;
        Wed, 28 May 2025 03:15:14 -0700 (PDT)
X-Received: by 2002:a05:600c:154f:b0:441:d438:505c with SMTP id 5b1f17b1804b1-44c935dd818mr114901585e9.32.1748427313436;
        Wed, 28 May 2025 03:15:13 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eac7e0c8sm1069652f8f.30.2025.05.28.03.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:15:13 -0700 (PDT)
Date: Wed, 28 May 2025 12:15:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org,
 alex.bennee@linaro.org
Subject: Re: [PATCH v2 22/25] hw/arm/virt: Let virt support pci
 hotplug/unplug GED event
Message-ID: <20250528121511.510bbba2@imammedo.users.ipa.redhat.com>
In-Reply-To: <363b7862-84b3-4bd1-85d6-781eb9ecf161@linaro.org>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-23-eric.auger@redhat.com>
	<20250527175649.5d276bc8@imammedo.users.ipa.redhat.com>
	<363b7862-84b3-4bd1-85d6-781eb9ecf161@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q9R_CXxVkgie6S36tPsRA_SEmVxxQqefiCadn_lH16A_1748427314
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-TUID: NV5Hsu29nyAb

On Tue, 27 May 2025 13:44:35 -0300
Gustavo Romero <gustavo.romero@linaro.org> wrote:

> Hi folks,
>=20
> On 5/27/25 12:56, Igor Mammedov wrote:
> > On Tue, 27 May 2025 09:40:24 +0200
> > Eric Auger <eric.auger@redhat.com> wrote:
> >  =20
> >> Set up the IO registers used to communicate between QEMU
> >> and ACPI. =20
> >=20
> >=20
> >  =20
> >> Move the create_pcie() call after the creation of the acpi
> >> ged device since hotplug callbacks will soon be called on gpex
> >> realize and will require the acpi pcihp state to be initialized.
> >>
> >> The hacky thing is the root bus has not yet been created on
> >> acpi_pcihp_init() call so it is set later after the gpex realize. =20
> >=20
> > can you elaborate on this, preferably with call expected call flows? =
=20
>=20
> The way I'm understanding it is: because the GED and GPEX are created
> in virt.c, so at the machine "level" (and so a machine hotplug handler is
> used instead of a device hotplug handler, like it's done in PIIX4 and ICH=
9
> controller in the x86 machines), and they need to be created in that
> order because of dependecy of GPEX of GED, the flow is:
>=20
> 1) create_acpi_ged() -> calls acpi_pcihp_init(), which by its turn will i=
nspect the root bus to generate the ACPI code
> 2) create_pcie() -> just in realize the root bus will be created
>=20
> and the sequence has to be 1 -> 2, because GED will be used in the GPEX c=
allbacks on hotplug.
>=20
> So here we're following a different design from the current one in x86,
> which handles the hotplug at the PCI controller "level".

It should be fine to keep x86 design instead of making up a new one
(unless we have to).

The difference between x86 and ARM is that acpi device happens to part of
host bridge or its children. While in ARM virt, its separate devices
(GPEX & GED).

From quick glance at the code, It should be fine to keep pcihp hw as part
of GED. All it needs from host-bridge is root bus, the rest is paravirt
ACPI magic wand.

Also we typically handle hotplug for devices that have parent bus
we are using bus hotplug handler.
Only bus-less or complicated cases are orchestrated by machine.
That's what is not this series, it probably has been overlooked
since it's not in pcihp.c, so kinda not obvious.

for example see:
   ich9_pm_init()
     qbus_set_hotplug_handler()
where default native hotplug handler is overridden with ACPI one,
and then later on, all coldplug bridges are picked up by
acpi_pcihp_device_plug_cb() and got the same treatment.

So I'd suggest to try keeping current order with few changes
  create pci
  create ged (bus)
      acpidev =3D object_new(GED)
      object_property_set_link(acpidev, 'pci_root_bus', bus)
      realize(acpidev)

and then in
     ged_realize(dev)
        acpi_pcihp_init()
        qbus_set_hotplug_handler(root_bus, dev)

that's likely would do the job.

>=20
> Cheers,
> Gustavo
>=20
> >> How to fix this chicken & egg issue?
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>
> >> ---
> >>
> >> v1 -> v2:
> >> - use ACPI_PCIHP_REGION_NAME
> >> ---
> >>   include/hw/arm/virt.h    |  1 +
> >>   hw/arm/virt-acpi-build.c |  1 +
> >>   hw/arm/virt.c            | 42 +++++++++++++++++++++++++++++++++++---=
--
> >>   3 files changed, 39 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> >> index 1b2e2e1284..a4c4e3a67a 100644
> >> --- a/include/hw/arm/virt.h
> >> +++ b/include/hw/arm/virt.h
> >> @@ -35,6 +35,7 @@
> >>   #include "hw/boards.h"
> >>   #include "hw/arm/boot.h"
> >>   #include "hw/arm/bsa.h"
> >> +#include "hw/acpi/pcihp.h"
> >>   #include "hw/block/flash.h"
> >>   #include "system/kvm.h"
> >>   #include "hw/intc/arm_gicv3_common.h"
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index 9d88ffc318..cd49f67d60 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -44,6 +44,7 @@
> >>   #include "hw/acpi/generic_event_device.h"
> >>   #include "hw/acpi/tpm.h"
> >>   #include "hw/acpi/hmat.h"
> >> +#include "hw/acpi/pcihp.h"
> >>   #include "hw/pci/pcie_host.h"
> >>   #include "hw/pci/pci.h"
> >>   #include "hw/pci/pci_bus.h"
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index 4aa40c8e8b..cdcff0a984 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -682,6 +682,8 @@ static inline DeviceState *create_acpi_ged(VirtMac=
hineState *vms)
> >>   {
> >>       DeviceState *dev;
> >>       MachineState *ms =3D MACHINE(vms);
> >> +    SysBusDevice *sbdev;
> >> +
> >>       int irq =3D vms->irqmap[VIRT_ACPI_GED];
> >>       uint32_t event =3D ACPI_GED_PWR_DOWN_EVT;
> >>  =20
> >> @@ -693,12 +695,28 @@ static inline DeviceState *create_acpi_ged(VirtM=
achineState *vms)
> >>           event |=3D ACPI_GED_NVDIMM_HOTPLUG_EVT;
> >>       }
> >>  =20
> >> +    if (vms->acpi_pcihp) {
> >> +        event |=3D ACPI_GED_PCI_HOTPLUG_EVT;
> >> +    }
> >> +
> >>       dev =3D qdev_new(TYPE_ACPI_GED);
> >>       qdev_prop_set_uint32(dev, "ged-event", event);
> >> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> >> +    sbdev =3D SYS_BUS_DEVICE(dev);
> >> +    sysbus_realize_and_unref(sbdev, &error_fatal);
> >>  =20
> >> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED=
].base);
> >> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, vms->memmap[VIRT_PCDIMM_A=
CPI].base);
> >> +    sysbus_mmio_map(sbdev, 0, vms->memmap[VIRT_ACPI_GED].base);
> >> +    sysbus_mmio_map(sbdev, 1, vms->memmap[VIRT_PCDIMM_ACPI].base); =
=20
> >=20
> >=20
> > Perhaps move out sbdev renaming into a separate patch, as it's not real=
ly related.
> >  =20
> >> +    if (vms->acpi_pcihp) {
> >> +        AcpiGedState *acpi_ged_state =3D ACPI_GED(dev);
> >> +        int i;
> >> +
> >> +        i =3D sysbus_mmio_map_name(sbdev, ACPI_PCIHP_REGION_NAME,
> >> +                                 vms->memmap[VIRT_ACPI_PCIHP].base); =
=20
> >=20
> > I don't like mix of old way (index based) above and new name based mapp=
ing,
> > can we use the same, please?
> >  =20
> >> +        assert(i >=3D 0); =20
> > g_assert(sysbus_mmio_map_name...) to get more meaning-full crash
> > that is not compiled out.
> >  =20
> >> +        acpi_pcihp_init(OBJECT(dev), &acpi_ged_state->pcihp_state,
> >> +                        vms->bus, sysbus_mmio_get_region(sbdev, i), 0=
); =20
> >=20
> > hmm, looks broken..
> >   region mapping must happen after acpi_pcihp_init().
> >=20
> > if we after making sysbus_mmio_map() sane and easier to use
> > (which is a bit on tangent to this series).
> > We could feed sysbus owner device a memory map (ex: name based),
> > and then use [pre_]plug handlers on sysbus to map children
> > automatically.
> > That will alleviate need to do all mapping manually in every board.
> > (frankly speaking it deserves its own series, with tree wide cleanup).
> >=20
> > As it is I'd use old index based approach like the rest.
> > (unless you feel adventurous about sysbus refactoring)
> >=20
> >  =20
> >> +        acpi_ged_state->pcihp_state.use_acpi_hotplug_bridge =3D true;
> >> +    }
> >>       sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(vms-=
>gic, irq));
> >>  =20
> >>       return dev;
> >> @@ -1758,6 +1776,13 @@ void virt_machine_done(Notifier *notifier, void=
 *data)
> >>       pci_bus_add_fw_cfg_extra_pci_roots(vms->fw_cfg, vms->bus,
> >>                                          &error_abort); =20
> >=20
> >  =20
> >> +
> >> +    if (vms->acpi_pcihp) {
> >> +        AcpiGedState *acpi_ged_state =3D ACPI_GED(vms->acpi_dev);
> >> +
> >> +        acpi_pcihp_reset(&acpi_ged_state->pcihp_state);
> >> +    }
> >> +
> >>       virt_acpi_setup(vms);
> >>       virt_build_smbios(vms);
> >>   }
> >> @@ -2395,8 +2420,6 @@ static void machvirt_init(MachineState *machine)
> >>  =20
> >>       create_rtc(vms);
> >>  =20
> >> -    create_pcie(vms);
> >> -
> >>       if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enable=
d(vms)) {
> >>           vms->acpi_pcihp &=3D !vmc->no_acpi_pcihp;
> >>           vms->acpi_dev =3D create_acpi_ged(vms);
> >> @@ -2405,6 +2428,15 @@ static void machvirt_init(MachineState *machine=
)
> >>           create_gpio_devices(vms, VIRT_GPIO, sysmem);
> >>       }
> >>  =20
> >> +    create_pcie(vms);
> >> +
> >> +    if (vms->acpi_dev) {
> >> +        AcpiGedState *acpi_ged_state =3D ACPI_GED(vms->acpi_dev);
> >> +
> >> +        acpi_ged_state =3D ACPI_GED(vms->acpi_dev);
> >> +        acpi_ged_state->pcihp_state.root =3D vms->bus;
> >> +    }
> >> +
> >>       if (vms->secure && !vmc->no_secure_gpio) {
> >>           create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
> >>       } =20
> >=20
> > I don't like pulling acpi_pcihp_init()/reset (and issues it causes) int=
o board code,
> > on x86 it's a part of host bridge device model.
> > The same should apply to GED device.
> >=20
> > The only thing board has to do is map regions into IO space like we do
> > everywhere else.
> >=20
> > with current code, may be add link<pci_bus> property to GED,
> > and set it before GED realize in create_acpi_ged(),
> > then just follow existing sysbus_mmio_map() pattern.
> >  =20
>=20
