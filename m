Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp2911798ejc;
        Sun, 15 Oct 2023 19:47:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzg7ZSQ5YLVIwRNkNdQR1TDLJbH2nYccbavXxybhlH9xlXHikPIMrQLYKwRAo4JU4TSqUI
X-Received: by 2002:a05:620a:1a95:b0:773:e1e7:bb2d with SMTP id bl21-20020a05620a1a9500b00773e1e7bb2dmr40117405qkb.60.1697424469449;
        Sun, 15 Oct 2023 19:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697424469; cv=none;
        d=google.com; s=arc-20160816;
        b=0JbRZjzvNQz7/9096pLE4q974dHIcb1yLcemuhqaik7vt8sTjEeDCU4nV6JuYZj5Dg
         IL5DGS93dH+FFWE7KsC4YCQEJLEPL04IHdTDlalDQqV4+OKq46KmwjD08eC71VN22up0
         qsLwk5VQH8ywksVg/Wg+ab9nQnQlYWEZn2caYMlSWhKRxQTBzOgV+V3cIHCE6xNek86t
         mlXwVjvcDeQ/jLf0q4g7fIvMzOg5xWZve2d9sT2PSzY0zCpiYInzERJ5CtfUDOnfAE7S
         vgDl+krgjrfm5AVRgFM9Wgmslg3VSCGIy/LNGeti8+IM0qTFCJzQCHBCArYn8v22ZCm2
         7NiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KvgM+lb+IVkMv1rxg3BMId2hK7dnFtUElvsMmvRTX6c=;
        fh=HQu76LFN0DbKXHr60vGnzTmi359RrU+EPC8eBDHkPTc=;
        b=NZ4ZCVzRp52zYwiylybUlNHwZWJmZ1uyRw0J5pMa8RZJpEUm+CAvYoW+eEWsYdTlAA
         ifluzY2Gb+TmKHSeuyP3RP0KIJk4vV57SbdLGq9rF0tOgUxfSYH4LWCdp5Hw0kXZ0uoC
         NUa+FaYBU1VVfPntmRReYMbW8myFzacZw9TJVEaLTSp2uph9ZkbMLSFCRRrfsCyHHe83
         GfplTlObOZh62ZI5M96QMK8IVFJq+dfyDxxoESyKheyrF9wpwGMvioylNzHLqkAk7jR6
         hAZxgMhvGLYiwdDh3KEwu1xcmolLG+PJVzakqmj8mD/VPDTTLLB4q8q+8AQJrOhxLvJp
         Si7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CXncydKy;
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <shahuang@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id z15-20020a0ce98f000000b006592a95dde8si4705663qvn.87.2023.10.15.19.47.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 19:47:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of shahuang@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CXncydKy;
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697424469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvgM+lb+IVkMv1rxg3BMId2hK7dnFtUElvsMmvRTX6c=;
	b=CXncydKy5bRVxTcMFBnztL+vnY7y67RO4qx0F6L+w9m/U/RRcdwD6yJGYghBC+r7TAyi4u
	e8JMMrk+lirwTO18VDIHLEdOKlVYAo8+sXOUgMCOq5+5Wuo+XYtt8Grhe6wMFO083SYwWp
	dw2ciKlgxPWT3+bz+7d7mn7scqyOs1I=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-JUAfRey_NyuE3q4kmcxABA-1; Sun, 15 Oct 2023 22:47:47 -0400
X-MC-Unique: JUAfRey_NyuE3q4kmcxABA-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6bdc140103bso139365b3a.1
        for <alex.bennee@linaro.org>; Sun, 15 Oct 2023 19:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697424467; x=1698029267;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KvgM+lb+IVkMv1rxg3BMId2hK7dnFtUElvsMmvRTX6c=;
        b=Y/L9oWNw6pgGLH+omQRmQsNgycbKAdlzWfRseuFuYhOBkMnjDGnCi8R9CrBu6GHwy/
         w5wVXgMMB9hRkt+TtIpYmYrTQa/aaK2afovEIiqnkrCJoIjLFYPBbjrMDJRVVvGfBaU0
         6vLN135y/J0n12Ga1Ptv9+b0ZGxdIN89ZnH6JeZusfLW58OeFXqn5/JA4n/uHMIQbmYK
         9AcQVskP3GCUibV5oY2xeR1B49OkoHwwO7BIxwHhZ4eY91EO5Ch9TdOF602REwIUkfIl
         LoZyaMdx48RLfGuJ6Bz0t41ywMneBH69uptVJUVFEGnqLtqc/WyCoHXdC09OpDkdmXxP
         /AZg==
