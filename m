Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v67sm7633762wrc.45.2017.01.27.04.28.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Jan 2017 04:28:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 317103E0342;
	Fri, 27 Jan 2017 12:28:16 +0000 (GMT)
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org> <1485285380-10565-4-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.1.91.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH 03/10] armv7m: add state for v7M CCR, CFSR, HFSR, DFSR, MMFAR, BFAR
In-reply-to: <1485285380-10565-4-git-send-email-peter.maydell@linaro.org>
Date: Fri, 27 Jan 2017 12:28:16 +0000
Message-ID: <87bmusadr3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: DBlEBn3Pkd+1


Peter Maydell <peter.maydell@linaro.org> writes:

> Add the structure fields, VMState fields, reset code and macros for
> the v7M system control registers CCR, CFSR, HFSR, DFSR, MMFAR and
> BFAR.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h     | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/cpu.c     |  7 +++++++
>  target/arm/machine.c | 10 ++++++++--
>  3 files changed, 69 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index b2cc329..4b062d2 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -21,6 +21,7 @@
>  #define ARM_CPU_H
>
>  #include "kvm-consts.h"
> +#include "hw/registerfields.h"
>
>  #if defined(TARGET_AARCH64)
>    /* AArch64 definitions */
> @@ -405,6 +406,12 @@ typedef struct CPUARMState {
>          uint32_t vecbase;
>          uint32_t basepri;
>          uint32_t control;
> +        uint32_t ccr; /* Configuration and Control */
> +        uint32_t cfsr; /* Configurable Fault Status */
> +        uint32_t hfsr; /* HardFault Status */
> +        uint32_t dfsr; /* Debug Fault Status Register */
> +        uint32_t mmfar; /* MemManage Fault Address */
> +        uint32_t bfar; /* BusFault Address */

Given the CPUARMState needs to be accessed via env do we need to start
getting concerned about its size?

>          int exception;
>      } v7m;
>
> @@ -1086,6 +1093,53 @@ enum arm_cpu_mode {
>  #define ARM_IWMMXT_wCGR2	10
>  #define ARM_IWMMXT_wCGR3	11
>
> +/* V7M CCR bits */
> +FIELD(V7M_CCR, NONBASETHRDENA, 0, 1)
> +FIELD(V7M_CCR, USERSETMPEND, 1, 1)
> +FIELD(V7M_CCR, UNALIGN_TRP, 3, 1)
> +FIELD(V7M_CCR, DIV_0_TRP, 4, 1)
> +FIELD(V7M_CCR, BFHFNMIGN, 8, 1)
> +FIELD(V7M_CCR, STKALIGN, 9, 1)
> +FIELD(V7M_CCR, DC, 16, 1)
> +FIELD(V7M_CCR, IC, 17, 1)
> +
> +/* V7M CFSR bits for MMFSR */
> +FIELD(V7M_CFSR, IACCVIOL, 0, 1)
> +FIELD(V7M_CFSR, DACCVIOL, 1, 1)
> +FIELD(V7M_CFSR, MUNSTKERR, 3, 1)
> +FIELD(V7M_CFSR, MSTKERR, 4, 1)
> +FIELD(V7M_CFSR, MLSPERR, 5, 1)
> +FIELD(V7M_CFSR, MMARVALID, 7, 1)
> +
> +/* V7M CFSR bits for BFSR */
> +FIELD(V7M_CFSR, IBUSERR, 8 + 0, 1)
> +FIELD(V7M_CFSR, PRECISERR, 8 + 1, 1)
> +FIELD(V7M_CFSR, IMPRECISERR, 8 + 2, 1)
> +FIELD(V7M_CFSR, UNSTKERR, 8 + 3, 1)
> +FIELD(V7M_CFSR, STKERR, 8 + 4, 1)
> +FIELD(V7M_CFSR, LSPERR, 8 + 5, 1)
> +FIELD(V7M_CFSR, BFARVALID, 8 + 7, 1)
> +
> +/* V7M CFSR bits for UFSR */
> +FIELD(V7M_CFSR, UNDEFINSTR, 16 + 0, 1)
> +FIELD(V7M_CFSR, INVSTATE, 16 + 1, 1)
> +FIELD(V7M_CFSR, INVPC, 16 + 2, 1)
> +FIELD(V7M_CFSR, NOCP, 16 + 3, 1)
> +FIELD(V7M_CFSR, UNALIGNED, 16 + 8, 1)
> +FIELD(V7M_CFSR, DIVBYZERO, 16 + 9, 1)
> +
> +/* V7M HFSR bits */
> +FIELD(V7M_HFSR, VECTTBL, 1, 1)
> +FIELD(V7M_HFSR, FORCED, 30, 1)
> +FIELD(V7M_HFSR, DEBUGEVT, 31, 1)
> +
> +/* V7M DFSR bits */
> +FIELD(V7M_DFSR, HALTED, 0, 1)
> +FIELD(V7M_DFSR, BKPT, 1, 1)
> +FIELD(V7M_DFSR, DWTTRAP, 2, 1)
> +FIELD(V7M_DFSR, VCATCH, 3, 1)
> +FIELD(V7M_DFSR, EXTERNAL, 4, 1)
> +
>  /* If adding a feature bit which corresponds to a Linux ELF
>   * HWCAP bit, remember to update the feature-bit-to-hwcap
>   * mapping in linux-user/elfload.c:get_elf_hwcap().
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 6395d5a..c804f59 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -188,6 +188,13 @@ static void arm_cpu_reset(CPUState *s)
>          uint8_t *rom;
>
>          env->daif &= ~PSTATE_I;
> +
> +        /* The reset value of this bit is IMPDEF, but ARM recommends
> +         * that it resets to 1, so QEMU always does that rather than making
> +         * it dependent on CPU model.
> +         */
> +        env->v7m.ccr = R_V7M_CCR_STKALIGN_MASK;
> +
>          rom = rom_ptr(0);
>          if (rom) {
>              /* Address zero is covered by ROM which hasn't yet been
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 8ed24bf..49e09a8 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -96,13 +96,19 @@ static bool m_needed(void *opaque)
>
>  static const VMStateDescription vmstate_m = {
>      .name = "cpu/m",
> -    .version_id = 2,
> -    .minimum_version_id = 2,
> +    .version_id = 3,
> +    .minimum_version_id = 3,
>      .needed = m_needed,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(env.v7m.vecbase, ARMCPU),
>          VMSTATE_UINT32(env.v7m.basepri, ARMCPU),
>          VMSTATE_UINT32(env.v7m.control, ARMCPU),
> +        VMSTATE_UINT32(env.v7m.ccr, ARMCPU),
> +        VMSTATE_UINT32(env.v7m.cfsr, ARMCPU),
> +        VMSTATE_UINT32(env.v7m.hfsr, ARMCPU),
> +        VMSTATE_UINT32(env.v7m.dfsr, ARMCPU),
> +        VMSTATE_UINT32(env.v7m.mmfar, ARMCPU),
> +        VMSTATE_UINT32(env.v7m.bfar, ARMCPU),
>          VMSTATE_INT32(env.v7m.exception, ARMCPU),
>          VMSTATE_END_OF_LIST()
>      }

Otherwise:

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

--
Alex Bennée
