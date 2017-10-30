Received: by 10.223.161.27 with SMTP id o27csp2755437wro;
        Mon, 30 Oct 2017 10:57:49 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SUMx8PKNKAsY6mrevXVvE+7VEb08EEay02q1lHN5S7WhRPXxm7Mm6pOOuWLAgik7dw2vrI
X-Received: by 10.37.129.139 with SMTP id p11mr3101422ybk.104.1509386269272;
        Mon, 30 Oct 2017 10:57:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509386269; cv=none;
        d=google.com; s=arc-20160816;
        b=ib1wVBqTwm4cawCSe17Q9JtFKyRChX/lbwJiSqLWujAm3ahFt+tJ9bZXTEXSmArmsf
         iofPoaf1ACtNeJWVkzgUzh713jipKlUpXnBBGo0+UEU9mH7fQy7ZhWqstDnJGYKhzZns
         aTctwCsjdCBSqIxtXMiVY8WQFPpEENEdyqFkTp1Mw4ta/QCyvKjt+JOerl17l+R7D+0v
         JdYaORK6TvazQf8cSuts+woxtuf0tUd/GFnMR70vvATm8owOGkGXBYfCrG2bB82tUcDO
         b0eat1LXhxCYdohqvaeku8E33HQkLdfjslkC3UaFQ0vK+TjiG8plL3wjarwtDxPamxeC
         dP0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=jX82K07ChkHNpAroPfZyVCOmYxI1LnMUHnmroQamGWo=;
        b=SAQPXNGn3UFjh8Wk1AaC1JYVFVyOm8lWQSN4TO1J9yvjw0Xiqb1gv/rwZlPY7HbE5X
         aZCEDNlepQ4Xhz8GX6ZEW95q3ZqzaQzbDm8ZUtHP4NdUnqBwsa0tL8sIBYihlMVKf3h+
         xXV9CInncG4DpQRO+exBoIZOhOucDfVQtNgDNPEYbbU4nXc7MyoymwM/n2ghyPFyN1/r
         v6PaYOsI+zYPVbfgivCQ88MBJBAd29YiIBkX5oObn2Y9HQgHnBczsNLXy0j7bNhg8XoS
         4jr6oJpObQbNA/o3SJiBoAxD9nKJXM8xHw+Q2OyKOHkPV3FpolO9ku4sBjc+oFtC3oMD
         NS5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RVXp/kbD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c7si2506066ybk.148.2017.10.30.10.57.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Oct 2017 10:57:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RVXp/kbD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9EJo-0004Gf-NP
	for alex.bennee@linaro.org; Mon, 30 Oct 2017 13:57:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9EJf-0004G0-6D
	for qemu-arm@nongnu.org; Mon, 30 Oct 2017 13:57:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9EJd-0004Ko-Q0
	for qemu-arm@nongnu.org; Mon, 30 Oct 2017 13:57:39 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:51001)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e9EJd-0004JZ-FG
	for qemu-arm@nongnu.org; Mon, 30 Oct 2017 13:57:37 -0400
Received: by mail-wr0-x243.google.com with SMTP id p96so13477824wrb.7
	for <qemu-arm@nongnu.org>; Mon, 30 Oct 2017 10:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jX82K07ChkHNpAroPfZyVCOmYxI1LnMUHnmroQamGWo=;
	b=RVXp/kbD3p/rzyzAnl2IWde9pE35PY1oPgbMrzKBBeWPIDXjlZLx5pVHEAAlevXZfV
	nBalaRucB7vrSR1uN0Oa6b3LVy0pOKIR15qh8YgLwfoo7eKViIWNNFItySo/UI+qv0YZ
	K8Kg/uxS6rNrZncjQMV6gUCt/+FFrXhFkqnqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jX82K07ChkHNpAroPfZyVCOmYxI1LnMUHnmroQamGWo=;
	b=SH8kz8MWJWTsvyk138/L1Ykv1lzhO8Lag2VWCAATcuQftRiaU845h3Zlz/4eQDydui
	+06rNRjhN+Pvf4o1UbujEZTdsz6E5xzMTlm6S1ekvp2QeB62ov79s4jXQYxcGolHZgY6
	9+VPy6yE2DxFhmbuy9hKJLlsN3fPXyhEDEMT1wbSGAb5yxDc7Re7AQZVVOZwFLX4Az2Y
	2j2HADOQonX1WxZhvBD7O92Ud7kmYaoYLLN24eNN6lyaeNU66BRZVIQR3YenSWC+1FXO
	ewjb6tCK4vHt239EFumAN8M/eQn/1hqMj5uXwOLH3e0dHVYCoAwAsrjsKXEwVPXQJJRA
	FYYg==
