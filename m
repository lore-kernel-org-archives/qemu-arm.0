Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp231637lfq;
        Wed, 9 Sep 2020 01:36:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3BhTIzde7NIfrTwfle3/WHsMJWeT+37sB1G+daZxyIEmQKclawU2lmxUEioemgKm/iVKu
X-Received: by 2002:a25:344c:: with SMTP id b73mr928101yba.127.1599640580948;
        Wed, 09 Sep 2020 01:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599640580; cv=none;
        d=google.com; s=arc-20160816;
        b=R3oiis+qk13Q/YKrX+3oMoLgj3yNzchPASlmW+VSUbaRRd0oj+x3Yv6S9Sekl0EkvU
         JPOkvt9cSqmLI0au2UVrUhjKHz+iecOCwrb408fi3nVROlWwD+RLqzA8SRcF3hZ6JPlA
         lTvEEVD8k3Qayi3TOWiMelJIZNkL+cdU4lwbYD/GWqljoxzDTzBU8zMiSJRBKOspvSeq
         NzYMP6u7FmDg6JSpxH6rxKWDEgfQIpQ80mga+HpWjsu+4YzXW1y8KRjqKLkskXJYM9xp
         BpO4hLpid2PdP6yWnvwi9x8FS5eEPvakk+aVcJkCzM9PwB0riBVXMbQglYH5koB01T5T
         TmMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8lmo7B52MqzvZ9+E1/DhpswZ0QiEmoM8ELNnZhLo2Xk=;
        b=MTAT2aYDafoa6xcZ6b50SbMczt+TlLdY9B1Ji6qUKr8pTfC4ZnpXpWcQX0YBRcOG7/
         YDXu97D9UZQOHVAF95KRuvu8MGRsIzRjKDvkXtuQvRC64Uqh74lBYzunHMhIuubMB5DQ
         0ZGWUbJbIYkoloePTje4ljGEyhefpS9TMx/vSfc7s3utMkK9+y3xjcNB4Q5V31HS59Jl
         ZaLu6u11Pk6k0WUoxBfOkucT3CMzW1UoXPIQeryEfap9EBdiZDskQSaSbE/jYHd5he+I
         0YYB43UIfuxgshlz+Av9uWNzSAkzw0uACgIvQ4i2mUPDMAOVzN2Ppj3yD4HVY8TsGS8I
         Lu+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QL+NyviU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si2193913ybx.44.2020.09.09.01.36.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 01:36:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QL+NyviU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFvaW-00059m-AA
	for alex.bennee@linaro.org; Wed, 09 Sep 2020 04:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFvaM-00058X-FO
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 04:36:10 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:39082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFvaJ-0006hf-Gg
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 04:36:10 -0400
Received: by mail-il1-x144.google.com with SMTP id u20so1548319ilk.6
 for <qemu-arm@nongnu.org>; Wed, 09 Sep 2020 01:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8lmo7B52MqzvZ9+E1/DhpswZ0QiEmoM8ELNnZhLo2Xk=;
 b=QL+NyviULWLnjj7hTQXkWtx4jgQ+JOes4JcUbtPq/brotTsvswesOXE2G2jQaD5OjA
 r6b2jK0/sTz1e6kO1umILifpoxteaaGVrfJbBmRhYtvnUzdS6GFu8vL7hFnsZ2L68A0Q
 ecQlXc3MlLbv07V3I5xpghTJ6MJ6Pk/TTsbkzq2WYsxufLCWz8gnotuI4z+HakQ7SKay
 iFH1rBtg+PWO120xyNzeD4HJ+RZE7PcRNk2k9iUfqtbGyCiS8T64jj3+qzWkq6f+ZdEJ
 msvrRUcqJT1coZUAxsPap6c9LcsPQrcPouUHVVldIhWAv9e3sO7KhD+qwHkafFl/LK9J
 N4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8lmo7B52MqzvZ9+E1/DhpswZ0QiEmoM8ELNnZhLo2Xk=;
 b=fI1a/y0RAxPbLjqBy2PcXjqZvptD+OLogL7wFmwKcqIGhdl/uzb1yKJrBcAAgR5Mzm
 CMABzTU7WHjNNQgZ/Jyq4cmd8FR1cOs4f/dqLpXlOjATJj6Ytrpl19Y7U8Q3ONliPzQ5
 hbC730zUY6LzBXbfswgcIf5q+NgM4EUDCuYZnoiU5lnl+Tn0y8Mffhxw/8ZTiSJ/ntbm
 T56KmaddBD3lo6PGP89a5Brka+COG1PXPDEUpYwiUg28nmhtcggXCWcKYCfS8DzQj/SW
 zAgivod/8RYn8dMBd8vTgOGb6vHmL/dpMYug0KrkoDwKEyh1R363ipiN7MxiyU26xDh4
 d7nA==
X-Gm-Message-State: AOAM532iqGNGbWDbRb9oswLeZYRHx1+0X/wE9AjBCF3emw9lFiftAvXh
 dnYH3vf6dHW2kHLBflRxLYRy5s04ylvp+tviq78t
X-Received: by 2002:a05:6e02:dd3:: with SMTP id
 l19mr2813667ilj.233.1599640565561; 
 Wed, 09 Sep 2020 01:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <26b4ace9ea3c5b43d14802d6fc5ceea90befbcc8.1599549462.git.haibo.xu@linaro.org>
 <20200908113253.b6owlcu62hypp6aw@kamzik.brq.redhat.com>
