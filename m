Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1315817ejj;
        Fri, 24 Nov 2023 08:02:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpsWcEkLyCZxUGbfyWbE2tOnLQcezjFVqyvPLMurC8h8LBgoRV34f1kqsloMu1XIgz0OCB
X-Received: by 2002:a05:6214:e89:b0:67a:1ef4:af81 with SMTP id hf9-20020a0562140e8900b0067a1ef4af81mr1564319qvb.17.1700841744229;
        Fri, 24 Nov 2023 08:02:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700841744; cv=none;
        d=google.com; s=arc-20160816;
        b=Tw6lpJkJRj1DtSjmlClDNqIear+/lcL8CxX7tFJh76ibgLuafNA1wVct3faSdu8GVa
         muVa+PpZInauzJmh1G5RBYG4mS7/Q4sPHGmOtGr3QDWXpR3GAZLpes6PTueQzgNyGHnc
         16guIkHmMBUYIJaKONCa5EZ/AS3Q2dOJH5ZJURLqi0LiqOQ8BmpdvKfPN/YN5wPG6fWh
         sLY4RNsfxOPEP2GBsPcVpRRi3b9gs9t2rgj9LXdt4RD9DRRc5ay3KAEOh/AkZLdmPofT
         hxoLhbTrFlpksZqVT2TZe8lBhPQv9yqfwjfeaa+2NgtmSw1bhFQz6m1IIssn23rPHijm
         a83w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=8P0KL1fEY9kxdqndJJeI7mDazu1N0fp4Dqr+BGe7acQ=;
        fh=yBg5jTax3bX/nm/oKv3FgmG4/dEof1Pt7099yXc4tJI=;
        b=Os7FWMkBGUx89DtYY29VF2oGuZPA5kmXikMnbmOM/ngl6akoJOB44eiMgDnE20+h13
         inF2b3k57iFcfSPz8R+rz2XKBAP0+/vOdELgTzU3mEGkhXSsu38/ekfhuVyeOQZEju1N
         IxiRYlrx0pRWjcJeX9y1Hsbo3bIEdNykYz4qkUL/pWeIVveXjO6lRAeD7YDIHhTnc7wT
         deEKinPdgIbw22uQ+SdZgHJNElueC0uAZ1TT6jdmUC/HxXCcBlvFzRP5dcOWCmmd4/rP
         QKRr3b75nuHkyM10BWzpEWM/1EQgTBsDmFoQS+mojepjy45hlbefTlk6hzEiocbF7zrs
         NRiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K8wcjnJ1;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id qj16-20020a05620a881000b0077d760d55fdsi3028708qkn.17.2023.11.24.08.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 08:02:24 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K8wcjnJ1;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700841743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8P0KL1fEY9kxdqndJJeI7mDazu1N0fp4Dqr+BGe7acQ=;
	b=K8wcjnJ1oOOZLsOyfnkoGTcIhhycAWI/bp4rvLIE6g674JTo8Wot3ApIdarnvqeEDg7CV3
	0FSbvXX5s/DecwhoIzeM4IusZurOc4XahRoRmd8KcTDJLZ/g8cxO0ZFKNp2py7occ7DdVa
	46KT9dfzX9dXeoJ+Zx3MklNBfPxIdug=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-hBOnztpANC-6HOKVLsz4sA-1; Fri, 24 Nov 2023 11:02:22 -0500
X-MC-Unique: hBOnztpANC-6HOKVLsz4sA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-548cf45e962so1452425a12.2
        for <alex.bennee@linaro.org>; Fri, 24 Nov 2023 08:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700841741; x=1701446541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8P0KL1fEY9kxdqndJJeI7mDazu1N0fp4Dqr+BGe7acQ=;
        b=MlvLDMArofp2t/3QEpouk3FhHeDjlSNxFnBaptlzrcaMdgV95qKX6rycM4RcPXl7kQ
         RndiFcVkTWWRVKr6i8J/vrVo8WHRPBYDkxxBQrYieGNFChTgSXYdn1UcQ2doLqfl1+kG
         bGV9tOOY3gI5i3sQFNNCf6aUvnb2Jijalssqtz7bgvJTwfVlTJsCeGavPprXO2k7pXMY
         hbKQ2XINBrMXVHIpTmXUp75dzng41mNv4PilVX8c1Q/dJWi7UDY7eIwdkVTj0ehrLUW3
         5iccQ9CTI3QshY1q8H4PjAZdBu5FnCKMYmwLT6PJEsa/rZZld6W1I1yshzVWJx+0iB8y
         0Cdw==
X-Gm-Message-State: AOJu0YyGXA+lU2UCnfh2ulmBbETRBuMgnl4S6CgKotDysrpLV/xgFT87
	FJWXHQh4Gm/t9LconVdlPQRNJWgrLttYhBjVYVKYKJlgSHWEYgKumXPbEVn4iTEQZMIUkuTCsb6
	G36bNi1J1gYsQqx2H
X-Received: by 2002:a05:6402:514a:b0:54b:a7b:8198 with SMTP id n10-20020a056402514a00b0054b0a7b8198mr832016edd.17.1700841741347;
        Fri, 24 Nov 2023 08:02:21 -0800 (PST)
X-Received: by 2002:a05:6402:514a:b0:54b:a7b:8198 with SMTP id n10-20020a056402514a00b0054b0a7b8198mr831955edd.17.1700841740604;
        Fri, 24 Nov 2023 08:02:20 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
        by smtp.gmail.com with ESMTPSA id v28-20020aa7cd5c000000b00548d649f638sm1929571edw.96.2023.11.24.08.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 08:02:20 -0800 (PST)
Date: Fri, 24 Nov 2023 17:02:17 +0100
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
Subject: Re: [PATCH V7 1/8] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Message-ID: <20231124170217.40165579@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231113201236.30668-2-salil.mehta@huawei.com>
References: <20231113201236.30668-1-salil.mehta@huawei.com>
	<20231113201236.30668-2-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: lHzMdInUuagW

On Mon, 13 Nov 2023 20:12:29 +0000
Salil Mehta <salil.mehta@huawei.com> wrote:

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

even though it will used by arm and loongarch later on with respective cpu hotplug  series,
it doesn't justify including refactoring without actual user.
(Put yourself in shoes of someone looking at git history and not finding a single user)

I'd suggest to include this patch in both (ARM & Loongson) CPU hotplug series,
this way, whichever is merged 1st will get this patch in without causing conflicts.

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
