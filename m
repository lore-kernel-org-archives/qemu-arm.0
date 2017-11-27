Received: by 10.223.159.82 with SMTP id f18csp1280725wrg;
        Mon, 27 Nov 2017 00:39:47 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYktlKaww8wn/nRktyAsOMSbjd3cXeewUc0MkRIaMPsRdW39YZ+cd4TrJMtqsmB9tD1eWKg
X-Received: by 10.129.23.205 with SMTP id 196mr11364874ywx.332.1511771987860;
        Mon, 27 Nov 2017 00:39:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511771987; cv=none;
        d=google.com; s=arc-20160816;
        b=SKqsUjqxdEppTQpIEkUKYezyxuDc2Ut0pgop/2CIRseqIirEsZXlye+ny3TeaFlxGY
         O5QkHjWjNkeb7TPUnvcsaHkgYtm++EZLas+E6RllkEoB1Ao5lJcz5SistLEmPvCeeRfa
         UI12OYkFkSy/J514u72+9ILxP31UrGMP7dCYolofJMFWfO7yd1JzF08obBYL1JKtFpG1
         26g51waQIEUmi/cDeLbg2kupcSkZ5MKKNXRNUhYBM+kC0Y8dPQhl+IdkVxPm7rSbUZZH
         qsxshKjUeiozZ9Nl1aKQDeOvafuk6+yhbcgny/Vx84eRrKAGUVz5Q54Ch0wDyOXNyida
         Bupg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=zlQMMJSAdID/7CQvX1eFBbKfWWaemMMxRAW9EiZXWSE=;
        b=ub35ggrJWW3QGMW7tvmHn7LMaIYa/RtyQJ8YIVhJjBkwIbYfcKIkBXHS/2cciVOQf7
         v0FjiNM/QvKdbCT+K/fr30gfgbxO/jAwMElS8/jITDAs/Jx+QUwf3X5tonQzqK0eqCTb
         SpEZOHmdEtmVRKYj8xGaYKQ8FUeSVz/Zl4FLTfieu39UbUmOyuUnWOokhcEQpoM/YF2N
         Az7SQBopSH939EijuWraDKZNquszKnlQpQY0fwa+dMhsFYD5GMrmFHnWpRG8o/cjOyGJ
         huYjkB4b6Yr06uBIwIah5/1EQqxV2TLZE32BNmG6EcokktxvgB9ND8VvJ21kBGVlksL3
         6ldg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n77si4907496ywd.194.2017.11.27.00.39.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Nov 2017 00:39:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJEx9-0001B9-8t
	for alex.bennee@linaro.org; Mon, 27 Nov 2017 03:39:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1eJEwx-0001Ah-Fx
	for qemu-arm@nongnu.org; Mon, 27 Nov 2017 03:39:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1eJEwt-0001TB-Rq
	for qemu-arm@nongnu.org; Mon, 27 Nov 2017 03:39:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45428)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel@redhat.com>)
	id 1eJEwt-0001RO-GW; Mon, 27 Nov 2017 03:39:31 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4CBD80F99;
	Mon, 27 Nov 2017 08:39:28 +0000 (UTC)
Received: from mapfelba-osx.local (unknown [10.35.206.37])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6E615EDE5;
	Mon, 27 Nov 2017 08:39:20 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20171125151610.20547-1-ehabkost@redhat.com>
	<20171125151610.20547-2-ehabkost@redhat.com>
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <3a584684-6dc8-f91c-d889-fefef6fd753c@redhat.com>
Date: Mon, 27 Nov 2017 10:39:18 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171125151610.20547-2-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 27 Nov 2017 08:39:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y6qbEp7ktf81

