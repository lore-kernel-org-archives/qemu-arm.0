Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp654651njh;
        Sun, 11 Aug 2024 21:59:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwzSl4ClPpliOqZuMYOKU9GpREbzT4eATHpm8sDU5lVin+rlZmTkYla9D4Q87K6/1VgypOwqhHYx19wz7yhPYK6RTCnKTQ
X-Google-Smtp-Source: AGHT+IESAY7GjYOjgX5evQZTvqXD+lDs5w70CQCJWTWOJFR+Vr1o9oRx5ojPFphwsjDoU4ONWFkT
X-Received: by 2002:a05:620a:4152:b0:79e:f8de:3c61 with SMTP id af79cd13be357-7a4c17e16f6mr1116614485a.4.1723438794320;
        Sun, 11 Aug 2024 21:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723438794; cv=none;
        d=google.com; s=arc-20160816;
        b=SYXXb/b2P4bXmiH/OTb5Fy/N06q49RPqJwqrGGd/agFG5FU/aaFJZWq+tPZChmWSYi
         ce1gml2gEaLlMyFZEgJRZ/qVdEcz3dNXypsh5uhev/+wxQspe0kiOZ7zI9Nhfux0jlxi
         QuYTpmEkAyARFLci2r9wDOQpHFRlrCJlpL06k/XBnWBH0ZOpU/wDIxiHTdMwnXfhwheX
         yB0vAkPddZlKH7lVHBItkFDEn9CbT92es6HcGVM3+JbN5Rr/82hWdvDaXRhutQfwelTz
         Dzyp4gXWB64Y2S14nhgQD8utkBrcocJ4Xz78RFr8gDrtkMvdrV+IOktNgvDNNenAIipn
         Tq0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aYOj0pjO4QInpM7uFYkNau/S8zRMvfE+gddLmEdtoN4=;
        fh=ZE0qtczK79cWY8TbizFOSBNUbfzd5avfKS5uM0sTEn4=;
        b=ztgTJBddZftQurs9YymP7i/uZbpW8rOqxz8lGpOQWxHpGfsFssyWXG0ISBBomU2OhQ
         Af03q61zPbijsfvbHZ8PJQjqHOitbBehhxGsQXFbnp8yobIDf3uyOTcZbru+7ob5lwop
         rkoRgOjnf7vBPjV9dP7lHopgeKPGyYoFOcGIKJQHTORc6htKV/mNb3r88RWybfQLiSk7
         +5+HDVHAK1dVCc1X8N+G3PBn7mYaZWAP1uQQa9Y6oMXw01HMmObSN+ujyvScL1lvV/Hs
         iewOyisW5BwrNt+EE2aObCY8UEw/0Wkei61kJ7DuJ9y5ccEGHMY5cWD/lU5nn/LFf4tL
         Vq/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FnIjCVVh;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a4c7d72153si518682385a.182.2024.08.11.21.59.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 21:59:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FnIjCVVh;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723438794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aYOj0pjO4QInpM7uFYkNau/S8zRMvfE+gddLmEdtoN4=;
	b=FnIjCVVhl64cNVFGTAWq1nAE3HF8hi0tAMvX2GR5o6PPp9rwCO6BDcSyibhpJHemNHZY+b
	RpBVOI/WIljD+clk8Mkq9QzFwWC3QiIoRfZsWkizZm+AcXlTvvZYSth7JG9siNZp/V+x7+
	NvtT9t4AldgxibufOnXYQ+1BaN0cRT8=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-Q51bq_3nPvSrGGJXFuVZtQ-1; Mon, 12 Aug 2024 00:59:52 -0400
