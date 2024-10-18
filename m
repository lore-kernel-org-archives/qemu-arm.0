Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp843468njb;
        Fri, 18 Oct 2024 07:11:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXRx2grc7s+q/+0bWENx4ZLoI5qdBCdcCd0yDRXpK8P1U3tch1fQxk6rarPCHT50qPVu47d2lSHdhiGQ==@linaro.org
X-Google-Smtp-Source: AGHT+IELA0RCUIJ9CUyV5GZZbpV3IuGKVitaPVntXYYpIMyyaIVjnM9S4m/1inGmfzQZOdsXQXH7
X-Received: by 2002:a05:6830:6e03:b0:710:fa7e:e002 with SMTP id 46e09a7af769-7181a5c54cdmr3397534a34.5.1729260684483;
        Fri, 18 Oct 2024 07:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729260684; cv=none;
        d=google.com; s=arc-20240605;
        b=DtReAGnyPbBqBCL9pXhYZ4OKLgsekNrukjYEkTaRo6DVzZrZKn9CjL5birm0NDft81
         GH3OBhAy4t65tbglOfeknPWdih5J4bIbjrxnCOkuoOQiLVAtS0nsy1nYahBdpw2sTlxy
         /JpFD4fjpBkTJZMw1mMyo3rZA/jlf8mmgmOn4lEkq75tnjwggzhYXo8tP1yXjrFeA/8F
         K4xF7wneNudTE/OZIrs9UYQvXERvrBmtZcHKB6qqVLQxs6hgsNneLWWzxjfC68pW9bi3
         1r63YqHxFP1gaZir114BzqowXS0Vq/m7moMf+1Nld+of3L7ArDkf/cdQlHl5Fl32Shfv
         P9EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=jZh2xXAf4qzHFAByEdnKiUV0w4MQ7s3wQws/cJyvNRU=;
        fh=M4Dca51DwiEyG0T8CqDtflL4ZLifr4QvcTQ5QH+5oSs=;
        b=DZf6yaQRJT9tOQevgdCLy1j8jyItbZhb3uytKIKqqqbic0f62oCfJT4vHf7Yb88XBk
         v3Vo3uhjh/5SnWhSII9zr/bwWHSWvaYbFH/cQPuWUZBwD7UQJfWYncOwwh6YkJ5QOKCz
         WO/HYh0ShWoRSwrtlYgJzhVfck6Oh+CwX1UWbgwPv6FO57B8oEzjgC1zVLjg05V3dyne
         GZdX+8my8VZXYjEC5zaT5P1S56GA11lZk7aqgOPVc8CkrLK+6zL1o9iSKPKe5GUzzl80
         VsMQoKlYqVVcueQr037w7OFifCJD/l8+RxL4gVASegynLQ+UaQJuWIg7KdIUD/K6EheB
         Z6Ig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d2LcIg5L;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a5d6438af6si269993137.498.2024.10.18.07.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d2LcIg5L;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729260682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jZh2xXAf4qzHFAByEdnKiUV0w4MQ7s3wQws/cJyvNRU=;
	b=d2LcIg5LLH0/yRAw6q0Caqoat3BNrEaENAtYE2H9K1uZ+YuB7MQn6yWheFPuzBO6tSBJVd
	8jeFUs5naVvbI/pu+WVEyKHQCYxDPG53Bw8cnOtr1xmRTNHenIylYtAoU4FI6+YBNSObIe
	7WgJOfGwrdQ/ET7i0zzkFSe0WK/tIJI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-ZOYMk9BCOByespB1qrVuUg-1; Fri, 18 Oct 2024 10:11:20 -0400
X-MC-Unique: ZOYMk9BCOByespB1qrVuUg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43125f45783so13568105e9.2
        for <alex.bennee@linaro.org>; Fri, 18 Oct 2024 07:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729260679; x=1729865479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgvhvDdtCmsUD/KgWeQxIcE0+T0Nh/yiAA0xiqa0wqM=;
        b=B4+6MttnWc4vYtorAR128JcLl+Ul20Cu81XtcUAy7Kdz5WEWeymW3s3gspVcGOveVF
         d/iwT66jTwkR/aGzyDM2mrr30r/Iq6tQr3i6WtqJRTXxoqnlGId9CI9ntTn0qdaEJAIX
         JEXqk+zxX44pcQBockilc1ySXNOHe+WgCM1SCDWq8/zszHuHrSWPc2mAnYP8vuK6/UWu
         QszN+pAASAeDtN8wA0VABt4T/gOOq0Z2PzCCNEOgmqs1SeidThjKvC6rljfqd2Gx9v6F
         qbOxbD4Vw6cn/NTYj+cJuVkmQqZ/hx8578NDvI4HxmgzuM/77KyqKCuryyEDBmPLwh96
         pS+g==
