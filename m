Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp550204lfk;
        Wed, 13 Apr 2022 19:27:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5BHxlW/thMYqIv7me6iPhTr0H/KbE5RnphnR4Ywu/DfDevtUgTYTGvp0uDbGRzHc2lNla
X-Received: by 2002:a05:620a:448c:b0:67d:4fe3:2b96 with SMTP id x12-20020a05620a448c00b0067d4fe32b96mr348196qkp.663.1649903272844;
        Wed, 13 Apr 2022 19:27:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649903272; cv=none;
        d=google.com; s=arc-20160816;
        b=yJU24Mb4m6/z3CHXs89LXpgeq2Vsw+BHCW4gJSGlBWpMNH9mForf1LuAT2FaX75iC7
         E5C4QFgwtRCsJN/U9aO7JkbC8MkVwr6luBw3KeIHyB1vhyxQgFm8lNRQWDMwAwcdXbMv
         AFfSkHaEssMlLchMuD+LLducal5tHs/o7U0hwBHrEhypnXb5IqHeN66wHcsBjpHLJ1eQ
         2MKbJk/LiorsJHgU/fQOKpNSINFFowRAf6+i+sdK11y6rFr5nEPm6U15FoswFkoCL3Al
         iPP/F12syFFX2J4Gw8XJX79eiW6+X9m+5/ij0248HPGgHL1Bohp1HE/HLIK9CQTdSDUh
         ogkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:subject;
        bh=gwLs0inWPdCKEhjEG75JO7Pu+2drok68ASQYOKHtk9E=;
        b=A0RgIrmj7SJEJFzJYSj1+n4kDoQZqTc/dWvqsxemftENEddZEinOdaRlXPECrFcL8F
         F41QMl5fs5a/0Sbzcz3R83JINS4RIo37Bbb5mmtYtovcbgsTG7JTCpdrwTd32WY7I9h3
         pm0zli5xdCcrtOvbSGjq/f5dTPSKZbZEbrv9gV/4bEDtGYc9IVSwlYVf4F+lEu4Mt1ca
         11dCjhMM+/i2uqQUbh9eE/sVQF+x/daPmWD1i522J3ZlJujNKFCQANJLblLBIimQqvS5
         5ohXXt0Y/CCbgtFoqml810e/HnyGHZ8xETzHjxldfFYAB7vUFedn6IRLutOg+SIshSqz
         GPJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13-20020ac844ad000000b002ed0f5c2dd9si6760544qto.107.2022.04.13.19.27.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Apr 2022 19:27:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:53290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nepD6-0002jW-90
	for alex.bennee@linaro.org; Wed, 13 Apr 2022 22:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nepCt-0002g5-SF; Wed, 13 Apr 2022 22:27:39 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nepCr-0000qv-Ew; Wed, 13 Apr 2022 22:27:39 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Kf3GZ74dYzgYht;
 Thu, 14 Apr 2022 10:25:42 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2375.24; Thu, 14 Apr 2022 10:27:32 +0800
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
Message-ID: <ea5ab7db-1831-83a5-1719-239930b37571@huawei.com>
Date: Thu, 14 Apr 2022 10:27:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <27df8771-ebe0-b5fe-39c4-83696e21e3a3@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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
X-TUID: mxYV7in3gBDO

On 2022/4/14 8:08, Gavin Shan wrote:
> Hi Yanan,
>
> On 4/13/22 8:39 PM, wangyanan (Y) wrote:
>> On 2022/4/3 22:59, Gavin Shan wrote:
>>> Currently, the SMP configuration isn't considered when the CPU
>>> topology is populated. In this case, it's impossible to provide
>>> the default CPU-to-NUMA mapping or association based on the socket
>>> ID of the given CPU.
>>>
>>> This takes account of SMP configuration when the CPU topology
>>> is populated. The die ID for the given CPU isn't assigned since
>>> it's not supported on arm/virt machine yet.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   hw/arm/virt.c | 16 +++++++++++++++-
>>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index d2e5ecd234..3174526730 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -2505,6 +2505,7 @@ static const CPUArchIdList 
>>> *virt_possible_cpu_arch_ids(MachineState *ms)
>>>       int n;
>>>       unsigned int max_cpus = ms->smp.max_cpus;
>>>       VirtMachineState *vms = VIRT_MACHINE(ms);
>>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>>       if (ms->possible_cpus) {
>>>           assert(ms->possible_cpus->len == max_cpus);
>>> @@ -2518,8 +2519,21 @@ static const CPUArchIdList 
>>> *virt_possible_cpu_arch_ids(MachineState *ms)
>>>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>>>           ms->possible_cpus->cpus[n].arch_id =
>>>               virt_cpu_mp_affinity(vms, n);
>>> +
>>> +        assert(!mc->smp_props.dies_supported);
>>> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
>>> +        ms->possible_cpus->cpus[n].props.socket_id =
>>> +            (n / (ms->smp.clusters * ms->smp.cores * 
>>> ms->smp.threads)) %
>>> +            ms->smp.sockets;
>> No need for "% ms->smp.sockets".
>
> Yeah, lets remove it in v6.
>
>>> + ms->possible_cpus->cpus[n].props.has_cluster_id = true;
>>> +        ms->possible_cpus->cpus[n].props.cluster_id =
>>> +            (n / (ms->smp.cores * ms->smp.threads)) % 
>>> ms->smp.clusters;
>>> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
>>> +        ms->possible_cpus->cpus[n].props.core_id =
>>> +            (n / ms->smp.threads) % ms->smp.cores;
>>>           ms->possible_cpus->cpus[n].props.has_thread_id = true;
>>> -        ms->possible_cpus->cpus[n].props.thread_id = n;
>>> +        ms->possible_cpus->cpus[n].props.thread_id =
>>> +            n % ms->smp.threads;
>>>       }
>>>       return ms->possible_cpus;
>>>   }
>> Otherwise, looks good to me:
>> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
>>
>
> Thanks for your time to review :)
>
>
Oh, after further testing this patch breaks numa-test for aarch64,
which should be checked and fixed. I guess it's because we have
more IDs supported for ARM. We have to fully running the QEMU
tests before sending some patches to ensure that they are not
breaking anything. :)

Thanks,
Yanan
>
> .

