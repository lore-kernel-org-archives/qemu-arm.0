Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6997768wrx;
        Thu, 7 Mar 2019 02:56:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqzEGxBWy5Bl341UgYEXo6VoYQeO2xMudKemW0sUfnMXjRFRTiwX2gNHMk6laYsENRVT2DkB
X-Received: by 2002:a0d:ec05:: with SMTP id v5mr9203741ywe.165.1551956210512;
        Thu, 07 Mar 2019 02:56:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551956210; cv=none;
        d=google.com; s=arc-20160816;
        b=ijt82RQXqsVLfS00BXH4x+LVq4VLtXu+pRFzb0QeOqbsogz9WDbivt7+PYX+yvGl5d
         GeBF0gJzi0SpaNSqs5DVbQE4vYLdHH6O0sdYPIs2D6ydfDZhdHQtlGJTDcECkY2sgGHi
         +vOBBKNjxUHLuE0pp/oD8R5Ct9Z9gvD2lVP4Gt4yWggvCKsJE+4Kq9+/mJou9VAgov/N
         8E410mISr/LblKaP10zLw+Ka5HnaR54KPHtZVb0EUMPtZ32jPj9UtOOgGhf/FYjuS99z
         6hNXVDS2ADKNh/RLqXaM8ckl5dCRHbXFBLF1kr3Vr+qZOotgcTUuud/IkgCSQ+5URVsw
         KmOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=azbuYYrFHCpT51otGSk86engcU7N1K0aFm5IQVpBRsI=;
        b=LQqIorZF8Bj9ldlNbq8h+1Eg/fpgH2k68wuLJzeAsHWfwDUHop5alGwxZk0/AGnkHe
         jywOgbj9i9Peff306TOAodqhY65xecp7EROURcFj6ZrTGK8B1Y5QKFkwtbm9sSoI+SMm
         JwWhCk8lKtCHo/g2uFbZrq8ihJxG3uY571f+86aUT81iSGrmnUhVtPJmDRRIAKHNfl9U
         NNAJDS/7rQkkodY5mo0AskJRo4DMbxR3nbYhmcOt94ZEPuw+jfpJWXWBUmM36tqHjjq9
         GkaHUn6d+ROdCqCTOK+WK3e7U2am8Kxj1I5V023j7W2ErL4/cVPf1uqlwUSmQGeBNJ13
         pbKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p139si2614706ywe.130.2019.03.07.02.56.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 02:56:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1qhm-0003gf-1L
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 05:56:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h1qhd-0003gV-Nz
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 05:56:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h1qha-000821-DZ
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 05:56:39 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35862)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1h1qhZ-00081M-Ub
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 05:56:38 -0500
Received: by mail-wr1-f68.google.com with SMTP id o17so16888653wrw.3
	for <qemu-arm@nongnu.org>; Thu, 07 Mar 2019 02:56:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=azbuYYrFHCpT51otGSk86engcU7N1K0aFm5IQVpBRsI=;
	b=LZuktfyaDllf1v/GUyz5myvcgXPbo7cVLUFiEcmHWcHjTee0pZfeWA5vG0hbmIunix
	ONEysJv8zqoOf3UDXMGix3bRGXCn+GCg0+w3WDa3IzfFVqivfP2NYdlhoTHn1t8NyKzP
	MKUsgIVA81JrG4FHoezWaFyiTmezHWI1jap8+XXotDOmR1jaVvHiD5bOakg57Xa3/68m
	rpO0KFVIICsBH8VpW3yqbxJScWdcrZGLx2USpKlDQNvfDcZyfBasv2VKviMwJYV5cRO5
	LeiS7Lqji6l6H53j3ssC54Wg6stVTuZGywIx7eiaAJNMrQzkoF+CxqYXrMzPsRsQ99Lx
	ObmQ==
X-Gm-Message-State: APjAAAWTiUDD5NX92oZuDP7WEM4mCxPdupjQJAFrd8RdUzqlq3xQogz+
	XJYoRDBADa71L3yKWcL3SForBg==
X-Received: by 2002:adf:efc4:: with SMTP id i4mr7022631wrp.42.1551956196738;
	Thu, 07 Mar 2019 02:56:36 -0800 (PST)
