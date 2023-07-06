Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4327545ejy;
        Thu, 6 Jul 2023 07:29:27 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHgt0vtmej3EuEf74kTsQeX6DwTk3arf6WBo6B72VR90ZPWOdOQIjiko5OWEXAbZq/97EJ9
X-Received: by 2002:a0c:8e8a:0:b0:635:dda5:bb8e with SMTP id x10-20020a0c8e8a000000b00635dda5bb8emr1863037qvb.22.1688653767318;
        Thu, 06 Jul 2023 07:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688653767; cv=none;
        d=google.com; s=arc-20160816;
        b=GZqGKmG0Rh+yQ+qwoMEx10xMFFrkZnmlmXdcc4gRoQLNYQYClQGX0KcwIl0FuBvPCN
         bNTrK8ref/0kAt79H4kbupEgAogqyXBLTiQtHmAckRIQMEDf2mKeFY3FOrO9huIiD5dy
         yhLgbrTck0Z/a8nZRTI8EGfQb+bnhpfIR1/qJn0RWuGVw9zGrTf96DA9Z/OcC9R6/wXz
         r+oDz9ZDpGWFCy4NVgFuoqJzaRzBJFeBUJONyl6RmcnHFLnywET2bSLluNSuK1U99EpE
         utwxvmys/pmC9DjU0TdjhgfYXzm7JeOIeSydzbmMZU+otpecV8atTgmsAtbJN9nlw3Z/
         7vMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qLS1hwBQH5ErHG6O5e6dliXGtwv264wz9BRHClS/Nuo=;
        fh=CEa3UdY0L+UQ/2T/5R8rkDkdq4jlW1F1hWJjDNQD42w=;
        b=goA2z15bCAhSSaaJhHuk1HGq/m1qzhTf4Q+q6Oqm4MjQoReLhK9Kp/cvAAUam6aP6E
         Tfh3tEhkDbGb3Xqea0TxwU0YdK+8YqFwsGzVcApLYHtox0X8kWi8R+PqTGePQaglAi8W
         coF/2Xw50Vn+HD5Fa7hlURY+Xgr1RdnUE1ddACqm+5B/mysccsfY3v8tMguGXHqrm2PR
         M9m7NJcmgJQ+KBLtXkMR2vElFIOYNpRBLLTxpBQq4wTuS2fe8B8DE9KRx1Xu/K6+dfTe
         O8G1PViPwmaXlfY9n5UWGozMx6iXUOBt2N4/AaodIBtAqEUafCNML3rcGBicuaZIdmZ4
         ow5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZZkQh+bT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b22-20020a05622a021600b00400a226314dsi987351qtx.192.2023.07.06.07.29.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jul 2023 07:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZZkQh+bT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHPyY-0000wO-80; Thu, 06 Jul 2023 10:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qHPyS-0000vl-Km
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 10:28:51 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qHPyP-0006YD-8A
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 10:28:48 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51cff235226so1464980a12.0
 for <qemu-arm@nongnu.org>; Thu, 06 Jul 2023 07:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688653723; x=1691245723;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qLS1hwBQH5ErHG6O5e6dliXGtwv264wz9BRHClS/Nuo=;
 b=ZZkQh+bTR0BRdeUEf2KPPRezN6Q31G4PlHV0w7d74bPonnOHcBXpohpCxKzI4cD+c8
 JnXWUcqKzj5e7vuPYiXZupkF5N1D+wMHcjDU96tFDXUyGOzxzZQoQi2WnTyCC5owPOMg
 j9yORUnDbtELcX5bhR7gDMwGlaHcQdWo0CeNGYB8WG9rmzQQPMijkMhKl5nmhPJ3lTUw
 O8hj9yD+vDQhu6iiD02GmJeccai2fbMcA1yr79Fhk/W+rkML+pLRxA9TogvOTwF3mRzo
 IfsdRbzM0CzanQfC0dr47mA7G4lNzkhj19LRnwLSrCJD3pHBHnYSbwIrviC0Jlr7aVpR
 bd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688653723; x=1691245723;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qLS1hwBQH5ErHG6O5e6dliXGtwv264wz9BRHClS/Nuo=;
 b=LmSjDcAvL/zmHZRpfc7C+GgyJEWaLrdh2uOC8xc7RSGFslG/V+VyCw7/4Jlp4Kh9Hl
 ftQfl2ctxbXHWzKY8XGZT4JOXSwaiegXB9IxML3uPqKh9CGEJdT777Vlb6DNNHESxVNO
 34nZzMdI+qKgPEnqfF5up2yBrmGk7ehrAAWChPNHxiglkQ7usxr1x5OmR+XoQsUGlDuo
 zW86h/uV/4txDGddYj19KOEkme+h5wk/txW09Xrdb+EkiBQvcQWJ6nDtbnz6q5h8GJlB
 NqojmRZBVe8eQpFq/WeCzVO5lDLVyTTllncN9gxeHgoNJloB+nS/ozRWosA0nQHk7AuQ
 dHtg==
