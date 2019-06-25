Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4975560wrg;
        Tue, 25 Jun 2019 06:35:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyna+gsrmnXPto0U1nSJYqbJevqy7uMEhCP2LSpi2ZulDD7WyBgSLVTrCICdUrkIavpQ2Lj
X-Received: by 2002:a37:a5d5:: with SMTP id o204mr51900774qke.155.1561469708137;
        Tue, 25 Jun 2019 06:35:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561469708; cv=none;
        d=google.com; s=arc-20160816;
        b=izFcleD7Ki/3hty4Hrqq3ke07156VihrEJb6V98dRwGoQC4W9P8OTqPU1FEBd+vOW9
         tTJU3Ct3sRIVjHF1zK7GHLy9t5M+MHpq2e8ZOlHoZdcgbtiYkvIAqJyhjosCvt/3xDD0
         WNB+Du62x8DWHtCO8HTY1NtZ2pHDpVJ4LHFxkmRw2wEfWMgjZgYSUFwMnn5gHHojVClw
         FT+tArBqteUKc4J9Vf+1RrFskEbMBy78bugp/JURz3zwjCD9YcOCvXEbJbRFEUDt+XFR
         +mFEOtBx+5rSWJ4zPVQXQjyTGF9y0fgEna0IOBnFDB9g+Rd5OTPBync2kGxgvIjUnO4o
         q3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=axqF62YWYEfWkJvEb0uVJfq9QqKkOODUnWhKrhiIHTE=;
        b=OZiUoT9JcEXfc/8b3tp/bRi4+CiCNGFFDbnCOqjJEn+UZjEmjafPi0O6SFUqcyWdI9
         LFn+LgO0JtGkOw3THzQJQyHF7gveyH3dumsH68EvBJCGA9MQk54i4QtNE3Sg2lSE3rIv
         r/wNT+GlY/YzDag6D+MxFee7inwejuhKu99e1adbhqvM/dlNtkZ7poExpdfdNO8hVMyc
         XGdW09829P0+WanNRxF2lxw1/EVFi5Fp/xwRrtH6knH1sPoXBzGk0NpLpTtti1E4EpfV
         GvYTOwblTjV7ewU8LQ09dieJrBuJFiELrIVi+BUv0m+0tiNPX/lYLLY8u3qQHbf6RGLo
         4UCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id j6si1503803qvn.48.2019.06.25.06.35.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 06:35:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 952AB307AD00;
	Tue, 25 Jun 2019 13:34:59 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1A8C19C6F;
	Tue, 25 Jun 2019 13:34:54 +0000 (UTC)
Date: Tue, 25 Jun 2019 15:34:52 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 01/14] target/arm/cpu64: Ensure kvm
 really supports aarch64=off
Message-ID: <20190625133452.3f4ik4xn7vh5zi2b@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-2-drjones@redhat.com>
 <1ed69063-eaae-2c02-1fe1-2650492496d4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ed69063-eaae-2c02-1fe1-2650492496d4@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 25 Jun 2019 13:35:04 +0000 (UTC)
X-TUID: 4DRWGyXxpJ0f

On Tue, Jun 25, 2019 at 11:35:12AM +0200, Auger Eric wrote:
> Hi Drew,
> 
> On 6/21/19 6:34 PM, Andrew Jones wrote:
> > If -cpu <cpu>,aarch64=off is used then KVM must also be used, and it
> > and the host must support running the vcpu in 32-bit mode. Also, if
> > -cpu <cpu>,aarch64=on is used, then it doesn't matter if kvm is
> > enabled or not.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> 
> > ---
> >  target/arm/cpu64.c   | 12 ++++++------
> >  target/arm/kvm64.c   | 11 +++++++++++
> >  target/arm/kvm_arm.h | 14 ++++++++++++++
> >  3 files changed, 31 insertions(+), 6 deletions(-)
> > 
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 1901997a0645..946994838d8a 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -407,13 +407,13 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
> >       * restriction allows us to avoid fixing up functionality that assumes a
> >       * uniform execution state like do_interrupt.
> >       */> -    if (!kvm_enabled()) {
> > -        error_setg(errp, "'aarch64' feature cannot be disabled "
> > -                         "unless KVM is enabled");
> > -        return;
> > -    }
> > -
> >      if (value == false) {
> > +        if (!kvm_enabled() || !kvm_arm_aarch32_supported(CPU(cpu))) {
> > +            error_setg(errp, "'aarch64' feature cannot be disabled "
> > +                             "unless KVM is enabled and 32-bit EL1 "
> > +                             "is supported");
> > +            return;
> > +        }
> >          unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
> >      } else {
> >          set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index 22d19c9aec6f..45ccda589903 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -24,7 +24,9 @@
> >  #include "exec/gdbstub.h"
> >  #include "sysemu/sysemu.h"
> >  #include "sysemu/kvm.h"
> > +#include "sysemu/kvm_int.h"
> >  #include "kvm_arm.h"
> > +#include "hw/boards.h"
> >  #include "internals.h"
> >  
> >  static bool have_guest_debug;
> > @@ -593,6 +595,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> >      return true;
> >  }
> >  
> > +bool kvm_arm_aarch32_supported(CPUState *cpu)
> > +{
> > +    KVMState *s = KVM_STATE(current_machine->accelerator);
> > +    int ret;
> > +
> > +    ret = kvm_check_extension(s, KVM_CAP_ARM_EL1_32BIT);
> > +    return ret > 0;
> nit: return kvm_check_extension() should be sufficient

Ah yes, I forgot kvm_check_extension() already converts negative
error codes to zero. I'll fix that for v3.

> > +}
> > +
> >  #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
> >  
> >  int kvm_arch_init_vcpu(CPUState *cs)
> > diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> > index 2a07333c615f..812125f805a1 100644
> > --- a/target/arm/kvm_arm.h
> > +++ b/target/arm/kvm_arm.h
> > @@ -207,6 +207,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
> >   */
> >  void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
> >  
> > +/**
> > + * kvm_arm_aarch32_supported:
> > + * @cs: CPUState
> use kernel-doc comment style?

This file (kvm_arm.h) doesn't appear to have a super consistent comment
style. I see some use @var: for the parameters and some have 'Returns:
...' lines as well. I'm happy to do whatever the maintainers prefer. For
now I was just trying to mimic whatever caught my eye.

> > + *
> > + * Returns true if the KVM VCPU can enable AArch32 mode and false
> > + * otherwise.
> > + */
> > +bool kvm_arm_aarch32_supported(CPUState *cs);
> > +
> >  /**
> >   * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
> >   * IPA address space supported by KVM
> > @@ -247,6 +256,11 @@ static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
> >      cpu->host_cpu_probe_failed = true;
> >  }
> >  
> > +static inline bool kvm_arm_aarch32_supported(CPUState *cs)
> > +{
> > +    return false;
> > +}
> > +
> >  static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
> >  {
> >      return -ENOENT;
> > 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>

Thanks,
drew 
