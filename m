Received: by 10.28.71.27 with SMTP id u27csp960262wma;
        Fri, 26 Jan 2018 09:32:25 -0800 (PST)
X-Google-Smtp-Source: AH8x225XdACVeIV6v3KvC3TQBmz8PVhrJqfPqNwdKGNCltGadvh2ZrWTHssMXUVuLWAjglBWgRyb
X-Received: by 10.13.196.2 with SMTP id g2mr11610786ywd.305.1516987945056;
        Fri, 26 Jan 2018 09:32:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516987945; cv=none;
        d=google.com; s=arc-20160816;
        b=TnVko9jO+9gMyM7A6ZjxrNVFAkVT65T6zc/E3HiG6wIDBCrQxgyX4Z1dJZRgx6AgAC
         D+laDWHeyr/AUtXbiDUDwI7dPAPpK3qdNHGHUJPA/sjpq7F2AY/WNoc8MRVRu/EIqoQd
         uTLDjbQ6xEvrTYG5LV9n1NaupManVDffECqP/C6hB4jR8SvZ37yWr0YNe7WlB5NI0WmF
         JvfF39HXRM9/76KIujyYSmxVUEycWkXNDAqCtmycg+sLGCs+JYxWl6eMtUj4g6P/kwJy
         oWb0rS/FVP+mJug5r/mEmW957Ij+1LjTaE/Yy8WDVoCQN1oljitS7kDLWVufgP36IVPL
         yRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Mkut+hZSVHYDXjlOL/lrc/mTTPuMym92lPDRvjAyPoY=;
        b=b3UuPzj41vD9Q8TGr7xd6IUivv8QFzG8T7lFx++Ebi0zPDLheePwc2nlqctydBaDrK
         YJfIinmR2XAAfa2Dtg35yaN0Hd2U5n3X1m9eHJ/U1hnHVB7dr+XqudGrxhNNWr3wfm06
         znPskGdyAHrvNVzYBFn/O3S+CX0XUHQxMq10whtCM1EGYAv1ELC+hadAin3aPJc7E2nV
         hiz80MPXjn+LnqjaPTYjadM4A5uGGn/GzU5fUMQlMnfKrXFu6UF/f6FnoZnzsk06rngJ
         9pYWnIpi9dbzW0MREddFnc9eV6kK63f5jfg1ixwEboMCkYM9118PmkpOvzCyPeBAhnky
         aPhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DDSbTyK8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v10si3664819ybl.55.2018.01.26.09.32.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 09:32:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DDSbTyK8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef7rU-0000Pg-EW
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 12:32:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef7rE-0000NL-4U
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 12:32:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef7rB-0004vQ-PG
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 12:32:08 -0500
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:35964)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef7r4-0004kA-Ex; Fri, 26 Jan 2018 12:31:58 -0500
Received: by mail-qt0-x22f.google.com with SMTP id z11so3172268qtm.3;
	Fri, 26 Jan 2018 09:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Mkut+hZSVHYDXjlOL/lrc/mTTPuMym92lPDRvjAyPoY=;
	b=DDSbTyK8f/0qHtbAuBDtIRR7bkmkUc4GDc0iBVvAPbOlT2di+auVjgJZim7hPRlB5J
	9yXblXEuu8fRO+0S7bJWetnaDSLzbPFPVC2uPRYvVKx4tH2ShzI51brPdy3eip4fjwCr
	krKqPEgg2li2p/sp5T6YXpQsvDywGXqkL6EO5RMPdraDJhq5xJJnBGpRbnEoUxJ+F+W+
	wd4tUD4ZjghfTCkMTsv+bUGs1i2gnTpoKNwHsSUH3ung0vREg85Dk7NLO4LTLl3eY78H
	omFkkOuiiu3Br6MfT+ve0p335PkMsyj/lGcHpWEATPUzt8qdGkfu+WufUAzkIeQjY1NA
	t7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Mkut+hZSVHYDXjlOL/lrc/mTTPuMym92lPDRvjAyPoY=;
	b=TLkR0yXwHnyKj3yyBOhl74me/tumlrMOeVQcOKRR+BpPfN2xWvELwUpaKZ9b11A8+Q
	FT4XrV/XaRnKfTuxC2Zgqe8/zgKah56xSP2r04sUmRo+KSDIN9ByW3MWsyixTBygLYGn
	NA5ykSJyZkjJhA5aS7ya+62RdDmhR0s77pDxEoQ/8aLRQ1s7Ack4PxyYVWi3ghFvh9fv
	/Vworv2K9mXiwDvkyKw6dZ2FNFx+Sz3MTHd/sPd3bETQX6AOhZJ2M4QUtof8nTNIG43c
	FM3wkrDAkwZTfaPJj1s6lmB0Ofs1jvpAbBXpRQOFecEUit/mgIxh8nquSKKmT/UpTxrM
	NBQA==
