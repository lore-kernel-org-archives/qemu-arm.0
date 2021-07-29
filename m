Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5628388lfc;
        Thu, 29 Jul 2021 06:16:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3UYLDVnnreqEMnO3OcY+dRr82TEbZVGbitEFrn7O5XJptnEe3hX0taeAGpypqIpEGOqX4
X-Received: by 2002:a05:600c:1993:: with SMTP id t19mr4740463wmq.62.1627564583280;
        Thu, 29 Jul 2021 06:16:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627564583; cv=none;
        d=google.com; s=arc-20160816;
        b=vIOBM84XrC6iyMpIJRzAEm7u95hmSKWoMheT5K/L5+ef1F/KdQrfUd9aGJqoTkWEVE
         Jy4JjBDn4EHQFbq1TelY7ahTkn+o8MzKhYOdu7euM7I/mgFi1CAXc3V3XP0w8MlPG8R0
         S3/WuEmCRq1glSQDQahlQOFz0W6rbp+PNvSdJXPICoioKH2Zt7wZ5nuJSu/aGZMpXWRj
         c/QzTF4VRMvCJK5s9sHDF+ZuOGDG8VTmjM8FiMfF/+Si3n5SHVP6S6OG7na2oa3Wuomt
         PbOrzpZw5HfwjipF3Hr2AZ62PZHH+kmkhSdDQwe4hwojJgYeuR/Tn141cuEBTCI/kfY4
         5frQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XpKUw6IfPdfZIgTTjLrfM7j7Ifebz6JERVNdk1Vkgek=;
        b=yAF9x2fr7N5agdXvZjeaSG168w5kF9o+NIN6Omuol1Gb4TTL4/+nFjp/MXOyv+ivwL
         EgJrQDerqWK0ARAcb9GtQR3BPXVUzfT/2CNEZkzlzhyZgZwh7zwxn5rQLq35tE5FVReP
         3QS/fhUwR32Y3hb4pWb42DRcnSeJ22Wbm6gy60xL31MW16SuIdQMEMp/zz8Efx4nudb9
         NEfdTZEkQGg157yGpM+yooqgrpvCfhoynkVXE9z3JB00iKY2WCaYiEH91lU8xYJBDsNk
         7h9ji0x+EYyg56wV1l4NfdivKRGNP/ak4v5YLlmJ0HkKRZN+2sGOQsE1KcJQNcPR6QFG
         o0vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sbyA03Fa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r19si2712605wmp.77.2021.07.29.06.16.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 06:16:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sbyA03Fa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m95te-0001Sj-8Y
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 09:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m95sN-0000C7-25
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:15:03 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:44962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m95sK-0001r1-UP
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:15:02 -0400
Received: by mail-ed1-x531.google.com with SMTP id j2so8115547edp.11
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 06:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XpKUw6IfPdfZIgTTjLrfM7j7Ifebz6JERVNdk1Vkgek=;
 b=sbyA03FapMvr1Nju2hXXajSDjU7hJaOjNMlDydHgrry2FVwBHx2G5HwbInYbasXZp9
 k7yhIxhSck1JSwDdRKVIjVokS0wbZAzlzHHELPa8f4NYCG50ZQy4WkuYuPILXHjffn+Z
 St08309mJPh8Hz8tVgPbu9JZdZOEc64dWxtWwausxHw7NTe5KAQOo9vmwe4TPQlsSxmR
 HR+1Mv/Edyl0WY3tjhKmkOQXno1DGXO0S6/65qpOMGsZHOwCAITHnhjcMhk/zQOXiQBd
 f1Ct1Y2Y+Y+J5xZU7XvXl1+9GLBt1Kyt/ZdAkv7cScJEmtdV7t/ERZfHDvMqNyyisPAK
 mz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XpKUw6IfPdfZIgTTjLrfM7j7Ifebz6JERVNdk1Vkgek=;
 b=gv4JHMqQDP/D5LeOY1ZRlNxGtTiv7ILJuqlNEMNR9r6zsjxxCHO7d5iSDHgyfrsHBD
 hIlbIx+KN/XMAMBfKF24b0AwmmE/D31oM8HZtSRgZCAWXHt46sE/DQiZuLl/lC2UKNu3
 7cq67kiH/6IisI8l+rTo8l99ixVb2AGIUdqhYGaw2sFoLoPB6qE0nbukhX/Se7R/pCd2
 dLd+PHJgwH9oNJhbfCIxJGfZL90c911eo/oNTv8XaUhj8bxXWcV76rpH6smwzweYQ9V7
 bOIXDr5+BkbFjRJwpFs3gFmd8nVizrG64KnUqtMj5naZUUN7J4MEoOHqPqayLsvvWbMV
 4nWg==
