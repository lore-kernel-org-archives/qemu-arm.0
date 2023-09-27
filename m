Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1640451ejc;
        Tue, 26 Sep 2023 23:52:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFocBF1WScQWBYNG5ffExZ1SlS2p2op878eMlgVUxr4d2KT3u9QsVpl80Em4lxUytngCupj
X-Received: by 2002:a17:907:77d4:b0:9ae:1872:d01a with SMTP id kz20-20020a17090777d400b009ae1872d01amr896189ejc.76.1695797525684;
        Tue, 26 Sep 2023 23:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695797525; cv=none;
        d=google.com; s=arc-20160816;
        b=nDYT1QWBUiQmk128tkALIQ0OB4BvJJmsuDRUrsTn9iNRm+eY/BYHFQmz+YvHqA7C3u
         Z5lgRd6K1VLXvtTf3lzaicag/N/Xgi/EVi8bE14x3KdkJ1mNwLBpQmXkdBwbJ3Tipn1V
         /toWdsUEtrAnLNLeADiDztdUjhM/fYGs/uloIi7YCe1sa9VBcOtHodfibTEyWPWkzQIT
         bedTWSO+snf70A5JrY7tnaD9BuwPSYJ9BABbKy8u+nwMlk6u6YC/uXrJdHo8XJruIWaC
         TOJM/kDPriEFmnK3S4+yq71sgA/UUOOyFfhD9z7UyG3N2vXsnMoH6tHOZF/wmVXyEKHI
         BvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4RvOR5dZ+C1ZUQ+lqDGx3+8W6rngWTvNmzfImuxkWSU=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=SDnteoAre80Y+tmZJ3oNDo6A6dy2hapbhph6aHiFCBJCN8eEX6kt5RSzaRpXJG794w
         ub/nM3ZtFos27MfITT40opN2bNQEZ1fdFH1MlCk8UcGgxn80xbRi8Z6qV5n1yAcqw9oi
         piV05N2UYo323TGtxhqXAJ3LJVyTJ6VQFwW98DWY1n8aLbwO0i/Gu9pOxZMiEDT09Jui
         M+A6lb1ZtGM1QiLNFcTsLW2++e55osOi1viRqLomKLms2YJJOUynN2jZkLZpJ6TeBQuH
         bT7rv9Bz7VYhyUGrBuYkUTsy2syxjG0nUTrsQINawtVngHUlPgHVs0wtjjKGee/xVRmo
         SijQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cJYe9yX9;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id kl17-20020a170907995100b0099bd19fe601si12775180ejc.533.2023.09.26.23.52.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 23:52:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cJYe9yX9;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695797524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4RvOR5dZ+C1ZUQ+lqDGx3+8W6rngWTvNmzfImuxkWSU=;
	b=cJYe9yX9rmMqXbZN4n1ZJYTBO8a3wFKbbCJnsFaZMiime25NS6dgad/zfYFUUw+XuUFgYv
	9n2b45O+Lse//468k8mQ3+VxaBZ+v8nokxfvpRKATfCnV8dnBgC9qewgMio/owLDTXi0vz
	yaIRKq/68D8bINKId0G8pLdujp7NlCo=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-YdC1OGhvOU6ediovegQF1w-1; Wed, 27 Sep 2023 02:52:01 -0400
X-MC-Unique: YdC1OGhvOU6ediovegQF1w-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-5788445ac04so10608606a12.2
        for <alex.bennee@linaro.org>; Tue, 26 Sep 2023 23:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695797520; x=1696402320;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4RvOR5dZ+C1ZUQ+lqDGx3+8W6rngWTvNmzfImuxkWSU=;
        b=ZrUTF+comlf2mLxRXg4Vk2AF4/HQruogOwXtwl0QqXwzTwrE7gkSVzdD/ZQYkAEHf9
         y3NqcTLqmarSBgBU5ATT1nDppuSuUa0qMFZlyerZ68yc66sVXh3bs+XHqmdRjAZuOWaq
         +UkDL7d1ySD3x+S2MCNjochnFByj6Uz6hVnxOiiEG7ItGhK63Iyj3hQciUvgkoMNeCVn
         f4oLJd/9khCJYqRTwlonnlMBqIvTzJ4x0u9ysBnJdLEa6bRIl7l6Pt1JfZHQH5VAXlOY
         X9d/pigA47caEekGbub8fliw4sS4zlZdPnDgbPZEbUC57uInE0QlBv4kGmrj9YtC7/uA
         FGNA==
X-Gm-Message-State: AOJu0YzIjGcFBbyj2BPtaQajk3Vm459dPq5NEPbRDErAzUw4YzmVFI6v
	+QB0FpPPejBeSVaUL4XcVG+VMPjANBMwOcEYbXDAdcYlaUnM/PfiTmoiz0/bur4nOsAHFUS+myn
	ECfk48smq5B0SBUVz
