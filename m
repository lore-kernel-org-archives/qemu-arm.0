Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2631203njb;
        Mon, 21 Oct 2024 13:50:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEBu5sniEwjhiLqRYaTsOokSDiYuAGCyU+Fa1vwz4cHoFbvphreHMkvGs6xruXKxpuBUfJvT6KIwdpcQ==@linaro.org
X-Received: by 2002:a17:907:3f09:b0:a9a:8a4:e090 with SMTP id a640c23a62f3a-a9a69c8fcf9mr1259089266b.50.1729543854347;
        Mon, 21 Oct 2024 13:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729543854; cv=none;
        d=google.com; s=arc-20240605;
        b=isXbg1apTWucw2uG8BWQq2vgJN4M1gVjZ4FkEqCJwmyMHdIYzVtN31eikFYZcRCtp0
         1V9FUBRKXAVSaknUgtxa5kv6knHq5vMvlgMpBhxGaBYMYiSL3qCbQFegvRC9v7f5X8J7
         MrK8iCxRBdpOkuSNBHM3NvdGkpdCr0/kdTe7jV3ueR4NXOcsI6yEkCAjBtcilhXWgca4
         mPSY8Z7JR36h7Uj379GWC+ysOWzp4DsFgJ3yjD9EtEIvWWKS1UD5+ucyOAblHywb3Dct
         HczR5tMqc2vtA1vCLz2/vSulGcIliAyL/jkbp3P6dpjvjHuI+JwDjJNBUKkWkrxKsgm+
         c0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8q2NamfBIbVqpI4ZHSeAC88TgZJI2rdwW4uqz4TtG2Y=;
        fh=eAI2DHGcbZmyo9zAV0vzI0HeX2EGNqJ9YcouePlH4K0=;
        b=eaX4ikDFVnujrdWEn5nj+vNR2dJvLwHkUNTOgHo61dJ8uX6Ns+VparJ2c1X/zqRdQU
         syobqE8LeW/8JPZO8P+FPof9Q42DgaQl58PTnk5fDbUK1dfIFxNJwt5cB/Lh1T7tk2KA
         3KLDE2qushsjfte+LHO9YhThVIlxxE0eg8nAlgE3yZWHAEIIlpzd3GKMUJnz9+IOgpKG
         r3YM03jy1jlGYhI5H2CmX9Ng5FaBfRS8yE6cRBfNtas7+YvwMcvBzhXeMAai/za5tx75
         z4C3LSE9nzLTn/QzPKzcdp8CjJQ5ZMzI2QzPaX0nKIPMdnwAuvmYxBHyJ3Md2gHqPHqU
         Y/bw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=Zd6kzjoZ;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a9aae67197fsor2879066b.0.2024.10.21.13.50.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Oct 2024 13:50:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=Zd6kzjoZ;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1729543854; x=1730148654; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8q2NamfBIbVqpI4ZHSeAC88TgZJI2rdwW4uqz4TtG2Y=;
        b=Zd6kzjoZ490riwBqiKWRtjvnmtw9VttvTkp7junQt0z+PDKmypLT6miFkB1mMFb0p6
         JDVnAFLcAMU41GGyTbDQakH7W3IfZp+ueRcpI9JFQEpD4tWOqlet+yuEGC2fwcodBjdV
         NG9N4BGiV4r6dmNdDkCV/VxnO66M2Sukx81Lyc1o3HWR669dDr45cOhu5Ip9zfiGGlE3
         I7zEpXLXdjLI/jz6NYBJYBPaYtyu6FJTe9wv4ux3JAwF6vZX2n4sF54+AEvta9QjTdfe
         vWC4DvcFMT5BFzx3ZhmMVMBpIjgrmx7ahMXy6yvhG9uwvIU53OwNhbwXESSaYWNg0/M3
         dyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729543854; x=1730148654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8q2NamfBIbVqpI4ZHSeAC88TgZJI2rdwW4uqz4TtG2Y=;
        b=V953SIuH91tkSIbp+GXI1xOEwhmLsZiF+4jFWujhZGA4s6h3Q3h76b1O5lVqP7zd9Z
         YPrX9xXPYCN6epnaP9Hg1gaCdyKuX/7LNOnDFmQL3lQ8MvU7ZfhSF4ngM1PIZgRgfR9l
         imFy0L2Beu2jrsYjknAGykZe22dtjY59qeAE/uYqvBENFUlexAc53UgahqxQXj5MQHWb
         KzPOspp5r7zC8+jhdIgDibwVtp//9w+ZQcRkkPhtNORj+ZFtmBfBwtZOl9dGhULGYcio
         wYvME4SoimsedxpMrdxYM2//t023pZpstRqLDzdrPmG2pHP9EZAbWU+aEryAzApOAwyX
         YKMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT5543o/euwFKLfp5h4XGiqJZJOJbHmUfrTJfZcQHEW30pZRqIvI2ng/LN1GxrNri1QWCGpyNC93urxA==@linaro.org
