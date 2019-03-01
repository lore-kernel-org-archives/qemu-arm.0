Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp479689wrx;
        Fri, 1 Mar 2019 02:52:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqwyxPgKduxB3oT4YYJUPzBMl3nEsah/40knPTt0CziOWIVwIa1JdHjxDAwgk0TQb4dSSv6k
X-Received: by 2002:a0d:d58d:: with SMTP id x135mr2993285ywd.488.1551437531272;
        Fri, 01 Mar 2019 02:52:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551437531; cv=none;
        d=google.com; s=arc-20160816;
        b=zAoRkjVZhYvTt9l7em6VGCR4CoELS+hGQBLttVUIPYTbPQTa8X8xPf3jXfhHbD9PK6
         Ejhym7Xy2oZL93iTzDmP5bIpKvEqGCU74+kaaeUcUypZOwgGx8eQscQljBPgB4Ctao6e
         LOfh6yXwbZBsSsbA9mUDGfyikdWb3ce859AgsB4WpKxS38otpvHJwqNNfZT58cL6n9fB
         Bdh6k1qNOlxtSkjwAUo7CzNilpFnOy50jwtXLDf6PFUNL1mhg6t0ZHaFfY8Hs6UBsJ6U
         kl2l3lk7qRd4HswHaiGTOm++rwtz3RkJSnoKk92foXQeXWjoNKj92MtYl2ylkmQzI3PL
         tq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=zzO/GJvqqmPomrQkdP9gu5UtIoCoB8jv6mrDpQeUoT8=;
        b=Ilb0DmVhYSyDfLU3CVFyT7jObsqn52KIp+xYsdzEQshYsKi3qKt09ziEjVjfnSpyhO
         bCnbtVpTH0860PbShtDycX6ArBgByjOBStYvC1JQYQrLI0zp5wXzn5BiRX1D7oKKY20N
         kqerPiw3gvYABfWMHBN7BfVnVcp5iTl6mMI3YM5CPB84PPd6BdZ2Q1jSK2mtwrpxZYpo
         +7hX0kC6u4Lzd6CN7Qf350YZKGK8mC/DbbbhWLlEYhHPfIKsB0/2GsLwmUNGPsz0JNcW
         grOLaFnMnVCvL4PWa8UGI58leG04vZpM5ldIazHfPChK8npKv6f55b+npgFmcZSua2gf
         SBtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i65si11958431ywb.93.2019.03.01.02.52.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 02:52:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:35463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzfly-0004uE-Q1
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 05:52:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1gzflo-0004tv-U9
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 05:52:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1gzfln-0003iV-4a
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 05:52:00 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:45357 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1gzfll-0003g5-A1; Fri, 01 Mar 2019 05:51:59 -0500
Received: from lhreml703-cah.china.huawei.com (unknown [172.18.7.108])
	by Forcepoint Email with ESMTP id F1E149B41B2835AEC8D3;
	Fri,  1 Mar 2019 10:51:52 +0000 (GMT)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.86]) by
	lhreml703-cah.china.huawei.com ([10.201.108.44]) with mapi id
	14.03.0415.000; Fri, 1 Mar 2019 10:51:46 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [Qemu-devel] [RFC PATCH 3/4] hw/arm/virt: Enable pc-dimm
	hotplug support
Thread-Index: AQHUtvmeJaNhj0uHk0+mYkkIoLsoD6X2r7gAgAACDyCAABLDgIAAAgkAgAAAg4A=
Date: Fri, 1 Mar 2019 10:51:45 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8392D8366@lhreml524-mbs.china.huawei.com>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
	<20190128110545.20644-4-shameerali.kolothum.thodi@huawei.com>
	<20190301101204.361adfb6@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8392D81D6@lhreml524-mbs.china.huawei.com>
	<20190301112635.40200742@redhat.com>
	<20190301113352.585d54f3@redhat.com>
In-Reply-To: <20190301113352.585d54f3@redhat.com>
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
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 3/4] hw/arm/virt: Enable
 pc-dimm hotplug support
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
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	Linuxarm <linuxarm@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T/n/e3nuZ5Xv



