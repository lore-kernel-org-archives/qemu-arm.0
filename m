Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp85935lfg;
        Mon, 16 Aug 2021 19:11:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhhCjahBLdofCrX3118bPHKfoWZWsOlnQ19gG1C2h3NhmmTKk0uz9/go6muuWX5+Xssf2I
X-Received: by 2002:a05:620a:284b:: with SMTP id h11mr1430658qkp.438.1629166264712;
        Mon, 16 Aug 2021 19:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629166264; cv=none;
        d=google.com; s=arc-20160816;
        b=p04II3w808Pzt8NLtq1F+TeMELF/GQFvBlAwzcVgSNNY7vusE3jEJT169rx3I61F0D
         bWoyLQ9eN+SBYZgwTvoU/sdjgJcVAovY9et3Xs4+kVJHgHFM512TRytBSDni+RU+LGwK
         XKiFwpyMLj4NUQajUhN1zvAjdP2Sta/raNYw75scU52Eg4DV/rhc5sLmr1GzuWhGh/Y7
         9ikaWkFq9vyNHNtLl8tC1/1vffG1XwWNT8mkVWz6PqvwnKUfm+ik6fDqXRbWz6vHpZwu
         bP2UnqhdMDOuJAbdDHrlxww6hfSIVnqOwQXpu84fILI0RFTWtuXkdLqnmgjqhWDkmPGl
         KJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=iS8gEFOO0eyeHGTsKXpm4ufu2FydH/q86XdXNgT6/V0=;
        b=ry9EdQk9EJfumJZHt8uMILdJHslH3D8yD5nCnjIxyl5tZpzGnJWqk+j3Uo/hIT051Q
         0hpQHcUjh1142CS1cVUmg/kPf/IK+xKlF2WvjMam2XQq5TDB0gZaXEbKtQ59PawzE36K
         SRt0WWKJpiawur6x2YCpYc4n2MY8JQo9mEKjok3Jeezv9KQUSG0NOAKzHxbWuQnSBu28
         LNitc5cM3o9G3DmKooBYRWhSbO0Aq3+E1d7k5EphRTfEP9ez96b/62fOBsd4tyaDGkyt
         dzuxgBXvw3gZr8aFNzzIRLqfI3ZslqbzjANqay2WWL+RiBpsCQQdN/DEbg0gGJwuvmtZ
         d/Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si618338qvi.97.2021.08.16.19.11.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 19:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:60240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFoZD-0007HD-W9
	for alex.bennee@linaro.org; Mon, 16 Aug 2021 22:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mFoZ5-0007H1-KA; Mon, 16 Aug 2021 22:10:55 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mFoZ2-0007cc-51; Mon, 16 Aug 2021 22:10:55 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GpZCn6NkDzdbgk;
 Tue, 17 Aug 2021 10:07:01 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 10:10:45 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 10:10:44 +0800
Subject: Re: [PATCH for-6.2 v5 3/5] hw/arm/virt: Add cpu-map to device tree
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
References: <20210805123921.62540-1-wangyanan55@huawei.com>
 <20210805123921.62540-4-wangyanan55@huawei.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <3bde66bd-d0ea-0960-b171-3bbd1990d977@huawei.com>
