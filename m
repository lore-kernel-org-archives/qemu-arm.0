Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1452091ejc;
        Tue, 26 Sep 2023 16:57:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAJDlVhjIfxhtfPGuUJbudAJan1FbPs3RxQH8syrJEV30FNUBi86Y4iY0VH67gHd1Gy+ki
X-Received: by 2002:a0d:ead3:0:b0:595:8499:c5f5 with SMTP id t202-20020a0dead3000000b005958499c5f5mr328638ywe.26.1695772654799;
        Tue, 26 Sep 2023 16:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695772654; cv=none;
        d=google.com; s=arc-20160816;
        b=HXtOqAf9aqEEhzopZvZhKKR2U3VSIfjJEwP53T8B+dP/Fka/HJ5gxjISxv17D83y71
         Ue0S1izjQmhQ+hor7RV9UvfKykaVwH8TgjbZ//hlJMXd0M/KFD2abo2Vkdhs3t2WDpTO
         iI8rlKpmwzNWmgHi1pQaYazi1sdACY64vKN6dOVc3bwOYp//cJAnaSvNrUwculPZFLBa
         mQlMb0ZZN20jgoUg3NRX3KtQSB62E5FRMX8r8AuVij3gKbiyDhknsmgxCsGM3XhnU05F
         uJDDuL9PdPirA71L91OKJuvZnEhhzy2ZYfNWKgiDQuAOW3MMzGzJeVOlJiNxpAVAP0qC
         KdHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YojiN4iQj8J/kXQ6FhBhpSyy/ep2bnLMTpRtktnAGj8=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=0ogJ5VWOp80UpojJdAF3GM/ALAOubk423XqLwN3OR0RUr+VZSfrTjQYjA49RjKXfcy
         ojDHmsb2ntjzfH9W2Z7gX1tS0BdTontvDpurfnhlv+O5mNi4BIDI1D+AECwuCsN8khdr
         89qnLelf3gcX8LtASUJweTiXecRMz13E3Njqm+ryBwENjYDw2WlWkC2bMdy3nzbwrjzs
         ryfNnq/ZLQ1hCVXswSRJnBXo43pP8LoJuPfxjAZm0nTCaH0mAqH68txDGcJTYBBjWzm8
         95+WXEWORxZIM7smNKhEUgrFoluZAw3MeMrtPf/IK3Auo33GnPV6bbW2DuFRWQ/ygRFD
         Yd2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aVzQxVha;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id w134-20020a0dd48c000000b0059f5d9d0d7bsi3201061ywd.414.2023.09.26.16.57.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 16:57:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aVzQxVha;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695772654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YojiN4iQj8J/kXQ6FhBhpSyy/ep2bnLMTpRtktnAGj8=;
	b=aVzQxVhacgd5MndYv8oza6oktCjEi+i7Z82mGtQiYe6JYFtHRUDx+lAOIwdgEYCVtWb/Je
	EDAIoCTUXXPKNFxJIPANO8r/fNfEozv0xJ46d7hmkTgfNiGIJH19dLoDb4lLmmEQyM+5yC
	eUqb7jW+rOPbYGU66Y35UZ5MShb4eEk=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-VJ3f5d_hMCmSFVmiWiUtDA-1; Tue, 26 Sep 2023 19:57:33 -0400
X-MC-Unique: VJ3f5d_hMCmSFVmiWiUtDA-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-5849bcbf26bso3513508a12.1
        for <alex.bennee@linaro.org>; Tue, 26 Sep 2023 16:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695772652; x=1696377452;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YojiN4iQj8J/kXQ6FhBhpSyy/ep2bnLMTpRtktnAGj8=;
        b=s+W78wgkLjjdq4Am+zrtUJqyxLmi+wJXsJT579MNMboBa/w7srHcWAQ7wbVLR2AZMW
         dzsATx39szABZlpEtp5RHUTsop7yjlPIrOTfceme9+2zLFqawQYctUqjMF4DvZBMCPvA
         L15FYOF+tojCAjS87rsPZRWsEq1et4wPGIpwfX/cLwUdQg0gP/HM1smkl/C7qt2zz6Nc
         2fBmUalCxK7YJj3yURQ9+6Q3AZKyvw13/KvddcyCVhoudKf3BjfHNjtUlb4XmxIj389S
         x0kn521wZKh6I0Nl+SXir7n+fYuESvUx5u3M0XtPSWDkTBjwrhvX9I3IKgx1q7T1nnm2
         GERg==