> -----Original Message-----
> From: Qemu-devel
> [mailto:qemu-devel-bounces+shameerali.kolothum.thodi=3Dhuawei.com@nongn
> u.org] On Behalf Of Igor Mammedov
> Sent: 01 March 2019 10:34
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: peter.maydell@linaro.org; shannon.zhaosl@gmail.com;
> qemu-devel@nongnu.org; Linuxarm <linuxarm@huawei.com>;
> eric.auger@redhat.com; qemu-arm@nongnu.org; xuwei (O)
> <xuwei5@huawei.com>
> Subject: Re: [Qemu-devel] [RFC PATCH 3/4] hw/arm/virt: Enable pc-dimm
> hotplug support
>=20
> On Fri, 1 Mar 2019 11:26:35 +0100
> Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> > On Fri, 1 Mar 2019 09:23:11 +0000
> > Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> wrote:
> >
> > > > -----Original Message-----
> > > > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > > > Sent: 01 March 2019 09:12
> > > > To: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>
> > > > Cc: eric.auger@redhat.com; shannon.zhaosl@gmail.com;
> > > > peter.maydell@linaro.org; qemu-devel@nongnu.org;
> qemu-arm@nongnu.org;
> > > > Linuxarm <linuxarm@huawei.com>; xuwei (O) <xuwei5@huawei.com>
> > > > Subject: Re: [Qemu-devel] [RFC PATCH 3/4] hw/arm/virt: Enable pc-di=
mm
> > > > hotplug support
> > > >
> > > > On Mon, 28 Jan 2019 11:05:45 +0000
> > > > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> > > >
> > > > > pc-dimm memory hotplug is enabled using GPIO(Pin 2) based ACPI
> > > > > event. Hot removal functionality is not yet supported.
> > > > >
> > > > > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> > > > > ---
> > > > >  hw/arm/virt.c | 57
> > > > +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
> > > > >  1 file changed, 55 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > > > index 884960d..cf64554 100644
> > > > > --- a/hw/arm/virt.c
> > > > > +++ b/hw/arm/virt.c
> > > > > @@ -62,6 +62,7 @@
> > > > >  #include "hw/mem/pc-dimm.h"
> > > > >  #include "hw/mem/nvdimm.h"
> > > > >  #include "hw/acpi/acpi.h"
> > > > > +#include "hw/acpi/pc-hotplug.h"
> > > > it looks like x86 specific file, what is this here for?
> > >
> > > Yes. That is for ACPI_MEMORY_HOTPLUG_BASE which is only used by x86
> > > at the moment. I guess, it can be moved to hw/acpi/memory_hotplug.h ?
> > it's GPA and pc/q35 impl. specific so you should use it,
> s/should/should not/
>=20
> > this address will always be board specific one.
> > Makeup a virt specific one

Ok. I was under the impression that the offsets can be reused as it is defi=
ned
here docs/specs/acpi_mem_hotplug.txt(though that is GPE and pc/q35 acpi dev=
=20
specific). But agree, it doesn't make sense to make it generic.

> > >
> > > > >
> > > > >  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
> > > > >      static void virt_##major##_##minor##_class_init(ObjectClass =
*oc,
> \
> > > > > @@ -1651,7 +1652,14 @@ static void machvirt_init(MachineState
> > > > *machine)
> > > > >          nvdimm_init_acpi_state(acpi_nvdimm_state, sysmem,
> > > > >                                 vms->fw_cfg, OBJECT(vms));
> > > > >      }
> > > > > +    if (vms->acpi_memhp_state.is_enabled) {
> > > > > +        MemHotplugState *state =3D  &vms->acpi_memhp_state;
> > > > > +        hwaddr base;
> > > > >
> > > > > +        state->hw_reduced_acpi =3D true;
> > > > > +        base =3D vms->memmap[VIRT_ACPI_IO].base +
> > > > ACPI_MEMORY_HOTPLUG_BASE;
> > well, this is confusing, why adding 2 base addresses?
> > If vms->memmap[VIRT_ACPI_IO].base is already set than why not use it
> > as is without adding an offset?

Well, Eric's work on which this was based had one NVDIMM_ACPI_IO_BASE offse=
t
from what appears to be a generic VIRT_ACPI_IO region. Now I see that, it i=
s
renamed to VIRT_NVDIMM_ACPI_IO. Do we really need two separate regions?

Thanks,
Shameer

> >
> > > > > +        acpi_memory_hotplug_init(sysmem, OBJECT(vms), state,
> base);
> > > > > +    }
> > > > >      vms->bootinfo.ram_size =3D machine->ram_size;
> > > > >      vms->bootinfo.kernel_filename =3D machine->kernel_filename;
> > > > >      vms->bootinfo.kernel_cmdline =3D machine->kernel_cmdline;
> > > > [...]
> >
> >
>=20

