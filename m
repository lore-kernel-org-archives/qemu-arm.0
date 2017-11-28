Received: by 10.223.159.82 with SMTP id f18csp3121151wrg;
        Tue, 28 Nov 2017 08:56:36 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbGlNSeneAEluQ1FwJvA7f3YK3DimcYROsUFRzMhin31IHlJET2mFttMrj2ACJ+UBvGB2xX
X-Received: by 10.37.35.216 with SMTP id j207mr29199303ybj.105.1511888196566;
        Tue, 28 Nov 2017 08:56:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511888196; cv=none;
        d=google.com; s=arc-20160816;
        b=Tr31S9oCOosoQzYC5c1Sxys+2o0moUpSY0Kr1kR7a8pD5NKvkvEpRxNNHQJcbImm3l
         uhuZL+rSOA8upN5tUevb5YIkuZG9iRWCMotwCt0mJPOzeAxZuq+ea807ACuyhZobLl2r
         KNVI8z9JfqKj1a3nAW+abxlt5c7xM9O1TUjvbAItnNzbDfkh23f0RZwChlmxXXT7z7vW
         RRiIJeiaOPAFM7WeEYQc2enuoWA5SYqIe/Q+r7EXrODoaHIfbbU5rswV0qkCUFH0qY6R
         nyRwFzUOh7/Y1Y+MVrtO1nDe5C8SgOeahK/MlU6e7R5uVcY+dP4DZvrTsm4536SAcEl7
         259A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=PkvjGM/JiMUiJcSxjjmAEPJabEPdXpfGI1vgchUlpfQ=;
        b=lcrTg1PAYXrX3XMMTFvBP7tGThHcZVzV63mAsu2WwoYXal7Iy/VNUFjxRxCqwASsRk
         vh71laKbWWSCYU9J8OkoZ3Gxs1YkOWzOfH8r9MVU3TXgYuUYc0oy8TKnhrIIjRDJEQSZ
         Ggvl9azuh+RFGZXBr+8waqMVfSvmg8FI7s2COsLBIbhsIQlKfWFgNGZzl05sTfqD5Djo
         s+JqFcudowfGNC435MNpOD+34iNrVJvr3BJSr7rjCrDmjqEnghIPxJlhhX6qeDtruWtD
         46PJVv5+ba94L+gkQh6lUpBZyNj0SvwT3Xwc3aHo1kg8JQF66xrNimijWrQ40g29bkdd
         1/1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GVb0Fbgm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e196si6420791ybf.569.2017.11.28.08.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Nov 2017 08:56:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GVb0Fbgm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJjBU-00029z-1Z
	for alex.bennee@linaro.org; Tue, 28 Nov 2017 11:56:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1eJjAJ-0001AC-Jk
	for qemu-arm@nongnu.org; Tue, 28 Nov 2017 11:55:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1eJjAH-0004bQ-SE
	for qemu-arm@nongnu.org; Tue, 28 Nov 2017 11:55:23 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:34239)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1eJjAD-0004a0-S1; Tue, 28 Nov 2017 11:55:18 -0500
Received: by mail-wm0-x241.google.com with SMTP id y82so32606616wmg.1;
	Tue, 28 Nov 2017 08:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PkvjGM/JiMUiJcSxjjmAEPJabEPdXpfGI1vgchUlpfQ=;
	b=GVb0FbgmG5RQlMMoqgFjEBXuKaXjcng5x7b7K9upQ9Pjl5jS2FcF4NfE/+mrVat+Sv
	li/yQYITaU20s2sMHqz7lbQUMuFcG3kFREidd8TAjfe9wnBaNURJXI4VDHypyE8myQiL
	9fxXIogx2AzDoko3jBLz7jF2SVDtcAApl0QBDL0B27daCe18nKulkp+YyKlMSj8Ltf9Z
	yyyDNkcAJIWB4wuTA6l+pQLWvKNMTQKV4kWIunAtKoTaH0ds9yCeOZQCYrxjEcSK/Beh
	rnmGJO/3EjcjLy8bMwV/L4fIrO8bMHllpFdoih9jzxDYga1VJSpPU+JJUTJZjCvIWKJ+
	qJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PkvjGM/JiMUiJcSxjjmAEPJabEPdXpfGI1vgchUlpfQ=;
	b=RhLpEOsYYLviv4t1P6nME/Rbj7wzMvnVzQfLSv1Fnj21OV+Bt/B3pN7+7SFEuDCOKI
	+0NQ3UFQctmfyKIOqFTrAbOSw/Qv7/Ofabkw7K9/VlQGYCRAsmi4ooe246KaU9eqLzfe
	BniIKWzk564AGKNgPSyQv0ky3OSuCWwqE7ZtJX1xK5NZDdLVJKe1raeWRzxZEfddoOg1
	Qo0buvqjIANtELzND9UBB6FZxzJVApky7vVaekPPZOA2J0PRgGvnUXBd0aVrmsIx5OyA
	vjA694yE5dNesL2JT7EaQYdrZibGRDmWS9Ezt92Q+Tq4mHmvC1KaEUxx7zwVgzYgLW1a
	O+Lw==
