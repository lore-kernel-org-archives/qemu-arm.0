Received: by 10.25.159.19 with SMTP id i19csp1050106lfe;
        Fri, 29 Jan 2016 08:46:35 -0800 (PST)
X-Received: by 10.55.53.208 with SMTP id c199mr11978211qka.109.1454085994809;
        Fri, 29 Jan 2016 08:46:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o63si17885197qho.8.2016.01.29.08.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 08:46:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPCBu-0007k1-Bl
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 11:46:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPCBo-0007br-GR
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:46:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPCBj-00013O-7j
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:46:28 -0500
Received: from mail-lb0-x244.google.com ([2a00:1450:4010:c04::244]:35608)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aPCBi-00013K-Qd; Fri, 29 Jan 2016 11:46:23 -0500
Received: by mail-lb0-x244.google.com with SMTP id dx9so3568491lbc.2;
	Fri, 29 Jan 2016 08:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=ffE9lhbJR8vcfq20I1bqtKfOCAXZhyUKBsfG6yq2gMY=;
	b=nDVxgD0EyNLrySJI2T1GFoYDIIVaPiqsLjbgndG4s3oEn7+TorRdUhWUueX0g3+H32
	YZU9X78CH7++878qBrVlirBP9HmvAcvciUXZqfULZSp/OcCYC24PFrP1PaDP0ZgFGeF/
	f6E/xG5sT205goqoSl1Tz1MyzF5fcsspfI3Btoonfi2/7vHcSDMPbLt8Luz1O+T7I/3g
	rvlCDinj4nFgbKAq56MEm/xQInprozPJjYjWA5ThkP2v/3Qm7bu9vpeyg91PMVBrYB9k
	pb5jqhcy+RVYG6ZDBwotM0c6CkF3tgfmMXLuwswKWvmWw8Hs1EesayYhDSbe14AcmIVC
	5YIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ffE9lhbJR8vcfq20I1bqtKfOCAXZhyUKBsfG6yq2gMY=;
	b=hnSEU9g6J89jCiACLytmCSZtCZv+amGRWiJGYyZC63Ogx7c27iEajk81XXsRXkHfIh
	f1v2nMwjkdJSF5JYh40qEIZVD4uCiwqiIyVASI8ttIxyHdpbbxzL1KmqUYIZngli3/OW
	Clv8OBztl3kLQjl1XHXR2aIAgdhcRhoet47kYjoYEXmphzKEwsE5EHhmRe06IaTiAocl
	dREryZzEX3ty8AChBrmQR7rRTh/8zdKHKirU+FcRZaL2Ry+OBYKT4SE5pG0wbxKVKR4q
	yekALpH7jfyDPw56/gpmscsjR2rqu0/oE4s66o3P/TNNpuuSHEhM3+RtHzTtAJEXCHtO
	MoYg==
X-Gm-Message-State: AG10YOTmh1+63cHzhnDsnng4Ij3W3ADM6jGyH8JCmgK7yQ7k+mJv1Z8EUbtTgKmJuamx8w==
X-Received: by 10.112.172.233 with SMTP id bf9mr3655506lbc.121.1454085982036; 
	Fri, 29 Jan 2016 08:46:22 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	m21sm2186399lfe.29.2016.01.29.08.46.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jan 2016 08:46:20 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
	<1452796451-2946-4-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56AB975B.50001@gmail.com>
Date: Fri, 29 Jan 2016 19:46:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452796451-2946-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::244
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 3/8] target-arm: Use a single entry point for
 AArch64 and AArch32 exceptions
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
X-TUID: jT3TMDPiFUVl

