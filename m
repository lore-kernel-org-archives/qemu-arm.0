Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2693388njb;
        Mon, 8 Jul 2024 06:32:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoFbQeV6ta0JLeOYgZxtozn/f4QZDGoKhTQ10mifUbovP+8Hsq2rtgB8KP9tFT/cQINi897iPeg8wJB/IbEp75fYZwlZwQ
X-Google-Smtp-Source: AGHT+IFtLFCEc9W9JJ7YSCkiWIGjKDOQ8l3vbq1mEAU3gtiZ28FtRjJE3eq3hJhlfBV1mFgK+QVw
X-Received: by 2002:a05:6214:3008:b0:6b5:e2fc:d5c6 with SMTP id 6a1803df08f44-6b5ed26e744mr128640816d6.61.1720445543067;
        Mon, 08 Jul 2024 06:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720445543; cv=none;
        d=google.com; s=arc-20160816;
        b=TpmgJWj/emoOf4QnYmOraKdUtGRIXgPtUY9ZMlBllONUBHkbJBNuvP6I5W4PJ0A6lE
         YrRuOz34mGJamyTz9f4xRYFZZShAh8gIb1SkO78SGgvp7oYeXxZEvWEB0a/DTijEjXSS
         AVL0M9pjY2XN5SYSo77zerscg1uB9ofI8Cu273/pu7jqdcK4lINSQ7CHO2E4XEywxmPm
         1VYTyW0FWJcySe0OisW1joTNXx1p4/NNbM7pey570QhGQd9nIqyAp13eSPHUjKbaBw++
         8LlsyGjvnlqXzrrndh3LMwXWhhOjyTdAx07mAq85pGSjC6Xj2i4bArpuxCQnE0ZyhOfY
         9sFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=fhAg3uF3MEBCaTzpNMxRNbWhsWTFoBeV4BpCb4JyJ9k=;
        fh=jstOZAQPhRYwNQyEtjp7O2iqd6WQ3vT7L3MHW67hYxU=;
        b=AUgmE+pBZMmOPZumSCrn0kBpZx5SCZVlXPKzfEJgwo0tETuw8eRPd52+YnYmLjxGEe
         GFS39IXqBYgw5ssR2inAyIDErhsofSsPGtu6Ab0+2YDOyKoeuDZfta/GR+LMeRq4gXCI
         60aad7UWZI0Ro2dz6cWm+xP+niKQgItr1Nw7Xc/1lVLDjhNVUb30vQBICgu429e2vO0T
         XPuRK5A8Vtlrol/KoPwcTAusPiO0/ZE+UPiNueQOFyjs7N+etLm397uLJ42XL5sBYH8B
         8nW/ShbnW9DiGujlRBedDMe6zf3B93tasVBFCGik/Uv5PWObv1dTCxQ1qwF7N6RU8hMo
         lJiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B9gCmWqL;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b5fc279368si66804886d6.594.2024.07.08.06.32.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:32:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B9gCmWqL;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720445542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fhAg3uF3MEBCaTzpNMxRNbWhsWTFoBeV4BpCb4JyJ9k=;
	b=B9gCmWqL4F6tcaDbAmEF2t/dAcHvFBY4G+t/ywZvot1SvCYAU3tj2eNicM4rtTXCcG6nur
	fojCeE6xiJa3dOnwsm1tkKuNjKQzOTngd2TzCvUlZqTeXSmKnER69tf6T0bw8cF2sHCWQj
	J/xL9BFe0MwxK4mpskcjqsp8eIo7apA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-av1EOsRjMyuzKBW1_-7UOg-1; Mon, 08 Jul 2024 09:32:21 -0400
