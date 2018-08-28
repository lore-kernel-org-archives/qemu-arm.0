Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp6300567wrd;
        Tue, 28 Aug 2018 04:33:26 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ3Kd3lUBgnFh7nSyMhUxzI+82wE+sKIe2AKV1rKk/tDmIKBkziYqImde+INj3QIcjZmpBw
X-Received: by 2002:a0c:e74c:: with SMTP id g12-v6mr1026020qvn.118.1535456006791;
        Tue, 28 Aug 2018 04:33:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535456006; cv=none;
        d=google.com; s=arc-20160816;
        b=wsNUZWhYhyrFETOHIpZlW6ERT7uWNyPsGAJcCQJmb9FwEah2Ao2tMoY0GpF9gAUxw2
         jXAOkS2YiDJtZjzqqtDuep5KWrPbvZhEv9Wf+gqNV4dXwvmFKpn2/tZ3ES5oKcIj7NUN
         kR5RQf6AUfx1t/YBzmcF812KntUJ7l7MSTNeU+aDU9nyl9Mr24posaU7FoIRXCDJK4p5
         B2QdqVFEijrfCFloV6BTU+oNBUPHdVEoghx0bSgDbUAJneWbWUP/+Xkdb0QZP9Gxo7vn
         xwNAmEVRO8qiDTmhoaI1bfmkyyCZ7VZIBc2zb3bjFdqxJrd2HF4KDD39fo6gxNIAFES1
         YuzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=n9onymy4VZhC3QnJmGVwIBcKGDWk0lHi++9OeqYh6L4=;
        b=ubFTaMc1Jh/X2CEeXvGgUhnRuaWJ8cgVSbUMeydOZq/Lav23gMNSBv2pMEhr66lGFj
         XGprL0RdCKwaowNDjPESobpLAUuAJFuuv3ZGUHhzaEqK1nS/WuPvshUjYRZWSCw22akK
         F2IHiofx1fsLAow8OTupxogP7SJuLqahHseeHWHAilDPd163aTIwwJGp1QWrDXDAgxSW
         z1eLPIa2L08eh9A/m0RhYlSl3hb5kk7OBQOBL+089f0aBVI57hm+c5wxeP5Yg/FCq+Sx
         RhBearT5gavjWX/RJ96Ppp3h4TECLbiapiVRsBvrEw0iMdrPoAjhSHXdRDu2XTfs5b4T
         AwFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="fE/Nm7Ef";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e10-v6si632903qtq.0.2018.08.28.04.33.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Aug 2018 04:33:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="fE/Nm7Ef";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37529 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fucFS-00086L-BJ
	for alex.bennee@linaro.org; Tue, 28 Aug 2018 07:33:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1fucEz-000835-M4
	for qemu-devel@nongnu.org; Tue, 28 Aug 2018 07:33:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1fuc5U-0006ML-CS
	for qemu-devel@nongnu.org; Tue, 28 Aug 2018 07:23:10 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:33656)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shannon.zhaosl@gmail.com>)
	id 1fuc5G-0005y4-IP; Tue, 28 Aug 2018 07:22:56 -0400
Received: by mail-oi0-x244.google.com with SMTP id 8-v6so2172233oip.0;
	Tue, 28 Aug 2018 04:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=n9onymy4VZhC3QnJmGVwIBcKGDWk0lHi++9OeqYh6L4=;
	b=fE/Nm7EfPeIfAr3/QybId0Y1O0OYzZEfn3xufubduHmEK/x8k+mdeejo6bUwoL/Wxu
	FokTxmaYdb64xiXkEoKeg1qV7WBB+2bvZrh+uAJIorqoZNojgafjtZ5eGHwfy4MyK+Id
	9nKEGLu5pFqzqIBZqgOIP8V6jnEyxlD//px4xa4pIM6ECOjlbYWFyRL0y0oIFeLEgnMW
	3uQeCuFRp3XkK9GVp+lcG/7PSWPSBZiGz4dzN3cHl8hkQNRdejxjtHF6Iz48PTxMj6gL
	hg2wOF5IIJhdinmcjlGE7qIDOuPJWCKclRHbbClnK5Duseu8q9HNdxgW22G0YDV8X+11
	MvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=n9onymy4VZhC3QnJmGVwIBcKGDWk0lHi++9OeqYh6L4=;
	b=StThDRh5AHRCXCUt3mwDumZHzfZtf0+Flkr38q6MSFuEVvbQNDdwcPPb5xeI57b+NC
	2YZQH68cVQoyWhvXplTxzJYOo7/WsK4YEvdHEFXcN7rQqzwswd3v6WHFM88natyH/DKz
	b1+TAW4971Q7r1lpHYCuzI/qqM5BUIDc3Ju1VU0DcJ5RP0jZhiqoo3Vrl8juMvAmiNhT
	y8ducSwag7oC5uPtjHrJCb1ubfCWX+jHUGeJ74RxlEwwcJre1mOcEM+2/w7on1SRtuOx
	vUN/oN8tp0eWuhHr68pWBJ091XyULlVtkvurLUE8Cs1MPOXzXQ9okOwgzvM+kn/zFFji
	mV4w==