Received: from [192.168.1.40] (43.red-88-25-181.staticip.rima-tde.net.
	[88.25.181.43]) by smtp.gmail.com with ESMTPSA id
	a131sm6035593wmh.34.2019.03.07.02.56.35
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Mar 2019 02:56:36 -0800 (PST)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com,
	david@redhat.com, 
	pbonzini@redhat.com, ehabkost@redhat.com, richard.henderson@linaro.org, 
	sbhat@linux.ibm.com
References: <20190307090639.8261-1-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d36618f5-4dc4-f4a2-2cb3-9a689cb3f771@redhat.com>
Date: Thu, 7 Mar 2019 11:56:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190307090639.8261-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
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
X-TUID: uyfcPI/Lz1Nb

Hi Eric, Eduardo,

On 3/7/19 10:06 AM, Eric Auger wrote:
> As NVDIMM support is looming for ARM and SPAPR, let's
> move the acpi_nvdimm_state to the generic machine struct
> instead of duplicating the same code in several machines.
> It is also renamed into nvdimms_state.
> 
> nvdimm and nvdimm-persistence become generic machine options.
> We also add a description for those options.
> 
> We also remove the nvdimms_state.is_enabled initialization to
> false as objects are guaranteed to be zero initialized.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> 
> ---
> 
> v1 -> v2:
> - s/acpi_nvdimm_state/nvdimms_state
> - remove ms->nvdimms_state.is_enabled initialization to false.
> ---
>  hw/core/machine.c        | 55 +++++++++++++++++++++++++++++++++++++++
>  hw/i386/acpi-build.c     |  6 ++---
>  hw/i386/pc.c             | 56 +++-------------------------------------
>  hw/i386/pc_piix.c        |  4 +--
>  hw/i386/pc_q35.c         |  4 +--
>  include/hw/boards.h      |  2 ++
>  include/hw/i386/pc.h     |  4 ---
>  include/hw/mem/pc-dimm.h |  1 -
>  8 files changed, 68 insertions(+), 64 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 766ca5899d..21a7209246 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -481,6 +481,47 @@ static void machine_set_memory_encryption(Object *obj, const char *value,
>      ms->memory_encryption = g_strdup(value);
>  }
>  
> +static bool machine_get_nvdimm(Object *obj, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    return ms->nvdimms_state.is_enabled;
> +}
> +
> +static void machine_set_nvdimm(Object *obj, bool value, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    ms->nvdimms_state.is_enabled = value;
> +}
> +
> +static char *machine_get_nvdimm_persistence(Object *obj, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    return g_strdup(ms->nvdimms_state.persistence_string);
> +}
> +
> +static void machine_set_nvdimm_persistence(Object *obj, const char *value,
> +                                               Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +    AcpiNVDIMMState *nvdimms_state = &ms->nvdimms_state;
> +
> +    if (strcmp(value, "cpu") == 0)
> +        nvdimms_state->persistence = 3;
> +    else if (strcmp(value, "mem-ctrl") == 0)
> +        nvdimms_state->persistence = 2;
> +    else {
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
> @@ -765,6 +806,20 @@ static void machine_class_init(ObjectClass *oc, void *data)
>          &error_abort);
>      object_class_property_set_description(oc, "memory-encryption",
>          "Set memory encryption object to use", &error_abort);
> +
> +    object_class_property_add_bool(oc, "nvdimm",
> +        machine_get_nvdimm, machine_set_nvdimm, &error_abort);
> +    object_class_property_set_description(oc, "nvdimm",
> +                                         "Set on/off to enable/disable NVDIMM "
> +                                         "instantiation", NULL);
> +
> +    object_class_property_add_str(oc, "nvdimm-persistence",
> +                                  machine_get_nvdimm_persistence,
> +                                  machine_set_nvdimm_persistence, &error_abort);
> +    object_class_property_set_description(oc, "nvdimm-persistence",
> +                                          "Set NVDIMM persistence"
> +                                          "Valid values are cpu and mem-ctrl",
> +                                          NULL);
>  }
>  
>  static void machine_class_base_init(ObjectClass *oc, void *data)
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 9ecc96dcc7..2d7d46fe50 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1867,7 +1867,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              aml_append(scope, method);
>          }
>  
> -        if (pcms->acpi_nvdimm_state.is_enabled) {
> +        if (machine->nvdimms_state.is_enabled) {
>              method = aml_method("_E04", 0, AML_NOTSERIALIZED);
>              aml_append(method, aml_notify(aml_name("\\_SB.NVDR"),
>                                            aml_int(0x80)));
> @@ -2704,9 +2704,9 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>              build_dmar_q35(tables_blob, tables->linker);
>          }
>      }
> -    if (pcms->acpi_nvdimm_state.is_enabled) {
> +    if (machine->nvdimms_state.is_enabled) {
>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
> -                          &pcms->acpi_nvdimm_state, machine->ram_slots);
> +                          &machine->nvdimms_state, machine->ram_slots);
>      }
>  
>      /* Add tables supplied by user (if any) */
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 42128183e9..cacc4068cf 100644
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
> +    if (is_nvdimm && !ms->nvdimms_state.is_enabled) {
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
> +        nvdimm_plug(&ms->nvdimms_state);
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
> -    AcpiNVDIMMState *nvdimm_state = &pcms->acpi_nvdimm_state;
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
> @@ -2798,13 +2757,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
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
> index 8770ecada9..16ebfc5a5a 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -297,8 +297,8 @@ static void pc_init1(MachineState *machine,
>                                   PC_MACHINE_ACPI_DEVICE_PROP, &error_abort);
>      }
>  
> -    if (pcms->acpi_nvdimm_state.is_enabled) {
> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
> +    if (machine->nvdimms_state.is_enabled) {
> +        nvdimm_init_acpi_state(&machine->nvdimms_state, system_io,
>                                 pcms->fw_cfg, OBJECT(pcms));
>      }
>  }
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index cfb9043e12..dacaa90611 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -329,8 +329,8 @@ static void pc_q35_init(MachineState *machine)
>      pc_vga_init(isa_bus, host_bus);
>      pc_nic_init(pcmc, isa_bus, host_bus);
>  
> -    if (pcms->acpi_nvdimm_state.is_enabled) {
> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
> +    if (machine->nvdimms_state.is_enabled) {
> +        nvdimm_init_acpi_state(&machine->nvdimms_state, system_io,
>                                 pcms->fw_cfg, OBJECT(pcms));
>      }
>  }
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 9690c71a6d..ccf0c5a69d 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -8,6 +8,7 @@
>  #include "hw/qdev.h"
>  #include "qom/object.h"
>  #include "qom/cpu.h"
> +#include "hw/mem/nvdimm.h"
>  
>  /**
>   * memory_region_allocate_system_memory - Allocate a board's main memory
> @@ -272,6 +273,7 @@ struct MachineState {
>      const char *cpu_type;
>      AccelState *accelerator;
>      CPUArchIdList *possible_cpus;
> +    AcpiNVDIMMState nvdimms_state;

It looks we are breaking the generic/abstract machine design.
You introduce 2 specific concepts here, ACPI and NVDIMM.

MachineClass tries to be generic, and and still suffer from specific
fields inherited from the PC Machine.

I'd use an intermediate Memory-related object between Machine and
AcpiNVDIMM states.

I see there already is DeviceMemoryState.

Can AcpiNVDIMMState go there? That would be more acceptable IMHO.

Eduardo, what do you think (about this patch refactor in general)?

Thanks,

Phil.

>  };
>  
>  #define DEFINE_MACHINE(namestr, machine_initfn) \
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 54222a202d..263a6343ff 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -45,8 +45,6 @@ struct PCMachineState {
>      OnOffAuto vmport;
>      OnOffAuto smm;
>  
> -    AcpiNVDIMMState acpi_nvdimm_state;
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
> diff --git a/include/hw/mem/pc-dimm.h b/include/hw/mem/pc-dimm.h
> index 01436b9f50..3e5489d3a1 100644
> --- a/include/hw/mem/pc-dimm.h
> +++ b/include/hw/mem/pc-dimm.h
> @@ -19,7 +19,6 @@
>  #include "exec/memory.h"
>  #include "sysemu/hostmem.h"
>  #include "hw/qdev.h"
> -#include "hw/boards.h"
>  
>  #define TYPE_PC_DIMM "pc-dimm"
>  #define PC_DIMM(obj) \
> 
