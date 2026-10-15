Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B628CCC6B38
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 20:30:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHS5b-0002Jo-Cx; Thu, 15 Oct 2026 16:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xHS5V-0002JC-HP
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 16:30:08 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xHS5T-0005Nk-Bd
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 16:30:05 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-cd62c570b5dso1328190a12.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 13:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792096200; x=1792701000; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=hC1vzj0wb9nSvP5dG5VN3FVLkN5u4HFXb/F44tEkOzY=;
 b=APO4WXUeMHBiyrAseoNUEiXHwch5hK0Wqs8JxhBsyC94uJknlbis1R7gZEVzccJvDn
 TSF+HqgLtIZ6NapuEWXVbdwVDLaeNT0GMNZWejhtxSVJ7QTAe2S2VTWvmxx3yHYYSm9t
 01Pv8NJRqGxJugAQr/w3SJEmaTxlVfgpx1jBlagzHHQw5RGngFhMA/HfEWPKiIwUMUuc
 H4biz3UBm3yjjNrvIbMRlMS8skl50wUGkIBtt9Rk9F0bDZijYW+4XA2EANzZhVm59vof
 lO5kV2e6v30vRv2lbGdGMp1ZeGYJSW8OBQQ6+Rg1zsWzBc3nxCGW5eQzzE7xUzHZp033
 WkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792096200; x=1792701000;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hC1vzj0wb9nSvP5dG5VN3FVLkN5u4HFXb/F44tEkOzY=;
 b=mLt2iQZW0tFkgq4Bg29Aano4WVwYCsTridSaBOh2Ge/O0wxSC1P4lTamcpz0Tvg6xy
 zjRyCIKtJMLPIfpaxASx6ZyKtFC/H3c7TMQN5eyYKr3bOt3CtWUYcd7fuLsVDihjrEbr
 Q3h/8lCU5/JEMWSvT8pyD5iEehIYfmZExaAPwDtcpQ4lxHx/FuurmnmBmefxkoS6yqcM
 l0Pg1yS5EZ5EJrbJY/dJwUgnuDLq3VyuYm6VfaFEUIvgnNxG5LIMilREMOQ8N3uLCHAQ
 tEB4Gg1K41R+f4n8JrFnZm4yUR9mnUhafPAMPUYnJ1MgX8i5jrcEwGGWHqF4MoSp8nnB
 tDlA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzrzfFoVOhfrS/QKBpZlKJKSlHHEEfRPkZR3zfKgqYHHUs+gf6RmV+iPHD6K0hK30c+S6CW32qNJg==@nongnu.org
X-Gm-Message-State: AFq9FYJm+ulyqgJmq9vCwLrkMWe1smcj3rWZUvA07q6SzGuGl2LFxSLR
 Y6h5f9oEUB1kcL9YvXAvHHEZpAX7vXu5JjycuaEygmHUL5Reho+tVLoaiWCeLdYwxSA=
X-Gm-Gg: AYBFou28Xq09sw+Y52u6a9p+QgIW0aSLXheVUWoN38sSbK1Elqf2ZpyB1uQf6FT9A1l
 elTgaWLLY4xAjS6xsxFNaCxPIZQtCoROdxnpkGrvS09qx2qvxXJ2ldTdBC78E/krsfIfxZ3jvjc
 rhUIRBn2uFK9npn0Q60jgUMPQ62vLESo3PoJAi83mNvvSL1xch6T4z3cqlLp0vk8zGsQoLHLHYn
 yh8uX+rSjkAelouAG/h17XD0o4dLsPtA5aSD7lUle9C6tFUbTb3uFeJRp6ItWLjdI001EVn2ffg
 nhQg2orL6C/3pOYKvFdblIz2KQo/C86EEcADXhONB4DdX5ij7hqA8sU0zzdE7MPZ5lMYm8wVOn3
 Dv2L9fc7uJ9JRrj+mf3aqeAk9AlZk02skp4H7iZb8GaAJlRkA16f+ys2v3DUMWhQP9DSZx3vfkS
 0/Bco59M3+gOnS/eqXzbH2To8WpeGyMX39N5SA2n/A0KQumx+vPaITnhpNiehF4faRtHt2reMs1
 GtCQ/YFWP9J
