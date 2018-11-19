Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp995559wrt;
        Mon, 19 Nov 2018 07:38:26 -0800 (PST)
X-Google-Smtp-Source: AJdET5eE/Pk/aLaaAEytZFgwZOZ0kKMfhzDTjyo7TN7d7ssEipXkIUTJyb49MbjVljD5aee0wmXH
X-Received: by 2002:a81:7744:: with SMTP id s65-v6mr21592840ywc.149.1542641906150;
        Mon, 19 Nov 2018 07:38:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542641906; cv=none;
        d=google.com; s=arc-20160816;
        b=nXAuR14/qJGxEKMbyP7djelQ4eqAyJhsSeRYut+DWaHvNJJYapHxVm9OwMywpcbRR6
         wPtD89Q3uXERXLc1v6mjbOg/3Wr11nJYtow8iprTEJa8heZsPHIZCbRX7jN3rsX/KKk2
         kU1A/jkqguG6W7uUKnihsmmV0Wjf5NLCi2EG7U6InXeGMOv26TUlrNKjOliZSZ0kIli/
         HQBksYQqT9/bVFAONf3HbflGABRXiYCMa5mxsUwW8m/eNdoaYma58kUmIgpfpLT6+ScB
         dNi0CmY5bg20UuoOriB+VmDDxN6qPVXIUIgSYE44GoLCTRZ2Dk9ROYBg9VNKOxcoKGWA
         3NSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=OlxrFcpl+nh2MXAe6SlHrGXzuz9VWpe5fB/Ds01jktY=;
        b=K9L7S0QSmgAmqYv2UFYqKG2hRUnFd5KTyw5SlRMdBIjVUETj265QauoyANabdydLqE
         M8zvH1JDHQFLB9e1u+ESi8Y+eWOj4spf/olvqdas2NetxcYJ1bdGMer+q/ccdh5lXBWE
         ZORSV1mYOfz7eGUyVEyUQkOSz3uCzxywcsgvo5XNHkJnJzNofvAifO+vc1ZZnW+PX5xP
         L2oJKpSpkhu16SkVyevVrzp/W+C6n6yNm7nK+JFDifv5DYDRD0kXcO6eneOFSkC+cyjC
         UqRgE2mRaQ21SKjQ9T/7UJkkMHALT84Nh2vvXH3bjH0whlQj2qV1ob1Qmuual3HwkrKl
         9j5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u59-v6si6466858ybi.496.2018.11.19.07.38.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Nov 2018 07:38:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57265 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gOld3-0007OB-KT
	for alex.bennee@linaro.org; Mon, 19 Nov 2018 10:38:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gOlcp-0007O5-0K
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 10:38:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gOlck-0001WZ-4u
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 10:38:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54502)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gOlcj-0001PL-Bi; Mon, 19 Nov 2018 10:38:05 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 71C5E30023B8;
	Mon, 19 Nov 2018 15:38:04 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B15F86012D;
	Mon, 19 Nov 2018 15:37:58 +0000 (UTC)
Date: Mon, 19 Nov 2018 16:37:57 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Boeuf, Sebastien" <sebastien.boeuf@intel.com>
Message-ID: <20181119163757.3c975f62@redhat.com>
In-Reply-To: <1542397323.18399.3.camel@intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-20-sameo@linux.intel.com>
	<20181116103909.64f35d5d@redhat.com>
	<1542397323.18399.3.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 19 Nov 2018 15:38:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 19/24] hw: acpi: Retrieve the PCI bus from
 AcpiPciHpState
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
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"jing2.liu@linux.intel.com" <jing2.liu@linux.intel.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"anthony.perard@citrix.com" <anthony.perard@citrix.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"rth@twiddle.net" <rth@twiddle.net>,
	"ehabkost@redhat.com" <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p5gLh84lCSvO

On Fri, 16 Nov 2018 19:42:08 +0000
"Boeuf, Sebastien" <sebastien.boeuf@intel.com> wrote:

> Hi Igor,
>=20
> On Fri, 2018-11-16 at 10:39 +0100, Igor Mammedov wrote:
> > On Mon,=C2=A0=C2=A05 Nov 2018 02:40:42 +0100
> > Samuel Ortiz <sameo@linux.intel.com> wrote:
> >  =20
> > >=20
> > > From: Sebastien Boeuf <sebastien.boeuf@intel.com>
> > >=20
> > > Instead of using the machine type specific method find_i440fx() to
> > > retrieve the PCI bus, this commit aims to rely on the fact that the
> > > PCI bus is known by the structure AcpiPciHpState.
> > >=20
> > > When the structure is initialized through acpi_pcihp_init() call,
> > > it saves the PCI bus, which means there is no need to invoke a
> > > special function later on.
> > >=20
> > > Based on the fact that find_i440fx() was only used there, this
> > > patch also removes the function find_i440fx() itself from the
> > > entire codebase.
> > >=20
> > > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > > Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > > Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
> > > Signed-off-by: Jing Liu <jing2.liu@linux.intel.com> =20
> > Thanks for cleaning it up
> >=20
> > minor nit:
> > Taking in account that you're removing '/* TODO: Q35 support */'
> > comment along with find_i440fx(), it might be worth to mention
> > in this commit message. Something along lines that ACPI PCIHP
> > exist to support guests without SHPC support on PCI
> > based PC machine. Considering that Q35 provides native
> > PCI-E hotplug, there is no need to add ACPI hotplug there. =20
>=20
> Oh yes sure we can update the commit message :). But just wanted to
> mention that 'pc' machine type uses ACPI PCIHP and does support
> SHPC, so it's not mutually exclusive.
it supports both but is it relevant to this patch?

