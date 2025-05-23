Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp2217471njc;
        Thu, 22 May 2025 17:07:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkBLP8I//0v+X7H/6k5wtP6xMFwGaLokq5TVPIhv++WEEaepFmntOQHnNL2YFl33d/pxii1du3XazC/g==@linaro.org
X-Google-Smtp-Source: AGHT+IGqE1aXBPbLPN7g0vBmQHKATd/TJtb1QxlWdpEpQMzD0JHmTijyC3BkXgKu7M7LkAPz2HE5
X-Received: by 2002:a05:620a:171f:b0:7c5:50ab:de04 with SMTP id af79cd13be357-7cee31f8bc6mr152032185a.32.1747958840506;
        Thu, 22 May 2025 17:07:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747958840; cv=none;
        d=google.com; s=arc-20240605;
        b=REWiTyZuwEBetMG+HglrtTsB2e1LQuuAskerkPzSI9XiQ6iKv1sCg5wkb9Vs3DtTmJ
         0oy/RFyOx+VYpMG2MfwML2zhA1reM0Z/NVjPDh2/ditYcvZflgAr+5nL/FjMfEN7EmKo
         cKrF8lOwHvj6jVewU8fXy7yeEwgtTaaY7CxrxL89GEL7HZ1cPbujHMnQ0x1cN6U9Nkq2
         rt8FV5JzKWEBQqQ5UGPUtIfyonfroeiS9vEI6u6o+CzqVtQKn2eKp/JIs7o2xi4dP7D8
         1ZceBTyz7l7dorEWKAkyGrx8zLKuE7wap+RJXEHC9thNWno58PAUcbhIUFLTQruxoia1
         LasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=N2zz/8/7tVZgigVNSQ08sp7XbyvwaMr2RCxggftn1uA=;
        fh=ThYII7Ld3n+MZUeHSnq/l9Rqim8wla/VHb8ZyNTE5SY=;
        b=VUzkLWeUjFXs8JcGMO2SpFecbk0QuMbY+EAGBKcnR7CJ8Q6ZCXt70DIDMMIUG4JsjC
         E7q+K/GKjySIWJ8mvlT2r+sLcLkf0XUJa8KIqRa/N2lyKqj+iHjlG4bsRmOaxpnLnUPn
         cy38OfKo7Rkd6KEyqnrnniErI+MucICfbD2hwEnQPPni5sKifa+grUnTLBbrvAHsmzm4
         TYXfTTIo1YPqSrOJMrEy/nbsqs34NW7Z6mkZWmPMyoK09Lq/DsHtMxTuh08tVza7hf/c
         Kh0r4/a9t7Stv07FeUGtjf8r490rzVwU4Uzxa537hSFEVjxk/n+8IdfHG82AEyMYWWx0
         SjDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r8PhJKjO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd468ca291si1647363385a.465.2025.05.22.17.07.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 May 2025 17:07:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r8PhJKjO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uIFw4-0005j6-0I; Thu, 22 May 2025 20:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uIFvy-0005iG-Do
 for qemu-arm@nongnu.org; Thu, 22 May 2025 20:06:47 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uIFvs-00020q-HF
 for qemu-arm@nongnu.org; Thu, 22 May 2025 20:06:46 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-527b70bd90dso3138667e0c.3
 for <qemu-arm@nongnu.org>; Thu, 22 May 2025 17:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747958798; x=1748563598; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N2zz/8/7tVZgigVNSQ08sp7XbyvwaMr2RCxggftn1uA=;
 b=r8PhJKjO0jkrlc4XKxMKXFG7GcqbbIORt+NjSIZVqL2DL6DLq4Mo2z110SSN1Z2Vwt
 d2nRDjbN1FDm6j5DPH+d1bnlQRgqfXA+XddDLQg5I8Y1ZZwaQcylYBwTqYcLB13fm3nn
 a6hXqz3t7Nuoy8usS8ZXD9x6fbekPgGz4cFOWiGcvkb1dkB86A3X3QSt8ybOVT/qJAGs
 3af/JM4AlvsoIrAUNLgFAAJJG/ei7swywsloeKjYjyMJiq9UeegVbuJn/0yr+MYJ1qAr
 SXzcMKeBzigy/7cbIXmPcO2tjB2GsPt+/f9jk/xCsrL71XaEKiJzP6TwV3mq15NcKZHz
 Y2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747958798; x=1748563598;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N2zz/8/7tVZgigVNSQ08sp7XbyvwaMr2RCxggftn1uA=;
 b=EMHWpJ5LEvzBF4JxCQXp76u9bXPI69JuQ6uFPuoW/MNAijmpwS/foXMRyz/AGn5ccx
 H2aWfOevdB6qhtMWUM5+4MpoNKQEPfRWWgImZBpf1ThDU6UxNPTxbs9O2iY2mYHpVWtP
 qyz4jH81Mny/V6AwxZk4YTq5fS3XkKa/Tje3jt4OGGDTdUguPku4W3WH7+I8r3EaPTrU
 tI1L2gkd2R9MJ6HyCiSTTWBOyt9dNJ98a9oH9Dw5d5TUtja7Mt80NKOYsIwaXZg8Sw2E
 7vGsIOQSyuf2Eg5ZNXplqLi+iN4sN5FefBR0XMja6afkg6jNRYs54xBewAduYtPMFGrP
 I+mg==
