Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp214311lfg;
        Wed, 12 May 2021 23:58:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyke6eWBD8d4htH1U/hD8q/mRyXIcaPZydO1Op3l46BScHFEseQ4B8H3OOZgglBIfivrGaE
X-Received: by 2002:a92:b74a:: with SMTP id c10mr33519722ilm.72.1620889118663;
        Wed, 12 May 2021 23:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620889118; cv=none;
        d=google.com; s=arc-20160816;
        b=W5r0Karvdl7B7Yqvi9dPfVjvRh+pdyVwL9Nj6hLMWBOmKkRdd2k4jxeKWybpOp5Q7O
         +hFzXYHx+odTwB2mWw5fRfNy7dZxnnx8NFbOrMpXlojRLld2VE4uKZJskh8dVYbdgHke
         E6Tq3SAv+NZHAj3PxkDCsQgYDZ0SpxFiO+NW3XPCT5EAskhMHw6tnz4KOjqBlWKsedtL
         mq666DuFOZPTXzuTA16qrv5Se8cv5uOWhgrVjYOD+LpzjxlsxGDV//RdTjjWVGdg+EiH
         q5zP6q/7ZPrHhczUDSRE5pTxcA5gsOH3Kkg1lUrONjDFfR4+aRYOt0CPCpuaqhXgSBuQ
         C7pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=/aiXQa7sdF3wG8FqWiUvXmixKCQD7MWhdxfzvffKLDU=;
        b=aN+D/EouyQ+QKb8tw31hNrJEH48HCXU4Zd5KJrrURLPxXvtSg9+RPVbbkw0yMC3bm0
         MnzfHcnoSyV2oeZTFhur5zep/0LwyzacqkW11BXTb/xxcrjVWetQaM1o+nb8yjH0ePzh
         bQ8rLJRhs0CEHA3SqIhTFYhm4JUwYeKn2xg0wkSfH4f+uTUiAZ/vqNmK/tO063U5MAWQ
         24KvaxRMGlXbR2x5rChIfu4s0R35/3N/79U0G3Rc1V4XyqdSaNv1zReDr/IqyF54wu6f
         wQLUpT3DyJdIf9IBEdpe+euqXcs32bA4HGE6vlfNEmniy6BKVHLWc+YgKbu81RDpOxqU
         2ZMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eMBb4NpM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si3050867jav.104.2021.05.12.23.58.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 23:58:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eMBb4NpM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lh5Ir-0007WM-Vy
	for alex.bennee@linaro.org; Thu, 13 May 2021 02:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lh5Ii-0007U8-7h
 for qemu-arm@nongnu.org; Thu, 13 May 2021 02:58:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lh5Ig-0002Q7-4T
 for qemu-arm@nongnu.org; Thu, 13 May 2021 02:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620889105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/aiXQa7sdF3wG8FqWiUvXmixKCQD7MWhdxfzvffKLDU=;
 b=eMBb4NpMZ+kXR8PAJ5eNevphj6Mm0HVCB03zh3lAs6F6sFi+hb346DWzmqAfpIF318RqiO
 j9BtUafnIb2qtL1axto3Q3dUyjgvtxFdf+F+iJ6+pj3z/i+vUuX5oAxtbG5uwxfrkDNeWg
 r/zaQN/GF03lYRX7Srf7BPwMYL6Ya5c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-Sp2IJAEaMIeuSUEWp2l9kw-1; Thu, 13 May 2021 02:58:21 -0400
X-MC-Unique: Sp2IJAEaMIeuSUEWp2l9kw-1
Received: by mail-ed1-f70.google.com with SMTP id
 k10-20020a50cb8a0000b0290387e0173bf7so14257349edi.8
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 23:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/aiXQa7sdF3wG8FqWiUvXmixKCQD7MWhdxfzvffKLDU=;
 b=hJ8ulzGO/0ld999zRcYQHwG58/U+3ptLEbItMjbTROqx3H0AJ1QKDcCNzNteRdEj0Y
 cSyzRF7E2HVXlAJ8zbGlMM1NCxMQxcmaXQ0v5v0ryJOG/m1rh4wLEeZbtfyFnfjC4wS/
 3RkQP98g4fJZG0sRxB0O9kXx1hkESaEWCblDhUZFYWHPDwUQsj3mlfyt6YSWXEyFW63Y
 WuzJITMojd+ASBoohaROz5r7k6iv8/8/SMaaLdGQdpH1bqRTPkyd33pT/FUAUrwcFcZX
 IRJbEmOacLbxg0L5zhzKy54F06vPjM9WmIAIhuQa8ZL02dn9qjDjk5u3+6z5kpJPgKyu
 MQ5A==
