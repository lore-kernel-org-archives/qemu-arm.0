Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp159617wrw;
        Fri, 16 Nov 2018 01:39:37 -0800 (PST)
X-Google-Smtp-Source: AJdET5fC/80uNgyc8zsYPlYPugEeTWkWFeN1LCeUtrv/vOiNQze9wZrPeY0ZVxeCUFz4jo3zCrF2
X-Received: by 2002:a37:2881:: with SMTP id o1mr9572751qko.130.1542361177407;
        Fri, 16 Nov 2018 01:39:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542361177; cv=none;
        d=google.com; s=arc-20160816;
        b=yMwTwuQWcNPKwMmKoncejYaus2zkXXdXhIHH8PjJEjtAIl8M2J3QJXgOA4M9qZ6pWo
         +XVA8fy5g61kKf46F3a/rykLPXS8JvR1snbBh0+nb7SE7/v/TCuTiLO1/AzXL61HJmRm
         IHkbHuhTdjE1Y2sXv5EM6ipad2wsGO59CLmCso7hldaqYMT+B5jrtpMYeMV/h17tF93f
         CwIrtOCpn7JSO4Oyj0N8NNT8YzYIfZ8iprpzR9qZfuxyT+nBsA5bPmwdML1T0YPC2gt8
         pcIQt3ikOa6F/+o6yOkW7lnHwRmQftfL1kocHpCqBIpANoiqQ29vsYNVT0m5WX1ynQtc
         pyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=uwJGuLKhWpi4FRPcdi3sqKkUX5zJJ3iZlCAFuc53Y0g=;
        b=Pzk9OBht3uH6QOiYNBiW7gOCSp0H93kAjdOt1T2khM//Il/4XrHwksWTGnLqbiK3lq
         YlJwlDiZahnaHgvlDJJytadBICFJUEl5LsouAJYHO7d/xJoS4dO29DhZpoUEyaLsuz5T
         JozwGSnWJgBAVoTgj29eTuzOgkJml9CqNGJwwBnOY95lsdEgRCXvk6nGjphy7BvUeNmS
         v78S3PIy8k8i2f6M0gLtvIUdXL+u+90MEolrvTkbqX52L2BPRvd8QkS4sCWFSbqW7/Ly
         9gNKtZYW5zj+Kkuy9jCrRy8+pFk1Tqu3uwvI5FcT5bLHsycugQCs5qeWkhVuN5fF5Q7I
         RpxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k18si920950qtb.401.2018.11.16.01.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 01:39:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNabA-00085u-Us
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 04:39:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gNab3-00085d-1V
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:39:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gNaau-0003gG-67
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:39:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45842)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gNaat-0003fo-Nq; Fri, 16 Nov 2018 04:39:20 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE505356CE;
	Fri, 16 Nov 2018 09:39:17 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F304600C2;
	Fri, 16 Nov 2018 09:39:11 +0000 (UTC)
Date: Fri, 16 Nov 2018 10:39:09 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181116103909.64f35d5d@redhat.com>
In-Reply-To: <20181105014047.26447-20-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-20-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 16 Nov 2018 09:39:18 +0000 (UTC)
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jing Liu <jing2.liu@linux.intel.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Sebastien Boeuf <sebastien.boeuf@intel.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wwEbqQlUXl7s

On Mon,  5 Nov 2018 02:40:42 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> From: Sebastien Boeuf <sebastien.boeuf@intel.com>
>=20
> Instead of using the machine type specific method find_i440fx() to
> retrieve the PCI bus, this commit aims to rely on the fact that the
> PCI bus is known by the structure AcpiPciHpState.
>=20
> When the structure is initialized through acpi_pcihp_init() call,
> it saves the PCI bus, which means there is no need to invoke a
> special function later on.
>=20
> Based on the fact that find_i440fx() was only used there, this
> patch also removes the function find_i440fx() itself from the
> entire codebase.
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
> Signed-off-by: Jing Liu <jing2.liu@linux.intel.com>
Thanks for cleaning it up

