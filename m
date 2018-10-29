Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4639317wro;
        Mon, 29 Oct 2018 12:40:22 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ed/8j8lrciGXEYc/VUcd0vVa3lFcQ0xVig5o5RUGa5H6p3hNhR+SPuNEzR4Oq2sUao8Lb4
X-Received: by 2002:ac8:22ed:: with SMTP id g42-v6mr14577924qta.105.1540842022721;
        Mon, 29 Oct 2018 12:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540842022; cv=none;
        d=google.com; s=arc-20160816;
        b=Ua4jeXmJqhZDE2nOJ226jtCsMmoRnDXRDnu/e6GO07OHTnT8vjZlBhqv652K6IE7us
         KJqj5KI00WfwkkI5nZ8ZXltb8zXoGx++lKiOEumIIv2ZmclrduWExzxPtDropCQYLRS5
         kalhvp/Na/l4xvj+pO6KXEBFhqnAS1t/vW0qj0kfHkpcH5930OGU8I6McCHd6WJ5dbTz
         woMRlzAVbCnT9cmblGvmrLRalgkqCZ93tT04xvbP3kR0D/D5wNFOAGHOwQd4xROUf3dO
         sOjSSzJIFkdr/BEvv3zO4ecMPPGeqxZ6SNKKnszLIHhAq7luVDfruszJbc8BHtg3WmEl
         va3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=8Bj3/HpZa0sqg7/P5W/hfy4GS6o+bkusS6edIZETvlE=;
        b=KCW96WTQJEBechAWHIbZqo27dBjAzwDkGIg2DrPmw0dpO4gBh7FNDc1BoMQmothzU8
         ag0Za1OrYpkaSdE8SotFs4OY7OXarWYU62geykZgyIbgbxQj8luO3SZnn9wExY3/Xj9z
         TGyYScMaV4oHcZQ6C53Advr3jT0VQElctatm7fMlZBoPRutHH1oZw3mBCsz82Rdd1ega
         V3xGuX0OFBRgJKRFYXvZ+qrslaaA+PnlmKSEj42VgNbDRRdDH/Dgf8ps4hh0nOiiggTy
         Z8q7vSqoma061ELsNUMKWN1Fk9PDtTDhvR6LnLPa5aM4F+L237/+IHcIY5UmPcFKx7cL
         7HSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u27si1054733qtb.176.2018.10.29.12.40.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 12:40:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48505 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHDOg-0006Go-8n
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 15:40:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHDOU-0006Fo-Bl
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 15:40:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHDOQ-0003qv-9D
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 15:40:10 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55482)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gHDOP-0003nV-Uk
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 15:40:06 -0400
Received: by mail-wm1-f68.google.com with SMTP id s10-v6so9467697wmc.5
	for <qemu-arm@nongnu.org>; Mon, 29 Oct 2018 12:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8Bj3/HpZa0sqg7/P5W/hfy4GS6o+bkusS6edIZETvlE=;
	b=GC6LHaJNNWA9osHQ8XOTdqEPwsrNibFffmblEHSvl0mhkbY7rvvJb7x5PpmBR2GWRB
	tKLqnAmfZ/J+zMEhfB2PwFpCV01Q2RJ1ARa7SD648Q3ToGnKFgcdtpbEhEaNulnPVSUw
	emwtYpY1G5GftJDeUWZ0igJxiuPOz3wrqYiiNhEo5y00BltsT1yUUR4IC5qxZRDt6FFp
	cfu/qLGoWMw7UXf3gWfcTKZO5ZVh8A59fsyTgwAtKeojz1sdOGSKQSSe1HoENzv9cJ95
	+xTSJ84C3mJg3urKyDCfLujFfd8FZcMKnxVDNkOX9r0AdjKnEFG/aNIGxgICqVJiTArj
	dVIA==
X-Gm-Message-State: AGRZ1gLQKKCSfHkTPi5zKQyWGRMX1Sn9dCU95k8fIDMxnZjYmKUAfiOe
	/A8SCLCoe6+G5EYCiSKKDXq9Ow==
X-Received: by 2002:a1c:80c4:: with SMTP id
	b187-v6mr3609820wmd.97.1540842002896; 
	Mon, 29 Oct 2018 12:40:02 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.13.138])
	by smtp.gmail.com with ESMTPSA id
	n2-v6sm1748719wrm.36.2018.10.29.12.40.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 12:40:02 -0700 (PDT)
To: Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org
References: <20181029170159.3801-1-sameo@linux.intel.com>
	<20181029170159.3801-14-sameo@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e7cc3caf-3ee6-c9a8-0c2d-482f06a02019@redhat.com>
Date: Mon, 29 Oct 2018 20:40:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181029170159.3801-14-sameo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 13/19] hw: acpi: Export the
 SRAT AML build API
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
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BQRWkyPZkRTZ

