Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2173018wrd;
        Fri, 24 Aug 2018 03:29:25 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYOEkAklKbT8/hsnaRPDIJXQEa2eZL8M24YVGOtuj1PCgm/kpuZkYmA+W95I+EYxkXUVWzJ
X-Received: by 2002:a0c:f085:: with SMTP id g5-v6mr999978qvk.3.1535106565639;
        Fri, 24 Aug 2018 03:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535106565; cv=none;
        d=google.com; s=arc-20160816;
        b=Sjaz5KEW8Q4YQj1heooKELlwhHXFduPh2/JAtuKwsckWnmQESCuogJKsUPVle6hQqM
         DbAl+F2X1dCevQFHpjbsz3BhFeVswvyZGpzQnuGpnUkneVJy/wOuXgcWLhbhXEj9O0aB
         dKs6SU0UR15uY78Bp5Ii8qwX/7/B3qFvcj5FUCkcq3uVFu/glKPV1KSHYHa4NMs/jQe9
         MyqPsWKup3VO2sH6dScsl4Cqip5rHT5Jcc2+Va6tDLM6eMaDVwpRWZTTssREH5GkUtal
         /LRMHRKzuwejgQpt+L+YCTy6lpKDvHyfDy9I4j93CFTPJF6u+wBko1UK+BwfzFexsZvh
         f/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=/Urs12rnmhd79GxdpWNvGb67WQvO8CvNo47M8p5Dv+8=;
        b=BgnKu72RTH6QR2uLZVyf+pHzCeQ+EXqLllaVJ0qa5Ns+bxhub/g8ysWh6v80jbKZq8
         76kyPGpa4h2rQbW5TyYYPbZEZ6R/8Nq0Fcvb8gdK/LfD8IECraOC8Eck0NIq8Bh7pcqX
         iksnTlMRahMXFbWglQQ++KQVJier69YHFw4a3YtIu3uKqeTHOE8ELWyuKDN9WOpxHWSS
         RD2Ho9/aAPNa4WKFHCjfpI6skSUvEMLhV5Tgg3MIj/yOIyZ3xtX4aUezOHCqrFq4dT9g
         6EfwpqzOm7D1XeOc/nXi1ViV8pRffs+6kUuOlWC+oKOqUYVx2Pfxr7UHhVDVkIUpUWq5
         Snaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b20-v6si6794142qta.378.2018.08.24.03.29.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Aug 2018 03:29:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40991 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ft9LJ-0002oz-4Q
	for alex.bennee@linaro.org; Fri, 24 Aug 2018 06:29:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1ft9L7-0002nK-Vj
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 06:29:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1ft9L4-0003WA-Ou
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 06:29:13 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:54570 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1ft9L4-0003SG-AJ; Fri, 24 Aug 2018 06:29:10 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id C3D2E3A4A2F2C;
	Fri, 24 Aug 2018 18:29:02 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS403-HUB.china.huawei.com
	(10.3.19.203) with Microsoft SMTP Server id 14.3.399.0; Fri, 24 Aug 2018
	18:28:56 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <1535039100-11248-1-git-send-email-gengdongjiu@huawei.com>
	<1535039100-11248-2-git-send-email-gengdongjiu@huawei.com>
	<CAFEAcA9DJ_GMkq1fGUjXJDu9GUM0cd6Pjm1HsXpm5rQ5n78Zew@mail.gmail.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <26a33eec-3ed5-f05d-7c36-5b46eeba9612@huawei.com>
Date: Fri, 24 Aug 2018 18:28:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9DJ_GMkq1fGUjXJDu9GUM0cd6Pjm1HsXpm5rQ5n78Zew@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.32
Subject: Re: [Qemu-arm] [PATCH v6 2/2] target: arm: Add support for VCPU
 event states
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p+lNPZ2aVWrj

On 2018/8/24 0:52, Peter Maydell wrote:
> On 23 August 2018 at 16:45, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>> This patch extends the qemu-kvm state sync logic with support for
>> KVM_GET/SET_VCPU_EVENTS, giving access to yet missing SError exception.
>> And also it can support the exception state migration.
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> 
> Did you forget to send a cover letter for this patchset?
> I didn't see one. Our tooling prefers cover letters for
> any patchset with more than one patch in it.

Ok, I will add a cover letter.

