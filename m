Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp80146lfc;
        Tue, 25 Aug 2020 11:22:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrxL/AM2iFVEV+q2epgHCMDHTRtl8xepcMGT/C2wipR3p+kKl60H2515aOp2Us45cARVr3
X-Received: by 2002:a25:2612:: with SMTP id m18mr16100540ybm.184.1598379770090;
        Tue, 25 Aug 2020 11:22:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598379770; cv=none;
        d=google.com; s=arc-20160816;
        b=zxuySZ1DhrSkQkmvmDeVp5vFZXNeMPOGdR5kEIUWPbZVQEgy1oxQ9ogE7aKBkX/qR1
         wDd7B03uQoxWBm8AmxvEOH0/WWrMs8MZvxAIq5eQPk0U7woSW0bgkYUkNRZg77ADj0Ab
         PkLQSoyXC9bvIgb7j8M4A5LP06eOxXDjBWTFpYiihjzfCAIgta+8B/l8OAtCyQnC6Dkh
         qV3s6ht0uNaZEnRpR7JpwkRO4sKV6iFYFYnz3G+q7MBcbg7CBKgmidvjGEJ92wX7b5WH
         3ukRLaYjn/2MLnof28KMf+IufIHFWNjrnr50tb5ea0dTwdLt3OSJAHtWTCe8VcYk3C2V
         2NTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZHMwKmfJfUTpjoT48OQ71F+G5/tJtqS+sLxmIICgYIw=;
        b=wdmKHnOZHNq/p5wj4EnHWE0Vr/Q3eTj6ULAWOvn35wR52lyhYTDgfwN2OWpm/JFBL2
         4nzqJd04OjIhpmcCDo/xcHF/0oDOMx53Mf4gbPyOkurMEOlp1DJ3uh3xQ+V1NYf1l3AB
         HuWh61GLpME/gmqg4jCqDT5sDCWi3nSweMFCMy6pJet3bb227SZSzcApQO/7J/tli7rp
         SJryOefBoE4AK+AMeVnmOOIEd9A0FNqT6rxASgENs1aNUnTZSxG+6YETJLjkH/CGZ5rQ
         rB/TKDBc9luQEjoYAMjM2v3BLAGtDOHtBtKcSzZWFdDcGlSPSEf5619C9PcrarHPvSrA
         DI4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WMblEuVV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i32si17838510ybj.125.2020.08.25.11.22.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 11:22:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WMblEuVV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAdar-0007we-Gj
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 14:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdZy-0007Bg-J4
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 14:21:54 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdZw-0006rT-EW
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 14:21:54 -0400
Received: by mail-pf1-x443.google.com with SMTP id u128so7991033pfb.6
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 11:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZHMwKmfJfUTpjoT48OQ71F+G5/tJtqS+sLxmIICgYIw=;
 b=WMblEuVV8vOg3UfxusOyIs2pyYitzlvG9Hs2kqsXyO9x8k22X5Q3oNihTXYwzQ/BUR
 bB+Z8oWZMHJGDAt/5TtetT6ERjCZuXNrYCheWjK7DdFQ4x7J4eq46MHyCet7bELr6DNk
 Jpbbq63Ij3WPOpRO9UunZBEn5nmzMbEgMKhykmZYoeioQuaRjloclPJ1xJesGvEfIGf/
 Jz3m8j2WUc8k5C+92FzJuCF2XBbcsRl18V92I9TMs38A/qmvt/Lt6YO07rnNtFXb5pEP
 4wnhfgZk6X0c4o/q13Z+r4a+EzomakxwkUFQB12hv4Z34n8hXzBjdKgf6jB7WG0krZ40
 AsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZHMwKmfJfUTpjoT48OQ71F+G5/tJtqS+sLxmIICgYIw=;
 b=pHFidboCgahQ522DbQxYRIWUG/L9HHZOocFo7A6zeY1xu5AVrlLVSS5vJNzvBjIKdD
 vbZemltkNwu9dOHn41yq22ZeTS1M19UAY5/RLY6VOifjGS4ISkOz1iGTl03LXmtkCurp
 c/Iyk91y97r8q0O3RcWRAubiYVo6mESN6n9t/tWRHNPLMhlLgI0H7xuuYEDp4ZTzVUD+
 3IMVkZ2Gbvwhtk8kghZmdOX3EcWxEhJE3BA33v4zTD7qqJcHSdYEtDgullIsESRzRdug
 9bWn1FOgw3B2Hv53XJ41Dg49VivVTBL5WDdCw6ws7fQkI0l91v3lFwczf+EWhXkloFls
 pXBw==
X-Gm-Message-State: AOAM530mYJ57Wf/DT8zPjEAMQy2jDmnsgpF5LCLkWg5kDSxSCQU5cRdb
 Smuo9KJ8pvKrRIEZ2M1bg+YUNOyQWgJ3gw==
X-Received: by 2002:aa7:9571:: with SMTP id x17mr354951pfq.90.1598379710287;
 Tue, 25 Aug 2020 11:21:50 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id h14sm15819083pfk.195.2020.08.25.11.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:21:49 -0700 (PDT)
Subject: Re: [PATCH 06/22] target/arm: Implement VFP fp16 for
 fused-multiply-add
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f98bfae2-f89c-af9a-e614-a4b7ff42a6a0@linaro.org>
Date: Tue, 25 Aug 2020 11:21:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zWtaekJi+xvk

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Implement VFP fp16 support for fused multiply-add insns
> VFNMA, VFNMS, VFMA, VFMS.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h            |  1 +
>  target/arm/vfp.decode          |  5 +++
>  target/arm/vfp_helper.c        |  6 ++++
>  target/arm/translate-vfp.c.inc | 64 ++++++++++++++++++++++++++++++++++
>  4 files changed, 76 insertions(+)

Same comments re the helper types.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