On 25/11/2017 17:16, Eduardo Habkost wrote:
> The existing has_dynamic_sysbus flag makes the machine accept
> every user-creatable sysbus device type on the command-line.
> Replace it with a list of allowed device types, so machines can
> easily accept some sysbus devices while rejecting others.
> 
> To keep exactly the same behavior as before, the existing
> has_dynamic_sysbus=true assignments are replaced with a
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
> ---
> Changes v1 -> v2:
> * Replace "dynamic sysbus whitelist" with "allowed sysbus devices"
> * Simply add TYPE_SYS_BUS_DEVICE to the list on existing
>    has_dynamic_sysbus=true machines, and make machine-types more
>    strict in separate patches
> ---
>   include/hw/boards.h  |  5 ++++-
>   hw/arm/virt.c        |  3 ++-
>   hw/core/machine.c    | 43 +++++++++++++++++++++++++++++--------------
>   hw/i386/pc_q35.c     |  3 ++-
>   hw/ppc/e500plat.c    |  4 +++-
>   hw/ppc/spapr.c       |  3 ++-
>   hw/xen/xen_backend.c |  7 ++++++-
>   7 files changed, 48 insertions(+), 20 deletions(-)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 156b16f7a6..041bc08971 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -76,6 +76,9 @@ void machine_set_cpu_numa_node(MachineState *machine,
>                                  const CpuInstanceProperties *props,
>                                  Error **errp);
>   
> +void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
> +
> +
>   /**
>    * CPUArchId:
>    * @arch_id - architecture-dependent CPU ID of present or possible CPU
> @@ -179,7 +182,6 @@ struct MachineClass {
>           no_floppy:1,
>           no_cdrom:1,
>           no_sdcard:1,
> -        has_dynamic_sysbus:1,
>           pci_allow_0_address:1,
>           legacy_fw_cfg_order:1;
>       int is_default;
> @@ -197,6 +199,7 @@ struct MachineClass {
>       bool ignore_memory_transaction_failures;
>       int numa_mem_align_shift;
>       const char **valid_cpu_types;
> +    strList *allowed_dynamic_sysbus_devices;
>       bool auto_enable_numa_with_memhp;
>       void (*numa_auto_assign_ram)(MachineClass *mc, NodeInfo *nodes,
>                                    int nb_nodes, ram_addr_t size);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9e18b410d7..fa6dc15fcd 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1591,7 +1591,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>        * configuration of the particular instance.
>        */
>       mc->max_cpus = 255;
> -    mc->has_dynamic_sysbus = true;
> +    /*TODO: allow only sysbus devices that really work with this machine */
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
>       mc->block_default_type = IF_VIRTIO;
>       mc->no_cdrom = 1;
>       mc->pci_allow_0_address = true;
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 36c2fb069c..ab2ec292f3 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -335,29 +335,44 @@ static bool machine_get_enforce_config_section(Object *obj, Error **errp)
>       return ms->enforce_config_section;
>   }
>   
> -static void error_on_sysbus_device(SysBusDevice *sbdev, void *opaque)
> +void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
>   {
> -    error_report("Option '-device %s' cannot be handled by this machine",
> -                 object_class_get_name(object_get_class(OBJECT(sbdev))));
> -    exit(1);
> +    strList *item = g_new0(strList, 1);
> +
> +    item->value = g_strdup(type);
> +    item->next = mc->allowed_dynamic_sysbus_devices;
> +    mc->allowed_dynamic_sysbus_devices = item;
>   }
>   
> -static void machine_init_notify(Notifier *notifier, void *data)
> +static void validate_sysbus_device(SysBusDevice *sbdev, void *opaque)
>   {
> -    Object *machine = qdev_get_machine();
> -    ObjectClass *oc = object_get_class(machine);
> -    MachineClass *mc = MACHINE_CLASS(oc);
> +    MachineState *machine = opaque;
> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
> +    bool allowed = false;
> +    strList *wl;
>   
> -    if (mc->has_dynamic_sysbus) {
> -        /* Our machine can handle dynamic sysbus devices, we're all good */
> -        return;
> +    for (wl = mc->allowed_dynamic_sysbus_devices;
> +         !allowed && wl;
> +         wl = wl->next) {
> +        allowed |= !!object_dynamic_cast(OBJECT(sbdev), wl->value);
>       }
>   
> +    if (!allowed) {
> +        error_report("Option '-device %s' cannot be handled by this machine",
> +                     object_class_get_name(object_get_class(OBJECT(sbdev))));
> +        exit(1);
> +    }
> +}
> +
> +static void machine_init_notify(Notifier *notifier, void *data)
> +{
> +    MachineState *machine = MACHINE(qdev_get_machine());
> +
>       /*
> -     * Loop through all dynamically created devices and check whether there
> -     * are sysbus devices among them. If there are, error out.
> +     * Loop through all dynamically created sysbus devices and check if they are
> +     * all allowed.  If a device is not allowed, error out.
>        */
> -    foreach_dynamic_sysbus_device(error_on_sysbus_device, NULL);
> +    foreach_dynamic_sysbus_device(validate_sysbus_device, machine);
>   }
>   
>   HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index d6060043ac..d0b0e5b422 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -299,7 +299,8 @@ static void pc_q35_machine_options(MachineClass *m)
>       m->default_machine_opts = "firmware=bios-256k.bin";
>       m->default_display = "std";
>       m->no_floppy = 1;
> -    m->has_dynamic_sysbus = true;
> +    /*TODO: allow only sysbus devices that really work with this machine */
> +    machine_class_allow_dynamic_sysbus_dev(m, TYPE_SYS_BUS_DEVICE);
>       m->max_cpus = 288;
>   }
>   
> diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
> index e59e80fb9e..438118c29b 100644
> --- a/hw/ppc/e500plat.c
> +++ b/hw/ppc/e500plat.c
> @@ -15,6 +15,7 @@
>   #include "hw/boards.h"
>   #include "sysemu/device_tree.h"
>   #include "sysemu/kvm.h"
> +#include "hw/sysbus.h"
>   #include "hw/pci/pci.h"
>   #include "hw/ppc/openpic.h"
>   #include "kvm_ppc.h"
> @@ -63,7 +64,8 @@ static void e500plat_machine_init(MachineClass *mc)
>       mc->desc = "generic paravirt e500 platform";
>       mc->init = e500plat_init;
>       mc->max_cpus = 32;
> -    mc->has_dynamic_sysbus = true;
> +    /*TODO: allow only sysbus devices that really work with this machine */
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
>       mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("e500v2_v30");
>   }
>   
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index d682f013d4..82040cc5d1 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3603,7 +3603,8 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>       mc->default_boot_order = "";
>       mc->default_ram_size = 512 * M_BYTE;
>       mc->kvm_type = spapr_kvm_type;
> -    mc->has_dynamic_sysbus = true;
> +    /*TODO: allow only sysbus devices that really work with this machine */
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
>       mc->pci_allow_0_address = true;
>       mc->get_hotplug_handler = spapr_get_hotplug_handler;
>       hc->pre_plug = spapr_machine_device_pre_plug;
> diff --git a/hw/xen/xen_backend.c b/hw/xen/xen_backend.c
> index 0f849a26d2..82380ea9ee 100644
> --- a/hw/xen/xen_backend.c
> +++ b/hw/xen/xen_backend.c
> @@ -564,7 +564,12 @@ static void xen_set_dynamic_sysbus(void)
>       ObjectClass *oc = object_get_class(machine);
>       MachineClass *mc = MACHINE_CLASS(oc);
>   
> -    mc->has_dynamic_sysbus = true;
> +    /*
> +     * Emulate old mc->has_dynamic_sysbus=true assignment
> +     *
> +     *TODO: add only Xen devices to the list
> +     */
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
>   }
>   
>   int xen_be_register(const char *type, struct XenDevOps *ops)
> 

Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>

Thanks,
Marcel
