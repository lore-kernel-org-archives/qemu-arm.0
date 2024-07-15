Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2249391nji;
        Mon, 15 Jul 2024 06:28:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlOty3BhE1lXESN0Da8U4PC00KIYR90o1+SSlxYgcH54Xh3pDTOnPTRS4mQveQiHUyyuWjBf/e/cfM/AK7WWE028+drKI6
X-Google-Smtp-Source: AGHT+IFIiZp1DCaXPvosCfT2YaVvn9/cYbqQvjDXLKDmXXh5DGCcsEG69NpcNGdLhuIJK0PJS0yF
X-Received: by 2002:a05:622a:20d:b0:447:f285:926a with SMTP id d75a77b69052e-447faab5c42mr244632701cf.62.1721050107594;
        Mon, 15 Jul 2024 06:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721050107; cv=none;
        d=google.com; s=arc-20160816;
        b=0NEq08Wvw8PH6Ao1O372DXhDdlMtuOVHAzuHhIC8E+5Hru9kFn2xOhVLEtF3hpMAeU
         ugaHrYFa2yFsXP80xkjYK2OTSZu8yGSpNOOS19sjdi/EpbN+UkLXm/X13Lv/zwo580XS
         rp5WDkKJGDDx0FljlLovW4Xhw7ot5oMlvRDOboDOrjOlgDcHorkV89FdBsCcVekx9iFz
         gjLUnpWO1/jrHpFWPpAKJiMIDtVgFLqKNhbBCgZUyV2Z4oCY/cV1yKggWcAiLbnu+ZQG
         ldp/5D1djBAjsOousD9D1usHhMyN/iRj1zBzjwPagJy15o7KUfXHgNFYspdNFMfYgmgo
         ssWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=eCgU0tXB1ZJY+zhiKRLC76QUBzDRP6VjnvnVPuwOXhY=;
        fh=7QrSlzTQ0WjQmeJB/0v2lqG9x0mBxpbTGTwbvuUh3es=;
        b=hoT+GTHZzWf+mwdzdgDTg78WsvFkTRtT+lv2nJpj2AYgQsMTBQQsdlGm9u6j0MusaU
         hbBYNJtwlSXxXMJZQkxy7DnVxyyfgMepUYEqt4ogKHhtOgXWaWIJqqXspSIWlufJeC49
         zoP5DeLjTAJr1tUdpbq4api9E8ZMEzPJAMv/y7oO5bzaofJmVp1hCKs6w/fEUHpc9Jzx
         DIOz+bqscwp+uM97bnWawVxUMOzGmnenKp4Vh+3HtAapTmIKZIWU0SR6c7zJwooZe6hu
         Fe5VcMaIgk8ZL5R9aKt4fS6oFfpmI9wIU64BKIIKPuae4cITx0HtVB7VpJ0jP0jU7nOU
         cE9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SdFY3tOT;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b80549dsi50784641cf.494.2024.07.15.06.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 06:28:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SdFY3tOT;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721050107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eCgU0tXB1ZJY+zhiKRLC76QUBzDRP6VjnvnVPuwOXhY=;
	b=SdFY3tOTKNp/0dwCe9twQUdmOSpFpxgut39iPxiqljEfnxC/fgL8e4FzQKEaEpBoBw7G3R
	oBoLrHKWa9aKZHt1kHlJfk37nTU88ens6EcdeIcyFRGFFIqDBKpmyCM58UxAqmn1gWivE1
	5Mf3h21+qT9/JDhvw72C4PyZcG26TE0=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-xc3ZFJwkM9KdNI2dC134iQ-1; Mon, 15 Jul 2024 09:28:25 -0400
X-MC-Unique: xc3ZFJwkM9KdNI2dC134iQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ee97349a5fso44400771fa.3
        for <alex.bennee@linaro.org>; Mon, 15 Jul 2024 06:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721050104; x=1721654904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCgU0tXB1ZJY+zhiKRLC76QUBzDRP6VjnvnVPuwOXhY=;
        b=Pj513I0/YBXoOejUn0BTizIkkDK4L3ssfvhppPZ0o62OUVIT68vYA/+LEz0oCtDNk7
         EB9tfHFOOIzPgYrCTgd8TPrXm0HcXd6lMM1P6tyDmJoDg49m5J8Z0yGiIvz6btSkHg+k
         QIPraLTTIiZLN9Ws6SSqzZLEvZ2D/zZj/Of9xb+FjrK4gaFyoxOZ41XUP1Z5l+D0/a4t
         v/ONCfVJ+PQgd2JYfD35Gml+zslKUNuxcgQL+l+KiRv/ERzsjo0OkyWM0ptlvj2rgl+W
         DtTybdG3MAAyQI8Y5vEU0seMxk21nZCyNfzPMfxXo7IeoPHo03Bmi0FSKlhr/U4VocaC
         OSng==