X-Gm-Message-State: AOJu0YzmdHB++HrKf40/svXqUAwTfAdF76J3MO9Y1I6UPejZC5pCsYjJ
	aQ/VC7FkyUdqQ25O6MBryJjErIq6L/hAu+j0rJdwAFIRUJXv5KWuBsLxpOtg/lvVZopMBBkH5Q/
	I54HMXMisq/w6ox7j
X-Received: by 2002:a05:6a20:8f01:b0:163:d382:ba99 with SMTP id b1-20020a056a208f0100b00163d382ba99mr40565824pzk.5.1697424466872;
        Sun, 15 Oct 2023 19:47:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:8f01:b0:163:d382:ba99 with SMTP id b1-20020a056a208f0100b00163d382ba99mr40565781pzk.5.1697424466533;
        Sun, 15 Oct 2023 19:47:46 -0700 (PDT)
Return-Path: <shahuang@redhat.com>
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id mf13-20020a17090b184d00b0026f919ff9a1sm3585170pjb.10.2023.10.15.19.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Oct 2023 19:47:46 -0700 (PDT)
Message-ID: <f33c6f0e-2d44-0023-39cf-49b74ff523d5@redhat.com>
Date: Mon, 16 Oct 2023 10:47:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V5 1/9] accel/kvm: Extract common KVM vCPU {creation,
 parking} code
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, linuxarm@huawei.com
References: <20231011194355.15628-1-salil.mehta@huawei.com>
 <20231011194355.15628-2-salil.mehta@huawei.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20231011194355.15628-2-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Dk4qQHx6TUZe



On 10/12/23 03:43, Salil Mehta via wrote:
> KVM vCPU creation is done once during the initialization of the VM when Qemu
> thread is spawned. This is common to all the architectures.
> 
> Hot-unplug of vCPU results in destruction of the vCPU object in QOM but the
> corresponding KVM vCPU object in the Host KVM is not destroyed and its
> representative KVM vCPU object/context in Qemu is parked.
> 
> Refactor common logic so that some APIs could be reused by vCPU Hotplug code.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   accel/kvm/kvm-all.c    | 64 ++++++++++++++++++++++++++++++++----------
>   accel/kvm/trace-events |  4 +++
>   include/sysemu/kvm.h   | 16 +++++++++++
>   3 files changed, 69 insertions(+), 15 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index ff1578bb32..0dcaa15276 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -137,6 +137,7 @@ static QemuMutex kml_slots_lock;
>   #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
>   
>   static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
> +static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id);
>   
>   static inline void kvm_resample_fd_remove(int gsi)
>   {
> @@ -320,14 +321,53 @@ err:
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
> -    DPRINTF("kvm_destroy_vcpu\n");
> +    trace_kvm_destroy_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>   
>       ret = kvm_arch_destroy_vcpu(cpu);
>       if (ret < 0) {
> @@ -353,10 +393,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
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
> @@ -377,6 +414,8 @@ static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
>           if (cpu->vcpu_id == vcpu_id) {
>               int kvm_fd;
>   
> +            trace_kvm_get_vcpu(vcpu_id);
> +
>               QLIST_REMOVE(cpu, node);
>               kvm_fd = cpu->kvm_fd;
>               g_free(cpu);
> @@ -384,7 +423,7 @@ static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
>           }
>       }
>   
> -    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
> +    return -ENOENT;
>   }
>   
>   int kvm_init_vcpu(CPUState *cpu, Error **errp)
> @@ -395,19 +434,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
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
> index 399aaeb0ec..cdd0c95c09 100644
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
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index ee9025f8e9..740686ab60 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -465,6 +465,22 @@ void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
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
> + * kvm_park_vcpu - Park Qemu KVM vCPU context
> + * @cpu: QOM CPUState object for which Qemu KVM vCPU context has to be parked.
> + *
> + * @returns: none
> + */
> +void kvm_park_vcpu(CPUState *cpu);
> +
>   #endif /* NEED_CPU_H */
>   
>   void kvm_cpu_synchronize_state(CPUState *cpu);

-- 
Shaoqin
