Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7294988wrx;
        Thu, 7 Mar 2019 07:51:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzQttQNMcFNn/u5Gzb6UoHRXvq7LeOZxXrNd5jlh9qyhx2CWC9QdqEn1RPN2NC41Z8hDd1x
X-Received: by 2002:a81:3096:: with SMTP id w144mr10561390yww.369.1551973875623;
        Thu, 07 Mar 2019 07:51:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551973875; cv=none;
        d=google.com; s=arc-20160816;
        b=zD3VD4IBvaJgHTFgHVN3r3vRzsPrSG/qvaIBiSyP1bOnAeWAqna4Cxyr2O73UOI1S1
         EaiFpnhFT/VSrUfvl2XMNzvm0s6jjH/9oO9EoCvmhtlXSWEGGad3E5IzB+wNC4G7mnZT
         qp24EKkE+GxZo0TrhV/vqzUNXYr7C4l5kj7Knfj94IGh5ZaSb9G5HSwOHq7+DDtgfyMN
         XSutJyw1asP4U0ODJoIAySbqcR3EcM4rW86WinFik0zCiQ9qN2US7I3ZfBiiAuhkNTan
         SZnr+0Eya5z3ioq4zQwLgoKPVOq9GRJXty4NoMF7+fQJvFA26Nzi9pZqobgZ+P0UvbLq
         IEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=HmY0GDboJ/QAyHLhCW3xzepcSOZyO1cH4491+RfpqY8=;
        b=WuMspmnru7w88MM2qXwMCGz5/smhNcqrRQJwyJGtc2Mhpz4CJ2e9/vtBVt18jPsO/0
         ry/B7z/JNleB5KQAwFlELR8AQdFYs0OM1z0+GncfwkrH4SdT6lT77zR5PmILq5VGihNF
         G/T75UhrLfSFIIDNSNKLWvBjSgZ0lDfk6UR9HSFbVGZGlUmsE0eTffaqgF2wKljpTZz0
         ajgSqPFskUexZS6aZvsl6U8ofm5bAuO7fQSvSYWYhexQQKx6C6lSslYZxi7EqMSbrfry
         FbmJRYaDa5Vyc7Q6wpk6lci1VH6/SvvDudH9RPGQHd7pT7zOTzbAFG5jvsDyb6BB4ALR
         Mfig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si2879007ybp.313.2019.03.07.07.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 07:51:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1vIg-0008Ku-Vd
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 10:51:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1h1uq6-0007pD-Oc
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 10:21:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1h1uq4-0002Mj-Sj
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 10:21:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45480)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1h1uq4-0002If-IR; Thu, 07 Mar 2019 10:21:40 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6BF06C064279;
	Thu,  7 Mar 2019 15:21:38 +0000 (UTC)
Received: from [10.36.116.238] (ovpn-116-238.ams2.redhat.com [10.36.116.238])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B3641001E84;
	Thu,  7 Mar 2019 15:21:07 +0000 (UTC)
To: Auger Eric <eric.auger@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, shameerali.kolothum.thodi@huawei.com,
	imammedo@redhat.com, pbonzini@redhat.com, ehabkost@redhat.com,
	richard.henderson@linaro.org, sbhat@linux.ibm.com
References: <20190307090639.8261-1-eric.auger@redhat.com>
	<d36618f5-4dc4-f4a2-2cb3-9a689cb3f771@redhat.com>
	<8db3bb89-6b7f-fe6b-1ba5-3263da3d0528@redhat.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
	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
	SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <3c64370f-1e91-70e0-6f7e-ce0a3c1175da@redhat.com>
Date: Thu, 7 Mar 2019 16:21:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <8db3bb89-6b7f-fe6b-1ba5-3263da3d0528@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 07 Mar 2019 15:21:38 +0000 (UTC)
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
X-TUID: DNHx2soVNBl4

