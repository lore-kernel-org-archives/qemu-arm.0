Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp986378lfm;
        Sun, 16 May 2021 23:41:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGtEuDd2E3/y3K5gzmO8m37eiz/CP0s0mX2YbOnjINtQ9xF2UNYOlS/NuCdCaTab7upP13
X-Received: by 2002:a05:6402:1713:: with SMTP id y19mr25858621edu.286.1621233718615;
        Sun, 16 May 2021 23:41:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621233718; cv=none;
        d=google.com; s=arc-20160816;
        b=AVddbob50VWLcKRdDCUFjwbJmz9R3ER4aZc5VALnh+yggexYV2f+X1r80hJt4kxp/i
         v/oIgkrzZz2aEiCUbdjB7awT5rcC21gy7x0wtOUmXc3sVpH6O/ng20tHuBwawr+b+U7s
         FdQoCSh2plXYs3g4DjikXEqHXILmRjsxI8Jwh6+2u3tvpvezEGVCStNwJnaFUhOttyXi
         cM0NqpIjoaspi1MsCyX6IkAFaRYjFzTJb1uSkaGIZ4VMklrUuJhVXF/noVg7OAza5gZY
         8V32QPKDq2CmmBNkcau56Ako4fN9+y/pWVBF7tpSQocoiEWuwy3LHy3KVyjPXsO2hBWA
         WcgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=kzasCPZQqJ9cRXMGi0lsx5m/DvQIiWbfgEHqEWPhTFs=;
        b=WoEFKs4Lc5THm0NYWTLrzplb/qrRDLfsL0uxuNzvntgeEKbN1qQ2cI/K+hdqAYcmbr
         ogvOGpJt2T1wHsIn9Z16PSgbdqpASA0ygJTDvsTqEHjpjg28PvGJ3PFFVfrTDO52Cc3U
         kMm1xZuOly30zXKTcdFGf2o+H76bLQTK1Wn2NdasBnsM5n0zQ97xRBUTtE9icghNGsSQ
         CwxH0ATibRDOQ3KJDck9zlyCRMLBqs2A72jxZ8BRbGpmQgEJr+fW54o4TujF/rZBnP7D
         BIGptqxybvyOF1RDBXkBkz+g2iFLdYjg5UNnxzK1dnriLNTGrRibmdsRUL9GfxWRMm61
         GC6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iqL4YLCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qp24si16767796ejb.718.2021.05.16.23.41.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 23:41:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iqL4YLCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liWwv-0000HN-KY
	for alex.bennee@linaro.org; Mon, 17 May 2021 02:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liWwn-0000H5-0C
 for qemu-arm@nongnu.org; Mon, 17 May 2021 02:41:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liWwk-0008TA-4a
 for qemu-arm@nongnu.org; Mon, 17 May 2021 02:41:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621233705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kzasCPZQqJ9cRXMGi0lsx5m/DvQIiWbfgEHqEWPhTFs=;
 b=iqL4YLCD80NkfTyTyYnFEmGeSCCYsDnO59VVJVuYOuPXo9fhiSTUADbUxsMfvUUPRvtwB0
 c95ixCPODW/QIOTyPiqv1anCyQmZ4oViqYDtrkiV4pSnxiYYeZCqLIfnH/MsGDB6/nlXAO
 oiqmqK6S+wTSEtGqacqnI83LLHBYXA4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-YVQq5qIeOf6DaJZu34A5mg-1; Mon, 17 May 2021 02:41:43 -0400
