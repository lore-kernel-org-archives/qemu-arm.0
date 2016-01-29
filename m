Received: by 10.25.159.19 with SMTP id i19csp1050606lfe;
        Fri, 29 Jan 2016 08:47:46 -0800 (PST)
X-Received: by 10.55.79.69 with SMTP id d66mr11838343qkb.76.1454086066661;
        Fri, 29 Jan 2016 08:47:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y124si15586563qka.2.2016.01.29.08.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 08:47:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35241 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPCD4-0001cY-3c
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 11:47:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPCD1-0001XX-5f
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:47:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPCCw-0001Rq-0Z
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:47:43 -0500
Received: from mail-lb0-x244.google.com ([2a00:1450:4010:c04::244]:35649)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aPCCv-0001R9-JQ; Fri, 29 Jan 2016 11:47:37 -0500
Received: by mail-lb0-x244.google.com with SMTP id dx9so3570027lbc.2;
	Fri, 29 Jan 2016 08:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=0MFVNCmf8XKQ1zolq+E389T0i4YCDknOezkbKYapIgw=;
	b=si7L3z9gzOdQF3IzAPTB7prl4pXi89K/N4E0x58iah2np+OJjV1D7IB+IngaM1tDBl
	W/euaB5tE4f7R7VDwl0MF2vI5bLK+4V4iHUKvrM2vSBkwIhuwgrgM4p8iS1AVcDa/Ggo
	e+0cgd16mS/R855EcfPMMZoXxFBzjeUFsETTi+So2pTsxWgVeR3p+ajC/5W5XRat3R+E
	5Z7RlCMU9mVSt56J7FGnSJODlZ847BtpPl+BBxD2Z1bG4+95CXMWq35G6o0LiKwVmaWy
	mv1OUl4ZSE+Ta9jrPVSHDXZYN34thhshhToVv1XSbzGwfP+/EQr8EQrvsBukNG2Vps2D
	TwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=0MFVNCmf8XKQ1zolq+E389T0i4YCDknOezkbKYapIgw=;
	b=l6dlQP4YchDnui7D1vCZdlfELqEVI0zq8rI/ZQaqNhLiFFwDMA+S8AQKMZaxWo2KDC
	vVz3/a8HcPMqbxyLazg8ifC4BNM88kPVM1xLo3dkbYQ333+3iFb5f/gOSTPmoVPyWYay
	g17EnI1UyM7SWCP1EKTPwjcsK6B2GvAnNgx9kg5STu+qwlMvUoXfywJOyTnbn5YEEVIE
	rc5UQe5kNVmAZkacmjazUd+WjA+UQmg5uk0E3lHfD8Wq91OE7I3iK0C956k8qSJTb/bN
	mftgZESKXa43ne4UUmMEVtGjxUmtvuZYGfTN0QVDS4ibk5+9i/IL+knP7Pqmu+YtSRw9
	qDXQ==
X-Gm-Message-State: AG10YOSHS41SUpcmmFcYz6jBxXAOK1F++mg4JuIiyytNT7E61akeYu9NLVTMn0c9jA/jCg==
X-Received: by 10.112.16.168 with SMTP id h8mr3616714lbd.90.1454086056836;
	Fri, 29 Jan 2016 08:47:36 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	rx3sm2178722lbb.35.2016.01.29.08.47.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jan 2016 08:47:36 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
	<1452796451-2946-7-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56AB97A6.5060508@gmail.com>
Date: Fri, 29 Jan 2016 19:47:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452796451-2946-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::244
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 6/8] target-arm: Handle exception return from
 AArch64 to non-EL0 AArch32
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +nrwHW20FeYz

