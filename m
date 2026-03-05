Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19ED9EEF303
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 06:16:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vy20h-0007aw-E6; Thu, 05 Mar 2026 01:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vy20e-0007Xr-VG
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 01:16:32 -0500
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vy20d-0002Mu-2f
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 01:16:32 -0500
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-5674d8be45eso3101389e0c.1
 for <qemu-arm@nongnu.org>; Wed, 04 Mar 2026 22:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772691389; x=1773296189; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wetarsDDx4hL0vxUu93kA2syxQHamQ2uPA0pOMoZdIU=;
 b=UIJOQfmvWV5TiSpZbT87rITfAv4CZWDJyWVj2i66s31wZuvNL9AZpxp9vhM3u+lHLI
 zX2jSa3BPQC9c1RFiGRu7AZmkPHQmedd7zK2CC4GnUDGyP4RxHJB9d3zE5fpyQ2qMQx8
 6hu2DFUJTv7AGpkuxptOjLhz60BanjO4Cg8sa4y0l/8K4mNQ+wOfEN28ShHxWAyV7q1r
 opYeb4ITkBJov7CR2ojr6G9NsaFyYeCgaxcWpySLY8gk4EtlSrdaQh7n+9lp1Fs1Ag/+
 4CMfkPP972OEbU7F0webkxsoEfSw3Z/RX6F4iKG/vi7eBXFpgKuJoCXVeCV+H6hMD2Ti
 45ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772691389; x=1773296189;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wetarsDDx4hL0vxUu93kA2syxQHamQ2uPA0pOMoZdIU=;
 b=EdLV2LLTniMqn4dvtM3/SjIcPx8e8VViFvvNvqmQdq/9s+q8jdPBqqc1BJQtuXDjHz
 VSD8fFMSoE6swdwcVb+kn8Bhkz1ICpGlqe67qN72DGUpA99Ml/tq8rDJDXBjUePPGrjf
 1eQpLUB5R1pEZ2Jl3ea/XHniuh5t2lmea0CiFFMD+gZsqrizB1hY0fdzo/3Nk5qn6pMr
 JGmPrIJm7Sg/cWoNdrEfrUzNeInsQWtjavFjFd4F8bJfC9EbkZDkKNqWL3TMKBvMIPGx
 iCMgjIBo9YfYdfb91aq5zEHfERcIUxrjZ7HBY9mAe/SxwDhpjxCJKDdUCC6y2puZrkJs
 /Taw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgvTRROz8D7xn2U/tTJffvaWfxQhCZmoGDF5ODOVkgjsH5Lq7sIt1SpBojUM2dYKyxfmG5jlrjmA==@nongnu.org
X-Gm-Message-State: AOJu0Yxc7vxGXSRZKkgq/5ReCaAFkXs/bTWXmdba2uYCvY5g3b6/0tIO
 UoxDv+0OPBd+VwAFFdiL41swfUqLLERu7Y/a9gcO6XZ5bnnYdMiBWRCetK6x+wgvO8k=
X-Gm-Gg: ATEYQzx2pd66ncsGdDVoc8apLUd7cTRhlESSJcfXVDDU5RveBff6VRSC2Jv/LsoqjA1
 lY2V/YMQeSfuKYZtm71fH9aOcrdMQ3c8oXq074i/WC2gAVggZ6ud6/XHEsiAUBDFYey4okNP3cM
 2Oyk5zAJ01A6Ks2PScqyASu0SVeRkFixPs9Ye/G63yI+2xUbgxdpH+ZHJ0K9l7zkU0gFSF7u5+O
 7x8V249eOf7O36l2ert6m2TPWrKQ6tuR7ZjgCEsvDQMZI2YQ+bKBp+A63ALXuY7R5D7bi7K95qR
 q5C5RmZKyh9u/uqc10+hzeoUevsJ7TbKr62vwtTR9yEqdOHkNKwJ8S7wUJ6amKXNbmLYj24jQx/
 TYh7KRBUCfAUrWV8sbEMMDBapHVzqT5V6DeUqWFxOG9awj8BnnMBLaiUyK9kCOxarpp7ixHp4Gp
 fy+TZtgAYGI0olkaO1E7eMQHOu5RZ5cBwwCWn+BVbxqh0=
X-Received: by 2002:a05:6102:1620:b0:5ff:a16b:93f0 with SMTP id
 ada2fe7eead31-5ffaae25be8mr1811756137.22.1772691389397; 
 Wed, 04 Mar 2026 22:16:29 -0800 (PST)
Received: from [192.168.0.103] ([191.8.216.93])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ffd1d8983dsm132583137.8.2026.03.04.22.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 22:16:29 -0800 (PST)
Message-ID: <42b1b16b-2680-4200-bb62-7043bbfe7164@linaro.org>
Date: Thu, 5 Mar 2026 03:16:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 2/8] hw/core/machine: topology functions capabilities
 added
From: Gustavo Romero <gustavo.romero@linaro.org>
To: Alireza Sanaee <alireza.sanaee@huawei.com>, mst@redhat.com,
 qemu-devel@nongnu.org