X-Gm-Message-State: AOJu0Yzm09HbUM7cF8y5ZK8tBliyPfSLTRQeXgbj2KlDAzXrq57p1O1u
 yeqRC/K09U/UdMPKCyJ3mfsc5+P/Z/kjqz0D+JMdMHEPeDN+3uFosCS6nlv8g53EcrY=
X-Gm-Gg: ASbGncvCUob7VOLRUfj0Wglpx568EKlEqfVcWpywNlOQOnpjuYVltjxilMf+3GNWo3M
 uC0sYGGBLXV01t6FhkxqYUwlhq+ZmlW5TLjpl8J+SNu1HAy/64NIfegSefnoToELmimDiu5Xo5t
 mEh/j7aE0t5bMA3y9zjIcWsKwoH/rhy0Y0wyMBoUCRkln1x/aN4LVbCc/YC9RH3BRUJtstqBoGu
 hIzhPtamW0x7D4b+fI91u7kSeciHwPXJ8U5BFudS8nJM5hTs3TIzi2IUAP2PjIiM1Ey6YN4+8yA
 r8PcJbqbT5Vx5NlXg2o36fP9ax8p1pQs7ADG9FgDMj16Drg+0hm2kQOe/4yXTtaDbcmBI4of0XX
 3ReN/L+7/NeakePIoWRcRcRspOAO/0Q==
X-Received: by 2002:a05:6122:d9e:b0:526:720:704 with SMTP id
 71dfb90a1353d-52f1fe2ea7bmr976090e0c.7.1747958798003; 
 Thu, 22 May 2025 17:06:38 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b402:6ba2:59c4:f305:3d77:f678?
 ([2804:7f0:b402:6ba2:59c4:f305:3d77:f678])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4dfa682e3c5sm11846118137.19.2025.05.22.17.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 17:06:37 -0700 (PDT)
Message-ID: <dd52d28f-dde9-4506-a850-dd1222a4c903@linaro.org>
Date: Thu, 22 May 2025 21:06:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Ignore SCTLR_EL2.EnSCXT when !ELIsInHost()
To: Oliver Upton <oliver.upton@linux.dev>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250521190228.3921172-1-oliver.upton@linux.dev>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250521190228.3921172-1-oliver.upton@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 4oLuFtNTU97I

Hi Oliver,

Thanks for patch.

On 5/21/25 16:02, Oliver Upton wrote:
> Using an EL2 that enables SCXTNUM_ELx for guests while disabling the
> feature for the host generates erroneous traps to EL2 when running under
> TCG.
> 
> Fix the issue by only evaluating SCTLR_EL2.EnSCXT when ELIsInHost().
> 
> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> ---
>   target/arm/helper.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 7631210287..83d4236417 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7389,16 +7389,16 @@ static CPAccessResult access_scxtnum(CPUARMState *env, const ARMCPRegInfo *ri,
>   {
>       uint64_t hcr = arm_hcr_el2_eff(env);
>       int el = arm_current_el(env);
> +    uint64_t sctlr;
>   
> -    if (el == 0 && !((hcr & HCR_E2H) && (hcr & HCR_TGE))) {
> -        if (env->cp15.sctlr_el[1] & SCTLR_TSCXT) {
> -            if (hcr & HCR_TGE) {
> -                return CP_ACCESS_TRAP_EL2;
> -            }
> -            return CP_ACCESS_TRAP_EL1;
> +    sctlr = el_is_in_host(env, el) ? env->cp15.sctlr_el[2] :
> +            env->cp15.sctlr_el[1];
> +
> +    if (el == 0 && (sctlr & SCTLR_TSCXT)) {
> +        if (hcr & HCR_TGE) {
> +            return CP_ACCESS_TRAP_EL2;
>           }
> -    } else if (el < 2 && (env->cp15.sctlr_el[2] & SCTLR_TSCXT)) {
> -        return CP_ACCESS_TRAP_EL2;
> +        return CP_ACCESS_TRAP_EL1;
>       }
>       if (el < 2 && arm_is_el2_enabled(env) && !(hcr & HCR_ENSCXT)) {
>           return CP_ACCESS_TRAP_EL2;

Do you mind providing a bit more of context when these erroneous traps happen?

Do we have an issue in QEMU's gitlab about it? What are the QEMU options for a
VM where this issue can be reproduced and, is there an easy way we can reproduce it?


Thanks,
Gustavo