On 14.01.2016 21:34, Peter Maydell wrote:
> Remove the assumptions that the AArch64 exception return code was
> making about a return to AArch32 always being a return to EL0.
> This includes pulling out the illegal-SPSR checks so we can apply
> them for return to 32 bit as well as return to 64-bit.

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/op_helper.c | 80 +++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 59 insertions(+), 21 deletions(-)
>
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index e42d287..38d46d8 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -640,12 +640,51 @@ void HELPER(pre_smc)(CPUARMState *env, uint32_t syndrome)
>      }
>  }
>  
> +static int el_from_spsr(uint32_t spsr)
> +{
> +    /* Return the exception level that this SPSR is requesting a return to,
> +     * or -1 if it is invalid (an illegal return)
> +     */
> +    if (spsr & PSTATE_nRW) {
> +        switch (spsr & CPSR_M) {
> +        case ARM_CPU_MODE_USR:
> +            return 0;
> +        case ARM_CPU_MODE_HYP:
> +            return 2;
> +        case ARM_CPU_MODE_FIQ:
> +        case ARM_CPU_MODE_IRQ:
> +        case ARM_CPU_MODE_SVC:
> +        case ARM_CPU_MODE_ABT:
> +        case ARM_CPU_MODE_UND:
> +        case ARM_CPU_MODE_SYS:
> +            return 1;
> +        case ARM_CPU_MODE_MON:
> +            /* Returning to Mon from AArch64 is never possible,
> +             * so this is an illegal return.
> +             */
> +        default:
> +            return -1;
> +        }
> +    } else {
> +        if (extract32(spsr, 1, 1)) {
> +            /* Return with reserved M[1] bit set */
> +            return -1;
> +        }
> +        if (extract32(spsr, 0, 4) == 1) {
> +            /* return to EL0 with M[0] bit set */
> +            return -1;
> +        }
> +        return extract32(spsr, 2, 2);
> +    }
> +}
> +
>  void HELPER(exception_return)(CPUARMState *env)
>  {
>      int cur_el = arm_current_el(env);
>      unsigned int spsr_idx = aarch64_banked_spsr_index(cur_el);
>      uint32_t spsr = env->banked_spsr[spsr_idx];
>      int new_el;
> +    bool return_to_aa64 = (spsr & PSTATE_nRW) == 0;
>  
>      aarch64_save_sp(env, cur_el);
>  
> @@ -662,35 +701,34 @@ void HELPER(exception_return)(CPUARMState *env)
>          spsr &= ~PSTATE_SS;
>      }
>  
> -    if (spsr & PSTATE_nRW) {
> -        /* TODO: We currently assume EL1/2/3 are running in AArch64.  */
> +    new_el = el_from_spsr(spsr);
> +    if (new_el == -1) {
> +        goto illegal_return;
> +    }
> +    if (new_el > cur_el
> +        || (new_el == 2 && !arm_feature(env, ARM_FEATURE_EL2))) {
> +        /* Disallow return to an EL which is unimplemented or higher
> +         * than the current one.
> +         */
> +        goto illegal_return;
> +    }
> +
> +    if (new_el != 0 && arm_el_is_aa64(env, new_el) != return_to_aa64) {
> +        /* Return to an EL which is configured for a different register width */
> +        goto illegal_return;
> +    }
> +
> +    if (!return_to_aa64) {
>          env->aarch64 = 0;
> -        new_el = 0;
> -        env->uncached_cpsr = 0x10;
> +        env->uncached_cpsr = spsr & CPSR_M;
>          cpsr_write(env, spsr, ~0);
>          if (!arm_singlestep_active(env)) {
>              env->uncached_cpsr &= ~PSTATE_SS;
>          }
>          aarch64_sync_64_to_32(env);
>  
> -        env->regs[15] = env->elr_el[1] & ~0x1;
> +        env->regs[15] = env->elr_el[cur_el] & ~0x1;
>      } else {
> -        new_el = extract32(spsr, 2, 2);
> -        if (new_el > cur_el
> -            || (new_el == 2 && !arm_feature(env, ARM_FEATURE_EL2))) {
> -            /* Disallow return to an EL which is unimplemented or higher
> -             * than the current one.
> -             */
> -            goto illegal_return;
> -        }
> -        if (extract32(spsr, 1, 1)) {
> -            /* Return with reserved M[1] bit set */
> -            goto illegal_return;
> -        }
> -        if (new_el == 0 && (spsr & PSTATE_SP)) {
> -            /* Return to EL0 with M[0] bit set */
> -            goto illegal_return;
> -        }
>          env->aarch64 = 1;
>          pstate_write(env, spsr);
>          if (!arm_singlestep_active(env)) {

