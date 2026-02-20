Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA92C55ABE
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Feb 2026 12:49:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vtPwv-0004WJ-No; Fri, 20 Feb 2026 07:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vtPwt-0004Vn-8R
 for qemu-arm@nongnu.org; Fri, 20 Feb 2026 07:49:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vtPwp-0006BO-FQ
 for qemu-arm@nongnu.org; Fri, 20 Feb 2026 07:49:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771591769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kl2POBbCPeZ1XMKcJ8oGPKap8X7akNCGB6xdqZI5lCA=;
 b=PnF0o09NClAv/xr/KVuMOg082ecXpKxe0jzqr1dQnjX7JVvEGo6Pogg2vUSHjhjMYNGsjD
 qRPOaInygSB6ijcjfo1JMj6UOtZa5UbVlAW17bisfjZcX7NtRB2JPfbygxuFo4QeFDWqVv
 n/1chwDlyYC2Fp/8x0Kn+Hpl4yK2OSw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-XfL1NaBzPrqynPV1M_oXAQ-1; Fri, 20 Feb 2026 07:49:28 -0500
X-MC-Unique: XfL1NaBzPrqynPV1M_oXAQ-1
X-Mimecast-MFC-AGG-ID: XfL1NaBzPrqynPV1M_oXAQ_1771591767
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4836cf00787so30773605e9.1
 for <qemu-arm@nongnu.org>; Fri, 20 Feb 2026 04:49:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771591767; x=1772196567;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kl2POBbCPeZ1XMKcJ8oGPKap8X7akNCGB6xdqZI5lCA=;
 b=FlPU+gQBpV1BvgQm//G3/JzzfWcao5MPPvIyO3OSCRuvwhsLr1UQjsLonf05ztjt61
 5wvgC0OsRcb5QirJNZpVDlaO3y0GdFrUdWA1Q2HM42mcn1cei7C6b/uYLOOllbHLtv0O
 O6yEjtCrLSC65FvOrFp0hfE/WA1Te2R0GJbnIzikifgV9eTgZ6AtE7zslPEOti9oOZMf
 pPdjKZN3eRIdEYkyz7ViFoAyqTWihw2jG+JFnWjthkec1U8OodtNLB2OJUklRuAfL9EW
 HiLvhIGYpPlx9+FzSE/tF+ZesNtdFStQVZWh7Pg+aAvpsDJzIqy0srwJUIdbvZ+OoggN
 7EnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Ew6nguRSKMHpzHc6C22OrUaqoxjLqkN7dy+cQU1J6zgst0EI5goJNm4sjJfzV8Td0h7MDjwTJg==@nongnu.org
X-Gm-Message-State: AOJu0YxfVpyj9zvk05KHJJj3ygCCbGVksLt4b2caLSmG7CdavWh1xq2I
 O/w7T5AnIkWvIt3v/0IYHSjBZRdE3BpW7TRjmt7XrnC+3YhFjffQsiAU+NmFqMvSh4o3tO4E6ya
 g6d0Re5qRC6xr+2rLFJYXBc0FAaJ7M77Ep6xGeHE/UYVbLZb/SVkrnw==
X-Gm-Gg: AZuq6aL1taDRyeFaiOjAPbe6PZJvxkka9i3To8bSk9KMnNm8TLx0E1azZZnOjnA6Yqy
 LHfYvvbLjWhewCW8HK+DLfb5KYMpD3Cv+Kbk6MzmKi7GSsEQZ2l+8Dz5ixtuzGkdF0VYJhIcjqz
 wF6hNJHdwvbRM+vHjr9r6ieyjnmgr3FA3LBDFmwdMfKmZrZdie5SiHUta3qGF2brY4y3ZjDxNpk
 T7Xh/IZKEPnAKSgmDs8ZX+d0ZQ6e4pDBATiIEjKzhhgYYDHyyGC3ZwsZcaltVg5E/Gz8Iq42rND
 jzyUmZgrrRZ9D/4AJSugoZtA2FbDBtpUrJHIJDVgp6a3waziV5mLRxH/yRCKd9vQV3DzG6m7wpc
 EPHSxnWsXhikkd/q07/vzF88jZrwq3/rm5/aI6eXUiL5OlQ==
X-Received: by 2002:a5d:5d85:0:b0:439:5c07:fa4c with SMTP id
 ffacd0b85a97d-4396275a109mr10314921f8f.31.1771591766856; 
 Fri, 20 Feb 2026 04:49:26 -0800 (PST)
