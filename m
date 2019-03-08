Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8676460wrx;
        Fri, 8 Mar 2019 10:16:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqzFku0HXacJc9MDH+sLTc8yum5TbO6O4QcXSCp38gzfvhMRtFU8RfwWbHspZ3ChMDppxL6P
X-Received: by 2002:a81:3a05:: with SMTP id h5mr15960638ywa.282.1552069014995;
        Fri, 08 Mar 2019 10:16:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552069014; cv=none;
        d=google.com; s=arc-20160816;
        b=MEkW+sFR473sqSvL/8LVJP1vyR/GUMyRxlavaApHpS020qLhSUQ3hLgk2A2OzzV+bH
         4CW0NGDSZpP8HcJvmCs16eMQ4mO6LVZszL/05Xuc9IZt+mk+3VcbLt1YmgyuYr6zzCZN
         1EKdv9XIXKkAUhqEVv1XpUkPVfN/qei2IdnRknuMCyQX+2g+Kms0LEGKfCfZLgeeNzR7
         +p6aaZAomhKFFh6JK8NhtvJhAfz0ZRELYw2PU2iOszwmtlAYSUY8/iWBDJXPh9sPbjvS
         NFOUXgjL+QOnL/ajOu5hGwoig5JtxHgVMEswn9GpHitN7UNyxbRm72WhpBo9QZF990y4
         R5Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=74Tcw0WdVwc9QACcFkAEUVYwW0mjC7TXkByLSxLkQEg=;
        b=kHZAceaa5XB579ZDUk8L+bAwwPLqgMkwHJT4r99H4Iahxxt7o1JurDhJIyGR5njB5i
         dc0oPe/y93CIwXvb+8yPz2s9kD+766FAbFl5wqvAQuS9ilGoX0FZHyswH7SRg37tb12E
         lnwfpaV0ovZp8POYaAUNDmqVCruhLW7MxZX9CuW/5UrS8pUcUcP5gVIpIy/5cH/FkY3E
         CyoYQV/L3/n7j1vdm0ee3g9TrP9Hsz802WlbM3ACjHtli+MDmGqNDb9Qfvh13KyNdJ0l
         J9aCaVrhH5VzLD80HQ6bGrQmTC9ECQGMmiTECKKWn8Z2G4unSskxsLTF0OIagSoEGkCo
         uc7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e144si4716510yba.178.2019.03.08.10.16.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 10:16:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2K3C-0007P9-B2
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 13:16:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h2K30-0007Lw-2E
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 13:16:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h2K2y-0004mP-8l
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 13:16:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42615)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h2K2x-0004lC-TZ; Fri, 08 Mar 2019 13:16:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3798EF3FAD;
	Fri,  8 Mar 2019 18:16:38 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E8581B5BC;
	Fri,  8 Mar 2019 18:16:15 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, shameerali.kolothum.thodi@huawei.com,
	imammedo@redhat.com, david@redhat.com, pbonzini@redhat.com,
	ehabkost@redhat.com, richard.henderson@linaro.org, sbhat@linux.ibm.com
References: <20190308152511.10882-1-eric.auger@redhat.com>
	<20190308152511.10882-3-eric.auger@redhat.com>
	<03ee1ae0-2646-e744-709d-431dd1aaa3c2@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4ff97430-5df2-48fd-046b-6363ad6420ca@redhat.com>
Date: Fri, 8 Mar 2019 19:16:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <03ee1ae0-2646-e744-709d-431dd1aaa3c2@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 08 Mar 2019 18:16:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 2/2] machine: Move nvdimms state into
 struct MachineState
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h0xs1o/F/Il2

