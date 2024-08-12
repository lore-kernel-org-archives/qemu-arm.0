Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp651117njh;
        Sun, 11 Aug 2024 21:36:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNgXgSaXd0nBCba3Pc68TIAvBy39uUHzhcHxll+eHBuRvdOhXCVkK//dOR+T3qhLqbE7MxaWtN7SSA0K3IBhnr8Em7+CE/
X-Google-Smtp-Source: AGHT+IGEaWzqsyHjvF1XCTXibI4/TUj0mxLFzPwBQSuKMMSnPI1BE/Qk3qfRgzfezpfcoFyfBnxt
X-Received: by 2002:a05:6214:3389:b0:6bb:b1c5:fabc with SMTP id 6a1803df08f44-6bd79c0b0f2mr143980116d6.17.1723437376152;
        Sun, 11 Aug 2024 21:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723437376; cv=none;
        d=google.com; s=arc-20160816;
        b=d1FXWRqkXjPQ71eg0VZPiTxFSdtO70Jx3hb0jzgyod2nEbWCVxwjRtawlSn5An1mZI
         OnugqofXJGTgZ6JhqpXdzemyFg8PWK5HamxiOJcgwWwgYCbtdJNfofx4jRMJQIpPZcKi
         QCZb9rG+mZJ2ty/kLRaQIBisZ4yAMQULKobjChWo7REJ0jf8JF0ffesO7xzDxtwdzcgM
         w5hpMbfeaRqVO2EpNZdo6/JVzEcgZJT2XGx7vuAMg0pbEHX2Jsinnwg6KpWAfaZrmLlw
         tXtb8e1Xz8i8PTjZ6Y7dMJQUF97EECBOg32PN3g4jwpKpkraEzTnjjZq7JydZBFXODNu
         9khw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Q5izUBUrMImrPzCzal12oBWLe66u8QPEjABbCsms9R4=;
        fh=oVfxI+/mVS7tYWhylelrz3KF1TTk83DoUdDcoXaihi4=;
        b=KpJcNPvbRBGs6vPtRXM2V3LYMcgTxx/v/tV/yLB6BwIOhFJklXfDyIu15MQF8Oc4yF
         E/aapqXI5J8bAVM7Xn5QYpCftgcqLnjcWy2dg7Y7SBGR/AuFRZME1kh4RIWhWv2Va1cl
         LaguaJZw30n5+oenR/Z0URU4v6j8apvni/dnSDxydQ4bPIXhMkCKIBRVn695kxz1+Kmm
         NqTT5p2+RKsYFnH+NMzcG6D4sJV/B15hiE3uLOa+YkQCLHsFEOacyec4eJMnQQ6hufwY
         eALgr9P6m5zRpZSZBrIqHLNGAwCvfL0PE9+wePNuvcNn2f/Z471W/HAhF2R5u/jkdrc8
         Y9Rg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NmKhRFai;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bd82e36706si54674636d6.211.2024.08.11.21.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 21:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NmKhRFai;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723437375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5izUBUrMImrPzCzal12oBWLe66u8QPEjABbCsms9R4=;
	b=NmKhRFai59UzmE28fLctvOOJYUVMN2qTTeGx2R0rEar/pa4zqhBNFOPY+d6CHNl8qFBA6T
	HatpIyHfub9JxmwZzWJJcXteDpwfUbGNyi7oqLqrtGnRwL90uTo7QUXFdz8+DwetIOF9Pi
	h5WNPb5EqQaTEjFJr2GXTiU4GUuJiDg=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-e6xWbeMlMo6paa5LLDwO_A-1; Mon, 12 Aug 2024 00:36:14 -0400