X-Forwarded-Encrypted: i=1; AJvYcCXydAoKVk1isDA122hX0pHlML6wdEz9DzqNgM6oRJpzxnEtFNW+dJQXr82us26/Sfxqmlg7JedPQW7MWQ==@linaro.org
X-Gm-Message-State: AOJu0YwYa6YeWmrPDE7+5A1Lkn6TXogZ1AMcx8xdDNH0yLIqRuEZ0z7V
	sPZ473hNght5y2e5a0M8ulwc3aKacvuJSkYh7enEhPKtODgjZcJXKrtm+eoxP/Hrq7hluAPH1i3
	+qphX4sDuI2CKmRzgQ8GPIdbAalFrd9+vzH62v5VIvhlC/N8agujBtg==
X-Received: by 2002:a05:600c:468a:b0:431:3a6d:b84a with SMTP id 5b1f17b1804b1-43161633c8amr15979125e9.4.1729260679295;
        Fri, 18 Oct 2024 07:11:19 -0700 (PDT)
X-Received: by 2002:a05:600c:468a:b0:431:3a6d:b84a with SMTP id 5b1f17b1804b1-43161633c8amr15978615e9.4.1729260678676;
        Fri, 18 Oct 2024 07:11:18 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf027b58sm2082444f8f.6.2024.10.18.07.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:11:18 -0700 (PDT)
Date: Fri, 18 Oct 2024 16:11:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>,
 <maz@kernel.org>, <jean-philippe@linaro.org>,
 <jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <andrew.jones@linux.dev>, <david@redhat.com>, <philmd@linaro.org>,
 <eric.auger@redhat.com>, <will@kernel.org>, <ardb@kernel.org>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <gshan@redhat.com>,
 <rafael@kernel.org>, <borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
 <npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <shahuang@redhat.com>, <zhao1.liu@intel.com>,
 <linuxarm@huawei.com>, <gustavo.romero@linaro.org>
Subject: Re: [PATCH V1 1/4] hw/acpi: Initialize ACPI Hotplug CPU Status with
 Support for vCPU `Persistence`
Message-ID: <20241018161116.73b12156@imammedo.users.ipa.redhat.com>
In-Reply-To: <20241014192205.253479-2-salil.mehta@huawei.com>
References: <20241014192205.253479-1-salil.mehta@huawei.com>
	<20241014192205.253479-2-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: spU7OHfL/Var

On Mon, 14 Oct 2024 20:22:02 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> Certain CPU architecture specifications [1][2][3] prohibit changes to CPU
                                          ^^^^^^^^^
these do not point to specs but never mind

> presence after the kernel has booted. This limitation exists because many=
 system
> initializations rely on the exact CPU count at boot time and do not expec=
t it to
> change later. For example, components like interrupt controllers, which a=
re
> closely tied to CPUs, or various per-CPU features, may not support config=
uration
> changes once the kernel has been initialized. This presents a challenge f=
or
> virtualization features such as vCPU hotplug.

well, x86 (incl cpu,interrupt ctrls) also doesn't have architectural hotplu=
g.
It's just OEM managed to implement it regardless and then bothered to make
OS changes to work with that.
It's just ARM community doesn't want to go there at this point of time
but using above reasoning as justification for this series doesn't look goo=
d to me.

So what ARM would like to support is not CPU hotplug but rather a fixed
system with standby CPUs (that can be powered on/off on demand).
With ACPI spec amended to support that (MADT present/enabled changes), it's
good enough reason to add 'enabled' handling to acpi cpu-hotplug code inste=
ad
of inventing alternative one that would do almost the same.