X-Forwarded-Encrypted: i=1; AJvYcCXbXYIYjkoIqfUE4nZFI7XMVb5lJLPJJhi07yztXPtouYioyBAXEoefx1qgIxS5izZtsQFpA+LBY0+7dxbXhsyMi7jtY20X
X-Gm-Message-State: AOJu0Yyfv2lRPsbtCekU7idhfmzUuhHvyQh/ZxuLgwuBjNDHt6O90Zh7
	Dp+atQVYLAamKhApW/ppwiiY7ZbiO4N4TbjQsslpNn9CvJOa5QiMNo16AN3wPtzbWGXeBaKvFYH
	nI5mJdVchM+QQS9N5/hHBTHI8v6t/g0n4wGJAPzKqtsHWL+X3iO9PYQ==
X-Received: by 2002:a05:6512:39c9:b0:52c:def6:7c97 with SMTP id 2adb3069b0e04-52eb99d4c4fmr13509230e87.45.1721050104002;
        Mon, 15 Jul 2024 06:28:24 -0700 (PDT)
X-Received: by 2002:a05:6512:39c9:b0:52c:def6:7c97 with SMTP id 2adb3069b0e04-52eb99d4c4fmr13509194e87.45.1721050103481;
        Mon, 15 Jul 2024 06:28:23 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f25babbsm120248535e9.20.2024.07.15.06.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 06:28:23 -0700 (PDT)
Date: Mon, 15 Jul 2024 15:28:21 +0200
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
 <lixianglai@loongson.cn>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
 <linuxarm@huawei.com>, Shaoqin Huang <shahuang@redhat.com>, Zhao Liu
 <zhao1.liu@intel.com>
Subject: Re: [PATCH V15 1/7] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Message-ID: <20240715152821.7b8153e3@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240715144925.20d1cd2c@imammedo.users.ipa.redhat.com>
References: <20240713182516.1457-1-salil.mehta@huawei.com>
	<20240713182516.1457-2-salil.mehta@huawei.com>
	<20240715144925.20d1cd2c@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: oonjlUCNV1pm

On Mon, 15 Jul 2024 14:49:25 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Sat, 13 Jul 2024 19:25:10 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
> 
> > KVM vCPU creation is done once during the vCPU realization when Qemu vCPU thread
> > is spawned. This is common to all the architectures as of now.
> > 
> > Hot-unplug of vCPU results in destruction of the vCPU object in QOM but the
> > corresponding KVM vCPU object in the Host KVM is not destroyed as KVM doesn't
> > support vCPU removal. Therefore, its representative KVM vCPU object/context in
> > Qemu is parked.
> > 
> > Refactor architecture common logic so that some APIs could be reused by vCPU
> > Hotplug code of some architectures likes ARM, Loongson etc. Update new/old APIs
> > with trace events. New APIs qemu_{create,park,unpark}_vcpu() can be externally
> > called. No functional change is intended here.
> > 
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Tested-by: Xianglai Li <lixianglai@loongson.cn>
> > Tested-by: Miguel Luis <miguel.luis@oracle.com>
> > Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> > Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> > Tested-by: Zhao Liu <zhao1.liu@intel.com>
> > Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> > Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>  
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

this needs fixing, to make checkpatch happy

Checking 0001-accel-kvm-Extract-common-KVM-vCPU-creation-parking-c.patch...
WARNING: line over 80 characters
#120: FILE: accel/kvm/kvm-all.c:368:
+    trace_kvm_unpark_vcpu(vcpu_id, kvm_fd > 0 ? "unparked" : "not found parked");

total: 0 errors, 1 warnings, 183 lines checked

