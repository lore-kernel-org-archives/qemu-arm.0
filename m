Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8801862wrx;
        Fri, 8 Mar 2019 12:41:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqxUfF+sNcXVkicf2hD8Sfy8JYFB5lRhVktEp8ceK904zNGtX9udSQ2Rbq/v67nUgyoMMF/+
X-Received: by 2002:a25:b787:: with SMTP id n7mr17440553ybh.294.1552077677519;
        Fri, 08 Mar 2019 12:41:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552077677; cv=none;
        d=google.com; s=arc-20160816;
        b=vFp5/B2V2SqEJUqSSz0V8HZn3yrJP3A2Gz5Bw5S/gJy4mFFXgR0nPeMLVtoR35uk1M
         jA8tDgBFv8qzMmVuUeQcuK0a43S77s/bv1Qwus3Ysy8dzFBNkPImvFtiz5oaH+wUqDLO
         51Q1UIAYSl8pTh91Nh/M5QaN1f0CZP9S/I+0yo67qcHb0lAkTd2BZA0pMIYRLGYExi0W
         c5DYxU5pv/IWDDDYhJdVLCpT1+yHk9umApg6+PPnEYkh8SnViGGHZIg7f9DlUdrVT13e
         xR1zLRPMp3LYNq68otD0VHh9swAnFBRS4hFT5IoekAByIiOYo/o9aHMISAZQYrlI0Bql
         SFAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=6Rn9IgpDrNcp0uMwIZzpVREmh0QJ1Qrb0aXFjcYAsBI=;
        b=WKJZXzggnhXdFIiq847xkjpKmdUgc1sJP9sLRGBxAOevGR2WVzCKS70Fp3A6XptIcD
         7QiTQMp6yGuDlqeOfAqVRCZbhoIjF3YGvmbWzty0rMEEZpJEvuhsKRggIbirzz2lGJ+u
         lTJbjTFvTwvqen/G005yLLN849huctEE8EeP13TNWifGyinfPvDqeasW7G3ZGjJeS/Dr
         gWPGFuE/utCKzPcJYpJDsKi0TIk1UhXMbjqIF8NCiUPhXvUF93rrZE51Yo5aFZbDjgwx
         VwH2RpyhDC39ieucUFRD3bJn6HLWtOqtxpMxi8FznZFkdzufgmkOEE65zdHHY+0+5BrD
         5uow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f64si5083013ywf.111.2019.03.08.12.41.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 12:41:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2MIu-0001Xn-RJ
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 15:41:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1h2M7P-0000yB-QI
	for qemu-devel@nongnu.org; Fri, 08 Mar 2019 15:29:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1h2M7N-00072e-VS
	for qemu-devel@nongnu.org; Fri, 08 Mar 2019 15:29:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55628)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1h2M7I-0006oO-Ri; Fri, 08 Mar 2019 15:29:17 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E5773082E07;
	Fri,  8 Mar 2019 20:29:08 +0000 (UTC)