X-Gm-Message-State: AMCzsaW56rz8Xi6AlnA5VcYU4sGeh9JGyDW2a4v16d/7xQGNPK9PrfNM
	sZfGkH9Ez2hLPEyO+0rzYhWK+fz40XvzV39UmIzjpg==
X-Received: by 10.223.143.54 with SMTP id p51mr8043839wrb.138.1509386256147;
	Mon, 30 Oct 2017 10:57:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 30 Oct 2017 10:57:15 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1710251623560.574@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710251623560.574@sstabellini-ThinkPad-X260>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Oct 2017 17:57:15 +0000
Message-ID: <CAFEAcA8pvLNGReghJp0QATbBtC-KCgPqQheKnY=KzDPcjdym3g@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [PATCH v2] don't hardcode EL1 in
 extended_addresses_enabled
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
	Julien Grall <julien.grall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l11dOyRAHjLz

On 26 October 2017 at 00:28, Stefano Stabellini <sstabellini@kernel.org> wrote:
> extended_addresses_enabled calls arm_el_is_aa64, hardcoding exception
> level 1. Instead, add an additional "el" argument to
> extended_addresses_enabled.
>
> The caller will pass the right value. In most cases, it will be
> arm_current_el(env). However, arm_debug_excp_handler will
> use arm_debug_target_el(env), as the target el for a debug trap can be
> different from the current el.
>
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>

I have some longer comments below about what a mess this whole
area is. Fixing some of that requires some heavy refactoring,
which I don't want to do just now since we're about to go into
softfreeze for the next release.

What's the specific situation/bug that you're trying to fix with
this patch? You don't say in the commit message.
We should be able to put in a point fix to deal with whatever it is,
but it's hard to suggest what that would be without the detail
of what exactly we're getting wrong. (It's the PAR format stuff,
right? But which ATS instruction are you using, from which
exception level, with which register width, for which stage
1 page table format and stage 1 guest register width?)

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 96113fe..2298428 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -500,7 +500,7 @@ static void contextidr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      ARMCPU *cpu = arm_env_get_cpu(env);
>
>      if (raw_read(env, ri) != value && !arm_feature(env, ARM_FEATURE_PMSA)
> -        && !extended_addresses_enabled(env)) {
> +        && !extended_addresses_enabled(env, arm_current_el(env))) {
>          /* For VMSA (when not using the LPAE long descriptor page table
>           * format) this register includes the ASID, so do a TLB flush.
>           * For PMSA it is purely a process ID and no action is needed.

This isn't really right for figuring out what to do on CONTEXTIDR writes
in the general case. What we want is something along the lines of:

need_flush = true;
if (EL3 is AArch64) {
    /* There is only one CONTEXTIDR, and it applies to EL1. We only need
     * to flush if EL1 is or will be AArch32 and has extended addresses
     * disabled.
     */
    if (tcr_el[1].TTBCR_EAE) {
        need_flush = false;
    }
} else {
    /* If extended addressing is enabled for the translation regime that
     * this CONTEXTIDR register applies to, then there is no ASID field
     * and we don't need to TLB flush. (If we later change the EAE bit
     * we'll flush then.)
     */
    bool sec = ri->secure & ARM_CP_SECSTATE_S;
    if (FEATURE_LPAE && tcr_el[sec ? 3 : 1].TTBCR_EAE) {
        need_flush = false;
    }
}
if (need_flush) {
    /* We should be cleverer about which MMU indexes need flushing here */
    tlb_flush(CPU(cpu));
}