Point was that one shouldn't remove something silently without
any justification/explanation. So that readers that come later
wouldn't wonder about the reasons why the code was removed.
=20
> >=20
> > with commit message fixed
> >=20
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> >  =20
> > >=20
> > > ---
> > > =C2=A0include/hw/i386/pc.h=C2=A0=C2=A0|=C2=A0=C2=A01 -
> > > =C2=A0hw/acpi/pcihp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 10 +=
+++------
> > > =C2=A0hw/pci-host/piix.c=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A08 ------=
--
> > > =C2=A0stubs/pci-host-piix.c |=C2=A0=C2=A06 ------
> > > =C2=A0stubs/Makefile.objs=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A01 -
> > > =C2=A05 files changed, 4 insertions(+), 22 deletions(-)
> > > =C2=A0delete mode 100644 stubs/pci-host-piix.c
> > >=20
> > > diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> > > index 44cb6bf3f3..8e5f1464eb 100644
> > > --- a/include/hw/i386/pc.h
> > > +++ b/include/hw/i386/pc.h
> > > @@ -255,7 +255,6 @@ PCIBus *i440fx_init(const char *host_type,
> > > const char *pci_type,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MemoryRegion *pci_=
memory,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MemoryRegion *ram_=
memory);
> > > =C2=A0
> > > -PCIBus *find_i440fx(void);
> > > =C2=A0/* piix4.c */
> > > =C2=A0extern PCIDevice *piix4_dev;
> > > =C2=A0int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn);
> > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > index 80d42e12ff..254b2e50ab 100644
> > > --- a/hw/acpi/pcihp.c
> > > +++ b/hw/acpi/pcihp.c
> > > @@ -93,10 +93,9 @@ static void *acpi_set_bsel(PCIBus *bus, void
> > > *opaque)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return bsel_alloc;
> > > =C2=A0}
> > > =C2=A0
> > > -static void acpi_set_pci_info(void)
> > > +static void acpi_set_pci_info(AcpiPciHpState *s)
> > > =C2=A0{
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0static bool bsel_is_set;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0PCIBus *bus;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned bsel_alloc =3D ACPI_PCIHP_BSEL=
_DEFAULT;
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (bsel_is_set) {
> > > @@ -104,10 +103,9 @@ static void acpi_set_pci_info(void)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bsel_is_set =3D true;
> > > =C2=A0
> > > -=C2=A0=C2=A0=C2=A0=C2=A0bus =3D find_i440fx(); /* TODO: Q35 support =
*/
> > > -=C2=A0=C2=A0=C2=A0=C2=A0if (bus) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0if (s->root) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Scan all PCI=
 buses. Set property to enable acpi based
> > > hotplug. */
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pci_for_each_bus_dep=
th_first(bus, acpi_set_bsel, NULL,
> > > &bsel_alloc);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pci_for_each_bus_dep=
th_first(s->root, acpi_set_bsel, NULL,
> > > &bsel_alloc);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > =C2=A0}
> > > =C2=A0
> > > @@ -213,7 +211,7 @@ static void acpi_pcihp_update(AcpiPciHpState
> > > *s)
> > > =C2=A0
> > > =C2=A0void acpi_pcihp_reset(AcpiPciHpState *s)
> > > =C2=A0{
> > > -=C2=A0=C2=A0=C2=A0=C2=A0acpi_set_pci_info();
> > > +=C2=A0=C2=A0=C2=A0=C2=A0acpi_set_pci_info(s);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0acpi_pcihp_update(s);
> > > =C2=A0}
> > > =C2=A0
> > > diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
> > > index 47293a3915..658460264b 100644
> > > --- a/hw/pci-host/piix.c
> > > +++ b/hw/pci-host/piix.c
> > > @@ -445,14 +445,6 @@ PCIBus *i440fx_init(const char *host_type,
> > > const char *pci_type,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return b;
> > > =C2=A0}
> > > =C2=A0
> > > -PCIBus *find_i440fx(void)
> > > -{
> > > -=C2=A0=C2=A0=C2=A0=C2=A0PCIHostState *s =3D OBJECT_CHECK(PCIHostStat=
e,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object=
_resolve_path("/machine/i
> > > 440fx", NULL),
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0TYPE_P=
CI_HOST_BRIDGE);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0return s ? s->bus : NULL;
> > > -}
> > > -
> > > =C2=A0/* PIIX3 PCI to ISA bridge */
> > > =C2=A0static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
> > > =C2=A0{
> > > diff --git a/stubs/pci-host-piix.c b/stubs/pci-host-piix.c
> > > deleted file mode 100644
> > > index 6ed81b1f21..0000000000
> > > --- a/stubs/pci-host-piix.c
> > > +++ /dev/null
> > > @@ -1,6 +0,0 @@
> > > -#include "qemu/osdep.h"
> > > -#include "hw/i386/pc.h"
> > > -PCIBus *find_i440fx(void)
> > > -{
> > > -=C2=A0=C2=A0=C2=A0=C2=A0return NULL;
> > > -}
> > > diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
> > > index 5dd0aeeec6..725f78bedc 100644
> > > --- a/stubs/Makefile.objs
> > > +++ b/stubs/Makefile.objs
> > > @@ -41,6 +41,5 @@ stub-obj-y +=3D pc_madt_cpu_entry.o
> > > =C2=A0stub-obj-y +=3D vmgenid.o
> > > =C2=A0stub-obj-y +=3D xen-common.o
> > > =C2=A0stub-obj-y +=3D xen-hvm.o
> > > -stub-obj-y +=3D pci-host-piix.o
> > > =C2=A0stub-obj-y +=3D ram-block.o
> > > =C2=A0stub-obj-y +=3D ramfb.o =20
>=20
> Thanks,
> Sebastien
