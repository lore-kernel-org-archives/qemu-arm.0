Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2481237njb;
        Sun, 7 Jul 2024 22:00:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZmEUArP34KqcWsvmwaEXOwX5Oe7M6wNaNchaEDwrIo/7olpO0ql95ZgSh4gsDMtm6CP+fsONm/2U7u4FrVmoxLgHMTLNU
X-Received: by 2002:a5d:6182:0:b0:367:9abd:6940 with SMTP id ffacd0b85a97d-3679dd10611mr6393620f8f.8.1720414850522;
        Sun, 07 Jul 2024 22:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720414850; cv=none;
        d=google.com; s=arc-20160816;
        b=rDqa43TqT9xZ5ebkmTPVbIXxaeiOe6ahTI74YzQzIFRrqJ4Ea8GaHpM+DoYSeDpNXH
         3DZGdIQHD948SJ9AfZucsEn392E70+iwJUhIug2U2SGfTOTtRzZ2yUrPs7lteyIgSLbz
         0piT0YXqkaqaFwQDPxuik0EV7m63qhXhpaHZlE1Rd87fxVqfw2LeCW+7q4Hc+5iTc5Vd
         aakak15UEKcH5DyTCJXl/O4doJ5znrHyk6ayCB0mBfN1h5ZSZsh97Vz1VFcvD7e/6VBM
         tYF1Tw3Xx55TzILYqzZwonOeU9LfeC5KRQ6G9RKZ5kEB7ya9S8bva56VKrx37CMl3C3D
         eL2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xsUzmV9J4QrgMBnJmkHaaNNm5FbxOTyH6rMEMlffB2U=;
        fh=pszxFC6ybRBcB/03VJXIaongUTSJRQN3CVKQ6SGjuPY=;
        b=XVl9/gk9dgngBmngm1cUq8sPKEyxcPo7DRX4+KWe1gB9I+ugQUUeHq9OeG9cA5eNJs
         Q7sFQTZu5+qlL31IN2yzhDrxIOIRcytltJIeP0bNiQgDMo6AKsFnyPeGHHA4/zmM5s29
         QGITZFIh8zwcnUhQCC/y/SdsBCNtQwkCZhOpeYTIS2NNXLQU5IMxtfwqLiSU7/4shWYK
         kqDI8TGjJYfAvPGljiIpE854tlTA2HxzIrlgxORsbk59OZuAZ46c2df3UeMS81Mcw1UV
         k/0Qzh8nuRXg0gJTI2QJWo9aHv4q5QDxw+oSFGxgjG6x5zq6gHz+aBIFzlecCEQkrbY4
         f7IA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=WkRKuScP;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4258359dc40sor42800305e9.5.2024.07.07.22.00.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 07 Jul 2024 22:00:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=WkRKuScP;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1720414850; x=1721019650; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xsUzmV9J4QrgMBnJmkHaaNNm5FbxOTyH6rMEMlffB2U=;
        b=WkRKuScPa89VvEDLipYG39+JElL/do4uyNUivsDAYOwSpoMxbfnjsynnxHjF5zTV5Y
         hTdRY/IUZKi8YW55Lf3WRGo3WaERhdd/SFLxpyuvcUqxzC2OHbNBuBhXXKPAuCpv1lmr
         V+XYf3yNCfg5NjbhECWmmpDAFjqJRKuRXamOKxcg4JUfRcmkpOdhwUAJ04NK0EokRpYr
         Dvon9XxLLt4fXncHJwO5TOhxhSStGxHl45DnfhYNX5Ao2tWWPAo/rnE/qitlScrDkF2C
         bH++SWYFIIj+yKBcdaP7jLb5z/fJDXwvBCir5LKQP5+AWr647uRpaqFJoZIUIL/HNe+h
         AJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720414850; x=1721019650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xsUzmV9J4QrgMBnJmkHaaNNm5FbxOTyH6rMEMlffB2U=;
        b=BCyWWP0Mym7SqU/Vlj8BwWamX3It4ql5VMdQCYsDjgyNr7uMb9HD5JnK9CTTeD2NUC
         PtN/g7r4dMhwwxSzYMsAaPDXrwT+IRyLd7wOuCcCmwF+9GaZNHtPU6EDCBEe3giYh/8g
         0PaZj3V7sNOhPdl8Ck0XeLyWYtKGfHpytKflZ7LwXY5W8xAqGwtuCEn8cEqK7SA8UvtX
         hO5BbWWgl9GUGK1aJBX7Lhn6M79N4Y1QAMwIzqdKOQArL8pMhEmCVD/VGIzIiwgiKOle
         734rEVYVbT5P2NbyDia8mZXFWwl30XzYLjwqUQ2io29efnZwjFhGs+673wfmY4i8t8Sy
         k4xw==
