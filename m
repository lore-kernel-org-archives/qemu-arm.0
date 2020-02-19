Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp703087lfp;
        Wed, 19 Feb 2020 09:29:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqx549XG0jhRDXcUB5VI0UM6x2HQQI/bZPxba89ZELjcQ5w+DM6Ma/H5Bx579c+TqRAftrmE
X-Received: by 2002:a37:6717:: with SMTP id b23mr25106905qkc.353.1582133347714;
        Wed, 19 Feb 2020 09:29:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582133347; cv=none;
        d=google.com; s=arc-20160816;
        b=hJR06M38a3JFJm5/q71zQjtY8MTd5GFDd8LP7gtz5TSC3u6DX3Bnjgwl1XA0hziG2Y
         euMNvf+TgyoRNNzAoZkWnbshcQv4Ws0OcQR5/mfDZ08a2+B/QHUut8ElZ4tDb7pia0bF
         pVrEuKxz8uc7WN6HI4hGfFZ34G+GCCrAcxWBMfX2fnNFpJiPYWW4cSjpXSnV6vst3Dqg
         wQ2yHgJm8N34IurVxVZSwqBHBPegw3qK1rty39qui99y5G7HGsp8h8Fq5N0rsTe2/NSi
         YSMPzam41598DFiyy2zNvmu7Ztejw92LOb2jurK08m9smLU3xpLqFqWHmI10EGIUNNrN
         DCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=rTG8ruVU7tabXZi8VGNaYjEx46GO6jNCKq6JXI/lN/E=;
        b=od3FcqfdlUOwavz4GKGc1IqAHlYTle8bNBohG5xG30ITfFSm9ystUZVYpJJq5g4e92
         Kwz2KpF92qSq0hTjFlteo36Ou/UZuNe125hmbdeBgCsc9JN1Fm+SKcWNu7JFQOyvd4MX
         RFKXhoFDLGEikFHp+keDI6QUv85nV08Xp9irvEhf4WgI/Br9IdtN/miBgUbpwQVB4VR1
         BcbD+3dPsjrnIcqprZw9T9Ee24MetH+G8QElhUMdMcUxjJ9TKd7ZF15nA+bTu36fXI1t
         WDXwWb4BE1XHn2q6cnp8+24mdGNwl0/Phh84u2WFmOS9OEzAlHcUrfdX0KrBaIVON8tx
         olCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RqLQxDQm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g68si48769qke.255.2020.02.19.09.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 09:29:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RqLQxDQm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4T9n-0002yv-4B
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 12:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49957)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j4T9b-0002ye-5x
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 12:28:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j4T9Z-0007oE-Al
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 12:28:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35019
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j4T9Z-0007n0-6l
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 12:28:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582133332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rTG8ruVU7tabXZi8VGNaYjEx46GO6jNCKq6JXI/lN/E=;
 b=RqLQxDQm9eb4xbbR10Z685snt68GW7ahYSMFWOmUkXrvqD9qFZXXfs5dHRqEKfxuVK3IWR
 5aNuij5rQrDm5vU84tItkDzou6P1I7usfYXqa8jpMkAACBDvZzLDAGpiDOMiX/PAgfUbcN
 C4J6dIi5867y1CcrSV6kMmkNz51HNd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-4PjexRUoOySKvT-O3p6BSw-1; Wed, 19 Feb 2020 12:28:50 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9E7BDB60;
 Wed, 19 Feb 2020 17:28:48 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E75CB5C13C;
 Wed, 19 Feb 2020 17:28:46 +0000 (UTC)
Date: Wed, 19 Feb 2020 18:28:45 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v2 07/13] hw/arm/bcm2836: QOM'ify more by adding
 class_init() to each SoC type
Message-ID: <20200219182845.4541db2e@redhat.com>
In-Reply-To: <effdb318-dff9-e861-7bc6-8db65f15ad00@redhat.com>
References: <20200217114533.17779-1-f4bug@amsat.org>
 <20200217114533.17779-8-f4bug@amsat.org>
 <20200218180426.008080b4@redhat.com>
 <effdb318-dff9-e861-7bc6-8db65f15ad00@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 4PjexRUoOySKvT-O3p6BSw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FWYFiMzNK8R3