X-Gm-Message-State: APzg51BSW1Kys8YRN1ZjvNKmtyUSkxSEoFJv1jlsepqz1xAlrSk8Y4n0
	csWPKItIQea83s6Xoxm+vFrUyfxdZMU=
X-Received: by 2002:aca:4455:: with SMTP id
	r82-v6mr1031573oia.260.1535455369462; 
	Tue, 28 Aug 2018 04:22:49 -0700 (PDT)
Received: from [30.43.120.166] ([47.89.83.35])
	by smtp.gmail.com with ESMTPSA id
	f4-v6sm731695oic.52.2018.08.28.04.22.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 04:22:48 -0700 (PDT)
To: Dongjiu Geng <gengdongjiu@huawei.com>, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1535402777-46620-1-git-send-email-gengdongjiu@huawei.com>
	<1535402777-46620-3-git-send-email-gengdongjiu@huawei.com>
From: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-ID: <c2e71ef7-5e5e-873c-0ec3-b36a257256c3@gmail.com>
Date: Tue, 28 Aug 2018 19:22:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1535402777-46620-3-git-send-email-gengdongjiu@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v7 2/2] target: arm: Add support
 for VCPU event states
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a5NG33HKSiBs

Hi,

On 8/28/2018 4:46 AM, Dongjiu Geng wrote:
> This patch extends the qemu-kvm state sync logic with support for
> KVM_GET/SET_VCPU_EVENTS, giving access to yet missing SError exception.
> And also it can support the exception state migration.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> change since v6:
> 1. Add cover letter
> 2. Change name "cpu/ras" to "cpu/serror"
> 3. Add some comments and check the ioctl return value for kvm_put_vcpu_events()
> 
> Change since v5:
> address Peter's comments:
> 1. Move the "struct serror" before the "end_reset_fields" in CPUARMState
> 2. Remove ARM_FEATURE_RAS_EXT and add a variable have_inject_serror_esr
> 3. Use the variable have_inject_serror_esr to track whether the kernel has state we need to migrate
> 4. Remove printf() in kvm_arch_put_registers()
> 5. ras_needed/vmstate_ras to serror_needed/vmstate_serror
> 6. Check to use "return env.serror.pending != 0" instead of "arm_feature(env, ARM_FEATURE_RAS_EXT)" in the ras_needed()
> 
> Change since v4:
> 1. Rebase the code to latest
> 
> Change since v3:
> 1. Add a new new subsection with a suitable 'ras_needed' function
>     controlling whether it is present
> 2. Add a ARM_FEATURE_RAS feature bit for CPUARMState
> ---
>   target/arm/cpu.h     |  7 ++++++
>   target/arm/kvm64.c   | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/machine.c | 22 +++++++++++++++++
>   3 files changed, 97 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 62c36b4..7030680 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -530,6 +530,13 @@ typedef struct CPUARMState {
>            */
>       } exception;
>   
> +    /* Information associated with an SError */
> +    struct {
> +        uint32_t pending;
> +        uint32_t has_esr;
why use uint32_t for a bool parameter here while it's u8 in the kernel 
header?

> +        uint64_t esr;
> +    } serror;
> +
>       /* Thumb-2 EE state.  */
>       uint32_t teecr;
>       uint32_t teehbr;
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index e0b8246..6e0252c 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -29,6 +29,7 @@
>   #include "hw/arm/arm.h"
>   
>   static bool have_guest_debug;
> +static bool have_inject_serror_esr;
>   
>   /*
>    * Although the ARM implementation of hardware assisted debugging
> @@ -546,6 +547,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
>   
>       kvm_arm_init_debug(cs);
>   
> +    /* Check whether userspace can specify guest syndrome value */
> +    have_inject_serror_esr = kvm_check_extension(cs->kvm_state,
> +                                                 KVM_CAP_ARM_INJECT_SERROR_ESR);
> +
>       return kvm_arm_init_cpreg_list(cpu);
>   }
>   
> @@ -600,6 +605,59 @@ int kvm_arm_cpreg_level(uint64_t regidx)
>   #define AARCH64_SIMD_CTRL_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U32 | \
>                    KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
>   
> +static int kvm_put_vcpu_events(ARMCPU *cpu)
> +{
> +    CPUARMState *env = &cpu->env;
> +    struct kvm_vcpu_events events = {};
> +    int ret;
> +
> +    if (!kvm_has_vcpu_events()) {
> +        return 0;
> +    }
> +
> +    memset(&events, 0, sizeof(events));
> +    events.exception.serror_pending = env->serror.pending;
> +
> +    /* Inject SError to guest with specified syndrome if host kernel
> +     * supports it, otherwise inject SError without syndrome.
> +     */
> +    if (have_inject_serror_esr) {
> +        events.exception.serror_has_esr = env->serror.has_esr;
> +        events.exception.serror_esr = env->serror.esr;
> +    }
> +
> +    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
> +    if (ret) {
> +        error_report("failed to put vcpu events");
> +    }
> +
> +    return ret;
> +}
> +
> +static int kvm_get_vcpu_events(ARMCPU *cpu)
> +{
> +    CPUARMState *env = &cpu->env;
> +    struct kvm_vcpu_events events;
> +    int ret;
> +
> +    if (!kvm_has_vcpu_events()) {
> +        return 0;
> +    }
> +
> +    memset(&events, 0, sizeof(events));
> +    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_VCPU_EVENTS, &events);
> +
> +    if (ret < 0) {
like the put function, it's better to add a error_report here.

Thanks,
Shannon
> +        return ret;
> +    }
> +
> +    env->serror.pending = events.exception.serror_pending;
> +    env->serror.has_esr = events.exception.serror_has_esr;
> +    env->serror.esr = events.exception.serror_esr;
> +
> +    return 0;
> +}
> +
>   int kvm_arch_put_registers(CPUState *cs, int level)
>   {
>       struct kvm_one_reg reg;
> @@ -727,6 +785,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>           return ret;
>       }
>   
> +    ret = kvm_put_vcpu_events(cpu);
> +    if (ret) {
> +        return ret;
> +    }
> +
>       if (!write_list_to_kvmstate(cpu, level)) {
>           return EINVAL;
>       }
> @@ -863,6 +926,11 @@ int kvm_arch_get_registers(CPUState *cs)
>       }
>       vfp_set_fpcr(env, fpr);
>   
> +    ret = kvm_get_vcpu_events(cpu);
> +    if (ret) {
> +        return ret;
> +    }
> +
>       if (!write_kvmstate_to_list(cpu)) {
>           return EINVAL;
>       }
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index ff4ec22..d6dadf1 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -172,6 +172,27 @@ static const VMStateDescription vmstate_sve = {
>   };
>   #endif /* AARCH64 */
>   
> +static bool serror_needed(void *opaque)
> +{
> +    ARMCPU *cpu = opaque;
> +    CPUARMState *env = &cpu->env;
> +
> +    return env->serror.pending != 0;
> +}
> +
> +static const VMStateDescription vmstate_serror = {
> +    .name = "cpu/serror",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = serror_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(env.serror.pending, ARMCPU),
> +        VMSTATE_UINT32(env.serror.has_esr, ARMCPU),
> +        VMSTATE_UINT64(env.serror.esr, ARMCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   static bool m_needed(void *opaque)
>   {
>       ARMCPU *cpu = opaque;
> @@ -726,6 +747,7 @@ const VMStateDescription vmstate_arm_cpu = {
>   #ifdef TARGET_AARCH64
>           &vmstate_sve,
>   #endif
> +        &vmstate_serror,
>           NULL
>       }
>   };
> 
