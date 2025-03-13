Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp808380njc;
        Thu, 13 Mar 2025 02:25:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVd7uNHW7jeZ6dgV6sxBP5GqlxvNDk3XGlXi1stgsv3HEc2OAzgyWh38DhuROyJIt9zN86HL0+j/9PUXw==@linaro.org
X-Google-Smtp-Source: AGHT+IGSW3CXyLE2BlJkcIYSouJSzquwLPl9jNNHAYrLiuGq68HgOnkTja1fA34cOm0N9hGY1Ng1
X-Received: by 2002:a05:6214:2425:b0:6e8:9021:9095 with SMTP id 6a1803df08f44-6e90066b6efmr427252516d6.32.1741857944217;
        Thu, 13 Mar 2025 02:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741857944; cv=none;
        d=google.com; s=arc-20240605;
        b=V3G6QEu1eXksLvp9A6LGwO8MLpmIwY3fEBy4TyODFXuaOD7lInK6wMk/DniyBBmIMj
         WHfVhDHd/7+ep0DAEZUZz64w8EM7i6vmJzKKSSrJBcRPV1eZ+MsLIs2CQt6ROpwX7AOK
         DXQh22zxhnWnOHYHsuaRp7dtRgXzD1Fr47BLXEBQnh1Uh8hnjU6fIbVBhHSPxzW06uFB
         I7Ss6BmTJBefJAbpwX7UGjlvyo3tzi6azH7BsW19vtG9NVUIwkGkUvSf10q/8GKIoHcE
         /EH1vaSrkdLCzM9b32drvV40d/NFy0chy1XeQBk/gCynwLbsaE+yXJajkt85BTKMU5OM
         VpMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=sDhfOe8V6OwXB7DG0ZFs/kX3kzemTvss+nTUJqMwQjw=;
        fh=Qh+7d1sRgLVtmgNYVr39O3GAW2ks4YKzt+I8ygyUibc=;
        b=gFGC26/kuSFeI+KMn88usrAaQCYEmUICzu+1R7NEtX6AFwJtL+7xxMGddo/0BUdJZW
         SFpl7vlPj03VAjoz7Emlfppfy2xZovYZQ3UUU5Iih7NnoE8W79CRK11j1VfYjF7b//fP
         3r5aObVtt8fckUcWlMATjruahv5bxGKrjqnyW4iinQbjGoM7puTIOs86Y4AN97fX+ZuN
         aQ8wvjhRuIUM194biNOxxAm33eEQ5H2wXhO/+4SuK3IMxPKQ/yqEl3UXUsclcqCnlGgu
         OMx+4++xySJz74hlR5kCB0RuGTLOHfYo5w4H6+8jiyxTGD6bhkrWcDzRalgc0XqHlp1P
         fWlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade33bd83si13256896d6.183.2025.03.13.02.25.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Mar 2025 02:25:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tseoR-0001fD-3s; Thu, 13 Mar 2025 05:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tseoO-0001e3-U6; Thu, 13 Mar 2025 05:25:08 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tseoM-0002XY-83; Thu, 13 Mar 2025 05:25:08 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZD28D6sKbz6K9YG;
 Thu, 13 Mar 2025 17:22:20 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id A54461400D9;
 Thu, 13 Mar 2025 17:24:58 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 13 Mar
 2025 10:24:57 +0100
Date: Thu, 13 Mar 2025 09:24:56 +0000
To: Alireza Sanaee <alireza.sanaee@huawei.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>,
 <zhao1.liu@intel.com>, <dapeng1.mi@linux.intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <anisinha@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mtosatti@redhat.com>,
 <berrange@redhat.com>, <richard.henderson@linaro.org>,
 <shameerali.kolothum.thodi@huawei.com>, <jiangkunkun@huawei.com>,
 <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH v8 4/6] hw/acpi/aml-build.c: add cache hierarchy to pptt
 table
Message-ID: <20250313092456.000024f1@huawei.com>
In-Reply-To: <20250310162337.844-5-alireza.sanaee@huawei.com>
References: <20250310162337.844-1-alireza.sanaee@huawei.com>
 <20250310162337.844-5-alireza.sanaee@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1diHebzXZ62/

On Mon, 10 Mar 2025 16:23:35 +0000
Alireza Sanaee <alireza.sanaee@huawei.com> wrote:

> Add cache topology to PPTT table. With this patch, both ACPI PPTT table
> and device tree will represent the same cache topology given users
> input.
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> Co-developed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Hi Ali,

A few trivial style things. You'll need to rebase after 10.0 is out
anyway, so just tidy these up when you do that.

Jonathan

