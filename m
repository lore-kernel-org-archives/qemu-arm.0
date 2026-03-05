Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A3AEEF30A
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 06:18:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vy22f-0001pS-FP; Thu, 05 Mar 2026 01:18:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vy22P-0001aZ-Ap
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 01:18:21 -0500
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vy22N-0002Z1-1F
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 01:18:21 -0500
Received: by mail-dl1-x122a.google.com with SMTP id
 a92af1059eb24-126ea4b77adso9922884c88.1
 for <qemu-arm@nongnu.org>; Wed, 04 Mar 2026 22:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772691497; x=1773296297; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ZQtlgKqff6DdL5/dXPrypDS7M/78BbPBSbkt/gWXqc=;
 b=ISRVaL3sI9vRI52rO63rGpBOOrsaqqap2o9OzfmmrajOMUPJ6j/L1ARpAhDC5YnDf/
 vwt5PwaYVjz6LceGF8FOgZ9JbOAS1MhRYfIUpzNjKrotRdbnUGIOFrL3mYzXP+O2c0+s
 zr6rVKxn1xyBb3qDiHPR/icEvDNikbBhQaj4Tf3ET5xvLYdcziW85NxLHakdUbEdi8t3
 i67vQM+LdH10L7xd9OHBPYpIqQFvPBtBhaDVg1JZcBDU4GXOzuA162OC1ry9HpRq+GH3
 86eIWskdmDYg6kapIvrxCP4ErkBRWuILvPMjCtrvpjwGRV2pmvsmHNnW4GWGME14V4N5
 nnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772691497; x=1773296297;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ZQtlgKqff6DdL5/dXPrypDS7M/78BbPBSbkt/gWXqc=;
 b=RsBxkLXxGBZ07WmmX9J4FExGlkpE3sdazG8bECLaWTYoAfhylmAOhDxt1gDPPR8BcI
 2Wcd+f1WmiZT1y4OE02a+A+G/Qh4yg6U9UXggymfdTNe3dWtgMgkBNFiwupGyoBgUUna
 EA59kqdavaBEGaCETGkYSdlnSUR8nhLnVtYoXIUWelMyd4xZ5X7lepKmJJ4oiHS+eYYS
 bysrvFecuAnVtDX/MayM5glCOuH1ZdBTwfxeF2F6bUfCvn1dv1L07WPLQsvdkbF2L6i1
 8Y/YnRVVnNM+bdNsPgcCtQwNdcxMFKCSlcBe0RaEFotF+1IX1LJOjvKe/dgVv1bDfPLL
 qxyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpedDFnZPA0rEbx8klIF/pOqbaBrgUEy7SsoPkYH/H8J2/beWNySCFg2QOMD7qO+3XuDs5/AwtGQ==@nongnu.org
X-Gm-Message-State: AOJu0YyYVZuCX4xH5ZjUW5Smg6gXdvls94wDkZ+RQ5hs60/T3xFvNG1f
 BvmBQC4aKDAk4oVbiz6uAUBfmo+t5rGhSlqvrZJf537ipaLTSQZAALoUQHoMpjbrLVw=
X-Gm-Gg: ATEYQzxWR3SpQfHiS1VdAWFl0TaK+jYMymJ0MQ4BAdbvY84ol3v/Xl64CuhfPkY0Q7r
 P3EJLygVJ2WANj9QoGIi391YGoaZqjrQRhqxrrhRBBXxAoSC2JaPuS2SZ+2Qv+nr7RMbIMTSSst
 SgIDE3rbh9/w+gcBaczXsEe7Mv9eJ/u4663IBpTUk4YnjH1R8VS0BBfKCh2+F1UBgwjN+deqlfH
 kH2s0olirBymMFkhwaqrvUVpNA7GTWopCm1U6ySq/BdaPBToJD40n3dJ7BdgKwU5aYCwCjXz0bA
 V7tpxhqJanajq6lUYgSOL9fGJXM6y7HAiu30I/St+SwNmQA1kBbIwt5ggm2ncmd4+MwlHkVAZ92
 4QcuSzagdfDOk9JBcikYWXt0G9B31DN4XqEGHRbYC+ByZPnU0xU6b5PsZf11G+vXydxuduNf96P
 4r1U0KCul3+d19yA58mZbuat6FUAejmCdl
