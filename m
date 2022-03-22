Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1473548lfb;
        Tue, 22 Mar 2022 04:47:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXpSH1irJjB8NdPuvOmn4tOOO7BfuHPZauLTDykmOybg+0prI9eSNyuwIDYlEjm5JP8hAe
X-Received: by 2002:ac8:590e:0:b0:2e1:dcaf:bbb6 with SMTP id 14-20020ac8590e000000b002e1dcafbbb6mr19259371qty.644.1647949657628;
        Tue, 22 Mar 2022 04:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647949657; cv=none;
        d=google.com; s=arc-20160816;
        b=f+gmrfISeXQgA6L71yJZfI3hNHafuyG8eNpK4dBG4uUeCV+Z2RYXGIzsrVagZx90aU
         W5oVFEMIVCOlhu6eyTTih9Vs+2G0mLqdt0If3Jufal0aKmP1cPCZKN9/2RrLUjUwmyoU
         02xKAzfQEuwM8aKcMvB4GQ7v484JEiLXt7esRAKguGpJ3T6tB2NhsaNLfvjsoD+k9Zof
         7PcZWNJl7BP46DI1nL2h4lHgCtyeF9AWitoxJ99a6BKwQNzNCOc7bvQAo/kZXXLxJW7A
         oG0+59oIA9JvnytXMMm736HEXAu+r+PmOYNyik5PPAOjAi0Ae/M34MI13eWglopDxZ7+
         1wIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=yif9kXlippKbvXIRgdhfE3i4iHPfmYH646m8/agHVE8=;
        b=WQjjEYGKgWnM/j7mIv6BEBcC0RiaQ/l4CPrkBXefAK5vWBjGtD61ls0heaN8tw20EK
         ccjX1Hi336EBXilMigRyFr1WN5cHcKUu8smu9OuXRiw6ffuLnAbfW73vC2piuxD6pgzZ
         xNJgJMLdXeWFrIgMv4L2+wQn7uBPa1OSQVhyaSXypQ/NNQi5H9xzNpQvTTJkg4I/YlSg
         xE62n9CKiRHgbWhZJX+Jf5Ry7nBe3sjPYVuUaLeA6/Gt0KNtv3BfhbZYy/vR9xa0CsD4
         hcWPIi8fE4uapkv6FwJHibtroFktNmO5CmkxHOf67RByiJA26F7ooosRPqdUlo71/dvl
         /n+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16-20020a05621412d000b00440e46a7d1fsi2834330qvv.445.2022.03.22.04.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Mar 2022 04:47:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWczB-00052f-51
	for alex.bennee@linaro.org; Tue, 22 Mar 2022 07:47:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nWcyT-00050l-KS; Tue, 22 Mar 2022 07:46:54 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:52195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nWcyR-00032W-MK; Tue, 22 Mar 2022 07:46:53 -0400
Received: from [192.168.100.1] ([82.142.12.150]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N0WLC-1oK2En1Ju0-00wWnx; Tue, 22 Mar 2022 12:46:49 +0100
Message-ID: <b93a6c01-6153-b9c4-7a7f-db1daed88d9c@vivier.eu>
Date: Tue, 22 Mar 2022 12:46:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] linux-user/arm: Implement __kernel_cmpxchg with host
 atomics
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220314044305.138794-1-richard.henderson@linaro.org>
 <20220314044305.138794-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220314044305.138794-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WWFYNqQTO5eEkhWpiHwdp8X6kOp0PCSwrcHIyaX1tZ6oievcajg
 NzLUhUsl3tyF78p1JIDFFzOEv9RkH0ue7rJDxhHVj3W+P4P0qI+Kh881WHWvWCsOPhoucOo
 WQRC2gkCU/PyjQPSkURL/9KQg5HvTVxgQzDYKpvFg5QHr59mUsFsBa7urBPcVatEOkFZW9c
 9v14DrFFkynBGn9MhEjDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xSRb8LcflOU=:cnrKk7ZGub86Q4O2+NFZMY
 Ouf8ePb7+hEmVNcdes0Fzqax9ly6KUOmuabeN+IyP/Vu6EuJnafhMjUUicWEFJSYyNT22c4Vc
 i04v2Jv2U7UkVvWN/IbE+kYiWaC+n2iVZnzJW3GGo4G+18/dHoHcjKUhKEUTozmanDwq/rJhT
 RM9l1GK6iWKVyDFD33e6fJ6DQJ0FLfqDXUHYf0rkeUbHdZRy7xp7Gnp9sGWGFaz/mDqkVnvIY
 mIfG9eZuZ9WJxm5FzoUHpAGV8pjcqNBR7n7AoSSRrTTzeWhmJutV8gZaavnZM17129XGRPyMe
 dlvjl14OYFRgB+2CnHOh4G5WE/ymzQSS9Hzk7oB5pQnroVlVyeeNeKfSI1ARXQpJMFcOBgyLR
 zXBPAUIIZLzsyXhEjPKnF4KGQGwkTS72c/F6bSkj/D6ch9ZxokH5DRd/vFhbR0TF/NS2Eml1z
 9P2rgkUN+FJqb7lHWAXgHqh1vb4gKJn64yaylV5D+nA0U8zXlPvj+HyVj9l0yrOzOJk7UBkBe
 iRCR1gnssCgPhRVumcKCuAYCKa3GZMaZZo7kETJGnZSGdvUQVJZBI6YaTSpKfyB6DQAXLuHxa
 jK/C4o/aOBffnThUGeK0EmfWpHDfoEbsbhSDpMwgrvKYp0EFwsEsrmFqIwM7VZxKH3dqDUjRO
 HuFzSxX8eED1KSL4gpGD1L9KnwnbbCUxZroZmy+FJ7Ncwuryqpstdgb2EG0qudXpk048=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IU+96FlBHSDg

