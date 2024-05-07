Received: by 2002:a05:7022:ef03:b0:7c:9548:a19d with SMTP id qy3csp1998727dlb;
        Tue, 7 May 2024 05:51:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWfFETlAf5nYZUytjQjjz4uiNF/PHoGd7nmIai6EpMxq3x41GEHJGp9lccDoQS57/Hdf5HiGEIjo7MnMppKa+vHPpgoMnIV
X-Received: by 2002:a17:906:2bd0:b0:a59:a38c:557a with SMTP id n16-20020a1709062bd000b00a59a38c557amr5078515ejg.11.1715086289258;
        Tue, 07 May 2024 05:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715086289; cv=none;
        d=google.com; s=arc-20160816;
        b=XwHxcCr9VWs1RgkUfeYzQb34iUQDHcMUiSAYV4UwuZfN3JxyosYL9v04TGKnXb7AEk
         0dCza9Gx+PwDKwatv0ngtrd5HpnVIQCWmWgz0OUT2kGZ/xkU14y3Jtk3xBaGbvI4KzxC
         pKoabHeNNNVLsOf6a0dIpwkiG5Osa3HQlX30BGf2sCRfqu9sqm7avJR93mU9HA6XfmQ9
         qpL93Q5lWgmBPH517e7iXyiIUPhWANsjHcwD2T19/X8S7fRvgpzlgIPTwqV3YF69URjz
         DfKw9GfoW2I9RfrJnEAMYPb90f8SqIFlbG2kiOaHwi+jQdjZbWicDxU30xf1Qf1+PpwE
         VHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=20ZU5Yy9W/avlhuyhsHDwL189xQbLljdYQ6q0g4Cdow=;
        fh=iguey1lsGj2+m92g1CaGjSZcEg2HkLYx6vwX8Eb+su0=;
        b=AeLUYGtTjqkkD6SRDPbrr0K9syRu93F2l41otU6jM+oBed/6go317RqLv+f6v/Bn3q
         cdvyI2Y/L0Vj7iERCZ9GND5tdhtHBIx8ODnuN5/0L7SGR2cXrl+CslR2gUvy3QLzT3Sq
         DLc/XmPZPvtiYDI2FPV83L/Q31IhfupWoO1cE5J4Lwl8lMtajLQ1J8dv/Q0e8WASAxZC
         m2ydcpeBQvdgFsZzwrZxklzhwwoKBZ5iRC3e7Zy1tXHa8sBA32CE4powcUWiMH6Tee6w
         s7JFPxSnef9PwX11Dm9VoWigzw+b93mCvec9yc2BGMn2dF4DWLJ4uW3nIjM0HlNC+utG
         YB7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=DygoK2TU;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k3-20020a17090632c300b00a59f5bb0178sor187687ejk.5.2024.05.07.05.51.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 May 2024 05:51:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=DygoK2TU;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1715086289; x=1715691089; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=20ZU5Yy9W/avlhuyhsHDwL189xQbLljdYQ6q0g4Cdow=;
        b=DygoK2TUwB4l6ctTbTkR+NR1PZ86Uj4bNYVe9/GkCCGW/4SZOoEqWrjp9ZDvfA+eVs
         B5NwWCg7Er6kTdZig89I6ajQnVQlSDaWLk3WMvWWjKMTebmWqv3lH61oVb9zWp0xFztB
         fyNVEJL2MO+9oyX6cQBdiNzrFfObsJ9m8Bb+09UovTPH4ApzvxneWEotWCsKNzzlfRku
         rfvztdbByD7y86qgS0nL4Uui4hA2ShLBDFRzyUm74b6IbDcS87LOW7a7xMgP8zAduowO
         SX+XYi5kop5PURTUQXfqJ06xp121SuS1NTuWvhMhIXcN+YvBA1oc1TbJW0PBUy04OYv6
         qXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715086289; x=1715691089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20ZU5Yy9W/avlhuyhsHDwL189xQbLljdYQ6q0g4Cdow=;
        b=u6cVMlzUihnDyjYbx0Gc9CVo96V9zAB7OPIhFEYCBeQQoTQbvpvujmiDhDtxr67WPb
         lre7mSNeNUg3fD0ucG/tiFkTVP6BvqAhualLx4cQer9prE0kiZ1HLxYmNLJ+PfgFSxr5
         pUsHGJ9+CY5cUcBBPlNbjm/nrt7UdsMu42QPl+V7HD3uiQ+MUPSxj14CPPkCNOx+P/qu
         dvn5pitfGjNbdIE+VxbMhnw5tdWYSO7XYPBLt/8MY6CNzGeFgoWej6q9j93rhdwhCc+c
         aF5kxCtF6Apx8O2B1bHhvFaQCqlBCxEsMKDl8FGOkzO9o/qRsEZ22EPk1p0yfTnDkZbA
         vpHw==