Cc: anisinha@redhat.com, armbru@redhat.com, berrange@redhat.com,
 dapeng1.mi@linux.intel.com, eric.auger@redhat.com, farman@linux.ibm.com,
 imammedo@redhat.com, jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 linuxarm@huawei.com, maobibo@loongson.cn, mtosatti@redhat.com,
 peter.maydell@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, shannon.zhaosl@gmail.com, zhao1.liu@intel.com
References: <20260220141128.789-1-alireza.sanaee@huawei.com>
 <20260220141128.789-3-alireza.sanaee@huawei.com>
 <91570f1c-3579-4b82-8252-6d29bc7d2f6e@linaro.org>
Content-Language: en-US
In-Reply-To: <91570f1c-3579-4b82-8252-6d29bc7d2f6e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Alireza,

On 3/3/26 23:39, Gustavo Romero wrote:
> Hi,
> 
> On 2/20/26 11:11, Alireza Sanaee wrote:
>> Add two functions one of which finds the lowest cache level defined in
>> the cache description input, and the other checks if a given cache
>> topology is defined at a particular cache level
>>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
>> ---
>>   hw/core/machine-smp.c    | 52 ++++++++++++++++++++++++++++++++++++++++
>>   include/hw/core/boards.h |  5 ++++
>>   2 files changed, 57 insertions(+)
>>
>> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
>> index 189c70015f..bef04aa2d7 100644
>> --- a/hw/core/machine-smp.c
>> +++ b/hw/core/machine-smp.c
>> @@ -406,3 +406,55 @@ bool machine_check_smp_cache(const MachineState 
>> *ms, Error **errp)
>>       return true;
>>   }
>> +
>> +/*
>> + * This function assumes L3 and L2 have unified cache and L1 is split 
>> L1d and
>> + * L1i.
>> + */
>> +bool machine_find_lowest_level_cache_at_topo_level(const MachineState 
>> *ms,
>> +                                                   int 
>> *lowest_cache_level,
>> +                                                   CpuTopologyLevel 
>> topo_level)
>> +{
>> +    enum CacheLevelAndType cache_level;
>> +    enum CpuTopologyLevel t;
>> +
>> +    for (cache_level = CACHE_LEVEL_AND_TYPE_L1D;
>> +         cache_level < CACHE_LEVEL_AND_TYPE__MAX; cache_level++) {
>> +        t = machine_get_cache_topo_level(ms, cache_level);
>> +        if (t == topo_level) {
>> +            /* Assume L1 is split into L1d and L1i caches. */
>> +            if (cache_level == CACHE_LEVEL_AND_TYPE_L1D ||
>> +                cache_level == CACHE_LEVEL_AND_TYPE_L1I) {
>> +                *lowest_cache_level = 1; /* L1 */
>> +            } else {
>> +                /* Assume the other caches are unified. */
>> +                *lowest_cache_level = cache_level;
>> +            }
>> +
>> +            return true;
>> +        }
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +/*
>> + * Check if there are caches defined at a particular level. It 
>> supports only
>> + * L1, L2 and L3 caches, but this can be extended to more levels as 
>> needed.
>> + *
>> + * Return True on success, False otherwise.
>> + */
>> +bool machine_defines_cache_at_topo_level(const MachineState *ms,
>> +                                         CpuTopologyLevel topology)
>> +{
>> +    enum CacheLevelAndType cache_level;
>> +
>> +    for (cache_level = CACHE_LEVEL_AND_TYPE_L1D;
>> +         cache_level < CACHE_LEVEL_AND_TYPE__MAX; cache_level++) {
>> +        if (machine_get_cache_topo_level(ms, cache_level) == topology) {
>> +            return true;
>> +        }
>> +    }
>> +
>> +    return false;
>> +}
>> diff --git a/include/hw/core/boards.h b/include/hw/core/boards.h
>> index edbe8d03e5..af5fd9f3cd 100644
>> --- a/include/hw/core/boards.h
>> +++ b/include/hw/core/boards.h
>> @@ -60,6 +60,11 @@ void machine_set_cache_topo_level(MachineState *ms, 
>> CacheLevelAndType cache,
>>                                     CpuTopologyLevel level);
>>   bool machine_check_smp_cache(const MachineState *ms, Error **errp);
>>   void machine_memory_devices_init(MachineState *ms, hwaddr base, 
>> uint64_t size);
>> +bool machine_defines_cache_at_topo_level(const MachineState *ms,
>> +                                         CpuTopologyLevel level);
>> +bool machine_find_lowest_level_cache_at_topo_level(const MachineState 
>> *ms,
>> +                                                   int *level_found,
>> +                                                   CpuTopologyLevel 
>> topo_level);
>>   /**
>>    * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid 
>> devices
> 
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

I'm actually taking it back.

The function prototypes for machine_defines_cache_at_topo_level and
machine_find_lowest_level_cache_at_topo_level in boards.h need to be
updated to match the function signature:

"CpuTopologyLevel level" -> "CpuTopologyLevel topology" and

"int *level_found" -> "int *lowest_cache_level"


Cheers,
Gustavo

