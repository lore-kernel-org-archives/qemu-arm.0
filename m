Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp64501ejb;
        Tue, 21 May 2024 18:25:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXM28+ouJSuCr99eEGpaaeMNNwgxqrAR5IKAgeKeo0UIaNJv0hHW5idMnUkn4cJIAd/aA7caruB0cRJCyD3P/CFvEh8+ijc
X-Received: by 2002:a17:902:c412:b0:1f3:1075:87a2 with SMTP id d9443c01a7336-1f31c9651b2mr7188155ad.13.1716341144112;
        Tue, 21 May 2024 18:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716341144; cv=none;
        d=google.com; s=arc-20160816;
        b=Jt7iy0OFrjw5Atis7l44Gk9f3FzOBdP/ZFC+nqueix7JfYDQCtbG2GKGgneu+HJKVJ
         HZWdA9afMJc8JXgpD8ANnXGwABU7KeYxETdiJ+kufyuHrVO07zv9PXgytREA25BfNhD8
         XIi5GJEPoaj+Pv73IPcQUmSVqiQtnaRKTv74I4Wp6X7fZb0UMGpV3yyM/F4PiBc6GDJX
         GWNiingNF3Ulfjqzdh2L6dvlT6jKf2rBikY8PgdWx9vrDTUTcNv0Zku2jsdZG47p1qIC
         SSKvfsDmfBOIMaHVj2t/feDQcnPQJZMOH94R5qB+vS/3hiJG49ZEr3efep/Q4J8xIzxK
         b7CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=Ltm/dB7mT9iy0/H8EB+KojAvCEl96dUFqCQ9MUa5z8Y=;
        fh=dHQ+kMLLjj6KoM8AUgZC9tVUG7M4vYR/1IoEVyBYR40=;
        b=LC5RFPbOiuP2lEcIfJg39m64wTGhlc2sfxXrHLjDNKtjzr+dcb3/RXY2haVzcAhV/T
         QC+kLRMf+4noU6AnEJVoWUz6qgYEJ1UFjky2QbPBDitWKGk2bSHd4enlfP/4iBeKE1Hk
         SwQycQdQOJwtWIXq1L5teB1ydCJS1+YvMNtghjr9SMpaPX1bCiE2pC6PUYuQD+gQYQlH
         XD+UwFhPPV/0oXWkEIY9Y4v2u8wIoHZUlUFnr39gdu+L5Gli8utXHDmf+0iX9Zvz11d6
         fsOjJ+HcooJIpEFZWli/QzRgg8pypA+8WDRMYlPlM69InDx1wFtNwKl+pxIq6XOMcMwZ
         xzfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=aYJH+yQU;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1ef0b1b2d3bsor176135985ad.0.2024.05.21.18.25.43
        (Google Transport Security);
        Tue, 21 May 2024 18:25:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=aYJH+yQU;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716341143; x=1716945943; darn=linaro.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ltm/dB7mT9iy0/H8EB+KojAvCEl96dUFqCQ9MUa5z8Y=;
        b=aYJH+yQUEAwv6qrPWRAPmYr9xlFjr6xdMhAm66KLwEhKKvyM1J7428h/m5C64IR25o
         t5Q9/3Z3ucUuCMVmamJ5E5MKRXx9kbte2XYspn1TYoHRqGPJGgLcP2AlOUCMvAEynNh0
         idjTrJttpDtKG9Wko26aF7TIGx3ScguRRMW0mjqS0QVp5fV2Q5ur/C6M+hOCZNr+CTxn
         TX/asYcFLrH8HQdYfAAwK/fRjWKdYKQZeKoumss7S6jnoRXKsWhK1pKqZYgwrBKqIVIw
         zKQw0uMjSlsDyKHTshik1UH0Avbeh7YruYSnnS2MSMtaLSP88i9cqEqeEO+n6FrmE34a
         T8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716341143; x=1716945943;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ltm/dB7mT9iy0/H8EB+KojAvCEl96dUFqCQ9MUa5z8Y=;
        b=vftZdEw7JW9Nh9otjmae10dSwscxh1WDUE08k4FCLAWO0lZF6EAd8hcM3WeZYQUQUW
         061Q36TgYGnPFgALkLbPU7BkSfC2Rh7lXNpqyXUzIkONIl4Lp/6E2dD7XC5GT3M7Fiup
         XjW63V5+bdbZQuvjAWsrrBe9PtSwF4ocbAypg2onV2KRE0LND+GItHxO3JY5hIEPlPyD
         iPF+lfzLYM+Kd3sGusouZYKTz26Qu1de33mJeEiiZQc4A3NyRV1C7H0lhHk/v4qGtvWi
         DyrTV3ij1VhfXD9qWbGQRYA+vcrLlGsdqhOEtYVoJ3NUkLDtvJrZcNkV4b+DtmaDyeZ+
         5Byw==
