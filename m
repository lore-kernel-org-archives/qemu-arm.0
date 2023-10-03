Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1887627ejb;
        Tue, 3 Oct 2023 04:05:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8Mo25eIARBs+FfssGAxTNDDMovCN4U292Ukic1PB/jRfY1MGHPTXCWeMPGJTPDUHluEDq
X-Received: by 2002:a7b:cb86:0:b0:402:f55e:ac11 with SMTP id m6-20020a7bcb86000000b00402f55eac11mr13783371wmi.20.1696331113751;
        Tue, 03 Oct 2023 04:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696331113; cv=none;
        d=google.com; s=arc-20160816;
        b=J12c7kGKCxwKRqTqJTVYryQAm3F48R0SdsrxJ7mN5yhy4RyptKpsfC5gwiif2/eOR1
         TChvQMwy8Y+t47HAKUaDWUortxGiZ/E5uIMrs1khFhFRHwgxJ96gX1c81jyeDt41f7nN
         Hfw64rCHY77jRCz9PPHzo+nEdoKCfaB/Ngs1t9D6kUueDxJBvm6PSbt3+sF3xwtdzTN6
         Zq88gxcDEV/xnJfTEkzu+zZ491yQbZ0wOcQufOs6Y72Y9e4EySSYgiJmbz+WXYe14yfS
         tb/qFfvs9qHyuWWZCoSgjg3cZ/xfwT6yAZKsKC3Mjhb4POJSsFylwMh95a8V+empJiTH
         Y5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=zQha6CuCHKXwAXAQkKZ9wFl585cZYY8Q/ayEG0C+Hko=;
        fh=7ClhMSyX8VLsf+4fXGm2a1j5PzlUyMO+epTSYFeQdDs=;
        b=ZvfJFtydFwXoDD+RKFbs1KKFX4lhdFg5Chc9DIavFlGNiUBz6KeIZIoZzHVJqPNbXP
         tZXcjE+8OLQTPvMFNYBlWYfx0EtkKZUdd5SKqRbb0VDgJBawQ0JJ7y7H74tfe2rzk8pY
         ecROt2szd6kEkUTb9JYF/1Z9Rwv7IgnC3lvT3YKQ7cUV7Hgw4W2GZpKu8ciTmW1uJHsD
         eCHar9CG4UWt203e0EcnmrvLOfmiSvvzrcyl/SKSTZkQ5AYKCmzwwAqrqvWsAtuP4pW4
         Zjix1/5OCWh+m4iGJKAozAVfRh5EaqK5jEmi9THGNAWyyXsgczXq+4tH0zSEzDdZH4if
         TNXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id fk8-20020a05600c0cc800b004054922ea1csi639304wmb.5.2023.10.03.04.05.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:05:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0FMz0vlLz67G90;
	Tue,  3 Oct 2023 19:05:03 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100001.china.huawei.com (7.191.160.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 12:05:11 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 12:05:11 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH V2 01/10] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Topic: [PATCH V2 01/10] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Index: AQHZ8zPpn9wpwkR00kGhOJ6dnPJS7rA2mfgAgAFHXwA=
Date: Tue, 3 Oct 2023 11:05:11 +0000
Message-ID: <761a05a972ae4aa088b8e984bd89889f@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-2-salil.mehta@huawei.com>
 <20231002165322.00003a2e@Huawei.com>
In-Reply-To: <20231002165322.00003a2e@Huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: 9TJ4k8dKfT4P

Hi Jonathan,

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Monday, October 2, 2023 4:53 PM
> To: Salil Mehta <salil.mehta@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; maz@kernel.org; jean-
> philippe@linaro.org; lpieralisi@kernel.org; peter.maydell@linaro.org;
> richard.henderson@linaro.org; imammedo@redhat.com; andrew.jones@linux.dev=
;
> david@redhat.com; philmd@linaro.org; eric.auger@redhat.com;
> oliver.upton@linux.dev; pbonzini@redhat.com; mst@redhat.com;
> will@kernel.org; gshan@redhat.com; rafael@kernel.org;
> alex.bennee@linaro.org; linux@armlinux.org.uk;
> darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
> vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
> miguel.luis@oracle.com; salil.mehta@opnsrc.net; zhukeqian
> <zhukeqian1@huawei.com>; wangxiongfeng (C) <wangxiongfeng2@huawei.com>;
> wangyanan (Y) <wangyanan55@huawei.com>; jiakernel2@gmail.com;
> maobibo@loongson.cn; lixianglai@loongson.cn; Linuxarm <linuxarm@huawei.co=
m>
> Subject: Re: [PATCH V2 01/10] accel/kvm: Extract common KVM vCPU
> {creation,parking} code
>=20
> On Sat, 30 Sep 2023 01:19:24 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>=20
> > KVM vCPU creation is done once during the initialization of the VM when=
 Qemu
> > threads are spawned. This is common to all the architectures.
> >
> > Hot-unplug of vCPU results in destruction of the vCPU objects in QOM bu=
t
> > the KVM vCPU objects in the Host KVM are not destroyed and their repres=
entative
> > KVM vCPU objects/context in Qemu are parked.
> >
> > Refactor common logic so that some APIs could be reused by vCPU Hotplug=
 code.
> >
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>=20
> Hi Salil,
>=20
> A few trivial things inline, plus a question about why
> cpu->cpu_index can now be used but kvm_arch_vcpu_id(cpu);
> was previously needed.

Good point. I used the API because it was returning
'unsigned long' and it was being used across the archs.
I thought maybe the size of the index could vary across
archs. For example, for PowerPC above API returns vcpu_id
which presumably could have different data type than
an 'integer'.

But after Alex's comment, I was made to believe that this
assumption might not be correct and CPU index is an
'integer' across archs and perhaps semantics of above
API is not correct.

