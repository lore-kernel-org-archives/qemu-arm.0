Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1494546lfy;
        Sat, 15 Aug 2020 11:08:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVFRHS/YD0Hp+hjbtoxvlSCmxYtkgCwRGwIW0I2UQughGtm0gpJTBrMQEtg5Wz5XtOBmPJ
X-Received: by 2002:ac8:7455:: with SMTP id h21mr7099981qtr.201.1597514937215;
        Sat, 15 Aug 2020 11:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597514937; cv=none;
        d=google.com; s=arc-20160816;
        b=phzGvrZlBSw8mxpPcF2hCAe28MW8ogEqFFse/zLJjpr74QbB3FT8o+DVYkHkaDw9yO
         2QyqPKWMof5S4FQpVz7jEAKvyC0vX2PuewcZCAzZoDIQdT5NZ6KLB/bPfP4f0PjNA9Fb
         BrlLCVahvqN1sGR/kRl1dnIZJBR6G33SvYx3YRJb3AzmWQsDqRMRFUIiQRKdLS6WhUZH
         8+9/EwxNyUMVI2oOqTZQO0mJHB417xgmFmJk6qD279aUkySS1Q69g/oNXcwIBGpkmaeC
         hGF6FHfErwWgv3AjVNa2kRZq21xl7byVmpxCaIqAYg8KHabAO8nc4nAA4NlqK/8N7Q4z
         GyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=hrmUOzIbjqu1r2jysKDuTJ4vqEv2Y6BzZbJiHYzSL3s=;
        b=Rqsid/tL/7AdtIEsknVj6/S1BRmXUA+12azghITktTsSnJFSp1XqaeritsEHdJ51ya
         X6tMWUeQDaWNmmsCRohxWfIrw+n54xSgQLlcgn0IdbypLckJzRAYg6ZaOcQiuDw3dG7h
         Q71u3mg+S7jEZ63bwZimaYzSSLOmO3EQXS+2xSsItOPJGqo2I+Sa8hJGA55Om78Lnf7H
         fwczRRXF4ALUEfUAlbWFly2o6JpLg5DmuBM01xXaBapKEhbiA+yIPF6CQTdPYKepaWoi
         ecHuYM8oXh5ZsJuUK+TcfDW2/OLedokm6EGPH+qyoqcvT71WxkwC7VPYY/75aVUID//p
         FXLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p32si7973272qtf.362.2020.08.15.11.08.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Aug 2020 11:08:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k70bw-0001XJ-Ff
	for alex.bennee@linaro.org; Sat, 15 Aug 2020 14:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k70bo-0001WF-9B; Sat, 15 Aug 2020 14:08:48 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2921 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k70bm-0007xM-Bz; Sat, 15 Aug 2020 14:08:47 -0400
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id 9D67721F0B33AE8474F6;
 Sat, 15 Aug 2020 10:19:06 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Sat, 15 Aug 2020 10:19:06 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Sat, 15 Aug 2020 10:19:05 +0800
Subject: Re: [RFC 7/9] target/arm: Add CPU features to
 query-cpu-model-expansion
To: Andrew Jones <drjones@redhat.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
 <20200813102657.2588720-8-liangpeng10@huawei.com>
 <20200813125602.drapo7wyzg57k3jy@kamzik.brq.redhat.com>
From: Peng Liang <liangpeng10@huawei.com>
Message-ID: <c14eb457-5c64-b888-2b94-fcd5e4383c70@huawei.com>
Date: Sat, 15 Aug 2020 10:19:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200813125602.drapo7wyzg57k3jy@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/15 14:08:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 mst@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 xiexiangyou 00584000 <xiexiangyou@huawei.com>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, zhukeqian 00502301 <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wrRXMnBnch88

On 8/13/2020 8:56 PM, Andrew Jones wrote:
> On Thu, Aug 13, 2020 at 06:26:55PM +0800, Peng Liang wrote:
>> Add CPU features to the result of query-cpu-model-expansion so that
>> other applications (such as libvirt) can know the supported CPU
>> features.
>>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
>> ---
>>  target/arm/cpu.c     | 41 +++++++++++++++++++++++++++++++++++++++++
>>  target/arm/cpu.h     |  2 ++
>>  target/arm/monitor.c |  2 ++
>>  3 files changed, 45 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 3fc54cb3a4..0f620e8afe 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -25,6 +25,8 @@
>>  #include "qemu/module.h"
>>  #include "qapi/error.h"
>>  #include "qapi/visitor.h"
>> +#include "qapi/qmp/qdict.h"
>> +#include "qom/qom-qobject.h"
>>  #include "cpu.h"
>>  #include "internals.h"
>>  #include "exec/exec-all.h"
>> @@ -1515,6 +1517,45 @@ static const CPUFeatureDep feature_dependencies[] = {
>>      },
>>  };
>>  
>> +static char *strtolower(char *src)
>> +{
>> +    char *start = src;
>> +
>> +    for (; *src; ++src) {
>> +        *src = tolower(*src);
>> +    }
>> +
>> +    return start;
>> +}
> 
> Shouldn't need this. The CPU property names should already be lowercase.
> 

For convenience, we use the field part defined in FIELD macro as the name of
a CPU feature.  So, the names of CPU features are upper...

>> +
>> +void arm_cpu_features_to_dict(ARMCPU *cpu, QDict *features)
>> +{
>> +    Object *obj = OBJECT(cpu);
>> +    const char *name;
>> +    ObjectProperty *prop;
>> +    bool is_32bit = !arm_feature(&cpu->env, ARM_FEATURE_AARCH64);
>> +    int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(cpu_features); ++i) {
>> +        if (is_32bit != cpu_features[i].is_32bit) {
>> +            continue;
>> +        }
>> +
>> +        name = cpu_features[i].name;
>> +        prop = object_property_find(obj, name, NULL);
>> +        if (prop) {
>> +            QObject *value;
>> +            g_autofree char *tmp;
>> +
>> +            assert(prop->get);
>> +            value = object_property_get_qobject(obj, name, &error_abort);
>> +            tmp = strtolower(g_strdup(name));
>> +
>> +            qdict_put_obj(features, tmp, value);
>> +        }
>> +    }
>> +}
>> +
>>  static void arm_cpu_get_bit_prop(Object *obj, Visitor *v, const char *name,
>>                                   void *opaque, Error **errp)
>>  {
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 5d8074d03b..da68b7f8f4 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -3933,4 +3933,6 @@ static inline bool isar_feature_any_tts2uxn(const ARMISARegisters *id)
>>  #define cpu_isar_feature(name, cpu) \
>>      ({ ARMCPU *cpu_ = (cpu); isar_feature_##name(&cpu_->isar); })
>>  
>> +void arm_cpu_features_to_dict(ARMCPU *cpu, QDict *features);
>> +
>>  #endif
>> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
>> index ba6e01abd0..f8eb29efec 100644
>> --- a/target/arm/monitor.c
>> +++ b/target/arm/monitor.c
>> @@ -225,6 +225,8 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>          }
>>      }
>>  
>> +    arm_cpu_features_to_dict(ARM_CPU(obj), qdict_out);
> 
> Since nobody is looking for these features in qdict_in, then none
> of these features can be changed by QMP user. How does the QMP
> user probe whether or not the feature will work when enabled?
> 
> Thanks,
> drew
> 

My fault, I'll correct it.

Thanks,
Peng

>> +
>>      if (!qdict_size(qdict_out)) {
>>          qobject_unref(qdict_out);
>>      } else {
>> -- 
>> 2.18.4
>>
> 
> .
> 