X-MC-Unique: Q51bq_3nPvSrGGJXFuVZtQ-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-7a23a0fb195so4670057a12.0
        for <alex.bennee@linaro.org>; Sun, 11 Aug 2024 21:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723438791; x=1724043591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aYOj0pjO4QInpM7uFYkNau/S8zRMvfE+gddLmEdtoN4=;
        b=C7fEYMkiiQUFM5WH5PZUU0GxQHliJDHorAXxPqU0g4KR1QstjUOUexdY3vbK3ITWBw
         u+NeIhLCjsB24ZsunTM7+EUIxmmlfM3wnYd/aGtRiJfzHOwahEITkhBwU8be4zN6y/Zl
         bypUnENh4p3MqXAQpDQz657AVrnSLgDLJnMWCurDiKZs6onpC2avi3Nq4LXO2GWpWkKC
         m84HSl5Bnf7UUsmYtOMzpRlxGBjjObXjKHKWKrZgSf0y3mPJ+fy3XB1mmv865SPqElq0
         CH0sm0puQkvlYvbwUAhx4FS5+iKPe3cqWxaSL7UIkx0S36vrR3nFArP/Tcdr4ZWVjG5y
         Jq0A==
X-Forwarded-Encrypted: i=1; AJvYcCWTgAvTNNLFC7wn9o6ucy+Miks0TKq+8tkYZF3FomrTT8xbm3WN9iEqoA4z9JEg4jIlRVhrxjobpBIywaS6sPvRZvcrviHL
X-Gm-Message-State: AOJu0YznY6QiLGUTG6ANhiaMSoaqe77jXbp33f+Mdrue0IQlQ2YJSFlo
	6qkOgeTTR9VuhP9J5vlRYeUyYYq057GjNSlTD5t3V/0FL9pbCEfDuE6iNSDhC3OqG2f4KM3KE4S
	wb7RFeMXpfnpFqmA5gtQEhRglX8k1OH8qvjEgksaA0dW+urU//xNHAA==
X-Received: by 2002:a17:902:e885:b0:1fc:6c23:8a3b with SMTP id d9443c01a7336-200ae4fab33mr103688475ad.17.1723438791006;
        Sun, 11 Aug 2024 21:59:51 -0700 (PDT)
