Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp531178lff;
        Fri, 30 Jul 2021 12:59:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKap9JoXhhWo8giFoR4NIMaHTkloBZLnW7GDaZhyYxTMpMiP7+wx3xZhap65ImrSah6jxy
X-Received: by 2002:a25:ac3:: with SMTP id 186mr5672618ybk.436.1627675158687;
        Fri, 30 Jul 2021 12:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627675158; cv=none;
        d=google.com; s=arc-20160816;
        b=GVd9nN1Kbw8WHN1D7eQIsEh836O+Ezn++bRmMzUiDbNC/y/OYlwJyZlUoSPyk+pia+
         f3t3R4fQyl1n9qFZEKca5rswb+Q0ZNI2jUZWZwnw7cTYKBsOBTPgqyovesYnBH9VCYq3
         bzZnL2qIkcQg9XIiQjgos8UgzXOYdm6BY82wfb8yd//scBkLX+4XsZLqLHXgNEqbDqBO
         FgeufytJF1Oa+Bm7xJNOWeYFkgf+ImHCU6r0AQBUPcVtBbEiU13tSYI2H4Qiicw6AAM7
         BfzlIFmBYGvrP2zmMCVL6JnBjKWMm+hY7TFWeksCb52grRr11V/WrBd+F2ZaUQh/sxxm
         ulJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gW3esaDocztJGrj/5IssPeCWTzmXdb7RABQk29oxf+w=;
        b=A+QwWzJSzHae8/qErSidqGXhp4Cu7IAQqYiTbNtgmDBihW2W6idsNiho8XEeKW+Tcg
         x/8cgsBquv/ChPwafLMi1gWgSUj6RlwCSflBjm+u8uOLFpY33JQkD8myU4x4KEa63Cjf
         5XQT5kk5cDlJgVTn6AY/cBGnqxAj/aic4jBR4q8bKcrslK1RIUImoNF6NsMrjwcEaohT
         I1hu8irlW8+M+d7HzeBH0kGiqiK0rrW873rf3c8//V+hFW4E5+eZM8YhZMRK2RSmeqD7
         XKyZKzANLuU6+2rcbtO5GwYtRuVoXPimJ4eVrU+3hUpzrnB2/eiXVRhcSbnSt3yFc/3F
         hfpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZVIun8xi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z88si3459430ybh.76.2021.07.30.12.59.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 12:59:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZVIun8xi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9Yf8-0001h9-4C
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 15:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Yes-0001fl-ME
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:59:02 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Yer-00040b-CY
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:59:02 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so22393393pjb.0
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 12:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=gW3esaDocztJGrj/5IssPeCWTzmXdb7RABQk29oxf+w=;
 b=ZVIun8xiyHOUbEpzQEfYL7cvU+MCMXWvYV2xUJhA5sFP1DMZBnc4FTU+FY/JgdyJpF
 f2/jZ8eDrklaK5Fu7H4SESmJCBDkopC6sS9k0FtQ2dD57Hcpi3wUP5S5f7VT0i8Ud8aC
 rEF3vSbfVfUS32FghdZQ31AvohdLhQxqx51Gu34LsEkI37Tukpjqza+z2IPCarBWmnd1
 O0OPokXw4+V86ipWJhTgR90I6nBkrTjopOML5ahvP6ndsu5prKiprY5wy2XQZ3SlE+4r
 u/2galPEIQVVVbIYPAEh2FCtgBjYTNvhOvGof1sotRkf5P8ndETGSVKZKqjhF7mVDTyl
 WzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gW3esaDocztJGrj/5IssPeCWTzmXdb7RABQk29oxf+w=;
 b=swOktGP/pZbjhTtsRghvRLGi6xRcVxzqyXCftFZ8M3wDc4fifBbBOX6pd9/TJfa6du
 48TSs7ZallIDk+IWCwckCZLVnAxu8S6tha8is8QLv6kPsb9Ox62/l8Qg/2B1r5Fj0CaA
 eqWCs+LRz1MatkRxX3CGjWxH/sK65CUNJotsLn3Nqwu3ZXtjW0ohNJezfqBvMzM22DLD
 lv0libkPeUQyjESzRWoUIaPns6pGDCT8DRvUNXPDNxAplGGjLmHwlFRFWnXNRJ+rBjeh
 AHB4fimfBeD8pGhsGAIhrOy5gsgKP0C/GRg25te6WQCqqxdXoL8642Fe5fF5JtVJqF3s
 v2eQ==
X-Gm-Message-State: AOAM5317iy/ESQLeI+2HoGCfvtfACF67VrJeqKM2bBG9mPqNLqlUZ8pz
 GZ0a6UQaKn5qdhi2NiPSyn6scg==
X-Received: by 2002:a05:6a00:a8a:b029:30c:a10b:3e3f with SMTP id
 b10-20020a056a000a8ab029030ca10b3e3fmr4471558pfl.40.1627675138820; 
 Fri, 30 Jul 2021 12:58:58 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id 26sm3986686pgx.72.2021.07.30.12.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:58:58 -0700 (PDT)
Subject: Re: [PATCH for-6.2 43/53] target/arm: Implement MVE fp-with-scalar
 VFMA, VFMAS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-44-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8a09073-0076-8f8d-20b5-a01f8b6c210f@linaro.org>
Date: Fri, 30 Jul 2021 09:58:55 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-44-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
X-TUID: c83EkUJlJIJO

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE fp-with-scalar VFMA and VFMAS insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  6 ++++++
>   target/arm/mve.decode      | 14 +++++++++++---
>   target/arm/mve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 56 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
