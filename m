Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1407322ejb;
        Mon, 2 Oct 2023 08:53:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaZtkyaGpC76vfbyRcsWADsyeAVxaZNb+PfUTM+lpwXkqubTAG5UidI5ZCTXBDvuDH2wc5
X-Received: by 2002:a05:6a00:3908:b0:68f:bd37:13df with SMTP id fh8-20020a056a00390800b0068fbd3713dfmr10094768pfb.16.1696262010206;
        Mon, 02 Oct 2023 08:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696262010; cv=none;
        d=google.com; s=arc-20160816;
        b=nGSn4FeaVoydQyOEvQ+zVXxDG0FbJEs9euTI5fGUx+bsX1VFAMUtBcqX7UthtGGjeV
         zgDtgvHwG/4mPYFJ/y7uN2ncLtdJFGJrWgZt2TgbHkK8MpqHU149+ltHLhvWvYV4WOa5
         suP3BTdE3YHBqsOHT0udxo7b80TlMHa6G64ktkegWnaAgldr5QMZOsASUbVUgofASB7t
         NI9c5TNmoV5xVoXXRvofENf24moVCnusd776yTxQcm+VJSowY32d789OXg4wD3WqLwm8
         1yGsW4LanBX1sO1jma8yycKSV0p0LHQ0DVecbxwdwS0Pbz+4jHaDczgrrN3IycrmSYvc
         kCYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=5yIVbc9gKg+4A+soxfCPsNLazGAcM884IWkG2ad3TWg=;
        fh=/EBauY3IXh4VobPm5b6w815uXOAKkGQo/xHlRV7Dr5E=;
        b=weTJ1bfrRHk6amHK1FtqGkHslNspy96dLTF9kkASh+1toIq0//9m+AYRSNEcqyiAOr
         CXrmCZdpKHZQXWaCRzI8dQvI4atIc1Dxv0gAEb4m1Gi1kPfzUiFAVuCTV35KoCsQGjgZ
         ZQqqpzRuVCzvdC2IUlezdo6iBR4f3yrjxryFIUigZtYdIb5BRNxHVL2babnxwhI5KWRX
         ByIltClNg7b7qdIFEOkjKVHLTP6QWJqGbePFXKdiC50TeuIKuaoC0Zx9lpEPLq0Lqv0K
         coaEHkzgigaQJKE0z++ZqtzcUwO+szQmW7CVCHp9LhhA/iNIjhXMWFH5lx2BDk9+phzJ
         PzGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id r12-20020aa7988c000000b006933e759416si12310073pfl.305.2023.10.02.08.53.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Oct 2023 08:53:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rzlm61kfJz6HJZM;
	Mon,  2 Oct 2023 23:50:46 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 2 Oct
 2023 16:53:23 +0100
Date: Mon, 2 Oct 2023 16:53:22 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Salil Mehta <salil.mehta@huawei.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
	<jean-philippe@linaro.org>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<linuxarm@huawei.com>
Subject: Re: [PATCH V2 01/10] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Message-ID: <20231002165322.00003a2e@Huawei.com>
In-Reply-To: <20230930001933.2660-2-salil.mehta@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-2-salil.mehta@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-TUID: bEHMIT2FZ1om

On Sat, 30 Sep 2023 01:19:24 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> KVM vCPU creation is done once during the initialization of the VM when Qemu
> threads are spawned. This is common to all the architectures.
> 
> Hot-unplug of vCPU results in destruction of the vCPU objects in QOM but
> the KVM vCPU objects in the Host KVM are not destroyed and their representative
> KVM vCPU objects/context in Qemu are parked.
> 
> Refactor common logic so that some APIs could be reused by vCPU Hotplug code.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>

Hi Salil,

A few trivial things inline, plus a question about why 
cpu->cpu_index can now be used but kvm_arch_vcpu_id(cpu);
was previously needed.

Thanks,

Jonathan

