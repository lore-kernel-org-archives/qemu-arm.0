Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1263276njf;
        Fri, 16 Aug 2024 08:50:49 -0700 (PDT)
X-Received: by 2002:a05:6402:510f:b0:59e:b95d:e744 with SMTP id 4fb4d7f45d1cf-5beca75597dmr2541900a12.29.1723823449673;
        Fri, 16 Aug 2024 08:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723823449; cv=none;
        d=google.com; s=arc-20160816;
        b=0kvUQBWeijU1AJ9QTVz5blYS2QzDcT26wbyP/KaUFlBpv89pmKZPx/FzGgyCqjLSMG
         RUvmN307nr3AkHA6xjdyT56te1kd6w2rJ65kXhWooq70aqOMwoENmGV1iojZdIpVLuiu
         M97lQcc3U5hE69rWWkzIjgP9qLeVSwwhzm93orRR3sWpG6e4HeUyh1Inb0dc1EiGrU4m
         P1WA/5XJ+Qi6kez+7pBoNVlxEfO+hUNclBeuhTZA3IJNHN3szX4nUVunsjebkHh/YMoL
         yXjyfVoV3cdpVZVYS6AUodCJcDxlvGCs0N/uas8VMvFQ6x2eXyWYbdXALLZInYLzyz6A
         AhkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rO2VVv+jqWNvTEkWJWzvHa+RzRFCb0oR03+xq6f+JrI=;
        fh=3joUD2mEBFAp8B8MrB7ayM9KKHMA2E8I/SwDIYvYd4Q=;
        b=df+mzRZgYEzVl0Oi/6v2sRSbgKJKCOJ+NY5jHVCyHENOxMjJqRae/QdJibtCZqlUf/
         I2qxUVUTFysY5RqMMOK77qAhpv5JunauSaaWkFQ8gFnQNZ3WqsQpllC21Y5sO7+uvguy
         +jFFXzuMl+avYrKbQvTLMdmELFnIrpNeAOcEwrgJzPnjuzfDWlfl4Bova944ig7ba2J9
         tRoaRjPYZQe+TofhM/eDJ+pVAZsHgvI5DMS31/JPHQBEu8Q+uAZgI0ukXDhOOaeLbqbT
         UuBwPWXKh8a/bKN9bIw7009j8VCY90sPBvZ/j1KA++qWTea36WJ+jBzG63HEfr8W2e5q
         yoBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Anq7FU99;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5bebbdf2092sor811310a12.4.2024.08.16.08.50.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Aug 2024 08:50:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Anq7FU99;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723823449; x=1724428249; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rO2VVv+jqWNvTEkWJWzvHa+RzRFCb0oR03+xq6f+JrI=;
        b=Anq7FU99aUEuRMgBGFMXBbHWgjVQLcA5UA1gFIR82vIJvW6VRWi0B6mZkERyZk70w5
         DAyy6h/Ml6/p7OpRjD5fo+R0JDsYHDCv24vT2ZJATQpL8s3YzBj5RnsWO1LENjQoQw3z
         oJ8WekEKjSLbEwjmpU7ct2Z/+9iNHjMqWYonmG6IiEbzmTaTWzKqrBKBZCv6c2EScMML
         ifkK2IbW5eknD+yGJfM7E6OvqvhQiEu2eTOj95XfKq9nx8fFYHM2m+tJQf1cNEAOWQ2b
         3VSaN3IxEBNUxawCNEwT8iImceMQJrTMTeV2HvsVh8MByKyJdzxy60h+w6Rjhnb/6j3n
         rwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723823449; x=1724428249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rO2VVv+jqWNvTEkWJWzvHa+RzRFCb0oR03+xq6f+JrI=;
        b=FxVhvvvQ40QeMNI6fR4qtyprI9IgJ0nTdRdpJKP1LVaRXAWSHG3ljoP9WrzP8IZT9d
         /guCfIFTyCO3Xt3ctROWDBYSjEuto3wvg+XL5+kqWmcEvKLQNNZuLU5404fgauVm7W+q
         JvbQNcw8J+7aOBmzrxsmMPmekSZdsihIfIQYNKx5/4a5ADBwnUj4AMJyFHYPUsD0FVnI
         UQpOXncF0H33vK69DZx4hm6UvjeoURjnbW0EsiAaK6vXZ/jVwTzMWMuw3NNVdhWt7dmW
         RWmA9sQJmPGa+urPv3F5/HTDUITKZpnfbz2JU95gZHBG9enPppKBupS1Q+B8lJd9A/kt
         pzoA==
X-Gm-Message-State: AOJu0YzseNa6KJtZ14nCebw5MWw/MrkeD0m4e+bEG+1dh6T9tX04FL8x
	QJ2hWJim92BHdKIiAP01UFTDCYeeueGof3ei8JYjOO8cMDibtx3Lh4ws0VGZxQHVK+Y6WEKW3wG
	rIRSjmk5nNlGIO0pKVmnHJOCNCLgD6jTMYcVpAsUBerkEdezAKzE=
X-Google-Smtp-Source: AGHT+IHIPeGhhc/g4WyYTayKU5+A3kVN8m/nYqxm2rrx+9FNvYIgajZruMHjcMqg+zqzrSYGZ76blvB442XFuKJRX5A=
X-Received: by 2002:a05:6402:524d:b0:58c:eee0:48f4 with SMTP id
 4fb4d7f45d1cf-5beca78d2d0mr2138274a12.31.1723823448850; Fri, 16 Aug 2024
 08:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-25-salil.mehta@huawei.com> <87v800wkb1.fsf@draig.linaro.org>