On 29/10/18 18:01, Samuel Ortiz wrote:
> From: Yang Zhong <yang.zhong@intel.com>
> 
> The SRAT ACPI table is not x86 specific and will be needed for the
> Hardware-reduced ACPI implementation. So we should export it through the
> architecture independent hw/acpi folder.
> 
> Also, now that the generic build_srat() API is exported, we have to
> rename the ARM static one in order to avoid build time conflicts.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>   hw/acpi/aml-build.c         | 130 ++++++++++++++++++++++++++++++++++++
>   hw/arm/virt-acpi-build.c    |   4 +-
>   hw/i386/acpi-build.c        | 129 -----------------------------------
>   include/hw/acpi/aml-build.h |   3 +
>   4 files changed, 135 insertions(+), 131 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 2110e18799..c3f652a68f 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -22,6 +22,7 @@
>   #include "qemu/osdep.h"
>   #include <glib/gprintf.h>
>   #include "hw/acpi/aml-build.h"
> +#include "hw/mem/memory-device.h"
>   #include "qemu/bswap.h"
>   #include "qemu/bitops.h"
>   #include "sysemu/numa.h"
> @@ -2459,6 +2460,135 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>       numamem->range_length = cpu_to_le64(len);
>   }
>   
> +#define HOLE_640K_START  (640 * KiB)
> +#define HOLE_640K_END   (1 * MiB)
> +
> +void
> +build_srat(GArray *table_data, BIOSLinker *linker,
> +           MachineState *machine, AcpiConfiguration *conf)
> +{
> +    AcpiSystemResourceAffinityTable *srat;
> +    AcpiSratMemoryAffinity *numamem;
> +
> +    int i;
> +    int srat_start, numa_start, slots;
> +    uint64_t mem_len, mem_base, next_base;
> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
> +    const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(machine);
> +    ram_addr_t hotplugabble_address_space_size =
> +        object_property_get_int(OBJECT(machine), MEMORY_DEVICE_REGION_SIZE,
> +                                NULL);
> +
> +    srat_start = table_data->len;
> +
> +    srat = acpi_data_push(table_data, sizeof *srat);
> +    srat->reserved1 = cpu_to_le32(1);
> +
> +    for (i = 0; i < apic_ids->len; i++) {
> +        int node_id = apic_ids->cpus[i].props.node_id;
> +        uint32_t apic_id = apic_ids->cpus[i].arch_id;
> +
> +        if (apic_id < 255) {
> +            AcpiSratProcessorAffinity *core;
> +
> +            core = acpi_data_push(table_data, sizeof *core);
> +            core->type = ACPI_SRAT_PROCESSOR_APIC;
> +            core->length = sizeof(*core);
> +            core->local_apic_id = apic_id;
> +            core->proximity_lo = node_id;
> +            memset(core->proximity_hi, 0, 3);
> +            core->local_sapic_eid = 0;
> +            core->flags = cpu_to_le32(1);
> +        } else {
> +            AcpiSratProcessorX2ApicAffinity *core;
> +
> +            core = acpi_data_push(table_data, sizeof *core);
> +            core->type = ACPI_SRAT_PROCESSOR_x2APIC;
> +            core->length = sizeof(*core);
> +            core->x2apic_id = cpu_to_le32(apic_id);
> +            core->proximity_domain = cpu_to_le32(node_id);
> +            core->flags = cpu_to_le32(1);
> +        }
> +    }
> +
> +
> +    /* the memory map is a bit tricky, it contains at least one hole
> +     * from 640k-1M and possibly another one from 3.5G-4G.
> +     */
> +    next_base = 0;
> +    numa_start = table_data->len;
> +
> +    for (i = 1; i < conf->numa_nodes + 1; ++i) {
> +        mem_base = next_base;
> +        mem_len = conf->node_mem[i - 1];
> +        next_base = mem_base + mem_len;
> +
> +        /* Cut out the 640K hole */

It seems we are now using x86 specific code for a supposed arch agnostic 
file. I'm not very comfortable with this change.

> +        if (mem_base <= HOLE_640K_START &&
> +            next_base > HOLE_640K_START) {
> +            mem_len -= next_base - HOLE_640K_START;
> +            if (mem_len > 0) {
> +                numamem = acpi_data_push(table_data, sizeof *numamem);
> +                build_srat_memory(numamem, mem_base, mem_len, i - 1,
> +                                  MEM_AFFINITY_ENABLED);
> +            }
> +
> +            /* Check for the rare case: 640K < RAM < 1M */
> +            if (next_base <= HOLE_640K_END) {
> +                next_base = HOLE_640K_END;
> +                continue;
> +            }
> +            mem_base = HOLE_640K_END;
> +            mem_len = next_base - HOLE_640K_END;
> +        }
> +
> +        /* Cut out the ACPI_PCI hole */
> +        if (mem_base <= conf->below_4g_mem_size &&
> +            next_base > conf->below_4g_mem_size) {
> +            mem_len -= next_base - conf->below_4g_mem_size;
> +            if (mem_len > 0) {
> +                numamem = acpi_data_push(table_data, sizeof *numamem);
> +                build_srat_memory(numamem, mem_base, mem_len, i - 1,
> +                                  MEM_AFFINITY_ENABLED);
> +            }
> +            mem_base = 1ULL << 32;
> +            mem_len = next_base - conf->below_4g_mem_size;
> +            next_base = mem_base + mem_len;
> +        }
> +
> +        if (mem_len > 0) {
> +            numamem = acpi_data_push(table_data, sizeof *numamem);
> +            build_srat_memory(numamem, mem_base, mem_len, i - 1,
> +                              MEM_AFFINITY_ENABLED);
> +        }
> +    }
> +    slots = (table_data->len - numa_start) / sizeof *numamem;
> +    for (; slots < conf->numa_nodes + 2; slots++) {
> +        numamem = acpi_data_push(table_data, sizeof *numamem);
> +        build_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
> +    }
> +
> +    /*
> +     * Entry is required for Windows to enable memory hotplug in OS
> +     * and for Linux to enable SWIOTLB when booted with less than
> +     * 4G of RAM. Windows works better if the entry sets proximity
> +     * to the highest NUMA node in the machine.
> +     * Memory devices may override proximity set by this entry,
> +     * providing _PXM method if necessary.
> +     */
> +    if (hotplugabble_address_space_size) {
> +        numamem = acpi_data_push(table_data, sizeof *numamem);
> +        build_srat_memory(numamem, machine->device_memory->base,
> +                          hotplugabble_address_space_size, conf->numa_nodes - 1,
> +                          MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
> +    }
> +
> +    build_header(linker, table_data,
> +                 (void *)(table_data->data + srat_start),
> +                 "SRAT",
> +                 table_data->len - srat_start, 1, NULL, NULL);
> +}
> +
>   /*
>    * ACPI spec 5.2.17 System Locality Distance Information Table
>    * (Revision 2.0 or later)
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f9a60907f1..353aa55357 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -469,7 +469,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>   }
>   
>   static void
> -build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +virt_build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>   {
>       AcpiSystemResourceAffinityTable *srat;
>       AcpiSratProcessorGiccAffinity *core;
> @@ -759,7 +759,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>   
>       if (nb_numa_nodes > 0) {
>           acpi_add_table(table_offsets, tables_blob);
> -        build_srat(tables_blob, tables->linker, vms);
> +        virt_build_srat(tables_blob, tables->linker, vms);
>           if (have_numa_distance) {
>               acpi_add_table(table_offsets, tables_blob);
>               build_slit(tables_blob, tables->linker);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index dfc02a8a85..5932dbe825 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1614,135 +1614,6 @@ build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
>                    (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NULL);
>   }
>   
> -#define HOLE_640K_START  (640 * KiB)
> -#define HOLE_640K_END   (1 * MiB)
> -
> -static void
> -build_srat(GArray *table_data, BIOSLinker *linker,
> -           MachineState *machine, AcpiConfiguration *conf)
> -{
> -    AcpiSystemResourceAffinityTable *srat;
> -    AcpiSratMemoryAffinity *numamem;
> -
> -    int i;
> -    int srat_start, numa_start, slots;
> -    uint64_t mem_len, mem_base, next_base;
> -    MachineClass *mc = MACHINE_GET_CLASS(machine);
> -    const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(machine);
> -    ram_addr_t hotplugabble_address_space_size =
> -        object_property_get_int(OBJECT(machine), MEMORY_DEVICE_REGION_SIZE,
> -                                NULL);
> -
> -    srat_start = table_data->len;
> -
> -    srat = acpi_data_push(table_data, sizeof *srat);
> -    srat->reserved1 = cpu_to_le32(1);
> -
> -    for (i = 0; i < apic_ids->len; i++) {
> -        int node_id = apic_ids->cpus[i].props.node_id;
> -        uint32_t apic_id = apic_ids->cpus[i].arch_id;
> -
> -        if (apic_id < 255) {
> -            AcpiSratProcessorAffinity *core;
> -
> -            core = acpi_data_push(table_data, sizeof *core);
> -            core->type = ACPI_SRAT_PROCESSOR_APIC;
> -            core->length = sizeof(*core);
> -            core->local_apic_id = apic_id;
> -            core->proximity_lo = node_id;
> -            memset(core->proximity_hi, 0, 3);
> -            core->local_sapic_eid = 0;
> -            core->flags = cpu_to_le32(1);
> -        } else {
> -            AcpiSratProcessorX2ApicAffinity *core;
> -
> -            core = acpi_data_push(table_data, sizeof *core);
> -            core->type = ACPI_SRAT_PROCESSOR_x2APIC;
> -            core->length = sizeof(*core);
> -            core->x2apic_id = cpu_to_le32(apic_id);
> -            core->proximity_domain = cpu_to_le32(node_id);
> -            core->flags = cpu_to_le32(1);
> -        }
> -    }
> -
> -
> -    /* the memory map is a bit tricky, it contains at least one hole
> -     * from 640k-1M and possibly another one from 3.5G-4G.
> -     */
> -    next_base = 0;
> -    numa_start = table_data->len;
> -
> -    for (i = 1; i < conf->numa_nodes + 1; ++i) {
> -        mem_base = next_base;
> -        mem_len = conf->node_mem[i - 1];
> -        next_base = mem_base + mem_len;
> -
> -        /* Cut out the 640K hole */
> -        if (mem_base <= HOLE_640K_START &&
> -            next_base > HOLE_640K_START) {
> -            mem_len -= next_base - HOLE_640K_START;
> -            if (mem_len > 0) {
> -                numamem = acpi_data_push(table_data, sizeof *numamem);
> -                build_srat_memory(numamem, mem_base, mem_len, i - 1,
> -                                  MEM_AFFINITY_ENABLED);
> -            }
> -
> -            /* Check for the rare case: 640K < RAM < 1M */
> -            if (next_base <= HOLE_640K_END) {
> -                next_base = HOLE_640K_END;
> -                continue;
> -            }
> -            mem_base = HOLE_640K_END;
> -            mem_len = next_base - HOLE_640K_END;
> -        }
> -
> -        /* Cut out the ACPI_PCI hole */
> -        if (mem_base <= conf->below_4g_mem_size &&
> -            next_base > conf->below_4g_mem_size) {
> -            mem_len -= next_base - conf->below_4g_mem_size;
> -            if (mem_len > 0) {
> -                numamem = acpi_data_push(table_data, sizeof *numamem);
> -                build_srat_memory(numamem, mem_base, mem_len, i - 1,
> -                                  MEM_AFFINITY_ENABLED);
> -            }
> -            mem_base = 1ULL << 32;
> -            mem_len = next_base - conf->below_4g_mem_size;
> -            next_base = mem_base + mem_len;
> -        }
> -
> -        if (mem_len > 0) {
> -            numamem = acpi_data_push(table_data, sizeof *numamem);
> -            build_srat_memory(numamem, mem_base, mem_len, i - 1,
> -                              MEM_AFFINITY_ENABLED);
> -        }
> -    }
> -    slots = (table_data->len - numa_start) / sizeof *numamem;
> -    for (; slots < conf->numa_nodes + 2; slots++) {
> -        numamem = acpi_data_push(table_data, sizeof *numamem);
> -        build_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
> -    }
> -
> -    /*
> -     * Entry is required for Windows to enable memory hotplug in OS
> -     * and for Linux to enable SWIOTLB when booted with less than
> -     * 4G of RAM. Windows works better if the entry sets proximity
> -     * to the highest NUMA node in the machine.
> -     * Memory devices may override proximity set by this entry,
> -     * providing _PXM method if necessary.
> -     */
> -    if (hotplugabble_address_space_size) {
> -        numamem = acpi_data_push(table_data, sizeof *numamem);
> -        build_srat_memory(numamem, machine->device_memory->base,
> -                          hotplugabble_address_space_size, conf->numa_nodes - 1,
> -                          MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
> -    }
> -
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + srat_start),
> -                 "SRAT",
> -                 table_data->len - srat_start, 1, NULL, NULL);
> -}
> -
>   /*
>    * VT-d spec 8.1 DMA Remapping Reporting Structure
>    * (version Oct. 2014 or later)
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 1fabf58df2..654ce2ec26 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -1,6 +1,7 @@
>   #ifndef HW_ACPI_AML_BUILD_H
>   #define HW_ACPI_AML_BUILD_H
>   
> +#include "hw/acpi/acpi.h"
>   #include "hw/acpi/acpi-defs.h"
>   #include "hw/acpi/bios-linker-loader.h"
>   #include "hw/pci/pcie_host.h"
> @@ -438,6 +439,8 @@ void
>   build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
>              const char *oem_id, const char *oem_table_id);
>   
> +void build_srat(GArray *table_data, BIOSLinker *linker,
> +                MachineState *machine, AcpiConfiguration *conf);
>   int
>   build_append_named_dword(GArray *array, const char *name_format, ...)
>   GCC_FMT_ATTR(2, 3);
> 
