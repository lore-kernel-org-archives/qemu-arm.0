Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp841894lfg;
        Tue, 17 Aug 2021 13:32:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKwW+ZNwuG4Uyt4ZNpnN2UUFj6fcPt628rAvHcXg37rkPuaTrPFC3saE++7lzjG67wEoJU
X-Received: by 2002:a67:bb15:: with SMTP id m21mr4917166vsn.26.1629232328528;
        Tue, 17 Aug 2021 13:32:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629232328; cv=none;
        d=google.com; s=arc-20160816;
        b=sIEH+2EshckeE2syYcTY5CwgTErcj/4XJeHYs0AsQtUTWoBooxE1k+sTGoCTQWRo5A
         LnqlnNPPSaaWu8LfhXfhqP6CVbNBjniZAe6HWpjKYF9hGW6pMOTsNJVnOzpScolOsAOv
         cWhKsqJPa9odaHiRSxUgF2qRVL2w9h2g+kzRyNOevL0c/4XJYC7bi+P3s7Oi40qWtdGS
         E8U69k3zE8pBnqUCBjJtxnz++d4EpZteDKFJWXPXWwpc5KId+3eBpFX/IeFDoZ2OoO+R
         FEFoSywtePF7pMl7UsBOjiUtuiPZP1jbCFqaIKuHiG7b0X99ZkW56QYnp2p95dDTEfpg
         PYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=W9wdJClR/7ZCULmGcfSTqMYVVSuIcOv66oLmSImGX94=;
        b=M5EzXcW1W2bpTVsYhfdgkRFhEGcJnC8DmtXgNi7z0Yqou95gCDRKzgYAuq1TC+tCTG
         9U6mZTuyMhDADWOhvs9p2OfKe8LA+yBa9nO51cX+JBQj4U0QxUuMyRYHwDDwLvaEMyVZ
         Vh5uEDZ8xmjfui3/nOcEvOWS2003dfgH326k8HtmgXBoPPE57JmW2cTnWSEK8y85UKF0
         etczS/sa9c5lJVnODUNDSQMGuf6XFxtzcfuz9fgMC5GnXdIfv9izEX/+R7U/iiQWGOhQ
         G1JHcDR46cS/ji8IQWzKAfk1nSDrRDkKsCaxKSUWriy/wZH/jOEvwzQGSxeO8P7l23Kz
         /lMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dvcF9ic1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si1852447vsn.320.2021.08.17.13.32.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 13:32:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dvcF9ic1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mG5kl-0002J8-Ia
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 16:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG5kT-0002Gs-Fr
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 16:31:51 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG5kP-0002EV-Pd
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 16:31:49 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c4so378896plh.7
 for <qemu-arm@nongnu.org>; Tue, 17 Aug 2021 13:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=W9wdJClR/7ZCULmGcfSTqMYVVSuIcOv66oLmSImGX94=;
 b=dvcF9ic1NEs2n1E0Djhk6VtDydBo30DdMkqoAxLTaogiqa4vxJrupeXBHkqI+YHTYP
 1hbyp/khAznNzXz0C1Y50m+FVWd6UJhdWAJ9VQGIlrprSXLPIUBLoJwnazrdBPWy4Grk
 cccJAmsFpCmxxWx6FUvRz9EkBGKoKkxHV1zRDlUwKmJUNgmwo1Xxg8xxutH5GBq84clg
 pTnotlRRtxMHOXG9yw0A0ASua5vQiXrBcOwJAw5Q5OL+r4kZHn+VCnGgoyeHpU5/WQ8o
 S5qCRdV1Vku0+O8xT1q75qXG0I6Es4miAQZu5vDaljNtXcMCGpy5ZXoUlLPPXa7WnpET
 msVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W9wdJClR/7ZCULmGcfSTqMYVVSuIcOv66oLmSImGX94=;
 b=YGbgWag3AFJbaUkIHlzGOhVL1heYCrTj+slTfetng9uiiWYiFZsRFbVmBtV3/I5nTG
 AdZlLHFZ8tRI/IyAM7eudrRtu1KwXT2pat88QKUOwebpw44yD6YN261FIKNsVIjqv9Nv
 LJwYRBxjYzxyDQcl8iT3myZ0aVqAriRxLKlmmC1PU3AHu2F/bT2bCFVrMn6Zg5E0RbLW
 AG0dwIOVNzFmqcnd03dR55JPIC+SS7zJnCYx3320kRBNlpEHPe1X+FFqEwX2T5aL3a2F
 LW16aOixU7sLnUd2Hq8UGV11sJnCTSZk43fmbg14ZG589qDY6cQjOdgbzEt3WYaKvXxi
 4XAw==
X-Gm-Message-State: AOAM532clnJpsd0pXYd16bQC6AV05N2QYXIEKO+ShOU/GkCMarXo+vTH
 7j8nooy75b+hEMxi92J7noPIjQ==
X-Received: by 2002:a17:90a:c481:: with SMTP id
 j1mr647214pjt.164.1629232303999; 
 Tue, 17 Aug 2021 13:31:43 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id o14sm4073048pgl.85.2021.08.17.13.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 13:31:43 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Take an exception if PSTATE.IL is set
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210817162118.24319-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a59ce840-3694-0936-b67e-2187d367a90d@linaro.org>
Date: Tue, 17 Aug 2021 10:31:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817162118.24319-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: TZlUtn1OcWLG

On 8/17/21 6:21 AM, Peter Maydell wrote:
> In v8A, the PSTATE.IL bit is set for various kinds of illegal
> exception return or mode-change attempts.  We already set PSTATE.IL
> (or its AArch32 equivalent CPSR.IL) in all those cases, but we
> weren't implementing the part of the behaviour where attempting to
> execute an instruction with PSTATE.IL takes an immediate exception
> with an appropriate syndrome value.
> 
> Add a new TB flags bit tracking PSTATE.IL/CPSR.IL, and generate code
> to take an exception instead of whatever the instruction would have
> been.
> 
> PSTATE.IL and CPSR.IL change only on exception entry, attempted
> exception exit, and various AArch32 mode changes via cpsr_write().
> These places generally already rebuild the hflags, so the only place
> we need an extra rebuild_hflags call is in the illegal-return
> codepath of the AArch64 exception_return helper.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Obviously correct guest code is never going to set PSTATE.IL, but
> it's pretty confusing to debug bugs in guest OSes if we just plough
> on executing code rather than taking the illegal-state exception.  We
> had a user point this bug out to us earlier this year I think
> (probably on IRC since I can't find anything about it in my email).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +    if (s->pstate_il) {
> +        /*
> +         * Illegal execution state. This has priority over BTI
> +         * exceptions, but comes after instruction abort exceptions.
> +         */
> +        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
> +                           syn_illegalstate(), default_exception_el(s));
> +    }

Missing return after exception.

> @@ -9045,6 +9045,15 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>           return;
>       }
>   
> +    if (s->pstate_il) {
> +        /*
> +         * Illegal execution state. This has priority over BTI
> +         * exceptions, but comes after instruction abort exceptions.
> +         */
> +        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
> +                           syn_illegalstate(), default_exception_el(s));
> +    }
...
> @@ -9576,6 +9586,15 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>       }
>       dc->insn = insn;
>   
> +    if (dc->pstate_il) {
> +        /*
> +         * Illegal execution state. This has priority over BTI
> +         * exceptions, but comes after instruction abort exceptions.
> +         */
> +        gen_exception_insn(dc, dc->pc_curr, EXCP_UDEF,
> +                           syn_illegalstate(), default_exception_el(dc));
> +    }

Likewise.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
