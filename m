Received: by 10.223.172.38 with SMTP id v35csp357695wrc;
        Fri, 22 Sep 2017 22:33:48 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCsZiukRk7sAoDRqiB3Tm5HpVP5uk50SnW8Bn0bipn7JSNP7r08Lb73YESb1ESB+GSKRyaX
X-Received: by 10.55.36.7 with SMTP id w7mr1966868qkg.1.1506144827995;
        Fri, 22 Sep 2017 22:33:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506144827; cv=none;
        d=google.com; s=arc-20160816;
        b=C1r60mlRc+GQnLWS+AXHduXafyn0xmZmzTX3ullAH21I5nN5HGWw+F3ljiuJdOOlM2
         0mbYxdPsG2OnNRQiMnmMIQ2Ryiy8oI7v3HIxAgOLwLBC4Shmv7WcZxKzL+MraHpBz70X
         +9e+p0EnacW68RfnzdYtPnHfD1ovzu6lRYIoytsQBCcYpWpF2q0xasbuYUIw+gedxtDY
         FtCvEeUD2Y0ZsUpeiFV+n0IVeSI6kCz4DVEFgEITu2hZQDSQKeLYx7GitymuyRpuRbkF
         nvJhbbZLWwhUu7QhnS/DqRg/9OSH5bdCjP5Eqwqr1J37oe0pGFI384A+MQx/rJSjdp2o
         m1Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=0GghWxsFoyScQH3aKjknZ/I5R2h9eFoUiPKJ0lSb1MI=;
        b=YUzIlCX+MRApzALjVQqfHNJaw810liYeiu2s69VrJoBhj07NDOd0S7Kk8de6PRZhVi
         ES2iJiZGkm96IyEij64Z/J7lR9EGgzbvPGjBWbZXUj+6fda3rAZasIxd3oKxJlYS9Yvd
         k+OspptO9G/qtvlXuYnrhAlHKlrv3G2O63R19ngXfasHwd3iVDSI8NahkvBSLxuSrUXN
         MVQsiw0UpJcFRaT/Am895BODjciEeXVAYXyuCI0C9X6PZbAyiOmbF3HkuImPjswbExK1
         7+tI4N6/q4CdJBcnDDnfxlB+6VkfyWFOn5R3tbqozzGRyifY3LdmK0ncZpnyv+QQhNGR
         QECQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=dFTlk3H1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t81si1391912qkt.12.2017.09.22.22.33.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 22:33:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=dFTlk3H1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvd4T-0001vP-KS
	for alex.bennee@linaro.org; Sat, 23 Sep 2017 01:33:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dvd0O-0007P3-DW
	for qemu-arm@nongnu.org; Sat, 23 Sep 2017 01:29:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dvd0M-0002Ec-9N
	for qemu-arm@nongnu.org; Sat, 23 Sep 2017 01:29:32 -0400
Received: from ozlabs.org ([103.22.144.67]:38363)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1dvd0L-0002AW-HB
	for qemu-arm@nongnu.org; Sat, 23 Sep 2017 01:29:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3xzf6R4dhkz9t3v; Sat, 23 Sep 2017 15:29:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1506144559;
	bh=qnmCsXzuTcXa+1PnMq8wcWPp3rlIs8PMf2RiK/IK2Us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFTlk3H1QgSpSbEkSdOr59WZhurYlHG8aggNmzZc+AAB5+oK/qha9zUXW0z3GJ1/0
	DaViNznpCKWmM/C3H5izjc7IgQT1OK7Q1pEnxziQvbHnIRPviHEN5j7lpB7LiNfJlx
	HE2feBqKL+BM2pSoi56ZbMY9zZJUXwx1CmqAZa60=
Date: Sat, 23 Sep 2017 15:12:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20170923051227.GB4998@umbus.fritz.box>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922160111.31885-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1ugEqy3masBx2OgH"
Content-Disposition: inline
In-Reply-To: <20170922160111.31885-5-f4bug@amsat.org>
User-Agent: Mutt/1.9.0 (2017-09-02)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH 27/34] hw/pci: declare pci_nic_init_nofail()
 in "hw/net/pci.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Jason Wang <jasowang@redhat.com>, Alexander Graf <agraf@suse.de>,
	qemu-devel@nongnu.org, Yongbok Kim <yongbok.kim@imgtec.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3JnGv7qptm0i


