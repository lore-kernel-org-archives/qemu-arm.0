Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7265052wrx;
        Thu, 7 Mar 2019 07:21:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQUzsVoH29irM2crQI7aDyJwXdiH/9Hx6isLVD51rea2uTXF/c/muUFwJbS4hZamHWvUqa
X-Received: by 2002:a25:5f42:: with SMTP id h2mr11680452ybm.277.1551972115777;
        Thu, 07 Mar 2019 07:21:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551972115; cv=none;
        d=google.com; s=arc-20160816;
        b=xUHRpGdEsHsw8fHGSxFKQIDTPgJS1H3okDq1fI2O/3NunfmhHACGNdNrZRkQlMno4I
         MP8Vl8qtWbHh6mpMHY9pd0R3VU7EiLig2NIk/+zVmwYLqeEHsWinfXu9zlvfi1jPndSl
         2847GJ/CcUl24aK9X8Ixb1k1d+YiPwYSCAVIL6cEzZDkJQufwfwfi/bT9yZ+bfddu1Zv
         /Vh8as/C82/o3U/1qJLqQMiYNw0w48QHsm7c9FzEuZvK537U7jVt/Lk8kvUcuLqnxIUQ
         1FGvCvqebUIYv7Q+XYKYqSmziGQDFjJgSdzKxoEfdI+qTiTc57EIzLRGVb/2iNqKQsq9
         pz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=i3TZtcocI57BgjHAsFsjQ+pZVuZXlJb3g64zT4bkdoY=;
        b=1Ips08ridV3dxVBVbPUuEib4KyR+4Qcv6aQtFpXWING8zgP4F/j02W2XI0ltUmqPsi
         P1ZMPZl6r4W6x/OfzNHV0gCnJzAA8pREz/6z6D61Wk6IG0qsoxIO2BhUU6Fwrf4SIP0J
         fL9OZymlbIFTLsnZiAZN+IFaQcZk2/YuD6jDx2BWjvA9L39uR8aBh4SzL2Z97Lcbjtqb
         bwbRnsfPK2nuHzUCpgLZNc88TxgZGzsUteShS755LfZEuV8BXYvYNQMCb3IlXuMcmr1L
         Y620FwlNwAsVuBben0ce7tgMmDXjrgGnz4b7hlQmOFtqSG2JJl6xK8gc01DlFVLArgjy
         4T9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11si2706222ywa.452.2019.03.07.07.21.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 07:21:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1uqJ-0007mQ-4W
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 10:21:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h1ukT-0002vv-UD
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 10:15:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h1ukR-00061I-KL
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 10:15:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33100)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h1ukQ-0005rW-Ay; Thu, 07 Mar 2019 10:15:50 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03C8D307E071;
	Thu,  7 Mar 2019 15:15:37 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DE0E5D788;
	Thu,  7 Mar 2019 15:15:23 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, shameerali.kolothum.thodi@huawei.com,
	imammedo@redhat.com, david@redhat.com, pbonzini@redhat.com,
	ehabkost@redhat.com, richard.henderson@linaro.org, sbhat@linux.ibm.com
References: <20190307090639.8261-1-eric.auger@redhat.com>
	<d36618f5-4dc4-f4a2-2cb3-9a689cb3f771@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8db3bb89-6b7f-fe6b-1ba5-3263da3d0528@redhat.com>
Date: Thu, 7 Mar 2019 16:15:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <d36618f5-4dc4-f4a2-2cb3-9a689cb3f771@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 07 Mar 2019 15:15:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] machine: Move
 acpi_nvdimm_state into struct MachineState
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
X-TUID: q4egW8J0TL2K

Hi Philippe, Eduardo,