In-Reply-To: <87v800wkb1.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Aug 2024 16:50:37 +0100
Message-ID: <CAFEAcA9A9Oq0nURkiLNWZNC=P7KQGyr8TjjfOmEq+squwF+xog@mail.gmail.com>
Subject: Re: [PATCH RFC V3 24/29] target/arm: Add support of *unrealize*
 ARMCPU during vCPU Hot-unplug
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	mst@redhat.com, maz@kernel.org, jean-philippe@linaro.org, 
	jonathan.cameron@huawei.com, lpieralisi@kernel.org, 
	richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev, 
	david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org, 
	ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com, 
	gshan@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com, 
	npiggin@gmail.com, harshpb@linux.ibm.com, linux@armlinux.org.uk, 
	darren@os.amperecomputing.com, ilkka@os.amperecomputing.com, 
	vishnu@os.amperecomputing.com, karl.heubaum@oracle.com, 
	miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com, 
	wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com, 
	maobibo@loongson.cn, lixianglai@loongson.cn, shahuang@redhat.com, 
	zhao1.liu@intel.com, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: HYiskJ3ZjoFS

On Fri, 16 Aug 2024 at 16:37, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Salil Mehta <salil.mehta@huawei.com> writes:
>
> > vCPU Hot-unplug will result in QOM CPU object unrealization which will =
do away
> > with all the vCPU thread creations, allocations, registrations that hap=
pened
> > as part of the realization process. This change introduces the ARM CPU =
unrealize
> > function taking care of exactly that.
> >
> > Note, initialized KVM vCPUs are not destroyed in host KVM but their Qem=
u context
> > is parked at the QEMU KVM layer.
> >
> > Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > Reported-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > [VP: Identified CPU stall issue & suggested probable fix]
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > ---
> >  target/arm/cpu.c       | 101 +++++++++++++++++++++++++++++++++++++++++
> >  target/arm/cpu.h       |  14 ++++++
> >  target/arm/gdbstub.c   |   6 +++
> >  target/arm/helper.c    |  25 ++++++++++
> >  target/arm/internals.h |   3 ++
> >  target/arm/kvm.c       |   5 ++
> >  6 files changed, 154 insertions(+)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index c92162fa97..a3dc669309 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -157,6 +157,16 @@ void arm_register_pre_el_change_hook(ARMCPU *cpu, =
ARMELChangeHookFn *hook,
> >      QLIST_INSERT_HEAD(&cpu->pre_el_change_hooks, entry, node);
> >  }
> >
> > +void arm_unregister_pre_el_change_hooks(ARMCPU *cpu)
> > +{
> > +    ARMELChangeHook *entry, *next;
> > +
> > +    QLIST_FOREACH_SAFE(entry, &cpu->pre_el_change_hooks, node, next) {
> > +        QLIST_REMOVE(entry, node);
> > +        g_free(entry);
> > +    }
> > +}
> > +
> >  void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
> >                                   void *opaque)
> >  {
> > @@ -168,6 +178,16 @@ void arm_register_el_change_hook(ARMCPU *cpu, ARME=
LChangeHookFn *hook,
> >      QLIST_INSERT_HEAD(&cpu->el_change_hooks, entry, node);
> >  }
> >
> > +void arm_unregister_el_change_hooks(ARMCPU *cpu)
> > +{
> > +    ARMELChangeHook *entry, *next;
> > +
> > +    QLIST_FOREACH_SAFE(entry, &cpu->el_change_hooks, node, next) {
> > +        QLIST_REMOVE(entry, node);
> > +        g_free(entry);
> > +    }
> > +}
> > +
> >  static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque=
)
> >  {
> >      /* Reset a single ARMCPRegInfo register */
> > @@ -2552,6 +2572,85 @@ static void arm_cpu_realizefn(DeviceState *dev, =
Error **errp)
> >      acc->parent_realize(dev, errp);
> >  }
> >
> > +static void arm_cpu_unrealizefn(DeviceState *dev)
> > +{
> > +    ARMCPUClass *acc =3D ARM_CPU_GET_CLASS(dev);
> > +    ARMCPU *cpu =3D ARM_CPU(dev);
> > +    CPUARMState *env =3D &cpu->env;
> > +    CPUState *cs =3D CPU(dev);
> > +    bool has_secure;
> > +
> > +    has_secure =3D cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECU=
RITY);
> > +
> > +    /* rock 'n' un-roll, whatever happened in the arm_cpu_realizefn cl=
eanly */
> > +    cpu_address_space_destroy(cs, ARMASIdx_NS);
>
> On current master this will fail:
>
> ../../target/arm/cpu.c: In function =E2=80=98arm_cpu_unrealizefn=E2=80=99=
:
> ../../target/arm/cpu.c:2626:5: error: implicit declaration of function =
=E2=80=98cpu_address_space_destroy=E2=80=99 [-Werror=3Dimplicit-function-de=
claration]
>  2626 |     cpu_address_space_destroy(cs, ARMASIdx_NS);
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
> ../../target/arm/cpu.c:2626:5: error: nested extern declaration of =E2=80=
=98cpu_address_space_destroy=E2=80=99 [-Werror=3Dnested-externs]
> cc1: all warnings being treated as errors

We shouldn't need to explicitly call cpu_address_space_destroy()
from a target-specific unrealize anyway: we can do it all
from the base class (and I think this would fix some
leaks in current code for targets that hot-unplug, though
I should check that). Otherwise you need to duplicate all
the logic for figuring out which address spaces we created
in realize, which is fragile and not necessary when all we
want to do is "delete every address space the CPU object has"
and we want to do that for every target architecture always.

-- PMM
