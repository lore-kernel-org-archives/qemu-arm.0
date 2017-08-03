Received: by 10.25.221.202 with SMTP id w71csp799771lfi;
        Thu, 3 Aug 2017 08:38:15 -0700 (PDT)
X-Received: by 10.237.54.227 with SMTP id f90mr1139862qtb.256.1501774695857;
        Thu, 03 Aug 2017 08:38:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501774695; cv=none;
        d=google.com; s=arc-20160816;
        b=oS1LpZLepE9D4n7UdIQVUpI5j7qqEonICoTdJJD8rWX7AdxvFM6JrOH66HrcJMcSm+
         s7ukj4Tq42nrVj/b2GyLL3c+M/GF7Q+weY96PJ3CrbuofOywP0jboOdAZ9YoUVhguHyG
         2mrWJcVbTaHhY04tC5Zh6/wMRsS2ZJwsWfYoq5Zmwt+ueYwhvm3MOxqc5pVcj6o9x+Rs
         RojlDdAQGqzQ3WSEGid3ofh40koM/PAjW7IGeMS+NrQXHhhkBoXcMVdOtex6okf2KpZi
         4N57ExzBaI5DLSBtwXhS3cjgp/DInBRpAXEeJOCYTtQxGEYV2Ez4YAYt/JfaTIsoorGX
         J6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=5/0UdQuuztdAA6F4xprwgDcUA8ZgyC3m3vEzeC4B8GI=;
        b=vfs83+5metIRnn3V2jORf5ZZwNTo+x4dVsIzWtuR6qxyuURsGZYr+61BCRu2IG4tzk
         BpEcKWFTFTpI8Ytt25DAKnsLSihMohAi8gZ4hEf6ocD3rueow2QBUdo9R67xNmSC04zU
         a22gnkYAzP+Tq8+g9U3W/iuJvcjvsxsYErm5KVDWJBUxMS3z3iFx0OZxqOsGvvyjqMZA
         sGWG5wVafZSPqGwm/imjKebZvSFTRA2ZtYv0ZAe43u3grBYA+k9bp2I5h86GeQwVyeQN
         1cIKXKL0t1s9B8jQJNFdZEIna5usf8Cf8xfvEQ73wQzMcNfFfrz4g3lvtDpoMvcbe96n
         Qh+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=iL1ZW4iT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c76si22766432qkh.349.2017.08.03.08.38.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 08:38:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=iL1ZW4iT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54197 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddICT-0007Sr-8N
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 11:38:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddICO-0007RF-Gt
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:38:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddICJ-000738-KW
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:38:08 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35399)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddICJ-00070j-8o; Thu, 03 Aug 2017 11:38:03 -0400
Received: by mail-lf0-x243.google.com with SMTP id w199so1192303lff.2;
	Thu, 03 Aug 2017 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5/0UdQuuztdAA6F4xprwgDcUA8ZgyC3m3vEzeC4B8GI=;
	b=iL1ZW4iTfl4IQqYfoGCCdVnyc1C4YxSgQMJBcg+0NNixwLvVuH5D2etABCZuTb9adM
	txWR41O3WXRv8fJB7K9mvO+oDwXxSYlW4sV7jTaM6V9coIjrTPdMHgFzCy/QegUOkyJo
	+t8Tw1/BEQTDuaua8jGT2meXYGpOWcGX3KXpQGbYN13qeyyI6xTOq/AW2XhmRhkkg6EU
	doS11ozy/kGC+u/51qtmDcMy1HM4odsLFM7TNWT0/tMUZawBWiQ75tNNVn73KbnThSJ4
	vyGrLUGjfiRK3pgQylonPcRSIe++Hur3c+LnAbpPZm64+TCD4r95/lfVD4GN7KhySqxU
	CFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5/0UdQuuztdAA6F4xprwgDcUA8ZgyC3m3vEzeC4B8GI=;
	b=o1FEyiuqUjoQaavHHSE6xnFQhUyuVoT/f/0u1PfHAQnQWjEzPsKFFMwJRHIPwanTDp
	KI0yPwCHapHXgYiw99Tl+eal8QfKj0v6vu85sQMQqqaZkIRf5Tivs8Tw/6fgPTo0qNmM
	wZ3JAXxOShTtmQdQQg0MtHbaOF0g0zQpEX+RsOcdwsR4jF3zB36u2ds7D/5yYXX3T8wc
	S8H3NrEKrBT+sXgfbkwNU44BPPPlKJ3J79tbbMNqqzLHzzjfMnDDnIKmpE9T11tEiqZi
	PVKeAwjQ0feB5fHTebGf2f6lEM4UzDiWdaEiV/l2jKPy0pOGXsVZdpSYTt55kXmjhE/g
	zIPA==
