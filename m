Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1820464njb;
        Sat, 6 Jul 2024 08:43:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9QwBDXeszc8+Ov0coLcCGF7mK67S/4GOjfZ01I1mLWMh0jF2Er0WAdyilwTDtbmYWyWVCPWtta7MaKkNFLvWFLPwT0CEQ
X-Received: by 2002:a17:906:a2d5:b0:a77:cd3c:e9b4 with SMTP id a640c23a62f3a-a77cd3ceaaamr303579866b.24.1720280593898;
        Sat, 06 Jul 2024 08:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720280593; cv=none;
        d=google.com; s=arc-20160816;
        b=xXLqzEQh13ESYNs40BfL0uTn8gTDqB36wF1qa8vemCm7poOdOGz+XVTZljj7SOWtnz
         TVeLXm/wLCBOquyMa5hQSvwvy9qKXxTVDwSULA5G0fqRGbEtkfb1+gattqFFIcidpSX/
         dV8kSF4t0yN0Mw/GwRbSGbSBXJx18UTtOlUHP4t7J8YF4z/UZW9RGXQE1VQAfkRTIRay
         PSedzTVCj86BzS54IIs9DRfJCSxcb4b/QxH+WeuapI0uSjC+D/32Ni571T+mS762KG5x
         8VGJ2AScRSfck/q/ZDgGaStukCboNOLEszH+IXhtJkEToErERWNdNYn5xZdYqmYsrM8+
         QhSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JINafJZPZuQK6y1lT1i/J985oAJPOEoYkiROHI9bShg=;
        fh=wc0HbLhGECFZE8VkM8p6qNA0G+kGuObGOp9fx/GdpD8=;
        b=RHhFnbaV7rPUOM/y1ODux6GebiJ74lKhOjcJdpccGrIw3ZJblxzP2YMyA5Ncp4NDXY
         jNSRQ8gQMCOnXQkwadiQNBk9GutxKc+Q+Ee+gOGxbu7krsKUgrm11cCw3WiEDloNGvJ7
         pIATAvnB6WK+CvoYQtQrCrb5fwRjh3pAF9zdxZp0y4+w7qlLov0RK3M3v0eIl504Px1X
         pqmuTCSpoTCbmio4aCjmAwcX6InOcI3oOzjjJmiTHSVQp/bWiH6EGrKEAST+NNnpRZD9
         38bpBhiaPnFh6zPJsM8Qw57z+Q0Ewfweye5yGzChSUqj09vBPJLT7CGMzbKWG7dRavcz
         oABQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=cXLbUSri;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a77ddedb8a9sor50481466b.17.2024.07.06.08.43.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 06 Jul 2024 08:43:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=cXLbUSri;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1720280593; x=1720885393; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JINafJZPZuQK6y1lT1i/J985oAJPOEoYkiROHI9bShg=;
        b=cXLbUSris7naHSCD/jeqcv1nf5cikAkvyBZFjyTqoM78gwGnhp1hoFczFRYNYYgltX
         j8tj4mJTv3WlXZ+X7qqIL9PHjkWLy6LsFyTnG/yR4ojwZF+7yqAD5aS7EnM83lA4vgLY
         gZoT/L5UxRWFYqEujWL2txksdw5UHuaUvTWcsZTOUfdUjJJPYdyVvHooYOjPtJ47nk9R
         vp6mXzB11sJxKr4fCK+mdcjn9lSzLv8FjOKMVXThGUmHinKklfGCp6CvBUS3XYiL7VYW
         r1gD10DNq/jfFvqtCRcSO3h1quTeu1vx0EGIURblvDnZD/r5sMs/4pZz0I1RKhlBjMDh
         5VRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720280593; x=1720885393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JINafJZPZuQK6y1lT1i/J985oAJPOEoYkiROHI9bShg=;
        b=bXYzWQ2X/6T1aX4NP6a8Tmw/seHEyXF0JVvO7RAWx3pCfKCfL0IZggNxQdaGRSEt4M
         lsilcgGVHBOAYVERgage12QchE6eBdkzZeRkeHHEPFiHy8MHGnsJTZJwgK/RIVMr+NsY
         P5NNXpXH3yzmc5DNCX7qyR6Tm1c1w3DX6fAHxRDDsd4x3fEtD5+ytVdjpxTaHfqhvtZP
         F8HiKJU2yDvAhUHzOgOevYyS9kogOximJEJJZUd3FprRWbm4TDrrnMunUdI9brAmNLpU
         WSgz6fv0li+wSWOjdbf3B0hvQ05QDC/pwDmCQus04uLBvViCv/EIfju6P6gzOiEHR6s1
         0RZg==
