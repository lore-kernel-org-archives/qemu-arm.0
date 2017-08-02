Received: by 10.25.44.15 with SMTP id s15csp56449lfs;
        Wed, 2 Aug 2017 14:48:24 -0700 (PDT)
X-Received: by 10.200.45.164 with SMTP id p33mr34758791qta.208.1501710504698;
        Wed, 02 Aug 2017 14:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501710504; cv=none;
        d=google.com; s=arc-20160816;
        b=tYzB/ixzkC3MkPyEuCC1cnlsg5KK5PucYvaKK7t+kW9ha+vxDxdeMmzk9nn1UPDCtR
         H+/+1eG007FxNEiLuW5X+U5y0W4OQ++a0zmUQ+R2MjhS4GEXL1qv8IWQyitcVYrXWAzK
         83sJYgirV0XMEzaaDEIZYwZvFEQyv0tiAKuowgCZcjS2twz6vsIgcRrhWrE4UGmUi6wU
         Iuh3yTzc5pQ9xbW1nFWDeLKUIPjQ0ldZAwHBtRLuduDU9G72RCy/jdEITeoxlKWLg7Hk
         OJLTYfooQjKaMhpZ4W+jIcOFe5msTOY/bZOTkxgjK15L7wBJNBR9L2nbTkWJP/R+BNq3
         KrlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=lCgDkqfX8Qj9Uidkm4agKWj5wQQUQFt+okT/rF6i2g4=;
        b=dEu8U5RwopcIZCB8P1CPj2UTC5rx0D6/kTQZ2eOtj2uimk8BnGxdDRWpr/MiqCvOJl
         6VwP6oglW9vKQoPUeQbbh5HHDcKDx708kc8f2tjFEUnEEELSgphd+UK1umD8U2XRyt+9
         F3kD8gb4mlWZK/3fHcKt3JYJnc9diA1Wenl9pZJxIJWyePmeNzOls9foAn8tpPjc8Nfs
         vTvyIhLAvc18t4GT+8t8ej+6w1zrOBYQcoBRte7k8a5MRDSF6m42xT8sPPMX/Its7qUE
         4WK/lKGyiv7nqT94jlvspib69FdILc0tJWwQK8FtW6LebiaZxvFi4qYayMoCuc7V6bDX
         uIAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=AEOKqCbv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q27si30072901qki.175.2017.08.02.14.48.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 14:48:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=AEOKqCbv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dd1V8-0008RV-3b
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 17:48:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dd1V1-0008Pr-NZ
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 17:48:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dd1V0-0000Ji-OG
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 17:48:15 -0400
Received: from mail-ua0-x242.google.com ([2607:f8b0:400c:c08::242]:35740)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dd1Uv-0000Hz-9P; Wed, 02 Aug 2017 17:48:09 -0400
Received: by mail-ua0-x242.google.com with SMTP id d29so3245226uai.2;
	Wed, 02 Aug 2017 14:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lCgDkqfX8Qj9Uidkm4agKWj5wQQUQFt+okT/rF6i2g4=;
	b=AEOKqCbvch+PZHaHKtyKk1v2JpW8MzPampTsBYJolGgrKoU2UWxYEHinbx/gW3Ngk7
	/u7TJtEnTZYu4cwqWwnIn+7jfurBVcl9QEnksPvIgaXl4e+bMBoyBnXqscCjtcnPNVnG
	/5aR8OalDnCHFqJ4BFLQx1RWwxAjbXi+yVQUGZitPCLd6DaBahPPUSDeR5plnZtVKNoJ
	sIuqtGeI9o8JqGwfR/Aei6dfDidtmdx13intj2wOs8omlexTS9jQgFow1c/MeJQwRwtr
	jum2p89iVWXdNYOssnR8l2e/i1Oa86BTXInBVQGouq3gXkTNPcGb4pDX3PBowUdttlKc
	8xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lCgDkqfX8Qj9Uidkm4agKWj5wQQUQFt+okT/rF6i2g4=;
	b=f7ArcFeleGR/c/2wLnQNyDaVBVm7aeVnos6Qr+3IqoT1g4AIBXx3e9yG33+b1n+9HA
	GVQCIaoV2TmiyVf0LG4n+0hg2Idt9NL6P/XqumRZH4UNXwYIjVNWyNnvXZLNFW6DiguA
	T5yMJ/HKnBB1kELzxXxtj1Y1pLRd8G+5RAydv8j6WrDpKsRcMj+XVnROeHgiHzjmAaeJ
	yuB4p2QONQqWxECr/36JLCk2z2S3kY3KFiOUUE1K5aZ+Qi1mKGFGBa9VKxya+zBKakzs
	5M+eYk6o4LLN7gbdlk2hQgtA9sMlshAk/J+5s3owOWP4IAo+bijqoqF2rdrtj4v/Nsh2
	gNhA==
