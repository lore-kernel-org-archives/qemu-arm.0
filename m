Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4580641lfb;
        Tue, 27 Apr 2021 01:39:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRwQgbBeI5tTMk4pM6a3J/2XQgMB4dUE581wW75U8ZO/EzfcVrA6upa30e4Ces2sNEHZ69
X-Received: by 2002:a25:f803:: with SMTP id u3mr10580673ybd.356.1619512762935;
        Tue, 27 Apr 2021 01:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619512762; cv=none;
        d=google.com; s=arc-20160816;
        b=kUIdc8kAl7AE5EcsuRIV+DT1GWH9GQL770YPjeFD9SZrtKyQPQm/Qr0HG730O2jREi
         usy4ixOubDe2fHmMkwlHQsVnQIWYHLyDAH83JEJ2eaeXpEuWINaQwt1eS+Me16HOSyyN
         jDgji0RnyojvUVO3DPsdkAzELYaOF6EesIg7VgJdi4iNSjDH7u/1JOAQOKzQIetvDtdJ
         UJsqDwzCgpXmew+Aa+/fF4csgTOx1xZRSnQq32A7s5gE8lu6OeicNurdVnxbD+BCbqcb
         4lbw92vsGFpCep6E9sVjzhzVROXE6R11XSv11S6GABalSfZcRt/r3TP+HJpGdkG6nqnn
         LXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=z7PDGmBz6Wfwstw5w1CD68HqkyjInjIo8NnSFAgt5vo=;
        b=X57uIVAUERcdApEzg2dmjEtjLrpNKDSdd3gCEfpic46rOEdkumZWubkR5pT5EqEr6A
         fyrTH4yxXpFGmV+7MpfjuVAz3X1UMTN8JDLGy8wJ23HtfMKASuJLV3lchXufojRC1JTu
         9Nf0JbUkUynhXHUpwQ/6tWkHNPrYSONxh9KUWOqcfcWZ+MOgaisGLGF8eSqBqzFTr8CC
         cEGHiALsyIQCyTEN0mlfAOEQZScBoZg2QEqloy8N4g0n6zfQ773IqkfXummZcnORZKTv
         HswAF3CTAp9QUC2Bg+X/BFYy+PHzgj7kFabyGyHN8uWbWC1i5U2HBiFJuURXYnk6/LCK
         Pocg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JkpXk7k0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si3069653ybu.319.2021.04.27.01.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 01:39:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JkpXk7k0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbJFa-0002Cw-8u
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 04:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbJF8-0002Ac-0T
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 04:38:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbJF5-0008Cs-RW
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 04:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619512730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z7PDGmBz6Wfwstw5w1CD68HqkyjInjIo8NnSFAgt5vo=;
 b=JkpXk7k0OjJTCSKEtOeRfcO3A1v7STvoRpRDHhSV9sIOrVwh8M8wDf1WPB5KTRThSpmHg2
 mdlrDPvJ5pX24XmCGpDVsG6QCYp+NZsETcV/GJVLnw4Q3f75f2THK7opqaI6iu3PK42X2L
 jftmjLbOFWmIACFaciSHq5NYo2pIUAk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-ellPtaxCMHOGfhAvnivzKg-1; Tue, 27 Apr 2021 04:38:48 -0400
X-MC-Unique: ellPtaxCMHOGfhAvnivzKg-1
Received: by mail-ej1-f69.google.com with SMTP id
 s23-20020a1709069617b02903907023c7c0so654607ejx.0
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 01:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z7PDGmBz6Wfwstw5w1CD68HqkyjInjIo8NnSFAgt5vo=;
 b=SzUOfknzZpPpFhjQacBRH/639ugKPobGhegndzHSuCA1SJC36XlHyIVRn+R++ACw2A
 EdLxnGeChM0JU9MDopq3PwdIX0lFS/2TUKvceuyjl5CUXUFsOWL+OJ3OdFD6xXVhInsF
 D2GlJ5aGlmxcgTVw82BVbvONwF/aKEjQQm/fWBLwHARhfuo0pOLRjqQnWUK2TMSJJsbh
 uf4BIcl27sKpJUicR7r4bDuzMYAnKBlB5ajTq8mDaYnFfu8FBo/aDIgPIsJ7Xo7q+Mjl
 cXCfe+kv4JBwQGTDH4KCwrScYlP7JatQ82US6U/MJiG86wM323db8bxS6p8an2rg9/m+
 qtmA==
X-Gm-Message-State: AOAM532fieCGTBO0pR0EURLLG2MJ1YaRLjEPxOyaA7tOMpf1zqkTsLZ9
 549kgmpUUcHZEMSnzXWPktFsasxflHX8fXeGMYQqiOSoX+TDocYBbmJo0glWAW+yzc9mfJEw3+r
 CXGw2teXxu6z6
X-Received: by 2002:a17:906:3a45:: with SMTP id
 a5mr22975367ejf.288.1619512727583; 
 Tue, 27 Apr 2021 01:38:47 -0700 (PDT)
