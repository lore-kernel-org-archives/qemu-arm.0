Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1081572wrt;
        Thu, 4 Oct 2018 09:11:42 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63aM1XzVUWa2jWUmehAPEpAhCXnTUHM7LdsvzUWRhNJkicxtGbhWgPpIjcifY5cU0RmCsT2
X-Received: by 2002:a37:b781:: with SMTP id h123-v6mr5820242qkf.353.1538669501981;
        Thu, 04 Oct 2018 09:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538669501; cv=none;
        d=google.com; s=arc-20160816;
        b=dj5Kblpt2HfCvVQ6/9A6CVZx/OP6wmwjdyKh2dw6HmC0iGVKWLuenhNeaRlucY+3C/
         A8jI0jeWl4u2i0/3YBI/CX5rLi4shdSkpbc4B99pnAD/fqRt6dfBh4TurvrHCbP8ieiS
         CMGj0HH7jJzqIvM3Re+NwVyCgIAQwL6aNR8dVe1h4EN0yAo1qlD97FrFZRvPsEi7LTOQ
         qEgS34DDkbsN+X/S1wUXRzxHi/oWfiIVF9RhkRDIgOQyR/B7WPWwoT//8Xy8MYR2j8KU
         9U26A50ZtcuP1/+aOlhMtY4DnpwBNI9J0vR+NATUC7KIIIwDyXHPqiyv2qSuvT5EPFbA
         bsLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=VBdLeN9CrMxa4wrLBgpGcmSo4+JYMJJ4Kcz3QcKGFtQ=;
        b=VMLXBzd57PvTRcyX9oHxB8vKXVrmvNqZMlmqreuOgWBhftu86RqU0a/9sdYWPZVexh
         eKp5b+pi5EDzwTB/FS3fi7DnrvcTVTW/wmMhz4bYtHR0PVgVMgcTZHlEi5xhUl2YDpqZ
         TQCZT1tc9fKxGEtDE1bzfPyMgOyCLyRb8OkboH4aHy1Q9+vq3n665tURiv2MISn0u0nS
         38XKl2iJMRFhJKb9qMQQ6NLRAN8rruAYsVQEt3x2iE/lqKoqLfnMaaD7ofcO5MvxRf8Y
         KK0qX9mgjbzs8Ieqy/N3BtCQ+ubeUtk7bzYeVTib77xQZCV4dQfQaLx936ooJ5RWaYhI
         DYXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x11-v6si2234014qvr.128.2018.10.04.09.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 09:11:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56693 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g86Dz-0007s9-Jh
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 12:11:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g86Cl-0007Xc-T6
	for qemu-devel@nongnu.org; Thu, 04 Oct 2018 12:10:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g864q-0000z2-7Q
	for qemu-devel@nongnu.org; Thu, 04 Oct 2018 12:02:19 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43274)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g864p-0000uj-3y
	for qemu-devel@nongnu.org; Thu, 04 Oct 2018 12:02:11 -0400
Received: by mail-wr1-f68.google.com with SMTP id n1-v6so10516505wrt.10
	for <qemu-devel@nongnu.org>; Thu, 04 Oct 2018 09:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VBdLeN9CrMxa4wrLBgpGcmSo4+JYMJJ4Kcz3QcKGFtQ=;
	b=NHTVOBLtq1V/ITBNNXqCdITKRA0vouK9SWHA3TO0hFsl833/SXvNrn3oxbpmaTXy7l
	tgvvCJ2PM+0Wdn+b6D9g0rz8cTyEC83Y0vfxtbYOoOra2qSwb13uT2Ihq+T2Pjt1vXMT
	zLW4vXMjKwD28Ach23P7NOAtGmH5vxO08DoSXmsRNRz85yK6zv7cRxUHSuV8OGmojQom
	E20FGqpPL+YHUK9qWB4NS/yGSj1ezVpTyOX/51d9YAhyPITnbslcZqmhULYK4qaDgNwd
	zsWac7pmFtK7+dl38YX9RVR3Q+jW15hsGrXeVg9ftwE3NSDYuXG+q35z3JIl/1lrK4Yv
	suyA==
X-Gm-Message-State: ABuFfoj9kHvbeCEan0LKvgEB83clJZCU52FHH6M2Y2sU2KAdsx1X8P+V
	ei7c7pryzB1jL+LfxMYKxfzmVw==
X-Received: by 2002:adf:ec11:: with SMTP id
	x17-v6mr5365372wrn.266.1538668929881; 
	Thu, 04 Oct 2018 09:02:09 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	x203-v6sm2927607wmg.42.2018.10.04.09.02.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Oct 2018 09:02:08 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e7fe0552-904c-724a-4107-8b3f30a251b7@redhat.com>
Date: Thu, 4 Oct 2018 18:02:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH 01/13] target/arm: Define new TBFLAG for
 v8M stack checking
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
Cc: Richard Henderson <richard.henderson@linaro.org>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: utSJhar3MumH

Hi Peter,