X-Gm-Message-State: AIVw110TnuhW7XR8uOW/s/Q49+5ccoDmpIZ/B6oSxNc7kUfBVcFqpzyk
	9Garp3SFXbUh5w==
X-Received: by 10.176.91.7 with SMTP id u7mr10947127uae.152.1501710488566;
	Wed, 02 Aug 2017 14:48:08 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id i3sm5828573uad.17.2017.08.02.14.48.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Aug 2017 14:48:07 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-14-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <065454c5-623d-8859-3e8d-bdfe3300c91e@amsat.org>
Date: Wed, 2 Aug 2017 18:48:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-14-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::242
Subject: Re: [Qemu-arm] [PATCH 13/15] target/arm: Create and use new
 function arm_v7m_is_handler_mode()
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
X-TUID: b6WmQOtkgop3

On 08/02/2017 01:43 PM, Peter Maydell wrote:
> Add a utility function for testing whether the CPU is in Handler
> mode; this is just a check whether v7m.exception is non-zero, but
> we do it in several places and it makes the code a bit easier
> to read to not have to mentally figure out what the test is testing.

<3 <3 <3

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   target/arm/cpu.h    | 10 ++++++++--
>   target/arm/helper.c |  8 ++++----
>   2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index da90b7a..a3b4b78 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1630,13 +1630,19 @@ static inline int arm_highest_el(CPUARMState *env)
>       return 1;
>   }
>   
> +/* Return true if a v7M CPU is in Handler mode */
> +static inline bool arm_v7m_is_handler_mode(CPUARMState *env)
> +{
> +    return env->v7m.exception != 0;
> +}
> +
>   /* Return the current Exception Level (as per ARMv8; note that this differs
>    * from the ARMv7 Privilege Level).
>    */
>   static inline int arm_current_el(CPUARMState *env)
>   {
>       if (arm_feature(env, ARM_FEATURE_M)) {
> -        return !((env->v7m.exception == 0) && (env->v7m.control & 1));
> +        return arm_v7m_is_handler_mode(env) || !(env->v7m.control & 1);
>       }
>   
>       if (is_a64(env)) {
> @@ -2636,7 +2642,7 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>       }
>       *flags |= fp_exception_el(env) << ARM_TBFLAG_FPEXC_EL_SHIFT;
>   
> -    if (env->v7m.exception != 0) {
> +    if (arm_v7m_is_handler_mode(env)) {
>           *flags |= ARM_TBFLAG_HANDLER_MASK;
>       }
>   
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 0ecc8f1..7920153 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6147,7 +6147,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>        * that jumps to magic addresses don't have magic behaviour unless
>        * we're in Handler mode (compare pseudocode BXWritePC()).
>        */
> -    assert(env->v7m.exception != 0);
> +    assert(arm_v7m_is_handler_mode(env));
>   
>       /* In the spec pseudocode ExceptionReturn() is called directly
>        * from BXWritePC() and gets the full target PC value including
> @@ -6254,7 +6254,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>        * resuming in Thread mode. If that doesn't match what the
>        * exception return type specified then this is a UsageFault.
>        */
> -    if (return_to_handler == (env->v7m.exception == 0)) {
> +    if (return_to_handler != arm_v7m_is_handler_mode(env)) {
>           /* Take an INVPC UsageFault by pushing the stack again. */
>           armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
>           env->v7m.cfsr |= R_V7M_CFSR_INVPC_MASK;
> @@ -6405,7 +6405,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>       if (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) {
>           lr |= 4;
>       }
> -    if (env->v7m.exception == 0) {
> +    if (!arm_v7m_is_handler_mode(env)) {
>           lr |= 8;
>       }
>   
> @@ -8798,7 +8798,7 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
>            * switch_v7m_sp() deals with updating the SPSEL bit in
>            * env->v7m.control, so we only need update the others.
>            */
> -        if (env->v7m.exception == 0) {
> +        if (!arm_v7m_is_handler_mode(env)) {
>               switch_v7m_sp(env, (val & R_V7M_CONTROL_SPSEL_MASK) != 0);
>           }
>           env->v7m.control &= ~R_V7M_CONTROL_NPRIV_MASK;
> 