X-MC-Unique: av1EOsRjMyuzKBW1_-7UOg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a77f5dd71a4so100110066b.2
        for <alex.bennee@linaro.org>; Mon, 08 Jul 2024 06:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720445539; x=1721050339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCgiakP/tarYnUD/h9zQxEYyvbavQe5Ott9VDqgWp+o=;
        b=EoXfZNBYUMEdpUKEGCyhhYfBnKkOOZVRxdGN6xwB5GeRE4leBBfsKn53HNtuHbvKwv
         gJIf3WqFWuNK8xb9CZsVhH1oqgBO00HYbauelLoXKYUuypKUHqCjPrp112vid48osq/t
         38fJSTVgfBLS4TF+1bjZsV7NyHW5tVJnIv2kU/0yQasxqw/SGLcaXjix5QDvDhlExXfE
         tJ01ghEnWVV6B7o8vCKMkz0pwv8vTtEdFmJ02o12TVMvhWGPi3z82vzwUeQtJZ2dXZK4
         oK27P3CL39FaUqcIjR7KYOROMpAc4qIHLd98JcIavg5E+yuATc49OJM4ijQ8HxHASVjh
         ouFA==
X-Forwarded-Encrypted: i=1; AJvYcCVIgtLZz9zeMpD6ZWrCO+doGWDUoXB5HC9u0k/159ssxhCeTFUVHTYrG9o6/Bg+lLjVd8br2Yy4P5+RFi06mVBz21NqcGwM
X-Gm-Message-State: AOJu0YzeQokQ/hOzEWqvF79taBlvIomSMlo+PvQq67Df6yZwU5aSaWAG
	lsrMBD4rrojatHMngA9Y8JXiIE1FJIPOYsD/gjGZEKUnv4xh3C/ZX40TkJa7LWGj3L1RdhmIFos
	lk6Q3qZDS4KTQUEBZu+N/z/GGtB0mpcZN3K5gx7dbn3GjivxiQ8xPpQ==
X-Received: by 2002:a05:6402:3506:b0:58d:d3f6:58d2 with SMTP id 4fb4d7f45d1cf-58e59265d8cmr8164201a12.3.1720445539403;
        Mon, 08 Jul 2024 06:32:19 -0700 (PDT)
X-Received: by 2002:a05:6402:3506:b0:58d:d3f6:58d2 with SMTP id 4fb4d7f45d1cf-58e59265d8cmr8164170a12.3.1720445538888;
        Mon, 08 Jul 2024 06:32:18 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5903c7ac61csm3496577a12.4.2024.07.08.06.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:32:18 -0700 (PDT)
Date: Mon, 8 Jul 2024 15:32:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@opnsrc.net>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, maz@kernel.org, jean-philippe@linaro.org,
 jonathan.cameron@huawei.com, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
 eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
 linuxarm@huawei.com, Shaoqin Huang <shahuang@redhat.com>, Zhao Liu
 <zhao1.liu@intel.com>
Subject: Re: [PATCH V13 1/8] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Message-ID: <20240708153216.0d6d1ad1@imammedo.users.ipa.redhat.com>
In-Reply-To: <CAJ7pxeZV6qmDR8aXE5LaDZdjvGCJhnE4RZeL4823XqaiDApe1Q@mail.gmail.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
	<20240607115649.214622-2-salil.mehta@huawei.com>
	<20240706151154.7c430b0a@imammedo.users.ipa.redhat.com>
	<CAJ7pxeZV6qmDR8aXE5LaDZdjvGCJhnE4RZeL4823XqaiDApe1Q@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: efO2zWjgei4j

On Sat, 6 Jul 2024 15:43:01 +0000
Salil Mehta <salil.mehta@opnsrc.net> wrote:

> Hi Igor,
> Thanks for taking out time to review.
>=20
> On Sat, Jul 6, 2024 at 1:12=E2=80=AFPM Igor Mammedov <imammedo@redhat.com=
> wrote:
>=20
> > On Fri, 7 Jun 2024 12:56:42 +0100
> > Salil Mehta <salil.mehta@huawei.com> wrote:
> > =20
> > > KVM vCPU creation is done once during the vCPU realization when Qemu =
=20
> > vCPU thread =20
> > > is spawned. This is common to all the architectures as of now.
> > >
> > > Hot-unplug of vCPU results in destruction of the vCPU object in QOM b=
ut =20
> > the =20
> > > corresponding KVM vCPU object in the Host KVM is not destroyed as KVM=
 =20
