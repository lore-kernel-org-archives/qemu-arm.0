Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp156618lfk;
        Thu, 27 Jan 2022 23:07:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3UgDlBdLXABOgoq1VOYOFZPGhks3yvm72nICW6A/K1v0U5nJRNWxsXSlxDvs9STLUid+r
X-Received: by 2002:a25:234f:: with SMTP id j76mr10268901ybj.338.1643353661757;
        Thu, 27 Jan 2022 23:07:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643353661; cv=none;
        d=google.com; s=arc-20160816;
        b=s5vlTdkOfBDGRYmlBTgka7ESxYRJjaWCQrnidkjhsQJmce9m9ekeubL+9/uNLU+wbQ
         kE7inkoNpW+EseChcjLaevpTOQcBN9D4WFzAK3r3mR/V9l14/Imgvz0knbJE85Orr/2B
         Uyss4PC3Exjw5CTFz1ErN2GLKoVrwMxXKiCJ7JosiJDV+zURd1fsGshByrAFLHEoMdPH
         HKPGh910pzep0PT9ASGkvIJMLjuwrEFixnUgBO5mxLmYTSrVRZ2arZPHF+jD84tFcx+N
         dqRvyP2uud2SlRdljnNNKpf9xrnkPUSFLmKGvOmSpglnj1jgIHSrJJoylRu/qgv6IgWW
         iJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:subject;
        bh=66as3YQZzguzltgp6io9Yoz5tjmRDtw+s0nV/8zYLLQ=;
        b=YGeNI0xfuc7CQ3Tx0GNGub7AmPj+QqkhKXnY+fIW8Hd/kb3L2dSGgQQk+b6lg5U3dG
         X9Rd7JrSb6NKEM9Y/fZDL0EuRnouWuUH8b115RKIDASJrMUyoZ3Dsnw8YQpBdZ9bg8hw
         IeI8R9RXQsaIj1fEdh56aeRsp8je78DJSM++nEzhkvmM9/FIqRz+J/OvXXQUM/3eIU3l
         6fmh/nQB7f9LGhWJfqSom4NvB0lKKxf8BDTW0bbUl/gKPqjHlZcaTKJfe7bukRDYUuue
         82R7dGSefCQlLzq7LXzu/Br2vXP7uVOF/LgQezHEkJOro7kI+vZf4/J/crPNAfM9joor
         KJyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d33si772864yba.794.2022.01.27.23.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 23:07:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:43846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDLMA-00038g-1y
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 02:07:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nDLKb-00036A-HP; Fri, 28 Jan 2022 02:06:04 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:5098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nDLKK-0003TN-7r; Fri, 28 Jan 2022 02:05:51 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JlT2j4Nvwz9sVV;
 Fri, 28 Jan 2022 15:03:57 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Fri, 28 Jan 2022 15:05:18 +0800
Subject: Re: [PATCH] hw/arm/virt: Fix CPU's default NUMA node ID
To: Igor Mammedov <imammedo@redhat.com>, Gavin Shan <gshan@redhat.com>
CC: <peter.maydell@linaro.org>, <drjones@redhat.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <shan.gavin@gmail.com>
References: <20220126052410.36380-1-gshan@redhat.com>
 <20220126101447.5d4f01f9@redhat.com>
Message-ID: <f5780366-7c6e-1643-d471-1304ce6584ca@huawei.com>
Date: Fri, 28 Jan 2022 15:05:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220126101447.5d4f01f9@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
X-TUID: 3owkE6zkbLF4

Hi,

On 2022/1/26 17:14, Igor Mammedov wrote:
> On Wed, 26 Jan 2022 13:24:10 +0800
> Gavin Shan <gshan@redhat.com> wrote:
>
>> The default CPU-to-NUMA association is given by mc->get_default_cpu_node_id()
>> when it isn't provided explicitly. However, the CPU topology isn't fully
>> considered in the default association and it causes CPU topology broken
>> warnings on booting Linux guest.
>>
>> For example, the following warning messages are observed when the Linux guest
>> is booted with the following command lines.
>>
>>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>>    -accel kvm -machine virt,gic-version=host               \
>>    -cpu host                                               \
>>    -smp 6,sockets=2,cores=3,threads=1                      \
>>    -m 1024M,slots=16,maxmem=64G                            \
>>    -object memory-backend-ram,id=mem0,size=128M            \
>>    -object memory-backend-ram,id=mem1,size=128M            \
>>    -object memory-backend-ram,id=mem2,size=128M            \
>>    -object memory-backend-ram,id=mem3,size=128M            \
>>    -object memory-backend-ram,id=mem4,size=128M            \
>>    -object memory-backend-ram,id=mem4,size=384M            \
>>    -numa node,nodeid=0,memdev=mem0                         \
>>    -numa node,nodeid=1,memdev=mem1                         \
>>    -numa node,nodeid=2,memdev=mem2                         \
>>    -numa node,nodeid=3,memdev=mem3                         \
>>    -numa node,nodeid=4,memdev=mem4                         \
>>    -numa node,nodeid=5,memdev=mem5
>>           :
>>    alternatives: patching kernel code
>>    BUG: arch topology borken
>>    the CLS domain not a subset of the MC domain
>>    <the above error log repeats>
>>    BUG: arch topology borken
>>    the DIE domain not a subset of the NODE domain
>>
>> With current implementation of mc->get_default_cpu_node_id(), CPU#0 to CPU#5
>> are associated with NODE#0 to NODE#5 separately. That's incorrect because
>> CPU#0/1/2 should be associated with same NUMA node because they're seated
>> in same socket.
>>
>> This fixes the issue by considering the socket when default CPU-to-NUMA
>> is given. With this applied, no more CPU topology broken warnings are seen
>> from the Linux guest. The 6 CPUs are associated with NODE#0/1, but there are
>> no CPUs associated with NODE#2/3/4/5.
> >From migration point of view it looks fine to me, and doesn't need a compat knob
> since NUMA data (on virt-arm) only used to construct ACPI tables (and we don't
> version those unless something is broken by it).
>
>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 141350bf21..b4a95522d3 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2499,7 +2499,7 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>>   
>>   static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>>   {
>> -    return idx % ms->numa_state->num_nodes;
>> +    return idx / (ms->smp.dies * ms->smp.clusters * ms->smp.cores * ms->smp.threads);
> I'd like for ARM folks to confirm whether above is correct
> (i.e. socket is NUMA node boundary and also if above topo vars
> could have odd values. Don't look at horribly complicated x86
> as example, but it showed that vendors could stash pretty much
> anything there, so we should consider it here as well and maybe
> forbid that in smp virt-arm parser)
We now have a generic smp parser in machine-smp.c and it guarantees
different machine boards a correct group of topo vars: supported topo
vars being valid and value of unsupported ones being 1. I think it's safe
to use them here. Or am I missing something else?

Also, we may not need to include "dies" here because it's not supported
on ARM virt machine. I believe we will always have "ms->smp.dies==1"
for this machine.

Thanks,
Yanan
>>   }
>>   
>>   static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>
> .