X-Received: by 2002:a17:90b:5805:b0:3ac:8446:c1b5 with SMTP id
 98e67ed59e1d1-3ac8446c284mr4303030a91.31.1792096200290; 
 Thu, 15 Oct 2026 13:30:00 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:48ff:8de9:17ca:1542])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3acc38b457esm846312a91.0.2026.10.15.13.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 13:29:59 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:29:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Gavin Shan <gshan@redhat.com>
Cc: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, lorenzo.pieralisi@linaro.org,
 enju.kohei@fujitsu.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
Subject: Re: [RFC v4 06/24] target/arm/kvm-rme: Initialize vCPU
Message-ID: <atE3xY22XqMkaEJG@p14s>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-7-mathieu.poirier@linaro.org>
 <a3a01282-bf89-46b8-b15c-9dc5f93053ee@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a01282-bf89-46b8-b15c-9dc5f93053ee@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, Oct 02, 2026 at 10:53:58AM +1000, Gavin Shan wrote:
> On 9/4/26 5:35 AM, Mathieu Poirier wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > The target code calls kvm_arm_vcpu_init() to mark the vCPU as part of a
> > Realm. For a Realm vCPU, only x0-x7 can be set at runtime. Before boot,
> > the PC can also be set, and is ignored at runtime. KVM also accepts a
> > few system register changes during initial configuration, as returned by
> > KVM_GET_REG_LIST.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >   target/arm/cpu.h      |  3 +++
> >   target/arm/kvm-rme.c  |  9 ++++++++
> >   target/arm/kvm-stub.c |  5 ++++
> >   target/arm/kvm.c      | 54 +++++++++++++++++++++++++++++++++++++++++--
> >   target/arm/kvm_arm.h  | 10 ++++++++
> >   5 files changed, 79 insertions(+), 2 deletions(-)
> > 
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index e3f931dba26b..6bbc942f9a59 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -1054,6 +1054,9 @@ struct ArchCPU {
> >       /* KVM steal time */
> >       OnOffAuto kvm_steal_time;
> > +    /* Realm Management Extension */
> > +    bool kvm_rme;
> > +
> 
> This field seems redundant to MachineState::cgs since all vCPUs support RME
> (Realm Management Extension) when MachineState::cgs points a valid instance.
> So I'm wandering why we need to maintain the redundant information here?
>

It is redundant, at least at this time.  I have removed it in favour of
MACHINE(qdev_get_machine())->cgs where cpu->kvm_rme was used.  With that it was
possible to get rid of function kvm_arm_rme_vcpu_init().
 
> >       /* Uniprocessor system with MP extensions */
> >       bool mp_is_up;
> > diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> > index a4a5e195c196..f7c2cc786e2c 100644
> > --- a/target/arm/kvm-rme.c
> > +++ b/target/arm/kvm-rme.c
> > @@ -69,6 +69,15 @@ static int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
> >       return 0;
> >   }
> > +void kvm_arm_rme_vcpu_init(ARMCPU *cpu)
> > +{
> > +    if (!rme_guest) {
> > +        return;
> > +    }
> > +
> > +    cpu->kvm_rme = true;
> > +}
> > +
> 
> This could be simplified to:
> 
>       cpu->kvm_rme = !!rme_guest;
> 
> >   static void rme_guest_class_init(ObjectClass *oc, const void *data)
> >   {
> >       ConfidentialGuestSupportClass *klass = CONFIDENTIAL_GUEST_SUPPORT_CLASS(oc);
> > diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
> > index 88cbe8d85c41..5fde96f9b281 100644
> > --- a/target/arm/kvm-stub.c
> > +++ b/target/arm/kvm-stub.c
> > @@ -119,3 +119,8 @@ char *kvm_print_register_name(uint64_t regidx)
> >   {
> >       g_assert_not_reached();
> >   }
> > +
> > +void kvm_arm_rme_vcpu_init(ARMCPU *cpu)
> > +{
> > +    g_assert_not_reached();
> > +}
> > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > index 33c3763aebfa..b4c6da1fb9f3 100644
> > --- a/target/arm/kvm.c
> > +++ b/target/arm/kvm.c
> > @@ -2015,6 +2015,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
> >           cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
> >       }
> > +    kvm_arm_rme_vcpu_init(cpu);
> > +
> >       /* Do KVM_ARM_VCPU_INIT ioctl */
> >       ret = kvm_arm_vcpu_init(cpu);
> >       if (ret) {
> > @@ -2169,6 +2171,29 @@ static int kvm_arch_put_sve(CPUState *cs, uint32_t vq, bool have_ffr)
> >       return 0;
> >   }
> > +static int kvm_arm_rme_put_core_regs(CPUState *cs, Error **errp)
> > +{
> > +    int i, ret;
> > +    ARMCPU *cpu = ARM_CPU(cs);
> > +    CPUARMState *env = &cpu->env;
> > +
> > +    /* The RME ABI only allows us to set 8 GPRs and the PC */
> > +    for (i = 0; i < 8; i++) {
> > +        ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(regs.regs[i]),
> > +                              &env->xregs[i]);
> > +        if (ret) {
> > +            return ret;
> > +        }
> > +    }
> > +
> > +    ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(regs.pc), &env->pc);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >   static int kvm_arm_put_core_regs(CPUState *cs, Error **errp)
> >   {
> >       uint64_t val;
> > @@ -2280,7 +2305,11 @@ int kvm_arch_put_registers(CPUState *cs, KvmPutState level, Error **errp)
> >       int ret;
> >       ARMCPU *cpu = ARM_CPU(cs);
> > -    ret = kvm_arm_put_core_regs(cs, errp);
> > +    if (cpu->kvm_rme) {
> > +        ret = kvm_arm_rme_put_core_regs(cs, errp);
> > +    } else {
> > +        ret = kvm_arm_put_core_regs(cs, errp);
> > +    }
> >       if (ret) {
> >           return ret;
> >       }
> > @@ -2367,6 +2396,23 @@ static int kvm_arch_get_sve(CPUState *cs, uint32_t vq, bool have_ffr)
> >       return 0;
> >   }
> > +static int kvm_arm_rme_get_core_regs(CPUState *cs, Error **errp)
> > +{
> > +    int i, ret;
> > +    ARMCPU *cpu = ARM_CPU(cs);
> > +    CPUARMState *env = &cpu->env;
> > +
> > +    for (i = 0; i < 8; i++) {
> > +        ret = kvm_get_one_reg(cs, AARCH64_CORE_REG(regs.regs[i]),
> > +                              &env->xregs[i]);
> > +        if (ret) {
> > +            return ret;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >   static int kvm_arm_get_core_regs(CPUState *cs, Error **errp)
> >   {
> >       uint64_t val;
> > @@ -2478,7 +2524,11 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
> >       int ret;
> >       ARMCPU *cpu = ARM_CPU(cs);
> > -    ret = kvm_arm_get_core_regs(cs, errp);
> > +    if (cpu->kvm_rme) {
> > +        ret = kvm_arm_rme_get_core_regs(cs, errp);
> > +    } else {
> > +        ret = kvm_arm_get_core_regs(cs, errp);
> > +    }
> >       if (ret) {
> >           return ret;
> >       }
> > diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> > index e7c40fb003e4..d95381c13afa 100644
> > --- a/target/arm/kvm_arm.h
> > +++ b/target/arm/kvm_arm.h
> > @@ -240,4 +240,14 @@ void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3);
> >    */
> >   char *kvm_print_register_name(uint64_t regidx);
> > +/**
> > + * kvm_arm_rme_vcpu_init
> > + * @cs: the CPU
> > + *
> > + * If the user requested a Realm, setup the given vCPU accordingly. Realm vCPUs
> > + * behave a little differently, for example most of their register state is
> > + * hidden from the host.
> > + */
> > +void kvm_arm_rme_vcpu_init(ARMCPU *cpu);
> > +
> 
> The comments here look outdated. This function simply set ARMCPU::kvm_rme to indicate
> RME should be supported for this given vCPU. So the comments would be something as
> below.
> 
>     /*
>      *
>      * Mark that RME (Realm Management Extension) should be supported for the given
>      * vCPU if user has requested it. Realm vCPUs behave a little differently, for
>      * example most of their register states are confidential and invisible to us.
>      */
> 
> >   #endif
> 
> Thanks,
> Gavin
> 

