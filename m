Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1624480ejb;
        Mon, 2 Oct 2023 16:18:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6fXkCfBTc5mvo12moetFvHtNbCSkaW4M9+tc0P6sS9zWDlCkxrjqggmPyeWIQXiEXa7Tq
X-Received: by 2002:a0c:aa99:0:b0:651:9fa8:9fd9 with SMTP id f25-20020a0caa99000000b006519fa89fd9mr11289112qvb.51.1696288683038;
        Mon, 02 Oct 2023 16:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696288683; cv=none;
        d=google.com; s=arc-20160816;
        b=pSSzuCQjl0y89w8L+SL/jTeglqQlgWksJqWJx12IzEiTAj3ODrA6Axg8n6RTFqKd36
         BJ95bIA48KVbKNlkrtWDuzcLGHRg+G+SxJI7J7u7hCEwYbEWlKtBXgObjCNakdHe1G22
         O4YBP40xGEvdC3+o2WqTLd+7dMJ+vAU52IXLq4A62EqUPF2T4xGf8IQygRKV0o64vOLg
         S8ooyEdPzo5L6V8x72r7U9GloEKrF451bqfi/MAoHilpTqrhFw9M373OiW1xzYD6bK+h
         sJW6C64abMvuxxvqM0rPnRSJuu/Kqv34ePJbjI4o7EpEvtTUqy2qkKqLUUtorQB76OTt
         Um7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5NZ2x4L8jtCIGTeilWA3veW3agmb+Wl4Ve9U54jEwrg=;
        fh=UoUFvcIH1Llqwj9lcubayb9wLqiblQuJi8py3jS56vc=;
        b=pj1bC+I0kCFDdhIYL1AMUZ0YVICeTMEWu1/6jeyp0VcX0pMQzfG51xkbYhEwPqjpJv
         cadN/pu4aLmvan0Fcj1JfaLJyqoO4WRMZcdMapoJU6IegDxh8o3eFIDoohbhLoPd33hI
         EYOotwk5r6A0/Zw1MPeIwTt79cKXXt67qadUm8ewifdu1kEeVQ7h5udSAspPLPnPcgwc
         bfndC35gidGle29ATyN1L68pfYrO6Bk0Icp2SpUcBpya0Wx0nFJh56Ki56GtRYzogNOZ
         ei7dPNOFeCfsmLJXs3GcTB3T8uwGXnFrB7x+YwbEd+7iTsvXU2OCnScKU5ydhA1XeJxU
         z7Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MqABtpE+;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id p20-20020a0ce194000000b0065b1365cf66si7311222qvl.383.2023.10.02.16.18.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 16:18:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MqABtpE+;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696288682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5NZ2x4L8jtCIGTeilWA3veW3agmb+Wl4Ve9U54jEwrg=;
	b=MqABtpE+1vDSB+/t48L7dzPlqxW2k1oGDKn9lLUZmJ2ReB0K4Nqa//3y+Sgm489QFfUzrT
	wKDulEFDiIIpD1jTGKi8GxR2X/ZLCpOJg1fkInXYO0FW8kBFbSreuqIKonsDWsHfm5+B6R
	UZTN04TJxC8OiQvKZQCHBsuTf4l9M2U=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-y4MSoxqHOq6UEQe6l12RTw-1; Mon, 02 Oct 2023 19:17:56 -0400
X-MC-Unique: y4MSoxqHOq6UEQe6l12RTw-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1c73637061eso2686955ad.3
        for <alex.bennee@linaro.org>; Mon, 02 Oct 2023 16:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696288675; x=1696893475;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5NZ2x4L8jtCIGTeilWA3veW3agmb+Wl4Ve9U54jEwrg=;
        b=vh/37lxv8zDOna/7hxtWXLMoJMwN5rXD3W/uFtP5TsucZFwUWmjJz+NpMFzclOYre9
         NzybRQ6zO+HITJvmQFMBTWj9C1wJ60qtimm52ozfa7hTbRFPWlgUe+uFtp2ew2w9YsrF
         l9SQcsU6YfgqECRmGK6nSvkY5mvS8RON3eBuAquTwU+h2hN/ybLlf0wuEyI+akEW5vVR
         bG4rxgmdXK58iXEWl5/5LK12l6ceKdUuEQR59fwxytFF9/nZJYJ1AZn7yumjE2Uk8Uzj
         4kt+A9w8l4uQGj2YjRhYCg9tK+o3oGD/cjR0lXFFZjVTwgahoZelLHyi07WZetqcOwpR
         elCQ==
