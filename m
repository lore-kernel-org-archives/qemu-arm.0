Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp518532lfq;
        Tue, 8 Sep 2020 04:33:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhqRt1A27stH/SQdhGqVcbLg6yo71HX6uHjHLIdDtLx5UhRwYP200REC5qLW1SeG2AKASH
X-Received: by 2002:a25:c750:: with SMTP id w77mr36160513ybe.17.1599564797565;
        Tue, 08 Sep 2020 04:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599564797; cv=none;
        d=google.com; s=arc-20160816;
        b=yskxveRVkziTsOAqD6lmqKCUb0A01XmVHw8fHzSS5gvzyjMqD+B2F51beGyzNaVxYD
         geFgOHF2RKWiUEPVYViDGG7p8ZeU9XLOygE/uaKPTlgemVKyzg6AQD6R848tD0jQlaDz
         eSkI6szWANg/JCONkD86ZeOWY0y1+JYnrbN68g9EuPryiAyHUKof/AfNnVVBOoKDFhzQ
         2Gh8rgf5nwrOAhGKImNsV7eQQLYbCLJ/6Vse3vgGC/9PVRoAEVsbDS4bNu3rrKmmrnqI
         nCe8+IhRMlXVloKPEPLY0g3YPsb+E6Nu0Pp4hBUxkGc0JBo9c26L6QOZ8TDdqT1SKXEh
         A4qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ULBwfiITgvP0PMMbu6gRU7ITRT+vhl+4mDhD2Lj5GlA=;
        b=P5VYD6DTj/IfFWrB/OG+WAQw8p8FiKkMqrbKuYCEODWQ0G0/iJmQNj2zYN+ytWbBrt
         dpNn/EuvRI4jeNLqOYzq65YYMKAny2J1Ek1f++r+rWGtXuD3LMDEsK/xShEispa14dCB
         A2NuXxiAEGmW8M4VPtbAJ58SH/GIKHVqBXfJlkyTFAy2NLob7qC11QZseAr3rayycVNW
         RwZKuS7Je4iFW30Ymx4M3xxACwuZJakdMxlBgWZQ5aGVVcoaEEWCb6JKQ0tB2Isd2u4v
         bQESzskZGHQK2cE2JGBPy0IfIzsZrOAN3qz7NZANcAJqu84D5wOhod78DYNq+Rxo+ini
         yT/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SOwxfx0B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m191si334932ybf.355.2020.09.08.04.33.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 04:33:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SOwxfx0B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFbsC-00044Q-TC
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 07:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbs4-00042k-Lp
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 07:33:08 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56862
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbs2-0000Vz-Ml
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 07:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599564785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ULBwfiITgvP0PMMbu6gRU7ITRT+vhl+4mDhD2Lj5GlA=;
 b=SOwxfx0BbGDuL/38fLVxGl9g82yl8ljLYm/LckLwQSdY4zPH+UgkxDfh4wU7q7klT2HQFC
 D+M9bhcRu9KIyLceWnzjgTQg6Iuhen3xFmFrWRyNhLmC/yiY5QVYTwcV/EK98LZfm6TGpb
 xHX9NYc/n2DGIJBNAQOi3k28NEF7gLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-Z9MjkeUiPruqx2hBLtXS6g-1; Tue, 08 Sep 2020 07:33:01 -0400
X-MC-Unique: Z9MjkeUiPruqx2hBLtXS6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EBD1802B61;
 Tue,  8 Sep 2020 11:33:00 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EA1C9CBA;
 Tue,  8 Sep 2020 11:32:55 +0000 (UTC)
Date: Tue, 8 Sep 2020 13:32:53 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH v2 10/12] target/arm/cpu: spe: Enable spe to work with
 host cpu
Message-ID: <20200908113253.b6owlcu62hypp6aw@kamzik.brq.redhat.com>
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <26b4ace9ea3c5b43d14802d6fc5ceea90befbcc8.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <26b4ace9ea3c5b43d14802d6fc5ceea90befbcc8.1599549462.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:08:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: philmd@redhat.com, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NlYyqkzskjLC

On Tue, Sep 08, 2020 at 08:13:28AM +0000, Haibo Xu wrote:
> Turn on the spe cpu property by default if host cpu
> support it, i.e. we can now do '-cpu max|host' to add
> the vSPE, and '-cpu max|host,spe=off' to remove it.
> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/cpu.c   |  3 +++
>  target/arm/cpu.h   |  2 ++
>  target/arm/cpu64.c |  7 ++++++-
>  target/arm/kvm64.c | 12 ++++++++++++
>  4 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 786cc6134c..58f12d6eb5 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2271,6 +2271,9 @@ static void arm_host_initfn(Object *obj)
>      kvm_arm_set_cpu_features_from_host(cpu);
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          aarch64_add_sve_properties(obj);
> +
> +        cpu->has_spe = ON_OFF_AUTO_AUTO;
> +        aarch64_add_spe_properties(obj);

Why not put the assignment of has_spe into aarch64_add_spe_properties()?

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
> index 4997c4a3c0..d38c55e2ca 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -621,6 +621,11 @@ static void arm_spe_set(Object *obj, bool value, Error **errp)
>      ARM_CPU(obj)->has_spe = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
>  }
>  
> +void aarch64_add_spe_properties(Object *obj)
> +{
> +    object_property_add_bool(obj, "spe", arm_spe_get, arm_spe_set);
> +}
> +
>  /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
>   * otherwise, a CPU with as many features enabled as our emulation supports.
>   * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
> @@ -772,7 +777,7 @@ static void aarch64_max_initfn(Object *obj)
>                          cpu_max_set_sve_max_vq, NULL, NULL);
>  
>      cpu->has_spe = ON_OFF_AUTO_AUTO;
> -    object_property_add_bool(obj, "spe", arm_spe_get, arm_spe_set);
> +    aarch64_add_spe_properties(obj);

If TCG doesn't support this cpu feature then this should be in the
kvm_enabled() part of this function.


>  }
>  
>  static const ARMCPUInfo aarch64_cpus[] = {
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 5a2032fc9e..3f0a09c05b 100644
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
> +    if (!spe_supported) {
> +        t = ahcf->isar.id_aa64dfr0;
> +        t = FIELD_DP64(t, ID_AA64DFR0, PMSVER, 0);
> +        ahcf->isar.id_aa64dfr0 = t;
> +    }
> 

If this works then there's a bug with the KVM implementation. get-one-reg
shouldn't expose SPE unless userspace has enabled it, which we're not
doing on the scratch vcpu. That's why we set, not clear, the ID bits for
SVE.

 
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

Thanks,
drew