X-Gm-Message-State: AIVw112nGYu9/ZL5KswHb9llsejgCWH/CBS5TBuoVgQv8nmMDYeLitS8
	lXO2HBa3piNmBg==
X-Received: by 10.46.76.18 with SMTP id z18mr867003lja.111.1501774681523;
	Thu, 03 Aug 2017 08:38:01 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id 9sm450093ljo.89.2017.08.03.08.38.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 08:38:00 -0700 (PDT)
Date: Thu, 3 Aug 2017 17:38:00 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170803153800.GR4859@toto>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-10-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501692241-23310-10-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-arm] [PATCH 09/15] target/arm: Don't store M profile
 PRIMASK and FAULTMASK in daif
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
X-TUID: JIHx3JqqqTpG

On Wed, Aug 02, 2017 at 05:43:55PM +0100, Peter Maydell wrote:
> We currently store the M profile CPU register state PRIMASK and
> FAULTMASK in the daif field of the CPU state in its I and F
> bits. This is a legacy from the original implementation, which
> tried to share the cpu_exec_interrupt code between A profile
> and M profile. We've since separated out the two cases because
> they are significantly different, so now there is no common
> code between M and A profile which looks at env->daif: all the
> uses are either in A-only or M-only code paths. Sharing the state
> fields now is just confusing, and will make things awkward
> when we implement v8M, where the PRIMASK and FAULTMASK
> registers are banked between security states.
> 
> Switch M profile over to using v7m.faultmask and v7m.primask
> fields for these registers.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c |  4 ++--
>  target/arm/cpu.c      |  5 -----
>  target/arm/cpu.h      |  4 +++-
>  target/arm/helper.c   | 18 +++++-------------
>  target/arm/machine.c  | 33 +++++++++++++++++++++++++++++++++
>  5 files changed, 43 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 2e8166a..343bc16 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -167,9 +167,9 @@ static inline int nvic_exec_prio(NVICState *s)
>      CPUARMState *env = &s->cpu->env;
>      int running;
>  
> -    if (env->daif & PSTATE_F) { /* FAULTMASK */
> +    if (env->v7m.faultmask) {
>          running = -1;
> -    } else if (env->daif & PSTATE_I) { /* PRIMASK */
> +    } else if (env->v7m.primask) {
>          running = 0;
>      } else if (env->v7m.basepri > 0) {
>          running = env->v7m.basepri & nvic_gprio_mask(s);
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 05c038b..b241a63 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -185,11 +185,6 @@ static void arm_cpu_reset(CPUState *s)
>          uint32_t initial_pc; /* Loaded from 0x4 */
>          uint8_t *rom;
>  
> -        /* For M profile we store FAULTMASK and PRIMASK in the
> -         * PSTATE F and I bits; these are both clear at reset.
> -         */
> -        env->daif &= ~(PSTATE_I | PSTATE_F);
> -
>          /* The reset value of this bit is IMPDEF, but ARM recommends
>           * that it resets to 1, so QEMU always does that rather than making
>           * it dependent on CPU model.
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 1f06de0..da90b7a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -418,6 +418,8 @@ typedef struct CPUARMState {
>          uint32_t bfar; /* BusFault Address */
>          unsigned mpu_ctrl; /* MPU_CTRL */
>          int exception;
> +        uint32_t primask;
> +        uint32_t faultmask;

It seems like these could be booleans?

Cheers,
Edgar


>      } v7m;
>  
>      /* Information associated with an exception about to be taken:
> @@ -2179,7 +2181,7 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
>           * we're in a HardFault or NMI handler.
>           */
>          if ((env->v7m.exception > 0 && env->v7m.exception <= 3)
> -            || env->daif & PSTATE_F) {
> +            || env->v7m.faultmask) {
>              return arm_to_core_mmu_idx(ARMMMUIdx_MNegPri);
>          }
>  
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index f087d42..b64ddb1 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6172,7 +6172,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>  
>      if (env->v7m.exception != ARMV7M_EXCP_NMI) {
>          /* Auto-clear FAULTMASK on return from other than NMI */
> -        env->daif &= ~PSTATE_F;
> +        env->v7m.faultmask = 0;
>      }
>  
>      switch (armv7m_nvic_complete_irq(env->nvic, env->v7m.exception)) {
> @@ -8718,12 +8718,12 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
>          return (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) ?
>              env->regs[13] : env->v7m.other_sp;
>      case 16: /* PRIMASK */
> -        return (env->daif & PSTATE_I) != 0;
> +        return env->v7m.primask;
>      case 17: /* BASEPRI */
>      case 18: /* BASEPRI_MAX */
>          return env->v7m.basepri;
>      case 19: /* FAULTMASK */
> -        return (env->daif & PSTATE_F) != 0;
> +        return env->v7m.faultmask;
>      default:
>          qemu_log_mask(LOG_GUEST_ERROR, "Attempt to read unknown special"
>                                         " register %d\n", reg);
> @@ -8778,11 +8778,7 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
>          }
>          break;
>      case 16: /* PRIMASK */
> -        if (val & 1) {
> -            env->daif |= PSTATE_I;
> -        } else {
> -            env->daif &= ~PSTATE_I;
> -        }
> +        env->v7m.primask = val & 1;
>          break;
>      case 17: /* BASEPRI */
>          env->v7m.basepri = val & 0xff;
> @@ -8793,11 +8789,7 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
>              env->v7m.basepri = val;
>          break;
>      case 19: /* FAULTMASK */
> -        if (val & 1) {
> -            env->daif |= PSTATE_F;
> -        } else {
> -            env->daif &= ~PSTATE_F;
> -        }
> +        env->v7m.faultmask = val & 1;
>          break;
>      case 20: /* CONTROL */
>          /* Writing to the SPSEL bit only has an effect if we are in
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 1f66da4..2fb4b76 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -97,6 +97,17 @@ static bool m_needed(void *opaque)
>      return arm_feature(env, ARM_FEATURE_M);
>  }
>  
> +static const VMStateDescription vmstate_m_faultmask_primask = {
> +    .name = "cpu/m/faultmask-primask",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(env.v7m.faultmask, ARMCPU),
> +        VMSTATE_UINT32(env.v7m.primask, ARMCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_m = {
>      .name = "cpu/m",
>      .version_id = 4,
> @@ -115,6 +126,10 @@ static const VMStateDescription vmstate_m = {
>          VMSTATE_UINT32(env.v7m.mpu_ctrl, ARMCPU),
>          VMSTATE_INT32(env.v7m.exception, ARMCPU),
>          VMSTATE_END_OF_LIST()
> +    },
> +    .subsections = (const VMStateDescription*[]) {
> +        &vmstate_m_faultmask_primask,
> +        NULL
>      }
>  };
>  
> @@ -201,6 +216,24 @@ static int get_cpsr(QEMUFile *f, void *opaque, size_t size,
>      CPUARMState *env = &cpu->env;
>      uint32_t val = qemu_get_be32(f);
>  
> +    if (arm_feature(env, ARM_FEATURE_M)) {
> +        /* If the I or F bits are set then this is a migration from
> +         * an old QEMU which still stored the M profile FAULTMASK
> +         * and PRIMASK in env->daif. Set v7m.faultmask and v7m.primask
> +         * accordingly, and then clear the bits so they don't confuse
> +         * cpsr_write(). For a new QEMU, the bits here will always be
> +         * clear, and the data is transferred using the
> +         * vmstate_m_faultmask_primask subsection.
> +         */
> +        if (val & CPSR_F) {
> +            env->v7m.faultmask = 1;
> +        }
> +        if (val & CPSR_I) {
> +            env->v7m.primask = 1;
> +        }
> +        val &= ~(CPSR_F | CPSR_I);
> +    }
> +
>      env->aarch64 = ((val & PSTATE_nRW) == 0);
>  
>      if (is_a64(env)) {
> -- 
> 2.7.4
> 
> 
