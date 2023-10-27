Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp173486ejc;
        Fri, 27 Oct 2023 05:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiLdyEg83m4y2to7fiSxorBMXU+ehm7X9cfh1fuEkapztqGlcxesuJ9hSBxO7fFOn6fNKn
X-Received: by 2002:a05:620a:450e:b0:773:aa77:91d5 with SMTP id t14-20020a05620a450e00b00773aa7791d5mr5993048qkp.33.1698411419339;
        Fri, 27 Oct 2023 05:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698411419; cv=none;
        d=google.com; s=arc-20160816;
        b=ns/ksSuvNUMEVteN76rj6YqMlYdE8Ac2EBXlISfMD1tENqL6L9krdFwULUF30qVKWZ
         ubxYASQsYsULFqPBYypBBlewaIWMLr1SBngfnqw/a3xLEzTVUIV7Z4ZTNcnbROG15NjD
         DMn0RpAX6FLp8tiWkW71l6+qxk/CtzZfaYGpTuegSE3HszLouRJ0raew6jVmrIAPuj4+
         7zrRAoOx1trPATVHZsMPobQLon+xtQFWyZywS635stUKctUB6PM75YKrsGFGwoo6x6cf
         j69uQVM641R/K9htaqhOMFLma23JcWNYqVm1FM6YmqjunhNIjZx+nBAvEFgjLqf97m7M
         /5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=oJitzRlD+4efw2WkN5qAXdFYOyGL7volVXYBUrGuI/s=;
        fh=yBg5jTax3bX/nm/oKv3FgmG4/dEof1Pt7099yXc4tJI=;
        b=fqLzYTeObnHifzC20qKb/6XDRqLZo7Tm59ZSOaoWDGSzDCHbAYEqm1mkFId9j7XNfN
         sHB8wHg0xI4v1pyy4yNwJ4ZEvbj3DG1S9/IkQqG2p7elHgMJvadbPuFlhBBvWd8GvmJF
         7eNxNDLe8TfRu8jZTEdc3zKk9pQkhGEgRWeXFuJPkj0QJbPAOoas9uh71axqGjzhSolm
         F+0V2qRAOnk2spHj1LZHGQ5k1u/XfOTsnJws1au+FAwfQisTZZ0nbR88XPEv04gH8I9f
         97Nx/Q/sHIWb7nbloqhCyoDBqlvNQo1Oc7giEbM0V0hhA9HNIevOusXppIL5mmIgAwoj
         VqXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Be69PWIS;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id x2-20020ae9e642000000b007770bfd4044si642951qkl.459.2023.10.27.05.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 05:56:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Be69PWIS;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698411418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oJitzRlD+4efw2WkN5qAXdFYOyGL7volVXYBUrGuI/s=;
	b=Be69PWISP09C1OMzgHRdNNhlpUzsVWf3DKjeekzSRA2A4NtN4E8bj/pRdq+Ug2BQnqrzak
	huYSMFV+QHV1ElpU4WkhM58Y3eyGttYJoq6vyZ5ebqLcw0vgXrkRwnjOloZZ1xZnWP50PB
	9XlMkW3FiHFgQwg6MhB9xg5SrMIL1VU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-XMPrLKhSPIOajZhkJZWHLw-1; Fri, 27 Oct 2023 08:56:57 -0400
X-MC-Unique: XMPrLKhSPIOajZhkJZWHLw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9c15543088aso235411566b.1
        for <alex.bennee@linaro.org>; Fri, 27 Oct 2023 05:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698411416; x=1699016216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJitzRlD+4efw2WkN5qAXdFYOyGL7volVXYBUrGuI/s=;
        b=VNifZ00t6hFuosZwWd2gfAAQSOTH2i3ycF0QIApTNGzkv4ncFERjcT2M/hdKy8tvJG
         jVTriNy1W9CydxBP1D/NgPx/qJXHZ7xNlkU1gUZrY0GeUuIncC+2cX1cGSVhUatQPRVX
         9vZmBgPdTY4scr+Nj/4nRqXuT+zVSfG2Dzwg0i6MaEWvX8Fxi7Oxkmsk1waR5uVxsWhD
         vKB9x+PlyEu8Emh6/9XXOHAo5Yf48H/7SBD6yhSAoupPYGp085DxTVNY3VCbOPaKxAAf
         0xJOS1SKCREji1FY/9zrRrCnTCG6r7pr/xEqqHOgaYDOYuVqNFShusMaw7zXt/TB1fsA
         epZQ==
X-Gm-Message-State: AOJu0YxScjku9rmCgphyrvmh/yqqmU0vcOA7A+iAj4fALpHSEvUrBWZD
	tI2pVFNVtxvxt4WXpuTnQY9cHMa4wR3ezIdFklx7Hz+2EdOgu46++tiqjEtizXPNukD4a2WKhpC
	j4uoX9EbDHvIWc2nr
