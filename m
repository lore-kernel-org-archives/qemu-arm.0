Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2900311lfq;
        Mon, 14 Sep 2020 23:31:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyi5JF/jFdZb7aIm/gLO4d1e2UBkjZnZQ7BaQ2XT/lroLT9r3y8ixgxhnCaMn/aPplZSCfJ
X-Received: by 2002:a25:4ac2:: with SMTP id x185mr17955793yba.81.1600151465434;
        Mon, 14 Sep 2020 23:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600151465; cv=none;
        d=google.com; s=arc-20160816;
        b=UMmYz31DqpP4RuRqQejQqFfNsgZakJzoIi1HJtaKrP05tVMIo6Ak2ro7k7cuVTQSwi
         HgLgcT491zJ4QhGDwHvW9+1CKNQ6XszwRqJadX33k4jKQtV3zTG5Dki6LjE14WTop6pX
         uvgI+ILqcOgOhsyWMKNBuaJBDYs0n+t45rOAswJHSvInnqV+Q0Fm1aEOUuHx+apBYwMo
         yJt0NzmEtpFslU3xQJ14VCrg065BBYypJTpJIjTt6AQLIVzqrJqWfspgakfTuGsXEgZo
         92JJAOuoiBhCUUdoCGQlZY/3kp3h5Z1Cg65tAQmCi27/+KDsVrR5PhAZilTZnR8QeM1n
         tuBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=C2WTrRHSPDlolkAGT7SYc//RQuVXkp30lSQQRzG1Qxs=;
        b=dCrVieWkflc5jDDE1icWxR/01xcNvobNXAcVGYfHOhnQUkeO7t6xURxsdNWmNJuHeU
         8eIaTcmEn5DQ2QeRGMxXuv7A4/MI8tnBC1nq0Cvz14Ntbch/0FRBRGTa+ItIFb9bDoHK
         QYJP3Pcw7sPEPnlrnthvXRUiHBoGtYkUggU8fljCMJGJhp3g48ll+EPZTtSZDCpfzYpC
         nvvg5GqpcotuP96qZrILXm/YwW7Jn5ZjwZPDH7rrO0W7Aey0lexJ5Hpy3FYnwQCvr6wY
         Jg8kopRH8Y6f/EXXbpPgMn+tYI1CSynF2yjXYpeBTNLECYXiU2T7YRgks1r5Xh7N0gSz
         QU9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gywm33YH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10si12486974ybl.98.2020.09.14.23.31.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 23:31:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gywm33YH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI4Ua-0007t2-Ow
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 02:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kI4UQ-0007py-U6
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 02:30:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22501
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kI4UP-0006Ab-5C
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 02:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600151452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C2WTrRHSPDlolkAGT7SYc//RQuVXkp30lSQQRzG1Qxs=;
 b=gywm33YHnwE5u51H5XBNr60dqrFKWA9tn9+ffVUxM945AvFBGiMb4pak5UJI7GZ/0md78j
 262qQCXOIRwpFnGm+Gl7Rxi3aYfs5k2B2f1QvaNavlmxQowaJW6LNkYf8p4WhGSu8HR/wM
 +FsvCfhep++RA2fQB10uwVLdejwndnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-x_NHtQacMXm8qa-yHrdi5A-1; Tue, 15 Sep 2020 02:30:48 -0400
X-MC-Unique: x_NHtQacMXm8qa-yHrdi5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37CA61091064;
 Tue, 15 Sep 2020 06:30:47 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87BC65DD6E;
 Tue, 15 Sep 2020 06:30:45 +0000 (UTC)
Date: Tue, 15 Sep 2020 08:30:42 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH v3 10/12] target/arm/cpu: spe: Enable spe to work with
 host cpu
Message-ID: <20200915063042.wy63x4hyzavaibvf@kamzik.brq.redhat.com>
References: <cover.1600135462.git.haibo.xu@linaro.org>
 <b9c848142d25ce4556fe14fc60a4bc73dd1683d2.1600135462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <b9c848142d25ce4556fe14fc60a4bc73dd1683d2.1600135462.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:29:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b+xIJjaqJJUp

