Received: by 10.25.85.209 with SMTP id j200csp1484077lfb;
        Mon, 13 Jun 2016 18:50:57 -0700 (PDT)
X-Received: by 10.140.233.4 with SMTP id e4mr17521148qhc.90.1465869057392;
        Mon, 13 Jun 2016 18:50:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g9si14645218qtb.32.2016.06.13.18.50.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 18:50:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCdVI-0008JP-QG
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 21:50:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCdVC-0008GF-9e
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 21:50:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCdVA-0001NQ-3A
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 21:50:49 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:37116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bCdV3-0001MU-F2; Mon, 13 Jun 2016 21:50:42 -0400
Received: from 172.24.1.47 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CDF80745; Tue, 14 Jun 2016 09:50:22 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 14 Jun 2016 09:49:42 +0800
Message-ID: <575F62B2.6030502@huawei.com>
Date: Tue, 14 Jun 2016 09:49:38 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-5-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1464274540-19693-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.575F62E0.0027, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c1c705d3908a0f9acf711bdfd1adbdd6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 04/22] target-arm: Provide
 hook to tell GICv3 about changes of security state
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X65Cjmn1d99h



On 2016/5/26 22:55, Peter Maydell wrote:
> The GICv3 CPU interface needs to know when the CPU it is attached
> to makes an exception level or mode transition that changes the
> security state, because whether it is asserting IRQ or FIQ can change
> depending on these things. Provide a mechanism for letting the GICv3
> device register a hook to be called on such changes.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> ---
>  target-arm/cpu.c       |  9 +++++++++
>  target-arm/cpu.h       | 34 ++++++++++++++++++++++++++++++++++
>  target-arm/helper.c    |  2 ++
>  target-arm/internals.h |  8 ++++++++
>  target-arm/op_helper.c |  4 ++++
>  5 files changed, 57 insertions(+)
> 
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index 3fd0743..0eaa907 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -51,6 +51,15 @@ static bool arm_cpu_has_work(CPUState *cs)
>           | CPU_INTERRUPT_EXITTB);
>  }
>  
> +void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHook *hook,
> +                                 void *opaque)
> +{
> +    /* We currently only support registering a single hook function */
> +    assert(!cpu->el_change_hook);
> +    cpu->el_change_hook = hook;
> +    cpu->el_change_hook_opaque = opaque;
> +}
> +
>  static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
>  {
>      /* Reset a single ARMCPRegInfo register */
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 2fa1f41..9b045af 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -504,6 +504,13 @@ typedef struct CPUARMState {
>  } CPUARMState;
>  
>  /**
> + * ARMELChangeHook:
> + * type of a function which can be registered via arm_register_el_change_hook()
> + * to get callbacks when the CPU changes its exception level or mode.
> + */
> +typedef void ARMELChangeHook(ARMCPU *cpu, void *opaque);
> +
> +/**
>   * ARMCPU:
>   * @env: #CPUARMState
>   *
> @@ -641,6 +648,9 @@ struct ARMCPU {
>      /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
>      uint32_t dcz_blocksize;
>      uint64_t rvbar;
> +
> +    ARMELChangeHook *el_change_hook;
> +    void *el_change_hook_opaque;
>  };
>  
>  static inline ARMCPU *arm_env_get_cpu(CPUARMState *env)
> @@ -2373,4 +2383,28 @@ static inline AddressSpace *arm_addressspace(CPUState *cs, MemTxAttrs attrs)
>  }
>  #endif
>  
> +/**
> + * arm_register_el_change_hook:
> + * Register a hook function which will be called back whenever this
> + * CPU changes exception level or mode. The hook function will be
> + * passed a pointer to the ARMCPU and the opaque data pointer passed
> + * to this function when the hook was registered.
> + *
> + * Note that we currently only support registering a single hook function,
> + * and will assert if this function is called twice.
> + * This facility is intended for the use of the GICv3 emulation.
> + */
> +void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHook *hook,
> +                                 void *opaque);
> +
> +/**
> + * arm_get_el_change_hook_opaque:
> + * Return the opaque data that will be used by the el_change_hook
> + * for this CPU.
> + */
> +static inline void *arm_get_el_change_hook_opaque(ARMCPU *cpu)
> +{
> +    return cpu->el_change_hook_opaque;
> +}
> +
>  #endif
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index e3ea26f..d907598 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -6496,6 +6496,8 @@ void arm_cpu_do_interrupt(CPUState *cs)
>          arm_cpu_do_interrupt_aarch32(cs);
>      }
>  
> +    arm_call_el_change_hook(cpu);
> +
>      if (!kvm_enabled()) {
>          cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
>      }
> diff --git a/target-arm/internals.h b/target-arm/internals.h
> index a125873..5d8ec43 100644
> --- a/target-arm/internals.h
> +++ b/target-arm/internals.h
> @@ -479,4 +479,12 @@ bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
>  void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
>                                   int is_user, uintptr_t retaddr);
>  
> +/* Call the EL change hook if one has been registered */
> +static inline void arm_call_el_change_hook(ARMCPU *cpu)
> +{
> +    if (cpu->el_change_hook) {
> +        cpu->el_change_hook(cpu, cpu->el_change_hook_opaque);
> +    }
> +}
> +
>  #endif
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 0b29b9d..8021738 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -437,6 +437,8 @@ void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
>  void HELPER(cpsr_write_eret)(CPUARMState *env, uint32_t val)
>  {
>      cpsr_write(env, val, CPSR_ERET_MASK, CPSRWriteExceptionReturn);
> +
> +    arm_call_el_change_hook(arm_env_get_cpu(env));
>  }
>  
>  /* Access to user mode registers from privileged modes.  */
> @@ -932,6 +934,8 @@ void HELPER(exception_return)(CPUARMState *env)
>          env->pc = env->elr_el[cur_el];
>      }
>  
> +    arm_call_el_change_hook(arm_env_get_cpu(env));
> +
>      return;
>  
>  illegal_return:
> 

-- 
Shannon