minor nit:
Taking in account that you're removing '/* TODO: Q35 support */'
comment along with find_i440fx(), it might be worth to mention
in this commit message. Something along lines that ACPI PCIHP
exist to support guests without SHPC support on PCI
based PC machine. Considering that Q35 provides native
PCI-E hotplug, there is no need to add ACPI hotplug there.


with commit message fixed

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/i386/pc.h  |  1 -
>  hw/acpi/pcihp.c       | 10 ++++------
>  hw/pci-host/piix.c    |  8 --------
>  stubs/pci-host-piix.c |  6 ------
>  stubs/Makefile.objs   |  1 -
>  5 files changed, 4 insertions(+), 22 deletions(-)
>  delete mode 100644 stubs/pci-host-piix.c
>=20
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 44cb6bf3f3..8e5f1464eb 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -255,7 +255,6 @@ PCIBus *i440fx_init(const char *host_type, const char=
 *pci_type,
>                      MemoryRegion *pci_memory,
>                      MemoryRegion *ram_memory);
> =20
> -PCIBus *find_i440fx(void);
>  /* piix4.c */
>  extern PCIDevice *piix4_dev;
>  int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn);
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 80d42e12ff..254b2e50ab 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -93,10 +93,9 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
>      return bsel_alloc;
>  }
> =20
> -static void acpi_set_pci_info(void)
> +static void acpi_set_pci_info(AcpiPciHpState *s)
>  {
>      static bool bsel_is_set;
> -    PCIBus *bus;
>      unsigned bsel_alloc =3D ACPI_PCIHP_BSEL_DEFAULT;
> =20
>      if (bsel_is_set) {
> @@ -104,10 +103,9 @@ static void acpi_set_pci_info(void)
>      }
>      bsel_is_set =3D true;
> =20
> -    bus =3D find_i440fx(); /* TODO: Q35 support */
> -    if (bus) {
> +    if (s->root) {
>          /* Scan all PCI buses. Set property to enable acpi based hotplug=
. */
> -        pci_for_each_bus_depth_first(bus, acpi_set_bsel, NULL, &bsel_all=
oc);
> +        pci_for_each_bus_depth_first(s->root, acpi_set_bsel, NULL, &bsel=
_alloc);
>      }
>  }
> =20
> @@ -213,7 +211,7 @@ static void acpi_pcihp_update(AcpiPciHpState *s)
> =20
>  void acpi_pcihp_reset(AcpiPciHpState *s)
>  {
> -    acpi_set_pci_info();
> +    acpi_set_pci_info(s);
>      acpi_pcihp_update(s);
>  }
> =20
> diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
> index 47293a3915..658460264b 100644
> --- a/hw/pci-host/piix.c
> +++ b/hw/pci-host/piix.c
> @@ -445,14 +445,6 @@ PCIBus *i440fx_init(const char *host_type, const cha=
r *pci_type,
>      return b;
>  }
> =20
> -PCIBus *find_i440fx(void)
> -{
> -    PCIHostState *s =3D OBJECT_CHECK(PCIHostState,
> -                                   object_resolve_path("/machine/i440fx"=
, NULL),
> -                                   TYPE_PCI_HOST_BRIDGE);
> -    return s ? s->bus : NULL;
> -}
> -
>  /* PIIX3 PCI to ISA bridge */
>  static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
>  {
> diff --git a/stubs/pci-host-piix.c b/stubs/pci-host-piix.c
> deleted file mode 100644
> index 6ed81b1f21..0000000000
> --- a/stubs/pci-host-piix.c
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -#include "qemu/osdep.h"
> -#include "hw/i386/pc.h"
> -PCIBus *find_i440fx(void)
> -{
> -    return NULL;
> -}
> diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
> index 5dd0aeeec6..725f78bedc 100644
> --- a/stubs/Makefile.objs
> +++ b/stubs/Makefile.objs
> @@ -41,6 +41,5 @@ stub-obj-y +=3D pc_madt_cpu_entry.o
>  stub-obj-y +=3D vmgenid.o
>  stub-obj-y +=3D xen-common.o
>  stub-obj-y +=3D xen-hvm.o
> -stub-obj-y +=3D pci-host-piix.o
>  stub-obj-y +=3D ram-block.o
>  stub-obj-y +=3D ramfb.o