X-Forwarded-Encrypted: i=1; AJvYcCXJJi/Uh8eq0zX42yanXVOeMgp2KMNUn343edBnT6yER0lwAKBVeXbYqWKBta7JnD9eF9r1ZOY7t5De1+qZ12ZGsmc8ncVp0rsN1CM9W2sqFBDuIz0C+9y0RDyD50HwyhE71Xqk8kAM0BrkcoID0aLyUj/EtMEHYaeq8sD/yPOQz1lNtS9SepBIg453wACW+ypnk2MLeKZjfQf/82dfGvTN58K7HOFKIOO+vEQ=
X-Gm-Message-State: AOJu0Yxejgxc4jv5JjHVN2mUBG8Qvytx30Eg2xDD/Oal59DA2tgsem59
	ycBBzd/5Hzb+JqdQJszY6bcZBYgRTRavPmAfd73T2i+EYLdd5WSv
X-Google-Smtp-Source: AGHT+IE0MIuhnG7RRL+a8VNF3LnFnh5OA7dJtlXYZVoYB34aI521QjMGz/5l8sbWplrMv0HuDI8oNw==
X-Received: by 2002:a17:902:ecc4:b0:1f2:f7c6:754e with SMTP id d9443c01a7336-1f31c9f0579mr7418975ad.51.1716341142993;
        Tue, 21 May 2024 18:25:42 -0700 (PDT)