X-Forwarded-Encrypted: i=1; AJvYcCUE0oQKbHEJu1c55FZaYbB0rjmS4/z4tQLrzbtoVJAhCQev+ZpLhur5vIAxRUwuvmKnuA2BOK6mxd0DwlEa9kW1WdO7Ri2G
X-Gm-Message-State: AOJu0YwMvv8FYcOFEh4TwNJVFhod/Xdngk8X9DU9UWLs5EBZEbf9fFP3
	P9uC9NsvLIkmyCpl0yy9HB2OyogWGXuUZT6bcgWje+nPa1IcAZLl+C7bnk5KhSPeYDENEH9YF/P
	dNrufsld+TsFRx0gS5dhnP4XT2MfpbCaf2JFPoA==
X-Google-Smtp-Source: AGHT+IFjmvmVRPl8QjTu1s9LkoU9l4qbtigRjw6ocZW9Gvtzmklcm8uzu3kAfTt5VQ9Yayfi99iBiiLhdVioO46a57c=
X-Received: by 2002:a17:906:4751:b0:a6f:4fc8:2665 with SMTP id
 a640c23a62f3a-a77ba70a724mr469586066b.50.1720280593099; Sat, 06 Jul 2024
 08:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240607115649.214622-1-salil.mehta@huawei.com>
 <20240607115649.214622-2-salil.mehta@huawei.com> <20240706151154.7c430b0a@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240706151154.7c430b0a@imammedo.users.ipa.redhat.com>
From: Salil Mehta <salil.mehta@opnsrc.net>
Date: Sat, 6 Jul 2024 15:43:01 +0000
Message-ID: <CAJ7pxeZV6qmDR8aXE5LaDZdjvGCJhnE4RZeL4823XqaiDApe1Q@mail.gmail.com>
Subject: Re: [PATCH V13 1/8] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
To: Igor Mammedov <imammedo@redhat.com>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com, 
	lpieralisi@kernel.org, peter.maydell@linaro.org, richard.henderson@linaro.org, 
	andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org, 
	eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com, 
	mst@redhat.com, will@kernel.org, gshan@redhat.com, rafael@kernel.org, 
	alex.bennee@linaro.org, linux@armlinux.org.uk, darren@os.amperecomputing.com, 
	ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com, 
	karl.heubaum@oracle.com, miguel.luis@oracle.com, zhukeqian1@huawei.com, 
	wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com, 
	maobibo@loongson.cn, lixianglai@loongson.cn, npiggin@gmail.com, 
	harshpb@linux.ibm.com, linuxarm@huawei.com, 
	Shaoqin Huang <shahuang@redhat.com>, Zhao Liu <zhao1.liu@intel.com>
Content-Type: multipart/alternative; boundary="000000000000aa8788061c960930"
X-TUID: uXBtAJcO3FCd

--000000000000aa8788061c960930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Igor,
Thanks for taking out time to review.

On Sat, Jul 6, 2024 at 1:12=E2=80=AFPM Igor Mammedov <imammedo@redhat.com> =
wrote:

> On Fri, 7 Jun 2024 12:56:42 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>
> > KVM vCPU creation is done once during the vCPU realization when Qemu
> vCPU thread
> > is spawned. This is common to all the architectures as of now.
> >
> > Hot-unplug of vCPU results in destruction of the vCPU object in QOM but
> the
> > corresponding KVM vCPU object in the Host KVM is not destroyed as KVM
> doesn't
> > support vCPU removal. Therefore, its representative KVM vCPU
> object/context in
> > Qemu is parked.
> >
> > Refactor architecture common logic so that some APIs could be reused by
> vCPU
> > Hotplug code of some architectures likes ARM, Loongson etc. Update
> new/old APIs
> > with trace events. No functional change is intended here.
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
> > ---
> >  accel/kvm/kvm-all.c    | 95 ++++++++++++++++++++++++++++--------------
> >  accel/kvm/kvm-cpus.h   |  1 -
> >  accel/kvm/trace-events |  5 ++-
> >  include/sysemu/kvm.h   | 25 +++++++++++
> >  4 files changed, 92 insertions(+), 34 deletions(-)
> >
> > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > index c0be9f5eed..8f9128bb92 100644
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
> > +    vcpu =3D g_malloc0(sizeof(*vcpu));
> > +    vcpu->vcpu_id =3D kvm_arch_vcpu_id(cpu);
> > +    vcpu->kvm_fd =3D cpu->kvm_fd;
> > +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> > +}
> > +
> > +int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id)
> > +{
> > +    struct KVMParkedVcpu *cpu;
> > +    int kvm_fd =3D -ENOENT;
> > +
> > +    QLIST_FOREACH(cpu, &s->kvm_parked_vcpus, node) {
> > +        if (cpu->vcpu_id =3D=3D vcpu_id) {
> > +            QLIST_REMOVE(cpu, node);
> > +            kvm_fd =3D cpu->kvm_fd;
> > +            g_free(cpu);
> > +        }
> > +    }
> > +
> > +    trace_kvm_unpark_vcpu(vcpu_id, kvm_fd > 0 ? "unparked" : "not foun=
d
> parked");
> > +
> > +    return kvm_fd;
> > +}
> > +
> > +int kvm_create_vcpu(CPUState *cpu)
> > +{
> > +    unsigned long vcpu_id =3D kvm_arch_vcpu_id(cpu);
> > +    KVMState *s =3D kvm_state;
> > +    int kvm_fd;
> > +
> > +    /* check if the KVM vCPU already exist but is parked */
> > +    kvm_fd =3D kvm_unpark_vcpu(s, vcpu_id);
> > +    if (kvm_fd < 0) {
> > +        /* vCPU not parked: create a new KVM vCPU */
> > +        kvm_fd =3D kvm_vm_ioctl(s, KVM_CREATE_VCPU, vcpu_id);
> > +        if (kvm_fd < 0) {
> > +            error_report("KVM_CREATE_VCPU IOCTL failed for vCPU %lu",
> vcpu_id);
> > +            return kvm_fd;
> > +        }
> > +    }
> > +
> > +    cpu->kvm_fd =3D kvm_fd;
> > +    cpu->kvm_state =3D s;
> > +    cpu->vcpu_dirty =3D true;
> > +    cpu->dirty_pages =3D 0;
> > +    cpu->throttle_us_per_full =3D 0;
> > +
> > +    trace_kvm_create_vcpu(cpu->cpu_index, vcpu_id, kvm_fd);
> > +
> > +    return 0;
> > +}
>
> Is there any reason why you are embedding/hiding kvm_state in new API
> instead of passing it as argument (all callers have it defined, so why no=
t
> reuse that)?
>

It is a global variable and I don't think it is a usual practice to specify
the global variable
as an input parameter.



>
> otherwise patch lgtm


May I request your Reviewed-by for this patch?

Thanks
Salil.


>
>
> > +
> >  static int do_kvm_destroy_vcpu(CPUState *cpu)
> >  {
> >      KVMState *s =3D kvm_state;
> >      long mmap_size;
> > -    struct KVMParkedVcpu *vcpu =3D NULL;
> >      int ret =3D 0;
> >
> > -    trace_kvm_destroy_vcpu();
> > +    trace_kvm_destroy_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> >
> >      ret =3D kvm_arch_destroy_vcpu(cpu);
> >      if (ret < 0) {
> > @@ -373,10 +430,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
> >          }
> >      }
> >
> > -    vcpu =3D g_malloc0(sizeof(*vcpu));
> > -    vcpu->vcpu_id =3D kvm_arch_vcpu_id(cpu);
> > -    vcpu->kvm_fd =3D cpu->kvm_fd;
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
> > -        if (cpu->vcpu_id =3D=3D vcpu_id) {
> > -            int kvm_fd;
> > -
> > -            QLIST_REMOVE(cpu, node);
> > -            kvm_fd =3D cpu->kvm_fd;
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
> >      KVMState *s =3D kvm_state;
> > @@ -415,19 +451,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
> >
> >      trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> >
> > -    ret =3D kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
> > +    ret =3D kvm_create_vcpu(cpu);
> >      if (ret < 0) {
> > -        error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu
> failed (%lu)",
> > +        error_setg_errno(errp, -ret,
> > +                         "kvm_init_vcpu: kvm_create_vcpu failed (%lu)"=
,
> >                           kvm_arch_vcpu_id(cpu));
> >          goto err;
> >      }
> >
> > -    cpu->kvm_fd =3D ret;
> > -    cpu->kvm_state =3D s;
> > -    cpu->vcpu_dirty =3D true;
> > -    cpu->dirty_pages =3D 0;
> > -    cpu->throttle_us_per_full =3D 0;
> > -
> >      mmap_size =3D kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
> >      if (mmap_size < 0) {
> >          ret =3D mmap_size;
> > diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
> > index ca40add32c..171b22fd29 100644
> > --- a/accel/kvm/kvm-cpus.h
> > +++ b/accel/kvm/kvm-cpus.h
> > @@ -22,5 +22,4 @@ bool kvm_supports_guest_debug(void);
> >  int kvm_insert_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr
> len);
> >  int kvm_remove_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr
> len);
> >  void kvm_remove_all_breakpoints(CPUState *cpu);
> > -
> >  #endif /* KVM_CPUS_H */
> > diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
> > index 681ccb667d..37626c1ac5 100644
> > --- a/accel/kvm/trace-events
> > +++ b/accel/kvm/trace-events
> > @@ -9,6 +9,10 @@ kvm_device_ioctl(int fd, int type, void *arg) "dev fd
> %d, type 0x%x, arg %p"
> >  kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to
> retrieve ONEREG %" PRIu64 " from KVM: %s"
> >  kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to
> set ONEREG %" PRIu64 " to KVM: %s"
> >  kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id:
> %lu"
> > +kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id, int kvm_fd)
> "index: %d, id: %lu, kvm fd: %d"
> > +kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d
> id: %lu"
> > +kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id:
> %lu"
> > +kvm_unpark_vcpu(unsigned long arch_cpu_id, const char *msg) "id: %lu %=
s"
> >  kvm_irqchip_commit_routes(void) ""
> >  kvm_irqchip_add_msi_route(char *name, int vector, int virq) "dev %s
> vector %d virq %d"
> >  kvm_irqchip_update_msi_route(int virq) "Updating MSI route virq=3D%d"
> > @@ -25,7 +29,6 @@ kvm_dirty_ring_reaper(const char *s) "%s"
> >  kvm_dirty_ring_reap(uint64_t count, int64_t t) "reaped %"PRIu64" pages
> (took %"PRIi64" us)"
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
> > @@ -313,6 +313,31 @@ int kvm_create_device(KVMState *s, uint64_t type,
> bool test);
> >   */
> >  bool kvm_device_supported(int vmfd, uint64_t type);
> >
> > +/**
> > + * kvm_create_vcpu - Gets a parked KVM vCPU or creates a KVM vCPU
> > + * @cpu: QOM CPUState object for which KVM vCPU has to be
> fetched/created.
> > + *
> > + * @returns: 0 when success, errno (<0) when failed.
> > + */
> > +int kvm_create_vcpu(CPUState *cpu);
> > +
> > +/**
> > + * kvm_park_vcpu - Park QEMU KVM vCPU context
> > + * @cpu: QOM CPUState object for which QEMU KVM vCPU context has to be
> parked.
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
>

--000000000000aa8788061c960930
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Igor,<div>Thanks for taking out time t=
o review.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Jul 6, 2024 at 1:12=E2=80=AFPM Igor Mammedov &lt;<a=
 href=3D"mailto:imammedo@redhat.com">imammedo@redhat.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 7 Jun 2024 =
12:56:42 +0100<br>
Salil Mehta &lt;<a href=3D"mailto:salil.mehta@huawei.com" target=3D"_blank"=
>salil.mehta@huawei.com</a>&gt; wrote:<br>
<br>
&gt; KVM vCPU creation is done once during the vCPU realization when Qemu v=
CPU thread<br>
&gt; is spawned. This is common to all the architectures as of now.<br>
&gt; <br>
&gt; Hot-unplug of vCPU results in destruction of the vCPU object in QOM bu=
t the<br>
&gt; corresponding KVM vCPU object in the Host KVM is not destroyed as KVM =
doesn&#39;t<br>
&gt; support vCPU removal. Therefore, its representative KVM vCPU object/co=
ntext in<br>
&gt; Qemu is parked.<br>
&gt; <br>
&gt; Refactor architecture common logic so that some APIs could be reused b=
y vCPU<br>
&gt; Hotplug code of some architectures likes ARM, Loongson etc. Update new=
/old APIs<br>
&gt; with trace events. No functional change is intended here.<br>
&gt; <br>
&gt; Signed-off-by: Salil Mehta &lt;<a href=3D"mailto:salil.mehta@huawei.co=
m" target=3D"_blank">salil.mehta@huawei.com</a>&gt;<br>
&gt; Reviewed-by: Gavin Shan &lt;<a href=3D"mailto:gshan@redhat.com" target=
=3D"_blank">gshan@redhat.com</a>&gt;<br>
&gt; Tested-by: Vishnu Pajjuri &lt;<a href=3D"mailto:vishnu@os.amperecomput=
ing.com" target=3D"_blank">vishnu@os.amperecomputing.com</a>&gt;<br>
&gt; Reviewed-by: Jonathan Cameron &lt;<a href=3D"mailto:Jonathan.Cameron@h=
uawei.com" target=3D"_blank">Jonathan.Cameron@huawei.com</a>&gt;<br>
&gt; Tested-by: Xianglai Li &lt;<a href=3D"mailto:lixianglai@loongson.cn" t=
arget=3D"_blank">lixianglai@loongson.cn</a>&gt;<br>
&gt; Tested-by: Miguel Luis &lt;<a href=3D"mailto:miguel.luis@oracle.com" t=
arget=3D"_blank">miguel.luis@oracle.com</a>&gt;<br>
&gt; Reviewed-by: Shaoqin Huang &lt;<a href=3D"mailto:shahuang@redhat.com" =
target=3D"_blank">shahuang@redhat.com</a>&gt;<br>
&gt; Reviewed-by: Vishnu Pajjuri &lt;<a href=3D"mailto:vishnu@os.amperecomp=
uting.com" target=3D"_blank">vishnu@os.amperecomputing.com</a>&gt;<br>
&gt; Reviewed-by: Nicholas Piggin &lt;<a href=3D"mailto:npiggin@gmail.com" =
target=3D"_blank">npiggin@gmail.com</a>&gt;<br>
&gt; Tested-by: Zhao Liu &lt;<a href=3D"mailto:zhao1.liu@intel.com" target=
=3D"_blank">zhao1.liu@intel.com</a>&gt;<br>
&gt; Reviewed-by: Zhao Liu &lt;<a href=3D"mailto:zhao1.liu@intel.com" targe=
t=3D"_blank">zhao1.liu@intel.com</a>&gt;<br>
&gt; Reviewed-by: Harsh Prateek Bora &lt;<a href=3D"mailto:harshpb@linux.ib=
m.com" target=3D"_blank">harshpb@linux.ibm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 accel/kvm/kvm-all.c=C2=A0 =C2=A0 | 95 ++++++++++++++++++++++++++=
++--------------<br>
&gt;=C2=A0 accel/kvm/kvm-cpus.h=C2=A0 =C2=A0|=C2=A0 1 -<br>
&gt;=C2=A0 accel/kvm/trace-events |=C2=A0 5 ++-<br>
&gt;=C2=A0 include/sysemu/kvm.h=C2=A0 =C2=A0| 25 +++++++++++<br>
&gt;=C2=A0 4 files changed, 92 insertions(+), 34 deletions(-)<br>
&gt; <br>
&gt; diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c<br>
&gt; index c0be9f5eed..8f9128bb92 100644<br>
&gt; --- a/accel/kvm/kvm-all.c<br>
&gt; +++ b/accel/kvm/kvm-all.c<br>
&gt; @@ -340,14 +340,71 @@ err:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +void kvm_park_vcpu(CPUState *cpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 struct KVMParkedVcpu *vcpu;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 trace_kvm_park_vcpu(cpu-&gt;cpu_index, kvm_arch_vcpu_id=
(cpu));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 vcpu =3D g_malloc0(sizeof(*vcpu));<br>
&gt; +=C2=A0 =C2=A0 vcpu-&gt;vcpu_id =3D kvm_arch_vcpu_id(cpu);<br>
&gt; +=C2=A0 =C2=A0 vcpu-&gt;kvm_fd =3D cpu-&gt;kvm_fd;<br>
&gt; +=C2=A0 =C2=A0 QLIST_INSERT_HEAD(&amp;kvm_state-&gt;kvm_parked_vcpus, =
vcpu, node);<br>
&gt; +}<br>
&gt; +<br>
&gt; +int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 struct KVMParkedVcpu *cpu;<br>
&gt; +=C2=A0 =C2=A0 int kvm_fd =3D -ENOENT;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 QLIST_FOREACH(cpu, &amp;s-&gt;kvm_parked_vcpus, node) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;vcpu_id =3D=3D vcpu_id) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QLIST_REMOVE(cpu, node);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kvm_fd =3D cpu-&gt;kvm_fd;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(cpu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 trace_kvm_unpark_vcpu(vcpu_id, kvm_fd &gt; 0 ? &quot;un=
parked&quot; : &quot;not found parked&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return kvm_fd;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int kvm_create_vcpu(CPUState *cpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 unsigned long vcpu_id =3D kvm_arch_vcpu_id(cpu);<br>
&gt; +=C2=A0 =C2=A0 KVMState *s =3D kvm_state;<br>
&gt; +=C2=A0 =C2=A0 int kvm_fd;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* check if the KVM vCPU already exist but is parked */=
<br>
&gt; +=C2=A0 =C2=A0 kvm_fd =3D kvm_unpark_vcpu(s, vcpu_id);<br>
&gt; +=C2=A0 =C2=A0 if (kvm_fd &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* vCPU not parked: create a new KVM vCPU=
 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kvm_fd =3D kvm_vm_ioctl(s, KVM_CREATE_VCP=
U, vcpu_id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (kvm_fd &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;KVM_CREA=
TE_VCPU IOCTL failed for vCPU %lu&quot;, vcpu_id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return kvm_fd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;kvm_fd =3D kvm_fd;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;kvm_state =3D s;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;vcpu_dirty =3D true;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;dirty_pages =3D 0;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;throttle_us_per_full =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 trace_kvm_create_vcpu(cpu-&gt;cpu_index, vcpu_id, kvm_f=
d);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
<br>
Is there any reason why you are embedding/hiding kvm_state in new API<br>
instead of passing it as argument (all callers have it defined, so why not =
reuse that)?<br></blockquote><div><br></div><div>It is a global variable an=
d I don&#39;t think it is a usual=C2=A0practice to specify the global varia=
ble</div><div>as an input parameter.</div><div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
otherwise patch lgtm</blockquote><div><br></div><div>May I request your Rev=
iewed-by for this patch?</div><div><br></div><div>Thanks</div><div>Salil.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"> <br=
>
<br>
&gt; +<br>
&gt;=C2=A0 static int do_kvm_destroy_vcpu(CPUState *cpu)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KVMState *s =3D kvm_state;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 long mmap_size;<br>
&gt; -=C2=A0 =C2=A0 struct KVMParkedVcpu *vcpu =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 trace_kvm_destroy_vcpu();<br>
&gt; +=C2=A0 =C2=A0 trace_kvm_destroy_vcpu(cpu-&gt;cpu_index, kvm_arch_vcpu=
_id(cpu));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D kvm_arch_destroy_vcpu(cpu);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; @@ -373,10 +430,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 vcpu =3D g_malloc0(sizeof(*vcpu));<br>
&gt; -=C2=A0 =C2=A0 vcpu-&gt;vcpu_id =3D kvm_arch_vcpu_id(cpu);<br>
&gt; -=C2=A0 =C2=A0 vcpu-&gt;kvm_fd =3D cpu-&gt;kvm_fd;<br>
&gt; -=C2=A0 =C2=A0 QLIST_INSERT_HEAD(&amp;kvm_state-&gt;kvm_parked_vcpus, =
vcpu, node);<br>
&gt; +=C2=A0 =C2=A0 kvm_park_vcpu(cpu);<br>
&gt;=C2=A0 err:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;=C2=A0 }<br>
&gt; @@ -389,24 +443,6 @@ void kvm_destroy_vcpu(CPUState *cpu)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 struct KVMParkedVcpu *cpu;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 QLIST_FOREACH(cpu, &amp;s-&gt;kvm_parked_vcpus, node) {=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;vcpu_id =3D=3D vcpu_id) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int kvm_fd;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QLIST_REMOVE(cpu, node);<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kvm_fd =3D cpu-&gt;kvm_fd;<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(cpu);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return kvm_fd;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id=
);<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 int kvm_init_vcpu(CPUState *cpu, Error **errp)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KVMState *s =3D kvm_state;<br>
&gt; @@ -415,19 +451,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)<b=
r>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 trace_kvm_init_vcpu(cpu-&gt;cpu_index, kvm_arch_vc=
pu_id(cpu));<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 ret =3D kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));<br>
&gt; +=C2=A0 =C2=A0 ret =3D kvm_create_vcpu(cpu);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, -ret, &quot;kvm_in=
it_vcpu: kvm_get_vcpu failed (%lu)&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, -ret,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&quot;kvm_init_vcpu: kvm_create_vcpu failed (%lu)&quot=
;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0kvm_arch_vcpu_id(cpu));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 cpu-&gt;kvm_fd =3D ret;<br>
&gt; -=C2=A0 =C2=A0 cpu-&gt;kvm_state =3D s;<br>
&gt; -=C2=A0 =C2=A0 cpu-&gt;vcpu_dirty =3D true;<br>
&gt; -=C2=A0 =C2=A0 cpu-&gt;dirty_pages =3D 0;<br>
&gt; -=C2=A0 =C2=A0 cpu-&gt;throttle_us_per_full =3D 0;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mmap_size =3D kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE,=
 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (mmap_size &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mmap_size;<br>
&gt; diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h<br>
&gt; index ca40add32c..171b22fd29 100644<br>
&gt; --- a/accel/kvm/kvm-cpus.h<br>
&gt; +++ b/accel/kvm/kvm-cpus.h<br>
&gt; @@ -22,5 +22,4 @@ bool kvm_supports_guest_debug(void);<br>
&gt;=C2=A0 int kvm_insert_breakpoint(CPUState *cpu, int type, vaddr addr, v=
addr len);<br>
&gt;=C2=A0 int kvm_remove_breakpoint(CPUState *cpu, int type, vaddr addr, v=
addr len);<br>
&gt;=C2=A0 void kvm_remove_all_breakpoints(CPUState *cpu);<br>
&gt; -<br>
&gt;=C2=A0 #endif /* KVM_CPUS_H */<br>
&gt; diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events<br>
&gt; index 681ccb667d..37626c1ac5 100644<br>
&gt; --- a/accel/kvm/trace-events<br>
&gt; +++ b/accel/kvm/trace-events<br>
&gt; @@ -9,6 +9,10 @@ kvm_device_ioctl(int fd, int type, void *arg) &quot;d=
ev fd %d, type 0x%x, arg %p&quot;<br>
&gt;=C2=A0 kvm_failed_reg_get(uint64_t id, const char *msg) &quot;Warning: =
Unable to retrieve ONEREG %&quot; PRIu64 &quot; from KVM: %s&quot;<br>
&gt;=C2=A0 kvm_failed_reg_set(uint64_t id, const char *msg) &quot;Warning: =
Unable to set ONEREG %&quot; PRIu64 &quot; to KVM: %s&quot;<br>
&gt;=C2=A0 kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) &quot;in=
dex: %d id: %lu&quot;<br>
&gt; +kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id, int kvm_fd)=
 &quot;index: %d, id: %lu, kvm fd: %d&quot;<br>
