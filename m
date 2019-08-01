Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6636448wrv;
        Thu, 1 Aug 2019 01:36:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWcTH6h1/QpFrS1toP2qjteZfhRS6WJ9LRwY6bFu5clgxzGneVQcrvqkiscNT+7xRPSBxM
X-Received: by 2002:a50:ad45:: with SMTP id z5mr110575847edc.21.1564648618553;
        Thu, 01 Aug 2019 01:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564648618; cv=none;
        d=google.com; s=arc-20160816;
        b=r5k9/WWxaa4vgfdH96+/WiTgeIV+/t/hq1VxhP491czDWoi1PUa8ZxlLy4p120FI84
         j9rCPFNuzIvMOaFWY2NeoCFUL5JT0gItgFkuhdfyDsAWTcZwvH2BAY9r1VpTh1Gjupap
         57sFf1E2tkDUHR45zdgnrqZaaCJKq2pvT/fH8EGitXQAuUuM8oHiPqjAJvgDs2XSIQ6I
         S1xYj6Mn5eObZXAtWaNc6+D/37XFNrN3EIgsN+yn8HG6UROeAP4yBUoU7t3aM42lOpA7
         a6Zbwow8YRO+100eGy0+oSorHuRAUyRCgqKrPwqxjDt4mfKWqFVGZ++sngau4dWCTd/d
         zP1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=F/hbsKpZIjJf/LhyEuGbnJJXB/Zaak9DGIxe3zGWmTE=;
        b=WVm+lflSkHwQsStbEVRgK0yYSrdcHY8ZZrw0xS09ODSV8a5CR1Y6UNuuAVpRRVarT6
         3GDppeoKe3YLLTCIhD8hN1xjHObkfOcqJeiLbXKm/tFvtz1wfNx1X7t6MnUnnwQVURMK
         hIw9cPFeauTXO/tz1fiSWE6zV5XppCZVUk9Jq/CaejT/GI6DPLfPY58Lq6C+hrxpS4Oq
         cGM4Y+j0aD2gZsuv4NHA/RRTqbi72mrwsq9O3N15+XbueYp+HK5zKNt82q+k+7Nd6nUy
         mMtCDyHboE/4cNAYo/omtIvXoa8B9vwKl3ylKOBeLfcUJaUUNHSewyIrMKCM6nZh7RGP
         DFcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si15324923edc.258.2019.08.01.01.36.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Aug 2019 01:36:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ht6a1-00020s-Ma
	for alex.bennee@linaro.org; Thu, 01 Aug 2019 04:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54148)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ht6Zp-00020X-Vu
 for qemu-arm@nongnu.org; Thu, 01 Aug 2019 04:36:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ht6Zo-0001tE-Jf
 for qemu-arm@nongnu.org; Thu, 01 Aug 2019 04:36:45 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45430 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ht6Zo-0001nj-Db; Thu, 01 Aug 2019 04:36:44 -0400
Received: from lhreml706-cah.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id BA6CBE775D649C9C7468;
 Thu,  1 Aug 2019 09:36:38 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.132]) by
 lhreml706-cah.china.huawei.com ([10.201.108.47]) with mapi id 14.03.0415.000; 
 Thu, 1 Aug 2019 09:36:32 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH-for-4.2 v8 3/9] hw/acpi: Add ACPI Generic
 Event Device Support
Thread-Index: AQHVQ59yMX5aLsD6RUC6fmsBLoK9kKbjPgEAgALB4LA=
Date: Thu, 1 Aug 2019 08:36:33 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83F33D896@lhreml524-mbs.china.huawei.com>
References: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
 <20190726104519.23812-4-shameerali.kolothum.thodi@huawei.com>
 <20190730172524.6cf566ed@Igors-MacBook-Pro>
In-Reply-To: <20190730172524.6cf566ed@Igors-MacBook-Pro>
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
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.2 v8 3/9] hw/acpi: Add
 ACPI Generic Event Device Support
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
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3yLXChLkkfbz

Hi Igor,