X-Gm-Message-State: AKwxytd9cP3sGZ37Kb0p8VugcNLq92gwZU7tcYTlbQctk/YUycP+HmRo
	aVveHbkXylQag3+BdV+epvmwoXKb
X-Received: by 10.55.107.3 with SMTP id g3mr19932416qkc.193.1516974820497;
	Fri, 26 Jan 2018 05:53:40 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	g103sm3689388qkh.75.2018.01.26.05.53.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Jan 2018 05:53:39 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<1512670493-18114-3-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <b0cca08b-86b4-30cb-65a2-9cf35190b1ce@amsat.org>
Date: Fri, 26 Jan 2018 10:53:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1512670493-18114-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: Re: [Qemu-arm] [PATCH 2/6] target/arm: Query host CPU features
 on-demand at instance init
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7DiilrDjONkX

On 12/07/2017 03:14 PM, Peter Maydell wrote:
> Currently we query the host CPU features in the class init function
> for the TYPE_ARM_HOST_CPU class, so that we can later copy them
> from the class object into the instance object in the object
> instance init function. This is awkward for implementing "-cpu max",
> which should work like "-cpu host" for KVM but like "cpu with all
> implemented features" for TCG.
> 
> Move the place where we store the information about the host CPU from
> a class object to static variables in kvm.c, and then in the instance
> init function call a new kvm_arm_set_cpu_features_from_host()
> function which will query the host kernel if necessary and then
> fill in the CPU instance fields.
> 
> This allows us to drop the special class struct and class init
> function for TYPE_ARM_HOST_CPU entirely.
> 
> We can't delay the probe until realize, because the ARM
> instance_post_init hook needs to look at the feature bits we
> set, so we need to do it in the initfn. This is safe because
> the probing doesn't affect the actual VM state (it creates a
> separate scratch VM to do its testing), but the probe might fail.
> Because we can't report errors in retrieving the host features
> in the initfn, we check this belatedly in the realize function
> (the intervening code will be able to cope with the relevant
> fields in the CPU structure being zero).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/cpu.h     |  5 +++++
>  target/arm/kvm_arm.h | 35 ++++++++++++++++++++++++-----------
>  target/arm/cpu.c     | 13 +++++++++++++
>  target/arm/kvm.c     | 36 +++++++++++++++++++-----------------
>  target/arm/kvm32.c   |  8 ++++----
>  target/arm/kvm64.c   |  8 ++++----
>  6 files changed, 69 insertions(+), 36 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 89d49cd..5b01cf9 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -690,6 +690,11 @@ struct ARMCPU {
>      /* Uniprocessor system with MP extensions */
>      bool mp_is_up;
>  
> +    /* True if we tried kvm_arm_host_cpu_features() during CPU instance_init
> +     * and the probe failed (so we need to report the error in realize)
> +     */
> +    bool host_cpu_probe_failed;
> +
>      /* The instance init functions for implementation-specific subclasses
>       * set these fields to specify the implementation-dependent values of
>       * various constant registers and reset values of non-constant
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index ff53e9f..89d1b67 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -152,20 +152,16 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>  void kvm_arm_destroy_scratch_host_vcpu(int *fdarray);
>  
>  #define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
> -#define ARM_HOST_CPU_CLASS(klass) \
> -    OBJECT_CLASS_CHECK(ARMHostCPUClass, (klass), TYPE_ARM_HOST_CPU)
> -#define ARM_HOST_CPU_GET_CLASS(obj) \
> -    OBJECT_GET_CLASS(ARMHostCPUClass, (obj), TYPE_ARM_HOST_CPU)
> -
> -typedef struct ARMHostCPUClass {
> -    /*< private >*/
> -    ARMCPUClass parent_class;
> -    /*< public >*/
>  
> +/**
> + * ARMHostCPUFeatures: information about the host CPU (identified
> + * by asking the host kernel)
> + */
> +typedef struct ARMHostCPUFeatures {
>      uint64_t features;
>      uint32_t target;
>      const char *dtb_compatible;
> -} ARMHostCPUClass;
> +} ARMHostCPUFeatures;
>  
>  /**
>   * kvm_arm_get_host_cpu_features:
> @@ -174,8 +170,16 @@ typedef struct ARMHostCPUClass {
>   * Probe the capabilities of the host kernel's preferred CPU and fill
>   * in the ARMHostCPUClass struct accordingly.
>   */
> -bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc);
> +bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
>  
> +/**
> + * kvm_arm_set_cpu_features_from_host:
> + * @cpu: ARMCPU to set the features for
> + *
> + * Set up the ARMCPU struct fields up to match the information probed
> + * from the host CPU.
> + */
> +void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
>  
>  /**
>   * kvm_arm_sync_mpstate_to_kvm
> @@ -200,6 +204,15 @@ void kvm_arm_pmu_init(CPUState *cs);
>  
>  #else
>  
> +static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
> +{
> +    /* This should never actually be called in the "not KVM" case,
> +     * but set up the fields to indicate an error anyway.
> +     */
> +    cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
> +    cpu->host_cpu_probe_failed = true;
> +}
> +
>  static inline int kvm_arm_vgic_probe(void)
>  {
>      return 0;
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 7f7a3d1..a7deb10 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -709,6 +709,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      AddressSpace *as;
>  #endif
>  
> +    /* If we needed to query the host kernel for the CPU features
> +     * then it's possible that might have failed in the initfn, but
> +     * this is the first point where we can report it.
> +     */
> +    if (cpu->host_cpu_probe_failed) {
> +        if (!kvm_enabled()) {
> +            error_setg(errp, "The 'host' CPU type can only be used with KVM");
> +        } else {
> +            error_setg(errp, "Failed to retrieve host CPU features");
> +        }
> +        return;
> +    }
> +
>      cpu_exec_realizefn(cs, &local_err);
>      if (local_err != NULL) {
>          error_propagate(errp, local_err);
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 211a7bf..945696c 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -33,6 +33,8 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>  
>  static bool cap_has_mp_state;
>  
> +static ARMHostCPUFeatures arm_host_cpu_features;
> +
>  int kvm_arm_vcpu_init(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
> @@ -129,30 +131,32 @@ void kvm_arm_destroy_scratch_host_vcpu(int *fdarray)
>      }
>  }
>  
> -static void kvm_arm_host_cpu_class_init(ObjectClass *oc, void *data)
> +void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>  {
> -    ARMHostCPUClass *ahcc = ARM_HOST_CPU_CLASS(oc);
> +    CPUARMState *env = &cpu->env;
>  
> -    /* All we really need to set up for the 'host' CPU
> -     * is the feature bits -- we rely on the fact that the
> -     * various ID register values in ARMCPU are only used for
> -     * TCG CPUs.
> -     */
> -    if (!kvm_arm_get_host_cpu_features(ahcc)) {
> -        fprintf(stderr, "Failed to retrieve host CPU features!\n");
> -        abort();
> +    if (!arm_host_cpu_features.dtb_compatible) {
> +        if (!kvm_enabled() ||
> +            !kvm_arm_get_host_cpu_features(&arm_host_cpu_features)) {
> +            /* We can't report this error yet, so flag that we need to
> +             * in arm_cpu_realizefn().
> +             */
> +            cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
> +            cpu->host_cpu_probe_failed = true;
> +            return;
> +        }
>      }
> +
> +    cpu->kvm_target = arm_host_cpu_features.target;
> +    cpu->dtb_compatible = arm_host_cpu_features.dtb_compatible;
> +    env->features = arm_host_cpu_features.features;
>  }
>  
>  static void kvm_arm_host_cpu_initfn(Object *obj)
>  {
> -    ARMHostCPUClass *ahcc = ARM_HOST_CPU_GET_CLASS(obj);
>      ARMCPU *cpu = ARM_CPU(obj);
> -    CPUARMState *env = &cpu->env;
>  
> -    cpu->kvm_target = ahcc->target;
> -    cpu->dtb_compatible = ahcc->dtb_compatible;
> -    env->features = ahcc->features;
> +    kvm_arm_set_cpu_features_from_host(cpu);
>  }
>  
>  static const TypeInfo host_arm_cpu_type_info = {
> @@ -163,8 +167,6 @@ static const TypeInfo host_arm_cpu_type_info = {
>      .parent = TYPE_ARM_CPU,
>  #endif
>      .instance_init = kvm_arm_host_cpu_initfn,
> -    .class_init = kvm_arm_host_cpu_class_init,
> -    .class_size = sizeof(ARMHostCPUClass),
>  };
>  
>  int kvm_arch_init(MachineState *ms, KVMState *s)
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index f925a21..cc326ea 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -28,7 +28,7 @@ static inline void set_feature(uint64_t *features, int feature)
>      *features |= 1ULL << feature;
>  }
>  
> -bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
> +bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>  {
>      /* Identify the feature bits corresponding to the host CPU, and
>       * fill out the ARMHostCPUClass fields accordingly. To do this
> @@ -74,13 +74,13 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
>          return false;
>      }
>  
> -    ahcc->target = init.target;
> +    ahcf->target = init.target;
>  
>      /* This is not strictly blessed by the device tree binding docs yet,
>       * but in practice the kernel does not care about this string so
>       * there is no point maintaining an KVM_ARM_TARGET_* -> string table.
>       */
> -    ahcc->dtb_compatible = "arm,arm-v7";
> +    ahcf->dtb_compatible = "arm,arm-v7";
>  
>      for (i = 0; i < ARRAY_SIZE(idregs); i++) {
>          ret = ioctl(fdarray[2], KVM_GET_ONE_REG, &idregs[i]);
> @@ -132,7 +132,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
>          set_feature(&features, ARM_FEATURE_VFP4);
>      }
>  
> -    ahcc->features = features;
> +    ahcf->features = features;
>  
>      return true;
>  }
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 6554c30..8f8f828 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -443,7 +443,7 @@ static inline void unset_feature(uint64_t *features, int feature)
>      *features &= ~(1ULL << feature);
>  }
>  
> -bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
> +bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>  {
>      /* Identify the feature bits corresponding to the host CPU, and
>       * fill out the ARMHostCPUClass fields accordingly. To do this
> @@ -471,8 +471,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
>          return false;
>      }
>  
> -    ahcc->target = init.target;
> -    ahcc->dtb_compatible = "arm,arm-v8";
> +    ahcf->target = init.target;
> +    ahcf->dtb_compatible = "arm,arm-v8";
>  
>      kvm_arm_destroy_scratch_host_vcpu(fdarray);
>  
> @@ -486,7 +486,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
>      set_feature(&features, ARM_FEATURE_AARCH64);
>      set_feature(&features, ARM_FEATURE_PMU);
>  
> -    ahcc->features = features;
> +    ahcf->features = features;
>  
>      return true;
>  }
> 