&gt; +kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) &quot;inde=
x: %d id: %lu&quot;<br>
&gt; +kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) &quot;index: =
%d id: %lu&quot;<br>
&gt; +kvm_unpark_vcpu(unsigned long arch_cpu_id, const char *msg) &quot;id:=
 %lu %s&quot;<br>
&gt;=C2=A0 kvm_irqchip_commit_routes(void) &quot;&quot;<br>
&gt;=C2=A0 kvm_irqchip_add_msi_route(char *name, int vector, int virq) &quo=
t;dev %s vector %d virq %d&quot;<br>
&gt;=C2=A0 kvm_irqchip_update_msi_route(int virq) &quot;Updating MSI route =
virq=3D%d&quot;<br>
&gt; @@ -25,7 +29,6 @@ kvm_dirty_ring_reaper(const char *s) &quot;%s&quot;<=
br>
&gt;=C2=A0 kvm_dirty_ring_reap(uint64_t count, int64_t t) &quot;reaped %&qu=
ot;PRIu64&quot; pages (took %&quot;PRIi64&quot; us)&quot;<br>
&gt;=C2=A0 kvm_dirty_ring_reaper_kick(const char *reason) &quot;%s&quot;<br=
>
&gt;=C2=A0 kvm_dirty_ring_flush(int finished) &quot;%d&quot;<br>
&gt; -kvm_destroy_vcpu(void) &quot;&quot;<br>
&gt;=C2=A0 kvm_failed_get_vcpu_mmap_size(void) &quot;&quot;<br>
&gt;=C2=A0 kvm_cpu_exec(void) &quot;&quot;<br>
&gt;=C2=A0 kvm_interrupt_exit_request(void) &quot;&quot;<br>
&gt; diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h<br>
&gt; index c31d9c7356..c4a914b3d8 100644<br>
&gt; --- a/include/sysemu/kvm.h<br>
&gt; +++ b/include/sysemu/kvm.h<br>
&gt; @@ -313,6 +313,31 @@ int kvm_create_device(KVMState *s, uint64_t type,=
 bool test);<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 bool kvm_device_supported(int vmfd, uint64_t type);<br>
