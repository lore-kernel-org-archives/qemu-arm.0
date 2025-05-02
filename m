Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp809955njj;
        Fri, 2 May 2025 05:31:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJXJh6sdEXJKdCNsqpdDESynd3jfmXwgj9XkOXtPdQ81prokJ7+W42rWMFRcLOurNc6ZdnorrcYdsLig==@linaro.org
X-Google-Smtp-Source: AGHT+IFgHPjDqaYDcLdSuIB7xHVlbiHRj2RjQabdOJnrkJOI9O5xMTStgFFZdlc6HFYE9PIszE4L
X-Received: by 2002:a05:620a:1915:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7cad5ba3edfmr375100685a.43.1746189111192;
        Fri, 02 May 2025 05:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746189111; cv=none;
        d=google.com; s=arc-20240605;
        b=QERujTUX7x1QK31X7Fyairj51L+dEmpNs34+4pBBcgRse8QATQ+bJxhvZrjxHXpDAn
         4H9oAaSOemWLOTxoKBH/RLDdL2BW4mdTkn5m5nE0svMuRUTHJZcwJ58yq+CCujd/PERL
         roACWGy1LdeLF0GB8JRo4YJYLTH6aMrQ1hLUeivsCMDAHzrs1HGPHp0rK8zvv12BAaMX
         JZ+GFgP7HwSBMTKZ+Zp3yAsgFKtGjp4JdkSMriFq7g3kFafiuLqK54IjH0r78IIPeIT6
         V4/y3GsUSTLInwP09hjUx1C4owoALuEybcV3PDFTsQ+A17IZyC22hcVKh1Iveo70bgQ3
         Irxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UniOiXHVdMdpdxGGj01tC38CGn7tbFhoDRs6dSjrA7Y=;
        fh=RSX5RkXq4RG8KON+qVJyw6zu06Q6aV+StctqNe1ZuAk=;
        b=E7PS8di+qYIf4Fsk/u/4Ybmuk7v+hLLNxsowBSNb7tMuhLfruPjfBMBorb/uznzm85
         crzNlF3eMtxSWabUHE6eO7qhH4BgQ9bC1Upcip+RvdRUsankGABezstquwvXZksygBSe
         LCwWy24zQ2WanMVp45wPHcecxwh4pECyHz7Lxw/oLpJcJ+Flbjfz2td9wuuqfBIZpnW2
         grpQzlPEl8w2MP+TZ+D2MAj9QB9MmaiUyWawI66l5htQGqZvnzjUzt5C9Z2MkVvtFAPm
         411X7SXXzSdsBJ70hwpqEf2F7L8l3V5P1/zv5tjBtNtLD0c1aAP0q40omN8p3DtFVof/
         DPqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R0iepS9U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cad23ba9a5si283172385a.5.2025.05.02.05.31.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 05:31:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R0iepS9U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uApYI-0000ye-Ol; Fri, 02 May 2025 08:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uApXr-0000sw-Lj
 for qemu-arm@nongnu.org; Fri, 02 May 2025 08:31:19 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uApXm-0002GP-Ho
 for qemu-arm@nongnu.org; Fri, 02 May 2025 08:31:10 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-708d90aa8f9so2181607b3.3
 for <qemu-arm@nongnu.org>; Fri, 02 May 2025 05:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746189065; x=1746793865; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UniOiXHVdMdpdxGGj01tC38CGn7tbFhoDRs6dSjrA7Y=;
 b=R0iepS9UKQdXw8tyr7y19JWmwaKt808OFtxlFbWdIRFYPlon829oZUtg8093/rTlvK
 e+i+PxulfU0n8Qs3ZsxZjQDyhZjwu2MUZmd57W6ltE5/lXXjbIwrQOAxa5Q+RsHgVLCf
 2dGsVwepc3akysh1Vmll4SHlbW+vtIefgGMdYZh2+vGfDEWwpRRMYczSdrcRv9BZlUkM
 6J9C3BMrpEMJK2/F4UEu5RQCvES6MfKYEgI9fed00eIV6MJoZQuQGbJFCOaBsmsK6jft
 bqQoPx4GMgq0CSib6/QUi1pQf/3aztmNL9zPRbzar2pfFrtumjy+mqbXB4N8GUfqCels
 UARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746189065; x=1746793865;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UniOiXHVdMdpdxGGj01tC38CGn7tbFhoDRs6dSjrA7Y=;
 b=FodtD5EkCXTLvlpKDoC4HebRa2US2/AsHFWpU6foa0qIna9Kf+Qukv//8M+0kQ3MHe
 hpSRZFoxN9n0kbbK+qo6yhmcOtt+C1YIp0+ebUofDPNcRMZ2Po3oohLfWscK1PW9oI3z
 5wGCw9jLcPcx0w6IC1wp42yqeI4BurU0k67Z7o889MA4WIMT/hMMJEyVMEg0zY+A0IC6
 Vk/6Jb7jLE0ZCZVgsz9bnuNE5snxr2+2yIADSbu+GLkkGDndiI2c6V6+vu5Y9tsp0xl7
 a8gAZyq8HN+U2rNAzeUDGqaVLy/w9csNWhoHPNdotG8fJU4GevqONIz89+f+O7yQrcCE
 q9ZQ==
