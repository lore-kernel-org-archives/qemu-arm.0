Received: by 10.28.173.206 with SMTP id w197csp2189713wme;
        Fri, 12 Jan 2018 10:52:27 -0800 (PST)
X-Google-Smtp-Source: ACJfBotg1IGjbqwgVR7aBkiIDutxjQ0oqxLpWA6m/kApy43xf3HOCGYl/hub5OAhkqSx/0j/cbbA
X-Received: by 10.37.43.135 with SMTP id r129mr24904905ybr.279.1515783147657;
        Fri, 12 Jan 2018 10:52:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515783147; cv=none;
        d=google.com; s=arc-20160816;
        b=WmVuqb6N04aybkYwaXJtdtt9sylJxcHbIksEcUNDIAg3VNa/VYqGIW/7d8m1UiJ+9q
         2ngC6bGRIdW5dg2YCQioklNmn6ggwRDCjk5SaneUBW2q5PwmJ9ZaBF70oTtAb0CtZl03
         3flGitIwggIX/+4xsvaRR+4qAWj+xHf2GMG06KLxp+PCOyBB/1Sp1N968aAd+tERtoTi
         7l1UnSCGHHKUEjBbotGzWRYlk90b7gKzz4Bz0t7iwxP2IpAZw414P6Ihk7+HX8ffGeRz
         lTT5fxQx277dNwyYlIUQCvtD/05DyUq+mS3hbM0YJCWzpjYkwPoUak+DG8yyNa70YWSc
         J5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=lGyzQ0UsMRKet1gW0yuCuA9YhSWJ+MLSRloOLWGXdv4=;
        b=JJVJSn/jUaXCW8Sqy4XE5V1ABvaAL3aKxVfpbNBtIoTw8bKpN4MxXM3PNJXwvcRFip
         eYWi/2Yi+/5x5DPfE/92459EO03jUaJlFX+dKwygSbREI3dUbJSJeN03gXix0nurpVkE
         rV/Sjrg+Wce3ptLlIBdpmCG87taVKQChEB0Ol38XfAb6BdNO4SgJhJLuY+IJTPMtM0AZ
         /FyL+c8UQqRYrjlHnwXoTSs/9NzrnyImiNoyjUOAq7OnyHvo46eei+PJDJzUb61RqUDH
         W9m5nvSnmnwFp9tpB0/DNy4+gZNSV6k9yaeRayszDoeyyILbmefx8lQ19oSoNHBayK7Y
         QVNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fcsBBG7/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o127si1158432ywd.336.2018.01.12.10.52.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 10:52:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fcsBBG7/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59238 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea4RH-0003It-2w
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 13:52:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ea4OP-0000q1-Fb
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:49:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ea4OO-0003iK-0O
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:49:29 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:35841)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ea4ON-0003hX-SQ
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:49:27 -0500
Received: by mail-ot0-x241.google.com with SMTP id w4so5849251otg.3
	for <qemu-arm@nongnu.org>; Fri, 12 Jan 2018 10:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lGyzQ0UsMRKet1gW0yuCuA9YhSWJ+MLSRloOLWGXdv4=;
	b=fcsBBG7/OnqhZuVYMMMr3dXB3LmMuqsWMGINORERzcBj/T5B22B3KpiJMxJSlYxKFq
	lix9P3nefPzJWR+aforBNNpdQNdqWC59I1smmP378Lb3nQM7jeDUWiig8qUppdBaBFrf
	+3630LoNZwmNmhvUMcbQt8Evpt/tcH0MZAHnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lGyzQ0UsMRKet1gW0yuCuA9YhSWJ+MLSRloOLWGXdv4=;
	b=IJxikTj0xAoLBY6wILx6DB8DHvMyOue7HTLi2IN6LtlcLVonf0OKxXlwime1Lu5v4/
	IYKhC34bvQvQw5j7Xv7IiDi0nV5Gi0WHlvFlqoOhV+umfrEPTNYpOnKPuzPcQhUNtUbG
	nmOREqxY8NCLWwRDiTRQNh5W4ItpNFlCoJlcFWoIC3gDaKJ9UZr1T8370QM4LjvhOiD2
	bcTf4Ey955CzWqsSzBTlYFFkldlfImxTKNNCPHNdTmKefUPOmmQI1lqXgDvO2i5qWxkZ
	stomeJ2v7TzlIFlDHwHRPt0G9jwvcUkF19KlKkAoBIuBwK0/uCyX/QeRRz2zXeceXY5Z
	3HnQ==
X-Gm-Message-State: AKwxytd1Ne1ONidRmL9+3hySVLVwPi/BhXx8Z2PaWbFnv8NHwjmJTDl8
	slFbA2hwd5uaN0K4mFLf8Doc4fOuJYozTY1QB/SJgA==
X-Received: by 10.157.51.76 with SMTP id u12mr6009298otd.197.1515782967115;
	Fri, 12 Jan 2018 10:49:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Fri, 12 Jan 2018 10:49:06 -0800 (PST)
