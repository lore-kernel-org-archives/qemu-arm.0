Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp558412lfk;
        Wed, 13 Apr 2022 19:50:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1zRaU9/QpcvmIRZ5WWsaaGeWlLkngOfiRa7NDHbPoDbONosOtH03+D8I91s/K8bzYA+T0
X-Received: by 2002:a05:620a:c51:b0:67b:98be:61b3 with SMTP id u17-20020a05620a0c5100b0067b98be61b3mr440873qki.136.1649904654219;
        Wed, 13 Apr 2022 19:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649904654; cv=none;
        d=google.com; s=arc-20160816;
        b=MzaNOJFswjzMT1yZe0LJABlV4gnjwOXJQ/Rp/McbOlcStt1X+sA4H/kW++oAjoqZXz
         91gt6xVV6w02FGpLYVIcakqHbVNhcTuBBsbblZ1Bno/qG1GW2dfHThOWtzzHr0sAT1CE
         tca4snrzmKrXFGt+L58aCQcRflLGx429EU4ML41UfXxxFi/5PPozPJwBYSsuga63n9/e
         njC7OtFyNOC8Dxb5ffICWFllP2byE4DAPVhXzq7dEwo0eWJL1sxS9SYADEYstP+SDKv5
         qvqcGp4K0IUO+kmT2XET3iPG9Oi2ku8l1WRyG0fQavLxctoNrbkSl4AAu6vqxqFS66IJ
         hobA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:subject;
        bh=yPJIXlW2EGb0oFHOWecCDDiHX5UC2vw7hCByan3hoAg=;
        b=gENmPQuHm2w3vTpOxqEA+xd9sBX6TsU8qQzR6m3RwEypmWy2jrCQUZp3IwdFolZDr8
         MJlYsw8wjH4Ua4yUicd3Xi2L1NCWSLwzGbo8nDoup432wpUXuH98Yivx1WpOnJmE67Pw
         0vJx/dCOKRQd2Cg31FUzTHj0PiZQ8TDbDX5rHirMNz/An2jwYvl2sWpbmsmJ3O0HG2k3
         1KrYcKOpf8CGSWDk3Y5Ff7VaTnv+8X8DRaqD6Dw1bVsAFR+JAkeyH6TsgYl56GhuhI4Y
         Lc9YOaQTEbTxy6EjwY8nkREvsKgEYEXBj/asHjXQtBJCDcQEnMNo6cPuMSpqcnRIll3+
         Ajwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y62-20020a379641000000b0069a127363afsi6844247qkd.554.2022.04.13.19.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Apr 2022 19:50:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:60828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nepZN-0000RK-Ov
	for alex.bennee@linaro.org; Wed, 13 Apr 2022 22:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nepYb-0000R4-4B; Wed, 13 Apr 2022 22:50:05 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:5145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nepYX-0004Me-Pr; Wed, 13 Apr 2022 22:50:04 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Kf3lh3rpSzFpl7;
 Thu, 14 Apr 2022 10:47:28 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2375.24; Thu, 14 Apr 2022 10:49:53 +0800