X-Received: by 2002:a05:7022:ba4:b0:11b:d561:bc10 with SMTP id
 a92af1059eb24-128b70ecbdfmr1950825c88.41.1772691497280; 
 Wed, 04 Mar 2026 22:18:17 -0800 (PST)
Received: from [192.168.0.103] ([191.8.216.93])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be03fc6fcesm10335690eec.1.2026.03.04.22.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 22:18:17 -0800 (PST)
Message-ID: <069dbe3c-6288-4126-b869-e5bb72648064@linaro.org>
Date: Thu, 5 Mar 2026 03:18:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 6/8] hw/acpi: add cache hierarchy to pptt table
To: Alireza Sanaee <alireza.sanaee@huawei.com>, mst@redhat.com,
 qemu-devel@nongnu.org
Cc: anisinha@redhat.com, armbru@redhat.com, berrange@redhat.com,
 dapeng1.mi@linux.intel.com, eric.auger@redhat.com, farman@linux.ibm.com,
 imammedo@redhat.com, jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 linuxarm@huawei.com, maobibo@loongson.cn, mtosatti@redhat.com,
 peter.maydell@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, shannon.zhaosl@gmail.com, zhao1.liu@intel.com
References: <20260220141128.789-1-alireza.sanaee@huawei.com>
 <20260220141128.789-7-alireza.sanaee@huawei.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20260220141128.789-7-alireza.sanaee@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122a;
 envelope-from=gustavo.romero@linaro.org; helo=mail-dl1-x122a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Alireza,

On 2/20/26 11:11, Alireza Sanaee wrote:
> Add cache topology to PPTT table.
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>   hw/acpi/aml-build.c      | 198 +++++++++++++++++++++++++++++++++++++--
>   hw/arm/virt-acpi-build.c |   8 +-
>   include/hw/acpi/cpu.h    |  10 ++
>   3 files changed, 207 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index b75aa2336e..a8de45036c 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -32,6 +32,7 @@
>   #include "hw/pci/pci_bus.h"
>   #include "hw/pci/pci_bridge.h"
>   #include "qemu/cutils.h"
> +#include "hw/core/cpu.h"
>   
>   static GArray *build_alloc_array(void)
>   {
> @@ -2148,6 +2149,102 @@ void build_spcr(GArray *table_data, BIOSLinker *linker,
>       }
>       acpi_table_end(linker, &table);
>   }
> +
> +static void build_cache_nodes(GArray *tbl, CPUCoreCaches *cache,
> +                              uint32_t next_offset)
> +{
> +    const uint8_t node_length = 24;
> +    int start_len = tbl->len;
> +    int val;
> +
> +    build_append_byte(tbl, 1); /* Type 1 - cache */
> +    build_append_byte(tbl, node_length); /* Length */
> +    build_append_int_noprefix(tbl, 0, 2); /* Reserved */
> +    build_append_int_noprefix(tbl, 0x7f, 4); /* Flags */
> +    build_append_int_noprefix(tbl, next_offset, 4); /* Offset of next cache up */
> +    build_append_int_noprefix(tbl, cache->size, 4); /* Size */
> +    build_append_int_noprefix(tbl, cache->sets, 4); /* Number of sets */
> +    build_append_byte(tbl, cache->associativity); /* Associativity */
> +    val = 0x3;
> +    switch (cache->type) {
> +    case INSTRUCTION_CACHE:
> +        val |= (1 << 2); /* Instruction Cache */
> +        break;
> +    case DATA_CACHE:
> +        val |= (0 << 2); /* Data Cache */
> +        break;
> +    case UNIFIED_CACHE:
> +        val |= (3 << 2); /* Unified */
> +        break;
> +    }
> +    build_append_byte(tbl, val); /* Attributes */
> +    build_append_int_noprefix(tbl, cache->linesize, 2); /* Line size */
> +    g_assert(tbl->len == start_len + node_length);
> +}