X-Gm-Message-State: AOJu0YyNRnF9AYJhJXqmTH+pTK5fwTzzijHOsxtFPiW1GkodwY1NblLe
	cRaVMOBRjogL8WszxWwXCycmvulHrf24V0VwPNSQuq+vuvJBTAqe2Gb5S9j1Ws0l5cCsqqlLSLG
	0eiKh38gGb8Twyfa/
X-Received: by 2002:a05:6a20:2443:b0:15d:b407:b0a0 with SMTP id t3-20020a056a20244300b0015db407b0a0mr617085pzc.26.1695772651847;
        Tue, 26 Sep 2023 16:57:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:2443:b0:15d:b407:b0a0 with SMTP id t3-20020a056a20244300b0015db407b0a0mr617046pzc.26.1695772651374;
        Tue, 26 Sep 2023 16:57:31 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id fm1-20020a056a002f8100b00679a4b56e41sm10580839pfb.43.2023.09.26.16.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 16:57:30 -0700 (PDT)
Message-ID: <6cd28639-2cfa-f233-c6d9-d5d2ec5b1c58@redhat.com>
Date: Wed, 27 Sep 2023 09:57:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 01/37] arm/virt,target/arm: Add new ARMCPU
 {socket,cluster,core,thread}-id property
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
 <20230926100436.28284-2-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-2-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: f+LYPWkyePvf

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> This shall be used to store user specified topology{socket,cluster,core,thread}
> and shall be converted to a unique 'vcpu-id' which is used as slot-index during
> hot(un)plug of vCPU.
> 

Note that we don't have 'vcpu-id' property. It's actually the index to the array
ms->possible_cpus->cpus[] and cpu->cpu_index. Please improve the commit log if
it makes sense.

> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt.c    | 63 ++++++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.c |  4 +++
>   target/arm/cpu.h |  4 +++
>   3 files changed, 71 insertions(+)
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7d9dbc2663..57fe97c242 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -221,6 +221,11 @@ static const char *valid_cpus[] = {
>       ARM_CPU_TYPE_NAME("max"),
>   };
>   
> +static int virt_get_socket_id(const MachineState *ms, int cpu_index);
> +static int virt_get_cluster_id(const MachineState *ms, int cpu_index);
> +static int virt_get_core_id(const MachineState *ms, int cpu_index);
> +static int virt_get_thread_id(const MachineState *ms, int cpu_index);
> +
>   static bool cpu_type_valid(const char *cpu)
>   {
>       int i;
> @@ -2168,6 +2173,14 @@ static void machvirt_init(MachineState *machine)
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
> @@ -2652,10 +2665,59 @@ static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>       return socket_id % ms->numa_state->num_nodes;
>   }
>   

It seems it's not unnecessary to keep virt_get_{socket, cluster, core, thread}_id()
because they're called for once. I would suggest to figure out the socket, cluster,
core and thread ID through @possible_cpus in machvirt_init(), like below.

Besides, we can't always expose property "cluster-id" since cluster in the CPU
topology isn't always supported, seeing MachineClass::smp_props. Some users may
want to hide cluster for unknown reasons. 'cluster-id' shouldn't be exposed in
this case. Otherwise, users may be confused by 'cluster-id' property while it
has been disabled. For example, a VM is started with the following command lines
and 'cluster-id' shouldn't be supported in vCPU hot-add.

     -cpu host -smp=maxcpus=2,cpus=1,sockets=2,cores=1,threads=1
     (qemu) device_add host,id=cpu1,socket-id=1,cluster-id=0,core-id=0,thread-id=0

     object_property_set_int(cpuobj, "socket-id",
                             possible_cpus->cpus[i].props.socket_id, NULL);
     if (mc->smp_props.cluster_supported && mc->smp_props.has_clusters) {
         object_property_set_int(cpuobj, "cluster-id",
                                 possible_cpus->cpus[i].props.cluster_id, NULL);
     }
     object_property_set_int(cpuobj, "core-id",
                             possible_cpus->cpus[i].props.core_id, NULL);
     object_property_set_int(cpuobj, "thread-id",
                             possible_cpus->cpus[i].props.thread_id, NULL);