X-Gm-Message-State: ABy/qLakEIKN7pUrEO+gtZ8X20M7BGzboJ1DOzn5WIXzKBo0Uzn0zNW/
 kfy3D17HMv7szNjeFU4+EZny14DdDQBe4KjabcBdNw==
X-Received: by 2002:a05:6402:1355:b0:51e:fb9:7615 with SMTP id
 y21-20020a056402135500b0051e0fb97615mr2522636edw.13.1688653723095; Thu, 06
 Jul 2023 07:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230706140850.3007762-2-jean-philippe@linaro.org>
In-Reply-To: <20230706140850.3007762-2-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jul 2023 15:28:32 +0100
Message-ID: <CAFEAcA8h-VXZkD0SBrjOYg-FFVk5AW0RrAs4AL4w6RXWZzWUsQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix ptw parameters in S1_ptw_translate() for
 debug contexts
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i4OOYsM3as6P

On Thu, 6 Jul 2023 at 15:12, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Arm TF-A fails to boot via semihosting following a recent change to the
> MMU code. Semihosting attempts to read parameters passed by TF-A in
> secure RAM via cpu_memory_rw_debug(). While performing the S1
> translation, we call S1_ptw_translate() on the page table descriptor
> address, with an MMU index of ARMMMUIdx_Phys_S. At the moment
> S1_ptw_translate() doesn't interpret this as a secure access, and as a
> result we attempt to read the page table descriptor from the non-secure
> address space, which fails.
>
> Fixes: fe4a5472ccd6 ("target/arm: Use get_phys_addr_with_struct in S1_ptw_translate")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> I'm not entirely sure why the semihosting parameters are accessed
> through stage-1 translation rather than directly as physical addresses,
> but I'm not familiar with semihosting.

The semihosting ABI says the guest code should pass "a pointer
to the parameter block". It doesn't say explicitly, but the
straightforward interpretation is "a pointer that the guest
itself could dereference to read/write the values", which means
a virtual address, not a physical one. It would be pretty
painful for the guest to have to figure out "what is the
physaddr for this virtual address" to pass it to the semihosting
call.

Do you have a repro case for this bug? Did it work
before commit fe4a5472ccd6 ?

> ---
>  target/arm/ptw.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 9aaff1546a..e3a738c28e 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -465,10 +465,8 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
>          S1Translate s2ptw = {
>              .in_mmu_idx = s2_mmu_idx,
>              .in_ptw_idx = ptw_idx_for_stage_2(env, s2_mmu_idx),
> -            .in_secure = s2_mmu_idx == ARMMMUIdx_Stage2_S,
> -            .in_space = (s2_mmu_idx == ARMMMUIdx_Stage2_S ? ARMSS_Secure
> -                         : space == ARMSS_Realm ? ARMSS_Realm
> -                         : ARMSS_NonSecure),
> +            .in_secure = is_secure,
> +            .in_space = space,

If the problem is fe4a5472ccd6 then this seems an odd change to
be making, because in_secure and in_space were set that way
before that commit too...

>              .in_debug = true,
>          };
>          GetPhysAddrResult s2 = { };

thanks
-- PMM
