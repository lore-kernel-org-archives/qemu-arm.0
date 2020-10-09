Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2277414lfq;
        Fri, 9 Oct 2020 06:27:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3ysA8hefvQn9wjpZUeUmNJNooe31LrWJLMQgc5ZJNBshNG2s+utirPqfdBSYgpSTC7xAB
X-Received: by 2002:a25:c790:: with SMTP id w138mr17140612ybe.409.1602250028463;
        Fri, 09 Oct 2020 06:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602250028; cv=none;
        d=google.com; s=arc-20160816;
        b=HRSHgFkGXlUEkY/WZl6i72to1mXV6NPf69XHtmp/4k/Xrg+/SIYydB+WMsu+ut27yP
         UekICGqufmIybmQbhfPcHx+ymt5izrFGMzJkvqi6zENsgTRqDvnWYFIBYJXeTn8U6NI6
         nAySKPp0zC29IxRXoCrr4po4vMw2YL65waQ+v0ribm7/YDtLisbvWeA4eAo2l48C0AKc
         cfe/IB+tZGny4LDlMtYpBWhmir+LkkXtyC6s3cvApxE2hXlcsPjR16KTXYR05HWzsdhD
         0Y2ujac+mZ75aPlTpwvbbeHAIV5vQRWuU22XJ7zxneDLo71K8EaDoNVKttSkMsbu8PPE
         rikA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=pjRym/vCQjsFin+SzqcOFcZ9FFMrcd39Tq4aXJ5opNE=;
        b=hYPJWZTuGzUjTrIpiIjgj4GgpqIKiN4C51XJ7MwBVUtH/PMAQEyKfpWQSozcynMN/k
         9KDh5gLe8d582rv+AvXhZ1OB+Xg33z31h1Nb1LfrxuNQZ2XmHm3s0nDvxg6BBfaPQc5i
         STFj/DlUTfYNARd/utmb4Oj/EO97MfYRkgkHcB2g0EWOsu4BxRBiO/Eta7w/ZWkDOkri
         tou/6htLyA1LklzeDdA3AcmWlkUOmYcqVRDq4lfW38vrDRiy9cPidXPIvH1v11VfJ4bF
         keLAJxAShbidw8fcCz0p/NwxZX618cseIagrl8hKMKYfy1HXoCLVLIMgCpMp6slxoG0b
         6QWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=arm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r79si8057125ybc.23.2020.10.09.06.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 06:27:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=arm.com
Received: from localhost ([::1]:54730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQsQN-0001o3-Q8
	for alex.bennee@linaro.org; Fri, 09 Oct 2020 09:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincenzo.frascino@arm.com>)
 id 1kQqFS-00035b-46; Fri, 09 Oct 2020 07:07:42 -0400
Received: from foss.arm.com ([217.140.110.172]:40786)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vincenzo.frascino@arm.com>)
 id 1kQqFP-0007vT-Io; Fri, 09 Oct 2020 07:07:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E291D6E;
 Fri,  9 Oct 2020 04:07:36 -0700 (PDT)
Received: from [10.37.12.22] (unknown [10.37.12.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FCC23F66B;
 Fri,  9 Oct 2020 04:07:35 -0700 (PDT)
Subject: Re: [PATCH 2/3] target/arm: Fix reported EL for mte_check_fail
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201008162155.161886-1-richard.henderson@linaro.org>
 <20201008162155.161886-3-richard.henderson@linaro.org>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <3e2f2248-8810-bf72-a498-91fa65eeded9@arm.com>
Date: Fri, 9 Oct 2020 12:10:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201008162155.161886-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=vincenzo.frascino@arm.com; helo=foss.arm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 07:07:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.208,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 09 Oct 2020 09:25:53 -0400
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NXx3FsUus1dO



On 10/8/20 5:21 PM, Richard Henderson wrote:
> The reporting in AArch64.TagCheckFail only depends on PSTATE.EL,
> and not the AccType of the operation.  There are two guest
> visible problems that affect LDTR and STTR because of this:
> 
> (1) Selecting TCF0 vs TCF1 to decide on reporting,
> (2) Report "data abort same el" not "data abort lower el".
> 
> Reported-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Tested-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  target/arm/mte_helper.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 734cc5ca67..153bd1e9df 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -525,14 +525,10 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
>      reg_el = regime_el(env, arm_mmu_idx);
>      sctlr = env->cp15.sctlr_el[reg_el];
>  
> -    switch (arm_mmu_idx) {
> -    case ARMMMUIdx_E10_0:
> -    case ARMMMUIdx_E20_0:
> -        el = 0;
> +    el = arm_current_el(env);
> +    if (el == 0) {
>          tcf = extract64(sctlr, 38, 2);
> -        break;
> -    default:
> -        el = reg_el;
> +    } else {
>          tcf = extract64(sctlr, 40, 2);
>      }
>  
> 

-- 
Regards,
Vincenzo
