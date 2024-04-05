Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp1163179eju;
        Fri, 5 Apr 2024 11:17:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX1OQzL5dilKuQ+l5RSjpOU1CqEL5iMhXv0pwqTUtTURUlgfgeoK3zEW+0R/NoGPMNzCkR6u29F7rYuSGnAfVW4Yzp1OsyP
X-Google-Smtp-Source: AGHT+IHWsOKQuTyRpqEVhHXK4I6am4WNFpXW4B3vctq8ZNvK0lr6s6E9mkn8oCOycecMnChmI0o4
X-Received: by 2002:ac8:7d15:0:b0:432:fea2:a820 with SMTP id g21-20020ac87d15000000b00432fea2a820mr2065778qtb.66.1712341055837;
        Fri, 05 Apr 2024 11:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712341055; cv=none;
        d=google.com; s=arc-20160816;
        b=Lqzqnsgna3ObMqSFDfWJAVDaqD22Y0+rZXEfn4LOd0Zjt7M+35Ai1DIlepMnQwN/ko
         7s1IcMZZ3IpEw+h/DpiHwYbIl4RrEk0YAKZyrKWVOj5q3lTjVnvvfAhJFm4Hmn2cb+3y
         12boY4WK7D/LtUey401cdmPsWtk9xzlY3Q7vtcimtPR6poJz+v6W6humGgitJuQtcVAt
         I/3JiY6tKn5UOLuv6JawLLiTLN2ZJY8njW6PXR5js+AdukM2MlKAjSLKhqyVCSmB+YsV
         Fz1uQCBCroF7nF5hB2GhbaVDkeWd4WriIb1vyOnxzTFcv3UwYu6E0y7lnCEJGO/Cib31
         WAzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RqTmXgfQHA1k4DXgzXGjZtdD4j+rxGlQUGOcJyq7yvY=;
        fh=eOjroPwaufhdysoLf6grZKrPtG+uUHBZvKPZqBQ0y5s=;
        b=vJqddCOK4Pnz4M/bBbN57vaf5l+6fGiKQsyuNgFeMx41qUUoxZkw4YJroYgBBfmMDl
         nb1ZwJIPEAHw79OnQrAV7tlbd7noYAxjGnlkqOycrmb2NkjHutX2a41CJcvU1RFF6Yhn
         Rp5wOOlEE0eU3i2UPBDqPoEHCXXGzjxleH0LnGaKnj9v5kdnkIGT+PWFkFdn65EGJbL5
         AWwY4d9hXJmT8ltacsA70H/V2ppG1qj+1totq0G9XGAn4X0F/hhj9EJiguwRRVDikdqm
         Vm4uVSQqf6wnYrez1DrA3WSNK9/lCXtVte0o/F7tCzRdo9wrhhV7FAwOKqcrXmZvP+er
         Lh3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YJ5MejBL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020ac858c5000000b0043467b87b15si902267qta.188.2024.04.05.11.17.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2024 11:17:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YJ5MejBL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rso7g-0000Ci-Gn; Fri, 05 Apr 2024 14:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rso7f-0000CM-Dq
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 14:17:07 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rso7d-0007i9-Fo
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 14:17:07 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1e223025ccbso14072415ad.3
 for <qemu-arm@nongnu.org>; Fri, 05 Apr 2024 11:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712341023; x=1712945823; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RqTmXgfQHA1k4DXgzXGjZtdD4j+rxGlQUGOcJyq7yvY=;
 b=YJ5MejBLs9rud/zASTVIYQcQod72daQ6PYVV7T2Kdqn6U93hD4Q0kPi2mzrGVgfb5J
 MDrapjbE9J1PE/qy7QQ/GqZANc0eQ547+iqagKuRzd7k/5sl+hi2pNgUu/SiHPZURqRe
 hf1BpKMpTYR2yiF3S8bYOVsIbSBkFy7LfWItjvDFNJsdUr9ocdtsiArbZFtOVnC1IqhR
 kq4H5yxhKTo/zNgTos8e1+OYxF7AIpUILK+0M1xbBZXIsYW5U8qZ2HhmIRLPs728O94p
 0WbRki1O+100vIImHb0rJW9WDjxsKtnXBzuiJ2hBLaR7a/oTipK+sNEmYfMriZD8UO4W
 aLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712341023; x=1712945823;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RqTmXgfQHA1k4DXgzXGjZtdD4j+rxGlQUGOcJyq7yvY=;
 b=r39qHEYezVogNEYFfP6pczl7op2ho4FxDUo6AUWVclGhLmVNiDHdhB2FZ1iMuRBD30
 WUACn0GZVMo4KoxoHicZfzfQXzKwyrYSOS3sXYS/MBH+KHBK8xxlQt42Nepc8BuKZ0gu
 pL8mSo78ncFRT2ESXg+KbncIcddZ+IjLitG6WEN6hVT9nqrGXrxV0APg89zT6ShVSUTY
 CGzKue4KifGsZhZJ+DZT3qi+4M8tdUZ+imAW5LzvWehpW1AO1P953gwLMtgr7DjkmI1/
 wSgAf+Z4cCIL4SXmMtvv3f/+5ppU8DjR+gIgg1MNPkIJtM/1sRwfX/kH3ptDfwiC9AIS
 FhMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTMmTcTnNrzmFP0l6sHcWa0yPMPMB4xcGKd6ERl+nIf/Ng21g7ZRU8eJitLI19wZddhgyx1xSpzAtFux5jy43RdLUu