--1ugEqy3masBx2OgH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2017 at 01:01:04PM -0300, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

ppc portions

Acked-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/pci/pci_internal.h | 16 +++++++++++
>  include/hw/net/pci.h  | 20 +++++++++++++
>  include/hw/pci/pci.h  |  4 ---
>  hw/arm/virt.c         |  1 +
>  hw/mips/mips_malta.c  |  1 +
>  hw/pci/pci.c          | 67 ++------------------------------------------
>  hw/pci/pci_nic.c      | 77 +++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  hw/ppc/e500.c         |  1 +
>  hw/ppc/spapr.c        |  1 +
>  hw/pci/Makefile.objs  |  1 +
>  10 files changed, 120 insertions(+), 69 deletions(-)
>  create mode 100644 hw/pci/pci_internal.h
>  create mode 100644 include/hw/net/pci.h
>  create mode 100644 hw/pci/pci_nic.c
>=20
> diff --git a/hw/pci/pci_internal.h b/hw/pci/pci_internal.h
> new file mode 100644
> index 0000000000..d967468767
> --- /dev/null
> +++ b/hw/pci/pci_internal.h
> @@ -0,0 +1,16 @@
> +/*
> + * QEMU PCI internal
> + *
> + * Copyright (c) 2005 Fabrice Bellard
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +#ifndef QEMU_HW_PCI_INTERNAL_H
> +#define QEMU_HW_PCI_INTERNAL_H
> +
> +#include "hw/pci/pci_bus.h"
> +
> +PCIBus *pci_get_bus_devfn(int *devfnp, PCIBus *root, const char *devaddr=
);
> +
> +#endif
> diff --git a/include/hw/net/pci.h b/include/hw/net/pci.h
> new file mode 100644
> index 0000000000..529591b7f3
> --- /dev/null
> +++ b/include/hw/net/pci.h
> @@ -0,0 +1,20 @@
> +/*
> + * QEMU network devices
> + *
> + * Copyright (c) 2005 Fabrice Bellard
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +#ifndef QEMU_HW_NET_PCI_H
> +#define QEMU_HW_NET_PCI_H
> +
> +#include "net/net.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pci_bus.h"
> +
> +PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
> +                               const char *default_model,
> +                               const char *default_devaddr);
> +
> +#endif
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index aa7ef9cf69..6a0f7b5472 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -422,10 +422,6 @@ void pci_device_set_intx_routing_notifier(PCIDevice =
*dev,
>                                            PCIINTxRoutingNotifier notifie=
r);
>  void pci_device_reset(PCIDevice *dev);
> =20
> -PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
> -                               const char *default_model,
> -                               const char *default_devaddr);
> -
>  PCIDevice *pci_vga_init(PCIBus *bus);
> =20
>  int pci_bus_num(PCIBus *s);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9e18b410d7..39fab3acb9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -35,6 +35,7 @@
>  #include "hw/arm/primecell.h"
>  #include "hw/arm/virt.h"
>  #include "hw/devices.h"
> +#include "hw/net/pci.h"
>  #include "net/net.h"
>  #include "sysemu/block-backend.h"
>  #include "sysemu/device_tree.h"
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index 6945fa47c3..fb6a2f9363 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -48,6 +48,7 @@
>  #include "hw/timer/mc146818rtc.h"
>  #include "hw/input/i8042.h"
>  #include "hw/timer/i8254.h"
> +#include "hw/net/pci.h"
>  #include "sysemu/blockdev.h"
>  #include "exec/address-spaces.h"
>  #include "hw/sysbus.h"             /* SysBusDevice */
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 1e6fb88eba..9b678c8fd0 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -28,7 +28,6 @@
>  #include "hw/pci/pci_bus.h"
>  #include "hw/pci/pci_host.h"
>  #include "monitor/monitor.h"
> -#include "net/net.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/loader.h"
>  #include "qemu/error-report.h"
> @@ -41,6 +40,7 @@
>  #include "hw/hotplug.h"
>  #include "hw/boards.h"
>  #include "qemu/cutils.h"
> +#include "pci_internal.h"
> =20
>  //#define DEBUG_PCI
>  #ifdef DEBUG_PCI
> @@ -671,8 +671,7 @@ static int pci_parse_devaddr(const char *addr, int *d=
omp, int *busp,
>      return 0;
>  }
> =20
> -static PCIBus *pci_get_bus_devfn(int *devfnp, PCIBus *root,
> -                                 const char *devaddr)
> +PCIBus *pci_get_bus_devfn(int *devfnp, PCIBus *root, const char *devaddr)
>  {
>      int dom, bus;
>      unsigned slot;
> @@ -1812,68 +1811,6 @@ PciInfoList *qmp_query_pci(Error **errp)
>      return head;
>  }
> =20
> -static const char * const pci_nic_models[] =3D {
> -    "ne2k_pci",
> -    "i82551",
> -    "i82557b",
> -    "i82559er",
> -    "rtl8139",
> -    "e1000",
> -    "pcnet",
> -    "virtio",
> -    "sungem",
> -    NULL
> -};
> -
> -static const char * const pci_nic_names[] =3D {
> -    "ne2k_pci",
> -    "i82551",
> -    "i82557b",
> -    "i82559er",
> -    "rtl8139",
> -    "e1000",
> -    "pcnet",
> -    "virtio-net-pci",
> -    "sungem",
> -    NULL
> -};
> -
> -/* Initialize a PCI NIC.  */
> -PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
> -                               const char *default_model,
> -                               const char *default_devaddr)
> -{
> -    const char *devaddr =3D nd->devaddr ? nd->devaddr : default_devaddr;
> -    PCIBus *bus;
> -    PCIDevice *pci_dev;
> -    DeviceState *dev;
> -    int devfn;
> -    int i;
> -
> -    if (qemu_show_nic_models(nd->model, pci_nic_models)) {
> -        exit(0);
> -    }
> -
> -    i =3D qemu_find_nic_model(nd, pci_nic_models, default_model);
> -    if (i < 0) {
> -        exit(1);
> -    }
> -
> -    bus =3D pci_get_bus_devfn(&devfn, rootbus, devaddr);
> -    if (!bus) {
> -        error_report("Invalid PCI device address %s for device %s",
> -                     devaddr, pci_nic_names[i]);
> -        exit(1);
> -    }
> -
> -    pci_dev =3D pci_create(bus, devfn, pci_nic_names[i]);
> -    dev =3D &pci_dev->qdev;
> -    qdev_set_nic_properties(dev, nd);
> -    qdev_init_nofail(dev);
> -
> -    return pci_dev;
> -}
> -
>  PCIDevice *pci_vga_init(PCIBus *bus)
>  {
>      switch (vga_interface_type) {
> diff --git a/hw/pci/pci_nic.c b/hw/pci/pci_nic.c
> new file mode 100644
> index 0000000000..fb1a10ff12
> --- /dev/null
> +++ b/hw/pci/pci_nic.c
> @@ -0,0 +1,77 @@
> +/*
> + * QEMU PCI network interface
> + *
> + * Copyright (c) 2004 Fabrice Bellard
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pci_bus.h"
> +#include "hw/net/pci.h"
> +#include "net/net.h"
> +#include "pci_internal.h"
> +
> +static const char *const pci_nic_models[] =3D {
> +    "ne2k_pci",
> +    "i82551",
> +    "i82557b",
> +    "i82559er",
> +    "rtl8139",
> +    "e1000",
> +    "pcnet",
> +    "virtio",
> +    "sungem",
> +    NULL
> +};
> +
> +static const char *const pci_nic_names[] =3D {
> +    "ne2k_pci",
> +    "i82551",
> +    "i82557b",
> +    "i82559er",
> +    "rtl8139",
> +    "e1000",
> +    "pcnet",
> +    "virtio-net-pci",
> +    "sungem",
> +    NULL
> +};
> +
> +/* Initialize a PCI NIC.  */
> +PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
> +                               const char *default_model,
> +                               const char *default_devaddr)
> +{
> +    const char *devaddr =3D nd->devaddr ? nd->devaddr : default_devaddr;
> +    PCIBus *bus;
> +    PCIDevice *pci_dev;
> +    DeviceState *dev;
> +    int devfn;
> +    int i;
> +
> +    if (qemu_show_nic_models(nd->model, pci_nic_models)) {
> +        exit(0);
> +    }
> +
> +    i =3D qemu_find_nic_model(nd, pci_nic_models, default_model);
> +    if (i < 0) {
> +        exit(1);
> +    }
> +
> +    bus =3D pci_get_bus_devfn(&devfn, rootbus, devaddr);
> +    if (!bus) {
> +        error_report("Invalid PCI device address %s for device %s",
> +                     devaddr, pci_nic_names[i]);
> +        exit(1);
> +    }
> +
> +    pci_dev =3D pci_create(bus, devfn, pci_nic_names[i]);
> +    dev =3D &pci_dev->qdev;
> +    qdev_set_nic_properties(dev, nd);
> +    qdev_init_nofail(dev);
> +
> +    return pci_dev;
> +}
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index db0e49ab8f..482757ca7b 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -24,6 +24,7 @@
>  #include "hw/hw.h"
>  #include "hw/char/serial.h"
>  #include "hw/pci/pci.h"
> +#include "hw/net/pci.h"
>  #include "hw/boards.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 17ea77618c..96007051e2 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -56,6 +56,7 @@
>  #include "hw/pci-host/spapr.h"
>  #include "hw/ppc/xics.h"
>  #include "hw/pci/msi.h"
> +#include "hw/net/pci.h"
> =20
>  #include "hw/pci/pci.h"
>  #include "hw/scsi/scsi.h"
> diff --git a/hw/pci/Makefile.objs b/hw/pci/Makefile.objs
> index 9f905e6344..125428fd54 100644
> --- a/hw/pci/Makefile.objs
> +++ b/hw/pci/Makefile.objs
> @@ -1,4 +1,5 @@
>  common-obj-$(CONFIG_PCI) +=3D pci.o pci_bridge.o
> +common-obj-$(CONFIG_PCI) +=3D pci_nic.o
>  common-obj-$(CONFIG_PCI) +=3D msix.o msi.o
>  common-obj-$(CONFIG_PCI) +=3D shpc.o
>  common-obj-$(CONFIG_PCI) +=3D slotid_cap.o

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1ugEqy3masBx2OgH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnF7TsACgkQbDjKyiDZ
s5KVSQ/7BztPpsJQsiLez0GsbT4DxZnLd91VDipJ/fxptxk8HnycF0mOAzS9CsPU
kzFlYCXqtp/jmvxPukAPBff4oJzll07YUnRlYMR3AwSXxZg4FBRnLaK2YDu5ReVn
nsN8sSLJdLrn9bsY7XKxAYNZimu5jJ52Q/Jo56x+54LEQkcuNWh3nxtnc2hwdVjB
2Ee4GgGDk/dBIGiNf2nOhH06yM0WlOVYQno4SAHVcNjKQejcx5eSmOJDVFAZQUsA
kaZpx3C4Sh1qIBx5lKtsR9bMlAl6C6qpaAUBHaIZOKlYghumUwUd3e59E0B1yuDf
ZorvJeK1x7s5JD6+abcZoELFeZG0HhNorwoNl0YVdHmqahTIbPMsAnut0rGDzQ0q
zYzc4RTnOL2gTcImnHvKecov2ACBlpq+s60KGJP0J/tr/bTIq0uyaMbeC/N0HRW3
pOxzMXzq7sNsauy2z5rq36QTensIHIs3vURd1L8M+GD1Bo6zT7LZS13W6D/QcxI7
bQQ6VBM8PDa0kb1o3sJ2JqJ3TDVsZu+aQP8Fv1MIVyLKEnmRY96nk0ABhvtjiJT+
Cn+sDNwBjs8i3IWoh+QWNQgEsRasCHntuw2oo5XiTZrAPOMidO78BYOGsnVbnCzt
omZhk4XBA8604uPsQGwTB89MJMo+XaYsjLJreinJyMfK7+4xwrg=
=AUBU
-----END PGP SIGNATURE-----

--1ugEqy3masBx2OgH--
