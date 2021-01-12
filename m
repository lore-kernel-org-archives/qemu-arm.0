Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3550861lfq;
        Tue, 12 Jan 2021 05:27:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6N3NsVyzx80Acdn5dh8pFgryWYeR9CG3pbIs1qXHbn2K5NJ2j8epp2PlDdGKj6XJ1BmVs
X-Received: by 2002:a25:5015:: with SMTP id e21mr2827815ybb.14.1610458057717;
        Tue, 12 Jan 2021 05:27:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610458057; cv=none;
        d=google.com; s=arc-20160816;
        b=1EGJ1AQHDfnuHc1U2uNT9s0cWRjpb6nsv8JEe7ZGE4VeK84m8w4pmYasgjKcwqdj5j
         sLxSdtcV7ZNNYu1ZAj9Vz9wlVkM7/AvyHXe1pyRnbIpt98YBzo2ghEIX3PJBeljNHNb+
         kHSxjZOXOobz4gn0TZ8+mIvUD+q/4K4MzTwll06MgiOVVc1uIr0ZIQ/CmtpZWuByf6q+
         wx8dJQBRD5rzG4TxSOI6Ftn7BHXiDG7Z/wGTHP/wwGx19gxKeNO/gtr9cIxQMtNUatAq
         ClMCQAxSn6w/DbTDZ3dN9W88LxgOwEK11eDtxBklXlD6sEGb+HFuL+KaplCASQvMroh4
         nVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=YrJJNCO7Xuc20nOJZx9QC2M4P5D6EQpX8fzbvB3tPmc=;
        b=GMtu81xkyCcsep45jkUh6OvrHjIgOY0oJJATMS6lWKzbWPrgBZwkx2eHbmKrgcW+p9
         1wmnmEvGvMnY09+xeAfhXI6UUtw6/q3p+KUAHUIm6QDaffeVfFfvdOctIhebEvdyusKu
         byGA/HC5SkXoWSyQmxBMAICDp1z2oK2cnL8bfGlZPoyo6cq9s4Q9hsCooEZjuY3Jdsod
         lRE1QsjqAKchOfFID2+dp9dhBZk3MqwPqFzFUGbxt7fJH7y8wpzECS79bloMdmDghrti
         uMEuk2OE9Uy0Wp3+a3CrbtHZiS9zLF2+DV1J08fsBWzbiQoRjz5Kd8jLFyv+pMh9BVcr
         HCcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si2551654ybc.387.2021.01.12.05.27.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 05:27:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzJhx-0005mB-4I
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 08:27:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kzJhj-0005ke-Kp; Tue, 12 Jan 2021 08:27:23 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kzJgu-0007dj-07; Tue, 12 Jan 2021 08:27:23 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DFWXH2sT5z15s2h;
 Tue, 12 Jan 2021 21:25:03 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Tue, 12 Jan 2021 21:25:56 +0800
Subject: Re: [RFC PATCH v3 10/13] target/arm/cpu: Add cpu cache description
 for arm
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201109030452.2197-1-fangying1@huawei.com>
 <20201109030452.2197-11-fangying1@huawei.com>
 <CAFEAcA-CuagYtA_9c7KrkvoBJqKnUNnT7M=C_MN1EnU4k1kAxQ@mail.gmail.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <41e9d848-c478-8873-769b-e1cc85253db7@huawei.com>
Date: Tue, 12 Jan 2021 21:25:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-CuagYtA_9c7KrkvoBJqKnUNnT7M=C_MN1EnU4k1kAxQ@mail.gmail.com>
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
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, salil.mehta@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5d6ftWUkRh2O



On 11/30/2020 9:00 PM, Peter Maydell wrote:
> On Mon, 9 Nov 2020 at 03:05, Ying Fang <fangying1@huawei.com> wrote:
>>
>> Add the CPUCacheInfo structure to hold cpu cache information for ARM cpus.
>> A classic three level cache topology is used here. The default cache
>> capacity is given and userspace can overwrite these values.
>>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> ---
>>   target/arm/cpu.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>   target/arm/cpu.h | 27 +++++++++++++++++++++++++++
>>   2 files changed, 69 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 056319859f..f1bac7452c 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -27,6 +27,7 @@
>>   #include "qapi/visitor.h"
>>   #include "cpu.h"
>>   #include "internals.h"
>> +#include "qemu/units.h"
>>   #include "exec/exec-all.h"
>>   #include "hw/qdev-properties.h"
>>   #if !defined(CONFIG_USER_ONLY)
>> @@ -997,6 +998,45 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
>>       return (Aff1 << ARM_AFF1_SHIFT) | Aff0;
>>   }
>>
>> +static CPUCaches default_cache_info = {
>> +    .l1d_cache = &(CPUCacheInfo) {
>> +    .type = DATA_CACHE,
>> +        .level = 1,
>> +        .size = 64 * KiB,
>> +        .line_size = 64,
>> +        .associativity = 4,
>> +        .sets = 256,
>> +        .attributes = 0x02,
>> +    },
> 
> Would it be possible to populate this structure from the
> CLIDR/CCSIDR ID register values, rather than having to
> specify the same thing in two places?

Sorry I missed this reply.

I had tried to fetch CLIDR/CCSID ID register values of host cpu
from KVM, however I did not get the value expected. May I made
some mistakes in KVM side.

Thanks for your guide, I'll try to populate them again.

> 
> thanks
> -- PMM
> .
> 

Thanks.
Ying.
