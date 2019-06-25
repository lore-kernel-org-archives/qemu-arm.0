Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4742563wrg;
        Tue, 25 Jun 2019 02:35:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqypXcf5/BLkbrP09f9hsIzE7EtrAeMukkXcT1swTbhlzF32z6O1UqqChHhpJBal4USPMNFj
X-Received: by 2002:ac8:5485:: with SMTP id h5mr12574627qtq.253.1561455317022;
        Tue, 25 Jun 2019 02:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561455317; cv=none;
        d=google.com; s=arc-20160816;
        b=TEmz6Sx4/vfdK9883jKwQIL1g8sdx0UnUfI9A+LtbVqlCZ/rWqKJiYGm98dhlpmMCW
         mc5QWKqek6wvlC2dtkTXf1RLS8FjKi9v+49lUJsBV/TemznodOdV8VBTBsSvOtetnld2
         Ds1bYFLN4XKJtq/pik3uxHCBuWVm8K6Z4DM73arC0WMH3IoVrxy28WZYFh/w6WI0eTwd
         Nzc0X2E8UxeOzg94qL1wnHPOjSee//EsFk93CzmB3eDSGZCVCnX7anLEKCLuZPdRF6FQ
         SFur9+WkVWmcL5T9g6bXnanXaG4HhkNrSYd/mnqbVVoOpO4ZnNZuc7r8eLI4nbJwwIGF
         cd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject:from;
        bh=gZjRzZxrUMwlaeDPVM4D+VQmYwFLbLko6o4Wnv5KCEs=;
        b=t0DGGuo+tc9BTqNGWs8yMl5vetwhGdLQ+iNuY+7XvwOVBQHiVPwXC8py3zEHvtM3sT
         EVh7TVNZQqFAXOn7V7doDNPnA82kkL+Zah6/+xIGNBNyPEWpJyOA3vy9nxCl2uEz9h3b
         iDBz2D+qp31OjIvld6di/YmLEfUuRWujzRX7kBSY8Qe/+g6GbExDeaaQ1WyQC2n7TfLi
         Bzj5dH2Uu8Lnx/worVAQHUUoFS+YXmP/0ZPiqUua0CmMbpiqVMgMtfOVbiLDkmEPoYsm
         I+cXZTKv/wHBb4YxuKrl7ThG5lEtjJtjGXtsbmQNJyqeS7OlMJ7pRvuJfCPtw/5brsIk
         z/pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c38si10043932qvh.52.2019.06.25.02.35.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 02:35:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B2F35F72C;
	Tue, 25 Jun 2019 09:35:16 +0000 (UTC)
Received: from [10.36.116.89] (ovpn-116-89.ams2.redhat.com [10.36.116.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEB435C22F;
	Tue, 25 Jun 2019 09:35:13 +0000 (UTC)
From: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v2 01/14] target/arm/cpu64: Ensure kvm really supports
 aarch64=off
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
 Dave.Martin@arm.com, imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-2-drjones@redhat.com>
Message-ID: <1ed69063-eaae-2c02-1fe1-2650492496d4@redhat.com>
Date: Tue, 25 Jun 2019 11:35:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-2-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Tue, 25 Jun 2019 09:35:16 +0000 (UTC)
X-TUID: ArTEUJeoWsjX

Hi Drew,

On 6/21/19 6:34 PM, Andrew Jones wrote:
> If -cpu <cpu>,aarch64=off is used then KVM must also be used, and it
> and the host must support running the vcpu in 32-bit mode. Also, if
> -cpu <cpu>,aarch64=on is used, then it doesn't matter if kvm is
> enabled or not.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>


> ---
>  target/arm/cpu64.c   | 12 ++++++------
>  target/arm/kvm64.c   | 11 +++++++++++
>  target/arm/kvm_arm.h | 14 ++++++++++++++
>  3 files changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 1901997a0645..946994838d8a 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -407,13 +407,13 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
>       * restriction allows us to avoid fixing up functionality that assumes a
>       * uniform execution state like do_interrupt.
>       */> -    if (!kvm_enabled()) {
> -        error_setg(errp, "'aarch64' feature cannot be disabled "
> -                         "unless KVM is enabled");
> -        return;
> -    }
> -
>      if (value == false) {
> +        if (!kvm_enabled() || !kvm_arm_aarch32_supported(CPU(cpu))) {
> +            error_setg(errp, "'aarch64' feature cannot be disabled "
> +                             "unless KVM is enabled and 32-bit EL1 "
> +                             "is supported");
> +            return;
> +        }
>          unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
>      } else {
>          set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 22d19c9aec6f..45ccda589903 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -24,7 +24,9 @@
>  #include "exec/gdbstub.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/kvm_int.h"
>  #include "kvm_arm.h"
> +#include "hw/boards.h"
>  #include "internals.h"
>  
>  static bool have_guest_debug;
> @@ -593,6 +595,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      return true;
>  }
>  
> +bool kvm_arm_aarch32_supported(CPUState *cpu)
> +{
> +    KVMState *s = KVM_STATE(current_machine->accelerator);
> +    int ret;
> +
> +    ret = kvm_check_extension(s, KVM_CAP_ARM_EL1_32BIT);
> +    return ret > 0;
nit: return kvm_check_extension() should be sufficient
> +}
> +
>  #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
>  
>  int kvm_arch_init_vcpu(CPUState *cs)
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 2a07333c615f..812125f805a1 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -207,6 +207,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
>   */
>  void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
>  
> +/**
> + * kvm_arm_aarch32_supported:
> + * @cs: CPUState
use kernel-doc comment style?
> + *
> + * Returns true if the KVM VCPU can enable AArch32 mode and false
> + * otherwise.
> + */
> +bool kvm_arm_aarch32_supported(CPUState *cs);
> +
>  /**
>   * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
>   * IPA address space supported by KVM
> @@ -247,6 +256,11 @@ static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>      cpu->host_cpu_probe_failed = true;
>  }
>  
> +static inline bool kvm_arm_aarch32_supported(CPUState *cs)
> +{
> +    return false;
> +}
> +
>  static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
>  {
>      return -ENOENT;
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
