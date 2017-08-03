Received: by 10.25.221.202 with SMTP id w71csp793075lfi;
        Thu, 3 Aug 2017 08:32:43 -0700 (PDT)
X-Received: by 10.237.42.67 with SMTP id k3mr2654126qtf.122.1501774363885;
        Thu, 03 Aug 2017 08:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501774363; cv=none;
        d=google.com; s=arc-20160816;
        b=QUsWx29C4j0scO5b8hjwD1uO5jBC6uW+UmxkYD29iktf/BWesjysp5ubinzEmbuGKC
         Hva3m4KMbUTJcFR2r9MibvCnA4gKzUZ6KN9r9/4r3G03f3gEPtSUHEyMMk/gL32BMn/o
         34eKR+gXdnjzyUKZL0O6gkXwN/CWltVw8XBDYKf3ugUqDhNOLaqwu6RIPHWSEUC5GjZ+
         R0Dee7sSKdnVq22s4sG8+lKFDsgxpnX+lhqFkzZpnU6eY+npi2T0Bzhae4myFQv4fu2Q
         TQ8Uc8Jo8diqqX7f8PC4JzW51G0GI/lJjp7Df+hUnJqQ7tM2hf7Ii1/CcJ+5lhJvzGhJ
         z8FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=MlPNTbVut5JSW8HtbY64PMySf4rg3bqfxVWrYKYTspg=;
        b=KcfDJftF04tAxzpGyq/LG7yR95AoW/Z10WKc7/XEliQNrcfnVwNjbQ2FjVZsgK7f1d
         S9V3LmwI/Qr+B52FeZ5Nyf27fCLU/L/dffav7K1ZuG2stmBPnZ6LYwobevj5+j8bhbJK
         Sls2qDxlrjiPAcPELnN47DoU7a9HDcB0G01Ofwv3xyCSY4Gj3PM8isTOJy1496ryVqx3
         go4E0v601QDzFezkjlgvL/LOs3Vl0b4EnpofFPS1lpcFVkpoQwwCotgECBK251A1+1O9
         6JRYSlrZDhHtbIAcz6BFsgrOAgFoV8ViS5SjrhyPQTZ5IFqJZyXKThZ2fl5RwY5HF3x6
         bt0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=Lpmjx9i3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 65si4243325qta.373.2017.08.03.08.32.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 08:32:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=Lpmjx9i3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddI77-0005FP-AW
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 11:32:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddI71-0005Ep-Vz
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:32:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddI6x-0001bO-9n
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:32:36 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:38150)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddI6w-0001aC-VZ; Thu, 03 Aug 2017 11:32:31 -0400
Received: by mail-lf0-x244.google.com with SMTP id y15so1176361lfd.5;
	Thu, 03 Aug 2017 08:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=MlPNTbVut5JSW8HtbY64PMySf4rg3bqfxVWrYKYTspg=;
	b=Lpmjx9i3HPFZUYOlOhcqLq2fPF2PwKlEJEqfxwao6uog/9HTQUbgNR/op9LYPKzRG6
	JUMaobbE9jNeRsa5auJWmHLCZtPIqctdCh8QC6nxpdLjcIWptLGzYIS2c9+8ugzM6VoH
	5/+htazvr3LC/h663hGqNkws9uXVaB4y6ScXmr0OJptS3Zp8/ncBcNJ+MLYw8rkffnfI
	/vgE7JrirIL0WPSTWjXr7pQ9VqrUGHRNfhohD4ffk4fAHYE2mBKGwS0Fud9AS4GRLUCC
	SFMq/8VfAjY4DjCLcuFfvyo09iFb2Bk59uknsHeiXpnCW1Jcv48YpkH1+dvYUb2BmDCA
	zPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=MlPNTbVut5JSW8HtbY64PMySf4rg3bqfxVWrYKYTspg=;
	b=fSFLNsWoQa8szJbxMUkc1w/3sgo+4IDHBKklsjMGFdgDf7arMUd6AvYPAgCjor7G6r
	jAxvu4YZ3fXyTn+ei+RQ4g6QvRvM7zpoVL8/xCFYZMod6UbwC/Wgif/LW+BPOPKGACs3
	Tlxo7xlzGeRxuHty2RWw1vBd8o2hq7Kv+D+HRQLm2Uar5obGfdMXXENewVS2MhqxNUBS
	wYZK19djALy3FzocdUaZfHHI47g28HilRb3DT0dcKyOWy9ifit+T9LVNPJ4Rrm54Vupo
	LA0FvGJwmUrEEQfwFbtC0wS2CkQOktp71YQdR6fuHgXPQ7+jYj87tn6L/9SrnG2qz+i7
	ML9w==
X-Gm-Message-State: AIVw112E9/3fC3z1uQPRpT8WekXHFk2CuPxXhUrzzfJRppdYxzlF7IMV
	cFnwmlRX0NPftw==
X-Received: by 10.46.25.151 with SMTP id 23mr889439ljz.114.1501774349414;
	Thu, 03 Aug 2017 08:32:29 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id i28sm446114ljb.79.2017.08.03.08.32.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 08:32:27 -0700 (PDT)
Date: Thu, 3 Aug 2017 17:32:27 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170803153227.GQ4859@toto>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-9-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501692241-23310-9-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [PATCH 08/15] target/arm: Define and use XPSR bit
 masks
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xoRdOGr2wxFA