On 3/7/19 11:56 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Eric, Eduardo,
>=20
> On 3/7/19 10:06 AM, Eric Auger wrote:
>> As NVDIMM support is looming for ARM and SPAPR, let's
>> move the acpi_nvdimm_state to the generic machine struct
>> instead of duplicating the same code in several machines.
>> It is also renamed into nvdimms_state.
>>
>> nvdimm and nvdimm-persistence become generic machine options.
>> We also add a description for those options.
>>
>> We also remove the nvdimms_state.is_enabled initialization to
>> false as objects are guaranteed to be zero initialized.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - s/acpi_nvdimm_state/nvdimms_state
>> - remove ms->nvdimms_state.is_enabled initialization to false.
>> ---
>>  hw/core/machine.c        | 55 +++++++++++++++++++++++++++++++++++++++
>>  hw/i386/acpi-build.c     |  6 ++---
>>  hw/i386/pc.c             | 56 +++------------------------------------=
-
>>  hw/i386/pc_piix.c        |  4 +--
>>  hw/i386/pc_q35.c         |  4 +--
>>  include/hw/boards.h      |  2 ++
>>  include/hw/i386/pc.h     |  4 ---
>>  include/hw/mem/pc-dimm.h |  1 -
>>  8 files changed, 68 insertions(+), 64 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 766ca5899d..21a7209246 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -481,6 +481,47 @@ static void machine_set_memory_encryption(Object =
*obj, const char *value,
>>      ms->memory_encryption =3D g_strdup(value);
>>  }
>> =20
>> +static bool machine_get_nvdimm(Object *obj, Error **errp)
>> +{
>> +    MachineState *ms =3D MACHINE(obj);
>> +
>> +    return ms->nvdimms_state.is_enabled;
>> +}
>> +
>> +static void machine_set_nvdimm(Object *obj, bool value, Error **errp)
>> +{
>> +    MachineState *ms =3D MACHINE(obj);
>> +
>> +    ms->nvdimms_state.is_enabled =3D value;
>> +}
>> +
>> +static char *machine_get_nvdimm_persistence(Object *obj, Error **errp=
)
>> +{
>> +    MachineState *ms =3D MACHINE(obj);
>> +
>> +    return g_strdup(ms->nvdimms_state.persistence_string);
>> +}
>> +
>> +static void machine_set_nvdimm_persistence(Object *obj, const char *v=
alue,
>> +                                               Error **errp)
>> +{
>> +    MachineState *ms =3D MACHINE(obj);
>> +    AcpiNVDIMMState *nvdimms_state =3D &ms->nvdimms_state;
>> +
>> +    if (strcmp(value, "cpu") =3D=3D 0)
>> +        nvdimms_state->persistence =3D 3;
>> +    else if (strcmp(value, "mem-ctrl") =3D=3D 0)
>> +        nvdimms_state->persistence =3D 2;
>> +    else {
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
>> @@ -765,6 +806,20 @@ static void machine_class_init(ObjectClass *oc, v=
oid *data)
>>          &error_abort);
>>      object_class_property_set_description(oc, "memory-encryption",
>>          "Set memory encryption object to use", &error_abort);
>> +
>> +    object_class_property_add_bool(oc, "nvdimm",
>> +        machine_get_nvdimm, machine_set_nvdimm, &error_abort);
>> +    object_class_property_set_description(oc, "nvdimm",
>> +                                         "Set on/off to enable/disabl=
e NVDIMM "
>> +                                         "instantiation", NULL);
>> +
>> +    object_class_property_add_str(oc, "nvdimm-persistence",
>> +                                  machine_get_nvdimm_persistence,
>> +                                  machine_set_nvdimm_persistence, &er=
ror_abort);
>> +    object_class_property_set_description(oc, "nvdimm-persistence",
>> +                                          "Set NVDIMM persistence"
>> +                                          "Valid values are cpu and m=
em-ctrl",
>> +                                          NULL);
>>  }
>> =20
>>  static void machine_class_base_init(ObjectClass *oc, void *data)
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 9ecc96dcc7..2d7d46fe50 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -1867,7 +1867,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linke=
r,
>>              aml_append(scope, method);
>>          }
>> =20
>> -        if (pcms->acpi_nvdimm_state.is_enabled) {
>> +        if (machine->nvdimms_state.is_enabled) {
>>              method =3D aml_method("_E04", 0, AML_NOTSERIALIZED);
>>              aml_append(method, aml_notify(aml_name("\\_SB.NVDR"),
>>                                            aml_int(0x80)));
>> @@ -2704,9 +2704,9 @@ void acpi_build(AcpiBuildTables *tables, Machine=
State *machine)
>>              build_dmar_q35(tables_blob, tables->linker);
>>          }
>>      }
>> -    if (pcms->acpi_nvdimm_state.is_enabled) {
>> +    if (machine->nvdimms_state.is_enabled) {
>>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
>> -                          &pcms->acpi_nvdimm_state, machine->ram_slot=
s);
>> +                          &machine->nvdimms_state, machine->ram_slots=
);
>>      }
>> =20
>>      /* Add tables supplied by user (if any) */
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 42128183e9..cacc4068cf 100644
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
>> +    if (is_nvdimm && !ms->nvdimms_state.is_enabled) {
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
>> +        nvdimm_plug(&ms->nvdimms_state);
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
>> -    AcpiNVDIMMState *nvdimm_state =3D &pcms->acpi_nvdimm_state;
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
>> @@ -2798,13 +2757,6 @@ static void pc_machine_class_init(ObjectClass *=
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
>> index 8770ecada9..16ebfc5a5a 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -297,8 +297,8 @@ static void pc_init1(MachineState *machine,
>>                                   PC_MACHINE_ACPI_DEVICE_PROP, &error_=
abort);
>>      }
>> =20
>> -    if (pcms->acpi_nvdimm_state.is_enabled) {
>> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
>> +    if (machine->nvdimms_state.is_enabled) {
>> +        nvdimm_init_acpi_state(&machine->nvdimms_state, system_io,
>>                                 pcms->fw_cfg, OBJECT(pcms));
>>      }
>>  }
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index cfb9043e12..dacaa90611 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -329,8 +329,8 @@ static void pc_q35_init(MachineState *machine)
>>      pc_vga_init(isa_bus, host_bus);
>>      pc_nic_init(pcmc, isa_bus, host_bus);
>> =20
>> -    if (pcms->acpi_nvdimm_state.is_enabled) {
>> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
>> +    if (machine->nvdimms_state.is_enabled) {
>> +        nvdimm_init_acpi_state(&machine->nvdimms_state, system_io,
>>                                 pcms->fw_cfg, OBJECT(pcms));
>>      }
>>  }
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index 9690c71a6d..ccf0c5a69d 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -8,6 +8,7 @@
>>  #include "hw/qdev.h"
>>  #include "qom/object.h"
>>  #include "qom/cpu.h"
>> +#include "hw/mem/nvdimm.h"
>> =20
>>  /**
>>   * memory_region_allocate_system_memory - Allocate a board's main mem=
ory
>> @@ -272,6 +273,7 @@ struct MachineState {
>>      const char *cpu_type;
>>      AccelState *accelerator;
>>      CPUArchIdList *possible_cpus;
>> +    AcpiNVDIMMState nvdimms_state;
>=20
> It looks we are breaking the generic/abstract machine design.
> You introduce 2 specific concepts here, ACPI and NVDIMM.
at least this should be renamed NVDIMMState according to last Igor's
comment.
>=20
> MachineClass tries to be generic, and and still suffer from specific
> fields inherited from the PC Machine.
>=20
> I'd use an intermediate Memory-related object between Machine and
> AcpiNVDIMM states.
>=20
> I see there already is DeviceMemoryState.
>=20
> Can AcpiNVDIMMState go there? That would be more acceptable IMHO.
DeviceMemoryState is also declared in include/hw/boards.h so does it
hide any details.

Not every machine has device memory or irqchip_split either for instance
(ARM virt is a good example). So my understanding is we put in
MachineState fields that are generic enough to be used by several
machines and avoid duplication.

Eduardo, do you have any objection wrt putting this state in the base
machine?

Thanks

Eric
>=20
> Eduardo, what do you think (about this patch refactor in general)?
>=20
> Thanks,
>=20
> Phil.
>=20
>>  };
>> =20
>>  #define DEFINE_MACHINE(namestr, machine_initfn) \
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index 54222a202d..263a6343ff 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -45,8 +45,6 @@ struct PCMachineState {
>>      OnOffAuto vmport;
>>      OnOffAuto smm;
>> =20
>> -    AcpiNVDIMMState acpi_nvdimm_state;
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
>> diff --git a/include/hw/mem/pc-dimm.h b/include/hw/mem/pc-dimm.h
>> index 01436b9f50..3e5489d3a1 100644
>> --- a/include/hw/mem/pc-dimm.h
>> +++ b/include/hw/mem/pc-dimm.h
>> @@ -19,7 +19,6 @@
>>  #include "exec/memory.h"
>>  #include "sysemu/hostmem.h"
>>  #include "hw/qdev.h"
>> -#include "hw/boards.h"
>> =20
>>  #define TYPE_PC_DIMM "pc-dimm"
>>  #define PC_DIMM(obj) \
>>
>=20