> > doesn't =20
> > > support vCPU removal. Therefore, its representative KVM vCPU =20
> > object/context in =20
> > > Qemu is parked.
> > >
> > > Refactor architecture common logic so that some APIs could be reused =
by =20
> > vCPU =20
> > > Hotplug code of some architectures likes ARM, Loongson etc. Update =
=20
> > new/old APIs =20
> > > with trace events. No functional change is intended here.
> > >
> > > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > Tested-by: Xianglai Li <lixianglai@loongson.cn>
> > > Tested-by: Miguel Luis <miguel.luis@oracle.com>
> > > Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> > > Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > > Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> > > Tested-by: Zhao Liu <zhao1.liu@intel.com>
> > > Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> > > Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
> > > ---
> > >  accel/kvm/kvm-all.c    | 95 ++++++++++++++++++++++++++++------------=
--
> > >  accel/kvm/kvm-cpus.h   |  1 -
> > >  accel/kvm/trace-events |  5 ++-
> > >  include/sysemu/kvm.h   | 25 +++++++++++
> > >  4 files changed, 92 insertions(+), 34 deletions(-)
> > >
> > > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > > index c0be9f5eed..8f9128bb92 100644
> > > --- a/accel/kvm/kvm-all.c
> > > +++ b/accel/kvm/kvm-all.c
> > > @@ -340,14 +340,71 @@ err:
> > >      return ret;
> > >  }
> > >
> > > +void kvm_park_vcpu(CPUState *cpu)
> > > +{
> > > +    struct KVMParkedVcpu *vcpu;
> > > +
> > > +    trace_kvm_park_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> > > +
> > > +    vcpu =3D g_malloc0(sizeof(*vcpu));
> > > +    vcpu->vcpu_id =3D kvm_arch_vcpu_id(cpu);
> > > +    vcpu->kvm_fd =3D cpu->kvm_fd;
> > > +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> > > +}
> > > +
> > > +int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id)
> > > +{
> > > +    struct KVMParkedVcpu *cpu;
> > > +    int kvm_fd =3D -ENOENT;
> > > +
> > > +    QLIST_FOREACH(cpu, &s->kvm_parked_vcpus, node) {
> > > +        if (cpu->vcpu_id =3D=3D vcpu_id) {
> > > +            QLIST_REMOVE(cpu, node);
> > > +            kvm_fd =3D cpu->kvm_fd;
> > > +            g_free(cpu);
> > > +        }
> > > +    }
> > > +
> > > +    trace_kvm_unpark_vcpu(vcpu_id, kvm_fd > 0 ? "unparked" : "not fo=
und =20
> > parked"); =20
> > > +
> > > +    return kvm_fd;
> > > +}
> > > +
> > > +int kvm_create_vcpu(CPUState *cpu)
> > > +{
> > > +    unsigned long vcpu_id =3D kvm_arch_vcpu_id(cpu);
> > > +    KVMState *s =3D kvm_state;
> > > +    int kvm_fd;
> > > +
> > > +    /* check if the KVM vCPU already exist but is parked */
> > > +    kvm_fd =3D kvm_unpark_vcpu(s, vcpu_id);
> > > +    if (kvm_fd < 0) {
> > > +        /* vCPU not parked: create a new KVM vCPU */
> > > +        kvm_fd =3D kvm_vm_ioctl(s, KVM_CREATE_VCPU, vcpu_id);
> > > +        if (kvm_fd < 0) {
> > > +            error_report("KVM_CREATE_VCPU IOCTL failed for vCPU %lu"=
, =20
> > vcpu_id); =20
> > > +            return kvm_fd;
> > > +        }
> > > +    }
> > > +
> > > +    cpu->kvm_fd =3D kvm_fd;
> > > +    cpu->kvm_state =3D s;
> > > +    cpu->vcpu_dirty =3D true;
> > > +    cpu->dirty_pages =3D 0;
> > > +    cpu->throttle_us_per_full =3D 0;
> > > +
> > > +    trace_kvm_create_vcpu(cpu->cpu_index, vcpu_id, kvm_fd);
> > > +
> > > +    return 0;
> > > +} =20
> >
> > Is there any reason why you are embedding/hiding kvm_state in new API
> > instead of passing it as argument (all callers have it defined, so why =
not
> > reuse that)?
> > =20
>=20
> It is a global variable and I don't think it is a usual practice to speci=
fy
> the global variable
> as an input parameter.

Ideally, global would be accessed once at API boundary entry
and the passed as an argument to functions it calls.
It makes it easier to follow as opposed to mixed access we have now,
which is harder to review since one has to check both
flavors (argument passed or directly accessed).

in this patch  kvm_init_vcpu() calls new kvm_create_vcpu()
and the former caches these global into 's' local variable,
so I'd reuse that local variable like kvm_get_vcpu() you are removing here =
did.

>=20
>=20
>=20
> >
> > otherwise patch lgtm =20
>=20
>=20
> May I request your Reviewed-by for this patch?
>=20
> Thanks
> Salil.
>=20
>=20
> >
> > =20
> > > +
> > >  static int do_kvm_destroy_vcpu(CPUState *cpu)
> > >  {
> > >      KVMState *s =3D kvm_state;
> > >      long mmap_size;
> > > -    struct KVMParkedVcpu *vcpu =3D NULL;
> > >      int ret =3D 0;
> > >
> > > -    trace_kvm_destroy_vcpu();
> > > +    trace_kvm_destroy_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> > >
> > >      ret =3D kvm_arch_destroy_vcpu(cpu);
> > >      if (ret < 0) {
> > > @@ -373,10 +430,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
> > >          }
> > >      }
> > >
> > > -    vcpu =3D g_malloc0(sizeof(*vcpu));
> > > -    vcpu->vcpu_id =3D kvm_arch_vcpu_id(cpu);
> > > -    vcpu->kvm_fd =3D cpu->kvm_fd;
> > > -    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> > > +    kvm_park_vcpu(cpu);
> > >  err:
> > >      return ret;
> > >  }
> > > @@ -389,24 +443,6 @@ void kvm_destroy_vcpu(CPUState *cpu)
> > >      }
> > >  }
> > >
> > > -static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
> > > -{
> > > -    struct KVMParkedVcpu *cpu;
> > > -
> > > -    QLIST_FOREACH(cpu, &s->kvm_parked_vcpus, node) {
> > > -        if (cpu->vcpu_id =3D=3D vcpu_id) {
> > > -            int kvm_fd;
> > > -
> > > -            QLIST_REMOVE(cpu, node);
> > > -            kvm_fd =3D cpu->kvm_fd;
> > > -            g_free(cpu);
> > > -            return kvm_fd;
> > > -        }
> > > -    }
> > > -
> > > -    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
> > > -}
> > > -
> > >  int kvm_init_vcpu(CPUState *cpu, Error **errp)
> > >  {
> > >      KVMState *s =3D kvm_state;
> > > @@ -415,19 +451,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
> > >
> > >      trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> > >
> > > -    ret =3D kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
> > > +    ret =3D kvm_create_vcpu(cpu);
> > >      if (ret < 0) {
> > > -        error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu =
=20
> > failed (%lu)", =20
> > > +        error_setg_errno(errp, -ret,
> > > +                         "kvm_init_vcpu: kvm_create_vcpu failed (%lu=
)",
> > >                           kvm_arch_vcpu_id(cpu));
> > >          goto err;
> > >      }
> > >
> > > -    cpu->kvm_fd =3D ret;
> > > -    cpu->kvm_state =3D s;
> > > -    cpu->vcpu_dirty =3D true;
> > > -    cpu->dirty_pages =3D 0;
> > > -    cpu->throttle_us_per_full =3D 0;
> > > -
> > >      mmap_size =3D kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
> > >      if (mmap_size < 0) {
> > >          ret =3D mmap_size;
> > > diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
> > > index ca40add32c..171b22fd29 100644
> > > --- a/accel/kvm/kvm-cpus.h
> > > +++ b/accel/kvm/kvm-cpus.h
> > > @@ -22,5 +22,4 @@ bool kvm_supports_guest_debug(void);
> > >  int kvm_insert_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr=
 =20
> > len); =20
> > >  int kvm_remove_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr=
 =20