> 
>> ---
>> Change since v5:
>> address Peter's comments:
>> 1. Move the "struct serror" before the "end_reset_fields" in CPUARMState
>> 2. Remove ARM_FEATURE_RAS_EXT and add a variable have_inject_serror_esr
>> 3. Use the variable have_inject_serror_esr to track whether the kernel has state we need to migrate
>> 4. Remove printf() in kvm_arch_put_registers()
>> 5. ras_needed/vmstate_ras to serror_needed/vmstate_serror
>> 6. Check to use "return env.serror.pending != 0" instead of "arm_feature(env, ARM_FEATURE_RAS_EXT)" in the ras_needed()
>>
>> Change since v4:
>> 1. Rebase the code to latest
>>
>> Change since v3:
>> 1. Add a new new subsection with a suitable 'ras_needed' function
>>    controlling whether it is present
>> 2. Add a ARM_FEATURE_RAS feature bit for CPUARMState
>> ---
>>  target/arm/cpu.h     |  7 +++++++
>>  target/arm/kvm64.c   | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  target/arm/machine.c | 22 ++++++++++++++++++++
>>  3 files changed, 88 insertions(+)
> 
> 
>> +static int kvm_put_vcpu_events(ARMCPU *cpu)
>> +{
>> +    CPUARMState *env = &cpu->env;
>> +    struct kvm_vcpu_events events = {};
>> +
>> +    if (!kvm_has_vcpu_events()) {
>> +        return 0;
>> +    }
>> +
>> +    memset(&events, 0, sizeof(events));
>> +    events.exception.serror_pending = env->serror.pending;
>> +
>> +    if (have_inject_serror_esr) {
>> +        events.exception.serror_has_esr = env->serror.has_esr;
>> +        events.exception.serror_esr = env->serror.esr;
>> +    }
> 
> I realised that the effect of this condition is that
> if we migrate a VM from a machine which supports specifying the
> SError ESR to one which does not, and at the point of migration
> there is a pending SError with an ESR value, then we will
> silently drop the specified ESR value. The other alternative
> would be to fail the migration (by dropping the if() check,
> and letting the host kernel fail the ioctl if that meant that
> we asked it to set an SError ESR it couldn't manage.)
> 
> I guess that's OK? It's all hypothetical currently since
> we don't support migration between different host CPU types.

Peter,
   there are two status needed to migrate, one is serror_pending, another is SError ESR value.

If A migrates to B, A can set an SError ESR, but B does not support to set.
when A is pending a SError and need to migrate to B, I think it should support to migrate the serror_pending status without the ESR value(the ESR value is 0).
That is to say,  if A is pending a SError, when migrate to B, B should also pend a SError.

or do you think we should refused this migration?

currently kernel can support to pend a SError without the ESR value.
As shown the kernel code in [1].
when has_esr is true the ioctl can return failure, then Qemu can check the return value to decide whether do this migration.
but when the has_esr is false, without setting the ESR, QEMU can not check the return value because it always return true.


[1]:
+int kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
+                       struct kvm_vcpu_events *events)
+{
+       int i;
+       bool serror_pending = events->exception.serror_pending;
+       bool has_esr = events->exception.serror_has_esr;
+
+       /* check whether the reserved field is zero */
+       for (i = 0; i < ARRAY_SIZE(events->reserved); i++)
+               if (events->reserved[i])
+                       return -EINVAL;
+
+       /* check whether the pad field is zero */
+       for (i = 0; i < ARRAY_SIZE(events->exception.pad); i++)
+               if (events->exception.pad[i])
+                       return -EINVAL;
+
+       if (serror_pending && has_esr) {
+               if (!cpus_have_const_cap(ARM64_HAS_RAS_EXTN))
+                       return -EINVAL;
+
+               if (!((events->exception.serror_esr) & ~ESR_ELx_ISS_MASK))
+                       kvm_set_sei_esr(vcpu, events->exception.serror_esr);
+               else
+                       return -EINVAL;
+       } else if (serror_pending) {
+               kvm_inject_vabt(vcpu);
+       }
+
+       return 0;
+}

> 
>> +
>> +    return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
>> +}
>> +
> 
>> +static const VMStateDescription vmstate_serror = {
>> +    .name = "cpu/ras",
> 
> You forgot to update the name here.

Thanks for this pointing out, will change it

> 
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .needed = serror_needed,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT32(env.serror.pending, ARMCPU),
>> +        VMSTATE_UINT32(env.serror.has_esr, ARMCPU),
>> +        VMSTATE_UINT64(env.serror.esr, ARMCPU),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>  static bool m_needed(void *opaque)
>>  {
>>      ARMCPU *cpu = opaque;
>> @@ -726,6 +747,7 @@ const VMStateDescription vmstate_arm_cpu = {
>>  #ifdef TARGET_AARCH64
>>          &vmstate_sve,
>>  #endif
>> +        &vmstate_serror,
>>          NULL
>>      }
>>  };
>> --
> 
> thanks
> -- PMM
> 
> .
> 

