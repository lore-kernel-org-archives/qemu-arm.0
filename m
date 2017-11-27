Received: by 10.223.159.82 with SMTP id f18csp1015533wrg;
        Sun, 26 Nov 2017 18:20:15 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZiYal+RHM5A7uc2OPzIb9YGmUyaUNvDAfBH6q2FUmmXQZ/gE5zPnWW00PwWuZtL19Wy86c
X-Received: by 10.37.177.31 with SMTP id g31mr22124074ybj.379.1511749215797;
        Sun, 26 Nov 2017 18:20:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511749215; cv=none;
        d=google.com; s=arc-20160816;
        b=mX1Eol1kUm6nX8aLFpn2s+ZRMNjXifqRhNPHiPK0l7lOXVHMv6c4PKp68uiKMEWtg4
         0UVEQIsmh0tiP9jCyQL+76WJ+mVAf3Hr+h/y8vWed8bJ5hWHFJbTlvH9KQ3KlfwI8nTy
         bVr1YzBMQPagbEju3zKvuRa7z4YX95zxYE/fttaH2zi6qSfstmH7GK14MYXO2emhref9
         m2v//F5T8D0PXSg5mBjLOPaY/aGtE2INOAx0Ra91luuosw2MH/YRd2fN2lgzJOCr6oE7
         B/m+wkrCBcjvBLqL79UsQceZXOR8Z5Agf/9q2VpPn0X+r0Sz4qfvIg4dZg9tCGe1G81s
         48fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=b2+I/+5QqntXgXG/gWRaENSNpChcOdUfI8n293lsYgE=;
        b=eNtT/G7KuZ27VbJTtc/v/IAvUd4XkPMiWWBQ0a9gCRxYnVBRKwfkMkqeZ5o8pHWTL/
         U1P/HggFy2RYK9cB3TqF5WBEpCLWoGKqBrCKi555eGRki/4n9TOKQ1++4wOA/ijLAf3n
         /ZLLb3zzkc5gvlPQ92u5U+0FyM2EZudfpvD7c6h3ewOj5y1NbbVP6HrCABDDQM7KE8py
         DGqZV0pjQuGw8ZM3zon/I/qiwilIZ9fhaTELdhw5t+6wm/V3TCggIsILsLrLk3chpEQB
         Z5invBPaJxc0zsdjw0CVn01jaynT/P0YuhKLoI2TPXc5iFLC8Uhc9HDxvhJcnQDOYhin
         8r5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=qGfoN7ue;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g6si5661134ybg.406.2017.11.26.18.20.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 26 Nov 2017 18:20:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=qGfoN7ue;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58827 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJ91r-0002ky-4e
	for alex.bennee@linaro.org; Sun, 26 Nov 2017 21:20:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1eJ91f-0002hW-O4
	for qemu-arm@nongnu.org; Sun, 26 Nov 2017 21:20:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1eJ91e-0001Gq-16
	for qemu-arm@nongnu.org; Sun, 26 Nov 2017 21:20:03 -0500
Received: from ozlabs.org ([103.22.144.67]:36503)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1eJ91d-0001GG-Dm
	for qemu-arm@nongnu.org; Sun, 26 Nov 2017 21:20:01 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3ylVqk6lD6z9sPm; Mon, 27 Nov 2017 13:19:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1511749186;
	bh=isg8kgNcQfPOq7eY4f/zbxq6Cj8emQq66m+wTonjZcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGfoN7uetKJNtkPt4BafDIwp59+tNu3tSO1U9LtGPTP5zg9NySgKEjqpmeET1z4GR
	El7BYhiQwV51L2xGP4+qsaj9mr5jy7Dqx/BVNnmh5iDmDIbi6kz6g44y2/ZXS6H888
	l/2oZPBZKGf/nW5R0HY2QEktyqPO/JxPT+N47IMw=