> ---
>  accel/kvm/kvm-all.c  | 63 +++++++++++++++++++++++++++++++++-----------
>  include/sysemu/kvm.h | 14 ++++++++++
>  2 files changed, 61 insertions(+), 16 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index ff1578bb32..b8c36ba50a 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -80,7 +80,7 @@
>  #endif
>  
>  struct KVMParkedVcpu {
> -    unsigned long vcpu_id;
> +    int vcpu_id;
>      int kvm_fd;
>      QLIST_ENTRY(KVMParkedVcpu) node;
>  };
> @@ -137,6 +137,7 @@ static QemuMutex kml_slots_lock;
>  #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
>  
>  static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
> +static int kvm_get_vcpu(KVMState *s, int vcpu_id);
>  
>  static inline void kvm_resample_fd_remove(int gsi)
>  {
> @@ -320,11 +321,49 @@ err:
>      return ret;
>  }
>  
> +void kvm_park_vcpu(CPUState *cpu)
> +{
> +    int vcpu_id = cpu->cpu_index;
> +    struct KVMParkedVcpu *vcpu;
> +
> +    vcpu = g_malloc0(sizeof(*vcpu));
> +    vcpu->vcpu_id = vcpu_id;

As vcpu_id is only used here why have the local variable?
Maybe that changes in later patches, in which case ignore this.

    vcpu->vcpu_id = cpu->cpu_index;

Why is kvm_arch_vcpu_id() not necessary here any more but was
before?

> +    vcpu->kvm_fd = cpu->kvm_fd;
> +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> +}
> +
> +int kvm_create_vcpu(CPUState *cpu)
> +{
> +    int vcpu_id = cpu->cpu_index;

See below. I'm not sure why it's safe not to use kvm_arch_vcpu_id()
Seems a few architectures have less than trivial implementations of
that function currently.


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

Trivial but I would have maintained the order wrt to the code removed
below just to avoid a reviewer having to check the two bits of code
do the same thing after the reorder.

> +
> +    return 0;
> +}
> +
>  static int do_kvm_destroy_vcpu(CPUState *cpu)
>  {
>      KVMState *s = kvm_state;
>      long mmap_size;
> -    struct KVMParkedVcpu *vcpu = NULL;
>      int ret = 0;
>  
>      DPRINTF("kvm_destroy_vcpu\n");
> @@ -353,10 +392,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
>          }
>      }
>  
> -    vcpu = g_malloc0(sizeof(*vcpu));
> -    vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
> -    vcpu->kvm_fd = cpu->kvm_fd;
> -    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> +    kvm_park_vcpu(cpu);
>  err:
>      return ret;
>  }
> @@ -369,7 +405,7 @@ void kvm_destroy_vcpu(CPUState *cpu)
>      }
>  }
>  
> -static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
> +static int kvm_get_vcpu(KVMState *s, int vcpu_id)
>  {
>      struct KVMParkedVcpu *cpu;
>  
> @@ -384,7 +420,7 @@ static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
>          }
>      }
>  
> -    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
> +    return -1;
>  }
>  
>  int kvm_init_vcpu(CPUState *cpu, Error **errp)
> @@ -395,19 +431,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
>  
>      trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>  
> -    ret = kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
> +    ret = kvm_create_vcpu(cpu);

The switch from kvm_arch_vcpu_id(cpu) to using 
int vcpu_id = cpu->cpu_index;

Seems like a functional change on some arch.
>      if (ret < 0) {
> -        error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu failed (%lu)",
> +        error_setg_errno(errp, -ret,
> +                         "kvm_init_vcpu: kvm_create_vcpu failed (%lu)",

The rewrap of the lines above seems like an unrelated change.

>                           kvm_arch_vcpu_id(cpu));
>          goto err;
>      }
>  
> -    cpu->kvm_fd = ret;
> -    cpu->kvm_state = s;
> -    cpu->vcpu_dirty = true;
> -    cpu->dirty_pages = 0;
> -    cpu->throttle_us_per_full = 0;
> -
>      mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
>      if (mmap_size < 0) {
>          ret = mmap_size;
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index ee9025f8e9..785f3ed083 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -464,6 +464,20 @@ void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
>  
>  int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
>                                         hwaddr *phys_addr);
> +/**
> + * kvm_create_vcpu - Gets a parked KVM vCPU or creates a KVM vCPU
> + * @cpu:  QOM CPUState object for which KVM vCPU has to be created/fetched.

Extra space before QOM (same below)

> + *
> + * @returns: 0 when success, errno (<0) when failed.
> + */
> +int kvm_create_vcpu(CPUState *cpu);

Blank line here perhaps.

> +/**
> + * kvm_park_vcpu - Gets a parked KVM vCPU if it exists
> + * @cpu:  QOM CPUState object for which parked KVM vCPU has to be fetched.

We aren't returning anything, so why fetch?

> + *
> + * @returns: kvm_fd (>0) when success, -1 when failed.
> + */
> +void kvm_park_vcpu(CPUState *cpu);
>  
>  #endif /* NEED_CPU_H */
>  