In-Reply-To: <20200908113253.b6owlcu62hypp6aw@kamzik.brq.redhat.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Wed, 9 Sep 2020 16:35:54 +0800
Message-ID: <CAJc+Z1Fh6AkQ=b4C=SFHRE9R2gRmMM-qpL7qpkGoOZX1mF98wA@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] target/arm/cpu: spe: Enable spe to work with
 host cpu
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: philmd@redhat.com, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jsbw+JO0mQ5P

On Tue, 8 Sep 2020 at 19:33, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Sep 08, 2020 at 08:13:28AM +0000, Haibo Xu wrote:
> > Turn on the spe cpu property by default if host cpu
> > support it, i.e. we can now do '-cpu max|host' to add
> > the vSPE, and '-cpu max|host,spe=off' to remove it.
> >
> > Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> > ---
> >  target/arm/cpu.c   |  3 +++
> >  target/arm/cpu.h   |  2 ++
> >  target/arm/cpu64.c |  7 ++++++-
> >  target/arm/kvm64.c | 12 ++++++++++++
> >  4 files changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 786cc6134c..58f12d6eb5 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -2271,6 +2271,9 @@ static void arm_host_initfn(Object *obj)
> >      kvm_arm_set_cpu_features_from_host(cpu);
> >      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> >          aarch64_add_sve_properties(obj);
> > +
> > +        cpu->has_spe = ON_OFF_AUTO_AUTO;
> > +        aarch64_add_spe_properties(obj);
>
> Why not put the assignment of has_spe into aarch64_add_spe_properties()?
>

Yes, it could be. Will fix it in v3.

> >      }
> >      arm_cpu_post_init(obj);
> >  }
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 395a1e5df8..5a3ea876c8 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -1040,6 +1040,7 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
> >  void aarch64_sve_change_el(CPUARMState *env, int old_el,
> >                             int new_el, bool el0_a64);
> >  void aarch64_add_sve_properties(Object *obj);
> > +void aarch64_add_spe_properties(Object *obj);
> >
> >  /*
> >   * SVE registers are encoded in KVM's memory in an endianness-invariant format.
> > @@ -1071,6 +1072,7 @@ static inline void aarch64_sve_change_el(CPUARMState *env, int o,
> >                                           int n, bool a)
> >  { }
> >  static inline void aarch64_add_sve_properties(Object *obj) { }
> > +static inline void aarch64_add_spe_properties(Object *obj) { }
> >  #endif
> >
> >  #if !defined(CONFIG_TCG)
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 4997c4a3c0..d38c55e2ca 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -621,6 +621,11 @@ static void arm_spe_set(Object *obj, bool value, Error **errp)
> >      ARM_CPU(obj)->has_spe = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
> >  }
> >
> > +void aarch64_add_spe_properties(Object *obj)
> > +{
> > +    object_property_add_bool(obj, "spe", arm_spe_get, arm_spe_set);
> > +}
> > +
> >  /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
> >   * otherwise, a CPU with as many features enabled as our emulation supports.
> >   * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
> > @@ -772,7 +777,7 @@ static void aarch64_max_initfn(Object *obj)
> >                          cpu_max_set_sve_max_vq, NULL, NULL);
> >
> >      cpu->has_spe = ON_OFF_AUTO_AUTO;
> > -    object_property_add_bool(obj, "spe", arm_spe_get, arm_spe_set);
> > +    aarch64_add_spe_properties(obj);
>
> If TCG doesn't support this cpu feature then this should be in the
> kvm_enabled() part of this function.
>
>

Will fix it in v3.

> >  }
> >
> >  static const ARMCPUInfo aarch64_cpus[] = {
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index 5a2032fc9e..3f0a09c05b 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -515,6 +515,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> >       */
> >      int fdarray[3];
> >      bool sve_supported;
> > +    bool spe_supported;
> >      uint64_t features = 0;
> >      uint64_t t;
> >      int err;
> > @@ -655,6 +656,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> >      }
> >
> >      sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
> > +    spe_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION,
> > +                                      KVM_CAP_ARM_SPE_V1) > 0;
> >
> >      kvm_arm_destroy_scratch_host_vcpu(fdarray);
> >
> > @@ -668,6 +671,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> >          t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
> >          ahcf->isar.id_aa64pfr0 = t;
> >      }
> > +    if (!spe_supported) {
> > +        t = ahcf->isar.id_aa64dfr0;
> > +        t = FIELD_DP64(t, ID_AA64DFR0, PMSVER, 0);
> > +        ahcf->isar.id_aa64dfr0 = t;
> > +    }
> >
>
> If this works then there's a bug with the KVM implementation. get-one-reg
> shouldn't expose SPE unless userspace has enabled it, which we're not
> doing on the scratch vcpu. That's why we set, not clear, the ID bits for
> SVE.
>
>

You are right. I have printed the returned field, and it's 0.
Thanks for pointing this out, I will fix it in v3.

Regards,
Haibo

> >      /*
> >       * We can assume any KVM supporting CPU is at least a v8
> > @@ -830,6 +838,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
> >          assert(kvm_arm_sve_supported());
> >          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
> >      }
> > +    if (cpu_isar_feature(aa64_spe, cpu)) {
> > +        assert(kvm_arm_spe_supported());
> > +        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SPE_V1;
> > +    }
> >
> >      /* Do KVM_ARM_VCPU_INIT ioctl */
> >      ret = kvm_arm_vcpu_init(cs);
> > --
> > 2.17.1
> >
>
> Thanks,
> drew
>