X-Received: by 2002:a17:902:e885:b0:1fc:6c23:8a3b with SMTP id d9443c01a7336-200ae4fab33mr103688015ad.17.1723438790519;
        Sun, 11 Aug 2024 21:59:50 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([43.252.112.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb7e8ad2sm29591615ad.11.2024.08.11.21.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Aug 2024 21:59:50 -0700 (PDT)
Message-ID: <8fcb7441-bb5c-4dd8-a9c2-9d73b6176240@redhat.com>
Date: Mon, 12 Aug 2024 14:59:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V3 02/29] cpu-common: Add common CPU utility for
 possible vCPUs
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 rafael@kernel.org, borntraeger@linux.ibm.com, alex.bennee@linaro.org,
 npiggin@gmail.com, harshpb@linux.ibm.com, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, shahuang@redhat.com,
 zhao1.liu@intel.com, linuxarm@huawei.com
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-3-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240613233639.202896-3-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 4MWNP5pTcz+M

On 6/14/24 9:36 AM, Salil Mehta wrote:
> This patch adds various utility functions that may be required to fetch or check
> the state of possible vCPUs. It also introduces the concept of *disabled* vCPUs,
> which are part of the *possible* vCPUs but are not enabled. This state will be
> used during machine initialization and later during the plugging or unplugging
> of vCPUs. We release the QOM CPU objects for all disabled vCPUs.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   cpu-common.c          | 31 +++++++++++++++++++++++++
>   include/hw/core/cpu.h | 54 +++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 85 insertions(+)
> 
> diff --git a/cpu-common.c b/cpu-common.c
> index ce78273af5..49d2a50835 100644
> --- a/cpu-common.c
> +++ b/cpu-common.c
> @@ -24,6 +24,7 @@
>   #include "sysemu/cpus.h"
>   #include "qemu/lockable.h"
>   #include "trace/trace-root.h"
> +#include "hw/boards.h"
>   
>   QemuMutex qemu_cpu_list_lock;
>   static QemuCond exclusive_cond;
> @@ -107,6 +108,36 @@ void cpu_list_remove(CPUState *cpu)
>       cpu_list_generation_id++;
>   }
>   
> +CPUState *qemu_get_possible_cpu(int index)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    const CPUArchIdList *possible_cpus = ms->possible_cpus;
> +
> +    assert((index >= 0) && (index < possible_cpus->len));
> +
> +    return CPU(possible_cpus->cpus[index].cpu);
> +}
> +
> +bool qemu_present_cpu(CPUState *cpu)
> +{
> +    return cpu;
> +}
> +
> +bool qemu_enabled_cpu(CPUState *cpu)
> +{
> +    return cpu && !cpu->disabled;
> +}
> +
> +uint64_t qemu_get_cpu_archid(int cpu_index)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    const CPUArchIdList *possible_cpus = ms->possible_cpus;
> +
> +    assert((cpu_index >= 0) && (cpu_index < possible_cpus->len));
> +
> +    return possible_cpus->cpus[cpu_index].arch_id;
> +}
> +
>   CPUState *qemu_get_cpu(int index)
>   {
>       CPUState *cpu;
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 60b160d0b4..60b4778da9 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -528,6 +528,18 @@ struct CPUState {
>       CPUPluginState *plugin_state;
>   #endif
>   
> +    /*
> +     * Some architectures do not allow the *presence* of vCPUs to be changed
> +     * after the guest has booted, based on information specified by the
> +     * VMM/firmware via ACPI MADT at boot time. Thus, to enable vCPU hotplug on
> +     * these architectures, possible vCPUs can have a CPUState object in a
> +     * 'disabled' state or may not have a CPUState object at all. This is
> +     * possible when vCPU hotplug is supported, and vCPUs are
> +     * 'yet-to-be-plugged' in the QOM or have been hot-unplugged. By default,
> +     * every CPUState is enabled across all architectures.
> +     */
> +    bool disabled;
> +

The information to determine vCPU's state has been distributed to two data structs:
MachineState::possible_cpus::cpus[] and CPUState. Why not just to maintain the vCPU's
state from MachineState::possible_cpus::cpus[]? For example, adding a new field, or
something similiar, to 'struct CPUArchId' as below.

typedef struct CPUArchId {
#define CPU_ARCH_ID_FLAG_PRESENT	(1 << 0)
#define CPU_ARCH_ID_FLAG_ENABLED        (1 << 1)
     uint32_t flags;
        :
} CPUArchId;

In order to determine if a CPUState instance is enabled or not. CPUState::cpu_index
is used as the index to MachineState::possible_cpus::cpus[]. The flags can be parsed
to determine the vCPU's state.

>       /* TODO Move common fields from CPUArchState here. */
>       int cpu_index;
>       int cluster_index;
> @@ -914,6 +926,48 @@ static inline bool cpu_in_exclusive_context(const CPUState *cpu)
>    */
>   CPUState *qemu_get_cpu(int index);
>   
> +/**
> + * qemu_get_possible_cpu:
> + * @index: The CPUState@cpu_index value of the CPU to obtain.
> + *         Input index MUST be in range [0, Max Possible CPUs)
> + *
> + * If CPUState object exists,then it gets a CPU matching
> + * @index in the possible CPU array.
> + *
> + * Returns: The possible CPU or %NULL if CPU does not exist.
> + */
> +CPUState *qemu_get_possible_cpu(int index);
> +
> +/**
> + * qemu_present_cpu:
> + * @cpu: The vCPU to check
> + *
> + * Checks if the vCPU is amongst the present possible vcpus.
> + *
> + * Returns: True if it is present possible vCPU else false
> + */
> +bool qemu_present_cpu(CPUState *cpu);
> +
> +/**
> + * qemu_enabled_cpu:
> + * @cpu: The vCPU to check
> + *
> + * Checks if the vCPU is enabled.
> + *
> + * Returns: True if it is 'enabled' else false
> + */
> +bool qemu_enabled_cpu(CPUState *cpu);
> +
> +/**
> + * qemu_get_cpu_archid:
> + * @cpu_index: possible vCPU for which arch-id needs to be retreived
> + *
> + * Fetches the vCPU arch-id from the present possible vCPUs.
> + *
> + * Returns: arch-id of the possible vCPU
> + */
> +uint64_t qemu_get_cpu_archid(int cpu_index);
> +
>   /**
>    * cpu_exists:
>    * @id: Guest-exposed CPU ID to lookup.

Thanks,
Gavin
