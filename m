Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2276657lfq;
        Fri, 9 Oct 2020 06:26:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycxvILGa2ui2nGZq97GjOVUV3NbTdFHnxbsWuW8wzeRXpqcpk6XkUsoCj1ydh/g73+Hwuu
X-Received: by 2002:a25:ab0a:: with SMTP id u10mr18704572ybi.204.1602249970293;
        Fri, 09 Oct 2020 06:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602249970; cv=none;
        d=google.com; s=arc-20160816;
        b=ED+8BadeGNT8nRTvDz6bmiZXphYZjkZ2P+gZ4OkhHCnluXe6e1FsFRLUPrsPKWCvL4
         zhzfzCFkkex3pzXDjNQrn3wAMbE23v4p+9X1C8lUFSzV0TJAxcxKRjJVFb0RnPkde0W0
         H5ZgzyqhU1z/Zf+MZNvXP58+bky3QLp4zgU5BNBSaQzTrNft4yXkxrwOjdpkV4znL6JV
         hU9lPb1DSN/Do2gCKYgyqkug/jE6S4jA9jBGMC3TBp+u0MDPoN5ZKLzmGBi1xv+hY0WN
         6p9oDYrrMrrw3pEj55B0L4nnnsUMN+czFm/999i5TxcNUhO5O54vEThniZkjv1iDaxuj
         bvCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=hQUTRZIgj7SdC8L1hoGHzHAFypHuQP3Vj0Jz2crfQmQ=;
        b=HTLi3wZqg0lUs1o97E8bzNLK+LyJ+u8XU5lC6MLhKu3JoVxZvR0WtYkEXdQc2bLySs
         6qXGv698cmg+J6JSCZdxHhCgo5l8u+l+ZyIzUrG1G2cSgobTlNLLJb/0oyUMyn9k+V2p
         MW7IUKHIxDP/wh9/ToLTGX9zvw5Q/BhlXDQUBbvn9+dsAxVclOd9tXDPbuhbUi+Po81N
         Jh8f3vdN1kHSmEWtemze+IHVDt/XO83vdj5mrpSJEVPh0eB4HmrFE+H6bU2U3lzqPHsU
         tiPLe1R655Ko/j3MPkV3GpCx1/qurCXsx+8j19H5dy4g5R/cfXppZr7aGojPJ075MZdP
         n/ag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=arm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r79si8054911ybc.23.2020.10.09.06.26.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 06:26:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=arm.com
Received: from localhost ([::1]:50838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQsPR-0000Dn-NX
	for alex.bennee@linaro.org; Fri, 09 Oct 2020 09:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincenzo.frascino@arm.com>)
 id 1kQqHe-0004tJ-EY; Fri, 09 Oct 2020 07:09:58 -0400
Received: from foss.arm.com ([217.140.110.172]:40854)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vincenzo.frascino@arm.com>)
 id 1kQqHc-0008D6-GM; Fri, 09 Oct 2020 07:09:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37B45D6E;
 Fri,  9 Oct 2020 04:09:55 -0700 (PDT)
Received: from [10.37.12.22] (unknown [10.37.12.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45D9C3F66B;
 Fri,  9 Oct 2020 04:09:54 -0700 (PDT)
Subject: Re: [PATCH 1/3] target/arm: Remove redundant mmu_idx lookup
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201008162155.161886-1-richard.henderson@linaro.org>
 <20201008162155.161886-2-richard.henderson@linaro.org>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <9f06c3d1-982e-1c7e-b480-6978259432ab@arm.com>
Date: Fri, 9 Oct 2020 12:12:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201008162155.161886-2-richard.henderson@linaro.org>
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
X-TUID: gizF/Kq8D/8t



On 10/8/20 5:21 PM, Richard Henderson wrote:
> We already have the full ARMMMUIdx as computed from the
> function parameter.
> 
> For the purpose of regime_has_2_ranges, we can ignore any
> difference between AccType_Normal and AccType_Unpriv, which
> would be the only difference between the passed mmu_idx
> and arm_mmu_idx_el.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Tested-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  target/arm/mte_helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 5615c6706c..734cc5ca67 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -563,8 +563,7 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
>  
>      case 2:
>          /* Tag check fail causes asynchronous flag set.  */
> -        mmu_idx = arm_mmu_idx_el(env, el);
> -        if (regime_has_2_ranges(mmu_idx)) {
> +        if (regime_has_2_ranges(arm_mmu_idx)) {
>              select = extract64(dirty_ptr, 55, 1);
>          } else {
>              select = 0;
> 

-- 
Regards,
Vincenzo