Date: Tue, 17 Aug 2021 10:10:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210805123921.62540-4-wangyanan55@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -78
X-Spam_score: -7.9
X-Spam_bar: -------
X-Spam_report: (-7.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.71,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IsUq7hbg47n0

Hi,
On 2021/8/5 20:39, Yanan Wang wrote:
> From: Andrew Jones <drjones@redhat.com>
>
> Support device tree CPU topology descriptions.
>
> In accordance with the Devicetree Specification, the Linux Doc
> "arm/cpus.yaml" requires that cpus and cpu nodes in the DT are
> present. And we have already met the requirement by generating
> /cpus/cpu@* nodes for members within ms->smp.cpus. Accordingly,
> we should also create subnodes in cpu-map for the present cpus,
> each of which relates to an unique cpu node.
>
> The Linux Doc "cpu/cpu-topology.txt" states that the hierarchy
> of CPUs in a SMP system is defined through four entities and
> they are socket/cluster/core/thread. It is also required that
> a socket node's child nodes must be one or more cluster nodes.
> Given that currently we are only provided with information of
> socket/core/thread, we assume there is one cluster child node
> in each socket node when creating cpu-map.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>   hw/arm/virt.c | 59 ++++++++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 49 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 82f2eba6bd..d1e294be95 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -350,20 +350,21 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>       int cpu;
>       int addr_cells = 1;
>       const MachineState *ms = MACHINE(vms);
> +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>       int smp_cpus = ms->smp.cpus;
>   
>       /*
> -     * From Documentation/devicetree/bindings/arm/cpus.txt
> -     *  On ARM v8 64-bit systems value should be set to 2,
> -     *  that corresponds to the MPIDR_EL1 register size.
> -     *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
> -     *  in the system, #address-cells can be set to 1, since
> -     *  MPIDR_EL1[63:32] bits are not used for CPUs
> -     *  identification.
> +     * See Linux Documentation/devicetree/bindings/arm/cpus.yaml
> +     * On ARM v8 64-bit systems value should be set to 2,
> +     * that corresponds to the MPIDR_EL1 register size.
> +     * If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
> +     * in the system, #address-cells can be set to 1, since
> +     * MPIDR_EL1[63:32] bits are not used for CPUs
> +     * identification.
>        *
> -     *  Here we actually don't know whether our system is 32- or 64-bit one.
> -     *  The simplest way to go is to examine affinity IDs of all our CPUs. If
> -     *  at least one of them has Aff3 populated, we set #address-cells to 2.
> +     * Here we actually don't know whether our system is 32- or 64-bit one.
> +     * The simplest way to go is to examine affinity IDs of all our CPUs. If
> +     * at least one of them has Aff3 populated, we set #address-cells to 2.
>        */
>       for (cpu = 0; cpu < smp_cpus; cpu++) {
>           ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
> @@ -406,8 +407,46 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>                   ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
>           }
>   
> +        if (!vmc->no_cpu_topology) {
> +            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
> +                                  qemu_fdt_alloc_phandle(ms->fdt));
> +        }
> +
>           g_free(nodename);
>       }
> +
> +    if (!vmc->no_cpu_topology) {
> +        /*
> +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
> +         * In a SMP system, the hierarchy of CPUs is defined through four
> +         * entities that are used to describe the layout of physical CPUs
> +         * in the system: socket/cluster/core/thread.
> +         */
> +        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
> +
> +        for (cpu = smp_cpus - 1; cpu >= 0; cpu--) {
> +            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
> +            char *map_path;
> +
> +            if (ms->smp.threads > 1) {
> +                map_path = g_strdup_printf(
> +                    "/cpus/cpu-map/socket%d/cluster0/core%d/thread%d",
> +                    cpu / (ms->smp.cores * ms->smp.threads),
> +                    (cpu / ms->smp.threads) % ms->smp.cores,
> +                    cpu % ms->smp.threads);
It seems that there is some discrepancy between the documentation
(Documentation/devicetree/bindings/cpu/cpu-topology.txt) and the
actual implementation of DT topology parser for ARM64
(function parse_dt_topology() in drivers/base/arch_topology.c).

The doc says the cpu-map node's child nodes can be:
     - one or more cluster nodes or
     - one or more socket nodes in a multi-socket system
which means a cpu-map can be defined as two formats such as:
1) cpu-map
                    socket0
                                 cluster0
                                              core0
                                              core1
                                 cluster1
                                              core0
                                              core1
                    socket1
                                 cluster0
                                              core0
                                              core1
                                 cluster1
                                              core0
                                              core1

2) cpu-map
                    cluster0
                                 cluster0
                                              core0
                                              core1
                                 cluster1
                                              core0
                                              core1
                    cluster1
                                 cluster0
                                              core0
                                              core1
                                 cluster1
                                              core0
                                              core1

But current parser only assumes that there are nested clusters within
cpu-map and is unaware of socket, the parser also ignore any information
about the nesting of clusters and present the scheduler with a flat list of
them. So based on current parser, we will get 4 packages (sockets) totally,
2 cores per package, 1 threads per core from 2), but will get nothing
useful from 1).

I think the ARM64 kernel DT parser should be optimized so that it's
also aware of sockets and can parse both formats of cpu-map. But
before this, I think we still have to build the cpu-map in format 2) if
we hope to describe topology successfully through DT. :)

Thanks,
Yanan
.
> +            } else {
> +                map_path = g_strdup_printf(
> +                    "/cpus/cpu-map/socket%d/cluster0/core%d",
> +                    cpu / ms->smp.cores,
> +                    cpu % ms->smp.cores);
> +            }
> +            qemu_fdt_add_path(ms->fdt, map_path);
> +            qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
> +
> +            g_free(map_path);
> +            g_free(cpu_path);
> +        }
> +    }
>   }
>   
>   static void fdt_add_its_gic_node(VirtMachineState *vms)

