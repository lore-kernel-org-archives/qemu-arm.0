Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1202422lfc;
        Thu, 4 Jun 2020 00:17:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNjeCtp+VA2Be7I9efTG5LIKLwVMWyi15rtbdBk+8UYVGpVejReELmdHLvsZYcZ7w04ML0
X-Received: by 2002:a25:ae91:: with SMTP id b17mr6038510ybj.324.1591255043670;
        Thu, 04 Jun 2020 00:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591255043; cv=none;
        d=google.com; s=arc-20160816;
        b=oXe2z13xixJ8EalzZg3uuLtTI+Tqxq+EQYK9BjOsqVXiegmQoOK3dMw5TU2Dw1g3ao
         foxPeD+TV/brEhqDSvP3YGduA2h/P77yLpDavFK76yx12mQ5oSTfbUCn0oGH4S59jsRs
         qDZmskWzQzEsmlmC7YswEAvvOJnGXUoVPRIIWevRBxe45vFYOnV75S0/VYD6rr5aVVm3
         qi1n6C15SWIWr+dQ26OoVt2HFD/1ai6jp5bpE9BBVv4OyO6J2aaIZ2P0ruZ8N8nj6Cqa
         9C5ERV27plQP0HpTmCn+NBuFEZbW6IjBU8Fb0vz7KVtGhKVCxnR9Y6+J8aR5/cymKb6E
         wkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=wyWNlyKZWunJ6qqjVUEW7CYeZ5zypuL9hyf6CylSNmo=;
        b=i8taMrUDgS22ycZ///tNHPchffCJmeK5D172uuLXw41C1jjx10fJ7besFrF/kb7xXX
         7nOAte/gekPW2RMP3qcgFMJjVcQuPgkMB5ciBtlrAlf19tUDYGnBXnTjqi+//5Y8hm4M
         9jY0vjMhURWmzBGwF2RbPjUmJfNoJS7P9ClIF/3YeDRNytGjW6DVT5cezlK4KkUFJhhm
         MHb/Rh17NGT2FonYH18UFjwozTLDrcom4tozlDdypHd12cOAgdiHpYAAc2taaRjnTcG5
         viWhotBVijUMSXxFtZh0ADo/9fG7QCUDV5oIVt6+g04qeJOaCYn7EQVAO5BvVLkB+1Uu
         2sEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x124si3613566ybc.82.2020.06.04.00.17.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 00:17:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgk7v-0001Ah-2o
	for alex.bennee@linaro.org; Thu, 04 Jun 2020 03:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1jgk7c-00017Q-IE; Thu, 04 Jun 2020 03:17:08 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:37960 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1jgk7Y-00087h-WA; Thu, 04 Jun 2020 03:17:04 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BC146BB46B7E2D1EB7C8;
 Thu,  4 Jun 2020 15:16:47 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.233) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0;
 Thu, 4 Jun 2020 15:16:37 +0800
Subject: Re: [PATCH v2] target/arm/cpu: adjust virtual time for arm cpu
To: Andrew Jones <drjones@redhat.com>
References: <20200603020208.2089-1-fangying1@huawei.com>
 <20200603082600.efes4srlft3xv2tq@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <df1422fc-968c-bf38-48f2-8eb87d236b80@huawei.com>
Date: Thu, 4 Jun 2020 15:16:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200603082600.efes4srlft3xv2tq@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.233]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 03:16:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 wu.wubin@huawei.com, zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c+vT5YgcKSap



