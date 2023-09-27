Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1566273ejc;
        Tue, 26 Sep 2023 20:54:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1+7eqqxwqi6GSVfCJn154xrbv5LWsP7t+nuOF7ho4bRVLfqkN9XS2LLrTASUJ65gS68vj
X-Received: by 2002:a0c:a9d4:0:b0:65b:d75:129d with SMTP id c20-20020a0ca9d4000000b0065b0d75129dmr834030qvb.34.1695786858820;
        Tue, 26 Sep 2023 20:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695786858; cv=none;
        d=google.com; s=arc-20160816;
        b=AeTuj8faseuyupQHzi9E3rWCTdq3jYizr0pNTONt+7AcqlPMQogvvL2oOSGVYU2Xy/
         7hB4to1Yqd+/6NSH4sHfDrLhCU6zj3sMFIWdweNFu0WDYeW7HfquTx6v0Mq3NC5BNzOu
         nJ3jBBKDIjAcST49fd0Sdrh6brWAbe64WN4Te6Vq0WDt0oUosP9oMVc6gz1hxxQFapyr
         F5OxCllYliyzeY41sna3P4AROFtRZNTIkwmF2hg9gI2WUZ11kGQG6POZvrRJ8Pugm2MX
         OlmoDNOdR+qaS57GPVjqE45puCJJaFQECCXjT0MeCeUMHrzdLstSc7kYgidc9C8aSPtL
         H0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wq3sWa4cq7NOR9CzU3Z3ngaKlHFGpMjzimxp4rlP+BA=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=vb5BQln9uIZdEh4cYX7pg8MaOgTO3t3cjL8sDMV4EsAo5+jtRXxgVCq5TgdfszWzXH
         vrKgfc0Jc92j+vWAANbwp/oI7bHzNIRj17VJBTKPTuHLRjzy3p8DNUTWKGeDCXsvqDu4
         0SHtlGHeZMc4qwgKuY9aIF7CjVLgq+rjUdiB387m+Nhym80BUUB/sR1xdU110VWKAEMe
         wmGvIaJ5sdby8J6qcOg2jUoJR2XLJzBOEcm8zHyTRphAuSOdeRtv3Q34im6A2CrbNAld
         /vleYXGXNdkUMjAMB5YHpRutQeBBe0NZcqqbwcLeyEGXSPTgxndHNUaZlloxcSOu1Ql0
         XVEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UzgLi3Cu;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id k3-20020a0cabc3000000b00658793cda42si7566523qvb.225.2023.09.26.20.54.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 20:54:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UzgLi3Cu;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695786858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wq3sWa4cq7NOR9CzU3Z3ngaKlHFGpMjzimxp4rlP+BA=;
	b=UzgLi3Cu+Lcz+7xAHppZ44t2D7H1JISkp4BNTNTBPXdZblMU/w3jK0HT/3iFIshknKsDlj
	wbsQ1EmaoY4vqzFKmnfljcZVYaC4jgpi889IPqXfPFHBuMvmKRYYVbo54uAfRseDRefglm
	osnxVL0SwsntWefSx2BWYq6CNlF3hqc=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-YB9UYnqENwyN19HPDv5IPA-1; Tue, 26 Sep 2023 23:54:17 -0400
X-MC-Unique: YB9UYnqENwyN19HPDv5IPA-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-565ece76be4so13070246a12.2
        for <alex.bennee@linaro.org>; Tue, 26 Sep 2023 20:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695786856; x=1696391656;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wq3sWa4cq7NOR9CzU3Z3ngaKlHFGpMjzimxp4rlP+BA=;
        b=L5egYkvL9KLzD9/Ma0zjNQWRz1epMQRS11TybLieme69DDnil/zsxaud38MNlduBtk
         lRYClayQcta2xUeQMiWl7Ly0v8NTFA1esnkuoId9lVDgPH0+cIfTBgY6z4ipshTgdAkJ
         dpTG988gUIl6as8WS21E4LCBOxF1YNYurzIRmP+Zg9gQdl9zLX0Rb6lwWGFw87qb9uxx
         9sLAgvzcH+T+unJOFlEXbPzgsJ5+OneM09Kd6l0ie7rniJ+yUhMpdtGSWPWQvkfs058m
         989nWgHQbjp9nfSbbFy4vV7L4rrme0uvoHCptz0NJqGO/WB2KtBwEQD03DqhxAk6WNrB
         sKuQ==
X-Gm-Message-State: AOJu0Yy1N5ceCmSigW7iYD49i4O5ctWJIm24ocjVdDE7fsC9l/vz51YH
	KtZbzVqrvwrehc0VmPUTmmgOa55ym9dDug17todZmj2mSN9w9/60PVDYCbFz4SIhFXL/ececc8d
	SJICh9cwirI0NSoFv