X-Gm-Message-State: AOJu0Yzf83jVxxELW8ibA59cl2pw0UuJmGcMhsqhq1UFv4K6pUefg+HK
	PsQPKbdBT6CiiqXzR/wmdxqerZ+R7vJRZcyCtgnm9W7RCzAlyz5KvH9gyW1hCAk0q0fet4+2eni
	agciVbx67jytcO/x2
X-Received: by 2002:a17:902:eec6:b0:1c6:d34:5279 with SMTP id h6-20020a170902eec600b001c60d345279mr11470448plb.13.1696288675159;
        Mon, 02 Oct 2023 16:17:55 -0700 (PDT)
X-Received: by 2002:a17:902:eec6:b0:1c6:d34:5279 with SMTP id h6-20020a170902eec600b001c60d345279mr11470421plb.13.1696288674782;
        Mon, 02 Oct 2023 16:17:54 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902eb0500b001c619fbd5fbsm15971197plb.298.2023.10.02.16.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 16:17:54 -0700 (PDT)
Message-ID: <a8861b68-5e04-5127-5c0f-77816401741b@redhat.com>
Date: Tue, 3 Oct 2023 09:17:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 01/10] accel/kvm: Extract common KVM vCPU
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
References: <20230930001933.2660-1-salil.mehta@huawei.com>
 <20230930001933.2660-2-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230930001933.2660-2-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ISfe+8b8BI7Z

On 9/30/23 10:19, Salil Mehta wrote:
> KVM vCPU creation is done once during the initialization of the VM when Qemu
> threads are spawned. This is common to all the architectures.
   ^^^^^^^^^^^^^^^^^^^
   thread is spawned.

> 
> Hot-unplug of vCPU results in destruction of the vCPU objects in QOM but
> the KVM vCPU objects in the Host KVM are not destroyed and their representative
> KVM vCPU objects/context in Qemu are parked.
> 
> Refactor common logic so that some APIs could be reused by vCPU Hotplug code.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   accel/kvm/kvm-all.c  | 63 +++++++++++++++++++++++++++++++++-----------
>   include/sysemu/kvm.h | 14 ++++++++++
>   2 files changed, 61 insertions(+), 16 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index ff1578bb32..b8c36ba50a 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -80,7 +80,7 @@
>   #endif
>   
>   struct KVMParkedVcpu {
> -    unsigned long vcpu_id;
> +    int vcpu_id;

@vcpu_id represents the vCPU index (CPUState::cpu_index) instead of the
architectural CPU ID any more. However, I don't understand how it works
for x86, and more comments regarding it can be seen below.

>       int kvm_fd;
>       QLIST_ENTRY(KVMParkedVcpu) node;
>   };
> @@ -137,6 +137,7 @@ static QemuMutex kml_slots_lock;
>   #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
>   
>   static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
> +static int kvm_get_vcpu(KVMState *s, int vcpu_id);
>   
>   static inline void kvm_resample_fd_remove(int gsi)
>   {
> @@ -320,11 +321,49 @@ err:
>       return ret;
>   }
>   
> +void kvm_park_vcpu(CPUState *cpu)
> +{
> +    int vcpu_id = cpu->cpu_index;
> +    struct KVMParkedVcpu *vcpu;
> +
> +    vcpu = g_malloc0(sizeof(*vcpu));
> +    vcpu->vcpu_id = vcpu_id;
> +    vcpu->kvm_fd = cpu->kvm_fd;
> +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> +}
> +