Return-Path: <npiggin@gmail.com>
Received: from localhost (110-175-65-7.tpgi.com.au. [110.175.65.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f2fd47df1bsm47391375ad.207.2024.05.21.18.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 18:25:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 May 2024 11:25:26 +1000
Message-Id: <D1FS5GOOFWWK.2PNRIVL0V6DBL@gmail.com>
Cc: <maz@kernel.org>, <jean-philippe@linaro.org>,
 <jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
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
 <harshpb@linux.ibm.com>, <linuxarm@huawei.com>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Shaoqin Huang" <shahuang@redhat.com>
Subject: Re: [PATCH V10 1/8] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Salil Mehta" <salil.mehta@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
X-Mailer: aerc 0.17.0
References: <20240520233241.229675-1-salil.mehta@huawei.com>
 <20240520233241.229675-2-salil.mehta@huawei.com>
In-Reply-To: <20240520233241.229675-2-salil.mehta@huawei.com>
X-TUID: f/iPlg5ZQO0C

On Tue May 21, 2024 at 9:32 AM AEST, Salil Mehta wrote:
> KVM vCPU creation is done once during the vCPU realization when Qemu vCPU=
 thread
> is spawned. This is common to all the architectures as of now.
>
> Hot-unplug of vCPU results in destruction of the vCPU object in QOM but t=
he
> corresponding KVM vCPU object in the Host KVM is not destroyed as KVM doe=
sn't
> support vCPU removal. Therefore, its representative KVM vCPU object/conte=
xt in
> Qemu is parked.
>
> Refactor architecture common logic so that some APIs could be reused by v=
CPU
> Hotplug code of some architectures likes ARM, Loongson etc. Update new/ol=
d APIs
> with trace events. No functional change is intended here.
>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> ---
>  accel/kvm/kvm-all.c    | 97 ++++++++++++++++++++++++++++--------------
>  accel/kvm/kvm-cpus.h   | 23 ++++++++++
>  accel/kvm/trace-events |  5 ++-
>  3 files changed, 92 insertions(+), 33 deletions(-)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index c0be9f5eed..a8f93078dc 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -340,14 +340,73 @@ err:
>      return ret;
>  }
> =20
> +void kvm_park_vcpu(CPUState *cpu)
> +{
> +    struct KVMParkedVcpu *vcpu;
> +
> +    trace_kvm_park_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> +
> +    vcpu =3D g_malloc0(sizeof(*vcpu));
> +    vcpu->vcpu_id =3D kvm_arch_vcpu_id(cpu);
> +    vcpu->kvm_fd =3D cpu->kvm_fd;
> +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> +}
> +
> +int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id)
> +{
> +    struct KVMParkedVcpu *cpu;
> +
> +    QLIST_FOREACH(cpu, &s->kvm_parked_vcpus, node) {
> +        if (cpu->vcpu_id =3D=3D vcpu_id) {
> +            int kvm_fd;
> +
> +            trace_kvm_unpark_vcpu(vcpu_id);

Just an aside, but unfortunately tracing is not entirely consistent.
Often a function-level trace point is done at the beginning of the
function regardless of the result. But I actually like this style
of tracing at the end and providing result too. OTOH you don't see
the -ENOENT case.

In any case it's nice to have something here.

Other unforunate thing is some confusion between attaching a KVM
context for QEMU vCPU, and actually making the KVM_CREATE_VCPU
ioctl call, and kvm_create_vcpu is not the counterpart of
kvm_destroy_vcpu, etc.. It is not your fault the existing naming
makes this a bit confusing. Fortunately it's pretty well contained
to small amount of code.

I hate to nitpick it but since the functions are being exported,
would it be a better name somthing like kvm_attach_vcpu()?

Just a thought, but no big deal. Either way,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> +
> +            QLIST_REMOVE(cpu, node);
> +            kvm_fd =3D cpu->kvm_fd;
> +            g_free(cpu);
> +            return kvm_fd;
> +        }
> +    }
> +
> +    return -ENOENT;
> +}
> +
> +int kvm_create_vcpu(CPUState *cpu)
> +{
> +    unsigned long vcpu_id =3D kvm_arch_vcpu_id(cpu);
> +    KVMState *s =3D kvm_state;
> +    int kvm_fd;
> +
> +    /* check if the KVM vCPU already exist but is parked */
> +    kvm_fd =3D kvm_unpark_vcpu(s, vcpu_id);
> +    if (kvm_fd < 0) {
> +        /* vCPU not parked: create a new KVM vCPU */
> +        kvm_fd =3D kvm_vm_ioctl(s, KVM_CREATE_VCPU, vcpu_id);
> +        if (kvm_fd < 0) {
> +            error_report("KVM_CREATE_VCPU IOCTL failed for vCPU %lu", vc=
pu_id);
> +            return kvm_fd;
> +        }
> +    }
> +
> +    trace_kvm_create_vcpu(cpu->cpu_index, vcpu_id, kvm_fd);
> +
> +    cpu->kvm_fd =3D kvm_fd;
> +    cpu->kvm_state =3D s;
> +    cpu->vcpu_dirty =3D true;
> +    cpu->dirty_pages =3D 0;
> +    cpu->throttle_us_per_full =3D 0;
> +
> +    return 0;
> +}
> +
>  static int do_kvm_destroy_vcpu(CPUState *cpu)
>  {
>      KVMState *s =3D kvm_state;
>      long mmap_size;
> -    struct KVMParkedVcpu *vcpu =3D NULL;
>      int ret =3D 0;
> =20
> -    trace_kvm_destroy_vcpu();
> +    trace_kvm_destroy_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> =20
>      ret =3D kvm_arch_destroy_vcpu(cpu);
>      if (ret < 0) {
> @@ -373,10 +432,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
>          }
>      }
> =20
> -    vcpu =3D g_malloc0(sizeof(*vcpu));
> -    vcpu->vcpu_id =3D kvm_arch_vcpu_id(cpu);
> -    vcpu->kvm_fd =3D cpu->kvm_fd;
> -    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> +    kvm_park_vcpu(cpu);
>  err:
>      return ret;
>  }
> @@ -389,24 +445,6 @@ void kvm_destroy_vcpu(CPUState *cpu)
>      }
>  }
> =20
> -static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
> -{
> -    struct KVMParkedVcpu *cpu;
> -
> -    QLIST_FOREACH(cpu, &s->kvm_parked_vcpus, node) {
> -        if (cpu->vcpu_id =3D=3D vcpu_id) {
> -            int kvm_fd;
> -
> -            QLIST_REMOVE(cpu, node);
> -            kvm_fd =3D cpu->kvm_fd;
> -            g_free(cpu);
> -            return kvm_fd;
> -        }
> -    }
> -
> -    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
> -}
> -
>  int kvm_init_vcpu(CPUState *cpu, Error **errp)
>  {
>      KVMState *s =3D kvm_state;
> @@ -415,19 +453,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
> =20
>      trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> =20
> -    ret =3D kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
> +    ret =3D kvm_create_vcpu(cpu);
>      if (ret < 0) {
> -        error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu failed=
 (%lu)",
> +        error_setg_errno(errp, -ret,
> +                         "kvm_init_vcpu: kvm_create_vcpu failed (%lu)",
>                           kvm_arch_vcpu_id(cpu));
>          goto err;
>      }
> =20
> -    cpu->kvm_fd =3D ret;
> -    cpu->kvm_state =3D s;
> -    cpu->vcpu_dirty =3D true;
> -    cpu->dirty_pages =3D 0;
> -    cpu->throttle_us_per_full =3D 0;
> -
>      mmap_size =3D kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
>      if (mmap_size < 0) {
>          ret =3D mmap_size;
> diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
> index ca40add32c..2e6bb38b5d 100644
> --- a/accel/kvm/kvm-cpus.h
> +++ b/accel/kvm/kvm-cpus.h
> @@ -22,5 +22,28 @@ bool kvm_supports_guest_debug(void);
>  int kvm_insert_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len=
);
>  int kvm_remove_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len=
);
>  void kvm_remove_all_breakpoints(CPUState *cpu);
> +/**
> + * kvm_create_vcpu - Gets a parked KVM vCPU or creates a KVM vCPU
> + * @cpu: QOM CPUState object for which KVM vCPU has to be fetched/create=
d.
> + *
> + * @returns: 0 when success, errno (<0) when failed.
> + */
> +int kvm_create_vcpu(CPUState *cpu);
> =20
> +/**
> + * kvm_park_vcpu - Park QEMU KVM vCPU context
> + * @cpu: QOM CPUState object for which QEMU KVM vCPU context has to be p=
arked.
> + *
> + * @returns: none
> + */
> +void kvm_park_vcpu(CPUState *cpu);
> +
> +/**
> + * kvm_unpark_vcpu - unpark QEMU KVM vCPU context
> + * @s: KVM State
> + * @cpu: Architecture vCPU ID of the parked vCPU
> + *
> + * @returns: KVM fd
> + */
> +int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id);
>  #endif /* KVM_CPUS_H */
> diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
> index 681ccb667d..bd43a0ef26 100644
> --- a/accel/kvm/trace-events
> +++ b/accel/kvm/trace-events
> @@ -9,6 +9,10 @@ kvm_device_ioctl(int fd, int type, void *arg) "dev fd %d=
, type 0x%x, arg %p"
>  kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to ret=
rieve ONEREG %" PRIu64 " from KVM: %s"
>  kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to set=
 ONEREG %" PRIu64 " to KVM: %s"
>  kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %=
lu"
> +kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id, int kvm_fd) "i=
ndex: %d, id: %lu, kvm fd: %d"
> +kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id=
: %lu"
> +kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %=
lu"
> +kvm_unpark_vcpu(unsigned long arch_cpu_id) "id: %lu"
>  kvm_irqchip_commit_routes(void) ""
>  kvm_irqchip_add_msi_route(char *name, int vector, int virq) "dev %s vect=
or %d virq %d"
>  kvm_irqchip_update_msi_route(int virq) "Updating MSI route virq=3D%d"
> @@ -25,7 +29,6 @@ kvm_dirty_ring_reaper(const char *s) "%s"
>  kvm_dirty_ring_reap(uint64_t count, int64_t t) "reaped %"PRIu64" pages (=
took %"PRIi64" us)"
>  kvm_dirty_ring_reaper_kick(const char *reason) "%s"
>  kvm_dirty_ring_flush(int finished) "%d"
> -kvm_destroy_vcpu(void) ""
>  kvm_failed_get_vcpu_mmap_size(void) ""
>  kvm_cpu_exec(void) ""
>  kvm_interrupt_exit_request(void) ""