But lets get rid of (can't/may not) language above and use standby CPUs rea=
soning
to avoid any confusion.

PS:
I'm taking about hw hotplug (at QEMU level) and not kernel hotplug
(where it's at logical cpu level).

> To address this issue, introduce an `is_enabled` state in the `AcpiCpuSta=
tus`,
> which reflects whether a vCPU has been hot-plugged or hot-unplugged in QE=
MU,
> marking it as (un)available in the Guest Kernel.=20
good so far

> The `is_present` state should
> be set based on the `acpi_persistent` flag. In cases where unplugged vCPU=
s need
> to be deliberately simulated in the ACPI to maintain a persistent view of=
 vCPUs,
> this flag ensures the guest kernel continues to see those vCPUs.

that's where I have to disagree, vCPU is present when a corresponding QOM o=
bject
exists. Faking it's presence will only confuse at the end.

I get that you want to reuse device_add/del interface, but that leads to
pulling the leg here and there to make thing fit. That in short therm
(while someone remembers all tricks) might work for some, but long therm
it's not sustainable).

Maybe instead of pushing device_add/del, we should rather implement
standby CPU model here, as ARM folks expect it to be.
i.e. instead of device_add/del add 'enabled' property to ARM vCPU,
and let management to turn on/off vCPUs on demand.
(and very likely this model could be reused by other sock based platforms)
For end-user it would be the same as device_add/del (i.e. vCPU becomes usab=
le/unsable)

I'd bet it would simplify your ARM CPU hotplug series a lot,
since you won't have to fake vCPU object lifetime and do
non trivial tricks to make it all work.
Which it turn will make ARM hotplug series much more approachable
for reviewers /and whomever comes later across that code/.

Regardless of said, we would still need changes to ACPI cphp code,
see my comments inline.


> Additionally, introduce an `acpi_persistent` property that can be used to
> initialize the ACPI vCPU presence state accordingly. Architectures requir=
ing
> ACPI to expose a persistent view of vCPUs can override its default value.=
 Refer
> to the patch-set implelenting vCPU hotplug support for ARM for more detai=
ls on
> its usage.
>=20
> References:
> [1] KVMForum 2023 Presentation: Challenges Revisited in Supporting Virt C=
PU Hotplug on
>     architectures that don=E2=80=99t Support CPU Hotplug (like ARM64)
>     a. Kernel Link: https://kvm-forum.qemu.org/2023/KVM-forum-cpu-hotplug=
_7OJ1YyJ.pdf
>     b. Qemu Link:  https://kvm-forum.qemu.org/2023/Challenges_Revisited_i=
n_Supporting_Virt_CPU_Hotplug_-__ii0iNb3.pdf
> [2] KVMForum 2020 Presentation: Challenges in Supporting Virtual CPU Hotp=
lug on
>     SoC Based Systems (like ARM64)
>     Link: https://kvmforum2020.sched.com/event/eE4m
> [3] Check comment 5 in the bugzilla entry
>     Link: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4481#c5
>=20
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>  cpu-target.c          |  1 +
>  hw/acpi/cpu.c         | 35 ++++++++++++++++++++++++++++++++++-
>  include/hw/acpi/cpu.h | 21 +++++++++++++++++++++
>  include/hw/core/cpu.h | 21 +++++++++++++++++++++
>  4 files changed, 77 insertions(+), 1 deletion(-)
>=20
> diff --git a/cpu-target.c b/cpu-target.c
> index 499facf774..c8a29ab495 100644
> --- a/cpu-target.c
> +++ b/cpu-target.c
> @@ -200,6 +200,7 @@ static Property cpu_common_props[] =3D {
>       */
>      DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
>                       MemoryRegion *),
> +    DEFINE_PROP_BOOL("acpi-persistent", CPUState, acpi_persistent, false=
),

I agree with Gavin, it's not CPU property/business, but a platform one.

Pass it as argument to cpu_hotplug_hw_init(),
and maybe rename to always_present.
Then make sure that it's configurable in GED (which calls the function),
and just turn it on for arm/virt machine.
Other platforms might want to use x86 approach with GED and have
vCPU actually disappearing. /loongson and maybe risc-v/

>  #endif
>      DEFINE_PROP_END_OF_LIST(),
>  };
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 5cb60ca8bc..083c4010c2 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -225,7 +225,40 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *o=
wner,
>      state->dev_count =3D id_list->len;
>      state->devs =3D g_new0(typeof(*state->devs), state->dev_count);
>      for (i =3D 0; i < id_list->len; i++) {
> -        state->devs[i].cpu =3D  CPU(id_list->cpus[i].cpu);
> +        struct CPUState *cpu =3D CPU(id_list->cpus[i].cpu);
> +        /*
> +         * In most architectures, CPUs that are marked as ACPI 'present'=
 are
> +         * also ACPI 'enabled' by default. These states remain consisten=
t at
> +         * both the QOM and ACPI levels.
> +         */
> +        if (cpu) {
> +            state->devs[i].is_enabled =3D true;
> +            state->devs[i].is_present =3D true;
> +            state->devs[i].cpu =3D cpu;
> +        } else {
> +            state->devs[i].is_enabled =3D false;
> +            /*
> +             * In some architectures, even 'unplugged' or 'disabled' QOM=
 CPUs
> +             * may be exposed as ACPI 'present.' This approach provides =
a
> +             * persistent view of the vCPUs to the guest kernel. This co=
uld be
> +             * due to an architectural constraint that requires every pe=
r-CPU
> +             * component to be present at boot time, meaning the exact c=
ount of
> +             * vCPUs must be known and cannot be altered after the kerne=
l has
> +             * booted. As a result, the vCPU states at the QOM and ACPI =
levels
> +             * might become inconsistent. However, in such cases, the pr=
esence
> +             * of vCPUs has been deliberately simulated at the ACPI leve=
l.
> +             */

if cpus are not 'simulated', you will not need comments explaining that all
over place and whole hunk would likely go away.

> +            if (acpi_persistent_cpu(first_cpu)) {
> +                state->devs[i].is_present =3D true;
> +                /*
> +                 * `CPUHotplugState::AcpiCpuStatus::cpu` becomes insigni=
ficant
> +                 * in this case
> +                 */
> +            } else {
> +                state->devs[i].is_present =3D false;
> +                state->devs[i].cpu =3D cpu;
> +            }
> +        }
>          state->devs[i].arch_id =3D id_list->cpus[i].arch_id;
>      }
>      memory_region_init_io(&state->ctrl_reg, owner, &cpu_hotplug_ops, sta=
te,
> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> index 32654dc274..bd3f9973c9 100644
> --- a/include/hw/acpi/cpu.h
> +++ b/include/hw/acpi/cpu.h
> @@ -26,6 +26,8 @@ typedef struct AcpiCpuStatus {
>      uint64_t arch_id;
>      bool is_inserting;
>      bool is_removing;
> +    bool is_present;
with always_present, it might be better to move field to CPUHotplugState
as it's not per vCPU anymore, and in standby case state->devs[i].cpu
should work as implicit present flag. (see below wrt doc first comment)

> +    bool is_enabled;
I'd move introduction of this field into a separate patch.

BTW: new ABI/fields accessible by guest should be described in
docs/specs/acpi_cpu_hotplug.rst.
It would be better to have the spec as patch 1st, that we all agree on
and then follow with implementation.
And also include there an expected workflow for standby case.=20

>      bool fw_remove;
>      uint32_t ost_event;
>      uint32_t ost_status;
> @@ -75,4 +77,23 @@ extern const VMStateDescription vmstate_cpu_hotplug;
>      VMSTATE_STRUCT(cpuhp, state, 1, \
>                     vmstate_cpu_hotplug, CPUHotplugState)
> =20
> +/**
> + * acpi_persistent_cpu:
> + * @cpu: The vCPU to check
> + *
> + * Checks if the vCPU state should always be reflected as *present* via =
ACPI
> + * to the Guest. By default, this is False on all architectures and has =
to be
> + * explicity set during initialization.
> + *
> + * Returns: True if it is ACPI 'persistent' CPU
> + *
> + */
> +static inline bool acpi_persistent_cpu(CPUState *cpu)
> +{
> +    /*
> +     * returns if 'Presence' of the vCPU is persistent and should be sim=
ulated
> +     * via ACPI even after vCPUs have been unplugged in QOM
> +     */
> +    return cpu && cpu->acpi_persistent;
> +}
>  #endif
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 04e9ad4996..299e96c45b 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -542,6 +542,27 @@ struct CPUState {
>      CPUPluginState *plugin_state;
>  #endif
> =20
> +    /*
> +     * To implement the vCPU hotplug feature (which simulates CPU hotplu=
g
> +     * behavior), we need to dynamically create and destroy QOM vCPU obj=
ects,
> +     * and (de)associate them with pre-existing KVM vCPUs while (un)park=
ing the
> +     * KVM vCPU context. One challenge is ensuring that these dynamicall=
y
> +     * appearing or disappearing QOM vCPU objects are accurately reflect=
ed
> +     * through ACPI to the Guest Kernel. Due to architectural constraint=
s,
> +     * changing the number of vCPUs after the guest kernel has booted ma=
y not
> +     * always be possible.
> +     *
> +     * In certain architectures, to provide the guest kernel with a *per=
sistent*
> +     * view of vCPU presence, even when the QOM does not have a correspo=
nding
> +     * vCPU object, ACPI may simulate the presence of vCPUs by marking t=
hem as
> +     * ACPI-disabled. This is achieved by setting `_STA.PRES=3DTrue` and
> +     * `_STA.Ena=3DFalse` for unplugged vCPUs in QEMU's QOM.
> +     *
> +     * By default, this flag is set to `FALSE`, and it must be explicitl=
y set
> +     * to `TRUE` for architectures like ARM.
> +     */
> +    bool acpi_persistent;
> +
>      /* TODO Move common fields from CPUArchState here. */
>      int cpu_index;
>      int cluster_index;