X-Gm-Message-State: AJaThX7CX+incGGetEZjE5K7PdQ8JNwcEKicaoMv3ZROJ6QeuTGI4sP/
	OrWVM/pj0Nw5OA/gCzImX4AYGa2OeFyLodbclQ8=
X-Received: by 10.28.97.194 with SMTP id v185mr212813wmb.21.1511888116426;
	Tue, 28 Nov 2017 08:55:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.165.153 with HTTP; Tue, 28 Nov 2017 08:55:15 -0800 (PST)
In-Reply-To: <20171125151610.20547-2-ehabkost@redhat.com>
References: <20171125151610.20547-1-ehabkost@redhat.com>
	<20171125151610.20547-2-ehabkost@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 28 Nov 2017 17:55:15 +0100
Message-ID: <CAJ+F1CJRkXNnU+NK93vvSg806=vUBwxx9KGLGoJ_XBQFi+-Nfw@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/6] machine: Replace
 has_dynamic_sysbus with list of allowed devices
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
	Thomas Huth <thuth@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FR1tsSrIaMva

Hi

On Sat, Nov 25, 2017 at 4:16 PM, Eduardo Habkost <ehabkost@redhat.com> wrot=
e:
> The existing has_dynamic_sysbus flag makes the machine accept
> every user-creatable sysbus device type on the command-line.
> Replace it with a list of allowed device types, so machines can
> easily accept some sysbus devices while rejecting others.
>
> To keep exactly the same behavior as before, the existing
> has_dynamic_sysbus=3Dtrue assignments are replaced with a
> TYPE_SYS_BUS_DEVICE entry on the allowed list.  Other patches
> will replace the TYPE_SYS_BUS_DEVICE entries with more specific
> lists of devices.
>
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

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

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
>
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 156b16f7a6..041bc08971 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -76,6 +76,9 @@ void machine_set_cpu_numa_node(MachineState *machine,
>                                 const CpuInstanceProperties *props,
>                                 Error **errp);
>
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

cosmetic: why do you not leave a space between * and TODO ? (you did
that repeatedly)

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
>
> -static void error_on_sysbus_device(SysBusDevice *sbdev, void *opaque)
> +void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char=
 *type)
>  {
> -    error_report("Option '-device %s' cannot be handled by this machine"=
,
> -                 object_class_get_name(object_get_class(OBJECT(sbdev))))=
;
> -    exit(1);
> +    strList *item =3D g_new0(strList, 1);
> +
> +    item->value =3D g_strdup(type);
> +    item->next =3D mc->allowed_dynamic_sysbus_devices;
> +    mc->allowed_dynamic_sysbus_devices =3D item;
>  }
>
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
>
> -    if (mc->has_dynamic_sysbus) {
> -        /* Our machine can handle dynamic sysbus devices, we're all good=
 */
> -        return;
> +    for (wl =3D mc->allowed_dynamic_sysbus_devices;
> +         !allowed && wl;
> +         wl =3D wl->next) {
> +        allowed |=3D !!object_dynamic_cast(OBJECT(sbdev), wl->value);
>      }
>
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
>
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
>
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
>
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
>
> -    mc->has_dynamic_sysbus =3D true;
> +    /*
> +     * Emulate old mc->has_dynamic_sysbus=3Dtrue assignment
> +     *
> +     *TODO: add only Xen devices to the list
> +     */
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
>  }
>
>  int xen_be_register(const char *type, struct XenDevOps *ops)
> --
> 2.13.6
>
>



--=20
Marc-Andr=C3=A9 Lureau