X-Gm-Message-State: AOAM530S0VDyKWWR5PY5UvsGYl9TJfSLPsC2Cds6jkKTXBTJW9mxBDKG
 NaoxX0xAZHscP59tG/ABqZ8izpiggUHKx7gKJwCM0g==
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr5919764edy.44.1627564499222; 
 Thu, 29 Jul 2021 06:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-4-richard.henderson@linaro.org>
In-Reply-To: <20210729004647.282017-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 14:14:16 +0100
Message-ID: <CAFEAcA9ZZK2FhCptvypviDOoC-SQkP1rfANrPWZJH1F99GV87Q@mail.gmail.com>
Subject: Re: [PATCH for-6.2 03/43] target/arm: Implement do_unaligned_access
 for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GcbwElfXbKZb

On Thu, 29 Jul 2021 at 01:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/cpu_loop.c |  4 ++++
>  linux-user/arm/cpu_loop.c     | 43 +++++++++++++++++++++++++++--------
>  target/arm/cpu.c              |  2 +-
>  target/arm/cpu_tcg.c          |  2 +-
>  4 files changed, 40 insertions(+), 11 deletions(-)
>
> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
> index ee72a1c20f..998831f87f 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -137,6 +137,10 @@ void cpu_loop(CPUARMState *env)
>              case 0x11: /* Synchronous Tag Check Fault */
>                  info.si_code = TARGET_SEGV_MTESERR;
>                  break;
> +            case 0x21: /* Alignment fault */
> +                info.si_signo = TARGET_SIGBUS;
> +                info.si_code = TARGET_BUS_ADRALN;
> +                break;
>              default:
>                  g_assert_not_reached();
>              }
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index 69632d15be..da7da6a0c1 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -23,6 +23,7 @@
>  #include "elf.h"
>  #include "cpu_loop-common.h"
>  #include "semihosting/common-semi.h"
> +#include "target/arm/syndrome.h"

Not a huge fan of linux-user files pulling in target/arm headers, but
I guess we do it already in aarch64/cpu_loop.c. (Though that is afaict
the only other place ATM...)

>
>  #define get_user_code_u32(x, gaddr, env)                \
>      ({ abi_long __r = get_user_u32((x), (gaddr));       \
> @@ -286,9 +287,8 @@ void cpu_loop(CPUARMState *env)
>  {
>      CPUState *cs = env_cpu(env);
>      int trapnr;
> -    unsigned int n, insn;
> +    unsigned int n, insn, ec, fsc;
>      target_siginfo_t info;
> -    uint32_t addr;
>      abi_ulong ret;
>
>      for(;;) {
> @@ -437,15 +437,40 @@ void cpu_loop(CPUARMState *env)
>              break;
>          case EXCP_PREFETCH_ABORT:
>          case EXCP_DATA_ABORT:
> -            addr = env->exception.vaddress;
> -            {
> -                info.si_signo = TARGET_SIGSEGV;
> -                info.si_errno = 0;
> -                /* XXX: check env->error_code */
> +            info.si_signo = TARGET_SIGSEGV;
> +            info.si_errno = 0;
> +            info._sifields._sigfault._addr = env->exception.vaddress;
> +            /*
> +             * We should only arrive here with EC in {DATAABORT, INSNABORT},
> +             * and short-form FSC, which then tells us to look at the FSR.
> +             * ??? arm_cpu_reset never sets TTBCR_EAE, so we always get
> +             * short-form FSC.
> +             */
> +            ec = syn_get_ec(env->exception.syndrome);
> +            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
> +            fsc = extract32(env->exception.syndrome, 0, 6);
> +            assert(fsc == 0x3f);
> +            switch (env->exception.fsr & 0x1f) {
> +            case 0x1: /* Alignment */
> +                info.si_signo = TARGET_SIGBUS;
> +                info.si_code = TARGET_BUS_ADRALN;
> +                break;
> +            case 0x3: /* Access flag fault, level 1 */
> +            case 0x6: /* Access flag fault, level 2 */
> +            case 0x9: /* Domain fault, level 1 */
> +            case 0xb: /* Domain fault, level 2 */
> +            case 0xd: /* Permision fault, level 1 */
> +            case 0xf: /* Permision fault, level 2 */
> +                info.si_code = TARGET_SEGV_ACCERR;
> +                break;
> +            case 0x5: /* Translation fault, level 1 */
> +            case 0x7: /* Translation fault, level 2 */
>                  info.si_code = TARGET_SEGV_MAPERR;
> -                info._sifields._sigfault._addr = addr;
> -                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> +                break;
> +            default:
> +                g_assert_not_reached();
>              }
> +            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>              break;

It's slightly sad that we start off with a nicely symbolic
ArmMMUFaultInfo type enum value, carefully encode it into a
numeric value and then have to switch on the numeric value here,
but I can see why we end up this way...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
