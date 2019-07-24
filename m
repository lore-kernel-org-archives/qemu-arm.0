Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9308680wrv;
        Wed, 24 Jul 2019 05:51:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzAR3+h2A0M2DGJ5IAwd76iRBR5NiH4GZ16hzLJfrgbMUzEqF7woyG2429A6MitfyDUZDl9
X-Received: by 2002:a0c:baa1:: with SMTP id x33mr59875645qvf.200.1563972679959;
        Wed, 24 Jul 2019 05:51:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563972679; cv=none;
        d=google.com; s=arc-20160816;
        b=nQyxQ18GkSVs3Fjj5QLAhTWRIZV3DHlYwp+8DCM1xIQdaySr57O8oXlkH7AN4mijxI
         +twj4JDa1iJIF7osFKfRbSuf7RyYC0w69WJy8Uw/fvSYmlR5rcmDqPi5jItSF3cUkRVf
         cwxzvVuuGqzOfXoG0vXVHxlj1LbynrVUJ7A7a0dACdo4LrKJlI55EdBVX58hRmFEjsJx
         lEyzVR3eAVbDC5/vFyGvgfCGT1wJCsmMqLbsw2KQeEZYko1XVO+/CmECHbx1uPWnBovg
         4cofHn5ygUIy77EHnewqa0+sAw542MzLR74k2t4E9Vgjf1b5R2GbM99gRYgsZjRsDFeq
         u/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=UVtvYas74LbU/VyodJBDJYtI+XBxSxOmQh4IfU+I1ZQ=;
        b=Ua3wJ+dyiXY1L8rKhpM0EhlGc8ALKNdk5QA3eiu97TLQPPd50+QK90ZV0ebbcKaSjh
         pYfQixC+lMItwTJIehYTMJwqcvjhkfzUs7X1LSUrlfeSArpDUB6637ggq57jyPBrfU1S
         L8z4UIqoybeumU8ZZnclL51RCND8qbfhuUcnmTg2elV4LqJCT0hKkjDiwo115Mqgcgt8
         D3m6w/QR8xIzz9qWid7xgdF9XjPXh2Qw61pLZpTV2OUg6rJLGkv+IZigRsarznr3Ph48
         KTh9HANWiwPlnVbDNWQDVaXiL5cXlAivpXwe48xIEMI64guGF6Ifi5qwbwY6eHEMjrV3
         6nfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id e63si26618071qkc.268.2019.07.24.05.51.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 05:51:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09B09C065F8D;
	Wed, 24 Jul 2019 12:51:19 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF43D60605;
	Wed, 24 Jul 2019 12:51:16 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2 01/14] target/arm/cpu64: Ensure kvm really
 supports aarch64=off
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, armbru@redhat.com, imammedo@redhat.com,
 alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-2-drjones@redhat.com>
 <1ed69063-eaae-2c02-1fe1-2650492496d4@redhat.com>
 <20190625133452.3f4ik4xn7vh5zi2b@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8dea18ae-39ed-6f7d-0e91-61abd22eb74e@redhat.com>
Date: Wed, 24 Jul 2019 14:51:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190625133452.3f4ik4xn7vh5zi2b@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 24 Jul 2019 12:51:19 +0000 (UTC)
X-TUID: Ri7fN0I8qB2N

Hi Drew,