X-Forwarded-Encrypted: i=1; AJvYcCVodLSNFwcyHLz2Kk0wshDQ9iXDqfmTCDcqlC3ZxHk1y+vzkbnsHTB64CyzGATIl/xqXmGxJWaHX60dFEV4eqwef6788rqn
X-Gm-Message-State: AOJu0YyMYadCpDfQ2x7okcQiV99do8lrN2iaXkhfy3pjli15J0MlePU3
	RUys8B2DKo48c4kLRFj+79Bwag+jVhrQluEQQAQ2dymoYo4HxTrKkaF05NZZMsw=
X-Google-Smtp-Source: AGHT+IG3tuNXkXe8cTqkx9W2AdRnSbb20e8YNoKquxs/q7e6nGfphS2h8o7f/bVjE1ma2mcbx6xAPg==
X-Received: by 2002:a05:600c:2e16:b0:426:5ee5:3130 with SMTP id 5b1f17b1804b1-4265ee53334mr32149085e9.3.1720414849615;
        Sun, 07 Jul 2024 22:00:49 -0700 (PDT)
Return-Path: <salil.mehta@opnsrc.net>
Received: from [10.11.12.72] ([90.220.10.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d50f5sm148211915e9.9.2024.07.07.22.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 22:00:49 -0700 (PDT)
Message-ID: <ae65f50c-f5b7-49ef-a8b1-20366634caf6@opnsrc.net>
Date: Mon, 8 Jul 2024 05:00:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 2/8] hw/acpi: Move CPU ctrl-dev MMIO region len macro
 to common header file
To: Igor Mammedov <imammedo@redhat.com>, Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, maz@kernel.org,
 jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, andrew.jones@linux.dev, david@redhat.com,
 philmd@linaro.org, eric.auger@redhat.com, oliver.upton@linux.dev,
 pbonzini@redhat.com, mst@redhat.com, will@kernel.org, gshan@redhat.com,
 rafael@kernel.org, alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
 linuxarm@huawei.com, Shaoqin Huang <shahuang@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
 <20240607115649.214622-3-salil.mehta@huawei.com>
 <20240706152050.4f5f8109@imammedo.users.ipa.redhat.com>
Content-Language: en-GB
From: Salil Mehta <salil.mehta@opnsrc.net>
In-Reply-To: <20240706152050.4f5f8109@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EpQizv+Kapyr

Hi Igor,

On 06/07/2024 13:20, Igor Mammedov wrote:
> On Fri, 7 Jun 2024 12:56:43 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>
>> CPU ctrl-dev MMIO region length could be used in ACPI GED and various other
>> architecture specific places. Move ACPI_CPU_HOTPLUG_REG_LEN macro to more
>> appropriate common header file.
>>
>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: David Hildenbrand <david@redhat.com>
>> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
>> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>> Tested-by: Xianglai Li <lixianglai@loongson.cn>
>> Tested-by: Miguel Luis <miguel.luis@oracle.com>
>> Tested-by: Zhao Liu <zhao1.liu@intel.com>
>> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
>> ---
>>   hw/acpi/cpu.c                 | 2 +-
>>   include/hw/acpi/cpu_hotplug.h | 2 ++
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
>> index 2d81c1e790..69aaa563db 100644
>> --- a/hw/acpi/cpu.c
>> +++ b/hw/acpi/cpu.c
>> @@ -1,13 +1,13 @@
>>   #include "qemu/osdep.h"
>>   #include "migration/vmstate.h"
>>   #include "hw/acpi/cpu.h"
>> +#include "hw/acpi/cpu_hotplug.h"
>>   #include "hw/core/cpu.h"
>>   #include "qapi/error.h"
>>   #include "qapi/qapi-events-acpi.h"
>>   #include "trace.h"
>>   #include "sysemu/numa.h"
>>   
>> -#define ACPI_CPU_HOTPLUG_REG_LEN 12
>>   #define ACPI_CPU_SELECTOR_OFFSET_WR 0
>>   #define ACPI_CPU_FLAGS_OFFSET_RW 4
>>   #define ACPI_CPU_CMD_OFFSET_WR 5
>> diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
>> index 3b932abbbb..48b291e45e 100644
>> --- a/include/hw/acpi/cpu_hotplug.h
>> +++ b/include/hw/acpi/cpu_hotplug.h
> this file has deps on x86 machine and contains mainly
> legacy CPU hotplug API for x86.

sure.

>
>> @@ -19,6 +19,8 @@
>>   #include "hw/hotplug.h"
>>   #include "hw/acpi/cpu.h"
>>   
>> +#define ACPI_CPU_HOTPLUG_REG_LEN 12
> the better place for it would be include/hw/acpi/cpu.h

ok.


Thanks

Salil.

>
>>   typedef struct AcpiCpuHotplug {
>>       Object *device;
>>       MemoryRegion io;
