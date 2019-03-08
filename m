Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8821634wrx;
        Fri, 8 Mar 2019 13:05:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwiTE2kmCNyCYGialQI7R0wKFiorK3WzYL8cwaNbtM11tbeKWx4hkHSMCp+1cdTKPAp0FhT
X-Received: by 2002:a25:938f:: with SMTP id a15mr17107456ybm.19.1552079115424;
        Fri, 08 Mar 2019 13:05:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552079115; cv=none;
        d=google.com; s=arc-20160816;
        b=r2Sq8fM00Q891odtg0bdqs5115FX67/l5mMB59SW+gBV8uPCUbIMqvSAFzm3oUoJq1
         QtdjJoJ6vxQbYYYw5Xu81u/1mFL8odfv1GdVSMqscKiCGsWetE0/CKgjULw+ornhEr+o
         /0JN/hGmHo9lpG1bgBIV2ey77HR9YH1Xn5KrSQKhP/l2Sk12WRcXpATV2iG/aGlZiDZp
         DBTvijqgOk3ZHeiYI33fa8vQr/Bx+2LhrHY3YPYo1xLmPWPpMax5sD8jY4syy7o+EwFV
         tHdzlRAsoNoHNkDQCDfheysSb0EvX8P7wNGLFU4ZH3Wvmby/8VIXoMP93FEJfP60itK6
         NpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=zp6aTvZ/Leh9a5CTTLqcCKww14lZeVj847K2yoms0uY=;
        b=B7wAFpGRELZDjI0TduC6f4ejAcqqeCQMcNGIz8d2CrE3S/B6XSN/NTboPVeg1ybLJF
         ZGMKIPvZr7erGRbu373pBL9webt9UweDQuMt+WDf+5URnDLp/DZSat9ASFBDwAmdmqW5
         /8wdvNtpPgPlZDcSjzcMkJOsdf5TrawdwkY4MDjk9Oe81roKxp0xNMVPWlBETv17fTHs
         +hzG+ZaZgKdYbimg3TAHmi0WqEMVPqCaf2Bmhv+OkvxHn2M1OdxbvRdVzdbCj6RqF72r
         m3sJvC8h7lNvtzMAGKStmdoGloGuGDnw2vV9rS8Wgv05AhPuXXdJiQz7sHetC8YvYvyi
         AF4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 192si5206887ywi.360.2019.03.08.13.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 13:05:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49882 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Mg6-0002Tf-Rv
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 16:05:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1h2Mfo-0002SF-67
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 16:04:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1h2Mfm-00061H-97
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 16:04:56 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:32792)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1h2Mfm-0005zN-1m
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 16:04:54 -0500
Received: by mail-wm1-f67.google.com with SMTP id c13so9747956wmb.0
	for <qemu-arm@nongnu.org>; Fri, 08 Mar 2019 13:04:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zp6aTvZ/Leh9a5CTTLqcCKww14lZeVj847K2yoms0uY=;
	b=BOJr9+hOGSUTUlWv6xRQtseOfsHQixdT9xZErhYVTCIxu2/cu29yLbchMaPi3XgXY7
	qOfd2htxGxBUB1JbSun8rwH7ElGeXRlub1GC/xxx4jNrKMtOwdHNuSv++UtS0DD9fac/
	InhLcwZkBhk7ekVXjUrEAo5o9he1qrVVoIWsfgEvXp6e+hW3BqZ7ed4Yf3a8K9tF9Q/M
	980tXYf5lwj8d2d0/5tXEby8gTvVXAafTO70Z9ZnIOjkKEWbNJJRwUEbfnUCsoYSDlmH
	aeWFx+CucuSsSO8AkD/E5EiXp2a1kPzBSt/SONazzpH18vjo/A5H3ykPAq8B3yy6c0iz
	HcWg==
