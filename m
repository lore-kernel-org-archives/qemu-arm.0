Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp298731ejy;
        Thu, 22 Sep 2022 06:47:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5wgW676Qvo2yQqyaGaeLbyz4NMixh4evUhQn+dgqGShg2Wu0d6LSCPp41UOzitm8vY+HwB
X-Received: by 2002:a05:620a:2888:b0:6cf:5798:9a2d with SMTP id j8-20020a05620a288800b006cf57989a2dmr2173231qkp.508.1663854475369;
        Thu, 22 Sep 2022 06:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663854475; cv=none;
        d=google.com; s=arc-20160816;
        b=xOiyktzOJNDDsxJ2uXt/aYNu/bVHH1AZfMmDD/EPBhFX8RM81sVMMhMQ4UQgnmqugV
         iwOu5k69AgX5sYwo6bIcDSb+kUAm2PkSOWQL0vmOLKg5fImN5uecourlWtQfc3lZxHpS
         wbVQLKzofReqY4zWrJhs9Fx95/IIgGIf2biVXNFHFubebfV1gvnowLHGEC3/06tWx9Fh
         euBo8HmKtHcByvK9stOr8RPkaEkBqD9O6qAJRkAD/mm4AmRqPHNysjjdXao7R13V24OJ
         5fwEBYNnfVvrsHugBgtsHfoSn7UGr2z3Zr6j9lRIdvZorjxI9ozjT/QMRqVJjOSQ9zQE
         Q8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=aZ3EWszPJbxaz1qjO6jU5azyzkhbCGvDpkvjEOBLZKw=;
        b=w9vlE8SAQ9cnSqJoaynPvAoruhflI4Sfr48rT3dA6BUVQX5eF3J4hZgVpt9vaZky2H
         8fRmpIZnKq5Kqq+AdE4m44GPjdvP3fL3H507ZX031QkJ5YuHyPccNeBxkjF5sNxzsJeV
         Mvv+xlGELErA0GrFVzoqRNkyO3rC/5Zi+PWUXg7TSP/KnUnuH0yCegIANTNvn24l0vUD
         96pIcAnfwER1CnPULQvLrrj7HHoaye/Q0mqWQWmqRJ4L4HmN3uU/RnmHHQFyp39jl+NE
         gO6UkfCdQIFaIDLHr+2NS21WsU24IL+/ijYVElQNnrs4X/dIjb8UfkXKstCCRunKdJHc
         /jKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ThtpW9yt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n124-20020a37bd82000000b006bacc41ef0csi3030217qkf.166.2022.09.22.06.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Sep 2022 06:47:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ThtpW9yt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1obMYU-0002RE-Qd
	for alex.bennee@linaro.org; Thu, 22 Sep 2022 09:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obM3a-0006ab-5x
 for qemu-arm@nongnu.org; Thu, 22 Sep 2022 09:15:59 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obM3Y-0001jY-97
 for qemu-arm@nongnu.org; Thu, 22 Sep 2022 09:15:57 -0400
Received: by mail-ed1-x52e.google.com with SMTP id a41so13573192edf.4
 for <qemu-arm@nongnu.org>; Thu, 22 Sep 2022 06:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=aZ3EWszPJbxaz1qjO6jU5azyzkhbCGvDpkvjEOBLZKw=;
 b=ThtpW9yt7OtEUTZpefrUoVMOL6kzvndqG2nyk6VsyzQqS7l7wTGO//Rf6nNpNfGod0
 2D3b9s7ZeQIsAb7RU+4P9aGsQ3K9C6G3/g+rn/UqLzXv8E9VRuWAjs+i1m6VsVfya2c4
 RuyFlB04+kh6+EWGVm29UZbUMUiEnRg9usS/HNqF0sGX6HpHO/Q18bz5lHkwgtIodtHw
 yYR/UslVrPjaPCBqTYNQ3Cqeb5o3fj8oCdCZ3myJF0pVxa6gjR7DRSKf/0oTrD74OFaH
 MAinLBkJqm7il6lnoIeyaWoOXJAtMjfTx7LKvZzXcmE88j3rORMyef7gogJpGxT8eE55
 r3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=aZ3EWszPJbxaz1qjO6jU5azyzkhbCGvDpkvjEOBLZKw=;
 b=gDD1h+vPhNu00yWQidX3LZDm7cNbUVBuTE9OPtS49J0GBrPOYefczqVSg7ASs4h63Q
 2Bj+PMeuhfQbbvmeS9M+NmH6BPLAFI+LEuwEAnYlI3Z6ZoVSW1MoIJjygL7t2p3NENAp
 KJP86IUIK0QD0Pj6T0fM6VGyDNZ9oY0jsqKG8TQ7jkzYLo+Ipz5FC02p8dgZuNoOCS39
 5fSIl7Un+tdLFSbxin/Fw1Q9NWhCFDh4uod56XeVi2dNxrPoIA7eHj1lzm2Z/FaWz8+G
 gKZ6hSs4MxTRIQhi8b7VywBu1ZYM1P6ha0ztiqPMbfI3O74kjMmXoGhyz61FpQmrSqRK
 ljyQ==