X-Received: by 2002:a17:906:3a45:: with SMTP id
 a5mr22975349ejf.288.1619512727390; 
 Tue, 27 Apr 2021 01:38:47 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id q19sm12833259ejy.50.2021.04.27.01.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 01:38:47 -0700 (PDT)
Date: Tue, 27 Apr 2021 10:38:45 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH RESEND v2 3/6] target/arm/kvm: Add an option to turn
 on/off el2 support
Message-ID: <20210427083845.xlrgpzae7k7g7ahq@gator.home>
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <80d8bac17a21b41b36cde3eec6c9681b93f43d7c.1617281290.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <80d8bac17a21b41b36cde3eec6c9681b93f43d7c.1617281290.git.haibo.xu@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oafLxQROka6b

On Thu, Apr 01, 2021 at 05:55:35AM -0700, Haibo Xu wrote:
> Adds an el2=[on/off] option to enable/disable el2(nested virtualization)
                                                   ^ space, please

> support in KVM guest vCPU.
> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/cpu.c   | 11 ++++++++++
>  target/arm/cpu.h   |  4 ++++
>  target/arm/cpu64.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ae04884408..30cc330f50 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1349,6 +1349,17 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>                  return;
>              }
>          }
> +
> +        /*
> +         * Currently, vCPU feature 'el2' only supported in KVM mode.
> +         */
> +        if (kvm_enabled()) {
> +            arm_cpu_el2_finalize(cpu, &local_err);
> +            if (local_err != NULL) {
> +                error_propagate(errp, local_err);
> +                return;
> +            }
> +        }

nit: We could tie this 'if (kvm_enabled())' block to the
'if (!kvm_enabled())' block above it by turning one or the other
into an else clause.

>      }
>  
>      if (kvm_enabled()) {
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 193a49ec7f..19fa9cfbfd 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -203,10 +203,12 @@ typedef struct {
>  # define ARM_MAX_VQ    16
>  void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
>  void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
> +void arm_cpu_el2_finalize(ARMCPU *cpu, Error **errp);
>  #else
>  # define ARM_MAX_VQ    1
>  static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
>  static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
> +static inline void arm_cpu_el2_finalize(ARMCPU *cpu, Error **errp) { }
>  #endif
>  
>  typedef struct ARMVectorReg {
> @@ -1058,6 +1060,7 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
>  void aarch64_sve_change_el(CPUARMState *env, int old_el,
>                             int new_el, bool el0_a64);
>  void aarch64_add_sve_properties(Object *obj);
> +void aarch64_add_el2_properties(Object *obj);
>  
>  /*
>   * SVE registers are encoded in KVM's memory in an endianness-invariant format.
> @@ -1089,6 +1092,7 @@ static inline void aarch64_sve_change_el(CPUARMState *env, int o,
>                                           int n, bool a)
>  { }
>  static inline void aarch64_add_sve_properties(Object *obj) { }
> +static inline void aarch64_add_el2_properties(Object *obj) { }
>  #endif
>  
>  void aarch64_sync_32_to_64(CPUARMState *env);
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index f0a9e968c9..3f3f2c5495 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -603,6 +603,58 @@ static Property arm_cpu_pauth_property =
>  static Property arm_cpu_pauth_impdef_property =
>      DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
>  
> +void arm_cpu_el2_finalize(ARMCPU *cpu, Error **errp)
> +{
> +    if (cpu->has_el2) {
> +        if (!kvm_enabled() || !kvm_arm_el2_supported()) {
> +            error_setg(errp, "'el2' cannot be enabled on this host");
> +            return;
> +        }
> +    }
> +
> +    if (cpu->has_el2) {
> +        set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    } else {
> +        unset_feature(&cpu->env, ARM_FEATURE_EL2);
> +    }
> +}
> +
> +static bool arm_get_el2(Object *obj, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    return cpu->has_el2;
> +}
> +
> +static void arm_set_el2(Object *obj, bool value, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    if (value) {
> +        if (!kvm_enabled() || !kvm_arm_el2_supported()) {
> +            error_setg(errp, "'el2' cannot be enabled on this host");
> +            return;
> +        }
> +        set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    } else {
> +        unset_feature(&cpu->env, ARM_FEATURE_EL2);
> +    }
> +
> +    cpu->has_el2 = value;
> +}
> +
> +void aarch64_add_el2_properties(Object *obj)
> +{
> +    /*
> +     * vCPU feature 'el2' is only available in KVM mode, and is
> +     * disabled by default to keep in line with that in TCG mode.
> +     */
> +    ARM_CPU(obj)->has_el2 = false;
> +    object_property_add_bool(obj, "el2", arm_get_el2, arm_set_el2);
> +    object_property_set_description(obj, "el2", "Set off to disable "
> +                                    "nested virtulization.");

Since the default is 'off', it seems like the description should be
instructing one to set 'on to enable' instead. Or both, like the
description of the 'aarch64' property does.

> +}
> +
>  /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
>   * otherwise, a CPU with as many features enabled as our emulation supports.
>   * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
> -- 
> 2.17.1
> 
>

Thanks,
drew 

