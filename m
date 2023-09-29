Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m16-20020a056000009000b0031c71693449sm21952235wrx.1.2023.09.29.10.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:06:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4AAE91FFBB;
	Fri, 29 Sep 2023 18:06:27 +0100 (BST)
References: <20230929124304.13672-1-salil.mehta@huawei.com>
 <20230929124304.13672-2-salil.mehta@huawei.com>
 <877co9oz6m.fsf@linaro.org> <49003eaeba6f4719ad3ffb2c9c066eb9@huawei.com>
User-agent: mu4e 1.11.20; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron
 <jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
 <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "will@kernel.org" <will@kernel.org>, "gshan@redhat.com"
 <gshan@redhat.com>, "rafael@kernel.org" <rafael@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
 "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian
 <zhukeqian1@huawei.com>, "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
 "wangyanan (Y)" <wangyanan55@huawei.com>, "jiakernel2@gmail.com"
 <jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "lixianglai@loongson.cn" <lixianglai@loongson.cn>, Linuxarm
 <linuxarm@huawei.com>
Subject: Re: [PATCH 1/9] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Date: Fri, 29 Sep 2023 17:45:37 +0100
In-reply-to: <49003eaeba6f4719ad3ffb2c9c066eb9@huawei.com>
Message-ID: <87h6ncoqng.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: UMIEauTromx6


Salil Mehta <salil.mehta@huawei.com> writes:

> Hi Alex,
> Thanks for taking pains to review it.
>
>> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
<snip>
>> Salil Mehta <salil.mehta@huawei.com> writes:
>>=20
>> > KVM vCPU creation is done once during the initialization of the VM whe=
n Qemu
>> > threads are spawned. This is common to all the architectures.
>> >
>> > Hot-unplug of vCPU results in destruction of the vCPU objects in QOM b=
ut
>> > the KVM vCPU objects in the Host KVM are not destroyed and their repre=
sentative
>> > KVM vCPU objects/context in Qemu are parked.
>> >
>> > Refactor common logic so that some APIs could be reused by vCPU Hotplu=
g code.
>> >
>> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>> > ---
>> >  accel/kvm/kvm-all.c  | 61 ++++++++++++++++++++++++++++++++++----------
>> >  include/sysemu/kvm.h |  2 ++
>> >  2 files changed, 49 insertions(+), 14 deletions(-)
>> >
>> > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> > index ff1578bb32..57889c5f6c 100644
>> > --- a/accel/kvm/kvm-all.c
>> > +++ b/accel/kvm/kvm-all.c
>> > @@ -137,6 +137,7 @@ static QemuMutex kml_slots_lock;
>> >  #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
>> >
>> >  static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
>> > +static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id);
>>=20
>> weird to have a forward static declaration here if you are declare in
>> the header later on.
>
> Yes, it is awkward. Actually, I had to move a function to get
> a diff of changes which were more readable. Without moving
> existing kvm_get_vcpu() function, change was not getting
> highlighted properly in the generated patch. This relocation
> of the function meant the order of declaration and its call
> got reversed. So I had to use above tactics, even though weird.
>
> Suggestions welcome to solve this?

You could have a code-motion commit ahead of this one to move things
into more useful places.