X-Gm-Message-State: AOJu0YytdekduZrD0wtOtSz9Y5d0ZYX3VTUSpE117CPjk5V6IfFVLCSw
	Io0hMyca/Q4o6HQXqgXhiApr0zsl1PNsUfEsBzYvLLGCCjjMAFu3L5DP3BSVY0FEE8qEQTqGmg4
	3oYEn/ovN/Cvzt5qkjSkcLUqPjHegMJ0nlNVKRw==
X-Google-Smtp-Source: AGHT+IHr0iqSqfHEWtpaZvJ30Gd68ushob7e0bCwNr5L1+5A5J9XwHZXGVZl/qpJmmRXGCQkxb7j1+ra/1kQDVUeVu0=
X-Received: by 2002:a17:907:7b85:b0:a9a:b70:2a7c with SMTP id
 a640c23a62f3a-a9a69a7627fmr1404435766b.25.1729543853516; Mon, 21 Oct 2024
 13:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241014192205.253479-1-salil.mehta@huawei.com>
 <20241014192205.253479-2-salil.mehta@huawei.com> <2d4a0d78-f3cc-4644-a9ea-d02114c242b8@linaro.org>
In-Reply-To: <2d4a0d78-f3cc-4644-a9ea-d02114c242b8@linaro.org>
From: Salil Mehta <salil.mehta@opnsrc.net>
Date: Mon, 21 Oct 2024 21:50:41 +0100
Message-ID: <CAJ7pxeZuH+ZDAy09CUCxt3toNKF0z=VW8VZnQNjzDVKXNg1k5Q@mail.gmail.com>
Subject: Re: [PATCH V1 1/4] hw/acpi: Initialize ACPI Hotplug CPU Status with
 Support for vCPU `Persistence`
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	mst@redhat.com, maz@kernel.org, jean-philippe@linaro.org, 
	jonathan.cameron@huawei.com, lpieralisi@kernel.org, peter.maydell@linaro.org, 
	richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev, 
	david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org, 
	ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com, 
	gshan@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com, 
	alex.bennee@linaro.org, npiggin@gmail.com, harshpb@linux.ibm.com, 
	linux@armlinux.org.uk, darren@os.amperecomputing.com, 
	ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com, 
	karl.heubaum@oracle.com, miguel.luis@oracle.com, zhukeqian1@huawei.com, 
	wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com, 
	maobibo@loongson.cn, lixianglai@loongson.cn, shahuang@redhat.com, 
	zhao1.liu@intel.com, linuxarm@huawei.com
Content-Type: multipart/alternative; boundary="000000000000034382062502cf65"
X-TUID: kIKj2jP3vLb5

--000000000000034382062502cf65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Gustavo,

On Wed, Oct 16, 2024 at 10:01=E2=80=AFPM Gustavo Romero <gustavo.romero@lin=
aro.org>
wrote:

> Hi Salil,
>
> On 10/14/24 16:22, Salil Mehta wrote:
> > Certain CPU architecture specifications [1][2][3] prohibit changes to C=
PU
> > presence after the kernel has booted. This limitation exists because
> many system
> > initializations rely on the exact CPU count at boot time and do not
> expect it to
> > change later. For example, components like interrupt controllers, which
> are
> > closely tied to CPUs, or various per-CPU features, may not support
> configuration
> > changes once the kernel has been initialized. This presents a challenge
> for
> > virtualization features such as vCPU hotplug.
> >
> > To address this issue, introduce an `is_enabled` state in the
> `AcpiCpuStatus`,
> > which reflects whether a vCPU has been hot-plugged or hot-unplugged in
> QEMU,
> > marking it as (un)available in the Guest Kernel. The `is_present` state
> should
> > be set based on the `acpi_persistent` flag. In cases where unplugged
> vCPUs need
> > to be deliberately simulated in the ACPI to maintain a persistent view
> of vCPUs,
> > this flag ensures the guest kernel continues to see those vCPUs.
> >
> > Additionally, introduce an `acpi_persistent` property that can be used =
to
> > initialize the ACPI vCPU presence state accordingly. Architectures
> requiring
> > ACPI to expose a persistent view of vCPUs can override its default
> value. Refer
> > to the patch-set implelenting vCPU hotplug support for ARM for more
> details on
>
> nit: implementation
>

Thanks