X-MC-Unique: e6xWbeMlMo6paa5LLDwO_A-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-70d2ab42082so4304974b3a.0
        for <alex.bennee@linaro.org>; Sun, 11 Aug 2024 21:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723437373; x=1724042173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5izUBUrMImrPzCzal12oBWLe66u8QPEjABbCsms9R4=;
        b=A1zt2LZ+IhBoav5gUeiC4gDT/eyAnqHOg3Qu9xvyOogVSO6LGoHIug9KGMpwyvfb3b
         PfCQ62eUX+CWfn3qii7VQEgMpbXAHXRGUzr5PVtkdAUYsP1qENXbaoHWr3lkCq4tS3D+
         RyrYXxOm1bH+S9QC+W1ZqSRK0vK63IBt5OMX6BhuFNzVm2shTDAqhzPYBFjfNTcSjgAu
         wjqKpd6qSj6oOKKYNiYElY08CCvB5zUomJbEFpT52a6qxZPf0Za60VmfQ+FGERpvSSE/
         /oQ8GC37o/C2GvQwMdYMj3o3lLDYoeZCEnDEISFDUu0L6oMIOtY+5c9QXpS1Cni+PEJ9
         kZTA==
X-Forwarded-Encrypted: i=1; AJvYcCU1dYI2GHh/6U4+/ViP4GYmH+bfgkY2oBzFcXarDNEsus2HZDncT6jQRxBn2UHOuQgvwroFXHFmXtJkCs6aHrDKN29K4KlA
X-Gm-Message-State: AOJu0Yz0l8zQufRlVaZm16Cc7OI2mNvl93MYxDZkSc+lr1ymWJlNjHy4
	PT054ZXIDme5DHUaB+6Zorh4Vz5/9gUyqJ1ASQvyjtO3zu2az0gD08up0q64SXbuEhir+H8yYyL
	mLhLNUQZ4v4sCrTTGjOwly12C1N3t+oC1x/qaHa/SU16LVQKlCUgDJw==
