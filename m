Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp519344wrh;
        Fri, 3 May 2019 05:48:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz12TFDTxs8A9D9b8znIc/me7TKfm4QXGH+mcSucRbYYKr6uoDUHGYpfj+BTeGYx/He0K1d
X-Received: by 2002:a1c:f117:: with SMTP id p23mr1258553wmh.123.1556887699770;
        Fri, 03 May 2019 05:48:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556887699; cv=none;
        d=google.com; s=arc-20160816;
        b=p0TdqhSSggQMOotbvg4XGOOAELZSy4ai2afruXXY9c9j1h4b9A6hLHiGA7NFxRoN5H
         rZFKIUNXOuLFlJNPWgTOmtsmYK83OvsAogPE37bvCdYOdXnaVp2lIGcoC6xEEBseNH3l
         OSbgXg3c6JDhO/Az/L+xpHP2ThmwDMGvlwgcy6euhtv7cp3cd3mF1UFzKP8xKJqWy0ps
         VvZ0aI3nisXIluyXa0Kq5/YWAiCzTMhS/QnFl1KAez9Ktx8jJx2OA8cGloqCstusV/aO
         YJsEmL96urK70f+psc5KCSzJXJ6RGkWzowc9PDI1FK82JuvM5JsiOUech13U9NwAVD2w
         psRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=TUAY2DK8mMAC4COXRTfixlyGZgxu5KurW+13fhWJEno=;
        b=EJMrqG2WEO9jhxXFXSK+9roVX07GzM1PrkOGVBnN79MdoPnuvi88x9uvXowEd8U7Js
         9OS8MiD7wx7BJ221+usX/Kh+VfWSiVm6hzkCO0Xw+UZNDxxbV5gp9fziKKZvcwaav2ou
         O2tVofQN4Lapw7/HJHCs7R9PsFZ2xcXSuErP5AqQzfYhrbYB0dfs3lU1giUQbY7ajlZX
         OYseh6VuYowHf1/3ubZwcIJW2UU07bXkSs/e3DKWqSQu0WzHzh5TpWWKJG9n6ye3F7Gi
         hQ8aQQosjpIF3b9+c/FtH2877YAW+NRpRUExo7QRkGFNro8bDE/acpP4ZP/v3e/hyK1R
         HdKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z142si1309978wmc.9.2019.05.03.05.48.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 05:48:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40263 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMXbu-00074q-RI
	for alex.bennee@linaro.org; Fri, 03 May 2019 08:48:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hMXbc-00073K-NC
	for qemu-arm@nongnu.org; Fri, 03 May 2019 08:48:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hMXbb-0006xB-8v
	for qemu-arm@nongnu.org; Fri, 03 May 2019 08:48:00 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45397 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hMXba-0006wj-Vq; Fri, 03 May 2019 08:47:59 -0400
Received: from lhreml704-cah.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id 638FEAC295BB53F9F1BE;
	Fri,  3 May 2019 13:47:57 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.137]) by
	lhreml704-cah.china.huawei.com ([10.201.108.45]) with mapi id
	14.03.0415.000; Fri, 3 May 2019 13:47:51 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [PATCH v4 4/8] hw/arm/virt: Add memory hotplug framework
Thread-Index: AQHU7r9hpSQT1rMAlkOED/ex743ihqZYF2CAgAFnhfA=
Date: Fri, 3 May 2019 12:47:50 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83F1B09C7@lhreml524-mbs.china.huawei.com>
References: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
	<20190409102935.28292-5-shameerali.kolothum.thodi@huawei.com>
	<20190502181929.0bad1fb5@Igors-MacBook-Pro>
In-Reply-To: <20190502181929.0bad1fb5@Igors-MacBook-Pro>
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
Subject: Re: [Qemu-arm] [PATCH v4 4/8] hw/arm/virt: Add memory hotplug
 framework
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
X-TUID: yaNO3BU/5nL5



> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 02 May 2019 17:19
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org;
> shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> sebastien.boeuf@intel.com; xuwei (O) <xuwei5@huawei.com>;
> lersek@redhat.com; ard.biesheuvel@linaro.org; Linuxarm
> <linuxarm@huawei.com>
> Subject: Re: [PATCH v4 4/8] hw/arm/virt: Add memory hotplug framework
>=20
> On Tue, 9 Apr 2019 11:29:31 +0100
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > From: Eric Auger <eric.auger@redhat.com>
> >
> > This patch adds the memory hot-plug/hot-unplug infrastructure
> > in machvirt. The device memory is not yet exposed to the Guest
> > either though DT or ACPI and hence both cold/hot plug of memory
> s/though/through/

