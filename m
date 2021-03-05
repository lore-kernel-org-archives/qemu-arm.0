Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp73153lfg;
        Thu, 4 Mar 2021 22:14:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiiHo6EbwXCt3gyuQ4uSMDZDHjcucC+2e5auUvxKs8g8iIhQb5koIi125rd1FH3d/+o/VO
X-Received: by 2002:a25:4086:: with SMTP id n128mr11253835yba.522.1614924880820;
        Thu, 04 Mar 2021 22:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614924880; cv=none;
        d=google.com; s=arc-20160816;
        b=iBMFgMd+qzYUIa1epMjAghscdkVjfSJpWcOjyk7qrDtLs77drUKBeIWXN172EUfJlw
         Bel7pDnYsjcJtQWsbSRsgvXIGLoNN42FZ+EFgh88njg98P5prGaa2huvpXwJYNRyA2Am
         BkilgnX/tFc27EZmuQiS9J+4Z6zxTzHVKuQwUWMLORCIg81qwktbzwRabJd0x/nbKQ3M
         7Z8+oGuHV8CPiee7qaJe7UOBUaXF3Tk8QaFICdhbi8e2Z8+FdKFwSstSSLXUmeOrtXxZ
         wl9JyqdQ3mZhik3LSiDwuowx3l99eHEWiKYgK22eKJTgYGAGJ0BQct4mIFu5ky50c0v7
         dNWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=MEhK3vHh6mrHI14BrH9fzyA4dJPnS73bbWJTf9WzY/U=;
        b=FGSIbJ7kJnFHr4z0odZ8/TXe2GmHeRm1+A7uiIKtiWz3ba3OA44JI8hPwWyMbUhweV
         Usb2vgbIflexyvodr1Plkts289xmj2XAynu27Nyd4vIpT0YF90n/F3WZgVEaGnQ4dobv
         LNYYf9xdU+TUICuRKRESTxQg22HkN97eU8ROFa77kfK5mxUq2QgFcM8Bgh4BRuB229Hu
         gjUEuFhk6mRJcsDMySmZbLRaEdJdYizbpfDrhiehCYVHc6cjuunJLQ5n5KXZb+Cw5qGR
         ug7WgeeNk2arFKMZ5wdn1O3A3n2KdgYA5dM0/ft9XfjGbe+xCNaW1nfMrt59itokesoh
         OOIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x126si1612492ybx.192.2021.03.04.22.14.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 22:14:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lI3jU-0000oC-1y
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 01:14:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lI3jK-0000nn-G2; Fri, 05 Mar 2021 01:14:30 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lI3jH-00061r-6H; Fri, 05 Mar 2021 01:14:30 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DsHSj4ng3zlSJ5;
 Fri,  5 Mar 2021 14:12:05 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Fri, 5 Mar 2021 14:14:06 +0800
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Introduce cpu topology support
To: Andrew Jones <drjones@redhat.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
 <20210225120255.4gfbtsflbdsyxizn@kamzik.brq.redhat.com>
 <261f7e04-ea59-6883-981f-3891c240416e@huawei.com>
 <20210301094804.teo4szecdppo5dp5@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <50ae84fd-14d6-e74f-1afb-5b87be599ca2@huawei.com>
Date: Fri, 5 Mar 2021 14:14:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210301094804.teo4szecdppo5dp5@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, salil.mehta@huawei.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LS5fturRU6Qu



On 3/1/2021 5:48 PM, Andrew Jones wrote:
> On Fri, Feb 26, 2021 at 04:41:45PM +0800, Ying Fang wrote:
>>
>>
>> On 2/25/2021 8:02 PM, Andrew Jones wrote:
>>> On Thu, Feb 25, 2021 at 04:56:22PM +0800, Ying Fang wrote:
>>>> An accurate cpu topology may help improve the cpu scheduler's decision
>>>> making when dealing with multi-core system. So cpu topology description
>>>> is helpful to provide guest with the right view. Dario Faggioli's talk
>>>> in [0] also shows the virtual topology may has impact on sched performace.
>>>> Thus this patch series is posted to introduce cpu topology support for
>>>> arm platform.
>>>>
>>>> Both fdt and ACPI are introduced to present the cpu topology. To describe
>>>> the cpu topology via ACPI, a PPTT table is introduced according to the
>>>> processor hierarchy node structure. This series is derived from [1], in
>>>> [1] we are trying to bring both cpu and cache topology support for arm
>>>> platform, but there is still some issues to solve to support the cache
>>>> hierarchy. So we split the cpu topology part out and send it seperately.
>>>> The patch series to support cache hierarchy will be send later since
>>>> Salil Mehta's cpu hotplug feature need the cpu topology enabled first and
>>>> he is waiting for it to be upstreamed.
>>>>
>>>> This patch series was initially based on the patches posted by Andrew Jones [2].
>>>> I jumped in on it since some OS vendor cooperative partner are eager for it.
>>>> Thanks for Andrew's contribution.
>>>>
>>>> After applying this patch series, launch a guest with virt-6.0 and cpu
>>>> topology configured with sockets:cores:threads = 2:4:2, you will get the
>>>> bellow messages with the lscpu command.
>>>>
>>>> -----------------------------------------
>>>> Architecture:                    aarch64
>>>> CPU op-mode(s):                  64-bit
>>>> Byte Order:                      Little Endian
>>>> CPU(s):                          16
>>>> On-line CPU(s) list:             0-15
>>>> Thread(s) per core:              2
>>>
>>> What CPU model was used? Did it actually support threads? If these were
>>
>> It's tested on Huawei Kunpeng 920 CPU model and vcpu host-passthrough.
>> It does not support threads for now, but the next version 930 may
>> support it. Here we emulate a virtual cpu topology, a virtual 2 threads
>> is used to do the test.
>>
>>
>>> KVM VCPUs, then I guess MPIDR.MT was not set on the CPUs. Apparently
>>> that didn't confuse Linux? See [1] for how I once tried to deal with
>>> threads.
>>>
>>> [1] https://github.com/rhdrjones/qemu/commit/60218e0dd7b331031b644872d56f2aca42d0ff1e
>>>
>>
>> If ACPI PPTT table is specified, the linux kernel won't check the MPIDR
>> register to populate cpu topology. Moreover MPIDR does not ensure a
>> right cpu topology. So it won't be a problem if MPIDR.MT is not set.
> 
> OK, so Linux doesn't care about MPIDR.MT with ACPI. What happens with
> DT?