X-Received: by 2002:a17:907:7253:b0:9a9:f042:deb9 with SMTP id ds19-20020a170907725300b009a9f042deb9mr2785371ejc.19.1698411416565;
        Fri, 27 Oct 2023 05:56:56 -0700 (PDT)
X-Received: by 2002:a17:907:7253:b0:9a9:f042:deb9 with SMTP id ds19-20020a170907725300b009a9f042deb9mr2785327ejc.19.1698411416179;
        Fri, 27 Oct 2023 05:56:56 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id k13-20020a17090666cd00b009b65a834dd6sm1168699ejp.215.2023.10.27.05.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 05:56:55 -0700 (PDT)
Date: Fri, 27 Oct 2023 14:56:52 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
 <alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <linuxarm@huawei.com>
Subject: Re: [PATCH V6 1/9] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Message-ID: <20231027145652.44cc845c@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231013105129.25648-2-salil.mehta@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
	<20231013105129.25648-2-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: beNInolYdLW9

On Fri, 13 Oct 2023 11:51:21 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> KVM vCPU creation is done once during the initialization of the VM when Qemu
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> thread is spawned. This is common to all the architectures.

is it really true fox x86?

> 
> Hot-unplug of vCPU results in destruction of the vCPU object in QOM but the
> corresponding KVM vCPU object in the Host KVM is not destroyed and its
                                                                ^
since KVM doesn't support vCPU removal

> representative KVM vCPU object/context in Qemu is parked.
> 
> Refactor common logic so that some APIs could be reused by vCPU Hotplug code.
'reused' part doesn't happen within this series. So a reason
why patch exists is not clear/no one can deduce the reason
without the actual user here.

Suggest to move it to a series that actually will use this patch.


> Update new/old APIs with trace events instead of DTRACE.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> ---
>  accel/kvm/kvm-all.c    | 64 ++++++++++++++++++++++++++++++++----------
>  accel/kvm/trace-events |  4 +++
>  include/sysemu/kvm.h   | 16 +++++++++++
>  3 files changed, 69 insertions(+), 15 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 72e1d1141c..bfa7816aaa 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -137,6 +137,7 @@ static QemuMutex kml_slots_lock;
>  #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
>  
>  static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
> +static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id);
>  
>  static inline void kvm_resample_fd_remove(int gsi)
>  {
> @@ -320,14 +321,53 @@ err:
>      return ret;
>  }
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
>  static int do_kvm_destroy_vcpu(CPUState *cpu)
>  {
>      KVMState *s = kvm_state;
>      long mmap_size;
> -    struct KVMParkedVcpu *vcpu = NULL;
>      int ret = 0;
>  
> -    DPRINTF("kvm_destroy_vcpu\n");
> +    trace_kvm_destroy_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>  
>      ret = kvm_arch_destroy_vcpu(cpu);
>      if (ret < 0) {
> @@ -353,10 +393,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
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
> @@ -377,6 +414,8 @@ static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
>          if (cpu->vcpu_id == vcpu_id) {
>              int kvm_fd;
>  
> +            trace_kvm_get_vcpu(vcpu_id);
> +
>              QLIST_REMOVE(cpu, node);
>              kvm_fd = cpu->kvm_fd;
>              g_free(cpu);
> @@ -384,7 +423,7 @@ static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
>          }
>      }
>  
> -    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
> +    return -ENOENT;
>  }
>  
>  int kvm_init_vcpu(CPUState *cpu, Error **errp)
> @@ -395,19 +434,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
>  
>      trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>  
> -    ret = kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
> +    ret = kvm_create_vcpu(cpu);
>      if (ret < 0) {
> -        error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu failed (%lu)",
> +        error_setg_errno(errp, -ret,
> +                         "kvm_init_vcpu: kvm_create_vcpu failed (%lu)",
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
> diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
> index 399aaeb0ec..cdd0c95c09 100644
> --- a/accel/kvm/trace-events
> +++ b/accel/kvm/trace-events
> @@ -9,6 +9,10 @@ kvm_device_ioctl(int fd, int type, void *arg) "dev fd %d, type 0x%x, arg %p"
>  kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to retrieve ONEREG %" PRIu64 " from KVM: %s"
>  kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to set ONEREG %" PRIu64 " to KVM: %s"
>  kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
> +kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
> +kvm_get_vcpu(unsigned long arch_cpu_id) "id: %lu"
> +kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
> +kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
>  kvm_irqchip_commit_routes(void) ""
>  kvm_irqchip_add_msi_route(char *name, int vector, int virq) "dev %s vector %d virq %d"
>  kvm_irqchip_update_msi_route(int virq) "Updating MSI route virq=%d"
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index ee9025f8e9..8137e6a44c 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -465,6 +465,22 @@ void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
>  int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
>                                         hwaddr *phys_addr);
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
>  #endif /* NEED_CPU_H */
>  
>  void kvm_cpu_synchronize_state(CPUState *cpu);