On Tue, 18 Feb 2020 18:39:49 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 2/18/20 6:04 PM, Igor Mammedov wrote:
> > On Mon, 17 Feb 2020 12:45:27 +0100
> > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> >  =20
> >> Remove usage of TypeInfo::class_data. Instead fill the fields in
> >> the corresponding class_init().
> >>
> >> Cc: Igor Mammedov <imammedo@redhat.com>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> ---
> >>   hw/arm/bcm2836.c | 109 ++++++++++++++++++++++-----------------------=
--
> >>   1 file changed, 51 insertions(+), 58 deletions(-)
> >>
> >> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> >> index 24109fef1d..683d04d6ea 100644
> >> --- a/hw/arm/bcm2836.c
> >> +++ b/hw/arm/bcm2836.c
> >> @@ -16,57 +16,30 @@
> >>   #include "hw/arm/raspi_platform.h"
> >>   #include "hw/sysbus.h"
> >>  =20
> >> -typedef struct BCM283XInfo BCM283XInfo;
> >> -
> >>   typedef struct BCM283XClass {
> >>       /*< private >*/
> >>       DeviceClass parent_class;
> >>       /*< public >*/
> >> -    const BCM283XInfo *info;
> >> -} BCM283XClass;
> >> -
> >> -struct BCM283XInfo {
> >> -    const char *name; =20
> >  =20
> >>       const char *cpu_type; =20
> >=20
> > probably could be cleaned up by using machine->cpu_type/machine_class->=
default_cpu_type
> > (no need to change this patch as it's separate issue) =20
>=20
> Hmm the core_type is tied to the SoC, not to the machine. The machine=20
> only selects a SoC and gets the cpu cores that come with it. The problem=
=20
> is QEMU does not provide interface to select SoC from cmdline, only CPU.
>=20
> >=20
> >  =20
> >>       hwaddr peri_base; /* Peripheral base address seen by the CPU */
> >>       hwaddr ctrl_base; /* Interrupt controller and mailboxes etc. */
> >>       int clusterid;
> >> -};
> >> +} BCM283XClass;
> >>  =20
> >>   #define BCM283X_CLASS(klass) \
> >>       OBJECT_CLASS_CHECK(BCM283XClass, (klass), TYPE_BCM283X)
> >>   #define BCM283X_GET_CLASS(obj) \
> >>       OBJECT_GET_CLASS(BCM283XClass, (obj), TYPE_BCM283X)
> >>  =20
> >> -static const BCM283XInfo bcm283x_socs[] =3D {
> >> -    {
> >> -        .name =3D TYPE_BCM2836,
> >> -        .cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a7"),
> >> -        .peri_base =3D 0x3f000000,
> >> -        .ctrl_base =3D 0x40000000,
> >> -        .clusterid =3D 0xf,
> >> -    },
> >> -#ifdef TARGET_AARCH64
> >> -    {
> >> -        .name =3D TYPE_BCM2837,
> >> -        .cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a53"),
> >> -        .peri_base =3D 0x3f000000,
> >> -        .ctrl_base =3D 0x40000000,
> >> -        .clusterid =3D 0x0,
> >> -    },
> >> -#endif
> >> -};
> >> -
> >>   static void bcm2836_init(Object *obj)
> >>   {
> >>       BCM283XState *s =3D BCM283X(obj);
> >>       BCM283XClass *bc =3D BCM283X_GET_CLASS(obj);
> >> -    const BCM283XInfo *info =3D bc->info;
> >>       int n;
> >>  =20
> >>       for (n =3D 0; n < BCM283X_NCPUS; n++) {
> >>           object_initialize_child(obj, "cpu[*]", &s->cpu[n].core,
> >> -                                sizeof(s->cpu[n].core), info->cpu_typ=
e,
> >> +                                sizeof(s->cpu[n].core), bc->cpu_type,
> >>                                   &error_abort, NULL);
> >>       }
> >>  =20
> >> @@ -85,7 +58,6 @@ static void bcm2836_realize(DeviceState *dev, Error =
**errp)
> >>   {
> >>       BCM283XState *s =3D BCM283X(dev);
> >>       BCM283XClass *bc =3D BCM283X_GET_CLASS(dev);
> >> -    const BCM283XInfo *info =3D bc->info;
> >>       Object *obj;
> >>       Error *err =3D NULL;
> >>       int n;
> >> @@ -119,7 +91,7 @@ static void bcm2836_realize(DeviceState *dev, Error=
 **errp)
> >>       }
> >>  =20
> >>       sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->peripherals), 0,
> >> -                            info->peri_base, 1);
> >> +                            bc->peri_base, 1);
> >>  =20
> >>       /* bcm2836 interrupt controller (and mailboxes, etc.) */
> >>       object_property_set_bool(OBJECT(&s->control), true, "realized", =
&err);
> >> @@ -128,7 +100,7 @@ static void bcm2836_realize(DeviceState *dev, Erro=
r **errp)
> >>           return;
> >>       }
> >>  =20
> >> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->control), 0, info->ctrl_base);
> >> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->control), 0, bc->ctrl_base);
> >>  =20
> >>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 0,
> >>           qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-irq", 0));
> >> @@ -137,11 +109,11 @@ static void bcm2836_realize(DeviceState *dev, Er=
ror **errp)
> >>  =20
> >>       for (n =3D 0; n < BCM283X_NCPUS; n++) {
> >>           /* TODO: this should be converted to a property of ARM_CPU *=
/
> >> -        s->cpu[n].core.mp_affinity =3D (info->clusterid << 8) | n;
> >> +        s->cpu[n].core.mp_affinity =3D (bc->clusterid << 8) | n;
> >>  =20
> >>           /* set periphbase/CBAR value for CPU-local registers */
> >>           object_property_set_int(OBJECT(&s->cpu[n].core),
> >> -                                info->peri_base,
> >> +                                bc->peri_base,
> >>                                   "reset-cbar", &err);
> >>           if (err) {
> >>               error_propagate(errp, err);
> >> @@ -190,38 +162,59 @@ static Property bcm2836_props[] =3D {
> >>   static void bcm283x_class_init(ObjectClass *oc, void *data)
> >>   {
> >>       DeviceClass *dc =3D DEVICE_CLASS(oc);
> >> -    BCM283XClass *bc =3D BCM283X_CLASS(oc);
> >>  =20
> >> -    bc->info =3D data;
> >> -    dc->realize =3D bcm2836_realize;
> >> -    device_class_set_props(dc, bcm2836_props);
> >>       /* Reason: Must be wired up in code (see raspi_init() function) =
*/
> >>       dc->user_creatable =3D false;
> >>   }
> >>  =20
> >> -static const TypeInfo bcm283x_type_info =3D {
> >> -    .name =3D TYPE_BCM283X,
> >> -    .parent =3D TYPE_DEVICE,
> >> -    .instance_size =3D sizeof(BCM283XState),
> >> -    .instance_init =3D bcm2836_init,
> >> -    .class_size =3D sizeof(BCM283XClass),
> >> -    .abstract =3D true,
> >> +static void bcm2836_class_init(ObjectClass *oc, void *data)
> >> +{
> >> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> >> +    BCM283XClass *bc =3D BCM283X_CLASS(oc);
> >> +
> >> +    bc->cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a7");
> >> +    bc->peri_base =3D 0x3f000000;
> >> +    bc->ctrl_base =3D 0x40000000;
> >> +    bc->clusterid =3D 0xf;
> >> +    dc->realize =3D bcm2836_realize;
> >> +    device_class_set_props(dc, bcm2836_props);
> >>   };
> >>  =20
> >> -static void bcm2836_register_types(void)
> >> +#ifdef TARGET_AARCH64
> >> +static void bcm2837_class_init(ObjectClass *oc, void *data)
> >>   {
> >> -    int i;
> >> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> >> +    BCM283XClass *bc =3D BCM283X_CLASS(oc);
> >>  =20
> >> -    type_register_static(&bcm283x_type_info);
> >> -    for (i =3D 0; i < ARRAY_SIZE(bcm283x_socs); i++) {
> >> -        TypeInfo ti =3D {
> >> -            .name =3D bcm283x_socs[i].name,
> >> -            .parent =3D TYPE_BCM283X,
> >> -            .class_init =3D bcm283x_class_init,
> >> -            .class_data =3D (void *) &bcm283x_socs[i],
> >> -        };
> >> -        type_register(&ti);
> >> +    bc->cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a53");
> >> +    bc->peri_base =3D 0x3f000000;
> >> +    bc->ctrl_base =3D 0x40000000;
> >> +    bc->clusterid =3D 0x0;
> >> +    dc->realize =3D bcm2836_realize;
> >> +    device_class_set_props(dc, bcm2836_props); =20
> > both children do use the same values for almost all fields.
> > I'd set in children class_init()s only cpu_type/clusterid
> > and keep common bits in base class. =20
>=20
> Yes so far, but then the BCM2711/BCM2838 for raspi4 changes all fields.

I this case, maybe add this as justification to commit message.

With that change
  Reviewed-by: Igor Mammedov <imammedo@redhat.com>

>=20
> >  =20
> >> +};
> >> +#endif
> >> +
> >> +static const TypeInfo bcm283x_types[] =3D {
> >> +    {
> >> +        .name           =3D TYPE_BCM2836,
> >> +        .parent         =3D TYPE_BCM283X,
> >> +        .class_init     =3D bcm2836_class_init,
> >> +#ifdef TARGET_AARCH64
> >> +    }, {
> >> +        .name           =3D TYPE_BCM2837,
> >> +        .parent         =3D TYPE_BCM283X,
> >> +        .class_init     =3D bcm2837_class_init,
> >> +#endif
> >> +    }, {
> >> +        .name           =3D TYPE_BCM283X,
> >> +        .parent         =3D TYPE_DEVICE,
> >> +        .instance_size  =3D sizeof(BCM283XState),
> >> +        .instance_init  =3D bcm2836_init,
> >> +        .class_size     =3D sizeof(BCM283XClass),
> >> +        .class_init     =3D bcm283x_class_init,
> >> +        .abstract       =3D true,
> >>       }
> >> -}
> >> +};
> >>  =20
> >> -type_init(bcm2836_register_types)
> >> +DEFINE_TYPES(bcm283x_types) =20
> >  =20
>=20

