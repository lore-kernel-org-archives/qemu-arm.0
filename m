Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp642092ejr;
        Wed, 11 Oct 2023 00:09:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESMmQM5dyehbgkNDJ6+5Lt7iRDmPD7kTKgwGT35iej+9c1tf+z070DsLQGfpF0m/8deNJI
X-Received: by 2002:a05:622a:1ba0:b0:419:a2c6:8213 with SMTP id bp32-20020a05622a1ba000b00419a2c68213mr22247231qtb.5.1697008157015;
        Wed, 11 Oct 2023 00:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697008157; cv=none;
        d=google.com; s=arc-20160816;
        b=pTZfTD4kX4le5fxbjrLxSbbpwrcXZfFF3ieMRU1UK29fo5W8xxxq5l11qfCjF1wpRk
         d18aTmkyYZ5kMT96aacS/ycgFs8GtCCy+Qg82VOKmdFyfa4WabUTL6gmdmpuAgZ4G+6v
         4i3r/TXMAncZbGdNHE3sifRswqN+Pi7ewPMmqIqfaNymtZK9H78MTmchqZd3R0zOANPA
         pgkhak3NYKOv42C/sdElQcE3sADasacbsQbXIYRyAOwhNcVqzSlR/9YSzHT3erd3bjE8
         2PMZgrpHZDwT1hvwo+ALi4+VbEvN5sgzpFcv0PDcpN9m3XJs0yiTkDyFmFmBjBSjHoA9
         qEiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BVJ5aK817DyNc3edpEHQRTyeEzCT4lsEwnNmIlDT+6w=;
        fh=UoUFvcIH1Llqwj9lcubayb9wLqiblQuJi8py3jS56vc=;
        b=bK01VTr74dnBif7A3fRdiNFKrGrjfBctJwsLd5JJpkXdsRiQ6q+H8uZwtwJPHP+b5D
         onY6DQ4uhOeehJpall8wMNOEqL8SskPeM3jDqqHIxcrxNK8stdG5Or2n+6jkxg5v1Kup
         Hw1FN3icMXcfQrsydn12Sqiv5j2S0DuQCrK41geo+YetlRFm1mKCGOvuYjeSmlv8jkMh
         pj5NtF+tjp4e6BN3aCa7fpW5Gb//r/7Css3Cc1utIOKpWXve1XQe9jRW59ce1H4L/2xY
         ZaHGMn5raWyWHK4jAIqr/m8M4C/+HRQkBjEcrysnl4NsaAsgLJZz/nbf+s8IUCZO50p5
         BpXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=So9JgVWW;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id f7-20020ac87f07000000b0041936da3799si8721703qtk.634.2023.10.11.00.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 00:09:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=So9JgVWW;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697008156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BVJ5aK817DyNc3edpEHQRTyeEzCT4lsEwnNmIlDT+6w=;
	b=So9JgVWW5mFn+D9TCTZVjIkcGpw7oD/eLo9f9XKl6WrV6u3riWWOcuMNTfCYvJCexdrQDd
	ABrSWtEb4c8VM1c2/6pR/Sv0dpAX10FTDSrRhQdoO4kJmIZtG08xbjKcim2W148woSimok
	yqm4bF2u2WlhN0sGWSju9pxX6KYlQi4=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-xVVewdg6Nbmk3JdXSGZETQ-1; Wed, 11 Oct 2023 03:09:15 -0400