Sure.

> > is explicitly disabled for now.
> >
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  default-configs/arm-softmmu.mak |  3 +++
> >  hw/arm/virt.c                   | 45
> ++++++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 47 insertions(+), 1 deletion(-)
> >
> > diff --git a/default-configs/arm-softmmu.mak
> b/default-configs/arm-softmmu.mak
> > index 613d19a..9f4b803 100644
> > --- a/default-configs/arm-softmmu.mak
> > +++ b/default-configs/arm-softmmu.mak
> > @@ -160,3 +160,6 @@ CONFIG_MUSICPAL=3Dy
> >
> >  # for realview and versatilepb
> >  CONFIG_LSI_SCSI_PCI=3Dy
> > +
> > +CONFIG_MEM_DEVICE=3Dy
> > +CONFIG_DIMM=3Dy
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index ce2664a..da516b3 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -61,6 +61,8 @@
> >  #include "hw/arm/smmuv3.h"
> >  #include "hw/acpi/acpi.h"
> >  #include "target/arm/internals.h"
> > +#include "hw/mem/pc-dimm.h"
> > +#include "hw/mem/nvdimm.h"
> >
> >  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
> >      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> > @@ -1806,6 +1808,34 @@ static const CPUArchIdList
> *virt_possible_cpu_arch_ids(MachineState *ms)
> >      return ms->possible_cpus;
> >  }
> >
> > +static void virt_memory_pre_plug(HotplugHandler *hotplug_dev,
> DeviceState *dev,
> > +                                 Error **errp)
> > +{
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > +        error_setg(errp, "memory cold/hot plug is not yet supported");
> > +        return;
> > +    }
> add comment here why it's needed.

Ok.

>=20
> > +
> > +    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL,
> errp);
> maybe before calling this there probably should be check if acpi is enabl=
ed.
>=20
> not sure if arm/virt board honors -no-acpi CLI option.

Ok. I will check this

Thanks,
Shameer
=20
> > +}
> > +
> > +static void virt_memory_plug(HotplugHandler *hotplug_dev,
> > +                             DeviceState *dev, Error **errp)
> > +{
> > +    VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
> > +
> > +    pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), NULL);
> > +
> > +}
> > +
> > +static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_de=
v,
> > +                                            DeviceState *dev,
> Error **errp)
> > +{
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > +        virt_memory_pre_plug(hotplug_dev, dev, errp);
> > +    }
> > +}
> > +
> >  static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
> >                                          DeviceState *dev, Error
> **errp)
> >  {
> > @@ -1817,12 +1847,23 @@ static void
> virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
> >                                       SYS_BUS_DEVICE(dev));
> >          }
> >      }
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > +        virt_memory_plug(hotplug_dev, dev, errp);
> > +    }
> > +}
> > +
> > +static void virt_machine_device_unplug_request_cb(HotplugHandler
> *hotplug_dev,
> > +                                          DeviceState *dev, Error
> **errp)
> > +{
> > +    error_setg(errp, "device unplug request for unsupported device"
> > +               " type: %s", object_get_typename(OBJECT(dev)));
> >  }
> >
> >  static HotplugHandler *virt_machine_get_hotplug_handler(MachineState
> *machine,
> >
> DeviceState *dev)
> >  {
> > -    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE) ||
> > +       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
> >          return HOTPLUG_HANDLER(machine);
> >      }
> >
> > @@ -1886,7 +1927,9 @@ static void virt_machine_class_init(ObjectClass
> *oc, void *data)
> >      mc->kvm_type =3D virt_kvm_type;
> >      assert(!mc->get_hotplug_handler);
> >      mc->get_hotplug_handler =3D virt_machine_get_hotplug_handler;
> > +    hc->pre_plug =3D virt_machine_device_pre_plug_cb;
> >      hc->plug =3D virt_machine_device_plug_cb;
> > +    hc->unplug_request =3D virt_machine_device_unplug_request_cb;
> >  }
> >
> >  static void virt_instance_init(Object *obj)