But perhaps original code was functionally correct?


> >  accel/kvm/kvm-all.c  | 63 +++++++++++++++++++++++++++++++++-----------
> >  include/sysemu/kvm.h | 14 ++++++++++
> >  2 files changed, 61 insertions(+), 16 deletions(-)
> >
> > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > index ff1578bb32..b8c36ba50a 100644
> > --- a/accel/kvm/kvm-all.c
> > +++ b/accel/kvm/kvm-all.c
> > @@ -80,7 +80,7 @@
> >  #endif
> >
> >  struct KVMParkedVcpu {
> > -    unsigned long vcpu_id;
> > +    int vcpu_id;
> >      int kvm_fd;
> >      QLIST_ENTRY(KVMParkedVcpu) node;
> >  };
> > @@ -137,6 +137,7 @@ static QemuMutex kml_slots_lock;
> >  #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
> >
> >  static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
> > +static int kvm_get_vcpu(KVMState *s, int vcpu_id);
> >
> >  static inline void kvm_resample_fd_remove(int gsi)
> >  {
> > @@ -320,11 +321,49 @@ err:
> >      return ret;
> >  }
> >
> > +void kvm_park_vcpu(CPUState *cpu)
> > +{
> > +    int vcpu_id =3D cpu->cpu_index;
> > +    struct KVMParkedVcpu *vcpu;
> > +
> > +    vcpu =3D g_malloc0(sizeof(*vcpu));
> > +    vcpu->vcpu_id =3D vcpu_id;
>=20
> As vcpu_id is only used here why have the local variable?
> Maybe that changes in later patches, in which case ignore this.
>=20
>     vcpu->vcpu_id =3D cpu->cpu_index;


Yes, thanks.


>=20
> Why is kvm_arch_vcpu_id() not necessary here any more but was
> before?


Because I have now changed the type of vcpu_id from 'unsigned long'
to an 'integer'.

>=20
> > +    vcpu->kvm_fd =3D cpu->kvm_fd;
> > +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> > +}
> > +
> > +int kvm_create_vcpu(CPUState *cpu)
> > +{
> > +    int vcpu_id =3D cpu->cpu_index;
>=20
> See below. I'm not sure why it's safe not to use kvm_arch_vcpu_id()
> Seems a few architectures have less than trivial implementations of
> that function currently.

I doubt this as well. Other architectures like PowerPC are returning
different type?


> > +    KVMState *s =3D kvm_state;
> > +    int kvm_fd;
> > +
> > +    DPRINTF("kvm_create_vcpu\n");
> > +
> > +    /* check if the KVM vCPU already exist but is parked */
> > +    kvm_fd =3D kvm_get_vcpu(s, vcpu_id);
> > +    if (kvm_fd < 0) {
> > +        /* vCPU not parked: create a new KVM vCPU */
> > +        kvm_fd =3D kvm_vm_ioctl(s, KVM_CREATE_VCPU, vcpu_id);
> > +        if (kvm_fd < 0) {
> > +            error_report("KVM_CREATE_VCPU IOCTL failed for vCPU %d", v=
cpu_id);
> > +            return kvm_fd;
> > +        }
> > +    }
> > +
> > +    cpu->vcpu_dirty =3D true;
> > +    cpu->kvm_fd =3D kvm_fd;
> > +    cpu->kvm_state =3D s;
> > +    cpu->dirty_pages =3D 0;
> > +    cpu->throttle_us_per_full =3D 0;
>=20
> Trivial but I would have maintained the order wrt to the code removed
> below just to avoid a reviewer having to check the two bits of code
> do the same thing after the reorder.


I can do that. No problem.


[...]

> >  int kvm_init_vcpu(CPUState *cpu, Error **errp)
> > @@ -395,19 +431,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
> >
> >      trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> >
> > -    ret =3D kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
> > +    ret =3D kvm_create_vcpu(cpu);
>=20
> The switch from kvm_arch_vcpu_id(cpu) to using
> int vcpu_id =3D cpu->cpu_index;
>=20
> Seems like a functional change on some arch.


Yes, but then we need to revert to original change inside the
new kvm_create_vcpu() API.


> >      if (ret < 0) {
> > -        error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu fail=
ed
> (%lu)",
> > +        error_setg_errno(errp, -ret,
> > +                         "kvm_init_vcpu: kvm_create_vcpu failed (%lu)"=
,
>=20
> The rewrap of the lines above seems like an unrelated change.

Function has changed from kvm_get_vcpu to kvm_create_vcpu

[...]

> > diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> > index ee9025f8e9..785f3ed083 100644
> > --- a/include/sysemu/kvm.h
> > +++ b/include/sysemu/kvm.h
> > @@ -464,6 +464,20 @@ void kvm_set_sigmask_len(KVMState *s, unsigned int
> sigmask_len);
> >
> >  int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
> >                                         hwaddr *phys_addr);
> > +/**
> > + * kvm_create_vcpu - Gets a parked KVM vCPU or creates a KVM vCPU
> > + * @cpu:  QOM CPUState object for which KVM vCPU has to be
> created/fetched.
>=20
> Extra space before QOM (same below)

:)

>=20
> > + *
> > + * @returns: 0 when success, errno (<0) when failed.
> > + */
> > +int kvm_create_vcpu(CPUState *cpu);
>=20
> Blank line here perhaps.

Ok.


>=20
> > +/**
> > + * kvm_park_vcpu - Gets a parked KVM vCPU if it exists
> > + * @cpu:  QOM CPUState object for which parked KVM vCPU has to be
> fetched.
>=20
> We aren't returning anything, so why fetch?

copy-paste comment error, I think. Thanks!

cheers
Salil.