> -----Original Message-----
> From: Qemu-devel
> [mailto:qemu-devel-bounces+shameerali.kolothum.thodi=3Dhuawei.com@nongn
> u.org] On Behalf Of Igor Mammedov
> Sent: 30 July 2019 16:25
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: peter.maydell@linaro.org; sameo@linux.intel.com;
> ard.biesheuvel@linaro.org; shannon.zhaosl@gmail.com;
> qemu-devel@nongnu.org; xuwei (O) <xuwei5@huawei.com>; Linuxarm
> <linuxarm@huawei.com>; eric.auger@redhat.com; qemu-arm@nongnu.org;
> Paolo Bonzini <pbonzini@redhat.com>; sebastien.boeuf@intel.com;
> lersek@redhat.com
> Subject: Re: [Qemu-devel] [PATCH-for-4.2 v8 3/9] hw/acpi: Add ACPI Generi=
c
> Event Device Support
>=20
> On Fri, 26 Jul 2019 11:45:13 +0100
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > From: Samuel Ortiz <sameo@linux.intel.com>
> >
> > The ACPI Generic Event Device (GED) is a hardware-reduced specific
> > device[ACPI v6.1 Section 5.6.9] that handles all platform events,
> > including the hotplug ones. This patch generates the AML code that
> > defines GEDs.
> >
> > Platforms need to specify their own GED Event bitmap to describe
> > what kind of events they want to support through GED.  Also this
> > uses a a single interrupt for the  GED device, relying on IO
> > memory region to communicate the type of device affected by the
> > interrupt. This way, we can support up to 32 events with a unique
> > interrupt.
> >
> > This supports only memory hotplug for now.
> >
>=20
> > diff --git a/hw/acpi/generic_event_device.c
> b/hw/acpi/generic_event_device.c
> > new file mode 100644
> > index 0000000000..7902e9d706
> > --- /dev/null
> > +++ b/hw/acpi/generic_event_device.c
> [...]
> > +void build_ged_aml(Aml *table, const char *name, HotplugHandler
> *hotplug_dev,
> > +                   uint32_t ged_irq, AmlRegionSpace rs)
> > +{
> [...]
> > +
> > +        if (ged_events) {
> > +            error_report("GED: Unsupported events specified");
> > +            exit(1);
> I'd use error_abort instead, since it's programing error, if you have to =
respin
> series.

Ok.

> > +        }
> > +    }
> > +
> > +    /* Append _EVT method */
> > +    aml_append(dev, evt);
> > +
> > +    aml_append(table, dev);
> > +}
> > +
> [...]
> > +static void acpi_ged_device_realize(DeviceState *dev, Error **errp)
> > +{
> > +    AcpiGedState *s =3D ACPI_GED(dev);
> > +
> > +    assert(s->ged_base);
> > +    acpi_ged_init(get_system_memory(), dev, &s->ged_state);
>=20
> calling get_system_memory() from device code used to be a reason for
> rejecting patch,
> I'm not sure what suggest though.
>=20
> Maybe Paolo could suggest something.

How about using object_property_set_link()? Something like below.

------8-----
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.=
c
index f00b0ab14b..eb1ed38f4a 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -229,11 +229,12 @@ static void acpi_ged_device_realize(DeviceState *dev,=
 Error **errp)
     AcpiGedState *s =3D ACPI_GED(dev);
=20
     assert(s->ged_base);
-    acpi_ged_init(get_system_memory(), dev, &s->ged_state);
+    assert(s->sys_mem);
+    acpi_ged_init(s->sys_mem, dev, &s->ged_state);
=20
     if (s->memhp_state.is_enabled) {
         assert(s->memhp_base);
-        acpi_memory_hotplug_init(get_system_memory(), OBJECT(dev),
+        acpi_memory_hotplug_init(s->sys_mem, OBJECT(dev),
                                  &s->memhp_state,
                                  s->memhp_base);
     }
@@ -245,6 +246,8 @@ static Property acpi_ged_properties[] =3D {
      * because GED handles memory hotplug event and acpi-mem-hotplug
      * memory region gets initialized when GED device is realized.
      */
+    DEFINE_PROP_LINK("memory", AcpiGedState, sys_mem, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
     DEFINE_PROP_UINT64("memhp-base", AcpiGedState, memhp_base, 0),
     DEFINE_PROP_BOOL("memory-hotplug-support", AcpiGedState,
                      memhp_state.is_enabled, true),
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 73a758d9a9..0cbaf6c6e1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -529,8 +529,12 @@ static inline DeviceState *create_acpi_ged(VirtMachine=
State *vms, qemu_irq *pic)
     DeviceState *dev;
     int irq =3D vms->irqmap[VIRT_ACPI_GED];
     uint32_t event =3D ACPI_GED_MEM_HOTPLUG_EVT | ACPI_GED_PWR_DOWN_EVT;
+    MemoryRegion *sys_mem =3D get_system_memory();
=20
     dev =3D DEVICE(object_new(TYPE_ACPI_GED));
+
+    object_property_set_link(OBJECT(dev), OBJECT(sys_mem),
+                             "memory", &error_abort);
     qdev_prop_set_uint64(dev, "memhp-base",
                          vms->memmap[VIRT_PCDIMM_ACPI].base);
     qdev_prop_set_uint64(dev, "ged-base", vms->memmap[VIRT_ACPI_GED].base)=
;
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/gener=
ic_event_device.h
index 63104f1344..f1f2f337f7 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -89,6 +89,7 @@ typedef struct GEDState {
=20
 typedef struct AcpiGedState {
     DeviceClass parent_obj;
+    MemoryRegion *sys_mem;
     MemHotplugState memhp_state;
     hwaddr memhp_base;
     hwaddr ged_base;

---8----