X-Received: by 2002:a5d:5d85:0:b0:439:5c07:fa4c with SMTP id
 ffacd0b85a97d-4396275a109mr10314842f8f.31.1771591766205; 
 Fri, 20 Feb 2026 04:49:26 -0800 (PST)
Received: from redhat.com (IGLD-80-230-79-166.inter.net.il. [80.230.79.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abd793sm54657034f8f.25.2026.02.20.04.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 04:49:25 -0800 (PST)
Date: Fri, 20 Feb 2026 07:49:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: qemu-devel@nongnu.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 armbru@redhat.com, berrange@redhat.com, dapeng1.mi@linux.intel.com,
 eric.auger@redhat.com, farman@linux.ibm.com, imammedo@redhat.com,
 jiangkunkun@huawei.com, maobibo@loongson.cn, mtosatti@redhat.com,
 peter.maydell@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, shannon.zhaosl@gmail.com,
 yangyicong@hisilicon.com, jonathan.cameron@huawei.com,
 linuxarm@huawei.com, zhao1.liu@intel.com
Subject: Re: [PATCH v17 6/8] hw/acpi: add cache hierarchy to pptt table
Message-ID: <20260220074005-mutt-send-email-mst@kernel.org>
References: <20260106155828.643-1-alireza.sanaee@huawei.com>
 <20260106155828.643-7-alireza.sanaee@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20260106155828.643-7-alireza.sanaee@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YtIoK7Wc3SggGLzMvGV3unYRdnZaTWDHEH6RprFGO00_1771591767
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Jan 06, 2026 at 03:58:25PM +0000, Alireza Sanaee wrote:
> Add cache topology to PPTT table.
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>  hw/acpi/aml-build.c      | 200 +++++++++++++++++++++++++++++++++++++--
>  hw/arm/virt-acpi-build.c |   8 +-
>  include/hw/acpi/cpu.h    |  10 ++
>  3 files changed, 209 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index a711a9600e..580eceb24a 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -31,6 +31,7 @@
>  #include "hw/pci/pci_bus.h"
>  #include "hw/pci/pci_bridge.h"
>  #include "qemu/cutils.h"
> +#include "hw/core/cpu.h"
>  
>  static GArray *build_alloc_array(void)
>  {
> @@ -2140,6 +2141,104 @@ void build_spcr(GArray *table_data, BIOSLinker *linker,
>      }
>      acpi_table_end(linker, &table);
>  }
> +
> +static void build_cache_nodes(GArray *tbl, CPUCoreCaches *cache,
> +                              uint32_t next_offset)
> +{
> +    int val;
> +
> +    /* Type 1 - cache */
> +    build_append_byte(tbl, 1);

Standard format in acpi code is:
    build_append_byte(tbl, 1); /* Type 1 - cache */

same below

> +    /* Length */
> +    build_append_byte(tbl, 24);

would be nice to validate. you can compare tbl->len before and after.


> +    /* Reserved */
> +    build_append_int_noprefix(tbl, 0, 2);
> +    /* Flags */
> +    build_append_int_noprefix(tbl, 0x7f, 4);

document which flags are set.


> +    /* Offset of next cache up */
> +    build_append_int_noprefix(tbl, next_offset, 4);
> +    build_append_int_noprefix(tbl, cache->size, 4);
> +    build_append_int_noprefix(tbl, cache->sets, 4);
> +    build_append_byte(tbl, cache->associativity);
> +    val = 0x3;

document what this is

> +    switch (cache->type) {
> +    case INSTRUCTION_CACHE:
> +        val |= (1 << 2);

document what this is.

> +        break;
> +    case DATA_CACHE:
> +        val |= (0 << 2); /* Data */
> +        break;
> +    case UNIFIED_CACHE:
> +        val |= (3 << 2); /* Unified */
> +        break;
> +    }
> +    build_append_byte(tbl, val);
> +    build_append_int_noprefix(tbl, cache->linesize, 2);
> +}
> +
> +/*
> + * builds caches from the top level (`level_high` parameter) to the bottom
> + * level (`level_low` parameter).  It searches for caches found in
> + * systems' registers, and fills up the table. Then it updates the
> + * `data_offset` and `instr_offset` parameters with the offset of the data
> + * and instruction caches of the lowest level, respectively.
> + */
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
>  /*
>   * ACPI spec, Revision 6.3
>   * 5.2.29 Processor Properties Topology Table (PPTT)
> @@ -2150,11 +2249,32 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
>      CPUArchIdList *cpus = ms->possible_cpus;
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
>      uint32_t pptt_start = table_data->len;
>      uint32_t root_offset;
>      int n;
> +    uint32_t priv_rsrc[2];
> +    uint32_t num_priv = 0;
> +    bool cache_available;
> +    bool llevel;
> +
>      AcpiTable table = { .sig = "PPTT", .rev = 2,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
>  
> @@ -2184,11 +2304,30 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>              socket_id = cpus->cpus[n].props.socket_id;
>              cluster_id = -1;
>              core_id = -1;
> +            bottom_node = top_node;
> +            num_priv = 0;
> +            cache_available = machine_defines_cache_at_topo_level(
> +                ms, CPU_TOPOLOGY_LEVEL_SOCKET);
> +            llevel = machine_find_lowest_level_cache_at_topo_level(
> +                ms, &bottom_node, CPU_TOPOLOGY_LEVEL_SOCKET);
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
>              socket_offset = table_data->len - pptt_start;
>              build_processor_hierarchy_node(table_data,
>                  (1 << 0) | /* Physical package */
>                  (1 << 4), /* Identical Implementation */
> -                root_offset, socket_id, NULL, 0);
> +                root_offset, socket_id, priv_rsrc, num_priv);
>          }
>  
>          if (mc->smp_props.clusters_supported && mc->smp_props.has_clusters) {
> @@ -2196,21 +2335,68 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  assert(cpus->cpus[n].props.cluster_id > cluster_id);
>                  cluster_id = cpus->cpus[n].props.cluster_id;
>                  core_id = -1;
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
>                  cluster_offset = table_data->len - pptt_start;
>                  build_processor_hierarchy_node(table_data,
>                      (0 << 0) | /* Not a physical package */
>                      (1 << 4), /* Identical Implementation */
> -                    socket_offset, cluster_id, NULL, 0);
> +                    socket_offset, cluster_id, priv_rsrc, num_priv);
>              }
>          } else {
> +            if (machine_defines_cache_at_topo_level(
> +                    ms, CPU_TOPOLOGY_LEVEL_CLUSTER)) {
> +                error_setg(&error_fatal, "Not clusters found for the cache");
> +                return;
> +            }
> +
>              cluster_offset = socket_offset;
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
>          }
>  
>          if (ms->smp.threads == 1) {
>              build_processor_hierarchy_node(table_data,
>                  (1 << 1) | /* ACPI Processor ID valid */
> -                (1 << 3),  /* Node is a Leaf */
> -                cluster_offset, n, NULL, 0);
> +                (1 << 3), /* Node is a Leaf */
> +                cluster_offset, n, priv_rsrc, num_priv);
>          } else {
>              if (cpus->cpus[n].props.core_id != core_id) {
>                  assert(cpus->cpus[n].props.core_id > core_id);
> @@ -2219,7 +2405,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  build_processor_hierarchy_node(table_data,
>                      (0 << 0) | /* Not a physical package */
>                      (1 << 4), /* Identical Implementation */
> -                    cluster_offset, core_id, NULL, 0);
> +                    cluster_offset, core_id, priv_rsrc, num_priv);
>              }
>  
>              build_processor_hierarchy_node(table_data,
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 8e7bc029f3..f4cbb71c90 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -1144,6 +1144,10 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      unsigned dsdt, xsdt;
>      GArray *tables_blob = tables->table_data;
>      MachineState *ms = MACHINE(vms);
> +    CPUCoreCaches caches[CPU_MAX_CACHES];
> +    unsigned int num_caches;
> +
> +    num_caches = virt_get_caches(vms, caches);
>  
>      table_offsets = g_array_new(false, true /* clear */,
>                                          sizeof(uint32_t));
> @@ -1165,8 +1169,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  
>      if (!vmc->no_cpu_topology) {
>          acpi_add_table(table_offsets, tables_blob);
> -        build_pptt(tables_blob, tables->linker, ms,
> -                   vms->oem_id, vms->oem_table_id, 0, NULL);
> +        build_pptt(tables_blob, tables->linker, ms, vms->oem_id,
> +                   vms->oem_table_id, num_caches, caches);
>      }
>  
>      acpi_add_table(table_offsets, tables_blob);
> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> index 557219d2c6..87950eb787 100644
> --- a/include/hw/acpi/cpu.h
> +++ b/include/hw/acpi/cpu.h
> @@ -70,6 +70,16 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>  
>  void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list);
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
>  extern const VMStateDescription vmstate_cpu_hotplug;
>  #define VMSTATE_CPU_HOTPLUG(cpuhp, state) \
>      VMSTATE_STRUCT(cpuhp, state, 1, \
> -- 
> 2.43.0