X-Forwarded-Encrypted: i=1; AJvYcCWxljzbEO2nG9RRyGOfpYXeCvxqhhpmdG4t5QDMo8TV4EqLeuDVvnbJFDqPK4+1/boZ6atPR2r7KwuKuyOyaQsoHOIOlc3w
X-Gm-Message-State: AOJu0YyHGz/1PsEb1pilqLQuk8BUv4ku4zVQEkWDnmh99SjMbqTS1c7a
	7V3SwqEQo+i4AMM+qkatu1IAZwlVwzqWb1lTSIx5k/YPMTEz1f/gOHXoG1H7vle4UY6H8G11qdU
	RlpWdoXKFX6J8y8vBhc/SAgAac5GBqRUnzDyJyrvr647L9pfgFE/Yeg==
X-Google-Smtp-Source: AGHT+IFmREWGz4rXO1+UQW16ssOqlcH1r8+LmVtO34whjO0Z4I4fsT5Zq+aCZyMTRjujxPEsjUevxnE+6ic5wj6p3yk=
X-Received: by 2002:a17:907:7203:b0:a59:c31a:91be with SMTP id
 dr3-20020a170907720300b00a59c31a91bemr4763217ejc.16.1715086288498; Tue, 07
 May 2024 05:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240312020000.12992-1-salil.mehta@huawei.com>
 <20240312020000.12992-2-salil.mehta@huawei.com> <565ba0ac-a070-4784-a882-2eeab9c91541@amperemail.onmicrosoft.com>
 <8a1fc3ee6a5d4f8fb8ffb9993c90c1b9@huawei.com> <696a08f4-1d67-48e4-8c58-57dc33d43ffa@amperemail.onmicrosoft.com>
In-Reply-To: <696a08f4-1d67-48e4-8c58-57dc33d43ffa@amperemail.onmicrosoft.com>
From: Salil Mehta <salil.mehta@opnsrc.net>
Date: Tue, 7 May 2024 12:51:16 +0000
Message-ID: <CAJ7pxeYZ6nmje_6cYU=DpFUVJeynSeax_2bPTfCHuyBdnUrt3Q@mail.gmail.com>
Subject: Re: [PATCH V8 1/8] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
To: Vishnu Pajjuri <vishnu@amperemail.onmicrosoft.com>
Cc: Salil Mehta <salil.mehta@huawei.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>, 
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>, 
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>, 
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com" <david@redhat.com>, 
	"philmd@linaro.org" <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"mst@redhat.com" <mst@redhat.com>, "will@kernel.org" <will@kernel.org>, "gshan@redhat.com" <gshan@redhat.com>, 
	"rafael@kernel.org" <rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>, 
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, 
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>, 
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>, 
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>, 
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>, 
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>, 
	"wangyanan (Y)" <wangyanan55@huawei.com>, "jiakernel2@gmail.com" <jiakernel2@gmail.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>, 
	Linuxarm <linuxarm@huawei.com>, 
	"gankulkarni@os.amperecomputing.com" <gankulkarni@os.amperecomputing.com>
Content-Type: multipart/alternative; boundary="000000000000fc4fce0617dca4be"
X-TUID: B/Zh6Qt2eZvy

--000000000000fc4fce0617dca4be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Vishnu,

On Tue, May 7, 2024 at 12:39=E2=80=AFPM Vishnu Pajjuri <
vishnu@amperemail.onmicrosoft.com> wrote:

> Hi Salil,
> On 03-05-2024 21:53, Salil Mehta wrote:
>
> [EXTERNAL EMAIL NOTICE: This email originated from an external sender. Pl=
ease be mindful of safe email handling and proprietary information protecti=
on practices.]
>
>
> Hi Vishnu,
>
>
>  From: Vishnu Pajjuri <vishnu@amperemail.onmicrosoft.com> <vishnu@amperem=
ail.onmicrosoft.com>
>  Sent: Thursday, April 4, 2024 3:00 PM
>  Subject: Re: [PATCH V8 1/8] accel/kvm: Extract common KVM vCPU {creation=
,parking} code
>
>  Hi Salil,
>
>  On 12-03-2024 07:29, Salil Mehta wrote:
>  KVM vCPU creation is done once during the vCPU realization when Qemu vCP=
U thread
>  is spawned. This is common to all the architectures as of now.
>
>  Hot-unplug of vCPU results in destruction of the vCPU object in QOM but =
the
>  corresponding KVM vCPU object in the Host KVM is not destroyed as KVM do=
esn't
>  support vCPU removal. Therefore, its representative KVM vCPU object/cont=
ext in
>  Qemu is parked.
>
>  Refactor architecture common logic so that some APIs could be reused by =
vCPU
>  Hotplug code of some architectures likes ARM, Loongson etc. Update new/o=
ld APIs
>  with trace events instead of DPRINTF. No functional change is intended h=
ere.
>
>  Signed-off-by: Salil Mehta mailto:salil.mehta@huawei.com <salil.mehta@hu=
awei.com>
>  Reviewed-by: Gavin Shan mailto:gshan@redhat.com <gshan@redhat.com>
>  Tested-by: Vishnu Pajjuri mailto:vishnu@os.amperecomputing.com <vishnu@o=
s.amperecomputing.com>
>  Reviewed-by: Jonathan Cameron mailto:Jonathan.Cameron@huawei.com <Jonath=
an.Cameron@huawei.com>
>  Tested-by: Xianglai Li mailto:lixianglai@loongson.cn <lixianglai@loongso=
n.cn>
>  Tested-by: Miguel Luis mailto:miguel.luis@oracle.com <miguel.luis@oracle=
.com>
>  Reviewed-by: Shaoqin Huang mailto:shahuang@redhat.com <shahuang@redhat.c=
om>
>  ---
>   accel/kvm/kvm-all.c    | 64 ++++++++++++++++++++++++++++++++----------
>   accel/kvm/trace-events |  5 +++-
>   include/sysemu/kvm.h   | 16 +++++++++++
>   3 files changed, 69 insertions(+), 16 deletions(-)
>
>  diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>  index a8cecd040e..3bc3207bda 100644
>  --- a/accel/kvm/kvm-all.c
>  +++ b/accel/kvm/kvm-all.c
>  @@ -126,6 +126,7 @@ static QemuMutex kml_slots_lock;
>   #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
>
>   static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
>  +static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id);
>
>   static inline void kvm_resample_fd_remove(int gsi)
>   {
>  @@ -314,14 +315,53 @@ err:
>  return ret;
>   }
>
>  +void kvm_park_vcpu(CPUState *cpu)
>  +{
>  +    struct KVMParkedVcpu *vcpu;
>  +
>  +    trace_kvm_park_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>
>  It's good if we add kvm_fd to trace.
>  It will be useful to cross verify kvm_get_vcpu()'s kvm_fd with parked vc=
pu.
>
> Agreed. But this is currently called in context to create and destroy vCP=
U
> where the trace already exists with the info you are seeking. Having
> trace here might duplicate the info and end up increasing the noise.
>
> Let me know if you think otherwise or have something else to add.
>
> This is to provide additional information to the racing only.
>
> The intention here is to trace mapping of vcpu_id<-->kvm_fd while parking
>
> and fetching vcpu. This way we can easily trace what is parked
> (kvm_park_vcpu()) vs fetched (kvm_get_vcpu())
>
> using pair of information.
>

Ok, No problem. I will.


> Thanks
>
>
>
>  +
>  +    vcpu =3D g_malloc0(sizeof(*vcpu));
>  +    vcpu->vcpu_id =3D kvm_arch_vcpu_id(cpu);
>  +    vcpu->kvm_fd =3D cpu->kvm_fd;
>  +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
>  +}
>  +
>  +int kvm_create_vcpu(CPUState *cpu)
>  +{
>  +    unsigned long vcpu_id =3D kvm_arch_vcpu_id(cpu);
>  +    KVMState *s =3D kvm_state;
>  +    int kvm_fd;
>  +
>  +    trace_kvm_create_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>
>  vcpu_id can be used instead of kvm_arch_vcpu_id(cpu).
>
> KVM arch VCPU Id ensures that ID being traced is meaningful for that
> architecture. The way CPU ID gets calculated in on different architecture=
s
> could be different. Hence, its value might be quite different.
>
> vcpu_id is already being calculated just above trace call.
>
> I don't think vcpu_id value gets differ by the time of tracing.
>

sure.


>  +
>  +    /* check if the KVM vCPU already exist but is parked */
>  +    kvm_fd =3D kvm_get_vcpu(s, vcpu_id);
>  +    if (kvm_fd < 0) {
>  +>   /* vCPU not parked: create a new KVM vCPU */
>  +>   kvm_fd =3D kvm_vm_ioctl(s, KVM_CREATE_VCPU, vcpu_id);
>  +>   if (kvm_fd < 0) {
>  +>       error_report("KVM_CREATE_VCPU IOCTL failed for vCPU %lu", vcpu_=
id);
>  +>       return kvm_fd;
>  +>   }
>  +    }
>  +
>  +    cpu->kvm_fd =3D kvm_fd;
>  +    cpu->kvm_state =3D s;
>  +    cpu->vcpu_dirty =3D true;
>  +    cpu->dirty_pages =3D 0;
>  +    cpu->throttle_us_per_full =3D 0;
>  +
>  +    return 0;
>  +}
>  +
>   static int do_kvm_destroy_vcpu(CPUState *cpu)
>   {
>       KVMState *s =3D kvm_state;
>       long mmap_size;
>  -    struct KVMParkedVcpu *vcpu =3D NULL;
>       int ret =3D 0;
>
>  -    trace_kvm_destroy_vcpu();
>  +    trace_kvm_destroy_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>
>       ret =3D kvm_arch_destroy_vcpu(cpu);
>       if (ret < 0) {
>  @@ -347,10 +387,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
>  >    }
>       }
>
>  -    vcpu =3D g_malloc0(sizeof(*vcpu));
>  -    vcpu->vcpu_id =3D kvm_arch_vcpu_id(cpu);
>  -    vcpu->kvm_fd =3D cpu->kvm_fd;
>  -    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
>  +    kvm_park_vcpu(cpu);
>   err:
>       return ret;
>   }
>  @@ -371,6 +408,8 @@ static int kvm_get_vcpu(KVMState *s, unsigned long v=
cpu_id)
>  >    if (cpu->vcpu_id =3D=3D vcpu_id) {
>  >        int kvm_fd;
>
>  +>       trace_kvm_get_vcpu(vcpu_id);
>
>  It's good if we add kvm_fd to trace.
>  It will be useful to cross verify kvm_get_vcpu's kvm_fd with parked vcpu=
.
>
> I can but I'm wondering why you've raised this? Perhaps, I'm not aware of=
 the
> interface you are using to configure the VMs and how traces across difere=
nt
> VMs get reflected. Please help in my understanding.
>
> This is to provide additional information only not specific to any
> interface to configure VMs.
>


Ok. sure.


Thanks
Salil.



> *Regards*,
>
> -Vishnu
>
>  +
>  >        QLIST_REMOVE(cpu, node);
>  >        kvm_fd =3D cpu->kvm_fd;
>  >        g_free(cpu);
>  @@ -378,7 +417,7 @@ static int kvm_get_vcpu(KVMState *s, unsigned long v=
cpu_id)
>  >    }
>       }
>
>  -    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
>  +    return -ENOENT;
>   }
>
>   int kvm_init_vcpu(CPUState *cpu, Error **errp)
>  @@ -389,19 +428,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
>
>       trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>
>  -    ret =3D kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
>  +    ret =3D kvm_create_vcpu(cpu);
>       if (ret < 0) {
>  -   error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu failed (%l=
u)",
>  +   error_setg_errno(errp, -ret,
>  +          "kvm_init_vcpu: kvm_create_vcpu failed (%lu)",
>
>             kvm_arch_vcpu_id(cpu));
>
>      goto err;
>       }
>
>  -    cpu->kvm_fd =3D ret;
>  -    cpu->kvm_state =3D s;
>  -    cpu->vcpu_dirty =3D true;
>  -    cpu->dirty_pages =3D 0;
>  -    cpu->throttle_us_per_full =3D 0;
>  -
>       mmap_size =3D kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
>       if (mmap_size < 0) {
>      ret =3D mmap_size;
>  diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
>  index a25902597b..5558cff0dc 100644
>  --- a/accel/kvm/trace-events
>  +++ b/accel/kvm/trace-events
>  @@ -9,6 +9,10 @@ kvm_device_ioctl(int fd, int type, void *arg) "dev fd %=
d, type 0x%x, arg %p"
>   kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to re=
trieve ONEREG %" PRIu64 " from KVM: %s"
>   kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to se=
t ONEREG %" PRIu64 " to KVM: %s"
>   kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: =
%lu"
>  +kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id=
: %lu"
>  +kvm_get_vcpu(unsigned long arch_cpu_id) "id: %lu"
>  +kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d i=
d: %lu"
>  +kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: =
%lu"
>   kvm_irqchip_commit_routes(void) ""
>   kvm_irqchip_add_msi_route(char *name, int vector, int virq) "dev %s vec=
tor %d virq %d"
>   kvm_irqchip_update_msi_route(int virq) "Updating MSI route virq=3D%d"
>  @@ -25,7 +29,6 @@ kvm_dirty_ring_reaper(const char *s) "%s"
>   kvm_dirty_ring_reap(uint64_t count, int64_t t) "reaped %"PRIu64" pages =
(took %"PRIi64" us)"
>   kvm_dirty_ring_reaper_kick(const char *reason) "%s"
>   kvm_dirty_ring_flush(int finished) "%d"
>  -kvm_destroy_vcpu(void) ""
>   kvm_failed_get_vcpu_mmap_size(void) ""
>   kvm_cpu_exec(void) ""
>   kvm_interrupt_exit_request(void) ""
>  diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
>  index fad9a7e8ff..2ed928aa71 100644
>  --- a/include/sysemu/kvm.h
>  +++ b/include/sysemu/kvm.h
>  @@ -435,6 +435,22 @@ void kvm_set_sigmask_len(KVMState *s, unsigned int =
sigmask_len);
>   int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
>  >  >  >  >  >       hwaddr *phys_addr);
>
>  +/**
>  + * kvm_create_vcpu - Gets a parked KVM vCPU or creates a KVM vCPU
>  + * @cpu: QOM CPUState object for which KVM vCPU has to be fetched/creat=
ed.
>  + *
>  + * @returns: 0 when success, errno (<0) when failed.
>  + */
>  +int kvm_create_vcpu(CPUState *cpu);
>  +
>  +/**
>  + * kvm_park_vcpu - Park QEMU KVM vCPU context
>  + * @cpu: QOM CPUState object for which QEMU KVM vCPU context has to be =
parked.
>  + *
>  + * @returns: none
>  + */
>  +void kvm_park_vcpu(CPUState *cpu);
>  +
>   #endif /* NEED_CPU_H */
>
>   void kvm_cpu_synchronize_state(CPUState *cpu);
>
>  Otherwise, Looks good to me.  Feel free to add
>  Reviewed-by: "Vishnu Pajjuri" mailto:vishnu@os.amperecomputing.com <vish=
nu@os.amperecomputing.com>
>  Thanks,
>
> Thanks.
> Salil
>
>
>
>
>  -Vishnu
>
>