On 02/10/2018 18:35, Peter Maydell wrote:
> The Arm v8M architecture includes hardware stack limit checking.
> When certain instructions update the stack pointer, if the new
> value of SP is below the limit set in the associated limit register
> then an exception is taken. Add a TB flag that tracks whether
> the limit-checking code needs to be emitted.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h       |  7 +++++++
>  target/arm/translate.h |  1 +
>  target/arm/helper.c    | 10 ++++++++++
>  target/arm/translate.c |  1 +
>  4 files changed, 19 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 65c0fa0a659..d2c1d005ed7 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1336,8 +1336,10 @@ FIELD(V7M_CCR, UNALIGN_TRP, 3, 1)
>  FIELD(V7M_CCR, DIV_0_TRP, 4, 1)
>  FIELD(V7M_CCR, BFHFNMIGN, 8, 1)
>  FIELD(V7M_CCR, STKALIGN, 9, 1)
> +FIELD(V7M_CCR, STKOFHFNMIGN, 10, 1)
>  FIELD(V7M_CCR, DC, 16, 1)
>  FIELD(V7M_CCR, IC, 17, 1)
> +FIELD(V7M_CCR, BP, 18, 1)
>  
>  /* V7M SCR bits */
>  FIELD(V7M_SCR, SLEEPONEXIT, 1, 1)
> @@ -2842,6 +2844,9 @@ static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
>  /* For M profile only, Handler (ie not Thread) mode */
>  #define ARM_TBFLAG_HANDLER_SHIFT    21
>  #define ARM_TBFLAG_HANDLER_MASK     (1 << ARM_TBFLAG_HANDLER_SHIFT)
> +/* For M profile only, whether we should generate stack-limit checks */
> +#define ARM_TBFLAG_STACKCHECK_SHIFT 22
> +#define ARM_TBFLAG_STACKCHECK_MASK  (1 << ARM_TBFLAG_STACKCHECK_SHIFT)
>  
>  /* Bit usage when in AArch64 state */
>  #define ARM_TBFLAG_TBI0_SHIFT 0        /* TBI0 for EL0/1 or TBI for EL2/3 */
> @@ -2884,6 +2889,8 @@ static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
>      (((F) & ARM_TBFLAG_BE_DATA_MASK) >> ARM_TBFLAG_BE_DATA_SHIFT)
>  #define ARM_TBFLAG_HANDLER(F) \
>      (((F) & ARM_TBFLAG_HANDLER_MASK) >> ARM_TBFLAG_HANDLER_SHIFT)
> +#define ARM_TBFLAG_STACKCHECK(F) \
> +    (((F) & ARM_TBFLAG_STACKCHECK_MASK) >> ARM_TBFLAG_STACKCHECK_SHIFT)
>  #define ARM_TBFLAG_TBI0(F) \
>      (((F) & ARM_TBFLAG_TBI0_MASK) >> ARM_TBFLAG_TBI0_SHIFT)
>  #define ARM_TBFLAG_TBI1(F) \
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index 45f04244be8..c1b65f3efb0 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -38,6 +38,7 @@ typedef struct DisasContext {
>      int vec_stride;
>      bool v7m_handler_mode;
>      bool v8m_secure; /* true if v8M and we're in Secure mode */
> +    bool v8m_stackcheck; /* true if we need to perform v8M stack limit checks */

OK

>      /* Immediate value in AArch32 SVC insn; must be set if is_jmp == DISAS_SWI
>       * so that top level loop can generate correct syndrome information.
>       */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 5e721a65272..6ed8631dbee 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -12667,6 +12667,16 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>          flags |= ARM_TBFLAG_HANDLER_MASK;
>      }
>  
> +    /* v8M always applies stack limit checks unless CCR.STKOFHFNMIGN is
> +     * suppressing them because the requested execution priority is less than 0.
> +     */
> +    if (arm_feature(env, ARM_FEATURE_V8) &&
> +        arm_feature(env, ARM_FEATURE_M) &&
> +        !((mmu_idx  & ARM_MMU_IDX_M_NEGPRI) &&
> +          (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))) {

Specs:

    CCR.STKOFHFNMIGN controls whether stack limit violations
    are IGNORED while executing at a requested execution priority
    that is negative.

    The possible values of this bit are:
    0 Stack limit faults not ignored.
    1 Stack limit faults at requested priorities of less than 0 ignored.

OK, the '!((' notation was hard to read, hopefully the 2 indent spaces
in the 2nd line helped...

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +        flags |= ARM_TBFLAG_STACKCHECK_MASK;
> +    }
> +
>      *pflags = flags;
>      *cs_base = 0;
>  }
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index c6a5d2ac444..751d5811cee 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -12451,6 +12451,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      dc->v7m_handler_mode = ARM_TBFLAG_HANDLER(dc->base.tb->flags);
>      dc->v8m_secure = arm_feature(env, ARM_FEATURE_M_SECURITY) &&
>          regime_is_secure(env, dc->mmu_idx);
> +    dc->v8m_stackcheck = ARM_TBFLAG_STACKCHECK(dc->base.tb->flags);
>      dc->cp_regs = cpu->cp_regs;
>      dc->features = env->features;
>  
> 
