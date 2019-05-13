Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2706214wrg;
        Mon, 13 May 2019 04:54:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwdnvvqXSCWJ+XQoIpSAi54dw9kMnAfBOZA60yu98UnhsiY2V6Xr0DduEDFkE1A62cUgXwv
X-Received: by 2002:a17:906:4cd6:: with SMTP id q22mr21989522ejt.14.1557748446380;
        Mon, 13 May 2019 04:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557748446; cv=none;
        d=google.com; s=arc-20160816;
        b=gPzCg9cLTZdxqygKzGJkz4vwXj6vXI7Fw1FlywyhnRoxhMaIvc3RoBYUW0za4f9Pzv
         aBRVAuBO2klbdriBZ878qTRF6dwsIew+GmTnTT3/kTTNt6kNLxRwozKKCIQJXOveln4N
         gkJLZVtA+F0mXNAy+BxDmxMFe34RYlTUJtCZ3CvPE2XOt2b0+zQtNffl4VkkBGkzNdck
         STZHQz8yD3gGQEAdO1D1R5WHFN4ozu+eyC6aHhx9rZfJubSdbdodUO+5gF61ohN7NOrG
         x2tMtjCvlRNg0S6XAUonn5KgbXUU3rV0BXNxFMSmKcPVpF9vv2gcVjPnoPUlRe08H6k3
         ICTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :references:message-id:date:thread-index:thread-topic:to:from;
        bh=+dlG16od3GRQDHEYmYX0oAlj6Qdiw46MamUWZtnLJT0=;
        b=gEIzml+EvOl9I5ibFtcbIezm7mMpTmLrzTnE7aJUZ4zGdhsQ4DAIdbBdCI4demPcbT
         qlHzGXrwM9Ci+mthKzLg1AFF9IP3eKbQA+5Y48rWMMumA/iazedvpgkj/b3R7uuO0xL5
         uVKRP5t8bsbym2XBd8D6cLm+7/kldk1lYPh1gvH4vuZo/jdcwfG/c7LuHDPsKUM6cu3+
         c6U4Y8odRU7EBQzMVe3BqGw2jiICfdzRj9ykimqubYkYVqf3SsueQcZAsDieV/O/49iU
         LxVioRoG3aZ8e0AWctREEBd55mhjqh8r++p2JwI3O+lMIan+XQf7TxG+fecalSgFZ9nV
         7Keg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f34si9162631edf.38.2019.05.13.04.54.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 May 2019 04:54:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:55621 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQ9Wv-0000lo-Em
	for alex.bennee@linaro.org; Mon, 13 May 2019 07:54:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hQ9Wm-0000l5-Tb
	for qemu-arm@nongnu.org; Mon, 13 May 2019 07:53:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hQ9Wl-0007VR-IX
	for qemu-arm@nongnu.org; Mon, 13 May 2019 07:53:56 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45404 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hQ9Wl-0007Rh-CO; Mon, 13 May 2019 07:53:55 -0400
Received: from lhreml702-cah.china.huawei.com (unknown [172.18.7.108])
	by Forcepoint Email with ESMTP id F2AF5D19BB61ED46F936;
	Mon, 13 May 2019 12:53:47 +0100 (IST)
Received: from LHREML524-MBB.china.huawei.com ([169.254.3.57]) by
	lhreml702-cah.china.huawei.com ([10.201.108.43]) with mapi id
	14.03.0415.000; Mon, 13 May 2019 12:53:39 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [PATCH v4 3/8] hw/acpi: Add ACPI Generic Event Device Support
Thread-Index: AQHU7r9fDZwDNe9r+EiYOfOuYN+yBqZYFYcAgAFHvsCAD8XcEA==
Date: Mon, 13 May 2019 11:53:38 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83F1EF349@lhreml524-mbb.china.huawei.com>
References: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
	<20190409102935.28292-4-shameerali.kolothum.thodi@huawei.com>
	<20190502181252.2e3ae0d4@Igors-MacBook-Pro> 
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
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
	"lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bT+1pG37bpBt

Hi Igor,