X-Gm-Message-State: APjAAAXO8BibnJvvPZU2HIh2E/wyzQR/ZjYbqz0SiQ+vK8cidCafUltf
	DzOhczQlMbXZqFkUHJeKAEZzYOwptqDEeG8SWZ7wEA==
X-Received: by 2002:a1c:6305:: with SMTP id x5mr8860829wmb.144.1552079091425; 
	Fri, 08 Mar 2019 13:04:51 -0800 (PST)
MIME-Version: 1.0
References: <20190308152511.10882-1-eric.auger@redhat.com>
	<20190308152511.10882-3-eric.auger@redhat.com>
	<03ee1ae0-2646-e744-709d-431dd1aaa3c2@redhat.com>
	<4ff97430-5df2-48fd-046b-6363ad6420ca@redhat.com>
In-Reply-To: <4ff97430-5df2-48fd-046b-6363ad6420ca@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Fri, 8 Mar 2019 22:04:40 +0100
Message-ID: <CAP+75-X+A7UcAtw6M_V1wG4E4+0H7omuXg8iuxT8qtU=FdG4aA@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, sbhat@linux.ibm.com,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	shameerali.kolothum.thodi@huawei.com, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D3ogDhSyYaj1

On Fri, Mar 8, 2019 at 7:16 PM Auger Eric <eric.auger@redhat.com> wrote:
> Hi Philippe,
> On 3/8/19 7:02 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > hi Eric,
> >
> > On 3/8/19 4:25 PM, Eric Auger wrote:
> >> As NVDIMM support is looming for ARM and SPAPR, let's
> >> move the acpi_nvdimm_state to the generic machine struct
> >> instead of duplicating the same code in several machines.
> >> It is also renamed into nvdimms_state and becomes a pointer.
> >>
> >> nvdimm and nvdimm-persistence become generic machine options.
> >> They become guarded by a nvdimm_supported machine class member.
> >> We also add a description for those options.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> >>
> >> ---
> >> v2 -> v3
> >> - nvdimms_state becomes a pointer
> >> - add machine class nvdimm_supported
> >>
> >> v1 -> v2:
> >> - s/acpi_nvdimm_state/nvdimms_state
> >> - remove ms->nvdimms_state.is_enabled initialization to false.
> >> ---
> >>  hw/core/machine.c    | 65 +++++++++++++++++++++++++++++++++++++++++++=
+
> >>  hw/i386/acpi-build.c |  6 ++--
> >>  hw/i386/pc.c         | 57 ++++----------------------------------
> >>  hw/i386/pc_piix.c    |  4 +--
> >>  hw/i386/pc_q35.c     |  4 +--
> >>  include/hw/boards.h  |  2 ++
> >>  include/hw/i386/pc.h |  4 ---
> >>  7 files changed, 79 insertions(+), 63 deletions(-)
> >>
> >> diff --git a/hw/core/machine.c b/hw/core/machine.c
> >> index 766ca5899d..29a33194a9 100644
> >> --- a/hw/core/machine.c
> >> +++ b/hw/core/machine.c
> >> @@ -22,6 +22,7 @@
> >>  #include "qemu/error-report.h"
> >>  #include "sysemu/qtest.h"
> >>  #include "hw/pci/pci.h"
> >> +#include "hw/mem/nvdimm.h"
> >>
> >>  GlobalProperty hw_compat_3_1[] =3D {
> >>      { "pcie-root-port", "x-speed", "2_5" },
> >> @@ -481,6 +482,47 @@ static void machine_set_memory_encryption(Object =
*obj, const char *value,
> >>      ms->memory_encryption =3D g_strdup(value);
> >>  }
> >>
> >> +static bool machine_get_nvdimm(Object *obj, Error **errp)
> >> +{
> >> +    MachineState *ms =3D MACHINE(obj);
> >> +
> >> +    return ms->nvdimms_state->is_enabled;
> >> +}
> >> +
> >> +static void machine_set_nvdimm(Object *obj, bool value, Error **errp)
> >> +{
> >> +    MachineState *ms =3D MACHINE(obj);
> >> +
> >> +    ms->nvdimms_state->is_enabled =3D value;
> >> +}
> >> +
> >> +static char *machine_get_nvdimm_persistence(Object *obj, Error **errp=
)
> >> +{
> >> +    MachineState *ms =3D MACHINE(obj);
> >> +
> >> +    return g_strdup(ms->nvdimms_state->persistence_string);
> >> +}
> >> +
> >> +static void machine_set_nvdimm_persistence(Object *obj, const char *v=
alue,
> >> +                                           Error **errp)
> >> +{
> >> +    MachineState *ms =3D MACHINE(obj);
> >> +    NVDIMMState *nvdimms_state =3D ms->nvdimms_state;
> >> +
> >> +    if (strcmp(value, "cpu") =3D=3D 0) {
> >> +        nvdimms_state->persistence =3D 3;
> >> +    } else if (strcmp(value, "mem-ctrl") =3D=3D 0) {
> >> +        nvdimms_state->persistence =3D 2;
> >> +    } else {
> >> +        error_setg(errp, "-machine nvdimm-persistence=3D%s: unsupport=
ed option",
> >> +                   value);
> >> +        return;
> >> +    }
> >> +
> >> +    g_free(nvdimms_state->persistence_string);
> >> +    nvdimms_state->persistence_string =3D g_strdup(value);
> >> +}
> >> +
> >>  void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const c=
har *type)
> >>  {
> >>      strList *item =3D g_new0(strList, 1);
> >> @@ -791,6 +833,28 @@ static void machine_initfn(Object *obj)
> >>      ms->mem_merge =3D true;
> >>      ms->enable_graphics =3D true;
> >>
> >> +    if (mc->nvdimm_supported) {
> >> +        ObjectClass *oc =3D OBJECT_CLASS(mc);
> >> +
> >> +        ms->nvdimms_state =3D g_new0(NVDIMMState, 1);
> >> +        object_class_property_add_bool(oc, "nvdimm",
> >> +                                       machine_get_nvdimm, machine_se=
t_nvdimm,
> >> +                                       &error_abort);
> >> +        object_class_property_set_description(oc, "nvdimm",
> >> +                                             "Set on/off to enable/di=
sable "
> >> +                                             "NVDIMM instantiation", =
NULL);
> >> +
> >> +        object_class_property_add_str(oc, "nvdimm-persistence",
> >> +                                      machine_get_nvdimm_persistence,
> >> +                                      machine_set_nvdimm_persistence,
> >> +                                      &error_abort);
> >> +        object_class_property_set_description(oc, "nvdimm-persistence=
",
> >> +                                             "Set NVDIMM persistence"
> >> +                                             "Valid values are cpu, m=
em-ctrl",
> >> +                                              NULL);
> >> +    }
> >> +
> >> +
> >>      /* Register notifier when init is done for sysbus sanity checks *=
/
> >>      ms->sysbus_notifier.notify =3D machine_init_notify;
> >>      qemu_add_machine_init_done_notifier(&ms->sysbus_notifier);
> >> @@ -809,6 +873,7 @@ static void machine_finalize(Object *obj)
> >>      g_free(ms->dt_compatible);
> >>      g_free(ms->firmware);
> >>      g_free(ms->device_memory);
> >> +    g_free(ms->nvdimms_state);
> >>  }
> >>
> >>  bool machine_usb(MachineState *machine)
> >> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> >> index 9ecc96dcc7..416da318ae 100644
> >> --- a/hw/i386/acpi-build.c
> >> +++ b/hw/i386/acpi-build.c
> >> @@ -1867,7 +1867,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linke=
r,
> >>              aml_append(scope, method);
> >>          }
> >>
> >> -        if (pcms->acpi_nvdimm_state.is_enabled) {
> >> +        if (machine->nvdimms_state->is_enabled) {
> >>              method =3D aml_method("_E04", 0, AML_NOTSERIALIZED);
> >>              aml_append(method, aml_notify(aml_name("\\_SB.NVDR"),
> >>                                            aml_int(0x80)));
> >> @@ -2704,9 +2704,9 @@ void acpi_build(AcpiBuildTables *tables, Machine=
State *machine)
> >>              build_dmar_q35(tables_blob, tables->linker);
> >>          }
> >>      }
> >> -    if (pcms->acpi_nvdimm_state.is_enabled) {
> >> +    if (machine->nvdimms_state->is_enabled) {
> >>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
> >> -                          &pcms->acpi_nvdimm_state, machine->ram_slot=
s);
> >> +                          machine->nvdimms_state, machine->ram_slots)=
;
> >>      }
> >>
> >>      /* Add tables supplied by user (if any) */
> >> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >> index 0338dbe9da..71385cfac9 100644
> >> --- a/hw/i386/pc.c
> >> +++ b/hw/i386/pc.c
> >> @@ -2069,6 +2069,7 @@ static void pc_memory_pre_plug(HotplugHandler *h=
otplug_dev, DeviceState *dev,
> >>  {
> >>      const PCMachineState *pcms =3D PC_MACHINE(hotplug_dev);
> >>      const PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
> >> +    const MachineState *ms =3D MACHINE(hotplug_dev);
> >>      const bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NV=
DIMM);
> >>      const uint64_t legacy_align =3D TARGET_PAGE_SIZE;
> >>
> >> @@ -2083,7 +2084,7 @@ static void pc_memory_pre_plug(HotplugHandler *h=
otplug_dev, DeviceState *dev,
> >>          return;
> >>      }
> >>
> >> -    if (is_nvdimm && !pcms->acpi_nvdimm_state.is_enabled) {
> >> +    if (is_nvdimm && !ms->nvdimms_state->is_enabled) {
> >>          error_setg(errp, "nvdimm is not enabled: missing 'nvdimm' in =
'-M'");
> >>          return;
> >>      }
> >> @@ -2097,6 +2098,7 @@ static void pc_memory_plug(HotplugHandler *hotpl=
ug_dev,
> >>  {
> >>      Error *local_err =3D NULL;
> >>      PCMachineState *pcms =3D PC_MACHINE(hotplug_dev);
> >> +    MachineState *ms =3D MACHINE(hotplug_dev);
> >>      bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
> >>
> >>      pc_dimm_plug(PC_DIMM(dev), MACHINE(pcms), &local_err);
> >> @@ -2105,7 +2107,7 @@ static void pc_memory_plug(HotplugHandler *hotpl=
ug_dev,
> >>      }
> >>
> >>      if (is_nvdimm) {
> >> -        nvdimm_plug(&pcms->acpi_nvdimm_state);
> >> +        nvdimm_plug(ms->nvdimms_state);
> >>      }
> >>
> >>      hotplug_handler_plug(HOTPLUG_HANDLER(pcms->acpi_dev), dev, &error=
_abort);
> >> @@ -2546,47 +2548,6 @@ static void pc_machine_set_smm(Object *obj, Vis=
itor *v, const char *name,
> >>      visit_type_OnOffAuto(v, name, &pcms->smm, errp);
> >>  }
> >>
> >> -static bool pc_machine_get_nvdimm(Object *obj, Error **errp)
> >> -{
> >> -    PCMachineState *pcms =3D PC_MACHINE(obj);
> >> -
> >> -    return pcms->acpi_nvdimm_state.is_enabled;
> >> -}
> >> -
> >> -static void pc_machine_set_nvdimm(Object *obj, bool value, Error **er=
rp)
> >> -{
> >> -    PCMachineState *pcms =3D PC_MACHINE(obj);
> >> -
> >> -    pcms->acpi_nvdimm_state.is_enabled =3D value;
> >> -}
> >> -
> >> -static char *pc_machine_get_nvdimm_persistence(Object *obj, Error **e=
rrp)
> >> -{
> >> -    PCMachineState *pcms =3D PC_MACHINE(obj);
> >> -
> >> -    return g_strdup(pcms->acpi_nvdimm_state.persistence_string);
> >> -}
> >> -
> >> -static void pc_machine_set_nvdimm_persistence(Object *obj, const char=
 *value,
> >> -                                               Error **errp)
> >> -{
> >> -    PCMachineState *pcms =3D PC_MACHINE(obj);
> >> -    NVDIMMState *nvdimm_state =3D &pcms->acpi_nvdimm_state;
> >> -
> >> -    if (strcmp(value, "cpu") =3D=3D 0)
> >> -        nvdimm_state->persistence =3D 3;
> >> -    else if (strcmp(value, "mem-ctrl") =3D=3D 0)
> >> -        nvdimm_state->persistence =3D 2;
> >> -    else {
> >> -        error_setg(errp, "-machine nvdimm-persistence=3D%s: unsupport=
ed option",
> >> -                   value);
> >> -        return;
> >> -    }
> >> -
> >> -    g_free(nvdimm_state->persistence_string);
> >> -    nvdimm_state->persistence_string =3D g_strdup(value);
> >> -}
> >> -
> >>  static bool pc_machine_get_smbus(Object *obj, Error **errp)
> >>  {
> >>      PCMachineState *pcms =3D PC_MACHINE(obj);
> >> @@ -2636,8 +2597,6 @@ static void pc_machine_initfn(Object *obj)
> >>      pcms->max_ram_below_4g =3D 0; /* use default */
> >>      pcms->smm =3D ON_OFF_AUTO_AUTO;
> >>      pcms->vmport =3D ON_OFF_AUTO_AUTO;
> >> -    /* nvdimm is disabled on default. */
> >> -    pcms->acpi_nvdimm_state.is_enabled =3D false;
> >>      /* acpi build is enabled by default if machine supports it */
> >>      pcms->acpi_build_enabled =3D PC_MACHINE_GET_CLASS(pcms)->has_acpi=
_build;
> >>      pcms->smbus_enabled =3D true;
> >> @@ -2774,6 +2733,7 @@ static void pc_machine_class_init(ObjectClass *o=
c, void *data)
> >>      hc->unplug =3D pc_machine_device_unplug_cb;
> >>      nc->nmi_monitor_handler =3D x86_nmi;
> >>      mc->default_cpu_type =3D TARGET_DEFAULT_CPU_TYPE;
> >> +    mc->nvdimm_supported =3D true;
> >>
> >>      object_class_property_add(oc, PC_MACHINE_DEVMEM_REGION_SIZE, "int=
",
> >>          pc_machine_get_device_memory_region_size, NULL,
> >> @@ -2798,13 +2758,6 @@ static void pc_machine_class_init(ObjectClass *=
oc, void *data)
> >>      object_class_property_set_description(oc, PC_MACHINE_VMPORT,
> >>          "Enable vmport (pc & q35)", &error_abort);
> >>
> >> -    object_class_property_add_bool(oc, PC_MACHINE_NVDIMM,
> >> -        pc_machine_get_nvdimm, pc_machine_set_nvdimm, &error_abort);
> >> -
> >> -    object_class_property_add_str(oc, PC_MACHINE_NVDIMM_PERSIST,
> >> -        pc_machine_get_nvdimm_persistence,
> >> -        pc_machine_set_nvdimm_persistence, &error_abort);
> >> -
> >>      object_class_property_add_bool(oc, PC_MACHINE_SMBUS,
> >>          pc_machine_get_smbus, pc_machine_set_smbus, &error_abort);
> >>
> >> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> >> index 8770ecada9..8ad8e885c6 100644
> >> --- a/hw/i386/pc_piix.c
> >> +++ b/hw/i386/pc_piix.c
> >> @@ -297,8 +297,8 @@ static void pc_init1(MachineState *machine,
> >>                                   PC_MACHINE_ACPI_DEVICE_PROP, &error_=
abort);
> >>      }
> >>
> >> -    if (pcms->acpi_nvdimm_state.is_enabled) {
> >> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
> >> +    if (machine->nvdimms_state->is_enabled) {
> >> +        nvdimm_init_acpi_state(machine->nvdimms_state, system_io,
> >>                                 pcms->fw_cfg, OBJECT(pcms));
> >>      }
> >>  }
> >> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> >> index cfb9043e12..372c6b73be 100644
> >> --- a/hw/i386/pc_q35.c
> >> +++ b/hw/i386/pc_q35.c
> >> @@ -329,8 +329,8 @@ static void pc_q35_init(MachineState *machine)
> >>      pc_vga_init(isa_bus, host_bus);
> >>      pc_nic_init(pcmc, isa_bus, host_bus);
> >>
> >> -    if (pcms->acpi_nvdimm_state.is_enabled) {
> >> -        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
> >> +    if (machine->nvdimms_state->is_enabled) {
> >> +        nvdimm_init_acpi_state(machine->nvdimms_state, system_io,
> >>                                 pcms->fw_cfg, OBJECT(pcms));
> >>      }
> >>  }
> >> diff --git a/include/hw/boards.h b/include/hw/boards.h
> >> index 9690c71a6d..e231860666 100644
> >> --- a/include/hw/boards.h
> >> +++ b/include/hw/boards.h
> >> @@ -210,6 +210,7 @@ struct MachineClass {
> >>                                   int nb_nodes, ram_addr_t size);
> >>      bool ignore_boot_device_suffixes;
> >>      bool smbus_no_migration_support;
> >> +    bool nvdimm_supported;
> >>
> >>      HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
> >>                                             DeviceState *dev);
> >> @@ -272,6 +273,7 @@ struct MachineState {
> >>      const char *cpu_type;
> >>      AccelState *accelerator;
> >>      CPUArchIdList *possible_cpus;
> >> +    struct NVDIMMState *nvdimms_state;
> >
> > What about simply 'nvdimm'?
> > - it is already part of a state
> > - no plural, there is only 1 state
> Well actually I followed Igor's suggestion
> (https://www.mail-archive.com/qemu-devel@nongnu.org/msg601980.html).
>
> The state contains information about all present NVDIMMs (See
> NvdimmFitBuffer comment and "fit: FIT structures for present NVDIMMs").

So 'nvdimms' then :)

Anyway, Igor's call.

> No strong opinion though.
>
> Thanks
>
> Eric
>
>
>
> >
> >>  };
> >>
> >>  #define DEFINE_MACHINE(namestr, machine_initfn) \
> >> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> >> index 94fb620d65..263a6343ff 100644
> >> --- a/include/hw/i386/pc.h
> >> +++ b/include/hw/i386/pc.h
> >> @@ -45,8 +45,6 @@ struct PCMachineState {
> >>      OnOffAuto vmport;
> >>      OnOffAuto smm;
> >>
> >> -    NVDIMMState acpi_nvdimm_state;
> >> -
> >>      bool acpi_build_enabled;
> >>      bool smbus_enabled;
> >>      bool sata_enabled;
> >> @@ -74,8 +72,6 @@ struct PCMachineState {
> >>  #define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
> >>  #define PC_MACHINE_VMPORT           "vmport"
> >>  #define PC_MACHINE_SMM              "smm"
> >> -#define PC_MACHINE_NVDIMM           "nvdimm"
> >> -#define PC_MACHINE_NVDIMM_PERSIST   "nvdimm-persistence"
> >>  #define PC_MACHINE_SMBUS            "smbus"
> >>  #define PC_MACHINE_SATA             "sata"
> >>  #define PC_MACHINE_PIT              "pit"
> >>