--000000000000fc4fce0617dca4be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>HI Vishnu,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, May 7, 2024 at 12:39=E2=80=AFPM Vis=
hnu Pajjuri &lt;<a href=3D"mailto:vishnu@amperemail.onmicrosoft.com">vishnu=
@amperemail.onmicrosoft.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <p>Hi Salil,<br>
    </p>
    <div>On 03-05-2024 21:53, Salil Mehta wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>[EXTERNAL EMAIL NOTICE: This email originated from an external s=
ender. Please be mindful of safe email handling and proprietary information=
 protection practices.]


Hi Vishnu,

</pre>
      <blockquote type=3D"cite">
        <pre> From: Vishnu Pajjuri <a href=3D"mailto:vishnu@amperemail.onmi=
crosoft.com" target=3D"_blank">&lt;vishnu@amperemail.onmicrosoft.com&gt;</a=
>
 Sent: Thursday, April 4, 2024 3:00 PM
 Subject: Re: [PATCH V8 1/8] accel/kvm: Extract common KVM vCPU {creation,p=
arking} code

 Hi Salil,
</pre>
        <blockquote type=3D"cite">
          <pre> On 12-03-2024 07:29, Salil Mehta wrote:
 KVM vCPU creation is done once during the vCPU realization when Qemu vCPU =