X-Gm-Message-State: AOAM531Y28CSersDS/P7DuoIb7ltzE/wm2aUjZULHxh7xu75/9XiWtdE
 CyXj51NbDP1Mr1/RYd2AR0M/m52NlIQly/2VaJ4JK7ctUesjBXYdNz1Ia0w9cjptu+vP2W5gfBn
 CHP47HBovRaGT
X-Received: by 2002:aa7:cd4d:: with SMTP id v13mr48143108edw.218.1620889100433; 
 Wed, 12 May 2021 23:58:20 -0700 (PDT)
X-Received: by 2002:aa7:cd4d:: with SMTP id v13mr48143081edw.218.1620889100238; 
 Wed, 12 May 2021 23:58:20 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id u6sm1331912ejn.14.2021.05.12.23.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 23:58:19 -0700 (PDT)
Date: Thu, 13 May 2021 08:58:17 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 2/6] hw/arm/virt: DT: Add cpu-map
Message-ID: <20210513065817.duqlblhcmje2hpnv@gator>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413080745.33004-3-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c/oxp5XygXWU

On Tue, Apr 13, 2021 at 04:07:41PM +0800, Yanan Wang wrote:
> From: Andrew Jones <drjones@redhat.com>
> 
> Support device tree CPU topology descriptions.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c         | 41 ++++++++++++++++++++++++++++++++++++++++-
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9f01d9041b..f4ae60ded9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -352,10 +352,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>      int cpu;
>      int addr_cells = 1;
>      const MachineState *ms = MACHINE(vms);
> +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      int smp_cpus = ms->smp.cpus;
>  
>      /*
> -     * From Documentation/devicetree/bindings/arm/cpus.txt
> +     *  See Linux Documentation/devicetree/bindings/arm/cpus.yaml
>       *  On ARM v8 64-bit systems value should be set to 2,
>       *  that corresponds to the MPIDR_EL1 register size.
>       *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
> @@ -408,8 +409,45 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>                  ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
>          }
>  
> +        if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {

We should probably always generate the cpu-map, like we agreed to always
generate the PPTT. If, for some reason, we don't want to generate the
cpu-map for uniprocessor systems, then we should actually be checking
ms->smp.maxcpus here (and below) to be sure it's uniprocessor.

Thanks,
drew

> +            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
> +                                  qemu_fdt_alloc_phandle(ms->fdt));
> +        }
> +
>          g_free(nodename);
>      }
> +
> +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> +        /*
> +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
> +         * In a SMP system, the hierarchy of CPUs is defined through four
> +         * entities that are used to describe the layout of physical CPUs
> +         * in the system: socket/cluster/core/thread.
> +         */
> +        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
> +
> +        for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
> +            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
> +            char *map_path;
> +
> +            if (ms->smp.threads > 1) {
> +                map_path = g_strdup_printf(
> +                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
> +                    "socket", cpu / (ms->smp.cores * ms->smp.threads),
> +                    "core", (cpu / ms->smp.threads) % ms->smp.cores,
> +                    "thread", cpu % ms->smp.threads);
> +            } else {
> +                map_path = g_strdup_printf(
> +                    "/cpus/cpu-map/%s%d/%s%d",
> +                    "socket", cpu / ms->smp.cores,
> +                    "core", cpu % ms->smp.cores);
> +            }
> +            qemu_fdt_add_path(ms->fdt, map_path);
> +            qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
> +            g_free(map_path);
> +            g_free(cpu_path);
> +        }
> +    }
>  }
>  
>  static void fdt_add_its_gic_node(VirtMachineState *vms)
> @@ -2769,6 +2807,7 @@ static void virt_machine_5_2_options(MachineClass *mc)
>      virt_machine_6_0_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>      vmc->no_secure_gpio = true;
> +    vmc->no_cpu_topology = true;
>  }
>  DEFINE_VIRT_MACHINE(5, 2)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 921416f918..4a4b98e4a7 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -129,6 +129,7 @@ struct VirtMachineClass {
>      bool no_kvm_steal_time;
>      bool acpi_expose_flash;
>      bool no_secure_gpio;
> +    bool no_cpu_topology;
>  };
>  
>  struct VirtMachineState {
> -- 
> 2.19.1
> 