On 14.01.2016 21:34, Peter Maydell wrote:
> If EL2 or EL3 is present on an AArch64 CPU, then exceptions can be
> taken to an exception level which is running AArch32 (if only EL0
> and EL1 are present then EL1 must be AArch64 and all exceptions are
> taken to AArch64). To support this we need to have a single
> implementation of the CPU do_interrupt() method which can handle both
> 32 and 64 bit exception entry.
>
> Pull the common parts of aarch64_cpu_do_interrupt() and
> arm_cpu_do_interrupt() out into a new function which calls
> either the AArch32 or AArch64 specific entry code once it has
> worked out which one is needed.
>
> We temporarily special-case the handling of EXCP_SEMIHOST to
> avoid an assertion in arm_el_is_aa64(); the next patch will
> pull all the semihosting handling out to the arm_cpu_do_interrupt()
> level (since semihosting semantics depend on the register width
> of the calling code, not on that of any higher EL).

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/cpu-qom.h |  2 --
>  target-arm/cpu64.c   |  3 ---
>  target-arm/helper.c  | 75 ++++++++++++++++++++++++++++++----------------------
>  3 files changed, 44 insertions(+), 36 deletions(-)
>
> diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
> index bda2af8..eae6cd1 100644
> --- a/target-arm/cpu-qom.h
> +++ b/target-arm/cpu-qom.h
> @@ -249,6 +249,4 @@ int aarch64_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  #endif
>  
> -void aarch64_cpu_do_interrupt(CPUState *cs);
> -
>  #endif
> diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
> index 63c8b1c..edb41f7 100644
> --- a/target-arm/cpu64.c
> +++ b/target-arm/cpu64.c
> @@ -290,9 +290,6 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
>  {
>      CPUClass *cc = CPU_CLASS(oc);
>  
> -#if !defined(CONFIG_USER_ONLY)
> -    cc->do_interrupt = aarch64_cpu_do_interrupt;
> -#endif
>      cc->cpu_exec_interrupt = arm_cpu_exec_interrupt;
>      cc->set_pc = aarch64_cpu_set_pc;
>      cc->gdb_read_register = aarch64_cpu_gdb_read_register;
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 519f066..962bb3c 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5707,8 +5707,7 @@ void aarch64_sync_64_to_32(CPUARMState *env)
>      env->regs[15] = env->pc;
>  }
>  
> -/* Handle a CPU exception.  */
> -void arm_cpu_do_interrupt(CPUState *cs)
> +static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> @@ -5718,16 +5717,6 @@ void arm_cpu_do_interrupt(CPUState *cs)
>      uint32_t offset;
>      uint32_t moe;
>  
> -    assert(!IS_M(env));
> -
> -    arm_log_exception(cs->exception_index);
> -
> -    if (arm_is_psci_call(cpu, cs->exception_index)) {
> -        arm_handle_psci_call(cpu);
> -        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
> -        return;
> -    }
> -
>      /* If this is a debug exception we must update the DBGDSCR.MOE bits */
>      switch (env->exception.syndrome >> ARM_EL_EC_SHIFT) {
>      case EC_BREAKPOINT:
> @@ -5899,11 +5888,10 @@ void arm_cpu_do_interrupt(CPUState *cs)
>      }
>      env->regs[14] = env->regs[15] + offset;
>      env->regs[15] = addr;
> -    cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
>  }
>  
> -/* Handle a CPU exception.  */
> -void aarch64_cpu_do_interrupt(CPUState *cs)
> +/* Handle exception entry to a target EL which is using AArch64 */
> +static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> @@ -5921,22 +5909,6 @@ void aarch64_cpu_do_interrupt(CPUState *cs)
>          addr += 0x200;
>      }
>  
> -    arm_log_exception(cs->exception_index);
> -    qemu_log_mask(CPU_LOG_INT, "...from EL%d to EL%d\n", arm_current_el(env),
> -                  new_el);
> -    if (qemu_loglevel_mask(CPU_LOG_INT)
> -        && !excp_is_internal(cs->exception_index)) {
> -        qemu_log_mask(CPU_LOG_INT, "...with ESR %x/0x%" PRIx32 "\n",
> -                      env->exception.syndrome >> ARM_EL_EC_SHIFT,
> -                      env->exception.syndrome);
> -    }
> -
> -    if (arm_is_psci_call(cpu, cs->exception_index)) {
> -        arm_handle_psci_call(cpu);
> -        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
> -        return;
> -    }
> -
>      switch (cs->exception_index) {
>      case EXCP_PREFETCH_ABORT:
>      case EXCP_DATA_ABORT:
> @@ -5996,6 +5968,47 @@ void aarch64_cpu_do_interrupt(CPUState *cs)
>  
>      qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64 " PSTATE 0x%x\n",
>                    new_el, env->pc, pstate_read(env));
> +}
> +
> +/* Handle a CPU exception for A and R profile CPUs.
> + * Do any appropriate logging, handle PSCI calls, and then hand off
> + * to the AArch64-entry or AArch32-entry function depending on the
> + * target exception level's register width.
> + */
> +void arm_cpu_do_interrupt(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    unsigned int new_el = env->exception.target_el;
> +
> +    assert(!IS_M(env));
> +
> +    arm_log_exception(cs->exception_index);
> +    qemu_log_mask(CPU_LOG_INT, "...from EL%d to EL%d\n", arm_current_el(env),
> +                  new_el);
> +    if (qemu_loglevel_mask(CPU_LOG_INT)
> +        && !excp_is_internal(cs->exception_index)) {
> +        qemu_log_mask(CPU_LOG_INT, "...with ESR %x/0x%" PRIx32 "\n",
> +                      env->exception.syndrome >> ARM_EL_EC_SHIFT,
> +                      env->exception.syndrome);
> +    }
> +
> +    if (arm_is_psci_call(cpu, cs->exception_index)) {
> +        arm_handle_psci_call(cpu);
> +        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
> +        return;
> +    }
> +
> +    /* Temporary special case for EXCP_SEMIHOST, which is used only
> +     * for 64-bit semihosting calls -- as this is an internal exception
> +     * it has no specified target level and arm_el_is_aa64() would
> +     * assert because new_el could be 0.
> +     */
> +    if (cs->exception_index == EXCP_SEMIHOST || arm_el_is_aa64(env, new_el)) {
> +        arm_cpu_do_interrupt_aarch64(cs);
> +    } else {
> +        arm_cpu_do_interrupt_aarch32(cs);
> +    }
>  
>      if (!kvm_enabled()) {
>          cs->interrupt_request |= CPU_INTERRUPT_EXITTB;