Hi Philippe,
On 3/8/19 7:02 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> hi Eric,
>=20
> On 3/8/19 4:25 PM, Eric Auger wrote:
>> As NVDIMM support is looming for ARM and SPAPR, let's
>> move the acpi_nvdimm_state to the generic machine struct
>> instead of duplicating the same code in several machines.
>> It is also renamed into nvdimms_state and becomes a pointer.
>>
>> nvdimm and nvdimm-persistence become generic machine options.
>> They become guarded by a nvdimm_supported machine class member.
>> We also add a description for those options.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>>
>> ---
>> v2 -> v3
>> - nvdimms_state becomes a pointer
>> - add machine class nvdimm_supported
>>
>> v1 -> v2:
>> - s/acpi_nvdimm_state/nvdimms_state
>> - remove ms->nvdimms_state.is_enabled initialization to false.
>> ---
>>  hw/core/machine.c    | 65 +++++++++++++++++++++++++++++++++++++++++++=
+
>>  hw/i386/acpi-build.c |  6 ++--
>>  hw/i386/pc.c         | 57 ++++----------------------------------
>>  hw/i386/pc_piix.c    |  4 +--
>>  hw/i386/pc_q35.c     |  4 +--
>>  include/hw/boards.h  |  2 ++
>>  include/hw/i386/pc.h |  4 ---
>>  7 files changed, 79 insertions(+), 63 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 766ca5899d..29a33194a9 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -22,6 +22,7 @@
>>  #include "qemu/error-report.h"
>>  #include "sysemu/qtest.h"
>>  #include "hw/pci/pci.h"
>> +#include "hw/mem/nvdimm.h"
>> =20
>>  GlobalProperty hw_compat_3_1[] =3D {
>>      { "pcie-root-port", "x-speed", "2_5" },
>> @@ -481,6 +482,47 @@ static void machine_set_memory_encryption(Object =
*obj, const char *value,
>>      ms->memory_encryption =3D g_strdup(value);
>>  }
>> =20
>> +static bool machine_get_nvdimm(Object *obj, Error **errp)
>> +{
>> +    MachineState *ms =3D MACHINE(obj);
>> +
>> +    return ms->nvdimms_state->is_enabled;
>> +}
>> +
>> +static void machine_set_nvdimm(Object *obj, bool value, Error **errp)
>> +{
>> +    MachineState *ms =3D MACHINE(obj);
>> +
>> +    ms->nvdimms_state->is_enabled =3D value;
>> +}
>> +
>> +static char *machine_get_nvdimm_persistence(Object *obj, Error **errp=
)
>> +{
>> +    MachineState *ms =3D MACHINE(obj);
>> +
>> +    return g_strdup(ms->nvdimms_state->persistence_string);
>> +}
>> +
>> +static void machine_set_nvdimm_persistence(Object *obj, const char *v=
alue,
>> +                                           Error **errp)
>> +{
>> +    MachineState *ms =3D MACHINE(obj);
>> +    NVDIMMState *nvdimms_state =3D ms->nvdimms_state;
>> +
>> +    if (strcmp(value, "cpu") =3D=3D 0) {
>> +        nvdimms_state->persistence =3D 3;
>> +    } else if (strcmp(value, "mem-ctrl") =3D=3D 0) {
>> +        nvdimms_state->persistence =3D 2;
>> +    } else {
>> +        error_setg(errp, "-machine nvdimm-persistence=3D%s: unsupport=
ed option",
>> +                   value);
>> +        return;
>> +    }
>> +
>> +    g_free(nvdimms_state->persistence_string);
>> +    nvdimms_state->persistence_string =3D g_strdup(value);
>> +}
>> +
>>  void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const c=
har *type)
>>  {
>>      strList *item =3D g_new0(strList, 1);
>> @@ -791,6 +833,28 @@ static void machine_initfn(Object *obj)
>>      ms->mem_merge =3D true;
>>      ms->enable_graphics =3D true;
>> =20
>> +    if (mc->nvdimm_supported) {
>> +        ObjectClass *oc =3D OBJECT_CLASS(mc);
>> +
>> +        ms->nvdimms_state =3D g_new0(NVDIMMState, 1);
>> +        object_class_property_add_bool(oc, "nvdimm",
>> +                                       machine_get_nvdimm, machine_se=
t_nvdimm,
>> +                                       &error_abort);
>> +        object_class_property_set_description(oc, "nvdimm",
>> +                                             "Set on/off to enable/di=
sable "
>> +                                             "NVDIMM instantiation", =
NULL);
>> +
>> +        object_class_property_add_str(oc, "nvdimm-persistence",
>> +                                      machine_get_nvdimm_persistence,
>> +                                      machine_set_nvdimm_persistence,
>> +                                      &error_abort);
>> +        object_class_property_set_description(oc, "nvdimm-persistence=
",
>> +                                             "Set NVDIMM persistence"
>> +                                             "Valid values are cpu, m=
em-ctrl",
>> +                                              NULL);
>> +    }
>> +
>> +
>>      /* Register notifier when init is done for sysbus sanity checks *=
/
>>      ms->sysbus_notifier.notify =3D machine_init_notify;
>>      qemu_add_machine_init_done_notifier(&ms->sysbus_notifier);
>> @@ -809,6 +873,7 @@ static void machine_finalize(Object *obj)
>>      g_free(ms->dt_compatible);
>>      g_free(ms->firmware);
>>      g_free(ms->device_memory);
>> +    g_free(ms->nvdimms_state);
>>  }
>> =20
>>  bool machine_usb(MachineState *machine)
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 9ecc96dcc7..416da318ae 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -1867,7 +1867,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linke=
r,
>>              aml_append(scope, method);
>>          }
>> =20
>> -        if (pcms->acpi_nvdimm_state.is_enabled) {
>> +        if (machine->nvdimms_state->is_enabled) {
>>              method =3D aml_method("_E04", 0, AML_NOTSERIALIZED);
>>              aml_append(method, aml_notify(aml_name("\\_SB.NVDR"),
>>                                            aml_int(0x80)));
>> @@ -2704,9 +2704,9 @@ void acpi_build(AcpiBuildTables *tables, Machine=
State *machine)
>>              build_dmar_q35(tables_blob, tables->linker);
>>          }
>>      }
>> -    if (pcms->acpi_nvdimm_state.is_enabled) {
>> +    if (machine->nvdimms_state->is_enabled) {
>>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
>> -                          &pcms->acpi_nvdimm_state, machine->ram_slot=
s);
>> +                          machine->nvdimms_state, machine->ram_slots)=
;
>>      }
>> =20
>>      /* Add tables supplied by user (if any) */
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 0338dbe9da..71385cfac9 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -2069,6 +2069,7 @@ static void pc_memory_pre_plug(HotplugHandler *h=
otplug_dev, DeviceState *dev,
>>  {
>>      const PCMachineState *pcms =3D PC_MACHINE(hotplug_dev);
>>      const PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
>> +    const MachineState *ms =3D MACHINE(hotplug_dev);
>>      const bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NV=
DIMM);
>>      const uint64_t legacy_align =3D TARGET_PAGE_SIZE;
>> =20
>> @@ -2083,7 +2084,7 @@ static void pc_memory_pre_plug(HotplugHandler *h=
otplug_dev, DeviceState *dev,
>>          return;
>>      }
>> =20
>> -    if (is_nvdimm && !pcms->acpi_nvdimm_state.is_enabled) {
>> +    if (is_nvdimm && !ms->nvdimms_state->is_enabled) {
>>          error_setg(errp, "nvdimm is not enabled: missing 'nvdimm' in =
'-M'");
>>          return;
>>      }
>> @@ -2097,6 +2098,7 @@ static void pc_memory_plug(HotplugHandler *hotpl=
ug_dev,
>>  {
>>      Error *local_err =3D NULL;
>>      PCMachineState *pcms =3D PC_MACHINE(hotplug_dev);
>> +    MachineState *ms =3D MACHINE(hotplug_dev);
>>      bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
>> =20
>>      pc_dimm_plug(PC_DIMM(dev), MACHINE(pcms), &local_err);
>> @@ -2105,7 +2107,7 @@ static void pc_memory_plug(HotplugHandler *hotpl=
ug_dev,
>>      }
>> =20
>>      if (is_nvdimm) {
>> -        nvdimm_plug(&pcms->acpi_nvdimm_state);
>> +        nvdimm_plug(ms->nvdimms_state);
>>      }
>> =20
>>      hotplug_handler_plug(HOTPLUG_HANDLER(pcms->acpi_dev), dev, &error=
_abort);
>> @@ -2546,47 +2548,6 @@ static void pc_machine_set_smm(Object *obj, Vis=
itor *v, const char *name,
>>      visit_type_OnOffAuto(v, name, &pcms->smm, errp);
>>  }
>> =20
>> -static bool pc_machine_get_nvdimm(Object *obj, Error **errp)
>> -{
>> -    PCMachineState *pcms =3D PC_MACHINE(obj);
>> -
>> -    return pcms->acpi_nvdimm_state.is_enabled;
>> -}
>> -
>> -static void pc_machine_set_nvdimm(Object *obj, bool value, Error **er=
rp)
>> -{
>> -    PCMachineState *pcms =3D PC_MACHINE(obj);
>> -
>> -    pcms->acpi_nvdimm_state.is_enabled =3D value;
>> -}
>> -
>> -static char *pc_machine_get_nvdimm_persistence(Object *obj, Error **e=
rrp)
>> -{
>> -    PCMachineState *pcms =3D PC_MACHINE(obj);
>> -
>> -    return g_strdup(pcms->acpi_nvdimm_state.persistence_string);
>> -}
>> -
>> -static void pc_machine_set_nvdimm_persistence(Object *obj, const char=
 *value,
>> -                                               Error **errp)
>> -{
>> -    PCMachineState *pcms =3D PC_MACHINE(obj);
>> -    NVDIMMState *nvdimm_state =3D &pcms->acpi_nvdimm_state;
>> -
>> -    if (strcmp(value, "cpu") =3D=3D 0)
>> -        nvdimm_state->persistence =3D 3;
>> -    else if (strcmp(value, "mem-ctrl") =3D=3D 0)
>> -        nvdimm_state->persistence =3D 2;
>> -    else {
>> -        error_setg(errp, "-machine nvdimm-persistence=3D%s: unsupport=
ed option",
>> -                   value);
>> -        return;
>> -    }
>> -
>> -    g_free(nvdimm_state->persistence_string);
>> -    nvdimm_state->persistence_string =3D g_strdup(value);
>> -}
>> -
>>  static bool pc_machine_get_smbus(Object *obj, Error **errp)
>>  {
>>      PCMachineState *pcms =3D PC_MACHINE(obj);
>> @@ -2636,8 +2597,6 @@ static void pc_machine_initfn(Object *obj)
>>      pcms->max_ram_below_4g =3D 0; /* use default */
>>      pcms->smm =3D ON_OFF_AUTO_AUTO;
>>      pcms->vmport =3D ON_OFF_AUTO_AUTO;
>> -    /* nvdimm is disabled on default. */
>> -    pcms->acpi_nvdimm_state.is_enabled =3D false;
>>      /* acpi build is enabled by default if machine supports it */
>>      pcms->acpi_build_enabled =3D PC_MACHINE_GET_CLASS(pcms)->has_acpi=
_build;
>>      pcms->smbus_enabled =3D true;
>> @@ -2774,6 +2733,7 @@ static void pc_machine_class_init(ObjectClass *o=
c, void *data)
>>      hc->unplug =3D pc_machine_device_unplug_cb;
>>      nc->nmi_monitor_handler =3D x86_nmi;
>>      mc->default_cpu_type =3D TARGET_DEFAULT_CPU_TYPE;
>> +    mc->nvdimm_supported =3D true;
>> =20
>>      object_class_property_add(oc, PC_MACHINE_DEVMEM_REGION_SIZE, "int=
",
>>          pc_machine_get_device_memory_region_size, NULL,
>> @@ -2798,13 +2758,6 @@ static void pc_machine_class_init(ObjectClass *=
oc, void *data)
>>      object_class_property_set_description(oc, PC_MACHINE_VMPORT,
>>          "Enable vmport (pc & q35)", &error_abort);
>> =20
>> -    object_class_property_add_bool(oc, PC_MACHINE_NVDIMM,
>> -        pc_machine_get_nvdimm, pc_machine_set_nvdimm, &error_abort);
>> -
>> -    object_class_property_add_str(oc, PC_MACHINE_NVDIMM_PERSIST,
>> -        pc_machine_get_nvdimm_persistence,
>> -        pc_machine_set_nvdimm_persistence, &error_abort);
>> -
>>      object_class_property_add_bool(oc, PC_MACHINE_SMBUS,
>>          pc_machine_get_smbus, pc_machine_set_smbus, &error_abort);
>> =20
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index 8770ecada9..8ad8e885c6 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -297,8 +297,8 @@ static void pc_init1(MachineState *machine,
>>                                   PC_MACHINE_ACPI_DEVICE_PROP, &error_=
abort);
>>      }
>> =20
>> -    if (pcms->acpi_nvdimm_state.is_enabled) {
>> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
>> +    if (machine->nvdimms_state->is_enabled) {
>> +        nvdimm_init_acpi_state(machine->nvdimms_state, system_io,
>>                                 pcms->fw_cfg, OBJECT(pcms));
>>      }
>>  }
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index cfb9043e12..372c6b73be 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -329,8 +329,8 @@ static void pc_q35_init(MachineState *machine)
>>      pc_vga_init(isa_bus, host_bus);
>>      pc_nic_init(pcmc, isa_bus, host_bus);
>> =20
>> -    if (pcms->acpi_nvdimm_state.is_enabled) {
>> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
>> +    if (machine->nvdimms_state->is_enabled) {
>> +        nvdimm_init_acpi_state(machine->nvdimms_state, system_io,
>>                                 pcms->fw_cfg, OBJECT(pcms));
>>      }
>>  }
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index 9690c71a6d..e231860666 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -210,6 +210,7 @@ struct MachineClass {
>>                                   int nb_nodes, ram_addr_t size);
>>      bool ignore_boot_device_suffixes;
>>      bool smbus_no_migration_support;
>> +    bool nvdimm_supported;
>> =20
>>      HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
>>                                             DeviceState *dev);
>> @@ -272,6 +273,7 @@ struct MachineState {
>>      const char *cpu_type;
>>      AccelState *accelerator;
>>      CPUArchIdList *possible_cpus;
>> +    struct NVDIMMState *nvdimms_state;
>=20
> What about simply 'nvdimm'?
> - it is already part of a state
> - no plural, there is only 1 state
Well actually I followed Igor's suggestion
(https://www.mail-archive.com/qemu-devel@nongnu.org/msg601980.html).

The state contains information about all present NVDIMMs (See
NvdimmFitBuffer comment and "fit: FIT structures for present NVDIMMs").

No strong opinion though.

Thanks

Eric



>=20
>>  };
>> =20
>>  #define DEFINE_MACHINE(namestr, machine_initfn) \
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index 94fb620d65..263a6343ff 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -45,8 +45,6 @@ struct PCMachineState {
>>      OnOffAuto vmport;
>>      OnOffAuto smm;
>> =20
>> -    NVDIMMState acpi_nvdimm_state;
>> -
>>      bool acpi_build_enabled;
>>      bool smbus_enabled;
>>      bool sata_enabled;
>> @@ -74,8 +72,6 @@ struct PCMachineState {
>>  #define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
>>  #define PC_MACHINE_VMPORT           "vmport"
>>  #define PC_MACHINE_SMM              "smm"
>> -#define PC_MACHINE_NVDIMM           "nvdimm"
>> -#define PC_MACHINE_NVDIMM_PERSIST   "nvdimm-persistence"
>>  #define PC_MACHINE_SMBUS            "smbus"
>>  #define PC_MACHINE_SATA             "sata"
>>  #define PC_MACHINE_PIT              "pit"
>>