> > len); =20
> > >  void kvm_remove_all_breakpoints(CPUState *cpu);
> > > -
> > >  #endif /* KVM_CPUS_H */
> > > diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
> > > index 681ccb667d..37626c1ac5 100644
> > > --- a/accel/kvm/trace-events
> > > +++ b/accel/kvm/trace-events
> > > @@ -9,6 +9,10 @@ kvm_device_ioctl(int fd, int type, void *arg) "dev f=
d =20
> > %d, type 0x%x, arg %p" =20
> > >  kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to=
 =20
> > retrieve ONEREG %" PRIu64 " from KVM: %s" =20
> > >  kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to=
 =20
> > set ONEREG %" PRIu64 " to KVM: %s" =20
> > >  kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d i=
d: =20
> > %lu" =20
> > > +kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id, int kvm_fd=
) =20
> > "index: %d, id: %lu, kvm fd: %d" =20
> > > +kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %=
d =20
> > id: %lu" =20
> > > +kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d i=
d: =20
> > %lu" =20
> > > +kvm_unpark_vcpu(unsigned long arch_cpu_id, const char *msg) "id: %lu=
 %s"
> > >  kvm_irqchip_commit_routes(void) ""
> > >  kvm_irqchip_add_msi_route(char *name, int vector, int virq) "dev %s =
=20
> > vector %d virq %d" =20
> > >  kvm_irqchip_update_msi_route(int virq) "Updating MSI route virq=3D%d=
"
> > > @@ -25,7 +29,6 @@ kvm_dirty_ring_reaper(const char *s) "%s"
> > >  kvm_dirty_ring_reap(uint64_t count, int64_t t) "reaped %"PRIu64" pag=
es =20
> > (took %"PRIi64" us)" =20
> > >  kvm_dirty_ring_reaper_kick(const char *reason) "%s"
> > >  kvm_dirty_ring_flush(int finished) "%d"
> > > -kvm_destroy_vcpu(void) ""
> > >  kvm_failed_get_vcpu_mmap_size(void) ""
> > >  kvm_cpu_exec(void) ""
> > >  kvm_interrupt_exit_request(void) ""
> > > diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> > > index c31d9c7356..c4a914b3d8 100644
> > > --- a/include/sysemu/kvm.h
> > > +++ b/include/sysemu/kvm.h
> > > @@ -313,6 +313,31 @@ int kvm_create_device(KVMState *s, uint64_t type=
, =20
> > bool test); =20
> > >   */
> > >  bool kvm_device_supported(int vmfd, uint64_t type);
> > >
> > > +/**
> > > + * kvm_create_vcpu - Gets a parked KVM vCPU or creates a KVM vCPU
> > > + * @cpu: QOM CPUState object for which KVM vCPU has to be =20
> > fetched/created. =20
> > > + *
> > > + * @returns: 0 when success, errno (<0) when failed.
> > > + */
> > > +int kvm_create_vcpu(CPUState *cpu);
> > > +
> > > +/**
> > > + * kvm_park_vcpu - Park QEMU KVM vCPU context
> > > + * @cpu: QOM CPUState object for which QEMU KVM vCPU context has to =
be =20
> > parked. =20
> > > + *
> > > + * @returns: none
> > > + */
> > > +void kvm_park_vcpu(CPUState *cpu);
> > > +
> > > +/**
> > > + * kvm_unpark_vcpu - unpark QEMU KVM vCPU context
> > > + * @s: KVM State
> > > + * @vcpu_id: Architecture vCPU ID of the parked vCPU
> > > + *
> > > + * @returns: KVM fd
> > > + */
> > > +int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id);
> > > +
> > >  /* Arch specific hooks */
> > >
> > >  extern const KVMCapabilityInfo kvm_arch_required_capabilities[]; =20
> >
> > =20