Please document the ACPI spec version on top of build_cache_nodes() and
align  the comment about the fields. See
build_processor_hierarchy_node(), as an example.

I thought "Cache ID" field was missing and length was wrong (28), but
then I realized that it optional/non-existent on older spec versions.


> +/*
> + * builds caches from the top level (`level_high` parameter) to the bottom
> + * level (`level_low` parameter).  It searches for caches found in
> + * systems' registers, and fills up the table. Then it updates the
> + * `data_offset` and `instr_offset` parameters with the offset of the data
> + * and instruction caches of the lowest level, respectively.
> + */

Please, start the comment with upper case. But, more important, I don't 
think this comment is much helpful. I'd like to read more about the 
meaning and need of 'data_offset' and 'instr_offset' in the context of
the ACPI table.


> +static bool build_caches(GArray *table_data, uint32_t pptt_start,
> +                         int num_caches, CPUCoreCaches *caches,
> +                         uint8_t level_high, /* Inclusive */
> +                         uint8_t level_low,  /* Inclusive */
> +                         uint32_t *data_offset,
> +                         uint32_t *instr_offset)
> +{
> +    uint32_t next_level_offset_data = 0, next_level_offset_instruction = 0;
> +    uint32_t this_offset, next_offset = 0;
> +    int c, level;
> +    bool found_cache = false;
> +
> +    /* Walk caches from top to bottom */
> +    for (level = level_high; level >= level_low; level--) {
> +        for (c = 0; c < num_caches; c++) {
> +            if (caches[c].level != level) {
> +                continue;
> +            }
> +
> +            /* Assume only unified above l1 for now */
> +            this_offset = table_data->len - pptt_start;

Is 'this_offset' an invariant that can be hoisted out of the loops?


> +            switch (caches[c].type) {
> +            case INSTRUCTION_CACHE:
> +                next_offset = next_level_offset_instruction;
> +                break;
> +            case DATA_CACHE:
> +                next_offset = next_level_offset_data;
> +                break;
> +            case UNIFIED_CACHE:
> +                /* Either is fine here */
> +                next_offset = next_level_offset_instruction;
> +                break;
> +            }
> +            build_cache_nodes(table_data, &caches[c], next_offset);
> +            switch (caches[c].type) {
> +            case INSTRUCTION_CACHE:
> +                next_level_offset_instruction = this_offset;
> +                break;
> +            case DATA_CACHE:
> +                next_level_offset_data = this_offset;
> +                break;
> +            case UNIFIED_CACHE:
> +                next_level_offset_instruction = this_offset;
> +                next_level_offset_data = this_offset;
> +                break;
> +            }
> +            *data_offset = next_level_offset_data;
> +            *instr_offset = next_level_offset_instruction;
> +
> +            found_cache = true;
> +        }
> +    }
> +
> +    return found_cache;
> +}
> +
>   /*
>    * ACPI spec, Revision 6.3
>    * 5.2.29 Processor Properties Topology Table (PPTT)
> @@ -2158,11 +2255,32 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>   {
>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>       CPUArchIdList *cpus = ms->possible_cpus;
> -    int64_t socket_id = -1, cluster_id = -1, core_id = -1;
> -    uint32_t socket_offset = 0, cluster_offset = 0, core_offset = 0;
> +    uint32_t core_data_offset = 0;
> +    uint32_t core_instr_offset = 0;
> +    uint32_t cluster_instr_offset = 0;
> +    uint32_t cluster_data_offset = 0;
> +    uint32_t node_data_offset = 0;
> +    uint32_t node_instr_offset = 0;
> +    int top_node = 3;
> +    int top_cluster = 3;
> +    int top_core = 3;
> +    int bottom_node = 3;
> +    int bottom_cluster = 3;
> +    int bottom_core = 3;
> +    int64_t socket_id = -1;
> +    int64_t cluster_id = -1;
> +    int64_t core_id = -1;
> +    uint32_t socket_offset = 0;
> +    uint32_t cluster_offset = 0;
> +    uint32_t core_offset = 0;
>       uint32_t pptt_start = table_data->len;
>       uint32_t root_offset;
>       int n;
> +    uint32_t priv_rsrc[2];
> +    uint32_t num_priv = 0;
> +    bool cache_available;
> +    bool llevel;
> +
>       AcpiTable table = { .sig = "PPTT", .rev = 2,
>                           .oem_id = oem_id, .oem_table_id = oem_table_id };
>   
> @@ -2192,11 +2310,30 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>               socket_id = cpus->cpus[n].props.socket_id;
>               cluster_id = -1;
>               core_id = -1;
> +            bottom_node = top_node;
> +            num_priv = 0;
> +            cache_available = machine_defines_cache_at_topo_level(
> +                ms, CPU_TOPOLOGY_LEVEL_SOCKET);
> +            llevel = machine_find_lowest_level_cache_at_topo_level(
> +                ms, &bottom_node, CPU_TOPOLOGY_LEVEL_SOCKET);

See my comment in patch 3/8 about machine_defines_cache_at_topo_level() 
and machine_find_lowest_level_cache_at_topo_level() similar semantics.


> +            if (cache_available && llevel) {
> +                build_caches(table_data, pptt_start, num_caches, caches,
> +                             top_node, bottom_node, &node_data_offset,
> +                             &node_instr_offset);
> +                priv_rsrc[0] = node_instr_offset;
> +                priv_rsrc[1] = node_data_offset;
> +                if (node_instr_offset || node_data_offset) {
> +                    num_priv = node_instr_offset == node_data_offset ? 1 : 2;
> +                }
> +
> +                top_cluster = bottom_node - 1;
> +            }
> +
>               socket_offset = table_data->len - pptt_start;
>               build_processor_hierarchy_node(table_data,
>                   (1 << 0) | /* Physical package */
>                   (1 << 4), /* Identical Implementation */
> -                root_offset, socket_id, NULL, 0);
> +                root_offset, socket_id, priv_rsrc, num_priv);
>           }
>   
>           if (mc->smp_props.clusters_supported && mc->smp_props.has_clusters) {
> @@ -2204,21 +2341,68 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                   assert(cpus->cpus[n].props.cluster_id > cluster_id);
>                   cluster_id = cpus->cpus[n].props.cluster_id;
>                   core_id = -1;
> +                bottom_cluster = top_cluster;
> +                num_priv = 0;
> +                cache_available = machine_defines_cache_at_topo_level(
> +                    ms, CPU_TOPOLOGY_LEVEL_CLUSTER);
> +                llevel = machine_find_lowest_level_cache_at_topo_level(
> +                    ms, &bottom_cluster, CPU_TOPOLOGY_LEVEL_CLUSTER);
> +
> +                if (cache_available && llevel) {
> +                    build_caches(table_data, pptt_start, num_caches, caches,
> +                                 top_cluster, bottom_cluster,
> +                                 &cluster_data_offset, &cluster_instr_offset);
> +                    priv_rsrc[0] = cluster_instr_offset;
> +                    priv_rsrc[1] = cluster_data_offset;
> +                    if (cluster_instr_offset || cluster_data_offset) {
> +                        num_priv =
> +                            cluster_instr_offset == cluster_data_offset ? 1 : 2;
> +                    }
> +                    top_core = bottom_cluster - 1;
> +                } else if (top_cluster == bottom_node - 1) {
> +                    /* socket cache but no cluster cache */
> +                    top_core = bottom_node - 1;
> +                }
> +
>                   cluster_offset = table_data->len - pptt_start;
>                   build_processor_hierarchy_node(table_data,
>                       (0 << 0) | /* Not a physical package */
>                       (1 << 4), /* Identical Implementation */
> -                    socket_offset, cluster_id, NULL, 0);
> +                    socket_offset, cluster_id, priv_rsrc, num_priv);
>               }
>           } else {
> +            if (machine_defines_cache_at_topo_level(
> +                    ms, CPU_TOPOLOGY_LEVEL_CLUSTER)) {
> +                error_setg(&error_fatal, "Not clusters found for the cache");
> +                return;
> +            }
> +
>               cluster_offset = socket_offset;
> +            top_core = bottom_node - 1; /* there is no cluster */
> +        }
> +
> +        if (cpus->cpus[n].props.core_id != core_id) {
> +            bottom_core = top_core;
> +            num_priv = 0;
> +            cache_available = machine_defines_cache_at_topo_level(
> +                ms, CPU_TOPOLOGY_LEVEL_CORE);
> +            llevel = machine_find_lowest_level_cache_at_topo_level(
> +                ms, &bottom_core, CPU_TOPOLOGY_LEVEL_CORE);
> +            if (cache_available && llevel) {
> +                build_caches(table_data, pptt_start, num_caches, caches,
> +                             top_core, bottom_core, &core_data_offset,
> +                             &core_instr_offset);
> +                priv_rsrc[0] = core_instr_offset;
> +                priv_rsrc[1] = core_data_offset;
> +                num_priv = core_instr_offset == core_data_offset ? 1 : 2;
> +            }
>           }
>   
>           if (ms->smp.threads == 1) {
>               build_processor_hierarchy_node(table_data,
>                   (1 << 1) | /* ACPI Processor ID valid */
> -                (1 << 3),  /* Node is a Leaf */
> -                cluster_offset, n, NULL, 0);
> +                (1 << 3), /* Node is a Leaf */
> +                cluster_offset, n, priv_rsrc, num_priv);
>           } else {
>               if (cpus->cpus[n].props.core_id != core_id) {
>                   assert(cpus->cpus[n].props.core_id > core_id);
> @@ -2227,7 +2411,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                   build_processor_hierarchy_node(table_data,
>                       (0 << 0) | /* Not a physical package */
>                       (1 << 4), /* Identical Implementation */
> -                    cluster_offset, core_id, NULL, 0);
> +                    cluster_offset, core_id, priv_rsrc, num_priv);
>               }
>   
>               build_processor_hierarchy_node(table_data,
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index a655d1e42b..a6ad8cba1b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -1255,6 +1255,10 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>       unsigned dsdt, xsdt;
>       GArray *tables_blob = tables->table_data;
>       MachineState *ms = MACHINE(vms);
> +    CPUCoreCaches caches[CPU_MAX_CACHES];
> +    unsigned int num_caches;
> +
> +    num_caches = virt_get_caches(vms, caches);
>   
>       table_offsets = g_array_new(false, true /* clear */,
>                                           sizeof(uint32_t));
> @@ -1276,8 +1280,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>   
>       if (!vmc->no_cpu_topology) {
>           acpi_add_table(table_offsets, tables_blob);
> -        build_pptt(tables_blob, tables->linker, ms,
> -                   vms->oem_id, vms->oem_table_id, 0, NULL);
> +        build_pptt(tables_blob, tables->linker, ms, vms->oem_id,
> +                   vms->oem_table_id, num_caches, caches);
>       }
>   
>       acpi_add_table(table_offsets, tables_blob);
> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> index 2809dd8a91..04c821d2b9 100644
> --- a/include/hw/acpi/cpu.h
> +++ b/include/hw/acpi/cpu.h
> @@ -69,6 +69,16 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>   
>   void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list);
>   
> +struct CPUPPTTCaches {
> +    enum CacheType type;
> +    uint32_t sets;
> +    uint32_t size;
> +    uint32_t level;
> +    uint16_t linesize;
> +    uint8_t attributes; /* write policy: 0x0 write back, 0x1 write through */
> +    uint8_t associativity;
> +};
> +
>   extern const VMStateDescription vmstate_cpu_hotplug;
>   #define VMSTATE_CPU_HOTPLUG(cpuhp, state) \
>       VMSTATE_STRUCT(cpuhp, state, 1, \

Otherwise, the ACPI table generation looks good to me.


Cheers,
Gustavo