X-Received: by 2002:a05:6a20:258e:b0:153:56b1:8417 with SMTP id k14-20020a056a20258e00b0015356b18417mr1073877pzd.21.1695786855942;
        Tue, 26 Sep 2023 20:54:15 -0700 (PDT)
X-Received: by 2002:a05:6a20:258e:b0:153:56b1:8417 with SMTP id k14-20020a056a20258e00b0015356b18417mr1073854pzd.21.1695786855573;
        Tue, 26 Sep 2023 20:54:15 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902ea0a00b001b895336435sm350672plg.21.2023.09.26.20.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 20:54:14 -0700 (PDT)
Message-ID: <44e4f955-ab51-92ca-8d65-e3a38d8d6657@redhat.com>
Date: Wed, 27 Sep 2023 13:54:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 02/37] cpus-common: Add common CPU utility for
 possible vCPUs
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-3-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-3-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: qfelMkK8AP+H

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> Adds various utility functions which might be required to fetch or check the
> state of the possible vCPUs. This also introduces concept of *disabled* vCPUs,
> which are part of the *possible* vCPUs but are not part of the *present* vCPU.
> This state shall be used during machine init time to check the presence of
> vcpus.
   ^^^^^

   vCPUs

> 
> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   cpus-common.c         | 31 +++++++++++++++++++++++++
>   include/hw/core/cpu.h | 53 +++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 84 insertions(+)
> 
> diff --git a/cpus-common.c b/cpus-common.c
> index 45c745ecf6..24c04199a1 100644
> --- a/cpus-common.c
> +++ b/cpus-common.c
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

I do think it's a good idea to have wrappers to check for CPU's states since
these CPU states play important role in this series to support vCPU hotplug.
However, it would be nice to move them around into header file (include/hw/boards.h)
because all the checks are originated from ms->possible_cpus->cpus[]. It sounds
functions to a machine (board) instead of global scope. Besides, it would be
nice to have same input (index) for all functions. How about something like
below in include/hw/boards.h?

static inline  bool machine_has_possible_cpu(int index)
{
     MachineState *ms = MACHINE(qdev_get_machine());

     if (!ms || !ms->possible_cpus || index < 0 || index >= ms->possible_cus->len) {
         return false;
     }

     return true;
}

static inline bool machine_has_present_cpu(int index)
{
     MachineState *ms = MACHINE(qdev_get_machine());

     if (!machine_is_possible_cpu(index) ||
         !ms->possible_cpus->cpus[index].cpu) {
         return false;
     }

     return true;
}

static inline bool machine_has_enabled_cpu(int index)
{
     MachineState *ms = MACHINE(qdev_get_machine());
     CPUState *cs;

     if (!machine_is_present_cpu(index)) {
         return false;
     }

     cs = CPU(ms->possible_cpus->cpus[index].cpu);
     return !cs->disabled
}

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

I think it's unnecessary to keep it since it's called for once by
hw/arm/virt-acpi-build.c::build_madt. The architectural ID can be
directly fetched from possible_cpus->cpus[i].arch_id. It's fine
to drop this function and fold the logic to the following patch.

[PATCH RFC V2 21/37] hw/arm: MADT Tbl change to size the guest with possible vCPUs


>   CPUState *qemu_get_cpu(int index)
>   {
>       CPUState *cpu;
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index fdcbe87352..e5af79950c 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -413,6 +413,17 @@ struct CPUState {
>       SavedIOTLB saved_iotlb;
>   #endif
>   
> +    /*
> +     * Some architectures do not allow *presence* of vCPUs to be changed
> +     * after guest has booted using information specified by VMM/firmware
> +     * via ACPI MADT at the boot time. Thus to enable vCPU hotplug on these
> +     * architectures possible vCPU can have CPUState object in 'disabled'
> +     * state or can also not have CPUState object at all. This is possible
> +     * when vCPU Hotplug is supported and vCPUs are 'yet-to-be-plugged' in
> +     * the QOM or have been hot-unplugged.
> +     * By default every CPUState is enabled as of now across all archs.
> +     */
> +    bool disabled;
>       /* TODO Move common fields from CPUArchState here. */
>       int cpu_index;
>       int cluster_index;

I guess the comments can be simplified a bit. How about something like below?

     /*
      * In order to support vCPU hotplug on architectures like aarch64,
      * the vCPU states fall into possible, present or enabled. This field
      * is added to distinguish present and enabled vCPUs. By default, all
      * vCPUs are present and enabled.
      */

> @@ -770,6 +781,48 @@ static inline bool cpu_in_exclusive_context(const CPUState *cpu)
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

All these descriptive stuff isn't needed after the functions are moved to
include/hw/boards.h, and qemu_get_cpu_archid() is dropped.

>   /**
>    * cpu_exists:
>    * @id: Guest-exposed CPU ID to lookup.

Thanks,
Gavin