Date: Mon, 27 Nov 2017 12:51:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20171127015123.GA11775@umbus.fritz.box>
References: <20171125151610.20547-1-ehabkost@redhat.com>
	<20171125151610.20547-2-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <20171125151610.20547-2-ehabkost@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH v2 1/6] machine: Replace has_dynamic_sysbus
 with list of allowed devices
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
Cc: jgross@suse.com, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, sstabellini@kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>,
	Anthony Perard <anthony.perard@citrix.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>,
	xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EfoBqXbxXJyb


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 25, 2017 at 01:16:05PM -0200, Eduardo Habkost wrote:
> The existing has_dynamic_sysbus flag makes the machine accept
> every user-creatable sysbus device type on the command-line.
> Replace it with a list of allowed device types, so machines can
> easily accept some sysbus devices while rejecting others.
>=20
> To keep exactly the same behavior as before, the existing
> has_dynamic_sysbus=3Dtrue assignments are replaced with a
> TYPE_SYS_BUS_DEVICE entry on the allowed list.  Other patches
> will replace the TYPE_SYS_BUS_DEVICE entries with more specific
> lists of devices.
>=20
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Marcel Apfelbaum <marcel@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Alexander Graf <agraf@suse.de>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-ppc@nongnu.org
> Cc: xen-devel@lists.xenproject.org
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> Changes v1 -> v2:
> * Replace "dynamic sysbus whitelist" with "allowed sysbus devices"
> * Simply add TYPE_SYS_BUS_DEVICE to the list on existing
>   has_dynamic_sysbus=3Dtrue machines, and make machine-types more
>   strict in separate patches
> ---
>  include/hw/boards.h  |  5 ++++-
>  hw/arm/virt.c        |  3 ++-
>  hw/core/machine.c    | 43 +++++++++++++++++++++++++++++--------------
>  hw/i386/pc_q35.c     |  3 ++-
>  hw/ppc/e500plat.c    |  4 +++-
>  hw/ppc/spapr.c       |  3 ++-
>  hw/xen/xen_backend.c |  7 ++++++-
>  7 files changed, 48 insertions(+), 20 deletions(-)
>=20
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 156b16f7a6..041bc08971 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -76,6 +76,9 @@ void machine_set_cpu_numa_node(MachineState *machine,
>                                 const CpuInstanceProperties *props,
>                                 Error **errp);
> =20
> +void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char=
 *type);
> +
> +
>  /**
>   * CPUArchId:
>   * @arch_id - architecture-dependent CPU ID of present or possible CPU
> @@ -179,7 +182,6 @@ struct MachineClass {
>          no_floppy:1,
>          no_cdrom:1,
>          no_sdcard:1,
> -        has_dynamic_sysbus:1,
>          pci_allow_0_address:1,
>          legacy_fw_cfg_order:1;
>      int is_default;
> @@ -197,6 +199,7 @@ struct MachineClass {
>      bool ignore_memory_transaction_failures;
>      int numa_mem_align_shift;
>      const char **valid_cpu_types;
> +    strList *allowed_dynamic_sysbus_devices;
>      bool auto_enable_numa_with_memhp;
>      void (*numa_auto_assign_ram)(MachineClass *mc, NodeInfo *nodes,
>                                   int nb_nodes, ram_addr_t size);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9e18b410d7..fa6dc15fcd 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1591,7 +1591,8 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
>       * configuration of the particular instance.
>       */
>      mc->max_cpus =3D 255;
> -    mc->has_dynamic_sysbus =3D true;
> +    /*TODO: allow only sysbus devices that really work with this machine=
 */
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
>      mc->block_default_type =3D IF_VIRTIO;
>      mc->no_cdrom =3D 1;
>      mc->pci_allow_0_address =3D true;
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 36c2fb069c..ab2ec292f3 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -335,29 +335,44 @@ static bool machine_get_enforce_config_section(Obje=
ct *obj, Error **errp)
>      return ms->enforce_config_section;
>  }
> =20
> -static void error_on_sysbus_device(SysBusDevice *sbdev, void *opaque)
> +void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char=
 *type)
>  {
> -    error_report("Option '-device %s' cannot be handled by this machine",
> -                 object_class_get_name(object_get_class(OBJECT(sbdev))));
> -    exit(1);
> +    strList *item =3D g_new0(strList, 1);
> +
> +    item->value =3D g_strdup(type);
> +    item->next =3D mc->allowed_dynamic_sysbus_devices;
> +    mc->allowed_dynamic_sysbus_devices =3D item;
>  }
> =20
> -static void machine_init_notify(Notifier *notifier, void *data)
> +static void validate_sysbus_device(SysBusDevice *sbdev, void *opaque)
>  {
> -    Object *machine =3D qdev_get_machine();
> -    ObjectClass *oc =3D object_get_class(machine);
> -    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    MachineState *machine =3D opaque;
> +    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> +    bool allowed =3D false;
> +    strList *wl;
> =20
> -    if (mc->has_dynamic_sysbus) {
> -        /* Our machine can handle dynamic sysbus devices, we're all good=
 */
> -        return;
> +    for (wl =3D mc->allowed_dynamic_sysbus_devices;
> +         !allowed && wl;
> +         wl =3D wl->next) {
> +        allowed |=3D !!object_dynamic_cast(OBJECT(sbdev), wl->value);
>      }
> =20
> +    if (!allowed) {
> +        error_report("Option '-device %s' cannot be handled by this mach=
ine",
> +                     object_class_get_name(object_get_class(OBJECT(sbdev=
))));
> +        exit(1);
> +    }
> +}
> +
> +static void machine_init_notify(Notifier *notifier, void *data)
> +{
> +    MachineState *machine =3D MACHINE(qdev_get_machine());
> +
>      /*
> -     * Loop through all dynamically created devices and check whether th=
ere
> -     * are sysbus devices among them. If there are, error out.
> +     * Loop through all dynamically created sysbus devices and check if =
they are
> +     * all allowed.  If a device is not allowed, error out.
>       */
> -    foreach_dynamic_sysbus_device(error_on_sysbus_device, NULL);
> +    foreach_dynamic_sysbus_device(validate_sysbus_device, machine);
>  }
> =20
>  HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machi=
ne)
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index d6060043ac..d0b0e5b422 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -299,7 +299,8 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->default_machine_opts =3D "firmware=3Dbios-256k.bin";
>      m->default_display =3D "std";
>      m->no_floppy =3D 1;
> -    m->has_dynamic_sysbus =3D true;
> +    /*TODO: allow only sysbus devices that really work with this machine=
 */