thread
 is spawned. This is common to all the architectures as of now.

 Hot-unplug of vCPU results in destruction of the vCPU object in QOM but th=
e
 corresponding KVM vCPU object in the Host KVM is not destroyed as KVM does=
n&#39;t
 support vCPU removal. Therefore, its representative KVM vCPU object/contex=
t in
 Qemu is parked.

 Refactor architecture common logic so that some APIs could be reused by vC=
PU
 Hotplug code of some architectures likes ARM, Loongson etc. Update new/old=
 APIs
 with trace events instead of DPRINTF. No functional change is intended her=
e.

 Signed-off-by: Salil Mehta <a href=3D"mailto:salil.mehta@huawei.com" targe=
t=3D"_blank">mailto:salil.mehta@huawei.com</a>
 Reviewed-by: Gavin Shan <a href=3D"mailto:gshan@redhat.com" target=3D"_bla=
nk">mailto:gshan@redhat.com</a>
 Tested-by: Vishnu Pajjuri <a href=3D"mailto:vishnu@os.amperecomputing.com"=
 target=3D"_blank">mailto:vishnu@os.amperecomputing.com</a>
 Reviewed-by: Jonathan Cameron <a href=3D"mailto:Jonathan.Cameron@huawei.co=
m" target=3D"_blank">mailto:Jonathan.Cameron@huawei.com</a>
 Tested-by: Xianglai Li <a href=3D"mailto:lixianglai@loongson.cn" target=3D=