@vcpu_id can be dropped as suggested previously.

        vcpu->vcpu_id = cpu->cpu_index;

> +int kvm_create_vcpu(CPUState *cpu)
> +{
> +    int vcpu_id = cpu->cpu_index;
> +    KVMState *s = kvm_state;
> +    int kvm_fd;
> +
> +    DPRINTF("kvm_create_vcpu\n");
> +
> +    /* check if the KVM vCPU already exist but is parked */
> +    kvm_fd = kvm_get_vcpu(s, vcpu_id);
> +    if (kvm_fd < 0) {
> +        /* vCPU not parked: create a new KVM vCPU */
> +        kvm_fd = kvm_vm_ioctl(s, KVM_CREATE_VCPU, vcpu_id);
> +        if (kvm_fd < 0) {
> +            error_report("KVM_CREATE_VCPU IOCTL failed for vCPU %d", vcpu_id);
> +            return kvm_fd;
> +        }
> +    }
> +
> +    cpu->vcpu_dirty = true;
> +    cpu->kvm_fd = kvm_fd;
> +    cpu->kvm_state = s;
> +    cpu->dirty_pages = 0;
> +    cpu->throttle_us_per_full = 0;
> +
> +    return 0;
> +}
> +

The comments here can be dropped since the code is self-explaining.

@vcpu_id represents vCPU index, instead of the architecrual vCPU ID any more.
@vcpu_id is passed to host through ioctl(KVM_CREATE_VCPU), which is expected
as an architecrual vCPU ID instead of a vCPU index by host. It's indicated
by 'struct kvm_vcpu' as below.

struct kvm_vcpu {
	:
	int vcpu_id;  /* id given by userspace at creation */
         int vcpu_idx; /* index into kvm->vcpu_array */
};

Function kvm_arch_vcpu_id() converts the vCPU instance or vCPU index to
the architecrual vCPU ID. All architectures except x86 simply returns
vCPU index (CPUState::cpu_index) as the architecrural vCPU ID. x86 returns
the APIC ID. Treating them equally seems to break x86.

>   static int do_kvm_destroy_vcpu(CPUState *cpu)
>   {
>       KVMState *s = kvm_state;
>       long mmap_size;
> -    struct KVMParkedVcpu *vcpu = NULL;
>       int ret = 0;
>   
>       DPRINTF("kvm_destroy_vcpu\n");
> @@ -353,10 +392,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
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
> @@ -369,7 +405,7 @@ void kvm_destroy_vcpu(CPUState *cpu)
>       }
>   }
>   
> -static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
> +static int kvm_get_vcpu(KVMState *s, int vcpu_id)
>   {
>       struct KVMParkedVcpu *cpu;
>   
> @@ -384,7 +420,7 @@ static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
>           }
>       }
>   
> -    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
> +    return -1;
>   }
>   

Why we have -1 here. -ENOENT seems more descriptive?

>   int kvm_init_vcpu(CPUState *cpu, Error **errp)
> @@ -395,19 +431,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
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
> index ee9025f8e9..785f3ed083 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -464,6 +464,20 @@ void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
>   
>   int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
>                                          hwaddr *phys_addr);
> +/**
> + * kvm_create_vcpu - Gets a parked KVM vCPU or creates a KVM vCPU
> + * @cpu:  QOM CPUState object for which KVM vCPU has to be created/fetched.
> + *
> + * @returns: 0 when success, errno (<0) when failed.
> + */
> +int kvm_create_vcpu(CPUState *cpu);
> +/**
> + * kvm_park_vcpu - Gets a parked KVM vCPU if it exists
> + * @cpu:  QOM CPUState object for which parked KVM vCPU has to be fetched.
> + *
> + * @returns: kvm_fd (>0) when success, -1 when failed.
> + */
> +void kvm_park_vcpu(CPUState *cpu);
>   
>   #endif /* NEED_CPU_H */
>   

Thanks,
Gavin
