Received: by 10.28.91.67 with SMTP id p64csp1979049wmb;
        Sun, 18 Mar 2018 15:44:17 -0700 (PDT)
X-Google-Smtp-Source: AG47ELv0M+MtjLMaVsFrGKQLxn0rc3kPGzCc5+yJN+S4ytBKP7s4cZjzL3ZN7AVuzEaLx+xymUxV
X-Received: by 10.55.119.1 with SMTP id s1mr14789759qkc.3.1521413057810;
        Sun, 18 Mar 2018 15:44:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521413057; cv=none;
        d=google.com; s=arc-20160816;
        b=iIbJ8kXaVA2lXdWFXvzWluekOGGg6DFBiXMwYpkeU0OAJmXRFAQfXPU7KZuw+ZDMB5
         0MzPggxsoiweqyPCUFvZmhQpRDPrrxlUDTUubbMBVp8MiJKqX4gYm/dQixSoV7tH+ETH
         wIIRgFmyuO6Z8XSaSY1LVS9KbjGldeUR4uMqxBwxtyT3G7jq6T/o5kuo4lsnrgTT1pS/
         UUMH4sGpyTzX2p/PpzJ8vRc55H1fPsWl39evdfRRcK3Ru6EK9eFFz2rN3SxZF7xkGqZC
         dvwBnj8Eb60yZb35Sd0XOPduvhtncTH64qTURSmqDiETf3Cc9biB1KQRpjx6Y2GQLOA6
         QUuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=MeOZODkmWOLluYyWRzgUqrknhX7iH4Ga4WYVRp1n0SM=;
        b=PyKxsJIrNeJvCu1kIFx6j/kxGreMLr1i91kDjhm/UX8RdC9f4xapj2QjiYd7BQxrYj
         2UiahIzb5v5QMSnVXBgwhWRXftABtEzcuRnHQckOLHLnFkHEKdvZxpiKhV7TeH4f7g/L
         qwX/MZSrxS4F+zLb6ndT0k+psA9sACXikP0J3bPXtsPqXFuC8JDxHlQNiKau3o/34PEt
         0VhxtmwlgFMNgv/a/aIVfNJJydem6jnjRKyiUh8fZJKccTDH7mldlDxdCUE6QvGjfmaD
         xEpf+O15q/MmoxKNlpe65TspyaCkfNH8GJIwcUbxyktPxgMsXvrmFJGaB55MSi98GAbv
         A6OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HPN1zT8c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e54si2521720qtf.248.2018.03.18.15.44.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 18 Mar 2018 15:44:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HPN1zT8c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exh2H-0006Fw-BR
	for alex.bennee@linaro.org; Sun, 18 Mar 2018 18:44:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exh1r-0006Dg-MF
	for qemu-devel@nongnu.org; Sun, 18 Mar 2018 18:43:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exh1o-0007Zy-In
	for qemu-devel@nongnu.org; Sun, 18 Mar 2018 18:43:51 -0400
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:42230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exh1o-0007Yk-8Z; Sun, 18 Mar 2018 18:43:48 -0400
Received: by mail-wr0-x241.google.com with SMTP id s18so16690948wrg.9;
	Sun, 18 Mar 2018 15:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MeOZODkmWOLluYyWRzgUqrknhX7iH4Ga4WYVRp1n0SM=;
	b=HPN1zT8cUCR6JHhGRaMPZhQZw9qrw2a7bEGJGlCR5JvgvaQVjcyNR0zDvL5Pb3PdGw
	BkZ0cP7Qs4duQWvFUKtgJw+o35vXwItyYZDnRoKXEf9tzue4qhd6pcd6NhTemJRsr7vT
	EDU2DL/qPqqw7GzRBmY5klRIQBTdQXbUIwBLyATOX9pAMZ5GSWvuDgBkch2str1FlwFl
	vppgn5S+q35xtuR6nkREQvZmVYEmHBvzO7rULSkDCUjwRo75OoEYRC4JofNf7GrW8y57
	SEVOK6+b1hlKOK81wkOZYMhewMRVGqjRM42xPva0ep2zLIAPAODAu+EkBDijMUKw5ie9
	riHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=MeOZODkmWOLluYyWRzgUqrknhX7iH4Ga4WYVRp1n0SM=;
	b=hOHpLr83w6bsGMPf2kDZd8Ej8Ayyd+wZu3Th2ZKpF/MgPE66EnINXDJ+kZ/k6VZX8o
	swY73JzTnoU/4KaIU4+PbGNiQEWMe+hrDrkCx4zPpfgWEh7dOEvtrPPnREqn9qLpQIhb
	ny8ehociqAPhIjDbABm9xQi1uTVIbE8KGORSUS4NDf6IRIMX/uRczoW+eN5UiyPs+vt/
	i8vIW6WR7ZIbmCoG6LBfgFdIyXRowklnq3eijQYekQzPFyY13lEbaam/2cqwJmFdWp+f
	GQzT+UZZZ8WARcCKIY1AxjPsb6STITZDUR0GjzjTBbRsfEnK2jmgw7mp7fEVvDDdHY6Z
	1S/g==
