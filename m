Received: by 10.28.71.155 with SMTP id m27csp57156wmi;
        Thu, 22 Mar 2018 01:09:38 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48r6AktLv7pSfJ5KZYtcfYiJvcn8VdUvbMZ9LmRlustzS4B7LtiK1EtBmgLNNfXFn3str6m
X-Received: by 10.55.166.79 with SMTP id p76mr11442884qke.248.1521706178770;
        Thu, 22 Mar 2018 01:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521706178; cv=none;
        d=google.com; s=arc-20160816;
        b=e1lZ43xX+4m9fM0dpALJkid1Fy7BcONGIBZTN4uHbBShvMGTo4NSHGFU8VkZXBNcYs
         Wpm/wVnQS6c6zCkfdvMHT04DzDoe34DLIeJqatuyrJXeF83W44YGSbFbxfnl04BD47XB
         5VfyRfFA1fJHY+aI7kXTqYSu9QwIHnRa2DP/gayNmHGMX+JhryT8Vfp1qxEkf0J0GccD
         vbaeBTjCo4qZRFCNMmgVinUoiizSym0CwlY9eQCIKiYMyeGEg8jH+c+zLChDImC0p0qA
         hTA5qYWK3n7SwIbFpq2zkX+5luP4brGj2Lk6TV3BGRRi4vP0S21ziAKOcHTI1r8tEpTy
         BwRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=VkHYTQjPuVu2qaqmwdDrR0HQVmMhPBKClvjltBNWCMM=;
        b=WtNe1TE9cB3M6NBlgxtDJJj9+Iq4dU8QCFXypJIpcGZ7HNXzkhwjyNQzVZ0PGB51eP
         +Cj2w06hDMGH1zEUhnEZlVrGiawg/49u2d1VR8dkEW3SHU3nw23JO9xJxQo7MULq9i7+
         C0+G5yo0a14wjRhXLU1pvH70TCgLQEykSDIGTTbyHQ2+czy5JkNnAfXNi9NOIvnQTh2B
         XMC8b8r8nGlynrDeVNlrHLb3AOcZ/WmYHIbchzKblP0yC4EW4snYNRHvnu1KFcAn+bof
         JjFbPMLGBDf1sog+268N13TBcagAWzMkqxPIM5QgmXDCvVJsCEyKa53sv/Y81o9gRWqM
         qNVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i3Gz8HjW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o103si7719531qko.458.2018.03.22.01.09.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 01:09:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i3Gz8HjW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59345 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyvI2-0005Tp-5t
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 04:09:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvHl-0005OY-8O
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 04:09:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvHj-0002mI-J5
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 04:09:21 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:42106)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvHd-0002j1-Vj; Thu, 22 Mar 2018 04:09:14 -0400
Received: by mail-qt0-x241.google.com with SMTP id q11so8028749qtl.9;
	Thu, 22 Mar 2018 01:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VkHYTQjPuVu2qaqmwdDrR0HQVmMhPBKClvjltBNWCMM=;
	b=i3Gz8HjWaqoABzvBJMH5hEgg4xMH5hKt5vg77TQSB/ROnWH/klYUINip+tbVhNh2hl
	VRdBPO3hFVqOmVZHX43hVEQkyrMwVQa28hY6N7F4EovRwcu686NnZni0W06fr8gBpUl1
	otBVuUmk6xex8pObwaYs87ZwhCOxZSWDqBVk3rM5sRrqhwmAW5A/o3EL8yvIrGjhWH8t
	UD3h/s3t1ij5Z/VTRXIB1jlF5lO04jtM1RGtF9r9LzhwCcVFmlKKgsuRUtFdQgONaJnY
	xwM/D7yBLow/Bi2sPcbF763x/bemVWEISZz3UGFwamy8q48Hj5m+IHeCvJG6sfXCdqvD
	DD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=VkHYTQjPuVu2qaqmwdDrR0HQVmMhPBKClvjltBNWCMM=;
	b=nO7ExjdSH234+SemYoQUx00U1JfAfgF6HdqzRQw9GEv/h7VndDzyTqG9ibFLnEl/Um
	S748780dxFf1MuY0w5QnyzI9fCEdjET32YAXWazAHTlxppMIbiAQjAQQoHGP3Ds4AsGj
	Ia/fqjV6LlCjRIaTc7rFR2hVe7e+Kmt7TTKDJqCaJrOC8ZKIBtLcmHgNwWwkbtOBoYk1
	/HWC6MthYqcoWqGPLW1rLdPYtlupjjvl1TNdpjPGzLZHpvChHitFu5oNgNhOFaSc/0iB
	scTvcfoyvLfVh3blks7Kk185sD2lFQL2GdTcsX5guWESR0KPiklZtwA2fLjCGsD73EWq
	a0FA==