On 6/25/19 3:34 PM, Andrew Jones wrote:
> On Tue, Jun 25, 2019 at 11:35:12AM +0200, Auger Eric wrote:
>> Hi Drew,
>>
>> On 6/21/19 6:34 PM, Andrew Jones wrote:
>>> If -cpu <cpu>,aarch64=off is used then KVM must also be used, and it
>>> and the host must support running the vcpu in 32-bit mode. Also, if
s/and it//
>>> -cpu <cpu>,aarch64=on is used, then it doesn't matter if kvm is
>>> enabled or not.
>>>
>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>
>>
>>> ---
>>>  target/arm/cpu64.c   | 12 ++++++------
>>>  target/arm/kvm64.c   | 11 +++++++++++
>>>  target/arm/kvm_arm.h | 14 ++++++++++++++
>>>  3 files changed, 31 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>>> index 1901997a0645..946994838d8a 100644
>>> --- a/target/arm/cpu64.c
>>> +++ b/target/arm/cpu64.c
>>> @@ -407,13 +407,13 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
>>>       * restriction allows us to avoid fixing up functionality that assumes a
>>>       * uniform execution state like do_interrupt.
>>>       */> -    if (!kvm_enabled()) {
>>> -        error_setg(errp, "'aarch64' feature cannot be disabled "
>>> -                         "unless KVM is enabled");
>>> -        return;
>>> -    }
>>> -
>>>      if (value == false) {
>>> +        if (!kvm_enabled() || !kvm_arm_aarch32_supported(CPU(cpu))) {
>>> +            error_setg(errp, "'aarch64' feature cannot be disabled "
>>> +                             "unless KVM is enabled and 32-bit EL1 "
>>> +                             "is supported");
>>> +            return;
>>> +        }
>>>          unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
>>>      } else {
>>>          set_feature(&cpu->env, ARM_FEATURE_AARCH64);
>>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>>> index 22d19c9aec6f..45ccda589903 100644
>>> --- a/target/arm/kvm64.c
>>> +++ b/target/arm/kvm64.c
>>> @@ -24,7 +24,9 @@
>>>  #include "exec/gdbstub.h"
>>>  #include "sysemu/sysemu.h"
>>>  #include "sysemu/kvm.h"
>>> +#include "sysemu/kvm_int.h"
>>>  #include "kvm_arm.h"
>>> +#include "hw/boards.h"
By the way those two new headers are not needed by this patch
>>>  #include "internals.h"
>>>  
>>>  static bool have_guest_debug;
>>> @@ -593,6 +595,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>>      return true;
>>>  }
>>>  
>>> +bool kvm_arm_aarch32_supported(CPUState *cpu)
>>> +{
>>> +    KVMState *s = KVM_STATE(current_machine->accelerator);
>>> +    int ret;
>>> +
>>> +    ret = kvm_check_extension(s, KVM_CAP_ARM_EL1_32BIT);
>>> +    return ret > 0;
>> nit: return kvm_check_extension() should be sufficient
> 
> Ah yes, I forgot kvm_check_extension() already converts negative
> error codes to zero. I'll fix that for v3.
> 
>>> +}
>>> +
>>>  #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
>>>  
>>>  int kvm_arch_init_vcpu(CPUState *cs)
>>> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
>>> index 2a07333c615f..812125f805a1 100644
>>> --- a/target/arm/kvm_arm.h
>>> +++ b/target/arm/kvm_arm.h
>>> @@ -207,6 +207,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
>>>   */
>>>  void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
>>>  
>>> +/**
>>> + * kvm_arm_aarch32_supported:
>>> + * @cs: CPUState
>> use kernel-doc comment style?
> 
> This file (kvm_arm.h) doesn't appear to have a super consistent comment
> style. I see some use @var: for the parameters and some have 'Returns:
> ...' lines as well. I'm happy to do whatever the maintainers prefer. For
> now I was just trying to mimic whatever caught my eye.>
>>> + *
>>> + * Returns true if the KVM VCPU can enable AArch32 mode and false
>>> + * otherwise.
>>> + */
>>> +bool kvm_arm_aarch32_supported(CPUState *cs);
>>> +
>>>  /**
>>>   * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
>>>   * IPA address space supported by KVM
>>> @@ -247,6 +256,11 @@ static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>>>      cpu->host_cpu_probe_failed = true;
>>>  }
>>>  
>>> +static inline bool kvm_arm_aarch32_supported(CPUState *cs)
>>> +{
>>> +    return false;
>>> +}
>>> +
>>>  static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
>>>  {
>>>      return -ENOENT;
>>>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
Thanks

Eric
>>
> 
> Thanks,
> drew 
> 
