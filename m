Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9404238wrv;
        Wed, 24 Jul 2019 07:19:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzvUA8D+ZZc/EBN5H+teTmlNlQwpnG5GysNmTXqsu3QEjRSpGTs/RVV/tRhgX86NQuPSIxH
X-Received: by 2002:ac8:323a:: with SMTP id x55mr56556461qta.211.1563977989684;
        Wed, 24 Jul 2019 07:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563977989; cv=none;
        d=google.com; s=arc-20160816;
        b=rm2a1qgftsILWSyACA2aIT33jKWbJnrP1JFYmQ7enZ9e2j9zevZ8hesXBw3Vu/wDZ1
         Quw8yUO1kn4nILgjc0UZnlbrwq3/eNb3RfaIqaAaBsDNuQc5OcAqP9gmEn1JMR5AgYTl
         pO4vCtMNiIyafGAVkh7mHQ0eiaP5psuu+uVQ0JRfumb2EoefY5dWGXcFSJfQSsOPuJF0
         m1DiGTXXUTQRjoYh0Nkbrm6Huw8IpFemL7yMqEROXYHPIzwdiGsGiSX9UMYJMsqocuxR
         QfPX/EfSl2UlITFW0EQirhm3d+EKdcFeb9xD0EuFGasJaHaGjF2twae0krY5RZFBDE9D
         KQmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=aV8tJ9x8Uq00+xf0r1fu5Hd4ckIn9YB+2TcEhwYVKnw=;
        b=yeQ/qPViCR9bsDZqvvmLqq9yYpgdNGJEdLSjr6uIkkS7TbX78z0WpVRdi603FL+TDE
         cK43tKmTDuf37mefTctRKvoZfg/nM3BmedMjG2VtZoJYT0Xd0Jfdgf+MwW9EgdiZazRP
         UM087ZXES3S3ytL/g1DKyVMNpwSgSSlYKjVVCBTym9d6EB6VFwDKSJInlKwI6XzLr3aY
         CJbzUiXAthsDGH/GBrNylsVvdnUrEPpLzbDZlWNHxMMpyKV7UY7rxco3aNxwHxpbBmvf
         XTQIthXjBTyw+EQLqH38JKGdWY0r9nJcekDAZKdu1OEr2Ok/A6aqQdTWS4DknLXpzccq
         w2LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id w64si28197478qkb.254.2019.07.24.07.19.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 07:19:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CEC1C307D844;
	Wed, 24 Jul 2019 14:19:48 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 859F760619;
	Wed, 24 Jul 2019 14:19:46 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2 01/14] target/arm/cpu64: Ensure kvm really
 supports aarch64=off
To: Andrew Jones <drjones@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-2-drjones@redhat.com>
 <1ed69063-eaae-2c02-1fe1-2650492496d4@redhat.com>
 <20190625133452.3f4ik4xn7vh5zi2b@kamzik.brq.redhat.com>
 <8dea18ae-39ed-6f7d-0e91-61abd22eb74e@redhat.com>
 <20190724135237.z5ufzxutnkpvt6vg@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <facf08ac-ac96-a4de-7b06-c78633dacd09@redhat.com>
Date: Wed, 24 Jul 2019 16:19:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190724135237.z5ufzxutnkpvt6vg@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 24 Jul 2019 14:19:48 +0000 (UTC)
X-TUID: 2qilMcOdmyDu

Hi Drew,