because we need to handle the case of "EL1 is using short descriptors
and EL2 writes to CONTEXTIDR for EL1".

...but then we also need to tlb_flush when the tcr bits change, which
I don't think we do correctly. (We never notice this sort of bug because
we handle correctly the common cases of "all aarch64, or aarch64 and
LPAE aarch32" and "short descriptors in an aarch32-only EL1/EL0-only
config".)

> @@ -2162,7 +2162,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
>
>      ret = get_phys_addr(env, value, access_type, mmu_idx,
>                          &phys_addr, &attrs, &prot, &page_size, &fsr, &fi);
> -    if (extended_addresses_enabled(env)) {
> +    if (extended_addresses_enabled(env, arm_current_el(env))) {

I think what you want to be checking here is
       if (arm_s1_regime_using_lpae_format(env, mmu_idx)) {

(because you are trying to determine what get_phys_addr() has
just handed you, and that function looks at the state of the
translation regime specified by mmu_idx, not at the current state
of the CPU)...

...but even this isn't really correct, because get_phys_addr() has
some broken cases where for a stage1+2 lookup where stage 1 is
using short descriptors we will return a short-format FSR value
for a stage1 failure but a long-format value for a stage2 failure.

The right long term thing here is to refactor get_phys_addr() so
that instead of returning literal fsr values it should return some
kind of internal QEMU type describing the failure, which we then
convert into the FSR we want at the point when we need to (ie
when taking an exception to a given EL, or writing a PAR value
for a given ATS* instruction).

>          /* fsr is a DFSR/IFSR value for the long descriptor
>           * translation table format, but with WnR always clear.
>           * Convert it to a 64-bit PAR.
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 43106a2..6792df2 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -217,10 +217,10 @@ static inline unsigned int arm_pamax(ARMCPU *cpu)
>   * This is always the case if our translation regime is 64 bit,
>   * but depends on TTBCR.EAE for 32 bit.
>   */
> -static inline bool extended_addresses_enabled(CPUARMState *env)
> +static inline bool extended_addresses_enabled(CPUARMState *env, unsigned int el)
>  {
> -    TCR *tcr = &env->cp15.tcr_el[arm_is_secure(env) ? 3 : 1];
> -    return arm_el_is_aa64(env, 1) ||
> +    TCR *tcr = &env->cp15.tcr_el[el];
> +    return arm_el_is_aa64(env, el) ||
>             (arm_feature(env, ARM_FEATURE_LPAE) && (tcr->raw_tcr & TTBCR_EAE));

(not an error introduced in this change, but)
This will return the wrong answer for the debug exception case if
we are taking the debug exception to AArch32 Secure EL1 (in which
case EL3 must be AArch64, there is no register banking, and the
correct TCR for Secure EL1 is in tcr_el[1]).

>  }
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 3914145..4f46eb8 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -1378,7 +1378,7 @@ void arm_debug_excp_handler(CPUState *cs)
>
>              cs->watchpoint_hit = NULL;
>
> -            if (extended_addresses_enabled(env)) {
> +            if (extended_addresses_enabled(env, arm_debug_target_el(env))) {
>                  env->exception.fsr = (1 << 9) | 0x22;
>              } else {
>                  env->exception.fsr = 0x2;
> @@ -1402,7 +1402,7 @@ void arm_debug_excp_handler(CPUState *cs)
>              return;
>          }
>
> -        if (extended_addresses_enabled(env)) {
> +        if (extended_addresses_enabled(env, arm_debug_target_el(env))) {
>              env->exception.fsr = (1 << 9) | 0x22;
>          } else {
>              env->exception.fsr = 0x2;

If we managed the refactoring of get_phys_addr() mentioned above then
these could turn into "don't set a specific fsr value, but use an
internal type for saying 'debug exception', and let the other end
create the right FSR for wherever they are".

thanks
-- PMM
