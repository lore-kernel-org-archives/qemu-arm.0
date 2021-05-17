Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1359481lfm;
        Mon, 17 May 2021 08:03:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTC39IjHMT+maM6/7fzIqbpHzT0WFkX9Sd744OQOMjo/WTvBrnfmS2nN0nESvMpOp+S9Ju
X-Received: by 2002:a2e:5d5:: with SMTP id 204mr1071916ljf.282.1621263802075;
        Mon, 17 May 2021 08:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621263802; cv=none;
        d=google.com; s=arc-20160816;
        b=I35lweeclUawncGhyeIAwgm+YP5E9KQdgb0APxa+w+U6F494WvsBiZjNP5LiVAULE8
         hWpr+bmq5lSJJX1/PCWUJmtiEMJ17t4TDusGN6M7IfW64z/PIlP87xq93e8EmduvnX9k
         F99OpizZuzbhQf7oF9MaiNsvjIzeEhoZcgUuz9WL7rexAJil1S4SUjtIn49Jif7kEbiN
         ZArQ5v9koVpDveJ+YG++7fxN0Z7qtsVeMMa1T6wgHKB9OUxfxIaFg76uUqfk2mts0NZx
         YEfqqfqJM22MNesYHhu7s86QRgw2fdxq18GeYg2sS4kBUyNNH+4AWa7r2bd8SaDufacX
         +6GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=ZrA8Szuvpx7rR+7BjeGa0a68nR7mqNoAKfoyUdO3dKU=;
        b=CvyNqnt6LZw4hepQHyy8s1wQ6Y8Xivq4POQIiNeVDAP75+yr+VQl7JdCwSGxo1HAaN
         oMN2B5WvD7GRlRvpTwz4DSIVsBvMJlc2oRmdZD40d3dqH2XsfGaXp+oa4NJdFLF18ZYK
         35tuvFQZbdiSNtUMm1SGoABmmrejSGBpoV8mCe2Ao9setfYLz8ubYONjP4LtUaIF46K0
         bCPxkJhZUFvxTRJ+J8C+trK3dFeHVws8eSlk/iZsy9Gl0/QKDuA9ZHsg/vg68VrmovMV
         IGVZW5+KUGZSGRYGxborNNp6aAc9G0FIStrOIoypLxXREpcj9DhlrFMO06tjs3UFKs8H
         MUtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9si9578343lfr.472.2021.05.17.08.03.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 08:03:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:43824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liem8-0007uy-Ot
	for alex.bennee@linaro.org; Mon, 17 May 2021 11:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liejF-0005DP-6u; Mon, 17 May 2021 11:00:21 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liej9-0002FY-41; Mon, 17 May 2021 11:00:20 -0400
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FkMfK2h5XzmhBX;
 Mon, 17 May 2021 22:56:41 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 23:00:09 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 23:00:07 +0800
Subject: Re: [RFC PATCH v3 3/9] hw/arm/virt: Add cpu-map to device tree
To: Andrew Jones <drjones@redhat.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-4-wangyanan55@huawei.com>
 <20210517064140.4cvurykbsofb7y3n@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <5eb2dc87-1c0a-11ae-0a4c-f26c4a90a18d@huawei.com>
Date: Mon, 17 May 2021 23:00:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210517064140.4cvurykbsofb7y3n@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangyanan55@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zwm6fMzc0I5v

Hi Drew,

On 2021/5/17 14:41, Andrew Jones wrote:
> On Sun, May 16, 2021 at 06:28:54PM +0800, Yanan Wang wrote:
>> From: Andrew Jones <drjones@redhat.com>
>>
>> Support device tree CPU topology descriptions.
>>
>> In accordance with the Devicetree Specification, the Linux Doc
>> "arm/cpus.yaml" requires that cpus and cpu nodes in the DT are
>> present. And we meet the requirement by creating /cpus/cpu@*
>> nodes for members within ms->smp.cpus.
>>
>> Correspondingly, we should also create subnodes in cpu-map for
>> the present cpus, each of which relates to an unique cpu node.
>>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/arm/virt.c | 41 ++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index c07841e3a4..e5dcdebdbc 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -349,10 +349,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>>       int cpu;
>>       int addr_cells = 1;
>>       const MachineState *ms = MACHINE(vms);
>> +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>       int smp_cpus = ms->smp.cpus;
>>   
>>       /*
>> -     * From Documentation/devicetree/bindings/arm/cpus.txt
>> +     *  See Linux Documentation/devicetree/bindings/arm/cpus.yaml
> Rather than aligning the top line with the lower lines, we could remove
> the extra space from the lower lines. Or, leave the formatting as it was,
> by putting 'See' where 'From' was, like I did in my original patch.
I think I prefer removing the extra space from the lower lines, which is
the right thing to do.
>>        *  On ARM v8 64-bit systems value should be set to 2,
>>        *  that corresponds to the MPIDR_EL1 register size.
>>        *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
>> @@ -405,8 +406,46 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>>                   ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
>>           }
>>   
>> +        if (!vmc->no_cpu_topology) {
>> +            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
>> +                                  qemu_fdt_alloc_phandle(ms->fdt));
>> +        }
>> +
>>           g_free(nodename);
>>       }
>> +
>> +    if (!vmc->no_cpu_topology) {
>> +        /*
>> +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
>> +         * In a SMP system, the hierarchy of CPUs is defined through four
>> +         * entities that are used to describe the layout of physical CPUs
> s/entities/levels/
Above comment was completely from Linux Doc cpu-topology.txt. See [1].
I think entities may be more reasonable than levels here, since there can be
multiple levels of clusters in cpu-map which makes the total not four.

[1] 
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/cpu/cpu-topology.txt
>> +         * in the system: socket/cluster/core/thread.
> The comment says there are four levels including 'cluster', but there's no
> 'cluster' below.
According to Doc [1] (line 114), a socket node's child nodes must be
*one or more* cluster nodes which means cluster is mandatory to be
socket's child in DT.

So I think maybe we should just keep the comment as-is, and change
the map-path from /cpus/cpu-map/socket*/cores*/threads* to
/cpus/cpu-map/socket*/cluster0/cores*/threads* in this patch?

Thanks,
Yanan
>> +         */
>> +        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
>> +
>> +        for (cpu = smp_cpus - 1; cpu >= 0; cpu--) {
>> +            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
>> +            char *map_path;
>> +
>> +            if (ms->smp.threads > 1) {
>> +                map_path = g_strdup_printf(
>> +                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
>> +                    "socket", cpu / (ms->smp.cores * ms->smp.threads),
>> +                    "core", (cpu / ms->smp.threads) % ms->smp.cores,
>> +                    "thread", cpu % ms->smp.threads);
>> +            } else {
>> +                map_path = g_strdup_printf(
>> +                    "/cpus/cpu-map/%s%d/%s%d",
>> +                    "socket", cpu / ms->smp.cores,
>> +                    "core", cpu % ms->smp.cores);
>> +            }
>> +            qemu_fdt_add_path(ms->fdt, map_path);
>> +            qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
>> +
>> +            g_free(map_path);
>> +            g_free(cpu_path);
>> +        }
>> +    }
>>   }
>>   
>>   static void fdt_add_its_gic_node(VirtMachineState *vms)
>> -- 
>> 2.19.1
>>
> Thanks,
> drew
>
> .