X-Gm-Message-State: AOJu0Yy9iQgK9nw6G7571g9Sm9FOzj0D17QhCE1mR5b9LNHyts7E1juM
 j33gT1J+/qWGp11c4GZSDwRc3RXxJRLyssEwInf4GmbRFHg11XqILIe2krR/vDyoSbl54GjLJ7k
 I7UVaoScqQtxvxfOu0M6Jx7RH+MXmdIGvxQBruFh4+uOvrYy0
X-Gm-Gg: ASbGncuV9GEtWlIvEZQrPyMGkPEU3DYsCSpJ/x+OfPgFz8PZ1mAVOxrnXcJbVH3s2b3
 nkrEhqbTQJfY34FOGA2NF58nUex/tyiM1onsMuW1RpqKGB464fBXTuDYfFTFk6hcyX5HfqlQ+hz
 fKu/RjUuee/r9wCI2A1WNpCgA=
X-Received: by 2002:a05:690c:6f05:b0:706:aee5:162a with SMTP id
 00721157ae682-708cee25a85mr41459507b3.36.1746189064941; Fri, 02 May 2025
 05:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250318114222.1018200-1-peter.maydell@linaro.org>
In-Reply-To: <20250318114222.1018200-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 May 2025 13:30:52 +0100
X-Gm-Features: ATxdqUGxtCzORlO3ip9FS5Eiv9af1_H6IwXBDmRTgut-LxcnH5FW_tMIugNEm_Y
Message-ID: <CAFEAcA9Dd8YRV7jL7UhjPCO003167XgbXCfRRqOdvt0kh9WU8w@mail.gmail.com>
Subject: Re: [PATCH for-10.1] target/arm/kvm: Drop support for kernels without
 KVM_ARM_PREFERRED_TARGET
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UBmDfYmuCUao

Ping for code review, please?

thanks
-- PMM