X-Gm-Message-State: AOJu0Yx1cFTj4lE8QH43+hAo/BY76ztJIPlGdv1dp6xfrD47phgKe7nz
 b9mFaqJbYnH91jxdDJXKcqwr4Zrq+0ZxLzjUPYlKlJhMdV5WpTJz3WSIYhQcl3Peihbbr2EohON
 K
X-Received: by 2002:a17:903:41c2:b0:1e0:89d8:ab2f with SMTP id
 u2-20020a17090341c200b001e089d8ab2fmr2832952ple.66.1712341023421; 
 Fri, 05 Apr 2024 11:17:03 -0700 (PDT)
Received: from [172.20.1.19] (098-147-007-212.res.spectrum.com. [98.147.7.212])
 by smtp.gmail.com with ESMTPSA id
 lb4-20020a170902fa4400b001e0b3a87dbbsm1899548plb.177.2024.04.05.11.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 11:17:02 -0700 (PDT)
Message-ID: <fbaa97be-c355-4a76-af10-fa64a7b1d31d@linaro.org>
Date: Fri, 5 Apr 2024 08:16:59 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.0] target/arm: Use correct SecuritySpace for AArch64
 AT ops at EL3
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20240405180232.3570066-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240405180232.3570066-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UmnVwWkWQYz+

On 4/5/24 08:02, Peter Maydell wrote:
> When we do an AT address translation operation, the page table walk
> is supposed to be performed in the context of the EL we're doing the
> walk for, so for instance an AT S1E2R walk is done for EL2.  In the
> pseudocode an EL is passed to AArch64.AT(), which calls
> SecurityStateAtEL() to find the security state that we should be
> doing the walk with.
> 
> In ats_write64() we get this wrong, instead using the current
> security space always.  This is fine for AT operations performed from
> EL1 and EL2, because there the current security state and the
> security state for the lower EL are the same.  But for AT operations
> performed from EL3, the current security state is always either
> Secure or Root, whereas we want to use the security state defined by
> SCR_EL3.{NS,NSE} for the walk. This affects not just guests using
> FEAT_RME but also ones where EL3 is Secure state and the EL3 code
> is trying to do an AT for a NonSecure EL2 or EL1.
> 
> Use arm_security_space_below_el3() to get the SecuritySpace to
> pass to do_ats_write() for all AT operations except the
> AT S1E3* operations.
> 
> Cc:qemu-stable@nongnu.org
> Fixes: e1ee56ec2383 ("target/arm: Pass security space rather than flag for AT instructions")
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/2250
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I guess most people don't run guest code at EL3 that does AT ops...
> 
>   target/arm/helper.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