On 07.03.19 16:15, Auger Eric wrote:
> Hi Philippe, Eduardo,
>=20
> On 3/7/19 11:56 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Hi Eric, Eduardo,
>>
>> On 3/7/19 10:06 AM, Eric Auger wrote:
>>> As NVDIMM support is looming for ARM and SPAPR, let's
>>> move the acpi_nvdimm_state to the generic machine struct
>>> instead of duplicating the same code in several machines.
>>> It is also renamed into nvdimms_state.
>>>
>>> nvdimm and nvdimm-persistence become generic machine options.
>>> We also add a description for those options.
>>>
>>> We also remove the nvdimms_state.is_enabled initialization to
>>> false as objects are guaranteed to be zero initialized.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>>>
>>> ---
>>>
>>> v1 -> v2:
>>> - s/acpi_nvdimm_state/nvdimms_state
>>> - remove ms->nvdimms_state.is_enabled initialization to false.
>>> ---
>>>  hw/core/machine.c        | 55 ++++++++++++++++++++++++++++++++++++++=
+
>>>  hw/i386/acpi-build.c     |  6 ++---
>>>  hw/i386/pc.c             | 56 +++-----------------------------------=
--
>>>  hw/i386/pc_piix.c        |  4 +--
>>>  hw/i386/pc_q35.c         |  4 +--
>>>  include/hw/boards.h      |  2 ++
>>>  include/hw/i386/pc.h     |  4 ---
>>>  include/hw/mem/pc-dimm.h |  1 -
>>>  8 files changed, 68 insertions(+), 64 deletions(-)
>>>
>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>> index 766ca5899d..21a7209246 100644
>>> --- a/hw/core/machine.c
>>> +++ b/hw/core/machine.c
>>> @@ -481,6 +481,47 @@ static void machine_set_memory_encryption(Object=
 *obj, const char *value,
>>>      ms->memory_encryption =3D g_strdup(value);
>>>  }
>>> =20
>>> +static bool machine_get_nvdimm(Object *obj, Error **errp)
>>> +{
>>> +    MachineState *ms =3D MACHINE(obj);
>>> +
>>> +    return ms->nvdimms_state.is_enabled;
>>> +}
>>> +
>>> +static void machine_set_nvdimm(Object *obj, bool value, Error **errp=
)
>>> +{
>>> +    MachineState *ms =3D MACHINE(obj);
>>> +
>>> +    ms->nvdimms_state.is_enabled =3D value;
>>> +}
>>> +
>>> +static char *machine_get_nvdimm_persistence(Object *obj, Error **err=
p)
>>> +{
>>> +    MachineState *ms =3D MACHINE(obj);
>>> +
>>> +    return g_strdup(ms->nvdimms_state.persistence_string);
>>> +}
>>> +
>>> +static void machine_set_nvdimm_persistence(Object *obj, const char *=
value,
>>> +                                               Error **errp)
>>> +{
>>> +    MachineState *ms =3D MACHINE(obj);
>>> +    AcpiNVDIMMState *nvdimms_state =3D &ms->nvdimms_state;
>>> +
>>> +    if (strcmp(value, "cpu") =3D=3D 0)
>>> +        nvdimms_state->persistence =3D 3;
>>> +    else if (strcmp(value, "mem-ctrl") =3D=3D 0)
>>> +        nvdimms_state->persistence =3D 2;
>>> +    else {
>>> +        error_setg(errp, "-machine nvdimm-persistence=3D%s: unsuppor=
ted option",
>>> +                   value);
>>> +        return;
>>> +    }
>>> +
>>> +    g_free(nvdimms_state->persistence_string);
>>> +    nvdimms_state->persistence_string =3D g_strdup(value);
>>> +}
>>> +
>>>  void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const =
char *type)
>>>  {
>>>      strList *item =3D g_new0(strList, 1);
>>> @@ -765,6 +806,20 @@ static void machine_class_init(ObjectClass *oc, =
void *data)
>>>          &error_abort);
>>>      object_class_property_set_description(oc, "memory-encryption",
>>>          "Set memory encryption object to use", &error_abort);
>>> +
>>> +    object_class_property_add_bool(oc, "nvdimm",
>>> +        machine_get_nvdimm, machine_set_nvdimm, &error_abort);
>>> +    object_class_property_set_description(oc, "nvdimm",
>>> +                                         "Set on/off to enable/disab=
le NVDIMM "
>>> +                                         "instantiation", NULL);
>>> +
>>> +    object_class_property_add_str(oc, "nvdimm-persistence",
>>> +                                  machine_get_nvdimm_persistence,
>>> +                                  machine_set_nvdimm_persistence, &e=
rror_abort);
>>> +    object_class_property_set_description(oc, "nvdimm-persistence",
>>> +                                          "Set NVDIMM persistence"
>>> +                                          "Valid values are cpu and =
mem-ctrl",
>>> +                                          NULL);
>>>  }
>>> =20
>>>  static void machine_class_base_init(ObjectClass *oc, void *data)
>>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>>> index 9ecc96dcc7..2d7d46fe50 100644
>>> --- a/hw/i386/acpi-build.c
>>> +++ b/hw/i386/acpi-build.c
>>> @@ -1867,7 +1867,7 @@ build_dsdt(GArray *table_data, BIOSLinker *link=
er,
>>>              aml_append(scope, method);
>>>          }
>>> =20
>>> -        if (pcms->acpi_nvdimm_state.is_enabled) {
>>> +        if (machine->nvdimms_state.is_enabled) {
>>>              method =3D aml_method("_E04", 0, AML_NOTSERIALIZED);
>>>              aml_append(method, aml_notify(aml_name("\\_SB.NVDR"),
>>>                                            aml_int(0x80)));
>>> @@ -2704,9 +2704,9 @@ void acpi_build(AcpiBuildTables *tables, Machin=
eState *machine)
>>>              build_dmar_q35(tables_blob, tables->linker);
>>>          }
>>>      }
>>> -    if (pcms->acpi_nvdimm_state.is_enabled) {
>>> +    if (machine->nvdimms_state.is_enabled) {
>>>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker=
,
>>> -                          &pcms->acpi_nvdimm_state, machine->ram_slo=
ts);
>>> +                          &machine->nvdimms_state, machine->ram_slot=
s);
>>>      }
>>> =20
>>>      /* Add tables supplied by user (if any) */
>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>> index 42128183e9..cacc4068cf 100644
>>> --- a/hw/i386/pc.c
>>> +++ b/hw/i386/pc.c
>>> @@ -2069,6 +2069,7 @@ static void pc_memory_pre_plug(HotplugHandler *=
hotplug_dev, DeviceState *dev,
>>>  {
>>>      const PCMachineState *pcms =3D PC_MACHINE(hotplug_dev);
>>>      const PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
>>> +    const MachineState *ms =3D MACHINE(hotplug_dev);
>>>      const bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_N=
VDIMM);
>>>      const uint64_t legacy_align =3D TARGET_PAGE_SIZE;
>>> =20
>>> @@ -2083,7 +2084,7 @@ static void pc_memory_pre_plug(HotplugHandler *=
hotplug_dev, DeviceState *dev,
>>>          return;
>>>      }
>>> =20
>>> -    if (is_nvdimm && !pcms->acpi_nvdimm_state.is_enabled) {
>>> +    if (is_nvdimm && !ms->nvdimms_state.is_enabled) {
>>>          error_setg(errp, "nvdimm is not enabled: missing 'nvdimm' in=
 '-M'");
>>>          return;
>>>      }
>>> @@ -2097,6 +2098,7 @@ static void pc_memory_plug(HotplugHandler *hotp=
lug_dev,
>>>  {
>>>      Error *local_err =3D NULL;
>>>      PCMachineState *pcms =3D PC_MACHINE(hotplug_dev);
>>> +    MachineState *ms =3D MACHINE(hotplug_dev);
>>>      bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)=
;
>>> =20
>>>      pc_dimm_plug(PC_DIMM(dev), MACHINE(pcms), &local_err);
>>> @@ -2105,7 +2107,7 @@ static void pc_memory_plug(HotplugHandler *hotp=
lug_dev,
>>>      }
>>> =20
>>>      if (is_nvdimm) {
>>> -        nvdimm_plug(&pcms->acpi_nvdimm_state);
>>> +        nvdimm_plug(&ms->nvdimms_state);
>>>      }
>>> =20
>>>      hotplug_handler_plug(HOTPLUG_HANDLER(pcms->acpi_dev), dev, &erro=
r_abort);
>>> @@ -2546,47 +2548,6 @@ static void pc_machine_set_smm(Object *obj, Vi=
sitor *v, const char *name,
>>>      visit_type_OnOffAuto(v, name, &pcms->smm, errp);
>>>  }
>>> =20
>>> -static bool pc_machine_get_nvdimm(Object *obj, Error **errp)
>>> -{
>>> -    PCMachineState *pcms =3D PC_MACHINE(obj);
>>> -
>>> -    return pcms->acpi_nvdimm_state.is_enabled;
>>> -}
>>> -
>>> -static void pc_machine_set_nvdimm(Object *obj, bool value, Error **e=
rrp)
>>> -{
>>> -    PCMachineState *pcms =3D PC_MACHINE(obj);
>>> -
>>> -    pcms->acpi_nvdimm_state.is_enabled =3D value;
>>> -}
>>> -
>>> -static char *pc_machine_get_nvdimm_persistence(Object *obj, Error **=
errp)
>>> -{
>>> -    PCMachineState *pcms =3D PC_MACHINE(obj);
>>> -
>>> -    return g_strdup(pcms->acpi_nvdimm_state.persistence_string);
>>> -}
>>> -
>>> -static void pc_machine_set_nvdimm_persistence(Object *obj, const cha=
r *value,
>>> -                                               Error **errp)
>>> -{
>>> -    PCMachineState *pcms =3D PC_MACHINE(obj);
>>> -    AcpiNVDIMMState *nvdimm_state =3D &pcms->acpi_nvdimm_state;
>>> -
>>> -    if (strcmp(value, "cpu") =3D=3D 0)
>>> -        nvdimm_state->persistence =3D 3;
>>> -    else if (strcmp(value, "mem-ctrl") =3D=3D 0)
>>> -        nvdimm_state->persistence =3D 2;
>>> -    else {
>>> -        error_setg(errp, "-machine nvdimm-persistence=3D%s: unsuppor=
ted option",
>>> -                   value);
>>> -        return;
>>> -    }
>>> -
>>> -    g_free(nvdimm_state->persistence_string);
>>> -    nvdimm_state->persistence_string =3D g_strdup(value);
>>> -}
>>> -
>>>  static bool pc_machine_get_smbus(Object *obj, Error **errp)
>>>  {
>>>      PCMachineState *pcms =3D PC_MACHINE(obj);
>>> @@ -2636,8 +2597,6 @@ static void pc_machine_initfn(Object *obj)
>>>      pcms->max_ram_below_4g =3D 0; /* use default */
>>>      pcms->smm =3D ON_OFF_AUTO_AUTO;
>>>      pcms->vmport =3D ON_OFF_AUTO_AUTO;
>>> -    /* nvdimm is disabled on default. */
>>> -    pcms->acpi_nvdimm_state.is_enabled =3D false;
>>>      /* acpi build is enabled by default if machine supports it */
>>>      pcms->acpi_build_enabled =3D PC_MACHINE_GET_CLASS(pcms)->has_acp=
i_build;
>>>      pcms->smbus_enabled =3D true;
>>> @@ -2798,13 +2757,6 @@ static void pc_machine_class_init(ObjectClass =
*oc, void *data)
>>>      object_class_property_set_description(oc, PC_MACHINE_VMPORT,
>>>          "Enable vmport (pc & q35)", &error_abort);
>>> =20
>>> -    object_class_property_add_bool(oc, PC_MACHINE_NVDIMM,
>>> -        pc_machine_get_nvdimm, pc_machine_set_nvdimm, &error_abort);
>>> -
>>> -    object_class_property_add_str(oc, PC_MACHINE_NVDIMM_PERSIST,
>>> -        pc_machine_get_nvdimm_persistence,
>>> -        pc_machine_set_nvdimm_persistence, &error_abort);
>>> -
>>>      object_class_property_add_bool(oc, PC_MACHINE_SMBUS,
>>>          pc_machine_get_smbus, pc_machine_set_smbus, &error_abort);
>>> =20
>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>> index 8770ecada9..16ebfc5a5a 100644
>>> --- a/hw/i386/pc_piix.c
>>> +++ b/hw/i386/pc_piix.c
>>> @@ -297,8 +297,8 @@ static void pc_init1(MachineState *machine,
>>>                                   PC_MACHINE_ACPI_DEVICE_PROP, &error=
_abort);
>>>      }
>>> =20
>>> -    if (pcms->acpi_nvdimm_state.is_enabled) {
>>> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
>>> +    if (machine->nvdimms_state.is_enabled) {
>>> +        nvdimm_init_acpi_state(&machine->nvdimms_state, system_io,
>>>                                 pcms->fw_cfg, OBJECT(pcms));
>>>      }
>>>  }
>>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>>> index cfb9043e12..dacaa90611 100644
>>> --- a/hw/i386/pc_q35.c
>>> +++ b/hw/i386/pc_q35.c
>>> @@ -329,8 +329,8 @@ static void pc_q35_init(MachineState *machine)
>>>      pc_vga_init(isa_bus, host_bus);
>>>      pc_nic_init(pcmc, isa_bus, host_bus);
>>> =20
>>> -    if (pcms->acpi_nvdimm_state.is_enabled) {
>>> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
>>> +    if (machine->nvdimms_state.is_enabled) {
>>> +        nvdimm_init_acpi_state(&machine->nvdimms_state, system_io,
>>>                                 pcms->fw_cfg, OBJECT(pcms));
>>>      }
>>>  }
>>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>>> index 9690c71a6d..ccf0c5a69d 100644
>>> --- a/include/hw/boards.h
>>> +++ b/include/hw/boards.h
>>> @@ -8,6 +8,7 @@
>>>  #include "hw/qdev.h"
>>>  #include "qom/object.h"
>>>  #include "qom/cpu.h"
>>> +#include "hw/mem/nvdimm.h"
>>> =20
>>>  /**
>>>   * memory_region_allocate_system_memory - Allocate a board's main me=
mory
>>> @@ -272,6 +273,7 @@ struct MachineState {
>>>      const char *cpu_type;
>>>      AccelState *accelerator;
>>>      CPUArchIdList *possible_cpus;
>>> +    AcpiNVDIMMState nvdimms_state;
>>
>> It looks we are breaking the generic/abstract machine design.
>> You introduce 2 specific concepts here, ACPI and NVDIMM.
> at least this should be renamed NVDIMMState according to last Igor's
> comment.
>>
>> MachineClass tries to be generic, and and still suffer from specific
>> fields inherited from the PC Machine.
>>
>> I'd use an intermediate Memory-related object between Machine and
>> AcpiNVDIMM states.
>>
>> I see there already is DeviceMemoryState.
>>
>> Can AcpiNVDIMMState go there? That would be more acceptable IMHO.
> DeviceMemoryState is also declared in include/hw/boards.h so does it
> hide any details.
>=20
> Not every machine has device memory or irqchip_split either for instanc=
e

device_memory is an abstracted concept that can be theoretically
implemented by any machine. nvdimm is not.

> (ARM virt is a good example). So my understanding is we put in
> MachineState fields that are generic enough to be used by several
> machines and avoid duplication.
>=20
> Eduardo, do you have any objection wrt putting this state in the base
> machine?
>=20
> Thanks
>=20
> Eric


--=20

Thanks,

David / dhildenb