&gt;=C2=A0 <br>
&gt; +/**<br>
&gt; + * kvm_create_vcpu - Gets a parked KVM vCPU or creates a KVM vCPU<br>
&gt; + * @cpu: QOM CPUState object for which KVM vCPU has to be fetched/cre=
ated.<br>
&gt; + *<br>
&gt; + * @returns: 0 when success, errno (&lt;0) when failed.<br>
&gt; + */<br>
&gt; +int kvm_create_vcpu(CPUState *cpu);<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * kvm_park_vcpu - Park QEMU KVM vCPU context<br>
&gt; + * @cpu: QOM CPUState object for which QEMU KVM vCPU context has to b=
e parked.<br>
&gt; + *<br>
&gt; + * @returns: none<br>
&gt; + */<br>
&gt; +void kvm_park_vcpu(CPUState *cpu);<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * kvm_unpark_vcpu - unpark QEMU KVM vCPU context<br>
&gt; + * @s: KVM State<br>
&gt; + * @vcpu_id: Architecture vCPU ID of the parked vCPU<br>
&gt; + *<br>
&gt; + * @returns: KVM fd<br>
&gt; + */<br>
&gt; +int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id);<br>
&gt; +<br>
&gt;=C2=A0 /* Arch specific hooks */<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 extern const KVMCapabilityInfo kvm_arch_required_capabilities[];=
<br>
<br>
</blockquote></div></div>

--000000000000aa8788061c960930--
