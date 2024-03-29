Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1799628ejv;
        Fri, 29 Mar 2024 06:03:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVulqlZn+RBbBk6IfCz9HooQLzlitr+wm0blXUozCMKyYjkRY3iIRQLUH8oXK3BHi61JmmrlVauC4+HSudNZZDRXPRwlHd2
X-Received: by 2002:a17:906:7cf:b0:a4e:23af:f046 with SMTP id m15-20020a17090607cf00b00a4e23aff046mr1544546ejc.26.1711717431752;
        Fri, 29 Mar 2024 06:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711717431; cv=none;
        d=google.com; s=arc-20160816;
        b=WsWiPEQfuQdm/1mX7JIpDajNWqe4BbpNjEHeWNF+wS963haCrGeyFOrOgXQwoCV4m9
         PJvxH9hpRvpqvYe5BkH4k7O853ZprQR66fuuxQhfr70/E3tezNQxgTaJjB+7S9qKuAEs
         VGRASjtWvVupPoe2ST2Yj0Hc8Pjw3otrzYGHGIx/LnectayvM8DYlfU60b2vy3/tLTqa
         ywJSaxgSl9iksS/XHW2C6oUnyfhBK2xTKKNBB80ljYcHCTGrnb/9S/MWa5XIjYGasO/3
         xaYI/C9fwVjK9mTtx5Gk1vSto03Oiyp2K8l9KKllFdLchAgG69g/r0M7s3Wou6tUS7zD
         lgLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fF0AEMcN53T8zLpULJXCYH56leqwh2GeC0VdcdisnsI=;
        fh=KMbMVeBU7dQ7xAtEpDB5qNvq67gBD87Zbn0HPdOU49I=;
        b=Ay0sQo7P6M06dcz0SzPabTDoLkqY8pWNRLcQNaalmetr0PivBxQDcnlaKkQu307KJn
         cJHwSv7JgUEr6MDeqPVnVdJ1mH23Ju4CfRBvu3cn1TrxkN8GR01tz8p0+nQXPLhTyipB
         NtYDIm+yVu5Skxyz/wvZiZl5XuWZrYUFCTNHr/Kl7+OEu3nQlma8cgwoH4Z7/oQi165l
         O+QodgHdigcbrMK4L3TdbWw5b6IwQS4ZsY1I1PxB+QWiHN/huvwOg/ruH0RCB1i4N8YN
         0VfuulMT+BEHXfE+l22HF0Su5Nm9bBhAwuTVH+meFl3Gqk3blNxn9205DIxXmj5Hv8aQ
         YT3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eGs6D8P7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l16-20020a1709060e1000b00a4e416b34ddsor55473eji.8.2024.03.29.06.03.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 29 Mar 2024 06:03:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eGs6D8P7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711717431; x=1712322231; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fF0AEMcN53T8zLpULJXCYH56leqwh2GeC0VdcdisnsI=;
        b=eGs6D8P7DHtcwfzYgb8Q3od7uPKiZaprIv1zZiD+Tp9oYW5bRVxw2MCxTfz49HxpqM
         iC60UxN45PLt5YGqrhEasQh1YaAKyC+I7o1ig9+EJQo3AmPjKmrtAnxF/B6ezmzU5U6M
         PXaiUweWBP3sXBdaYuDa56wAiN6vp9K8GNUq7XqHcF1ylupfsvp9ZmwpiPzCQyKaFzhE
         DFSS7V5xzDyKZCaOKzWqtiqnvJQyby6eU0UMVSqRptvzRFFg4OddcEOpM7HmjrDJ5f02
         ub1zUKKuDE/nlFxJ1zbrJCGfw2OeakbYlxydI+NfRqmSCWSMiyLtcnyUZEYJSvqzVdHl
         wauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711717431; x=1712322231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fF0AEMcN53T8zLpULJXCYH56leqwh2GeC0VdcdisnsI=;
        b=tYVAEjbXsgxZzLlTxb6F+BO4uNs1vjFOma1qVgXGXY9Vhl8VHUFLewT2rSDY7yUGhK
         +AuskR+2Z3f0brJSt0t0jlmwjQnpfCAax4gjq4x3GK1LdZ7hG+uFCdHW+hNiwUvjvryt
         QHXmXzsUJ+l1dH0n6gxF2kCqiy75j5XtzM7FkDyfxq50wQVmR1jY6ZRUGZNRs6Hk3g3q
         XhoMMq1hy3y+Nabcrm0aBVKeLlN6Qf76MdZRMHBuXSBnmZkPXK+Z55H93ggBQ2fMZL5o
         +nBafTliMvKGg/ObNGCyLSHGKWj7ebPyfEwJL7MzHLAXBDJjlDqy93Ceiq/ikGeygfua
         DF/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWueZ3FgGF6bP5Xq3sxv3QxEEecF/ymEgjrhVn0W0zWUPRm6L7zk2ItuYsL0S7Ls5TY1ajV4Gv+LZND7P3U3feFdBTBefnp