On 7/24/19 3:52 PM, Andrew Jones wrote:
> On Wed, Jul 24, 2019 at 02:51:15PM +0200, Auger Eric wrote:
>> Hi Drew,
>>
>> On 6/25/19 3:34 PM, Andrew Jones wrote:
>>> On Tue, Jun 25, 2019 at 11:35:12AM +0200, Auger Eric wrote:
>>>> Hi Drew,
>>>>
>>>> On 6/21/19 6:34 PM, Andrew Jones wrote:
>>>>> If -cpu <cpu>,aarch64=off is used then KVM must also be used, and it
>>>>> and the host must support running the vcpu in 32-bit mode. Also, if
>> s/and it//
> 
> "and it and the host" means "and KVM and the host", as 'it' refers to the
> last subject, which is KVM. I wanted to point out both the host (machine)
> and KVM (version of kernel with KVM) need to support the feature.
hum ok
> 
>>>>> -cpu <cpu>,aarch64=on is used, then it doesn't matter if kvm is
>>>>> enabled or not.
>>>>>
>>>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>>>
>>>>
>>>>> ---
>>>>>  target/arm/cpu64.c   | 12 ++++++------
>>>>>  target/arm/kvm64.c   | 11 +++++++++++
>>>>>  target/arm/kvm_arm.h | 14 ++++++++++++++
>>>>>  3 files changed, 31 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>>>>> index 1901997a0645..946994838d8a 100644
>>>>> --- a/target/arm/cpu64.c
>>>>> +++ b/target/arm/cpu64.c
>>>>> @@ -407,13 +407,13 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
>>>>>       * restriction allows us to avoid fixing up functionality that assumes a
>>>>>       * uniform execution state like do_interrupt.
>>>>>       */> -    if (!kvm_enabled()) {
>>>>> -        error_setg(errp, "'aarch64' feature cannot be disabled "
>>>>> -                         "unless KVM is enabled");
>>>>> -        return;
>>>>> -    }
>>>>> -
>>>>>      if (value == false) {
>>>>> +        if (!kvm_enabled() || !kvm_arm_aarch32_supported(CPU(cpu))) {
>>>>> +            error_setg(errp, "'aarch64' feature cannot be disabled "
>>>>> +                             "unless KVM is enabled and 32-bit EL1 "
>>>>> +                             "is supported");
>>>>> +            return;
>>>>> +        }
>>>>>          unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
>>>>>      } else {
>>>>>          set_feature(&cpu->env, ARM_FEATURE_AARCH64);
>>>>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>>>>> index 22d19c9aec6f..45ccda589903 100644
>>>>> --- a/target/arm/kvm64.c
>>>>> +++ b/target/arm/kvm64.c
>>>>> @@ -24,7 +24,9 @@
>>>>>  #include "exec/gdbstub.h"
>>>>>  #include "sysemu/sysemu.h"
>>>>>  #include "sysemu/kvm.h"
>>>>> +#include "sysemu/kvm_int.h"
>>>>>  #include "kvm_arm.h"
>>>>> +#include "hw/boards.h"
>> By the way those two new headers are not needed by this patch
> 
> Really?
> 
> current_machine is defined in hw/boards.h and KVM_STATE is defined
> in sysemu/kvm_int.h.
argh my bad.

Sorry for the noise

Eric
> 
>>>>>  #include "internals.h"
>>>>>  
>>>>>  static bool have_guest_debug;
>>>>> @@ -593,6 +595,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>>>>      return true;
>>>>>  }
>>>>>  
>>>>> +bool kvm_arm_aarch32_supported(CPUState *cpu)
>>>>> +{
>>>>> +    KVMState *s = KVM_STATE(current_machine->accelerator);
>>>>> +    int ret;
>>>>> +
>>>>> +    ret = kvm_check_extension(s, KVM_CAP_ARM_EL1_32BIT);
>>>>> +    return ret > 0;
>>>> nit: return kvm_check_extension() should be sufficient
>>>
>>> Ah yes, I forgot kvm_check_extension() already converts negative
>>> error codes to zero. I'll fix that for v3.
>>>
>>>>> +}
>>>>> +
>>>>>  #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
>>>>>  
>>>>>  int kvm_arch_init_vcpu(CPUState *cs)
>>>>> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
>>>>> index 2a07333c615f..812125f805a1 100644
>>>>> --- a/target/arm/kvm_arm.h
>>>>> +++ b/target/arm/kvm_arm.h
>>>>> @@ -207,6 +207,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
>>>>>   */
>>>>>  void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
>>>>>  
>>>>> +/**
>>>>> + * kvm_arm_aarch32_supported:
>>>>> + * @cs: CPUState
>>>> use kernel-doc comment style?
>>>
>>> This file (kvm_arm.h) doesn't appear to have a super consistent comment
>>> style. I see some use @var: for the parameters and some have 'Returns:
>>> ...' lines as well. I'm happy to do whatever the maintainers prefer. For
>>> now I was just trying to mimic whatever caught my eye.>
>>>>> + *
>>>>> + * Returns true if the KVM VCPU can enable AArch32 mode and false
>>>>> + * otherwise.
>>>>> + */
>>>>> +bool kvm_arm_aarch32_supported(CPUState *cs);
>>>>> +
>>>>>  /**
>>>>>   * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
>>>>>   * IPA address space supported by KVM
>>>>> @@ -247,6 +256,11 @@ static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>>>>>      cpu->host_cpu_probe_failed = true;
>>>>>  }
>>>>>  
>>>>> +static inline bool kvm_arm_aarch32_supported(CPUState *cs)
>>>>> +{
>>>>> +    return false;
>>>>> +}
>>>>> +
>>>>>  static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
>>>>>  {
>>>>>      return -ENOENT;
>>>>>
>>>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> Thanks,
> drew
> 