> +static int virt_get_socket_id(const MachineState *ms, int cpu_index)
> +{
> +    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
> +
> +    return ms->possible_cpus->cpus[cpu_index].props.socket_id;
> +}
> +
> +static int virt_get_cluster_id(const MachineState *ms, int cpu_index)
> +{
> +    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
> +
> +    return ms->possible_cpus->cpus[cpu_index].props.cluster_id;
> +}
> +
> +static int virt_get_core_id(const MachineState *ms, int cpu_index)
> +{
> +    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
> +
> +    return ms->possible_cpus->cpus[cpu_index].props.core_id;
> +}
> +
> +static int virt_get_thread_id(const MachineState *ms, int cpu_index)
> +{
> +    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
> +
> +    return ms->possible_cpus->cpus[cpu_index].props.thread_id;
> +}
> +
> +static int
> +virt_get_cpu_id_from_cpu_topo(const MachineState *ms, DeviceState *dev)
> +{
> +    int cpu_id, sock_vcpu_num, clus_vcpu_num, core_vcpu_num;
> +    ARMCPU *cpu = ARM_CPU(dev);
> +
> +    /* calculate total logical cpus across socket/cluster/core */
> +    sock_vcpu_num = cpu->socket_id * (ms->smp.threads * ms->smp.cores *
> +                    ms->smp.clusters);
> +    clus_vcpu_num = cpu->cluster_id * (ms->smp.threads * ms->smp.cores);
> +    core_vcpu_num = cpu->core_id * ms->smp.threads;
> +
> +    /* get vcpu-id(logical cpu index) for this vcpu from this topology */
> +    cpu_id = (sock_vcpu_num + clus_vcpu_num + core_vcpu_num) + cpu->thread_id;
> +
> +    assert(cpu_id >= 0 && cpu_id < ms->possible_cpus->len);
> +
> +    return cpu_id;
> +}
> +

This function is called for once in PATCH[04/37]. I think it needs to be moved
around to PATCH[04/37].

[PATCH RFC V2 04/37] arm/virt,target/arm: Machine init time change common to vCPU {cold|hot}-plug

The function name can be shortened because I don't see the suffix "_from_cpu_topo"
is too much helpful. I think virt_get_cpu_index() would be good enough since it's
called for once to return the index in array MachineState::possible_cpus::cpus[]
and the return value is stored to CPUState::cpu_index.

static int virt_get_cpu_index(const MachineState *ms, ARMCPU *cpu)
{
     int index, cpus_in_socket, cpus_in_cluster, cpus_in_core;

     /*
      * It's fine to take cluster into account even it's not supported. In this
      * case, ms->smp.clusters is always one.
      */
}

>   static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>   {
>       int n;
>       unsigned int max_cpus = ms->smp.max_cpus;
> +    unsigned int smp_threads = ms->smp.threads;
>       VirtMachineState *vms = VIRT_MACHINE(ms);
>       MachineClass *mc = MACHINE_GET_CLASS(vms);
>   
> @@ -2669,6 +2731,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>       ms->possible_cpus->len = max_cpus;
>       for (n = 0; n < ms->possible_cpus->len; n++) {
>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
> +        ms->possible_cpus->cpus[n].vcpus_count = smp_threads;
>           ms->possible_cpus->cpus[n].arch_id =
>               virt_cpu_mp_affinity(vms, n);
>   

This initialization seems to accomodate HMP command "info hotpluggable-cpus".
It would be nice if it can be mentioned in the commit log.

> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 93c28d50e5..1376350416 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2277,6 +2277,10 @@ static Property arm_cpu_properties[] = {
>       DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
>                           mp_affinity, ARM64_AFFINITY_INVALID),
>       DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
> +    DEFINE_PROP_INT32("socket-id", ARMCPU, socket_id, 0),
> +    DEFINE_PROP_INT32("cluster-id", ARMCPU, cluster_id, 0),
> +    DEFINE_PROP_INT32("core-id", ARMCPU, core_id, 0),
> +    DEFINE_PROP_INT32("thread-id", ARMCPU, thread_id, 0),
>       DEFINE_PROP_INT32("core-count", ARMCPU, core_count, -1),
>       DEFINE_PROP_END_OF_LIST()
>   };

All those 4 properties are used for vCPU hot-add, meaning they're not needed
when vCPU hotplug isn't supported on the specific board. Even for hw/virt board,
cluster isn't always supported and 'cluster-id' shouldn't always be exposed,
as explained above. How about to register the properties dynamically only when
they're needed by vCPU hotplug?

> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 88e5accda6..d51d39f621 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1094,6 +1094,10 @@ struct ArchCPU {
>       QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
>   
>       int32_t node_id; /* NUMA node this CPU belongs to */
> +    int32_t socket_id;
> +    int32_t cluster_id;
> +    int32_t core_id;
> +    int32_t thread_id;

It would be fine to keep those fields even the corresponding properties are
dynamically registered, but a little bit memory overhead incurred :)

>   
>       /* Used to synchronize KVM and QEMU in-kernel device levels */
>       uint8_t device_irq_level;

Thanks,
Gavin