X-Gm-Message-State: AOJu0YxUbf2LzHP0WZRPY5vZYO5pNPHqVzNSXGnZ7rNTHygkru+04m13
	Yf7IWsSOskgmILIfvxcD9K9DLuBzlLqN81R+wQsJ6DeYvmb/r676xUFzaPaRlZ6A4g==
X-Google-Smtp-Source: AGHT+IGusDVQ3jg0+CI+1zek0hD2iAfaouUn42nWLXeYMVkdB3NDh3jjiz+sA4UW771dJxUwH2T1wg==
X-Received: by 2002:a17:906:3605:b0:a46:fb17:8871 with SMTP id q5-20020a170906360500b00a46fb178871mr1634695ejb.76.1711717431337;
        Fri, 29 Mar 2024 06:03:51 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (uni14-h01-176-184-39-242.dsl.sta.abo.bbox.fr. [176.184.39.242])
        by smtp.gmail.com with ESMTPSA id o1-20020a1709064f8100b00a46baba1a0asm1914163eju.100.2024.03.29.06.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 06:03:50 -0700 (PDT)
Message-ID: <96bcb673-18dd-49bc-8bcb-281c7409b410@linaro.org>
Date: Fri, 29 Mar 2024 14:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.1 14/21] system: Introduce QMP
 generic_query_cpu_definitions()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>
References: <20240315130910.15750-1-philmd@linaro.org>
 <20240315130910.15750-15-philmd@linaro.org> <87v859m89y.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87v859m89y.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /f/fJC5nxoTl

Hi Markus,

On 26/3/24 14:28, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Each target use a common template for qmp_query_cpu_definitions().
>>
>> Extract it as generic_query_cpu_definitions(), keeping the
>> target-specific implementations as the following SysemuCPUOps
>> handlers:
>>   - cpu_list_compare()
>>   - add_definition()
>>   - add_alias_definitions()
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   MAINTAINERS                           |  2 +
>>   include/hw/core/sysemu-cpu-ops.h      | 14 ++++++
>>   include/qapi/commands-target-compat.h | 14 ++++++
>>   system/cpu-qmp-cmds.c                 | 71 +++++++++++++++++++++++++++
>>   system/meson.build                    |  1 +
>>   5 files changed, 102 insertions(+)
>>   create mode 100644 include/qapi/commands-target-compat.h
>>   create mode 100644 system/cpu-qmp-cmds.c