On 6/3/2020 4:26 PM, Andrew Jones wrote:
> On Wed, Jun 03, 2020 at 10:02:08AM +0800, Ying Fang wrote:
>> Virtual time adjustment was implemented for virt-5.0 machine type,
>> but the cpu property was enabled only for host-passthrough and
>> max cpu model. Let's add it for arm cpu which has the gernic
>> timer feature enabled.
>>
>>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>>
>> ---
>> v2:
>> - move kvm_arm_add_vcpu_properties into arm_cpu_post_init
>>
>> v1:
>> - initial commit
>> - https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg08518.html
>>
>> ---
>>   target/arm/cpu.c   | 3 +--
>>   target/arm/cpu64.c | 1 -
>>   2 files changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 32bec156f2..1e9b7a51f2 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1244,6 +1244,7 @@ void arm_cpu_post_init(Object *obj)
>>   
>>       if (arm_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER)) {
>>           qdev_property_add_static(DEVICE(cpu), &arm_cpu_gt_cntfrq_property);
>> +        kvm_arm_add_vcpu_properties(obj);
> 
> The name 'kvm_arm_add_vcpu_properties' says nothing about being specific
> to the timer. So this is either the wrong place for this function, or the
> function is named wrong. I'd say it's the wrong place, because, as the
> comment above kvm_arm_add_vcpu_properties() implies, the function is
> for all 'kvm-*' prefixed properties, not just timer related ones. It's
> true we don't have any others yet, but we will. I have plans to post
can't agree more.

> kvm-steal-time soon, and despite it also having 'time' in its name, it
> shouldn't depend on ARM_FEATURE_GENERIC_TIMER.
yes, that would be nice.

> 
> How about the below [untested] patch instead?
this patch is much more reasonable for me, thanks for your help.
I've tested it and it works fine.

> 
> Thanks,
> drew
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 32bec156f2d4..e9084f98ef10 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1245,6 +1245,10 @@ void arm_cpu_post_init(Object *obj)
>       if (arm_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER)) {
>           qdev_property_add_static(DEVICE(cpu), &arm_cpu_gt_cntfrq_property);
>       }
> +
> +    if (kvm_enabled()) {
> +        kvm_arm_add_vcpu_properties()

should be kvm_arm_add_vcpu_properties(obj);

> +    }
>   }
>   
>   static void arm_cpu_finalizefn(Object *obj)
> @@ -2029,7 +2033,6 @@ static void arm_max_initfn(Object *obj)
>   
>       if (kvm_enabled()) {
>           kvm_arm_set_cpu_features_from_host(cpu);
> -        kvm_arm_add_vcpu_properties(obj);
>       } else {
>           cortex_a15_initfn(obj);
>   
> @@ -2183,7 +2186,6 @@ static void arm_host_initfn(Object *obj)
>       if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>           aarch64_add_sve_properties(obj);
>       }
> -    kvm_arm_add_vcpu_properties(obj);
>       arm_cpu_post_init(obj);
>   }
>   
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index cbc5c3868fce..778cecc2e6ca 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -592,7 +592,6 @@ static void aarch64_max_initfn(Object *obj)
>   
>       if (kvm_enabled()) {
>           kvm_arm_set_cpu_features_from_host(cpu);
> -        kvm_arm_add_vcpu_properties(obj);
>       } else {
>           uint64_t t;
>           uint32_t u;
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 4bdbe6dcac07..eef3bbd1cc2c 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -194,17 +194,18 @@ static void kvm_no_adjvtime_set(Object *obj, bool value, Error **errp)
>   /* KVM VCPU properties should be prefixed with "kvm-". */
>   void kvm_arm_add_vcpu_properties(Object *obj)
>   {
> -    if (!kvm_enabled()) {
> -        return;
> -    }
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    CPUARMState *env = &cpu->env;
>   
> -    ARM_CPU(obj)->kvm_adjvtime = true;
> -    object_property_add_bool(obj, "kvm-no-adjvtime", kvm_no_adjvtime_get,
> -                             kvm_no_adjvtime_set);
> -    object_property_set_description(obj, "kvm-no-adjvtime",
> -                                    "Set on to disable the adjustment of "
> -                                    "the virtual counter. VM stopped time "
> -                                    "will be counted.");
> +    if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
> +        cpu->kvm_adjvtime = true;
> +        object_property_add_bool(obj, "kvm-no-adjvtime", kvm_no_adjvtime_get,
> +                                 kvm_no_adjvtime_set);
> +        object_property_set_description(obj, "kvm-no-adjvtime",
> +                                        "Set on to disable the adjustment of "
> +                                        "the virtual counter. VM stopped time "
> +                                        "will be counted.");
> +    }
>   }
>   
>   bool kvm_arm_pmu_supported(CPUState *cpu)
> 
> 
>>       }
>>   }
>>   
>> @@ -2029,7 +2030,6 @@ static void arm_max_initfn(Object *obj)
>>   
>>       if (kvm_enabled()) {
>>           kvm_arm_set_cpu_features_from_host(cpu);
>> -        kvm_arm_add_vcpu_properties(obj);
>>       } else {
>>           cortex_a15_initfn(obj);
>>   
>> @@ -2183,7 +2183,6 @@ static void arm_host_initfn(Object *obj)
>>       if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>>           aarch64_add_sve_properties(obj);
>>       }
>> -    kvm_arm_add_vcpu_properties(obj);
>>       arm_cpu_post_init(obj);
>>   }
>>   
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index cbc5c3868f..778cecc2e6 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -592,7 +592,6 @@ static void aarch64_max_initfn(Object *obj)
>>   
>>       if (kvm_enabled()) {
>>           kvm_arm_set_cpu_features_from_host(cpu);
>> -        kvm_arm_add_vcpu_properties(obj);
>>       } else {
>>           uint64_t t;
>>           uint32_t u;
>> -- 
>> 2.23.0
>>
>>
>>
> 
> 
> .
> 

