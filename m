Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD74FF887E
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 17:59:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wI9Bb-0005G6-2x; Wed, 29 Apr 2026 13:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9BX-0005FV-B5
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 13:58:56 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9BV-000646-7t
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 13:58:54 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488ba840146so275815e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 10:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777485529; x=1778090329; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PZnJLNQYKnnhX+DYA1VNJSl9nHcjrqExn8oxalwU2Fc=;
 b=uW8IOOx/BEd0W4rbFnAWuirRELs0/PLUJ+D2jFjm4U1xiTGckPIaleDpc2lEuNHqzW
 /XPQ1HJlGYXRufdRZ8quDXyyLpO2pGLi27MLOgZkdzfPtYaCtw66uOmyXAq/1BIRB1dO
 MMIBZpiK1d3514xPtr2F+wS4tQFgLNQojJpNAad6nfXnRnBeq6soflDOAR3ihAXofl7h
 Rv9eUfsm+1u6DdTGfIweuSLHV+PC0/oX+Si+moB9wCDz6SfprvWU6OnRLsXpSO22QrzX
 3gySVA1GdE9Vk4YMeo+jmchjJNszcvcxYG625XcCXoYIkGnspKZJPQvsIPLKXkDfanLH
 h2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777485529; x=1778090329;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PZnJLNQYKnnhX+DYA1VNJSl9nHcjrqExn8oxalwU2Fc=;
 b=cfvgKOJ4iZBk7toC3bVlZT1ivjGu5W46H5fIDYu65cHboKr7Oj0QB9VnrKLz5RTjaF
 3+0d6DB8chlqb2OGxgDOO1ESnsxmKw/NMk7pOQSR/qmCu/Z4DSHfzr6X1KBtroPSkAM0
 uvnmombLPCuOvz2VW6d8yhoIThfGcxF886iD34aZByLPGlLOzc1rmCC1HIDLgSAjak9Y
 1kIL9M8aEvAGCfK1KkXEnaM+pkKGuA/btUyT0cx66bLDFlkjfnaK9oYQ7G+siR2fuWr0
 Cw+q5Fy6wDnXYR/2cjlBXqrDN/MCS9yxzq94370puoror6FsmJIFvDOC4UAHPLHpqcCL
 dXgA==
X-Gm-Message-State: AOJu0YxiOMJevou7z+PHDm8cnGDu9d4HpxpN8ZWRynFQT7rvkjRDNQao
 tRAb37tcTNsYUydw4MyiiV46elIUHdN0mTSMirrHwk4pTNlf3CxCqzrOE5pJHed2dRk=
X-Gm-Gg: AeBDietEtia/h0FIRKwF+BdEpQaengTSJgndCJ9T35lvvDC5SvYxGL3Iwbr0TMPs7jb
 zddFoD5JXBrPw48wLmU485SP4kaqSRfg1kNZmZpETTCaXb+TkDLBYfBcgjmesQS6h51PhXaat+I
 RK0lYD8uglukF5kGVD0Egx89Y/R5YVUprWfEQPmBEuDgRYziDeYbFpRmSSDpjHKUee107dSM+LD
 dO5IflyZLjChrU9s0B2p14FMXtiNm/VGdQle4UMicjyKP+fXkOceHFcw138Acq9HRTJWp7fBz7o
 2JkBhcSFUCTwo/Sni6BNvuXcIlwe6A1A2VMVnCM4vBPwX9JpVpknCYaPMoorSYCRfe9EwJovoJw
 6h9OZauX/oR5Jn7c87UDsY6A+oQo3Dl8TC8Gz/A1yHFXN0OlwaxWlgrHm0QruDiRUgk25uRFcl3
 hQ5jmQsO7NY+1D1I6zMOuiWYQEMFH6y8H2nW5I/T02+nPAuDGpmRXGH5B/92yqDeCpScI8y3ip9
 B57
X-Received: by 2002:a05:600c:3f16:b0:487:55c:e0c1 with SMTP id
 5b1f17b1804b1-48a77b1da5emr152703805e9.14.1777485529598; 
 Wed, 29 Apr 2026 10:58:49 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b76e5afesm6293512f8f.30.2026.04.29.10.58.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 10:58:48 -0700 (PDT)
Message-ID: <7a2dc6f7-e387-4540-8332-0ad0dab5335a@linaro.org>
Date: Wed, 29 Apr 2026 19:58:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/84] fpu: Drop FRAC_GENERIC_64_128{_256}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 26/4/26 15:39, Richard Henderson wrote:
> This requires more complexity to handle const selectors, and
> an indirection macro for each function.  Easier to just use
> the preprocessor.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c                  |  69 +++++----------------
>   fpu/softfloat-parts-addsub.c.inc |  22 +++----
>   fpu/softfloat-parts.c.inc        | 102 +++++++++++++++----------------
>   3 files changed, 77 insertions(+), 116 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