Behind the logical of Linux kernel, it tries to parse cpu topology in
smp_prepare_cpus (arch/arm64/kernel/topology.c). If cpu topology is
provided via DT, Linux kernel won't check MPIDR any more. This is the
same with ACPI enabled.

> 
>>
>>>> Core(s) per socket:              4
>>>> Socket(s):                       2
>>>
>>> Good, but what happens if you specify '-smp 16'? Do you get 16 sockets
>                ^^ You didn't answer this question.

The latest qemu use smp_parse the parse -smp command line, by default if
-smp 16 is given, arm64 virt machine will get 16 sockets.

> 
>>> each with 1 core? Or, do you get 1 socket with 16 cores? And, which do
>>> we want and why? If you look at [2], then you'll see I was assuming we
>>> want to prefer cores over sockets, since without topology descriptions
>>> that's what the Linux guest kernel would do.
>>>
>>> [2] https://github.com/rhdrjones/qemu/commit/c0670b1bccb4d08c7cf7c6957cc8878a2af131dd
>>>

Thanks, I'll check the default way Linux does.

>>>> NUMA node(s):                    2
>>>
>>> Why do we have two NUMA nodes in the guest? The two sockets in the
>>> guest should not imply this.
>>
>> The two NUMA nodes are emulated by Qemu since we already have guest numa
>> topology feature.
> 
> That's what I suspected, and I presume only a single node is present when
> you don't use QEMU's NUMA feature - even when you supply a VCPU topology
> with multiple sockets?

Agreed, I would like single numa node too if we do not use guest
numa feature. Here I provide the guest with two numa nodes and set the 
cpu affinity only to do a test.


> 
> Thanks,
> drew
> 
>> So the two sockets in the guest has nothing to do with
>> it. Actually even one socket may have two numa nodes in it in real cpu
>> model.
>>
>>>
>>> Thanks,
>>> drew
>>>
>>>> Vendor ID:                       HiSilicon
>>>> Model:                           0
>>>> Model name:                      Kunpeng-920
>>>> Stepping:                        0x1
>>>> BogoMIPS:                        200.00
>>>> NUMA node0 CPU(s):               0-7
>>>> NUMA node1 CPU(s):               8-15
>>>>
>>>> [0] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines-friend-or-foe-dario-faggioli-suse
>>>> [1] https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg02166.html
>>>> [2] https://patchwork.ozlabs.org/project/qemu-devel/cover/20180704124923.32483-1-drjones@redhat.com
>>>>
>>>> Ying Fang (5):
>>>>     device_tree: Add qemu_fdt_add_path
>>>>     hw/arm/virt: Add cpu-map to device tree
>>>>     hw/arm/virt-acpi-build: distinguish possible and present cpus
>>>>     hw/acpi/aml-build: add processor hierarchy node structure
>>>>     hw/arm/virt-acpi-build: add PPTT table
>>>>
>>>>    hw/acpi/aml-build.c          | 40 ++++++++++++++++++++++
>>>>    hw/arm/virt-acpi-build.c     | 64 +++++++++++++++++++++++++++++++++---
>>>>    hw/arm/virt.c                | 40 +++++++++++++++++++++-
>>>>    include/hw/acpi/acpi-defs.h  | 13 ++++++++
>>>>    include/hw/acpi/aml-build.h  |  7 ++++
>>>>    include/hw/arm/virt.h        |  1 +
>>>>    include/sysemu/device_tree.h |  1 +
>>>>    softmmu/device_tree.c        | 45 +++++++++++++++++++++++--
>>>>    8 files changed, 204 insertions(+), 7 deletions(-)
>>>>
>>>> -- 
>>>> 2.23.0
>>>>
>>>
>>> .
>>>
>>
> 
> .
> 