"_blank">mailto:lixianglai@loongson.cn</a>
 Tested-by: Miguel Luis <a href=3D"mailto:miguel.luis@oracle.com" target=3D=
"_blank">mailto:miguel.luis@oracle.com</a>
 Reviewed-by: Shaoqin Huang <a href=3D"mailto:shahuang@redhat.com" target=
=3D"_blank">mailto:shahuang@redhat.com</a>
 ---
  accel/kvm/kvm-all.c    | 64 ++++++++++++++++++++++++++++++++----------
  accel/kvm/trace-events |  5 +++-
  include/sysemu/kvm.h   | 16 +++++++++++
  3 files changed, 69 insertions(+), 16 deletions(-)

 diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
 index a8cecd040e..3bc3207bda 100644
 --- a/accel/kvm/kvm-all.c
 +++ b/accel/kvm/kvm-all.c
 @@ -126,6 +126,7 @@ static QemuMutex kml_slots_lock;
  #define kvm_slots_unlock()  qemu_mutex_unlock(&amp;kml_slots_lock)

  static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
 +static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id);

  static inline void kvm_resample_fd_remove(int gsi)
  {
 @@ -314,14 +315,53 @@ err:
 return ret;
  }

 +void kvm_park_vcpu(CPUState *cpu)
 +{
 +    struct KVMParkedVcpu *vcpu;
 +
 +    trace_kvm_park_vcpu(cpu-&gt;cpu_index, kvm_arch_vcpu_id(cpu));
</pre>
        </blockquote>
        <pre> It&#39;s good if we add kvm_fd to trace.
 It will be useful to cross verify kvm_get_vcpu()&#39;s kvm_fd with parked =
vcpu.
</pre>
      </blockquote>
      <pre>Agreed. But this is currently called in context to create and de=
stroy vCPU
where the trace already exists with the info you are seeking. Having
trace here might duplicate the info and end up increasing the noise.

Let me know if you think otherwise or have something else to add.</pre>
    </blockquote>
    <p>This is to provide additional information to the racing only.<br>
    </p>
    <p>The intention here is to trace mapping of vcpu_id&lt;--&gt;kvm_fd
      while parking</p>
    <p>and fetching vcpu. This way we can easily trace what is parked=C2=A0
      (kvm_park_vcpu()) vs fetched (kvm_get_vcpu())</p>
    <p>using pair of information.<br></p></div></blockquote><div><br></div>=
<div>Ok, No problem. I will.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div><p>
    </p>
    <blockquote type=3D"cite">
      <pre>Thanks


</pre>
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">
          <pre> +
 +    vcpu =3D g_malloc0(sizeof(*vcpu));
 +    vcpu-&gt;vcpu_id =3D kvm_arch_vcpu_id(cpu);
 +    vcpu-&gt;kvm_fd =3D cpu-&gt;kvm_fd;
 +    QLIST_INSERT_HEAD(&amp;kvm_state-&gt;kvm_parked_vcpus, vcpu, node);
 +}
 +
 +int kvm_create_vcpu(CPUState *cpu)
 +{
 +    unsigned long vcpu_id =3D kvm_arch_vcpu_id(cpu);
 +    KVMState *s =3D kvm_state;
 +    int kvm_fd;
 +
 +    trace_kvm_create_vcpu(cpu-&gt;cpu_index, kvm_arch_vcpu_id(cpu));
</pre>
        </blockquote>
        <pre> vcpu_id can be used instead of kvm_arch_vcpu_id(cpu).
</pre>
      </blockquote>
      <pre>KVM arch VCPU Id ensures that ID being traced is meaningful for =
that
architecture. The way CPU ID gets calculated in on different architectures
could be different. Hence, its value might be quite different.
</pre>
    </blockquote>
    <p>vcpu_id is already being calculated just above trace call.=C2=A0</p>
    <p>I don&#39;t think vcpu_id value gets differ by the time of tracing.<=
/p></div></blockquote><div><br></div><div>sure.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div>
    <blockquote type=3D"cite">
      <pre></pre>
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">
          <pre> +
 +    /* check if the KVM vCPU already exist but is parked */
 +    kvm_fd =3D kvm_get_vcpu(s, vcpu_id);
 +    if (kvm_fd &lt; 0) {
 +&gt;   /* vCPU not parked: create a new KVM vCPU */
 +&gt;   kvm_fd =3D kvm_vm_ioctl(s, KVM_CREATE_VCPU, vcpu_id);
 +&gt;   if (kvm_fd &lt; 0) {
 +&gt;       error_report(&quot;KVM_CREATE_VCPU IOCTL failed for vCPU %lu&q=
uot;, vcpu_id);
 +&gt;       return kvm_fd;
 +&gt;   }
 +    }
 +
 +    cpu-&gt;kvm_fd =3D kvm_fd;
 +    cpu-&gt;kvm_state =3D s;
 +    cpu-&gt;vcpu_dirty =3D true;
 +    cpu-&gt;dirty_pages =3D 0;
 +    cpu-&gt;throttle_us_per_full =3D 0;
 +
 +    return 0;
 +}
 +
  static int do_kvm_destroy_vcpu(CPUState *cpu)
  {
      KVMState *s =3D kvm_state;
      long mmap_size;
 -    struct KVMParkedVcpu *vcpu =3D NULL;
      int ret =3D 0;

 -    trace_kvm_destroy_vcpu();
 +    trace_kvm_destroy_vcpu(cpu-&gt;cpu_index, kvm_arch_vcpu_id(cpu));

      ret =3D kvm_arch_destroy_vcpu(cpu);
      if (ret &lt; 0) {
 @@ -347,10 +387,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
 &gt;    }
      }

 -    vcpu =3D g_malloc0(sizeof(*vcpu));
 -    vcpu-&gt;vcpu_id =3D kvm_arch_vcpu_id(cpu);
 -    vcpu-&gt;kvm_fd =3D cpu-&gt;kvm_fd;
 -    QLIST_INSERT_HEAD(&amp;kvm_state-&gt;kvm_parked_vcpus, vcpu, node);
 +    kvm_park_vcpu(cpu);
  err:
      return ret;
  }
 @@ -371,6 +408,8 @@ static int kvm_get_vcpu(KVMState *s, unsigned long vcp=
u_id)
 &gt;    if (cpu-&gt;vcpu_id =3D=3D vcpu_id) {
 &gt;        int kvm_fd;

 +&gt;       trace_kvm_get_vcpu(vcpu_id);
</pre>
        </blockquote>
        <pre> It&#39;s good if we add kvm_fd to trace.
 It will be useful to cross verify kvm_get_vcpu&#39;s kvm_fd with parked vc=
pu.
</pre>
      </blockquote>
      <pre>I can but I&#39;m wondering why you&#39;ve raised this? Perhaps,=
 I&#39;m not aware of the
interface you are using to configure the VMs and how traces across diferent
VMs get reflected. Please help in my understanding.
</pre>
    </blockquote>
    <p>This is to provide additional information only not specific to
      any interface to configure VMs.</p></div></blockquote><div><br></div>=
<div><br></div><div>Ok. sure.</div><div><br></div><div><br></div><div>Thank=
s</div><div>Salil.</div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div>
    <p><u>Regards</u>,</p>
    <p>-Vishnu<br>
    </p>
    <blockquote type=3D"cite">
      <pre></pre>
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">
          <pre> +
 &gt;        QLIST_REMOVE(cpu, node);
 &gt;        kvm_fd =3D cpu-&gt;kvm_fd;
 &gt;        g_free(cpu);
 @@ -378,7 +417,7 @@ static int kvm_get_vcpu(KVMState *s, unsigned long vcp=
u_id)
 &gt;    }
      }

 -    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
 +    return -ENOENT;
  }

  int kvm_init_vcpu(CPUState *cpu, Error **errp)
 @@ -389,19 +428,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)

      trace_kvm_init_vcpu(cpu-&gt;cpu_index, kvm_arch_vcpu_id(cpu));

 -    ret =3D kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
 +    ret =3D kvm_create_vcpu(cpu);
      if (ret &lt; 0) {
 -   error_setg_errno(errp, -ret, &quot;kvm_init_vcpu: kvm_get_vcpu failed =
(%lu)&quot;,
 +   error_setg_errno(errp, -ret,
 +          &quot;kvm_init_vcpu: kvm_create_vcpu failed (%lu)&quot;,
</pre>
        </blockquote>
        <pre>            kvm_arch_vcpu_id(cpu));
</pre>
        <blockquote type=3D"cite">
          <pre>     goto err;
      }

 -    cpu-&gt;kvm_fd =3D ret;
 -    cpu-&gt;kvm_state =3D s;
 -    cpu-&gt;vcpu_dirty =3D true;
 -    cpu-&gt;dirty_pages =3D 0;
 -    cpu-&gt;throttle_us_per_full =3D 0;
 -
      mmap_size =3D kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
      if (mmap_size &lt; 0) {
     ret =3D mmap_size;
 diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
 index a25902597b..5558cff0dc 100644
 --- a/accel/kvm/trace-events
 +++ b/accel/kvm/trace-events
 @@ -9,6 +9,10 @@ kvm_device_ioctl(int fd, int type, void *arg) &quot;dev f=
d %d, type 0x%x, arg %p&quot;
  kvm_failed_reg_get(uint64_t id, const char *msg) &quot;Warning: Unable to=
 retrieve ONEREG %&quot; PRIu64 &quot; from KVM: %s&quot;
  kvm_failed_reg_set(uint64_t id, const char *msg) &quot;Warning: Unable to=
 set ONEREG %&quot; PRIu64 &quot; to KVM: %s&quot;
  kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) &quot;index: %d i=
d: %lu&quot;
 +kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id) &quot;index: %d=
 id: %lu&quot;
 +kvm_get_vcpu(unsigned long arch_cpu_id) &quot;id: %lu&quot;
 +kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) &quot;index: %=