>
>> >  static inline void kvm_resample_fd_remove(int gsi)
>> >  {
>> > @@ -320,11 +321,51 @@ err:
>> >      return ret;
>> >  }
>> >
>> > +void kvm_park_vcpu(CPUState *cpu)
>> > +{
>> > +    unsigned long vcpu_id =3D cpu->cpu_index;
>>=20
>> cpu_index is a plain int in CPUState:
>>=20
>>     int cpu_index;
>>=20
>> but is defined as an unsigned long in KVMParkedVcpu:
>>=20
>>     unsigned long vcpu_id;
>>=20
>> I'm not sure if this is just a historical anomaly but I suspect we
>> should fixup the discrepancy first so all users of cpu_index use the
>> same size.
>
>
> Yes, agreed. But it is out of scope of this patch.

Not so sure about that. Its adding another potential integer overflow
that would have to be cleared up later rather than fixing the
foundations before doing the refactor.

>> > +    struct KVMParkedVcpu *vcpu;
>> > +
>> > +    vcpu =3D g_malloc0(sizeof(*vcpu));
>> > +    vcpu->vcpu_id =3D vcpu_id;
>> > +    vcpu->kvm_fd =3D cpu->kvm_fd;
>> > +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
>> > +}
>> > +
>> > +int kvm_create_vcpu(CPUState *cpu)
>> > +{
>>=20
>> I don't think you get anything other than -1 on failure so at this point
>> you might as well return a bool.
>
> kvm_vm_ioctl() can return other values? The 'ret' value can then be set=20
> using error_setg_errno() for example, in kvm_init_vcpu().

Ahh yes - although:

    if (ret =3D=3D -1) {
        ret =3D -errno;
    }

So I think you end up inverting again at the error reporting stage.

> It is better to keep error handling standard for any future changes
> as well.

Well the "proper" way is to pass errp down because the -1 from
kvm_get_cpu() isn't the same as -errno from the kvm_vm_ioctl() so
passing that to error_setg_errno() for the former is incorrect as its
just a lookup failure and -1 doesn't mean anything other than fail in
that context.

So yes returning int can be valid but often bool + errp makes for neater
code.

>>=20
>> > +    unsigned long vcpu_id =3D cpu->cpu_index;
>>=20
>> Is this used?
>
> It is used but we can get away with this. I think it
> is a stray left over from shuffle.
>
> Thanks!
>
>> > +    KVMState *s =3D kvm_state;
>> > +    int ret;
>> > +
>> > +    DPRINTF("kvm_create_vcpu\n");
>>=20
>> Please don't add new DPRINTFs - use tracepoints instead. Whether its
>> worth cleaning up up kvm-all first I leave up to you.
>
> I can definitely change for this code.
>
>
>>=20
>> > +    /* check if the KVM vCPU already exist but is parked */
>> > +    ret =3D kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
>> > +    if (ret > 0) {
>> > +        goto found;
>> > +    }
>> > +
>> > +    /* create a new KVM vCPU */
>> > +    ret =3D kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
>> > +    if (ret < 0) {
>> > +        return ret;
>> > +    }
>> > +
>> > +found:
>> > +    cpu->vcpu_dirty =3D true;
>> > +    cpu->kvm_fd =3D ret;
>> > +    cpu->kvm_state =3D s;
>> > +    cpu->dirty_pages =3D 0;
>> > +    cpu->throttle_us_per_full =3D 0;
>> > +
>> > +    return 0;
>> > +}
>> > +
>>=20
>> This is trivially nestable to avoid gotos:
>
>
> No issues. I can remove gotos. I was trying to reduce
> indentation.

I think 2 levels is fair enough. We have a lot of goto's in the code for
error clean-up paths although we are slowly cleaning them up now we have
things like g_autoptr and friends.=20

>>=20
>>   bool kvm_create_vcpu(CPUState *cpu)
>
> It is better to return ioctl value so that error can be
> set at the caller handling code.

Or pass down errp.

>
>>   {
>>       unsigned long vcpu_id =3D cpu->cpu_index;
>>       KVMState *s =3D kvm_state;
>>       int ret;
>>=20
>>       /* check if the KVM vCPU already exist but is parked */
>>       ret =3D kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
>>       if (ret < 0) {
>>           /* not found, try to create a new KVM vCPU */
>>           ret =3D kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
>>           if (ret < 0) {
>>               return false;
>>           }
>>       }
>
> Yes, can be done this way.
>
>>=20
>>       cpu->vcpu_dirty =3D true;
>>       cpu->kvm_fd =3D ret;
>>       cpu->kvm_state =3D s;
>>       cpu->dirty_pages =3D 0;
>>       cpu->throttle_us_per_full =3D 0;
>>=20
>>       return true;
>
> return value is better than Boolean.
>
>>   }
>>=20
>> >  static int do_kvm_destroy_vcpu(CPUState *cpu)
>> >  {
>> >      KVMState *s =3D kvm_state;
>> >      long mmap_size;
>> > -    struct KVMParkedVcpu *vcpu =3D NULL;
>> >      int ret =3D 0;
>> >
>> >      DPRINTF("kvm_destroy_vcpu\n");
>> > @@ -353,10 +394,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
>> >          }
>> >      }
>> >
>> > -    vcpu =3D g_malloc0(sizeof(*vcpu));
>> > -    vcpu->vcpu_id =3D kvm_arch_vcpu_id(cpu);
>> > -    vcpu->kvm_fd =3D cpu->kvm_fd;
>> > -    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
>> > +    kvm_park_vcpu(cpu);
>> >  err:
>> >      return ret;
>> >  }
>> > @@ -384,7 +422,7 @@ static int kvm_get_vcpu(KVMState *s, unsigned long
>> vcpu_id)
>> >          }
>> >      }
>> >
>> > -    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
>> > +    return -1;
>> >  }
>> >
>> >  int kvm_init_vcpu(CPUState *cpu, Error **errp)
>> > @@ -395,19 +433,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
>>=20
>> Hmm it looks like no one cares about the return value here and the fact
>> that callers use &error_fatal should be enough to exit. You can then
>> just return early and avoid the error ladder.
>
> Maybe yes, but is that change really required?

Well it would simplify the goto jumps in the function that are only
there to ensure a value that is never looked at is generated.=20

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