On Wed, Aug 02, 2017 at 05:43:54PM +0100, Peter Maydell wrote:
> The M profile XPSR is almost the same format as the A profile CPSR,
> but not quite. Define some XPSR_* macros and use them where we
> definitely dealing with an XPSR rather than reusing the CPSR ones.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/cpu.h    | 38 ++++++++++++++++++++++++++++----------
>  target/arm/helper.c | 15 ++++++++-------
>  2 files changed, 36 insertions(+), 17 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index b64474c..1f06de0 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -883,6 +883,22 @@ void pmccntr_sync(CPUARMState *env);
>  /* Mask of bits which may be set by exception return copying them from SPSR */
>  #define CPSR_ERET_MASK (~CPSR_RESERVED)
>  
> +/* Bit definitions for M profile XPSR. Most are the same as CPSR. */
> +#define XPSR_EXCP 0x1ffU
> +#define XPSR_SPREALIGN (1U << 9) /* Only set in exception stack frames */
> +#define XPSR_IT_2_7 CPSR_IT_2_7
> +#define XPSR_GE CPSR_GE
> +#define XPSR_SFPA (1U << 20) /* Only set in exception stack frames */
> +#define XPSR_T (1U << 24) /* Not the same as CPSR_T ! */
> +#define XPSR_IT_0_1 CPSR_IT_0_1
> +#define XPSR_Q CPSR_Q
> +#define XPSR_V CPSR_V
> +#define XPSR_C CPSR_C
> +#define XPSR_Z CPSR_Z
> +#define XPSR_N CPSR_N
> +#define XPSR_NZCV CPSR_NZCV
> +#define XPSR_IT CPSR_IT
> +
>  #define TTBCR_N      (7U << 0) /* TTBCR.EAE==0 */
>  #define TTBCR_T0SZ   (7U << 0) /* TTBCR.EAE==1 */
>  #define TTBCR_PD0    (1U << 4)
> @@ -987,26 +1003,28 @@ static inline uint32_t xpsr_read(CPUARMState *env)
>  /* Set the xPSR.  Note that some bits of mask must be all-set or all-clear.  */
>  static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
>  {
> -    if (mask & CPSR_NZCV) {
> -        env->ZF = (~val) & CPSR_Z;
> +    if (mask & XPSR_NZCV) {
> +        env->ZF = (~val) & XPSR_Z;
>          env->NF = val;
>          env->CF = (val >> 29) & 1;
>          env->VF = (val << 3) & 0x80000000;
>      }
> -    if (mask & CPSR_Q)
> -        env->QF = ((val & CPSR_Q) != 0);
> -    if (mask & (1 << 24))
> -        env->thumb = ((val & (1 << 24)) != 0);
> -    if (mask & CPSR_IT_0_1) {
> +    if (mask & XPSR_Q) {
> +        env->QF = ((val & XPSR_Q) != 0);
> +    }
> +    if (mask & XPSR_T) {
> +        env->thumb = ((val & XPSR_T) != 0);
> +    }
> +    if (mask & XPSR_IT_0_1) {
>          env->condexec_bits &= ~3;
>          env->condexec_bits |= (val >> 25) & 3;
>      }
> -    if (mask & CPSR_IT_2_7) {
> +    if (mask & XPSR_IT_2_7) {
>          env->condexec_bits &= 3;
>          env->condexec_bits |= (val >> 8) & 0xfc;
>      }
> -    if (mask & 0x1ff) {
> -        env->v7m.exception = val & 0x1ff;
> +    if (mask & XPSR_EXCP) {
> +        env->v7m.exception = val & XPSR_EXCP;
>      }
>  }
>  
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index cb88c66..f087d42 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6119,7 +6119,7 @@ static void v7m_push_stack(ARMCPU *cpu)
>      /* Align stack pointer if the guest wants that */
>      if ((env->regs[13] & 4) && (env->v7m.ccr & R_V7M_CCR_STKALIGN_MASK)) {
>          env->regs[13] -= 4;
> -        xpsr |= 0x200;
> +        xpsr |= XPSR_SPREALIGN;
>      }
>      /* Switch to the handler mode.  */
>      v7m_push(env, xpsr);
> @@ -6244,10 +6244,11 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>          env->regs[15] &= ~1U;
>      }
>      xpsr = v7m_pop(env);
> -    xpsr_write(env, xpsr, 0xfffffdff);
> +    xpsr_write(env, xpsr, ~XPSR_SPREALIGN);
>      /* Undo stack alignment.  */
> -    if (xpsr & 0x200)
> +    if (xpsr & XPSR_SPREALIGN) {
>          env->regs[13] |= 4;
> +    }
>  
>      /* The restored xPSR exception field will be zero if we're
>       * resuming in Thread mode. If that doesn't match what the
> @@ -8693,10 +8694,10 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
>      case 0 ... 7: /* xPSR sub-fields */
>          mask = 0;
>          if ((reg & 1) && el) {
> -            mask |= 0x000001ff; /* IPSR (unpriv. reads as zero) */
> +            mask |= XPSR_EXCP; /* IPSR (unpriv. reads as zero) */
>          }
>          if (!(reg & 4)) {
> -            mask |= 0xf8000000; /* APSR */
> +            mask |= XPSR_NZCV | XPSR_Q; /* APSR */
>          }
>          /* EPSR reads as zero */
>          return xpsr_read(env) & mask;
> @@ -8754,10 +8755,10 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
>              uint32_t apsrmask = 0;
>  
>              if (mask & 8) {
> -                apsrmask |= 0xf8000000; /* APSR NZCVQ */
> +                apsrmask |= XPSR_NZCV | XPSR_Q;
>              }
>              if ((mask & 4) && arm_feature(env, ARM_FEATURE_THUMB_DSP)) {
> -                apsrmask |= 0x000f0000; /* APSR GE[3:0] */
> +                apsrmask |= XPSR_GE;
>              }
>              xpsr_write(env, val, apsrmask);
>          }
> -- 
> 2.7.4
> 
> 