On Tue, Sep 15, 2020 at 03:11:46AM +0000, Haibo Xu wrote:
> Turn on the spe cpu property by default if host cpu
> support it, i.e. we can now do '-cpu max|host' to add
> the vSPE, and '-cpu max|host,spe=off' to remove it.
> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/cpu.c   |  1 +
>  target/arm/cpu.h   |  2 ++
>  target/arm/cpu64.c | 10 +++++++---
>  target/arm/kvm64.c | 12 ++++++++++++
>  4 files changed, 22 insertions(+), 3 deletions(-)


Reviewed-by: Andrew Jones <drjones@redhat.com>

> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 786cc6134c..05a4b7d208 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2271,6 +2271,7 @@ static void arm_host_initfn(Object *obj)
>      kvm_arm_set_cpu_features_from_host(cpu);
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          aarch64_add_sve_properties(obj);
> +        aarch64_add_spe_properties(obj);
>      }
>      arm_cpu_post_init(obj);
>  }
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 395a1e5df8..5a3ea876c8 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1040,6 +1040,7 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
>  void aarch64_sve_change_el(CPUARMState *env, int old_el,
>                             int new_el, bool el0_a64);
>  void aarch64_add_sve_properties(Object *obj);
> +void aarch64_add_spe_properties(Object *obj);
>  
>  /*
>   * SVE registers are encoded in KVM's memory in an endianness-invariant format.
> @@ -1071,6 +1072,7 @@ static inline void aarch64_sve_change_el(CPUARMState *env, int o,
>                                           int n, bool a)
>  { }
>  static inline void aarch64_add_sve_properties(Object *obj) { }
> +static inline void aarch64_add_spe_properties(Object *obj) { }
>  #endif
>  
>  #if !defined(CONFIG_TCG)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 4997c4a3c0..04daeb901d 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -621,6 +621,12 @@ static void arm_spe_set(Object *obj, bool value, Error **errp)
>      ARM_CPU(obj)->has_spe = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
>  }
>  
> +void aarch64_add_spe_properties(Object *obj)
> +{
> +    ARM_CPU(obj)->has_spe = ON_OFF_AUTO_AUTO;
> +    object_property_add_bool(obj, "spe", arm_spe_get, arm_spe_set);
> +}
> +
>  /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
>   * otherwise, a CPU with as many features enabled as our emulation supports.
>   * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
> @@ -632,6 +638,7 @@ static void aarch64_max_initfn(Object *obj)
>  
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> +        aarch64_add_spe_properties(obj);
>      } else {
>          uint64_t t;
>          uint32_t u;
> @@ -770,9 +777,6 @@ static void aarch64_max_initfn(Object *obj)
>      aarch64_add_sve_properties(obj);
>      object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
>                          cpu_max_set_sve_max_vq, NULL, NULL);
> -
> -    cpu->has_spe = ON_OFF_AUTO_AUTO;
> -    object_property_add_bool(obj, "spe", arm_spe_get, arm_spe_set);
>  }
>  
>  static const ARMCPUInfo aarch64_cpus[] = {
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 5a2032fc9e..20269efeff 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -515,6 +515,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>       */
>      int fdarray[3];
>      bool sve_supported;
> +    bool spe_supported;
>      uint64_t features = 0;
>      uint64_t t;
>      int err;
> @@ -655,6 +656,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      }
>  
>      sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
> +    spe_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION,
> +                                      KVM_CAP_ARM_SPE_V1) > 0;
>  
>      kvm_arm_destroy_scratch_host_vcpu(fdarray);
>  
> @@ -668,6 +671,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
>          ahcf->isar.id_aa64pfr0 = t;
>      }
> +    if (spe_supported) {
> +        t = ahcf->isar.id_aa64dfr0;
> +        t = FIELD_DP64(t, ID_AA64DFR0, PMSVER, 1);
> +        ahcf->isar.id_aa64dfr0 = t;
> +    }
>  
>      /*
>       * We can assume any KVM supporting CPU is at least a v8
> @@ -830,6 +838,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          assert(kvm_arm_sve_supported());
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
>      }
> +    if (cpu_isar_feature(aa64_spe, cpu)) {
> +        assert(kvm_arm_spe_supported());
> +        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SPE_V1;
> +    }
>  
>      /* Do KVM_ARM_VCPU_INIT ioctl */
>      ret = kvm_arm_vcpu_init(cs);
> -- 
> 2.17.1
> 
> 