> -----Original Message-----
> From: Shameerali Kolothum Thodi
> Sent: 03 May 2019 13:46
> To: 'Igor Mammedov' <imammedo@redhat.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org;
> shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> sebastien.boeuf@intel.com; xuwei (O) <xuwei5@huawei.com>;
> lersek@redhat.com; ard.biesheuvel@linaro.org; Linuxarm
> <linuxarm@huawei.com>
> Subject: RE: [PATCH v4 3/8] hw/acpi: Add ACPI Generic Event Device Suppor=
t
>=20
> Hi Igor,
>=20
> > -----Original Message-----
> > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > Sent: 02 May 2019 17:13
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> > eric.auger@redhat.com; peter.maydell@linaro.org;
> > shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> > sebastien.boeuf@intel.com; xuwei (O) <xuwei5@huawei.com>;
> > lersek@redhat.com; ard.biesheuvel@linaro.org; Linuxarm
> > <linuxarm@huawei.com>
> > Subject: Re: [PATCH v4 3/8] hw/acpi: Add ACPI Generic Event Device Supp=
ort
> >

[...]

> > > +}
> > > +
> > > +static Property acpi_ged_properties[] =3D {
> > > +    /*
> > > +     * Memory hotplug base address is a property of GED here,
> > > +     * because GED handles memory hotplug event and
> > MEMORY_HOTPLUG_DEVICE
> > > +     * gets initialized when GED device is realized.
> > > +     */
> > > +    DEFINE_PROP_UINT64("memhp-base", AcpiGedState, memhp_base,
> > 0),
> > > +    DEFINE_PROP_BOOL("memory-hotplug-support", AcpiGedState,
> > > +                     memhp_state.is_enabled, true),
> > > +    DEFINE_PROP_PTR("gsi", AcpiGedState, gsi),
> >
> > PTR shouldn't be used in new code, look at object_property_add_link() &=
 co
>=20
> Ok. I will take a look at that.

I attempted to remove _PROP_PTR for "ged-events" and use _PROP_LINK and
_set_link(),


diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.=
c
index 856ca04c01..978c8e088e 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -268,7 +268,8 @@ static Property acpi_ged_properties[] =3D {
     DEFINE_PROP_PTR("gsi", AcpiGedState, gsi),
     DEFINE_PROP_UINT64("ged-base", AcpiGedState, ged_base, 0),
     DEFINE_PROP_UINT32("ged-irq", AcpiGedState, ged_irq, 0),
-    DEFINE_PROP_PTR("ged-events", AcpiGedState, ged_events),
+    DEFINE_PROP_LINK("ged-events", AcpiGedState, ged_events, TYPE_ACPI_GED=
,
+                     GedEvent *),
     DEFINE_PROP_UINT32("ged-events-size", AcpiGedState, ged_events_size, 0=
),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8179b3e511..c89b7b7120 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -537,7 +537,8 @@ static inline DeviceState *create_acpi_ged(VirtMachineS=
tate *vms)
     qdev_prop_set_ptr(dev, "gsi", vms->gsi);
     qdev_prop_set_uint64(dev, "ged-base", vms->memmap[VIRT_ACPI_GED].base)=
;
     qdev_prop_set_uint32(dev, "ged-irq", vms->irqmap[VIRT_ACPI_GED]);
-    qdev_prop_set_ptr(dev, "ged-events", ged_events);
+    object_property_set_link(OBJECT(dev), OBJECT(ged_events), "ged-events"=
,
+                             &error_abort);
     qdev_prop_set_uint32(dev, "ged-events-size", ARRAY_SIZE(ged_events));
=20
     object_property_add_child(qdev_get_machine(), "acpi-ged",
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/gener=
ic_event_device.h
index 9c840d8064..588f4ecfba 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -111,7 +111,7 @@ typedef struct AcpiGedState {
     hwaddr ged_base;
     GEDState ged_state;
     uint32_t ged_irq;
-    void *ged_events;
+    GedEvent *ged_events;
     uint32_t ged_events_size;
 } AcpiGedState;


And with this I get,

Segmentation fault      (core dumped) ./qemu-system-aarch64-ged-v5
-machine virt, -cpu cortex-a57 -machine type=3Dvirt -nographic -smp 1 -m
4G,maxmem=3D8G,slots=3D10 -drive if=3Dnone,file=3Dubuntu-est-5.0,id=3Dfs -d=
evice
virtio-blk-device,drive=3Dfs -kernel Image_memhp_remove -bios
QEMU_EFI_Release.fd -object memory-backend-ram,id=3Dmem1,size=3D1G -device
pc-dimm,id=3Ddimm1,memdev=3Dmem1 -numa node,nodeid=3D0 -append
"console=3DttyAMA0 root=3D/dev/vda rw acpi=3Dforce movable_node"

It looks like struct pointer cannot be used directly and has to make a QOM =
object
for DEFINE_PROP_LINK use. Not sure there is an easy way for setting ptr pro=
perty
using link() functions. Please let me know if there any reference implement=
ation I
can take a look.

Appreciate your help,

Thanks,
Shameer