Subject: Re: [PATCH v5 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: Gavin Shan <gshan@redhat.com>, <qemu-arm@nongnu.org>
CC: <qemu-devel@nongnu.org>, <imammedo@redhat.com>, <drjones@redhat.com>,
 <richard.henderson@linaro.org>, <peter.maydell@linaro.org>,
 <zhenyzha@redhat.com>, <shan.gavin@gmail.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-3-gshan@redhat.com>
 <6f713fec-71e6-3300-a504-817f45a82a51@huawei.com>
 <27df8771-ebe0-b5fe-39c4-83696e21e3a3@redhat.com>
 <ea5ab7db-1831-83a5-1719-239930b37571@huawei.com>
 <c49d80af-f68b-1b5c-a808-848172d88f89@redhat.com>
Message-ID: <f02ae2ce-0256-ac85-0bb7-bd34244d9781@huawei.com>
Date: Thu, 14 Apr 2022 10:49:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <c49d80af-f68b-1b5c-a808-848172d88f89@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-arm@nongnu.org>
X-TUID: PVk8W6KuOwt4

On 2022/4/14 10:37, Gavin Shan wrote:
> Hi Yanan,
>
> On 4/14/22 10:27 AM, wangyanan (Y) wrote:
>> On 2022/4/14 8:08, Gavin Shan wrote:
>>> On 4/13/22 8:39 PM, wangyanan (Y) wrote:
>>>> On 2022/4/3 22:59, Gavin Shan wrote:
>>>>> Currently, the SMP configuration isn't considered when the CPU
>>>>> topology is populated. In this case, it's impossible to provide
>>>>> the default CPU-to-NUMA mapping or association based on the socket
>>>>> ID of the given CPU.
>>>>>
>>>>> This takes account of SMP configuration when the CPU topology
>>>>> is populated. The die ID for the given CPU isn't assigned since
>>>>> it's not supported on arm/virt machine yet.
>>>>>
>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>> ---
>>>>>   hw/arm/virt.c | 16 +++++++++++++++-
>>>>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>> index d2e5ecd234..3174526730 100644
>>>>> --- a/hw/arm/virt.c
>>>>> +++ b/hw/arm/virt.c
>>>>> @@ -2505,6 +2505,7 @@ static const CPUArchIdList 
>>>>> *virt_possible_cpu_arch_ids(MachineState *ms)
>>>>>       int n;
>>>>>       unsigned int max_cpus = ms->smp.max_cpus;
>>>>>       VirtMachineState *vms = VIRT_MACHINE(ms);
>>>>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>>>>       if (ms->possible_cpus) {
>>>>>           assert(ms->possible_cpus->len == max_cpus);
>>>>> @@ -2518,8 +2519,21 @@ static const CPUArchIdList 
>>>>> *virt_possible_cpu_arch_ids(MachineState *ms)
>>>>>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>>>>>           ms->possible_cpus->cpus[n].arch_id =
>>>>>               virt_cpu_mp_affinity(vms, n);
>>>>> +
>>>>> +        assert(!mc->smp_props.dies_supported);
>>>>> + ms->possible_cpus->cpus[n].props.has_socket_id = true;
>>>>> +        ms->possible_cpus->cpus[n].props.socket_id =
>>>>> +            (n / (ms->smp.clusters * ms->smp.cores * 
>>>>> ms->smp.threads)) %
>>>>> +            ms->smp.sockets;
>>>> No need for "% ms->smp.sockets".
>>>
>>> Yeah, lets remove it in v6.
>>>
>>>>> + ms->possible_cpus->cpus[n].props.has_cluster_id = true;
>>>>> +        ms->possible_cpus->cpus[n].props.cluster_id =
>>>>> +            (n / (ms->smp.cores * ms->smp.threads)) % 
>>>>> ms->smp.clusters;
>>>>> + ms->possible_cpus->cpus[n].props.has_core_id = true;
>>>>> +        ms->possible_cpus->cpus[n].props.core_id =
>>>>> +            (n / ms->smp.threads) % ms->smp.cores;
>>>>> ms->possible_cpus->cpus[n].props.has_thread_id = true;
>>>>> -        ms->possible_cpus->cpus[n].props.thread_id = n;
>>>>> +        ms->possible_cpus->cpus[n].props.thread_id =
>>>>> +            n % ms->smp.threads;
>>>>>       }
>>>>>       return ms->possible_cpus;
>>>>>   }
>>>> Otherwise, looks good to me:
>>>> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
>>>>
>>>
>>> Thanks for your time to review :)
>>>
>>>
>> Oh, after further testing this patch breaks numa-test for aarch64,
>> which should be checked and fixed. I guess it's because we have
>> more IDs supported for ARM. We have to fully running the QEMU
>> tests before sending some patches to ensure that they are not
>> breaking anything. :)
>>
>
> Thanks for catching the failure and reporting back. I'm not
> too much familar with QEMU's test workframe. Could you please
> share the detailed commands to reproduce the failure? I will
> fix in v6, which will be done in a separate patch :)
>
There is a reference link: https://wiki.qemu.org/Testing
To catch the failure of this patch: "make check" will be enough.

Thanks,
Yanan
> Thanks,
> Gavin
>
>
> .