X-MC-Unique: xVVewdg6Nbmk3JdXSGZETQ-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-5849bcbf26bso528315a12.1
        for <alex.bennee@linaro.org>; Wed, 11 Oct 2023 00:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697008154; x=1697612954;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVJ5aK817DyNc3edpEHQRTyeEzCT4lsEwnNmIlDT+6w=;
        b=qFN2icnFKb103fvj2RvrP3kQK4HufsxZO8fENGPVkvBNYkf9USJ5zDnU+pm+0gRYk0
         6HPZztgePlYDmNeYXlgRzPlpcntuN3Hn01eRLa9XYbXe83/1kzNQ/6JDOlT4rGBFhlte
         eqklOV92GIpxBk4k5wmjtDx/VDI/2iO10M/lLRwoSgD99OlFJVYEyohrxwNYsUGiynp+
         2OMAnsRCVYCN59Zpe5woAzopcQ5kikLN9GjkGPYyT+HRgYnXfT62CXojXFLnRC5todgR
         5iXnifA66xJBvwEJcPnpwrKbTt4TgJywjxb3uAp/d+ct4j4PykFoaupKMvLNohLL6bB1
         G14g==
X-Gm-Message-State: AOJu0YyfGFgY1Gm0fnMZS08nPBzVhGiQ1UTTjcW2Hgvc7LgEV8tDWcDJ
	7ybwiQaKpcbZuVBbMAxhXb/fS1tr9/fUqU2bqvUTIZjU2lwxjG7Cye2L1gM+ErOkfUaTkrGRHSb
	TTsJe8FPwY/f68I/d
X-Received: by 2002:a05:6a20:160d:b0:126:42ce:bd44 with SMTP id l13-20020a056a20160d00b0012642cebd44mr24617367pzj.17.1697008154310;
        Wed, 11 Oct 2023 00:09:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:160d:b0:126:42ce:bd44 with SMTP id l13-20020a056a20160d00b0012642cebd44mr24617344pzj.17.1697008153949;
        Wed, 11 Oct 2023 00:09:13 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id h19-20020aa786d3000000b0068ff267f092sm9288909pfo.216.2023.10.11.00.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 00:09:13 -0700 (PDT)
Message-ID: <910cb268-7344-fa0b-aa1e-935ded612d3e@redhat.com>
Date: Wed, 11 Oct 2023 17:09:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V4 01/10] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, rafael@kernel.org, alex.bennee@linaro.org,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 linuxarm@huawei.com
References: <20231009203601.17584-1-salil.mehta@huawei.com>
 <20231009203601.17584-2-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231009203601.17584-2-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: //14msf9RtcU

Hi Salil,

On 10/10/23 06:35, Salil Mehta wrote:
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
> ---
>   accel/kvm/kvm-all.c    | 64 ++++++++++++++++++++++++++++++++----------
>   accel/kvm/trace-events |  4 +++
>   include/sysemu/kvm.h   | 16 +++++++++++
>   3 files changed, 69 insertions(+), 15 deletions(-)
> 

With the following one comment addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

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
> index 399aaeb0ec..08e2dc253f 100644
> --- a/accel/kvm/trace-events
> +++ b/accel/kvm/trace-events
> @@ -9,6 +9,10 @@ kvm_device_ioctl(int fd, int type, void *arg) "dev fd %d, type 0x%x, arg %p"
>   kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to retrieve ONEREG %" PRIu64 " from KVM: %s"
>   kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to set ONEREG %" PRIu64 " to KVM: %s"
>   kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
> +kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id) "creating KVM cpu: cpu_index: %d arch vcpu-id: %lu"
> +kvm_get_vcpu(unsigned long arch_cpu_id) "unparking KVM vcpu: arch vcpu-id: %lu"
> +kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) "destroy vcpu: cpu_index: %d arch vcpu-id: %lu"
> +kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) "parking KVM vcpu: cpu_index: %d arch vcpu-id: %lu"

I don't think we need the duplicate identifiers like "creating KVM cpu"
since the event name can serve the purpose. Besides, the parameters
are descriptive by "index: %d id: %lu", used by kvm_init_vcpu(). We just
need to follow that pattern. Otherwise, inconsistent output will be printed
by kvm_init_vcpu() and kvm_get_vcpu(). So I would change them like below:

kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
kvm_get_vcpu(unsigned long arch_cpu_id) "id: %lu"
kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"

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

Thanks,
Gavin