> +    machine_class_allow_dynamic_sysbus_dev(m, TYPE_SYS_BUS_DEVICE);
>      m->max_cpus =3D 288;
>  }
> =20
> diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
> index e59e80fb9e..438118c29b 100644
> --- a/hw/ppc/e500plat.c
> +++ b/hw/ppc/e500plat.c
> @@ -15,6 +15,7 @@
>  #include "hw/boards.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/kvm.h"
> +#include "hw/sysbus.h"
>  #include "hw/pci/pci.h"
>  #include "hw/ppc/openpic.h"
>  #include "kvm_ppc.h"
> @@ -63,7 +64,8 @@ static void e500plat_machine_init(MachineClass *mc)
>      mc->desc =3D "generic paravirt e500 platform";
>      mc->init =3D e500plat_init;
>      mc->max_cpus =3D 32;
> -    mc->has_dynamic_sysbus =3D true;
> +    /*TODO: allow only sysbus devices that really work with this machine=
 */
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
>      mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("e500v2_v30");
>  }
> =20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index d682f013d4..82040cc5d1 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3603,7 +3603,8 @@ static void spapr_machine_class_init(ObjectClass *o=
c, void *data)
>      mc->default_boot_order =3D "";
>      mc->default_ram_size =3D 512 * M_BYTE;
>      mc->kvm_type =3D spapr_kvm_type;
> -    mc->has_dynamic_sysbus =3D true;
> +    /*TODO: allow only sysbus devices that really work with this machine=
 */
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
>      mc->pci_allow_0_address =3D true;
>      mc->get_hotplug_handler =3D spapr_get_hotplug_handler;
>      hc->pre_plug =3D spapr_machine_device_pre_plug;
> diff --git a/hw/xen/xen_backend.c b/hw/xen/xen_backend.c
> index 0f849a26d2..82380ea9ee 100644
> --- a/hw/xen/xen_backend.c
> +++ b/hw/xen/xen_backend.c
> @@ -564,7 +564,12 @@ static void xen_set_dynamic_sysbus(void)
>      ObjectClass *oc =3D object_get_class(machine);
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> =20
> -    mc->has_dynamic_sysbus =3D true;
> +    /*
> +     * Emulate old mc->has_dynamic_sysbus=3Dtrue assignment
> +     *
> +     *TODO: add only Xen devices to the list
> +     */
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
>  }
> =20
>  int xen_be_register(const char *type, struct XenDevOps *ops)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlobb5kACgkQbDjKyiDZ
s5JgiBAArSUSMABu4eiRsoYQ5vUe778ISwb6C6sXNZhCxFCBA4yX94pGcEoMTmUA
oMgRmXep8wpQx/U0CzsBy4awtamccpT3aBRMvYfEkpB83H9dASJYSGBx06QLp1oC
1znN65q4t49LV8vkDQamPH1JPi6J4HtTYKZtoPKeWWwgmmNN/xYPqdYj+qvv9SX9
3+mqrodJ5Rh+eZiK6Q9qYHXKyjlfmiTTmHwt/NXJ+hxNz1ITgJAoJMAyvAtDjrxz
B/9aBC4r1vz7HYuphvODp2vj+v5Niicy1M01uOFNFgT0zuUDeqwuTdIlASWfzOQT
5ihBxjitB1BIddPvT2ATRPJmA61cx64KJSS4hsmJ/CSwqY0/49i7KDR7VHpuXmY4
UWnC1bBm2oHc0VjXuff8OPdCRJhXXFC5fcxvXtU6uGUK5EhRkm1giu1TyImMd/5w
a/66t1DoxqNyjlQS51DY4Gx1L3lp5w5Loqqmvzr9KCDf0JPtS/M0Td12PlBq2AS7
OduaLBvyCvtRfW1RCgRkGvN48MKVI6EGXEjCK/9YC4JM/zJqS3Av+ZX/A8iPLusK
qvDQ0K07nfeVhqRXNc4mp43y+XuIGj43JwYsFftidpF2aDQz9fnEd7UDFl0fBt83
WiTBOrciPiDMnzjkezL2IDmNGwM2YluPlbxQlDqoNSnluniR2uA=
=cmTC
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
