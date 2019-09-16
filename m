Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3837218wrp;
        Mon, 16 Sep 2019 03:31:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMoKQ6if2Cw6LFmCCxgiGaWiE397bSQVNoPgs+Ijz3LA7a8pP/Iu9HVQxwzlztf7V479QL
X-Received: by 2002:a17:907:20a2:: with SMTP id pw2mr6102600ejb.163.1568629882662;
        Mon, 16 Sep 2019 03:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568629882; cv=none;
        d=google.com; s=arc-20160816;
        b=uZEf1Kf5Bb47TGSO8WcxIRZ5h+ku32iBz5Xf/UMZsqEkBtiCtp2ECvHY0ISyiqq9Zo
         4cHqsjF+YnB6UW8PHAbrwYNmVwyDLaMt9uYFeV0gf7PcFA1dWdEact55W+Tqrivnv3iI
         2pDmjScoK3wgQx9SRcQxqDABqdnpKMbqyGvxfhEnjPme0I6k9R6IQsi9RUhmX/CoRctl
         hS0LCvlRMVoYIErCK3lVZedV3jPyV2y19lRWD9gJu6jCNyDcGp6kHyfQ1i9peFCcrx8u
         Pw3L51+I9VZSJOtxlBIhz9r1bbSBfBJ4AqyFO4gjTPhGTnTokPq9NsMIynZrKyFDRM5n
         dVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=cQ5omEzGSAX0Jq7Cf0iepLV/sHOmvzEJvnSdCotDcXA=;
        b=VZVqO45SxijhSx/5zCXutFkhx0jK59ua+S5EF4hbpHtPBV9Creom9Xnh/YZwhbrfmf
         03Mr2IKTmC+GWb+30BnthlHvRRacYtAQ+39i0lxXdPGIKL5EXGWmZip/PgPJxHBeDo3o
         ToWrlIswILyh70ljHj+mQ8wyJbLZO0LRNOSVq6INwsi5A/u66OlfZfnZVMCjuGhGQWob
         uhv1XM56nUsGK/qFLQldLhVOVTEKekm8mh2OJDroPvzWS5+6kP4iM7rPd3MbtQKasfnX
         JxUBC9Io0jLcBmnDv09Db5uYUEHSR7Qa8EYKjx4RUxL/4bYa+FR78SIcz9spbY4Juao0
         Aqfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br19si19499069ejb.43.2019.09.16.03.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 03:31:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9oHx-0005jX-FM
	for alex.bennee@linaro.org; Mon, 16 Sep 2019 06:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48714)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i9oHg-0005jN-UI
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 06:31:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i9oHf-0008CW-8p
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 06:31:04 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45440 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i9oHf-00088a-2Z; Mon, 16 Sep 2019 06:31:03 -0400
Received: from lhreml708-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id CA0D2B3BADA03FA91413;
 Mon, 16 Sep 2019 11:30:54 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.65]) by
 lhreml708-cah.china.huawei.com ([10.201.108.49]) with mapi id 14.03.0415.000; 
 Mon, 16 Sep 2019 11:30:45 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [PATCH-for-4.2 v10 05/11] hw/arm/virt: Enable device memory
 cold/hot plug with ACPI boot
Thread-Index: AQHVaKHVnammLOI3e0qhJzz+2jBkq6cuIIkA
Date: Mon, 16 Sep 2019 10:30:45 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83F3F293A@lhreml524-mbs.china.huawei.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
 <20190904085629.13872-6-shameerali.kolothum.thodi@huawei.com>
 <20190911150700.7a917d14@redhat.com>
In-Reply-To: <20190911150700.7a917d14@redhat.com>
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
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v10 05/11] hw/arm/virt: Enable device
 memory cold/hot plug with ACPI boot
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "sameo@linux.intel.com" <sameo@linux.intel.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NpaLUs24PqmR

Hi Igor,

> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 11 September 2019 14:07
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org;
> shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> sebastien.boeuf@intel.com; xuwei (O) <xuwei5@huawei.com>;
> lersek@redhat.com; ard.biesheuvel@linaro.org; Linuxarm
> <linuxarm@huawei.com>
> Subject: Re: [PATCH-for-4.2 v10 05/11] hw/arm/virt: Enable device memory
> cold/hot plug with ACPI boot
>=20
> On Wed, 4 Sep 2019 09:56:23 +0100
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> [...]
> > @@ -730,6 +733,19 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> VirtMachineState *vms)
> >                        vms->highmem, vms->highmem_ecam);
> >      acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
> >                         (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
> > +    if (vms->acpi_dev) {
> > +        build_ged_aml(scope, "\\_SB."GED_DEVICE,
> > +                      HOTPLUG_HANDLER(vms->acpi_dev),
> > +                      irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE,
> AML_SYSTEM_MEMORY,
> > +                      memmap[VIRT_ACPI_GED].base);
> > +    }
> > +
> > +    if (vms->acpi_dev && ms->ram_slots) {
> > +        build_memory_hotplug_aml(scope, ms->ram_slots, "\\_SB",
> NULL,
> > +                                 AML_SYSTEM_MEMORY,
> > +
> memmap[VIRT_PCDIMM_ACPI].base);
> > +    }
> one more thing (though non critical), if ms->ram_slots =3D=3D 0 ^^^^
> makes IASL spew a warning
>=20
>     External (_SB_.MHPC.MSCN, MethodObj)    // Warning: Unknown
> method, guessing 0 arguments
>=20
> In general non-existing references within methods are fine if they aren't=
 ever
> used.
> however we can be a little bit less sloppy.
> Below you advertise "event =3D ACPI_GED_MEM_HOTPLUG_EVT", and then here
> suddenly
> don't generate essential AML part for it here.

Ok.

> For consistency if above is conditioned on ms->ram_slots !=3D 0, probably
> it would be better to move that condition where you set 'event' value and
> check property value above instead of ms->ram_slots

I understand the concern here, but not sure I get the suggestion to check=20
the "property" instead of ms->ram_slots correctly.=20

Is this what you have in mind?

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 538b3bbefa..5c9269dca1 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -742,10 +742,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
                       memmap[VIRT_ACPI_GED].base);
     }
=20
-    if (vms->acpi_dev && ms->ram_slots) {
-        build_memory_hotplug_aml(scope, ms->ram_slots, "\\_SB", NULL,
-                                 AML_SYSTEM_MEMORY,
-                                 memmap[VIRT_PCDIMM_ACPI].base);
+    if (vms->acpi_dev) {
+        uint32_t event =3D object_property_get_uint(OBJECT(vms->acpi_dev),
+                                                  "ged-event", NULL);
+
+        if (event & ACPI_GED_MEM_HOTPLUG_EVT) {
+            build_memory_hotplug_aml(scope, ms->ram_slots, "\\_SB", NULL,
+                                     AML_SYSTEM_MEMORY,
+                                     memmap[VIRT_PCDIMM_ACPI].base);
+        }
     }
=20
     acpi_dsdt_add_power_button(scope);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index bc152ea2b0..6b024b16df 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -534,8 +534,13 @@ static void fdt_add_pmu_nodes(const VirtMachineState *=
vms)
 static inline DeviceState *create_acpi_ged(VirtMachineState *vms, qemu_irq=
 *pic)
 {
     DeviceState *dev;
+    MachineState *ms =3D MACHINE(vms);
     int irq =3D vms->irqmap[VIRT_ACPI_GED];
-    uint32_t event =3D ACPI_GED_MEM_HOTPLUG_EVT;
+    uint32_t event =3D 0;
+
+    if (ms->ram_slots) {
+        event =3D ACPI_GED_MEM_HOTPLUG_EVT;
+    }
=20
     dev =3D qdev_create(NULL, TYPE_ACPI_GED);
     qdev_prop_set_uint32(dev, "ged-event", event);

---8---

Please let me know.

Thanks,
Shameer

=20
> [...]
> > +static inline DeviceState *create_acpi_ged(VirtMachineState *vms,
> qemu_irq *pic)
> > +{
> > +    DeviceState *dev;
> > +    int irq =3D vms->irqmap[VIRT_ACPI_GED];
> > +    uint32_t event =3D ACPI_GED_MEM_HOTPLUG_EVT;
> > +
> > +    dev =3D qdev_create(NULL, TYPE_ACPI_GED);
> > +    qdev_prop_set_uint32(dev, "ged-event", event);
> > +    qdev_init_nofail(dev);
> > +
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,
> vms->memmap[VIRT_ACPI_GED].base);
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1,
> vms->memmap[VIRT_PCDIMM_ACPI].base);
> > +
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[irq]);
> > +
> > +    return dev;
> > +}
> > +
> [...]