Le 14/03/2022 à 05:43, Richard Henderson a écrit :
> The existing implementation using start/end_exclusive
> does not provide atomicity across processes.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/arm/cpu_loop.c | 85 +++++++++++++++++++++++++++------------
>   1 file changed, 60 insertions(+), 25 deletions(-)
> 
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index a0e43b261c..0122bb34f7 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -75,7 +75,65 @@
>           put_user_u16(__x, (gaddr));                     \
>       })
>   
> -/* Commpage handling -- there is no commpage for AArch64 */
> +/*
> + * Similar to code in accel/tcg/user-exec.c, but outside the execution loop.
> + * Must be called with mmap_lock.
> + */
> +static void *atomic_mmu_lookup(CPUArchState *env, uint32_t addr, int size)
> +{
> +    int need_flags = PAGE_READ | PAGE_WRITE_ORG | PAGE_VALID;
> +    int page_flags;
> +
> +    /* Enforce guest required alignment.  */
> +    if (unlikely(addr & (size - 1))) {
> +        force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, addr);
> +        return NULL;
> +    }
> +
> +    page_flags = page_get_flags(addr);
> +    if (unlikely((page_flags & need_flags) != need_flags)) {
> +        force_sig_fault(TARGET_SIGSEGV,
> +                        page_flags & PAGE_VALID ?
> +                        TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR, addr);
> +        return NULL;
> +    }
> +
> +    return g2h(env_cpu(env), addr);
> +}
> +
> +/*
> + * See the Linux kernel's Documentation/arm/kernel_user_helpers.rst
> + * Input:
> + * r0 = oldval
> + * r1 = newval
> + * r2 = pointer to target value
> + *
> + * Output:
> + * r0 = 0 if *ptr was changed, non-0 if no exchange happened
> + * C set if *ptr was changed, clear if no exchange happened
> + */
> +static void arm_kernel_cmpxchg32_helper(CPUARMState *env)
> +{
> +    uint32_t oldval, newval, val, addr, cpsr, *host_addr;
> +
> +    oldval = env->regs[0];
> +    newval = env->regs[1];
> +    addr = env->regs[2];
> +
> +    mmap_lock();
> +    host_addr = atomic_mmu_lookup(env, addr, 8);
> +    if (!host_addr) {
> +        mmap_unlock();
> +        return;
> +    }
> +
> +    val = qatomic_cmpxchg__nocheck(host_addr, oldval, newval);
> +    mmap_unlock();
> +
> +    cpsr = (val == oldval) * CPSR_C;
> +    cpsr_write(env, cpsr, CPSR_C, CPSRWriteByInstr);
> +    env->regs[0] = cpsr ? 0 : -1;
> +}
>   
>   /*
>    * See the Linux kernel's Documentation/arm/kernel_user_helpers.txt
> @@ -153,36 +211,13 @@ static int
>   do_kernel_trap(CPUARMState *env)
>   {
>       uint32_t addr;
> -    uint32_t cpsr;
> -    uint32_t val;
>   
>       switch (env->regs[15]) {
>       case 0xffff0fa0: /* __kernel_memory_barrier */
>           smp_mb();
>           break;
>       case 0xffff0fc0: /* __kernel_cmpxchg */
> -         /* XXX: This only works between threads, not between processes.
> -            It's probably possible to implement this with native host
> -            operations. However things like ldrex/strex are much harder so
> -            there's not much point trying.  */
> -        start_exclusive();
> -        cpsr = cpsr_read(env);
> -        addr = env->regs[2];
> -        /* FIXME: This should SEGV if the access fails.  */
> -        if (get_user_u32(val, addr))
> -            val = ~env->regs[0];
> -        if (val == env->regs[0]) {
> -            val = env->regs[1];
> -            /* FIXME: Check for segfaults.  */
> -            put_user_u32(val, addr);
> -            env->regs[0] = 0;
> -            cpsr |= CPSR_C;
> -        } else {
> -            env->regs[0] = -1;
> -            cpsr &= ~CPSR_C;
> -        }
> -        cpsr_write(env, cpsr, CPSR_C, CPSRWriteByInstr);
> -        end_exclusive();
> +        arm_kernel_cmpxchg32_helper(env);
>           break;
>       case 0xffff0fe0: /* __kernel_get_tls */
>           env->regs[0] = cpu_get_tls(env);

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