>
>
> Cheers,
> Gustavo
>
> > its usage.
> >
> > References:
> > [1] KVMForum 2023 Presentation: Challenges Revisited in Supporting Virt
> CPU Hotplug on
> >      architectures that don=E2=80=99t Support CPU Hotplug (like ARM64)
> >      a. Kernel Link:
> https://kvm-forum.qemu.org/2023/KVM-forum-cpu-hotplug_7OJ1YyJ.pdf
> >      b. Qemu Link:
> https://kvm-forum.qemu.org/2023/Challenges_Revisited_in_Supporting_Virt_C=
PU_Hotplug_-__ii0iNb3.pdf
> > [2] KVMForum 2020 Presentation: Challenges in Supporting Virtual CPU
> Hotplug on
> >      SoC Based Systems (like ARM64)
> >      Link: https://kvmforum2020.sched.com/event/eE4m
> > [3] Check comment 5 in the bugzilla entry
> >      Link: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4481#c5
> >
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > ---
> >   cpu-target.c          |  1 +
> >   hw/acpi/cpu.c         | 35 ++++++++++++++++++++++++++++++++++-
> >   include/hw/acpi/cpu.h | 21 +++++++++++++++++++++
> >   include/hw/core/cpu.h | 21 +++++++++++++++++++++
> >   4 files changed, 77 insertions(+), 1 deletion(-)
> >
> > diff --git a/cpu-target.c b/cpu-target.c
> > index 499facf774..c8a29ab495 100644
> > --- a/cpu-target.c
> > +++ b/cpu-target.c
> > @@ -200,6 +200,7 @@ static Property cpu_common_props[] =3D {
> >        */
> >       DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
> >                        MemoryRegion *),
> > +    DEFINE_PROP_BOOL("acpi-persistent", CPUState, acpi_persistent,
> false),
> >   #endif
> >       DEFINE_PROP_END_OF_LIST(),
> >   };
> > diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> > index 5cb60ca8bc..083c4010c2 100644
> > --- a/hw/acpi/cpu.c
> > +++ b/hw/acpi/cpu.c
> > @@ -225,7 +225,40 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object
> *owner,
> >       state->dev_count =3D id_list->len;
> >       state->devs =3D g_new0(typeof(*state->devs), state->dev_count);
> >       for (i =3D 0; i < id_list->len; i++) {
> > -        state->devs[i].cpu =3D  CPU(id_list->cpus[i].cpu);
> > +        struct CPUState *cpu =3D CPU(id_list->cpus[i].cpu);
> > +        /*
> > +         * In most architectures, CPUs that are marked as ACPI
> 'present' are
> > +         * also ACPI 'enabled' by default. These states remain
> consistent at
> > +         * both the QOM and ACPI levels.
> > +         */
> > +        if (cpu) {
> > +            state->devs[i].is_enabled =3D true;
> > +            state->devs[i].is_present =3D true;
> > +            state->devs[i].cpu =3D cpu;
> > +        } else {
> > +            state->devs[i].is_enabled =3D false;
> > +            /*
> > +             * In some architectures, even 'unplugged' or 'disabled'
> QOM CPUs
> > +             * may be exposed as ACPI 'present.' This approach provide=
s
> a
> > +             * persistent view of the vCPUs to the guest kernel. This
> could be
> > +             * due to an architectural constraint that requires every
> per-CPU
> > +             * component to be present at boot time, meaning the exact
> count of
> > +             * vCPUs must be known and cannot be altered after the
> kernel has
> > +             * booted. As a result, the vCPU states at the QOM and ACP=
I
> levels
> > +             * might become inconsistent. However, in such cases, the
> presence
> > +             * of vCPUs has been deliberately simulated at the ACPI
> level.
> > +             */
> > +            if (acpi_persistent_cpu(first_cpu)) {
> > +                state->devs[i].is_present =3D true;
> > +                /*
> > +                 * `CPUHotplugState::AcpiCpuStatus::cpu` becomes
> insignificant
> > +                 * in this case
> > +                 */
> > +            } else {
> > +                state->devs[i].is_present =3D false;
> > +                state->devs[i].cpu =3D cpu;
> > +            }
> > +        }
> >           state->devs[i].arch_id =3D id_list->cpus[i].arch_id;
> >       }
> >       memory_region_init_io(&state->ctrl_reg, owner, &cpu_hotplug_ops,
> state,
> > diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> > index 32654dc274..bd3f9973c9 100644
> > --- a/include/hw/acpi/cpu.h
> > +++ b/include/hw/acpi/cpu.h
> > @@ -26,6 +26,8 @@ typedef struct AcpiCpuStatus {
> >       uint64_t arch_id;
> >       bool is_inserting;
> >       bool is_removing;
> > +    bool is_present;
> > +    bool is_enabled;
> >       bool fw_remove;
> >       uint32_t ost_event;
> >       uint32_t ost_status;
> > @@ -75,4 +77,23 @@ extern const VMStateDescription vmstate_cpu_hotplug;
> >       VMSTATE_STRUCT(cpuhp, state, 1, \
> >                      vmstate_cpu_hotplug, CPUHotplugState)
> >
> > +/**
> > + * acpi_persistent_cpu:
> > + * @cpu: The vCPU to check
> > + *
> > + * Checks if the vCPU state should always be reflected as *present* vi=
a
> ACPI
> > + * to the Guest. By default, this is False on all architectures and ha=
s
> to be
> > + * explicity set during initialization.
> > + *
> > + * Returns: True if it is ACPI 'persistent' CPU
> > + *
> > + */
> > +static inline bool acpi_persistent_cpu(CPUState *cpu)
> > +{
> > +    /*
> > +     * returns if 'Presence' of the vCPU is persistent and should be
> simulated
> > +     * via ACPI even after vCPUs have been unplugged in QOM
> > +     */
> > +    return cpu && cpu->acpi_persistent;
> > +}
> >   #endif
> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index 04e9ad4996..299e96c45b 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> > @@ -542,6 +542,27 @@ struct CPUState {
> >       CPUPluginState *plugin_state;
> >   #endif
> >
> > +    /*
> > +     * To implement the vCPU hotplug feature (which simulates CPU
> hotplug
> > +     * behavior), we need to dynamically create and destroy QOM vCPU
> objects,
> > +     * and (de)associate them with pre-existing KVM vCPUs while
> (un)parking the
> > +     * KVM vCPU context. One challenge is ensuring that these
> dynamically
> > +     * appearing or disappearing QOM vCPU objects are accurately
> reflected
> > +     * through ACPI to the Guest Kernel. Due to architectural
> constraints,
> > +     * changing the number of vCPUs after the guest kernel has booted
> may not
> > +     * always be possible.
> > +     *
> > +     * In certain architectures, to provide the guest kernel with a
> *persistent*
> > +     * view of vCPU presence, even when the QOM does not have a
> corresponding
> > +     * vCPU object, ACPI may simulate the presence of vCPUs by marking
> them as
> > +     * ACPI-disabled. This is achieved by setting `_STA.PRES=3DTrue` a=
nd
> > +     * `_STA.Ena=3DFalse` for unplugged vCPUs in QEMU's QOM.
> > +     *
> > +     * By default, this flag is set to `FALSE`, and it must be
> explicitly set
> > +     * to `TRUE` for architectures like ARM.
> > +     */
> > +    bool acpi_persistent;
> > +
> >       /* TODO Move common fields from CPUArchState here. */
> >       int cpu_index;
> >       int cluster_index;
>
>

--000000000000034382062502cf65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">HI Gustavo,</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 16, 2024 at 10:01=
=E2=80=AFPM Gustavo Romero &lt;<a href=3D"mailto:gustavo.romero@linaro.org"=
>gustavo.romero@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hi Salil,<br>
<br>
On 10/14/24 16:22, Salil Mehta wrote:<br>
&gt; Certain CPU architecture specifications [1][2][3] prohibit changes to =
CPU<br>
&gt; presence after the kernel has booted. This limitation exists because m=
any system<br>
&gt; initializations rely on the exact CPU count at boot time and do not ex=
pect it to<br>
&gt; change later. For example, components like interrupt controllers, whic=
h are<br>
&gt; closely tied to CPUs, or various per-CPU features, may not support con=
figuration<br>
&gt; changes once the kernel has been initialized. This presents a challeng=
e for<br>
&gt; virtualization features such as vCPU hotplug.<br>
&gt; <br>
&gt; To address this issue, introduce an `is_enabled` state in the `AcpiCpu=
Status`,<br>
&gt; which reflects whether a vCPU has been hot-plugged or hot-unplugged in=
 QEMU,<br>
&gt; marking it as (un)available in the Guest Kernel. The `is_present` stat=
e should<br>
&gt; be set based on the `acpi_persistent` flag. In cases where unplugged v=
CPUs need<br>
&gt; to be deliberately simulated in the ACPI to maintain a persistent view=
 of vCPUs,<br>
&gt; this flag ensures the guest kernel continues to see those vCPUs.<br>
&gt; <br>
&gt; Additionally, introduce an `acpi_persistent` property that can be used=
 to<br>
&gt; initialize the ACPI vCPU presence state accordingly. Architectures req=
uiring<br>
&gt; ACPI to expose a persistent view of vCPUs can override its default val=
ue. Refer<br>
&gt; to the patch-set implelenting vCPU hotplug support for ARM for more de=
tails on<br>
<br>
nit: implementation<br></blockquote><div><br></div><div>Thanks</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
Cheers,<br>
Gustavo<br>
<br>
&gt; its usage.<br>
&gt; <br>
&gt; References:<br>
&gt; [1] KVMForum 2023 Presentation: Challenges Revisited in Supporting Vir=
t CPU Hotplug on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 architectures that don=E2=80=99t Support CPU Hotpl=
ug (like ARM64)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 a. Kernel Link: <a href=3D"https://kvm-forum.qemu.=
org/2023/KVM-forum-cpu-hotplug_7OJ1YyJ.pdf" rel=3D"noreferrer" target=3D"_b=
lank">https://kvm-forum.qemu.org/2023/KVM-forum-cpu-hotplug_7OJ1YyJ.pdf</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 b. Qemu Link:=C2=A0 <a href=3D"https://kvm-forum.q=
emu.org/2023/Challenges_Revisited_in_Supporting_Virt_CPU_Hotplug_-__ii0iNb3=
.pdf" rel=3D"noreferrer" target=3D"_blank">https://kvm-forum.qemu.org/2023/=
Challenges_Revisited_in_Supporting_Virt_CPU_Hotplug_-__ii0iNb3.pdf</a><br>
&gt; [2] KVMForum 2020 Presentation: Challenges in Supporting Virtual CPU H=
otplug on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SoC Based Systems (like ARM64)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Link: <a href=3D"https://kvmforum2020.sched.com/ev=
ent/eE4m" rel=3D"noreferrer" target=3D"_blank">https://kvmforum2020.sched.c=
om/event/eE4m</a><br>
&gt; [3] Check comment 5 in the bugzilla entry<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Link: <a href=3D"https://bugzilla.tianocore.org/sh=
ow_bug.cgi?id=3D4481#c5" rel=3D"noreferrer" target=3D"_blank">https://bugzi=
lla.tianocore.org/show_bug.cgi?id=3D4481#c5</a><br>
&gt; <br>
&gt; Signed-off-by: Salil Mehta &lt;<a href=3D"mailto:salil.mehta@huawei.co=
m" target=3D"_blank">salil.mehta@huawei.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0cpu-target.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +=
<br>
&gt;=C2=A0 =C2=A0hw/acpi/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 35 ++++++=
++++++++++++++++++++++++++++-<br>
&gt;=C2=A0 =C2=A0include/hw/acpi/cpu.h | 21 +++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0include/hw/core/cpu.h | 21 +++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A04 files changed, 77 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/cpu-target.c b/cpu-target.c<br>
&gt; index 499facf774..c8a29ab495 100644<br>
&gt; --- a/cpu-target.c<br>
&gt; +++ b/cpu-target.c<br>
&gt; @@ -200,6 +200,7 @@ static Property cpu_common_props[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_LINK(&quot;memory&quot;, CPUStat=
e, memory, TYPE_MEMORY_REGION,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 MemoryRegion *),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;acpi-persistent&quot;, CPUState,=
 acpi_persistent, false),<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>
&gt;=C2=A0 =C2=A0};<br>
&gt; diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c<br>
&gt; index 5cb60ca8bc..083c4010c2 100644<br>
&gt; --- a/hw/acpi/cpu.c<br>
&gt; +++ b/hw/acpi/cpu.c<br>
&gt; @@ -225,7 +225,40 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object=
 *owner,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;dev_count =3D id_list-&gt;len;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;devs =3D g_new0(typeof(*state-&gt;=
devs), state-&gt;dev_count);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; id_list-&gt;len; i++) {=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;devs[i].cpu =3D=C2=A0 CPU(id_li=
st-&gt;cpus[i].cpu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct CPUState *cpu =3D CPU(id_list-&gt;=
cpus[i].cpu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* In most architectures, CPUs that =
are marked as ACPI &#39;present&#39; are<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* also ACPI &#39;enabled&#39; by de=
fault. These states remain consistent at<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* both the QOM and ACPI levels.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;devs[i].is_enable=
d =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;devs[i].is_presen=
t =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;devs[i].cpu =3D c=
pu;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;devs[i].is_enable=
d =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* In some architectur=
es, even &#39;unplugged&#39; or &#39;disabled&#39; QOM CPUs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* may be exposed as A=
CPI &#39;present.&#39; This approach provides a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* persistent view of =
the vCPUs to the guest kernel. This could be<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* due to an architect=
ural constraint that requires every per-CPU<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* component to be pre=
sent at boot time, meaning the exact count of<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* vCPUs must be known=
 and cannot be altered after the kernel has<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* booted. As a result=
, the vCPU states at the QOM and ACPI levels<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* might become incons=
istent. However, in such cases, the presence<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* of vCPUs has been d=
eliberately simulated at the ACPI level.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (acpi_persistent_cpu(fir=
st_cpu)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;dev=
s[i].is_present =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* `CPUH=
otplugState::AcpiCpuStatus::cpu` becomes insignificant<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* in th=
is case<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;dev=
s[i].is_present =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;dev=
s[i].cpu =3D cpu;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;devs[i].arch_id =3D =
id_list-&gt;cpus[i].arch_id;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_init_io(&amp;state-&gt;ctrl_re=
g, owner, &amp;cpu_hotplug_ops, state,<br>
&gt; diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h<br>
&gt; index 32654dc274..bd3f9973c9 100644<br>
&gt; --- a/include/hw/acpi/cpu.h<br>
&gt; +++ b/include/hw/acpi/cpu.h<br>
&gt; @@ -26,6 +26,8 @@ typedef struct AcpiCpuStatus {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t arch_id;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_inserting;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_removing;<br>
&gt; +=C2=A0 =C2=A0 bool is_present;<br>
&gt; +=C2=A0 =C2=A0 bool is_enabled;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool fw_remove;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ost_event;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ost_status;<br>
&gt; @@ -75,4 +77,23 @@ extern const VMStateDescription vmstate_cpu_hotplug=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_STRUCT(cpuhp, state, 1, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 vmstate_cpu_hotplug, CPUHotplugState)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/**<br>
&gt; + * acpi_persistent_cpu:<br>
&gt; + * @cpu: The vCPU to check<br>
&gt; + *<br>
&gt; + * Checks if the vCPU state should always be reflected as *present* v=
ia ACPI<br>
&gt; + * to the Guest. By default, this is False on all architectures and h=
as to be<br>
&gt; + * explicity set during initialization.<br>
&gt; + *<br>
&gt; + * Returns: True if it is ACPI &#39;persistent&#39; CPU<br>
&gt; + *<br>
&gt; + */<br>
&gt; +static inline bool acpi_persistent_cpu(CPUState *cpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* returns if &#39;Presence&#39; of the vCPU is pe=
rsistent and should be simulated<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* via ACPI even after vCPUs have been unplugged i=
n QOM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 return cpu &amp;&amp; cpu-&gt;acpi_persistent;<br>
&gt; +}<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt; diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h<br>
&gt; index 04e9ad4996..299e96c45b 100644<br>
&gt; --- a/include/hw/core/cpu.h<br>
&gt; +++ b/include/hw/core/cpu.h<br>
&gt; @@ -542,6 +542,27 @@ struct CPUState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPUPluginState *plugin_state;<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* To implement the vCPU hotplug feature (which si=
mulates CPU hotplug<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* behavior), we need to dynamically create and de=
stroy QOM vCPU objects,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* and (de)associate them with pre-existing KVM vC=
PUs while (un)parking the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* KVM vCPU context. One challenge is ensuring tha=
t these dynamically<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* appearing or disappearing QOM vCPU objects are =
accurately reflected<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* through ACPI to the Guest Kernel. Due to archit=
ectural constraints,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* changing the number of vCPUs after the guest ke=
rnel has booted may not<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* always be possible.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* In certain architectures, to provide the guest =
kernel with a *persistent*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* view of vCPU presence, even when the QOM does n=
ot have a corresponding<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* vCPU object, ACPI may simulate the presence of =
vCPUs by marking them as<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* ACPI-disabled. This is achieved by setting `_ST=
A.PRES=3DTrue` and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* `_STA.Ena=3DFalse` for unplugged vCPUs in QEMU&=
#39;s QOM.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* By default, this flag is set to `FALSE`, and it=
 must be explicitly set<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* to `TRUE` for architectures like ARM.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 bool acpi_persistent;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO Move common fields from CPUArchState=
 here. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int cpu_index;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int cluster_index;<br>
<br>
</blockquote></div></div>

--000000000000034382062502cf65--