X-MC-Unique: YVQq5qIeOf6DaJZu34A5mg-1
Received: by mail-ej1-f69.google.com with SMTP id
 c11-20020a170906170bb02903bbefa04cd1so642749eje.8
 for <qemu-arm@nongnu.org>; Sun, 16 May 2021 23:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kzasCPZQqJ9cRXMGi0lsx5m/DvQIiWbfgEHqEWPhTFs=;
 b=UZJCRKrxIyZ25bcrdVURFPP5GmGTFmAB6CYkVhS/u+6BmeiiqyEBmwP3XCEwETJBw1
 0/FidgXGEE3xxkr2lC9z4N9tO+a9fZyUhBstQTT2P5W/PZjC577o0sttM2cctj7SM0Tr
 1A2gLRAZwHG68oK1j3rL92ZGKuLCOYJFqkr515CIE6jExsA4d2p4tbD2MaaVch7HfS91
 I9dtjG4YiWJ9l0mU1WN8nIbiEDnP/DQ2gaCavwimCpbXopppmnTmylafer1ZLzOauNci
 +3VmKHLHlM0XdIPq9a60YdQKxML8DvFGZGgBDzAW5kExVckzzPtlBrb2HJWz0mG2k/xg
 slKw==
X-Gm-Message-State: AOAM533lCaBfMZAGPzk7QmSFbwHUtWhkMLx9omxmi3jFSSfTKTZMNos1
 GhiLzxLu/RcfPPKZ7gX6efh+ay013kZKUNPeErI9euDJAIiJVHcJb6hJfUXIeY/2t6XzUwwk7mn
 nQAFc/aN4MnGk
X-Received: by 2002:a17:906:c010:: with SMTP id
 e16mr61515682ejz.214.1621233702547; 
 Sun, 16 May 2021 23:41:42 -0700 (PDT)
X-Received: by 2002:a17:906:c010:: with SMTP id
 e16mr61515634ejz.214.1621233702287; 
 Sun, 16 May 2021 23:41:42 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id v8sm4471085ejq.62.2021.05.16.23.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 23:41:42 -0700 (PDT)
Date: Mon, 17 May 2021 08:41:40 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 3/9] hw/arm/virt: Add cpu-map to device tree
Message-ID: <20210517064140.4cvurykbsofb7y3n@gator.home>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-4-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210516102900.28036-4-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KJyTGUo+cl0X

On Sun, May 16, 2021 at 06:28:54PM +0800, Yanan Wang wrote:
> From: Andrew Jones <drjones@redhat.com>
> 
> Support device tree CPU topology descriptions.
> 
> In accordance with the Devicetree Specification, the Linux Doc
> "arm/cpus.yaml" requires that cpus and cpu nodes in the DT are
> present. And we meet the requirement by creating /cpus/cpu@*
> nodes for members within ms->smp.cpus.
> 
> Correspondingly, we should also create subnodes in cpu-map for
> the present cpus, each of which relates to an unique cpu node.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c | 41 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index c07841e3a4..e5dcdebdbc 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -349,10 +349,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>      int cpu;
>      int addr_cells = 1;
>      const MachineState *ms = MACHINE(vms);
> +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      int smp_cpus = ms->smp.cpus;
>  
>      /*
> -     * From Documentation/devicetree/bindings/arm/cpus.txt
> +     *  See Linux Documentation/devicetree/bindings/arm/cpus.yaml

Rather than aligning the top line with the lower lines, we could remove
the extra space from the lower lines. Or, leave the formatting as it was,
by putting 'See' where 'From' was, like I did in my original patch.

>       *  On ARM v8 64-bit systems value should be set to 2,
>       *  that corresponds to the MPIDR_EL1 register size.
>       *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
> @@ -405,8 +406,46 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>                  ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
>          }
>  
> +        if (!vmc->no_cpu_topology) {
> +            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
> +                                  qemu_fdt_alloc_phandle(ms->fdt));
> +        }
> +
>          g_free(nodename);
>      }
> +
> +    if (!vmc->no_cpu_topology) {
> +        /*
> +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
> +         * In a SMP system, the hierarchy of CPUs is defined through four
> +         * entities that are used to describe the layout of physical CPUs

s/entities/levels/

> +         * in the system: socket/cluster/core/thread.

The comment says there are four levels including 'cluster', but there's no
'cluster' below.

> +         */
> +        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
> +
> +        for (cpu = smp_cpus - 1; cpu >= 0; cpu--) {
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
> +
> +            g_free(map_path);
> +            g_free(cpu_path);
> +        }
> +    }
>  }
>  
>  static void fdt_add_its_gic_node(VirtMachineState *vms)
> -- 
> 2.19.1
>

Thanks,
drew 