X-Received: by 2002:a05:6a21:9983:b0:161:2df0:eadf with SMTP id ve3-20020a056a21998300b001612df0eadfmr1266843pzb.24.1695797520172;
        Tue, 26 Sep 2023 23:52:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:9983:b0:161:2df0:eadf with SMTP id ve3-20020a056a21998300b001612df0eadfmr1266828pzb.24.1695797519837;
        Tue, 26 Sep 2023 23:51:59 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id n1-20020a17090a160100b00277560ecd5dsm5617078pja.46.2023.09.26.23.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 23:51:59 -0700 (PDT)
Message-ID: <d58c51d2-53e4-3873-7c87-c6ccc3025ed9@redhat.com>
Date: Wed, 27 Sep 2023 16:51:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 05/37] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
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
 <20230926100436.28284-6-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-6-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 5VNTAaEynktR

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> KVM vCPU creation is done once during the initialization of the VM when Qemu
> threads are spawned. This is common to all the architectures. If the architecture
> supports vCPU hot-{un}plug then this KVM vCPU creation could be deferred to
> later point as well. Some architectures might in any case create KVM vCPUs for
> the yet-to-be plugged vCPUs (i.e. QoM Object & thread does not exists) during VM
> init time and park them.
> 
> Hot-unplug of vCPU results in destruction of the vCPU objects in QOM but
> the KVM vCPU objects in the Host KVM are not destroyed and their representative
> KVM vCPU objects in Qemu are parked.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   accel/kvm/kvm-all.c  | 61 ++++++++++++++++++++++++++++++++++----------
>   include/sysemu/kvm.h |  2 ++
>   2 files changed, 49 insertions(+), 14 deletions(-)
> 

The most important point seems missed in the commit log: The KVM vCPU objects,
including those hotpluggable objects, need to be in place before in-host GICv3
is initialized. So we need expose kvm_create_vcpu() to make those KVM vCPU
objects in place, even for those non-present vCPUs.

> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 7b3da8dc3a..86e9c9ea60 100644
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
> @@ -320,11 +321,51 @@ err:
>       return ret;
>   }
>   
> +void kvm_park_vcpu(CPUState *cpu)
> +{
> +    unsigned long vcpu_id = cpu->cpu_index;
> +    struct KVMParkedVcpu *vcpu;
> +
> +    vcpu = g_malloc0(sizeof(*vcpu));
> +    vcpu->vcpu_id = vcpu_id;

        vcpu->vcpu_id = cpu->cpu_index;

@vcpu_id can be dropped.

> +    vcpu->kvm_fd = cpu->kvm_fd;
> +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> +}
> +
> +int kvm_create_vcpu(CPUState *cpu)
> +{
> +    unsigned long vcpu_id = cpu->cpu_index;
> +    KVMState *s = kvm_state;
> +    int ret;
> +
> +    DPRINTF("kvm_create_vcpu\n");
> +
> +    /* check if the KVM vCPU already exist but is parked */
> +    ret = kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
> +    if (ret > 0) {
> +        goto found;
> +    }
> +
> +    /* create a new KVM vcpu */
> +    ret = kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +found:
> +    cpu->vcpu_dirty = true;
> +    cpu->kvm_fd = ret;
> +    cpu->kvm_state = s;
> +    cpu->dirty_pages = 0;
> +    cpu->throttle_us_per_full = 0;
> +
> +    return 0;
> +}
> +

The found tag can be dropped. @cpu can be initialized if vCPU fd is found
and then bail early.

        /* The KVM vCPU may have been existing */
        ret = kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
        if (ret > 0) {
            cpu->vcpu_dirty = true;
             :
             :
            return 0;
        }

        /* Create a new KVM vCPU */

>   static int do_kvm_destroy_vcpu(CPUState *cpu)
>   {
>       KVMState *s = kvm_state;
>       long mmap_size;
> -    struct KVMParkedVcpu *vcpu = NULL;
>       int ret = 0;
>   
>       DPRINTF("kvm_destroy_vcpu\n");
> @@ -353,10 +394,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
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
> @@ -384,7 +422,7 @@ static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
>           }
>       }
>   
> -    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
> +    return -1;
>   }
>   
>   int kvm_init_vcpu(CPUState *cpu, Error **errp)
> @@ -395,19 +433,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
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
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 115f0cca79..2c34889b01 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -473,6 +473,8 @@ void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
>   
>   int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
>                                          hwaddr *phys_addr);
> +int kvm_create_vcpu(CPUState *cpu);
> +void kvm_park_vcpu(CPUState *cpu);
>   
>   #endif /* NEED_CPU_H */
>   

Thanks,
Gavin