X-Gm-Message-State: AElRT7Ea6SHcne/Nzr4a3yCwQaz53Yu0Cb5piX6DQDV2HqCbm1hlkGR+
	GjXvZ7nAUpgN32BoMyNnwF4=
X-Received: by 10.223.136.24 with SMTP id d24mr8075028wrd.127.1521413027140;
	Sun, 18 Mar 2018 15:43:47 -0700 (PDT)
Received: from [192.168.1.37] (67.23.27.109.rev.sfr.net. [109.27.23.67])
	by smtp.gmail.com with ESMTPSA id z3sm10160021wme.3.2018.03.18.15.43.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 15:43:46 -0700 (PDT)
To: Aaron Lindsay <alindsay@codeaurora.org>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-21-git-send-email-alindsay@codeaurora.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <7959abaf-d22f-b14f-832d-b87f062852ad@amsat.org>
Date: Sun, 18 Mar 2018 23:43:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521232280-13089-21-git-send-email-alindsay@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v3 20/22] target/arm: PMU: Add
 instruction and cycle events
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Oh96Sxl2pC8

On 03/16/2018 09:31 PM, Aaron Lindsay wrote:
> The instruction event is only enabled when icount is used, cycles are
> always supported. Always defining get_cycle_count (but altering its
> behavior depending on CONFIG_USER_ONLY) allows us to remove some
> CONFIG_USER_ONLY #defines throughout the rest of the code.
> 
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 99 ++++++++++++++++++++++++++++-------------------------
>  1 file changed, 52 insertions(+), 47 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2fa8308..679897a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -15,6 +15,7 @@
>  #include "arm_ldst.h"
>  #include <zlib.h> /* For crc32 */
>  #include "exec/semihost.h"
> +#include "sysemu/cpus.h"
>  #include "sysemu/kvm.h"
>  #include "fpu/softfloat.h"
>  
> @@ -935,8 +936,54 @@ typedef struct pm_event {
>      uint64_t (*get_count)(CPUARMState *, uint64_t cycles);
>  } pm_event;
>  
> +/*
> + * Return the underlying cycle count for the PMU cycle counters. If we're in
> + * usermode, simply return 0.
> + */
> +static uint64_t get_cycle_count(CPUARMState *env)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> +                   ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> +#else
> +    return 0;
> +#endif
> +}
> +
> +static bool event_always_supported(CPUARMState *env)
> +{
> +    return true;
> +}
> +
> +#ifndef CONFIG_USER_ONLY
> +static uint64_t cycles_get_count(CPUARMState *env, uint64_t cycles)
> +{
> +    return cycles;
> +}
> +
> +static bool instructions_supported(CPUARMState *env)
> +{
> +    return use_icount == 1 /* Precise instruction counting */;
> +}
> +
> +static uint64_t instructions_get_count(CPUARMState *env, uint64_t cycles)
> +{
> +    return (uint64_t)cpu_get_icount_raw();
> +}
> +#endif
> +
>  #define SUPPORTED_EVENT_SENTINEL UINT16_MAX
>  static const pm_event pm_events[] = {
> +#ifndef CONFIG_USER_ONLY
> +    { .number = 0x008, /* INST_RETIRED */
> +      .supported = instructions_supported,
> +      .get_count = instructions_get_count
> +    },
> +    { .number = 0x011, /* CPU_CYCLES */
> +      .supported = event_always_supported,
> +      .get_count = cycles_get_count
> +    },
> +#endif
>      { .number = SUPPORTED_EVENT_SENTINEL }
>  };
>  static uint16_t supported_event_map[0x3f];
> @@ -1016,8 +1063,6 @@ static CPAccessResult pmreg_access_swinc(CPUARMState *env,
>      return pmreg_access(env, ri, isread);
>  }
>  
> -#ifndef CONFIG_USER_ONLY
> -
>  static CPAccessResult pmreg_access_selr(CPUARMState *env,
>                                          const ARMCPRegInfo *ri,
>                                          bool isread)
> @@ -1126,11 +1171,7 @@ static inline bool pmu_counter_filtered(CPUARMState *env, uint64_t pmxevtyper)
>   */
>  uint64_t pmccntr_op_start(CPUARMState *env)
>  {
> -    uint64_t cycles = 0;
> -#ifndef CONFIG_USER_ONLY
> -    cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> -                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> -#endif
> +    uint64_t cycles = get_cycle_count(env);
>  
>      if (arm_ccnt_enabled(env) &&
>            !pmu_counter_filtered(env, env->cp15.pmccfiltr_el0)) {
> @@ -1268,26 +1309,6 @@ static void pmccntr_write32(CPUARMState *env, const ARMCPRegInfo *ri,
>      pmccntr_write(env, ri, deposit64(cur_val, 0, 32, value));
>  }
>  
> -#else /* CONFIG_USER_ONLY */
> -
> -uint64_t pmccntr_op_start(CPUARMState *env)
> -{
> -}
> -
> -void pmccntr_op_finish(CPUARMState *env, uint64_t prev_cycles)
> -{
> -}
> -
> -uint64_t pmu_op_start(CPUARMState *env)
> -{
> -}
> -
> -void pmu_op_finish(CPUARMState *env, uint64_t prev_cycles)
> -{
> -}
> -
> -#endif
> -
>  static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                              uint64_t value)
>  {
> @@ -1346,11 +1367,7 @@ static void pmevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      if (counter == 0x1f) {
>          pmccfiltr_write(env, ri, value);
>      } else if (counter < PMU_NUM_COUNTERS(env)) {
> -        uint64_t cycles = 0;
> -#ifndef CONFIG_USER_ONLY
> -        cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> -                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> -#endif
> +        uint64_t cycles = get_cycle_count(env);
>          pmu_sync_counter(env, counter, cycles);
>          env->cp15.c14_pmevtyper[counter] = value & 0xfe0003ff;
>          pmu_sync_counter(env, counter, cycles);
> @@ -1404,11 +1421,7 @@ static void pmevcntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                               uint64_t value, uint8_t counter)
>  {
>      if (counter < PMU_NUM_COUNTERS(env)) {
> -        uint64_t cycles = 0;
> -#ifndef CONFIG_USER_ONLY
> -        cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> -                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> -#endif
> +        uint64_t cycles = get_cycle_count(env);
>          env->cp15.c14_pmevcntr[counter] = value;
>          pmu_sync_counter(env, counter, cycles);
>      }
> @@ -1420,12 +1433,8 @@ static uint64_t pmevcntr_read(CPUARMState *env, const ARMCPRegInfo *ri,
>                                uint8_t counter)
>  {
>      if (counter < PMU_NUM_COUNTERS(env)) {
> -        uint64_t ret;
> -        uint64_t cycles = 0;
> -#ifndef CONFIG_USER_ONLY
> -        cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> -                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> -#endif
> +        uint64_t ret, cycles;
> +        cycles = get_cycle_count(env);
>          pmu_sync_counter(env, counter, cycles);
>          ret = env->cp15.c14_pmevcntr[counter];
>          pmu_sync_counter(env, counter, cycles);
> @@ -1613,7 +1622,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>      /* Unimplemented so WI. */
>      { .name = "PMSWINC", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 4,
>        .access = PL0_W, .accessfn = pmreg_access_swinc, .type = ARM_CP_NOP },
> -#ifndef CONFIG_USER_ONLY
>      { .name = "PMSELR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 5,
>        .access = PL0_RW, .type = ARM_CP_ALIAS,
>        .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmselr),
> @@ -1633,7 +1641,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .access = PL0_RW, .accessfn = pmreg_access_ccntr,
>        .type = ARM_CP_IO,
>        .readfn = pmccntr_read, .writefn = pmccntr_write, },
> -#endif
>      { .name = "PMCCFILTR", .cp = 15, .opc1 = 0, .crn = 14, .crm = 15, .opc2 = 7,
>        .writefn = pmccfiltr_write_a32, .readfn = pmccfiltr_read_a32,
>        .access = PL0_RW, .accessfn = pmreg_access,
> @@ -5171,7 +5178,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>           * field as main ID register, and we implement only the cycle
>           * count register.
>           */
> -#ifndef CONFIG_USER_ONLY
>          ARMCPRegInfo pmcr = {
>              .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
>              .access = PL0_RW,
> @@ -5225,7 +5231,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              g_free(pmevtyper_name);
>              g_free(pmevtyper_el0_name);
>          }
> -#endif
>          ARMCPRegInfo clidr = {
>              .name = "CLIDR", .state = ARM_CP_STATE_BOTH,
>              .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 1,
> 