>> diff --git a/system/cpu-qmp-cmds.c b/system/cpu-qmp-cmds.c
>> new file mode 100644
>> index 0000000000..daeb131159
>> --- /dev/null
>> +++ b/system/cpu-qmp-cmds.c
>> @@ -0,0 +1,71 @@
>> +/*
>> + * QAPI helpers for target specific QMP commands
>> + *
>> + * SPDX-FileCopyrightText: 2024 Linaro Ltd.
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qom/object.h"
>> +#include "qapi/commands-target-compat.h"
>> +#include "sysemu/arch_init.h"
>> +#include "hw/core/cpu.h"
>> +#include "hw/core/sysemu-cpu-ops.h"
>> +
>> +static void cpu_common_add_definition(gpointer data, gpointer user_data)
>> +{
>> +    ObjectClass *oc = data;
>> +    CpuDefinitionInfoList **cpu_list = user_data;
>> +    CpuDefinitionInfo *info;
>> +    const char *typename;
>> +
>> +    typename = object_class_get_name(oc);
>> +    info = g_malloc0(sizeof(*info));
>> +    info->name = cpu_model_from_type(typename);
>> +    info->q_typename = g_strdup(typename);
>> +
>> +    QAPI_LIST_PREPEND(*cpu_list, info);
>> +}
>> +
>> +static void arch_add_cpu_definitions(CpuDefinitionInfoList **cpu_list,
>> +                                     const char *cpu_typename)
>> +{
>> +    ObjectClass *oc;
>> +    GSList *list;
>> +    const struct SysemuCPUOps *ops;
>> +
>> +    oc = object_class_by_name(cpu_typename);
>> +    if (!oc) {
>> +        return;
>> +    }
>> +    ops = CPU_CLASS(oc)->sysemu_ops;
>> +
>> +    list = object_class_get_list(cpu_typename, false);
>> +    if (ops->cpu_list_compare) {
>> +        list = g_slist_sort(list, ops->cpu_list_compare);
>> +    }
>> +    g_slist_foreach(list, ops->add_definition ? : cpu_common_add_definition,
>> +                    cpu_list);
>> +    g_slist_free(list);
>> +
>> +    if (ops->add_alias_definitions) {
>> +        ops->add_alias_definitions(cpu_list);
>> +    }
>> +}
>> +
>> +CpuDefinitionInfoList *generic_query_cpu_definitions(Error **errp)
>> +{
>> +    CpuDefinitionInfoList *cpu_list = NULL;
>> +
>> +    for (unsigned i = 0; i <= QEMU_ARCH_BIT_LAST; i++) {
>> +        const char *cpu_typename;
>> +
>> +        cpu_typename = cpu_typename_by_arch_bit(i);
>> +        if (!cpu_typename) {
>> +            continue;
>> +        }
>> +        arch_add_cpu_definitions(&cpu_list, cpu_typename);
>> +    }
>> +
>> +    return cpu_list;
>> +}
> 
> The target-specific qmp_query_cpu_definitions() this is going to replace
> each execute the equivalent of *one* loop iteration: the one
> corresponding to their own arch bit.
> 
> For the replacement to be faithful, as cpu_typename_by_arch_bit() must
> return non-null exactly once.
> 
> This is the case for the qemu-system-TARGET.  The solution feels
> overengineered there.
> 
> I figure cpu_typename_by_arch_bit() will return non-null multiple times
> in a future single binary supporting heterogeneous machines.
> 
> Such a single binary then can't serve as drop-in replacement for the
> qemu-system-TARGET, because query-cpu-definitions returns more.
> 
> To get a drop-in replacement, we'll need additional logic to restrict
> the query for the homogeneous use case.

Can we ask the management layer to provide the current homogeneous
target via argument? Otherwise we can add a new query-cpu-definitions-v2
command requiring an explicit target argument, allowing 'all', and
deprecate the current query-cpu-definitions.

> I think this needs to be discussed in the commit message.
> 
> Possibly easier: don't loop over the bits, relying on
> cpu_typename_by_arch_bit() to select the right one.  Instead get the
> right bit from somewhere.
> 
> We can switch to a loop when we need it for the heterogeneous case.

Alex suggested to consider heterogeneous emulation the new default,
and the current homogeneous use as a particular case. I'd rather not
plan on a "heterogeneous switch day" and get things integrated in
the way, otherwise we'll never get there...

Regards,

Phil.