X-Gm-Message-State: AElRT7FZhNFjE0v9ZphpaWbQta9G0kHJ54Lj7JIGqeEjh0ksWtrou8DC
	DqALs9S7EnKjkD8EBjotNxU=
X-Received: by 10.200.38.217 with SMTP id 25mr33144437qtp.163.1521706153485;
	Thu, 22 Mar 2018 01:09:13 -0700 (PDT)
Received: from [10.66.0.177] (host157.181-15-149.telecom.net.ar.
	[181.15.149.157]) by smtp.gmail.com with ESMTPSA id
	r14sm4263108qti.24.2018.03.22.01.09.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Mar 2018 01:09:12 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180320134114.30418-1-peter.maydell@linaro.org>
	<20180320134114.30418-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <899fd41e-46cf-44e8-2df5-24d9e705e264@amsat.org>
Date: Wed, 21 Mar 2018 23:26:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180320134114.30418-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH for-2.12 2/4] target/arm: Factor out code to
 calculate FSR for debug exceptions
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0IefUbomb+nN

Hi Peter,

This patch might be split in 2.

On 03/20/2018 02:41 PM, Peter Maydell wrote:
> When a debug exception is taken to AArch32, it appears as a Prefetch
> Abort, and the Instruction Fault Status Register (IFSR) must be set.
> The IFSR has two possible formats, depending on whether LPAE is in

^ intro

> use. Factor out the code in arm_debug_excp_handler() which picks
> an FSR value into its own utility function, update it to use
> arm_fi_to_lfsc() and arm_fi_to_sfsc() rather than hard-coded constants,

^ part 1 (refactor):
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> and use the correct condition to select long or short format.

^ part 2 (fix) looks correct:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> In particular this fixes a bug where we could select the short
> format because we're at EL0 and the EL1 translation regime is
> not using LPAE, but then route the debug exception to EL2 because
> of MDCR_EL2.TDE and hand EL2 the wrong format FSR.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/internals.h | 25 +++++++++++++++++++++++++
>  target/arm/op_helper.c | 12 ++----------
>  2 files changed, 27 insertions(+), 10 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 47cc224a46..8ce944b7a0 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -763,4 +763,29 @@ static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
>      }
>  }
>  
> +/* Return the FSR value for a debug exception (watchpoint, hardware
> + * breakpoint or BKPT insn) targeting the specified exception level.
> + */
> +static inline uint32_t arm_debug_exception_fsr(CPUARMState *env)
> +{
> +    ARMMMUFaultInfo fi = { .type = ARMFault_Debug };
> +    int target_el = arm_debug_target_el(env);
> +    bool using_lpae = false;
> +
> +    if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
> +        using_lpae = true;
> +    } else {
> +        if (arm_feature(env, ARM_FEATURE_LPAE) &&
> +            (env->cp15.tcr_el[target_el].raw_tcr & TTBCR_EAE)) {
> +            using_lpae = true;
> +        }
> +    }

This looks pretty similar to regime_using_lpae_format() but for
ARMFault_Debug.

> +
> +    if (using_lpae) {
> +        return arm_fi_to_lfsc(&fi);
> +    } else {
> +        return arm_fi_to_sfsc(&fi);
> +    }
> +}
> +
>  #endif
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 4b123d2bd6..75efff9edf 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -1330,11 +1330,7 @@ void arm_debug_excp_handler(CPUState *cs)
>  
>              cs->watchpoint_hit = NULL;
>  
> -            if (extended_addresses_enabled(env)) {
> -                env->exception.fsr = (1 << 9) | 0x22;
> -            } else {
> -                env->exception.fsr = 0x2;
> -            }
> +            env->exception.fsr = arm_debug_exception_fsr(env);
>              env->exception.vaddress = wp_hit->hitaddr;
>              raise_exception(env, EXCP_DATA_ABORT,
>                      syn_watchpoint(same_el, 0, wnr),
> @@ -1354,11 +1350,7 @@ void arm_debug_excp_handler(CPUState *cs)
>              return;
>          }
>  
> -        if (extended_addresses_enabled(env)) {
> -            env->exception.fsr = (1 << 9) | 0x22;
> -        } else {
> -            env->exception.fsr = 0x2;
> -        }
> +        env->exception.fsr = arm_debug_exception_fsr(env);
>          /* FAR is UNKNOWN, so doesn't need setting */
>          raise_exception(env, EXCP_PREFETCH_ABORT,
>                          syn_breakpoint(same_el),
> 