Received: from localhost (ovpn-116-90.gru2.redhat.com [10.97.116.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D49925FCA5;
	Fri,  8 Mar 2019 20:29:01 +0000 (UTC)
Date: Fri, 8 Mar 2019 17:28:59 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190308202859.GH8899@habkost.net>
References: <20190308182053.5487-1-eric.auger@redhat.com>
	<20190308182053.5487-3-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190308182053.5487-3-eric.auger@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 08 Mar 2019 20:29:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 2/2] machine: Move nvdimms state into
 struct MachineState
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sbhat@linux.ibm.com, david@redhat.com,
	richard.henderson@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, imammedo@redhat.com, philmd@redhat.com,
	eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gqOPVJhbsHID

On Fri, Mar 08, 2019 at 07:20:53PM +0100, Eric Auger wrote:
> As NVDIMM support is looming for ARM and SPAPR, let's
> move the acpi_nvdimm_state to the generic machine struct
> instead of duplicating the same code in several machines.
> It is also renamed into nvdimms_state and becomes a pointer.
> 
> nvdimm and nvdimm-persistence become generic machine options.
> They become guarded by a nvdimm_supported machine class member.
> We also add a description for those options.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> 
> ---
> v3 -> v4:
> - s/object_class_property_*/object_property_*
> v2 -> v3
> - nvdimms_state becomes a pointer
> - add machine class nvdimm_supported
> 
> v1 -> v2:
> - s/acpi_nvdimm_state/nvdimms_state
> - remove ms->nvdimms_state.is_enabled initialization to false.
> ---
>  hw/core/machine.c    | 65 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/i386/acpi-build.c |  6 ++--
>  hw/i386/pc.c         | 57 ++++----------------------------------
>  hw/i386/pc_piix.c    |  4 +--
>  hw/i386/pc_q35.c     |  4 +--
>  include/hw/boards.h  |  2 ++
>  include/hw/i386/pc.h |  4 ---
>  7 files changed, 79 insertions(+), 63 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 766ca5899d..743fef2898 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -22,6 +22,7 @@
>  #include "qemu/error-report.h"
>  #include "sysemu/qtest.h"
>  #include "hw/pci/pci.h"
> +#include "hw/mem/nvdimm.h"
>  
>  GlobalProperty hw_compat_3_1[] = {
>      { "pcie-root-port", "x-speed", "2_5" },
> @@ -481,6 +482,47 @@ static void machine_set_memory_encryption(Object *obj, const char *value,
>      ms->memory_encryption = g_strdup(value);
>  }
>  
> +static bool machine_get_nvdimm(Object *obj, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    return ms->nvdimms_state->is_enabled;
> +}
> +
> +static void machine_set_nvdimm(Object *obj, bool value, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    ms->nvdimms_state->is_enabled = value;
> +}
> +
> +static char *machine_get_nvdimm_persistence(Object *obj, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    return g_strdup(ms->nvdimms_state->persistence_string);
> +}
> +
> +static void machine_set_nvdimm_persistence(Object *obj, const char *value,
> +                                           Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +    NVDIMMState *nvdimms_state = ms->nvdimms_state;
> +
> +    if (strcmp(value, "cpu") == 0) {
> +        nvdimms_state->persistence = 3;
> +    } else if (strcmp(value, "mem-ctrl") == 0) {
> +        nvdimms_state->persistence = 2;
> +    } else {
> +        error_setg(errp, "-machine nvdimm-persistence=%s: unsupported option",
> +                   value);
> +        return;
> +    }
> +
> +    g_free(nvdimms_state->persistence_string);
> +    nvdimms_state->persistence_string = g_strdup(value);
> +}
> +
>  void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
>  {
>      strList *item = g_new0(strList, 1);
> @@ -791,6 +833,28 @@ static void machine_initfn(Object *obj)
>      ms->mem_merge = true;
>      ms->enable_graphics = true;
>  
> +    if (mc->nvdimm_supported) {
> +        Object *obj = OBJECT(ms);
> +
> +        ms->nvdimms_state = g_new0(NVDIMMState, 1);
> +        object_property_add_bool(obj, "nvdimm",
> +                                 machine_get_nvdimm, machine_set_nvdimm,
> +                                 &error_abort);
> +        object_property_set_description(obj, "nvdimm",
> +                                        "Set on/off to enable/disable "
> +                                        "NVDIMM instantiation", NULL);
> +
> +        object_property_add_str(obj, "nvdimm-persistence",
> +                                machine_get_nvdimm_persistence,
> +                                machine_set_nvdimm_persistence,
> +                                &error_abort);
> +        object_property_set_description(obj, "nvdimm-persistence",
> +                                        "Set NVDIMM persistence"
> +                                        "Valid values are cpu, mem-ctrl",
> +                                        NULL);
> +    }

It's a pity that we are moving away from class properties back to
instance properties here, but we have no code today that rely on
class properties only.  For example, "-machine pc,help" still
shows the nvdimm properties with this patch.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

I will wait until Monday to queue it on machine-next.


> +
> +
>      /* Register notifier when init is done for sysbus sanity checks */
>      ms->sysbus_notifier.notify = machine_init_notify;
>      qemu_add_machine_init_done_notifier(&ms->sysbus_notifier);
> @@ -809,6 +873,7 @@ static void machine_finalize(Object *obj)
>      g_free(ms->dt_compatible);
>      g_free(ms->firmware);
>      g_free(ms->device_memory);
> +    g_free(ms->nvdimms_state);
>  }
>  
>  bool machine_usb(MachineState *machine)
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 9ecc96dcc7..416da318ae 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1867,7 +1867,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              aml_append(scope, method);
>          }
>  
> -        if (pcms->acpi_nvdimm_state.is_enabled) {
> +        if (machine->nvdimms_state->is_enabled) {
>              method = aml_method("_E04", 0, AML_NOTSERIALIZED);
>              aml_append(method, aml_notify(aml_name("\\_SB.NVDR"),
>                                            aml_int(0x80)));
> @@ -2704,9 +2704,9 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>              build_dmar_q35(tables_blob, tables->linker);
>          }
>      }
> -    if (pcms->acpi_nvdimm_state.is_enabled) {
> +    if (machine->nvdimms_state->is_enabled) {
>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
> -                          &pcms->acpi_nvdimm_state, machine->ram_slots);
> +                          machine->nvdimms_state, machine->ram_slots);
>      }
>  
>      /* Add tables supplied by user (if any) */
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 0338dbe9da..71385cfac9 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -2069,6 +2069,7 @@ static void pc_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>  {
>      const PCMachineState *pcms = PC_MACHINE(hotplug_dev);
>      const PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> +    const MachineState *ms = MACHINE(hotplug_dev);
>      const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
>      const uint64_t legacy_align = TARGET_PAGE_SIZE;
>  
> @@ -2083,7 +2084,7 @@ static void pc_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>          return;
>      }
>  
> -    if (is_nvdimm && !pcms->acpi_nvdimm_state.is_enabled) {
> +    if (is_nvdimm && !ms->nvdimms_state->is_enabled) {
>          error_setg(errp, "nvdimm is not enabled: missing 'nvdimm' in '-M'");
>          return;
>      }
> @@ -2097,6 +2098,7 @@ static void pc_memory_plug(HotplugHandler *hotplug_dev,
>  {
>      Error *local_err = NULL;
>      PCMachineState *pcms = PC_MACHINE(hotplug_dev);
> +    MachineState *ms = MACHINE(hotplug_dev);
>      bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
>  
>      pc_dimm_plug(PC_DIMM(dev), MACHINE(pcms), &local_err);
> @@ -2105,7 +2107,7 @@ static void pc_memory_plug(HotplugHandler *hotplug_dev,
>      }
>  
>      if (is_nvdimm) {
> -        nvdimm_plug(&pcms->acpi_nvdimm_state);
> +        nvdimm_plug(ms->nvdimms_state);
>      }
>  
>      hotplug_handler_plug(HOTPLUG_HANDLER(pcms->acpi_dev), dev, &error_abort);
> @@ -2546,47 +2548,6 @@ static void pc_machine_set_smm(Object *obj, Visitor *v, const char *name,
>      visit_type_OnOffAuto(v, name, &pcms->smm, errp);
>  }
>  
> -static bool pc_machine_get_nvdimm(Object *obj, Error **errp)
> -{
> -    PCMachineState *pcms = PC_MACHINE(obj);
> -
> -    return pcms->acpi_nvdimm_state.is_enabled;
> -}
> -
> -static void pc_machine_set_nvdimm(Object *obj, bool value, Error **errp)
> -{
> -    PCMachineState *pcms = PC_MACHINE(obj);
> -
> -    pcms->acpi_nvdimm_state.is_enabled = value;
> -}
> -
> -static char *pc_machine_get_nvdimm_persistence(Object *obj, Error **errp)
> -{
> -    PCMachineState *pcms = PC_MACHINE(obj);
> -
> -    return g_strdup(pcms->acpi_nvdimm_state.persistence_string);
> -}
> -
> -static void pc_machine_set_nvdimm_persistence(Object *obj, const char *value,
> -                                               Error **errp)
> -{
> -    PCMachineState *pcms = PC_MACHINE(obj);
> -    NVDIMMState *nvdimm_state = &pcms->acpi_nvdimm_state;
> -
> -    if (strcmp(value, "cpu") == 0)
> -        nvdimm_state->persistence = 3;
> -    else if (strcmp(value, "mem-ctrl") == 0)
> -        nvdimm_state->persistence = 2;
> -    else {
> -        error_setg(errp, "-machine nvdimm-persistence=%s: unsupported option",
> -                   value);
> -        return;
> -    }
> -
> -    g_free(nvdimm_state->persistence_string);
> -    nvdimm_state->persistence_string = g_strdup(value);
> -}
> -
>  static bool pc_machine_get_smbus(Object *obj, Error **errp)
>  {
>      PCMachineState *pcms = PC_MACHINE(obj);
> @@ -2636,8 +2597,6 @@ static void pc_machine_initfn(Object *obj)
>      pcms->max_ram_below_4g = 0; /* use default */
>      pcms->smm = ON_OFF_AUTO_AUTO;
>      pcms->vmport = ON_OFF_AUTO_AUTO;
> -    /* nvdimm is disabled on default. */
> -    pcms->acpi_nvdimm_state.is_enabled = false;
>      /* acpi build is enabled by default if machine supports it */
>      pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
>      pcms->smbus_enabled = true;
> @@ -2774,6 +2733,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      hc->unplug = pc_machine_device_unplug_cb;
>      nc->nmi_monitor_handler = x86_nmi;
>      mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
> +    mc->nvdimm_supported = true;
>  
>      object_class_property_add(oc, PC_MACHINE_DEVMEM_REGION_SIZE, "int",
>          pc_machine_get_device_memory_region_size, NULL,
> @@ -2798,13 +2758,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_set_description(oc, PC_MACHINE_VMPORT,
>          "Enable vmport (pc & q35)", &error_abort);
>  
> -    object_class_property_add_bool(oc, PC_MACHINE_NVDIMM,
> -        pc_machine_get_nvdimm, pc_machine_set_nvdimm, &error_abort);
> -
> -    object_class_property_add_str(oc, PC_MACHINE_NVDIMM_PERSIST,
> -        pc_machine_get_nvdimm_persistence,
> -        pc_machine_set_nvdimm_persistence, &error_abort);
> -
>      object_class_property_add_bool(oc, PC_MACHINE_SMBUS,
>          pc_machine_get_smbus, pc_machine_set_smbus, &error_abort);
>  
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 8770ecada9..8ad8e885c6 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -297,8 +297,8 @@ static void pc_init1(MachineState *machine,
>                                   PC_MACHINE_ACPI_DEVICE_PROP, &error_abort);
>      }
>  
> -    if (pcms->acpi_nvdimm_state.is_enabled) {
> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
> +    if (machine->nvdimms_state->is_enabled) {
> +        nvdimm_init_acpi_state(machine->nvdimms_state, system_io,
>                                 pcms->fw_cfg, OBJECT(pcms));
>      }
>  }
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index cfb9043e12..372c6b73be 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -329,8 +329,8 @@ static void pc_q35_init(MachineState *machine)
>      pc_vga_init(isa_bus, host_bus);
>      pc_nic_init(pcmc, isa_bus, host_bus);
>  
> -    if (pcms->acpi_nvdimm_state.is_enabled) {
> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
> +    if (machine->nvdimms_state->is_enabled) {
> +        nvdimm_init_acpi_state(machine->nvdimms_state, system_io,
>                                 pcms->fw_cfg, OBJECT(pcms));
>      }
>  }
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 9690c71a6d..e231860666 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -210,6 +210,7 @@ struct MachineClass {
>                                   int nb_nodes, ram_addr_t size);
>      bool ignore_boot_device_suffixes;
>      bool smbus_no_migration_support;
> +    bool nvdimm_supported;
>  
>      HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
>                                             DeviceState *dev);
> @@ -272,6 +273,7 @@ struct MachineState {
>      const char *cpu_type;
>      AccelState *accelerator;
>      CPUArchIdList *possible_cpus;
> +    struct NVDIMMState *nvdimms_state;
>  };
>  
>  #define DEFINE_MACHINE(namestr, machine_initfn) \
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 94fb620d65..263a6343ff 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -45,8 +45,6 @@ struct PCMachineState {
>      OnOffAuto vmport;
>      OnOffAuto smm;
>  
> -    NVDIMMState acpi_nvdimm_state;
> -
>      bool acpi_build_enabled;
>      bool smbus_enabled;
>      bool sata_enabled;
> @@ -74,8 +72,6 @@ struct PCMachineState {
>  #define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
>  #define PC_MACHINE_VMPORT           "vmport"
>  #define PC_MACHINE_SMM              "smm"
> -#define PC_MACHINE_NVDIMM           "nvdimm"
> -#define PC_MACHINE_NVDIMM_PERSIST   "nvdimm-persistence"
>  #define PC_MACHINE_SMBUS            "smbus"
>  #define PC_MACHINE_SATA             "sata"
>  #define PC_MACHINE_PIT              "pit"
> -- 
> 2.20.1
> 

-- 
Eduardo