In-Reply-To: <20171218173022.18418-9-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jan 2018 18:49:06 +0000
Message-ID: <CAFEAcA8QfZBfujPdZ+n89x6rF0m7ohz+KsVX527d4xMnOu-5XA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH 8/9] target/arm: Add ZCR.LEN to tb->flags
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: urvsMVDfGchI

On 18 December 2017 at 17:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
> This has a stub(-ish) implementation of ZCR, in that it does not
> implement _EL[123], or wire up the system register properly.
> However, it is enough for CONFIG_USER_ONLY.
>
> We will need VQ in tb->flags in order to pass the true vector
> size to the generic vector expanders.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 48 ++++++++++++++++++++++++++++++----------------
>  target/arm/translate.h     |  1 +
>  target/arm/cpu.c           |  2 ++
>  target/arm/translate-a64.c |  5 ++---
>  4 files changed, 37 insertions(+), 19 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 150b0d9d84..37b8cef2e2 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -553,6 +553,12 @@ typedef struct CPUARMState {
>          float_status fp_status;
>          float_status fp_status_f16;
>          float_status standard_fp_status;
> +
> +        /* TODO: For system mode, represent all of zcr_el{1,2,3}.
> +         * In the meantime, the composite value exposed to el0.
> +         * Only the low 4 bits are defined, and set via syscall.
> +         */
> +        uint32_t zcr_el;

For purposes of not having to mess with migration state too frequently,
I think this patch should define zcr_el[4] (and add that to the
migration subsection for 'has SVE'). We don't need to actually
implement the behaviour of the upper ELs yet.

>      } vfp;
>      uint64_t exclusive_addr;
>      uint64_t exclusive_val;
> @@ -2649,6 +2655,8 @@ static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
>  #define ARM_TBFLAG_TBI0_MASK (0x1ull << ARM_TBFLAG_TBI0_SHIFT)
>  #define ARM_TBFLAG_TBI1_SHIFT 1        /* TBI1 for EL0/1  */
>  #define ARM_TBFLAG_TBI1_MASK (0x1ull << ARM_TBFLAG_TBI1_SHIFT)
> +#define ARM_TBFLAG_ZCR_LEN_SHIFT 2     /* Composite ZCR_EL1/2/3.LEN */
> +#define ARM_TBFLAG_ZCR_LEN_MASK  (0xfull << ARM_TBFLAG_ZCR_LEN_SHIFT)
>
>  /* some convenience accessor macros */
>  #define ARM_TBFLAG_AARCH64_STATE(F) \
> @@ -2685,6 +2693,8 @@ static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
>      (((F) & ARM_TBFLAG_TBI0_MASK) >> ARM_TBFLAG_TBI0_SHIFT)
>  #define ARM_TBFLAG_TBI1(F) \
>      (((F) & ARM_TBFLAG_TBI1_MASK) >> ARM_TBFLAG_TBI1_SHIFT)
> +#define ARM_TBFLAG_ZCR_LEN(F) \
> +    (((F) & ARM_TBFLAG_ZCR_LEN_MASK) >> ARM_TBFLAG_ZCR_LEN_SHIFT)
>
>  static inline bool bswap_code(bool sctlr_b)
>  {
> @@ -2818,34 +2828,39 @@ static inline uint32_t arm_regime_tbi1(CPUARMState *env, ARMMMUIdx mmu_idx)
>  #endif
>
>  static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
> -                                        target_ulong *cs_base, uint32_t *flags)
> +                                        target_ulong *cs_base, uint32_t *pflags)
>  {
>      ARMMMUIdx mmu_idx = core_to_arm_mmu_idx(env, cpu_mmu_index(env, false));
> +    uint32_t flags;
> +
>      if (is_a64(env)) {
>          *pc = env->pc;
> -        *flags = ARM_TBFLAG_AARCH64_STATE_MASK;
> +        flags = ARM_TBFLAG_AARCH64_STATE_MASK;

Can you put this kind of refactoring in its own patch, please?

>          /* Get control bits for tagged addresses */
> -        *flags |= (arm_regime_tbi0(env, mmu_idx) << ARM_TBFLAG_TBI0_SHIFT);
> -        *flags |= (arm_regime_tbi1(env, mmu_idx) << ARM_TBFLAG_TBI1_SHIFT);
> +        flags |= (arm_regime_tbi0(env, mmu_idx) << ARM_TBFLAG_TBI0_SHIFT);
> +        flags |= (arm_regime_tbi1(env, mmu_idx) << ARM_TBFLAG_TBI1_SHIFT);
> +        /* Get SVE vector length */
> +        flags |= ((env->vfp.zcr_el << ARM_TBFLAG_ZCR_LEN_SHIFT)
> +                  & ARM_TBFLAG_ZCR_LEN_MASK);

Otherwise looks OK.

thanks
-- PMM