> 
> > ---
> >  accel/kvm/kvm-all.c    | 95 ++++++++++++++++++++++++++++--------------
> >  accel/kvm/kvm-cpus.h   |  1 -
> >  accel/kvm/trace-events |  5 ++-
> >  include/sysemu/kvm.h   | 25 +++++++++++
> >  4 files changed, 92 insertions(+), 34 deletions(-)
> > 
> > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > index 2b4ab89679..e446d18944 100644
> > --- a/accel/kvm/kvm-all.c
> > +++ b/accel/kvm/kvm-all.c
> > @@ -340,14 +340,71 @@ err:
> >      return ret;
> >  }
> >  
> > +void kvm_park_vcpu(CPUState *cpu)
> > +{
> > +    struct KVMParkedVcpu *vcpu;
> > +
> > +    trace_kvm_park_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> > +
> > +    vcpu = g_malloc0(sizeof(*vcpu));
> > +    vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
> > +    vcpu->kvm_fd = cpu->kvm_fd;
> > +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> > +}
> > +
> > +int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id)
> > +{
> > +    struct KVMParkedVcpu *cpu;
> > +    int kvm_fd = -ENOENT;
> > +
> > +    QLIST_FOREACH(cpu, &s->kvm_parked_vcpus, node) {
> > +        if (cpu->vcpu_id == vcpu_id) {
> > +            QLIST_REMOVE(cpu, node);
> > +            kvm_fd = cpu->kvm_fd;
> > +            g_free(cpu);
> > +        }
> > +    }
> > +
> > +    trace_kvm_unpark_vcpu(vcpu_id, kvm_fd > 0 ? "unparked" : "not found parked");
> > +
> > +    return kvm_fd;
> > +}
> > +
> > +int kvm_create_vcpu(CPUState *cpu)
> > +{
> > +    unsigned long vcpu_id = kvm_arch_vcpu_id(cpu);
> > +    KVMState *s = kvm_state;
> > +    int kvm_fd;
> > +
> > +    /* check if the KVM vCPU already exist but is parked */
> > +    kvm_fd = kvm_unpark_vcpu(s, vcpu_id);
> > +    if (kvm_fd < 0) {
> > +        /* vCPU not parked: create a new KVM vCPU */
> > +        kvm_fd = kvm_vm_ioctl(s, KVM_CREATE_VCPU, vcpu_id);
> > +        if (kvm_fd < 0) {
> > +            error_report("KVM_CREATE_VCPU IOCTL failed for vCPU %lu", vcpu_id);
> > +            return kvm_fd;
> > +        }
> > +    }
> > +
> > +    cpu->kvm_fd = kvm_fd;
> > +    cpu->kvm_state = s;
> > +    cpu->vcpu_dirty = true;
> > +    cpu->dirty_pages = 0;
> > +    cpu->throttle_us_per_full = 0;
> > +
> > +    trace_kvm_create_vcpu(cpu->cpu_index, vcpu_id, kvm_fd);
> > +
> > +    return 0;
> > +}
> > +
> >  static int do_kvm_destroy_vcpu(CPUState *cpu)
> >  {
> >      KVMState *s = kvm_state;
> >      long mmap_size;
> > -    struct KVMParkedVcpu *vcpu = NULL;
> >      int ret = 0;
> >  
> > -    trace_kvm_destroy_vcpu();
> > +    trace_kvm_destroy_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> >  
> >      ret = kvm_arch_destroy_vcpu(cpu);
> >      if (ret < 0) {
> > @@ -373,10 +430,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
> >          }
> >      }
> >  
> > -    vcpu = g_malloc0(sizeof(*vcpu));
> > -    vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
> > -    vcpu->kvm_fd = cpu->kvm_fd;
> > -    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> > +    kvm_park_vcpu(cpu);
> >  err:
> >      return ret;
> >  }
> > @@ -389,24 +443,6 @@ void kvm_destroy_vcpu(CPUState *cpu)
> >      }
> >  }
> >  
> > -static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
> > -{
> > -    struct KVMParkedVcpu *cpu;
> > -
> > -    QLIST_FOREACH(cpu, &s->kvm_parked_vcpus, node) {
> > -        if (cpu->vcpu_id == vcpu_id) {
> > -            int kvm_fd;
> > -
> > -            QLIST_REMOVE(cpu, node);
> > -            kvm_fd = cpu->kvm_fd;
> > -            g_free(cpu);
> > -            return kvm_fd;
> > -        }
> > -    }
> > -
> > -    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
> > -}
> > -
> >  int kvm_init_vcpu(CPUState *cpu, Error **errp)
> >  {
> >      KVMState *s = kvm_state;
> > @@ -415,19 +451,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
> >  
> >      trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> >  
> > -    ret = kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
> > +    ret = kvm_create_vcpu(cpu);
> >      if (ret < 0) {
> > -        error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu failed (%lu)",
> > +        error_setg_errno(errp, -ret,
> > +                         "kvm_init_vcpu: kvm_create_vcpu failed (%lu)",
> >                           kvm_arch_vcpu_id(cpu));
> >          goto err;
> >      }
> >  
> > -    cpu->kvm_fd = ret;
> > -    cpu->kvm_state = s;
> > -    cpu->vcpu_dirty = true;
> > -    cpu->dirty_pages = 0;
> > -    cpu->throttle_us_per_full = 0;
> > -
> >      mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
> >      if (mmap_size < 0) {
> >          ret = mmap_size;
> > diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
> > index ca40add32c..171b22fd29 100644
> > --- a/accel/kvm/kvm-cpus.h
> > +++ b/accel/kvm/kvm-cpus.h
> > @@ -22,5 +22,4 @@ bool kvm_supports_guest_debug(void);
> >  int kvm_insert_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len);
> >  int kvm_remove_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len);
> >  void kvm_remove_all_breakpoints(CPUState *cpu);
> > -
> >  #endif /* KVM_CPUS_H */
> > diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
> > index 681ccb667d..37626c1ac5 100644
> > --- a/accel/kvm/trace-events
> > +++ b/accel/kvm/trace-events
> > @@ -9,6 +9,10 @@ kvm_device_ioctl(int fd, int type, void *arg) "dev fd %d, type 0x%x, arg %p"
> >  kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to retrieve ONEREG %" PRIu64 " from KVM: %s"
> >  kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to set ONEREG %" PRIu64 " to KVM: %s"
> >  kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
> > +kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id, int kvm_fd) "index: %d, id: %lu, kvm fd: %d"
> > +kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
> > +kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
> > +kvm_unpark_vcpu(unsigned long arch_cpu_id, const char *msg) "id: %lu %s"
> >  kvm_irqchip_commit_routes(void) ""
> >  kvm_irqchip_add_msi_route(char *name, int vector, int virq) "dev %s vector %d virq %d"
> >  kvm_irqchip_update_msi_route(int virq) "Updating MSI route virq=%d"
> > @@ -25,7 +29,6 @@ kvm_dirty_ring_reaper(const char *s) "%s"
> >  kvm_dirty_ring_reap(uint64_t count, int64_t t) "reaped %"PRIu64" pages (took %"PRIi64" us)"
> >  kvm_dirty_ring_reaper_kick(const char *reason) "%s"
> >  kvm_dirty_ring_flush(int finished) "%d"
> > -kvm_destroy_vcpu(void) ""
> >  kvm_failed_get_vcpu_mmap_size(void) ""
> >  kvm_cpu_exec(void) ""
> >  kvm_interrupt_exit_request(void) ""
> > diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> > index c31d9c7356..c4a914b3d8 100644
> > --- a/include/sysemu/kvm.h
> > +++ b/include/sysemu/kvm.h
> > @@ -313,6 +313,31 @@ int kvm_create_device(KVMState *s, uint64_t type, bool test);
> >   */
> >  bool kvm_device_supported(int vmfd, uint64_t type);
> >  
> > +/**
> > + * kvm_create_vcpu - Gets a parked KVM vCPU or creates a KVM vCPU
> > + * @cpu: QOM CPUState object for which KVM vCPU has to be fetched/created.
> > + *
> > + * @returns: 0 when success, errno (<0) when failed.
> > + */
> > +int kvm_create_vcpu(CPUState *cpu);
> > +
> > +/**
> > + * kvm_park_vcpu - Park QEMU KVM vCPU context
> > + * @cpu: QOM CPUState object for which QEMU KVM vCPU context has to be parked.
> > + *
> > + * @returns: none
> > + */
> > +void kvm_park_vcpu(CPUState *cpu);
> > +
> > +/**
> > + * kvm_unpark_vcpu - unpark QEMU KVM vCPU context
> > + * @s: KVM State
> > + * @vcpu_id: Architecture vCPU ID of the parked vCPU
> > + *
> > + * @returns: KVM fd
> > + */
> > +int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id);
> > +
> >  /* Arch specific hooks */
> >  
> >  extern const KVMCapabilityInfo kvm_arch_required_capabilities[];  
> 