> ---
>  hw/acpi/aml-build.c            | 205 ++++++++++++++++++++++++++++++++-
>  hw/arm/virt-acpi-build.c       |   8 +-
>  hw/loongarch/virt-acpi-build.c |   2 +-
>  include/hw/acpi/aml-build.h    |   4 +-
>  include/hw/cpu/core.h          |   1 +
>  5 files changed, 212 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index e5401dfdb1a8..e2568522660d 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
...

>  /*
>   * ACPI spec, Revision 6.3
>   * 5.2.29.1 Processor hierarchy node structure (Type 0)
> @@ -2146,15 +2247,24 @@ void build_spcr(GArray *table_data, BIOSLinker *linker,
>   * 5.2.29 Processor Properties Topology Table (PPTT)
>   */
>  void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> -                const char *oem_id, const char *oem_table_id)
> +                const char *oem_id, const char *oem_table_id,
...

> @@ -2184,11 +2294,35 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>              socket_id = cpus->cpus[n].props.socket_id;
>              cluster_id = -1;
>              core_id = -1;
> +            bottom_node = top_node;
> +            num_priv = 0;
> +            if (cache_described_at(ms, CPU_TOPOLOGY_LEVEL_SOCKET) &&
> +                find_the_lowest_level_cache_defined_at_level(
> +                    ms,
> +                    &bottom_node,
> +                    CPU_TOPOLOGY_LEVEL_SOCKET))
> +            {
As below.

> +                build_caches(table_data, pptt_start,
> +                             num_caches, caches,
> +                             n, top_node, bottom_node,
> +                             &node_data_offset, &node_instr_offset);
> +
> +                priv_rsrc[0] = node_instr_offset;
> +                priv_rsrc[1] = node_data_offset;
> +
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
> +                root_offset, socket_id,
> +                priv_rsrc, num_priv);
>          }
>  
>          if (mc->smp_props.clusters_supported && mc->smp_props.has_clusters) {
> @@ -2196,21 +2330,81 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  assert(cpus->cpus[n].props.cluster_id > cluster_id);
>                  cluster_id = cpus->cpus[n].props.cluster_id;
>                  core_id = -1;
> +                bottom_cluster = top_cluster;
> +                num_priv = 0;
> +
> +                if (cache_described_at(ms, CPU_TOPOLOGY_LEVEL_CLUSTER) &&
> +                    find_the_lowest_level_cache_defined_at_level(
> +                        ms,
> +                        &bottom_cluster,
> +                        CPU_TOPOLOGY_LEVEL_CLUSTER))
> +                {

As below, style not correct.  Please check for other cases.

> +
> +                    build_caches(table_data, pptt_start,
> +                                 num_caches, caches, n, top_cluster,
> +                                 bottom_cluster, &cluster_data_offset,
> +                                 &cluster_instr_offset);
> +
> +                    priv_rsrc[0] = cluster_instr_offset;
> +                    priv_rsrc[1] = cluster_data_offset;
> +
> +                    if (cluster_instr_offset || cluster_data_offset) {
> +                        num_priv =
> +                        cluster_instr_offset == cluster_data_offset ? 1 : 2;
> +                    }
> +
> +                    top_core = bottom_cluster - 1;
> +                } else if (top_cluster == bottom_node - 1) {
> +                    /* socket cache but no cluster cache */
> +                    top_core = bottom_node - 1;
> +                }

...

> +        if (cpus->cpus[n].props.core_id != core_id) {
> +            bottom_core = top_core;
> +            num_priv = 0;
> +
> +            if (cache_described_at(ms, CPU_TOPOLOGY_LEVEL_CORE) &&
> +                find_the_lowest_level_cache_defined_at_level(
> +                    ms,
> +                    &bottom_core,
> +                    CPU_TOPOLOGY_LEVEL_CORE))
> +            {

Trivial but that's not qemu coding style.  Bracket needs to go on end of
line above.

> +                build_caches(table_data, pptt_start,
> +                             num_caches, caches,
> +                             n, top_core, bottom_core,
> +                             &core_data_offset, &core_instr_offset);
> +
> +                priv_rsrc[0] = core_instr_offset;
> +                priv_rsrc[1] = core_data_offset;
> +
> +                num_priv = core_instr_offset == core_data_offset ? 1 : 2;
> +            }
> +        }
> +
> +

One blank line enough.

>          if (ms->smp.threads == 1) {
>              build_processor_hierarchy_node(table_data,
>                  (1 << 1) | /* ACPI Processor ID valid */
>                  (1 << 3),  /* Node is a Leaf */
> -                cluster_offset, n, NULL, 0);
> +                cluster_offset, n,
> +                priv_rsrc, num_priv);


