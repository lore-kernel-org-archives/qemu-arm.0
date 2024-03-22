Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp1017996ejv;
        Fri, 22 Mar 2024 01:15:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCr7hvltm3GMB8sTT7e6dzT455GzzPC6/ogLVCfjaApI3gul/vm6ZuX8CIR0AeMdqbqMi9golfHF6qzLeUeLcpq1T2DLG4
X-Google-Smtp-Source: AGHT+IGjtaUyVK3mjLgAdj+ATDT7KupdPv/Dr1csntyuRGZKn51L7ZquGy8hK2Aw19NnTi0UCNbs
X-Received: by 2002:a25:361e:0:b0:dd1:ebc:ca2d with SMTP id d30-20020a25361e000000b00dd10ebcca2dmr1597809yba.52.1711095357333;
        Fri, 22 Mar 2024 01:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711095357; cv=none;
        d=google.com; s=arc-20160816;
        b=tg1UgG6KDPdIrcWL4Aca1Smz+12UDmkUBhzpmOlpLIb/FVc/UUFcscr+Py4LnNtUPT
         A9M1nxpb3FLy84NTitHMv32Xrgx2/23MYDKu7qHl/q8aZBvFHEC25q33Ib6dbHD72SMc
         gc8lhRPbE20iYc26Tr7vVCOCmO0IPf72VodXZSo3Ym6gdhd/oRRtVI9sPLZuMmXVU31o
         g00XkxDhgp89gzncoIN4C1w4iMDk68Mh5RUHEtwCckfGNRViiJZWFTlF14R+7muZoqDJ
         XiQn8rdGmad/kgCCzDosj3BUOjI/GnqyT150AmThwkkQejiC2HXHa7zT8GChv42rWsFC
         l6Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=17kDj5YcawoHGbF3UgH4tA0YllnTGXTDLVxO/zS6Gqw=;
        fh=suquJwrW4peq7auAPIVja/8lIRiktKIADH40+wmiXnI=;
        b=B2frCBbTOjPjMqBMM9BhaDsC4ezADeJ/fbVXTNY9IfErBhM0hK1Dq/NilC9NvDrATK
         XLUYhlUhtgt+As2xAT1Tc8nXtMK1C7CagMGshRz1LM7Z9RKRmwio2JCsRpJi2FE6gKid
         toGhLxeBx+tDQUcHUP3ShMCa554vP4igGrDaV1qus5ZP1IYv/hRUJ7yaaVb/JjGNv3DG
         r2SSTGyyxWZmcRZgonUYE1HJWLNB7I1oUo9oHJeqivdwvR9PFKCFVNVSzaVg1nSkZcpP
         azzCFC1ek19Z+ve/iE2CgGhJyPBXJ5rDR7Y/mUlerOgs28uEj8OCootlYm3Wyn+HB/yX
         k/Vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=sj7hw0Pv;
       spf=pass (google.com: domain of harshpb@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=harshpb@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <harshpb@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id h7-20020a256c07000000b00dc6c2e54c07si537648ybc.124.2024.03.22.01.15.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Mar 2024 01:15:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of harshpb@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=sj7hw0Pv;
       spf=pass (google.com: domain of harshpb@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=harshpb@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42M7XmbC019386;
	Fri, 22 Mar 2024 08:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=17kDj5YcawoHGbF3UgH4tA0YllnTGXTDLVxO/zS6Gqw=;
 b=sj7hw0PvDYxAAEq9WMMeEXmIaxvUcVFPYNV0TD2Ez4WPze5EN+7D1hDebLHdHlGbjWVy
 Eu6yRw/Cq3lCXAq0/rWPiNmQasM2VnwrGaN7SOAK9AANUOtL9vmXp0R1UaWzRbFnlWfa
 BnyA/KnI0dY8FdqlMkzr/u12Vy78c95N/p+czNOjXb79SfzG7GLHGokVdJM/DU96GuEI
 eS0am4PeXuGdW0ECsefDgYYmfWL1U8HdmGcVq+IGvw/OCQbdVgjB4NBkR34mYP8Ojca+
 xJu2zrETlxHw/RkZ5ia5g4O3qOcCK1z2ROD47e7RbyrMB8oOQnDTvuMkmwXM1uXo9NVY VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x15pd02p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 08:15:35 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42M8FYxd017195;
	Fri, 22 Mar 2024 08:15:34 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x15pd02nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 08:15:34 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42M5M9aj026684;
	Fri, 22 Mar 2024 08:15:33 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x0x172g1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 08:15:33 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42M8FUJA11665978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 Mar 2024 08:15:32 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28D1E58068;
	Fri, 22 Mar 2024 08:15:30 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 905A258053;
	Fri, 22 Mar 2024 08:15:13 +0000 (GMT)
Received: from [9.171.94.36] (unknown [9.171.94.36])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 22 Mar 2024 08:15:13 +0000 (GMT)
Message-ID: <ca178aae-82b9-4150-9965-50d968787d23@linux.ibm.com>
Date: Fri, 22 Mar 2024 13:45:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 1/8] accel/kvm: Extract common KVM vCPU {creation,
 parking} code
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
        lpieralisi@kernel.org, peter.maydell@linaro.org,
        richard.henderson@linaro.org, imammedo@redhat.com,
        andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
        eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
        mst@redhat.com, will@kernel.org, gshan@redhat.com, rafael@kernel.org,
        alex.bennee@linaro.org, linux@armlinux.org.uk,
        darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
        vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
        miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
        wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
        jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
        linuxarm@huawei.com, Vaibhav Jain <vaibhav@linux.ibm.com>,
        sbhat@linux.ibm.com
References: <20240312020000.12992-1-salil.mehta@huawei.com>
 <20240312020000.12992-2-salil.mehta@huawei.com>
Content-Language: en-US
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <20240312020000.12992-2-salil.mehta@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tsxhMhWsrL_GhKz9GU4yVSscVlmqQIFx
X-Proofpoint-GUID: AZ1Q4nW4o_OTiYwPeOE_BYR2DaNpe9Ki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_04,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 mlxscore=0 malwarescore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2403210000
 definitions=main-2403220058
X-TUID: wY/jFGEcoIgp

+ Vaibhav, Shiva

Hi Salil,

I came across your patch while trying to solve a related problem on 
spapr. One query below ..

On 3/12/24 07:29, Salil Mehta via wrote:
> KVM vCPU creation is done once during the vCPU realization when Qemu vCPU thread
> is spawned. This is common to all the architectures as of now.
> 
> Hot-unplug of vCPU results in destruction of the vCPU object in QOM but the
> corresponding KVM vCPU object in the Host KVM is not destroyed as KVM doesn't
> support vCPU removal. Therefore, its representative KVM vCPU object/context in
> Qemu is parked.
> 
> Refactor architecture common logic so that some APIs could be reused by vCPU
> Hotplug code of some architectures likes ARM, Loongson etc. Update new/old APIs
> with trace events instead of DPRINTF. No functional change is intended here.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   accel/kvm/kvm-all.c    | 64 ++++++++++++++++++++++++++++++++----------
>   accel/kvm/trace-events |  5 +++-
>   include/sysemu/kvm.h   | 16 +++++++++++
>   3 files changed, 69 insertions(+), 16 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index a8cecd040e..3bc3207bda 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -126,6 +126,7 @@ static QemuMutex kml_slots_lock;
>   #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
>   
>   static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
> +static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id);
>   
>   static inline void kvm_resample_fd_remove(int gsi)
>   {
> @@ -314,14 +315,53 @@ err:
>       return ret;
>   }
>   
> +void kvm_park_vcpu(CPUState *cpu)
> +{
> +    struct KVMParkedVcpu *vcpu;
> +
> +    trace_kvm_park_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> +
> +    vcpu = g_malloc0(sizeof(*vcpu));
> +    vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
> +    vcpu->kvm_fd = cpu->kvm_fd;
> +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> +}
> +
> +int kvm_create_vcpu(CPUState *cpu)
> +{
> +    unsigned long vcpu_id = kvm_arch_vcpu_id(cpu);
> +    KVMState *s = kvm_state;
> +    int kvm_fd;
> +
> +    trace_kvm_create_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> +
> +    /* check if the KVM vCPU already exist but is parked */
> +    kvm_fd = kvm_get_vcpu(s, vcpu_id);
> +    if (kvm_fd < 0) {
> +        /* vCPU not parked: create a new KVM vCPU */
> +        kvm_fd = kvm_vm_ioctl(s, KVM_CREATE_VCPU, vcpu_id);
> +        if (kvm_fd < 0) {
> +            error_report("KVM_CREATE_VCPU IOCTL failed for vCPU %lu", vcpu_id);
> +            return kvm_fd;
> +        }
> +    }
> +
> +    cpu->kvm_fd = kvm_fd;
> +    cpu->kvm_state = s;
> +    cpu->vcpu_dirty = true;
> +    cpu->dirty_pages = 0;
> +    cpu->throttle_us_per_full = 0;
> +
> +    return 0;
> +}
> +
>   static int do_kvm_destroy_vcpu(CPUState *cpu)
>   {
>       KVMState *s = kvm_state;
>       long mmap_size;
> -    struct KVMParkedVcpu *vcpu = NULL;
>       int ret = 0;
>   
> -    trace_kvm_destroy_vcpu();
> +    trace_kvm_destroy_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>   
>       ret = kvm_arch_destroy_vcpu(cpu);
>       if (ret < 0) {
> @@ -347,10 +387,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
>           }
>       }
>   
> -    vcpu = g_malloc0(sizeof(*vcpu));
> -    vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
> -    vcpu->kvm_fd = cpu->kvm_fd;
> -    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> +    kvm_park_vcpu(cpu);
>   err:
>       return ret;
>   }
> @@ -371,6 +408,8 @@ static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
>           if (cpu->vcpu_id == vcpu_id) {
>               int kvm_fd;
>   
> +            trace_kvm_get_vcpu(vcpu_id);
> +
>               QLIST_REMOVE(cpu, node);
>               kvm_fd = cpu->kvm_fd;
>               g_free(cpu);
> @@ -378,7 +417,7 @@ static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
>           }
>       }
>   
> -    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
> +    return -ENOENT;
>   }
>   
>   int kvm_init_vcpu(CPUState *cpu, Error **errp)
> @@ -389,19 +428,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
>   
>       trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>   
> -    ret = kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
> +    ret = kvm_create_vcpu(cpu);
>       if (ret < 0) {
> -        error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu failed (%lu)",
> +        error_setg_errno(errp, -ret,
> +                         "kvm_init_vcpu: kvm_create_vcpu failed (%lu)",
>                            kvm_arch_vcpu_id(cpu));

If a vcpu hotplug fails due to failure with kvm_create_vcpu ioctl,
current behaviour would be to bring down the guest as errp is
&error_fatal. Any thoughts on how do we ensure that a failure with
kvm_create_vcpu ioctl for hotplugged cpus (only) doesnt bring down the
guest and fail gracefully (by reporting error to user on monitor?)?

regards,
Harsh
>           goto err;
>       }
>   
> -    cpu->kvm_fd = ret;
> -    cpu->kvm_state = s;
> -    cpu->vcpu_dirty = true;
> -    cpu->dirty_pages = 0;
> -    cpu->throttle_us_per_full = 0;
> -
>       mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
>       if (mmap_size < 0) {
>           ret = mmap_size;
> diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
> index a25902597b..5558cff0dc 100644
> --- a/accel/kvm/trace-events
> +++ b/accel/kvm/trace-events
> @@ -9,6 +9,10 @@ kvm_device_ioctl(int fd, int type, void *arg) "dev fd %d, type 0x%x, arg %p"
>   kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to retrieve ONEREG %" PRIu64 " from KVM: %s"
>   kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to set ONEREG %" PRIu64 " to KVM: %s"
>   kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
> +kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
> +kvm_get_vcpu(unsigned long arch_cpu_id) "id: %lu"
> +kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
> +kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
>   kvm_irqchip_commit_routes(void) ""
>   kvm_irqchip_add_msi_route(char *name, int vector, int virq) "dev %s vector %d virq %d"
>   kvm_irqchip_update_msi_route(int virq) "Updating MSI route virq=%d"
> @@ -25,7 +29,6 @@ kvm_dirty_ring_reaper(const char *s) "%s"
>   kvm_dirty_ring_reap(uint64_t count, int64_t t) "reaped %"PRIu64" pages (took %"PRIi64" us)"
>   kvm_dirty_ring_reaper_kick(const char *reason) "%s"
>   kvm_dirty_ring_flush(int finished) "%d"
> -kvm_destroy_vcpu(void) ""
>   kvm_failed_get_vcpu_mmap_size(void) ""
>   kvm_cpu_exec(void) ""
>   kvm_interrupt_exit_request(void) ""
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index fad9a7e8ff..2ed928aa71 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -435,6 +435,22 @@ void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
>   int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
>                                          hwaddr *phys_addr);
>   
> +/**
> + * kvm_create_vcpu - Gets a parked KVM vCPU or creates a KVM vCPU
> + * @cpu: QOM CPUState object for which KVM vCPU has to be fetched/created.
> + *
> + * @returns: 0 when success, errno (<0) when failed.
> + */
> +int kvm_create_vcpu(CPUState *cpu);
> +
> +/**
> + * kvm_park_vcpu - Park QEMU KVM vCPU context
> + * @cpu: QOM CPUState object for which QEMU KVM vCPU context has to be parked.
> + *
> + * @returns: none
> + */
> +void kvm_park_vcpu(CPUState *cpu);
> +
>   #endif /* NEED_CPU_H */
>   
>   void kvm_cpu_synchronize_state(CPUState *cpu);