X-Gm-Message-State: ACrzQf2HZ8MjZ04zQsZGJS+8CqJJFUvGQFIBnGTgpNab0TIQcpxHXpPY
 3yjO0aHruq0u9prS5FR+Vr3OafRt/cxWp8DJqCvQMA==
X-Received: by 2002:a05:6402:847:b0:453:943b:bf4 with SMTP id
 b7-20020a056402084700b00453943b0bf4mr3237276edz.301.1663852554386; Thu, 22
 Sep 2022 06:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220910141213.111154-1-nb91605@student.uni-lj.si>
In-Reply-To: <20220910141213.111154-1-nb91605@student.uni-lj.si>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 14:15:43 +0100
Message-ID: <CAFEAcA8Up7DN1J7hLiXmuWhA-Ni3PKu7pUr=D_fPjqqzuqQMNw@mail.gmail.com>
Subject: Re: [PATCH] arm/monitor: add register name resolution
To: Nikola Brkovic <nb91605@student.uni-lj.si>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XmjJ6rBTN8PH

On Sat, 10 Sept 2022 at 15:14, Nikola Brkovic <nb91605@student.uni-lj.si> wrote:
>
> This patch allows the monitor to resolve the
> stack pointer, instruction pointer,
> system status register and FPU status register
> on ARM targets.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1145
>
> Signed-off-by: Nikola Brkovic <nb91605@student.uni-lj.si>
> ---
>  target/arm/monitor.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index 80c64fa355..143c95bca4 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -31,6 +31,7 @@
>  #include "qapi/qmp/qerror.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qom/qom-qobject.h"
> +#include "monitor/hmp-target.h"
>
>  static GICCapability *gic_cap_new(int version)
>  {
> @@ -228,3 +229,31 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>
>      return expansion_info;
>  }
> +
> +static target_long monitor_get_cpsr(Monitor *mon, const struct MonitorDef *md,
> +                                    int val)
> +{
> +    CPUArchState *env = mon_get_cpu_env(mon);
> +    return cpsr_read(env);
> +}
> +
> +const MonitorDef monitor_defs[] = {
> +    { "sp|r13", offsetof(CPUARMState, regs[13])},
> +    { "lr|r14", offsetof(CPUARMState, regs[14])},
> +#ifndef TARGET_AARCH64
> +    { "pc|r15|ip", offsetof(CPUARMState, regs[15]) },
> +#else
> +    { "pc|ip", offsetof(CPUARMState, pc) },
> +#endif
> +
> +    /* State registers */
> +    { "cpsr", 0, &monitor_get_cpsr},
> +    { "fpscr", offsetof(CPUARMState, vfp.fp_status)},

Hi; thanks for this patch. Unfortunately, it doesn't look to
me like it handles the fact that 64-bit vs 32-bit is a runtime
question, not a compile-time one:

(1) if this is a 64-bit CPU executing AArch64 code then we
shouldn't be resolving sp/lr as regs[13] and regs[14]
(2) if this is a 64-bit CPU executing AArch32 code then
we shouldn't be resolving pc/ip as env->pc.

As a more minor bug:
(3) fpscr isn't only in vfp.fp_status, it's more complicated
than that -- you need to call vfp_get_fpscr().

Also, why only these registers ?

As a wider design thing, I'm not really a fan of target_monitor_defs():
it's the kind of quick hack that got added to QEMU decades ago
when we supported about three different target architectures but
which doesn't scale to the set we support now. It would be nicer
to be able to tie this into the existing gdbstub support code for
reading and writing registers. (Though that too has issues with
CPUs which support multiple modes like AArch32 vs AArch64).

thanks
-- PMM