d id: %lu&quot;
 +kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) &quot;index: %d i=
d: %lu&quot;
  kvm_irqchip_commit_routes(void) &quot;&quot;
  kvm_irqchip_add_msi_route(char *name, int vector, int virq) &quot;dev %s =
vector %d virq %d&quot;
  kvm_irqchip_update_msi_route(int virq) &quot;Updating MSI route virq=3D%d=
&quot;
 @@ -25,7 +29,6 @@ kvm_dirty_ring_reaper(const char *s) &quot;%s&quot;
  kvm_dirty_ring_reap(uint64_t count, int64_t t) &quot;reaped %&quot;PRIu64=
&quot; pages (took %&quot;PRIi64&quot; us)&quot;
  kvm_dirty_ring_reaper_kick(const char *reason) &quot;%s&quot;
  kvm_dirty_ring_flush(int finished) &quot;%d&quot;
 -kvm_destroy_vcpu(void) &quot;&quot;
  kvm_failed_get_vcpu_mmap_size(void) &quot;&quot;
  kvm_cpu_exec(void) &quot;&quot;
  kvm_interrupt_exit_request(void) &quot;&quot;
 diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
 index fad9a7e8ff..2ed928aa71 100644
 --- a/include/sysemu/kvm.h
 +++ b/include/sysemu/kvm.h
 @@ -435,6 +435,22 @@ void kvm_set_sigmask_len(KVMState *s, unsigned int si=
gmask_len);
  int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
 &gt;  &gt;  &gt;  &gt;  &gt;       hwaddr *phys_addr);

 +/**
 + * kvm_create_vcpu - Gets a parked KVM vCPU or creates a KVM vCPU
 + * @cpu: QOM CPUState object for which KVM vCPU has to be fetched/created=
.
 + *
 + * @returns: 0 when success, errno (&lt;0) when failed.
 + */
 +int kvm_create_vcpu(CPUState *cpu);
 +
 +/**
 + * kvm_park_vcpu - Park QEMU KVM vCPU context
 + * @cpu: QOM CPUState object for which QEMU KVM vCPU context has to be pa=
rked.
 + *
 + * @returns: none
 + */
 +void kvm_park_vcpu(CPUState *cpu);
 +
  #endif /* NEED_CPU_H */

  void kvm_cpu_synchronize_state(CPUState *cpu);
</pre>
        </blockquote>
        <pre> Otherwise, Looks good to me.  Feel free to add
 Reviewed-by: &quot;Vishnu Pajjuri&quot; <a href=3D"mailto:vishnu@os.ampere=
computing.com" target=3D"_blank">mailto:vishnu@os.amperecomputing.com</a>
 Thanks,
</pre>
      </blockquote>
      <pre>Thanks.
Salil



</pre>
      <blockquote type=3D"cite">
        <pre> -Vishnu
</pre>
      </blockquote>
      <pre></pre>
    </blockquote>
  </div>

</blockquote></div></div>

--000000000000fc4fce0617dca4be--