X-Received: by 2002:a05:6a20:a891:b0:1c8:c411:d556 with SMTP id adf61e73a8af0-1c8c411d6edmr3734138637.1.1723437373179;
        Sun, 11 Aug 2024 21:36:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:a891:b0:1c8:c411:d556 with SMTP id adf61e73a8af0-1c8c411d6edmr3734093637.1.1723437372618;
        Sun, 11 Aug 2024 21:36:12 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([43.252.112.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e58728eesm3102813b3a.41.2024.08.11.21.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Aug 2024 21:36:12 -0700 (PDT)
Message-ID: <11e627ef-d75e-4114-9b93-14d80ec0526b@redhat.com>
Date: Mon, 12 Aug 2024 14:35:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V3 01/29] arm/virt,target/arm: Add new ARMCPU
 {socket,cluster,core,thread}-id property
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
 <20240613233639.202896-2-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240613233639.202896-2-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: FYQhtMH7JTC+

On 6/14/24 9:36 AM, Salil Mehta wrote:
> This shall be used to store user specified topology{socket,cluster,core,thread}
> and shall be converted to a unique 'vcpu-id' which is used as slot-index during
> hot(un)plug of vCPU.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt.c         | 10 ++++++++++
>   include/hw/arm/virt.h | 28 ++++++++++++++++++++++++++++
>   target/arm/cpu.c      |  4 ++++
>   target/arm/cpu.h      |  4 ++++
>   4 files changed, 46 insertions(+)
> 

Those 4 properties are introduced to determine the vCPU's slot, which is the index
to MachineState::possible_cpus::cpus[]. From there, the CPU object or instance is
referenced and then the CPU's state can be further determined. It sounds reasonable
to use the CPU's topology to determine the index. However, I'm wandering if this can
be simplified to use 'cpu-index' or 'index' for a couple of facts: (1) 'cpu-index'
or 'index' is simplified. Users have to provide 4 parameters in order to determine
its index in the extreme case, for example "device_add host-arm-cpu, id=cpu7,socket-id=1,
cluster-id=1,core-id=1,thread-id=1". With 'cpu-index' or 'index', it can be simplified
to 'index=7'. (2) The cold-booted and hotpluggable CPUs are determined by their index
instead of their topology. For example, CPU0/1/2/3 are cold-booted CPUs while CPU4/5/6/7
are hotpluggable CPUs with command lines '-smp maxcpus=8,cpus=4'. So 'index' makes
more sense to identify a vCPU's slot.

> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 3c93c0c0a6..11fc7fc318 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2215,6 +2215,14 @@ static void machvirt_init(MachineState *machine)
>                             &error_fatal);
>   
>           aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
> +        object_property_set_int(cpuobj, "socket-id",
> +                                virt_get_socket_id(machine, n), NULL);
> +        object_property_set_int(cpuobj, "cluster-id",
> +                                virt_get_cluster_id(machine, n), NULL);
> +        object_property_set_int(cpuobj, "core-id",
> +                                virt_get_core_id(machine, n), NULL);
> +        object_property_set_int(cpuobj, "thread-id",
> +                                virt_get_thread_id(machine, n), NULL);
>   
>           if (!vms->secure) {
>               object_property_set_bool(cpuobj, "has_el3", false, NULL);
> @@ -2708,6 +2716,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>   {
>       int n;
>       unsigned int max_cpus = ms->smp.max_cpus;
> +    unsigned int smp_threads = ms->smp.threads;
>       VirtMachineState *vms = VIRT_MACHINE(ms);
>       MachineClass *mc = MACHINE_GET_CLASS(vms);
>   
> @@ -2721,6 +2730,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>       ms->possible_cpus->len = max_cpus;
>       for (n = 0; n < ms->possible_cpus->len; n++) {
>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
> +        ms->possible_cpus->cpus[n].vcpus_count = smp_threads;
>           ms->possible_cpus->cpus[n].arch_id =
>               virt_cpu_mp_affinity(vms, n);
>   

Why @vcpus_count is initialized to @smp_threads? it needs to be documented in
the commit log.

> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index bb486d36b1..6f9a7bb60b 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -209,4 +209,32 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
>               vms->highmem_redists) ? 2 : 1;
>   }
>   
> +static inline int virt_get_socket_id(const MachineState *ms, int cpu_index)
> +{
> +    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
> +
> +    return ms->possible_cpus->cpus[cpu_index].props.socket_id;
> +}
> +
> +static inline int virt_get_cluster_id(const MachineState *ms, int cpu_index)
> +{
> +    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
> +
> +    return ms->possible_cpus->cpus[cpu_index].props.cluster_id;
> +}
> +
> +static inline int virt_get_core_id(const MachineState *ms, int cpu_index)
> +{
> +    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
> +
> +    return ms->possible_cpus->cpus[cpu_index].props.core_id;
> +}
> +
> +static inline int virt_get_thread_id(const MachineState *ms, int cpu_index)
> +{
> +    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
> +
> +    return ms->possible_cpus->cpus[cpu_index].props.thread_id;
> +}
> +
>   #endif /* QEMU_ARM_VIRT_H */
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 77f8c9c748..abc4ed0842 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2582,6 +2582,10 @@ static Property arm_cpu_properties[] = {
>       DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
>                           mp_affinity, ARM64_AFFINITY_INVALID),
>       DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
> +    DEFINE_PROP_INT32("socket-id", ARMCPU, socket_id, 0),
> +    DEFINE_PROP_INT32("cluster-id", ARMCPU, cluster_id, 0),
> +    DEFINE_PROP_INT32("core-id", ARMCPU, core_id, 0),
> +    DEFINE_PROP_INT32("thread-id", ARMCPU, thread_id, 0),
>       DEFINE_PROP_INT32("core-count", ARMCPU, core_count, -1),
>       /* True to default to the backward-compat old CNTFRQ rather than 1Ghz */
>       DEFINE_PROP_BOOL("backcompat-cntfrq", ARMCPU, backcompat_cntfrq, false),
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index c17264c239..208c719db3 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1076,6 +1076,10 @@ struct ArchCPU {
>       QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
>   
>       int32_t node_id; /* NUMA node this CPU belongs to */
> +    int32_t socket_id;
> +    int32_t cluster_id;
> +    int32_t core_id;
> +    int32_t thread_id;
>   
>       /* Used to synchronize KVM and QEMU in-kernel device levels */
>       uint8_t device_irq_level;

Thanks,
Gavin