On Tue, 18 Mar 2025 at 11:42, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Our KVM code includes backwards compatibility support for ancient
> kernels which don't support the KVM_ARM_PREFERRED_TARGET ioctl.  This
> ioctl was introduced in kernel commit 42c4e0c77ac91 in September
> 2013 and is in v3.12, so it's reasonable to assume it's present.
>
> (We already dropped support for kernels without KVM_CAP_DEVICE_CTRL,
> a feature added to the kernel in April 2013, in our commit
> 84f298ea3e; so there are only about six months' worth of kernels,
> from v3.9 to v3.11, that we don't already fail to run on and that
> this commit is dropping handling for.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/kvm_arm.h      |  7 +----
>  target/arm/arm-qmp-cmds.c |  2 +-
>  target/arm/kvm.c          | 55 ++++++---------------------------------
>  3 files changed, 10 insertions(+), 54 deletions(-)
>
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 05c3de8cd46..5f17fc2f3d5 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -97,10 +97,6 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu);
>  #ifdef CONFIG_KVM
>  /**
>   * kvm_arm_create_scratch_host_vcpu:
> - * @cpus_to_try: array of QEMU_KVM_ARM_TARGET_* values (terminated with
> - * QEMU_KVM_ARM_TARGET_NONE) to try as fallback if the kernel does not
> - * know the PREFERRED_TARGET ioctl. Passing NULL is the same as passing
> - * an empty array.
>   * @fdarray: filled in with kvmfd, vmfd, cpufd file descriptors in that order
>   * @init: filled in with the necessary values for creating a host
>   * vcpu. If NULL is provided, will not init the vCPU (though the cpufd
> @@ -113,8 +109,7 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu);
>   * Returns: true on success (and fdarray and init are filled in),
>   * false on failure (and fdarray and init are not valid).
>   */
> -bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
> -                                      int *fdarray,
> +bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
>                                        struct kvm_vcpu_init *init);
>
>  /**
> diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
> index 883c0a0e8cc..a1a944adb43 100644
> --- a/target/arm/arm-qmp-cmds.c
> +++ b/target/arm/arm-qmp-cmds.c
> @@ -46,7 +46,7 @@ static inline void gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3)
>  #ifdef CONFIG_KVM
>      int fdarray[3];
>
> -    if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, NULL)) {
> +    if (!kvm_arm_create_scratch_host_vcpu(fdarray, NULL)) {
>          return;
>      }
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index da30bdbb234..568561c6d54 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -100,8 +100,7 @@ static int kvm_arm_vcpu_finalize(ARMCPU *cpu, int feature)
>      return kvm_vcpu_ioctl(CPU(cpu), KVM_ARM_VCPU_FINALIZE, &feature);
>  }
>
> -bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
> -                                      int *fdarray,
> +bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
>                                        struct kvm_vcpu_init *init)
>  {
>      int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
> @@ -150,40 +149,13 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>          struct kvm_vcpu_init preferred;
>
>          ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, &preferred);
> -        if (!ret) {
> -            init->target = preferred.target;
> +        if (ret < 0) {
> +            goto err;
>          }
> +        init->target = preferred.target;
>      }
> -    if (ret >= 0) {
> -        ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
> -        if (ret < 0) {
> -            goto err;
> -        }
> -    } else if (cpus_to_try) {
> -        /* Old kernel which doesn't know about the
> -         * PREFERRED_TARGET ioctl: we know it will only support
> -         * creating one kind of guest CPU which is its preferred
> -         * CPU type.
> -         */
> -        struct kvm_vcpu_init try;
> -
> -        while (*cpus_to_try != QEMU_KVM_ARM_TARGET_NONE) {
> -            try.target = *cpus_to_try++;
> -            memcpy(try.features, init->features, sizeof(init->features));
> -            ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, &try);
> -            if (ret >= 0) {
> -                break;
> -            }
> -        }
> -        if (ret < 0) {
> -            goto err;
> -        }
> -        init->target = try.target;
> -    } else {
> -        /* Treat a NULL cpus_to_try argument the same as an empty
> -         * list, which means we will fail the call since this must
> -         * be an old kernel which doesn't support PREFERRED_TARGET.
> -         */
> +    ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
> +    if (ret < 0) {
>          goto err;
>      }
>
> @@ -259,17 +231,6 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      uint64_t features = 0;
>      int err;
>
> -    /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
> -     * we know these will only support creating one kind of guest CPU,
> -     * which is its preferred CPU type. Fortunately these old kernels
> -     * support only a very limited number of CPUs.
> -     */
> -    static const uint32_t cpus_to_try[] = {
> -        KVM_ARM_TARGET_AEM_V8,
> -        KVM_ARM_TARGET_FOUNDATION_V8,
> -        KVM_ARM_TARGET_CORTEX_A57,
> -        QEMU_KVM_ARM_TARGET_NONE
> -    };
>      /*
>       * target = -1 informs kvm_arm_create_scratch_host_vcpu()
>       * to use the preferred target
> @@ -300,7 +261,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          features |= 1ULL << ARM_FEATURE_PMU;
>      }
>
> -    if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
> +    if (!kvm_arm_create_scratch_host_vcpu(fdarray, &init)) {
>          return false;
>      }
>
> @@ -1835,7 +1796,7 @@ uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu)
>
>          probed = true;
>
> -        if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, &init)) {
> +        if (!kvm_arm_create_scratch_host_vcpu(fdarray, &init)) {
>              error_report("failed to create scratch VCPU with SVE enabled");
>              abort();
>          }
> --
> 2.43.0
