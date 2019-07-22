Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6949946wrv;
        Mon, 22 Jul 2019 07:13:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxo7KJH26XipTbvP61cVfXApG9hoaOOFSq8VvcE31xui1Xfuf+gBf99TF+CVZnc1auwl0JG
X-Received: by 2002:a05:620a:1661:: with SMTP id d1mr47784724qko.192.1563804809867;
        Mon, 22 Jul 2019 07:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563804809; cv=none;
        d=google.com; s=arc-20160816;
        b=QJ+RZawsYHGVkzkwcou1XVCkZbYzYlWOyp/Inv4YMmLd5rXR/w+9o8fyQcob3pxRk4
         ztue6C+roo/eSX+eo4Z2YNV+xJ5gLn/WiNWmhwKwE5O29WKDz4JbPIUgJZ7St88f4MtX
         MMWBNrTwiUaqHiMFMTrf4FxyitIKMPbHwHXd8IiPI35SYPdn7qytZ2eRHrkOWvJiCB3U
         B4179eNChN2Vu+q+auJOWXiXvq0gCVsbfU9+fPoxYOJlI2JlTCuMJ1iBtn19BPtEGuQY
         UM605UD66Bq0Lr3VmW3LKZdfnSvraRuVi+5hMxhiw6R+0SLAA20/aoVBDXVg8AamQ879
         0uDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=duQkXOxSbDSM9096M+GvI5W8jlsqj0nif0ihwu5FUFw=;
        b=eqD09bolSonmpOEz+t5P50ZEdmmfni3ek8MPVL8Bcn+hRhoAiqjnBE5E9QuVsdeY/N
         Cp5CEnziesc29GhMXu61eDk9Eqfb+IoxBj9AYAeRLv8plovrcXGFaFNRWRsmvKWCxi/n
         KtRRwpc/QhyUKTfN6V3ZZNIPiW6rk4eFvqSNLNKuvIVX5YgzWBcd4N11nUNDLpNPOzq+
         PMhitydg9mk7dypuVh+ZnRtxrvPFI8vCxok6ozV7a6xlmSsq2T+EIwTgdpcgeN86AQOj
         rG8DcwmoJKfpOabgPpW0TOXn1fgj/aNm/6CI+Vz8mxDR4kKvigEnSxlYopsQKI4PUdhn
         W3Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si23585556qtf.386.2019.07.22.07.13.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 07:13:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hpZ4D-0004RU-B8
	for alex.bennee@linaro.org; Mon, 22 Jul 2019 10:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34122)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hpZ49-0004R9-DH
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 10:13:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hpZ48-0004dh-17
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 10:13:25 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45425 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hpZ47-0004Xl-R8; Mon, 22 Jul 2019 10:13:23 -0400
Received: from LHREML712-CAH.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 0C88AC5C3CA369BF6A41;
 Mon, 22 Jul 2019 15:13:18 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.132]) by
 LHREML712-CAH.china.huawei.com ([10.201.108.35]) with mapi id 14.03.0415.000; 
 Mon, 22 Jul 2019 15:13:12 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH-for-4.2 v7 03/10] hw/acpi: Add ACPI
 Generic Event Device Support
Thread-Index: AQHVPKyeUuREoR+k9k210mjLR3EAGabQLoLQgAAQkgCABnX4kA==
Date: Mon, 22 Jul 2019 14:13:11 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83F310A58@lhreml524-mbs.china.huawei.com>
References: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
 <20190716153816.17676-4-shameerali.kolothum.thodi@huawei.com>
 <20190717163245.78880d55@redhat.com>
 <5FC3163CFD30C246ABAA99954A238FA83F30B621@lhreml524-mbs.china.huawei.com>
 <20190718143034.11ef7c12@redhat.com>
In-Reply-To: <20190718143034.11ef7c12@redhat.com>
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
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.2 v7 03/10] hw/acpi: Add
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
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ONthjPdlp7Ns



> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 18 July 2019 13:31
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: peter.maydell@linaro.org; sameo@linux.intel.com;
> shannon.zhaosl@gmail.com; ard.biesheuvel@linaro.org;
> qemu-devel@nongnu.org; xuwei (O) <xuwei5@huawei.com>; Linuxarm
> <linuxarm@huawei.com>; eric.auger@redhat.com; qemu-arm@nongnu.org;
> sebastien.boeuf@intel.com; lersek@redhat.com
> Subject: Re: [Qemu-devel] [PATCH-for-4.2 v7 03/10] hw/acpi: Add ACPI Gene=
ric
> Event Device Support
>=20
> On Thu, 18 Jul 2019 10:52:10 +0000
> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > Hi Igor,
> >
> > > -----Original Message-----
> > > From: Qemu-devel
> > >
> [mailto:qemu-devel-bounces+shameerali.kolothum.thodi=3Dhuawei.com@nongn
> > > u.org] On Behalf Of Igor Mammedov
> > > Sent: 17 July 2019 15:33
> > > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > > Cc: peter.maydell@linaro.org; sameo@linux.intel.com;
> > > shannon.zhaosl@gmail.com; ard.biesheuvel@linaro.org;
> > > qemu-devel@nongnu.org; xuwei (O) <xuwei5@huawei.com>; Linuxarm
> > > <linuxarm@huawei.com>; eric.auger@redhat.com;
> qemu-arm@nongnu.org;
> > > sebastien.boeuf@intel.com; lersek@redhat.com
> > > Subject: Re: [Qemu-devel] [PATCH-for-4.2 v7 03/10] hw/acpi: Add ACPI
> Generic
> > > Event Device Support
> > >
> > > On Tue, 16 Jul 2019 16:38:09 +0100
> > > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> >
> > [...]
> >
> > > > +static void acpi_ged_event(AcpiGedState *s, uint32_t sel)
> > > > +{
> > > > +    GEDState *ged_st =3D &s->ged_state;
> > > > +    /*
> > > > +     * Set the GED IRQ selector to the expected device type value.=
 This
> > > > +     * way, the ACPI method will be able to trigger the right code=
 based
> > > > +     * on a unique IRQ.
> > > comment isn't correct anymore, pls fix it
> >
> > True.
> >
> > >
> > > > +     */
> > > > +    qemu_mutex_lock(&ged_st->lock);
> > > Is this lock really necessary?
> > > (I thought that MMIO and monitor access is guarded by BQL)
> >
> > Hmm..I am not sure. This is to synchronize with the ged_st->sel update =
inside
> > ged_read(). And also acpi_ged_event() gets called through
> _power_down_notifier()
> > as well. BQL guard is in place for all the paths here?
> power down command originates from HMP or QMP monitor, so you don't
> really
> need a lock here.

Ok. I will get rid of it then.

> >
> > >
> > > > +    ged_st->sel |=3D sel;
> > > > +    qemu_mutex_unlock(&ged_st->lock);
> > > > +
> > > > +    /* Trigger the event by sending an interrupt to the guest. */
> > > > +    qemu_irq_pulse(s->irq);
> > > > +}
> > > > +
> > > > +static void acpi_ged_init(MemoryRegion *as, DeviceState *dev,
> GEDState
> > > *ged_st)
> > > > +{
> > > > +    AcpiGedState *s =3D ACPI_GED(dev);
> > > > +
> > > > +    assert(s->ged_base);
> > > > +
> > > > +    qemu_mutex_init(&ged_st->lock);
> > > > +    memory_region_init_io(&ged_st->io, OBJECT(dev), &ged_ops,
> ged_st,
> > > > +                          TYPE_ACPI_GED, ACPI_GED_REG_LEN);
> > > > +    memory_region_add_subregion(as, s->ged_base, &ged_st->io);
> > > > +    qdev_init_gpio_out_named(DEVICE(s), &s->irq, "ged-irq", 1);
> > > > +}
> > > > +
> > > > +static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
> > > > +                                    DeviceState *dev, Error
> **errp)
> > > > +{
> > > > +    AcpiGedState *s =3D ACPI_GED(hotplug_dev);
> > > > +
> > > > +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > > > +        if (s->memhp_state.is_enabled) {
> > > > +            acpi_memory_plug_cb(hotplug_dev, &s->memhp_state,
> dev,
> > > errp);
> > > > +        } else {
> > > > +            error_setg(errp,
> > > > +                 "memory hotplug is not
> > > enabled: %s.memory-hotplug-support "
> > > > +                 "is not set", object_get_typename(OBJECT(s)));
> > > > +        }
> > > > +    } else {
> > > > +        error_setg(errp, "virt: device plug request for unsupporte=
d
> > > device"
> > > > +                   " type: %s",
> object_get_typename(OBJECT(dev)));
> > > > +    }
> > > > +}
> > > > +
> > > > +static void acpi_ged_send_event(AcpiDeviceIf *adev,
> AcpiEventStatusBits
> > > ev)
> > > > +{
> > > > +    AcpiGedState *s =3D ACPI_GED(adev);
> > > > +    uint32_t sel;
> > > > +
> > > > +    if (ev & ACPI_MEMORY_HOTPLUG_STATUS) {
> > > > +        sel =3D ACPI_GED_MEM_HOTPLUG_EVT;
> > > > +    } else {
> > > > +        /* Unknown event. Return without generating interrupt. */
> > > > +        warn_report("GED: Unsupported event %d. No irq injected",
> ev);
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    /*
> > > > +     * We inject the hotplug interrupt. The IRQ selector will make
> > > > +     * the difference from the ACPI table.
> > > I don't get comment at all, pls rephrase/
> >
> > Ok. I think better to get rid of this comment here and update the one i=
n
> acpi_ged_event()
> > appropriately.
> >
> > >
> > > > +     */
> > > > +    acpi_ged_event(s, sel);
> > > it seems to used only once and only here, suggest to drop acpi_ged_ev=
ent()
> > > and move it's code here.
> >
> > But patch #10 makes use of it from acpi_ged_pm_powerdown_req().
> it looks like a valid shortcut but I'd make it follow AcpiInterface->send=
_event()
> path for consistency so only one call chain would exist.

Agree.=20

Thanks,
Shameer
=20

