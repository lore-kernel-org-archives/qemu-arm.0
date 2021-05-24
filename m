Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3580342lfm;
        Mon, 24 May 2021 06:55:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn+RdPHor8pW1U5E7719MkBH7nyyLZdIIMePVi7dStuvZ7D6Oiq1dkHfCjkCwIfTH6wdyz
X-Received: by 2002:a92:c046:: with SMTP id o6mr15983086ilf.296.1621864545492;
        Mon, 24 May 2021 06:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621864545; cv=none;
        d=google.com; s=arc-20160816;
        b=y2acFY8V23nYi0RxZo0D9AsK6IyCXdAQqc6MMtlNufUL6YsMEBPNVh4LjBcPd3rLta
         0vVOnlT/cRQTl+7JQTsONOQMG93i3G9UkqL2I2sDM4VWnk1XuYcjXH0+8iNEByMWzMK2
         x/S9GvaOxI232U43XaUPtLjWTboWZNLtOg+9cz5sb101QYM5lsWgWPlamAd8LfgPMqMk
         jJB1wy9SCiqZ5iZCYnMJ8cgKePBl/Cd2TAjYUBhn5l0aNC8nvtkwXRlwBYXGaUpsmv5U
         9YnAfq38DWSBzUFw82ObBZD6ckJsWU3ZhrN642X6b1/xquRyBHzri2UZPbNPVcvLNeSa
         Wbjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=m4x/folklImijuhs/eH16sRjsuad38nJbmaXMH5O3/Y=;
        b=JVe474swS4BGoOdDcehyCvWbfGziOymjTEgDiht5wlqktb/ijw3Ltm34882AVtrQaz
         V6fYLhNsvRgXtwBZAfpew/Q+WmL9ZpI17tMtFmVGGbTuDBt+d2amIyBe2FNh6n3PoCjw
         DNtEfqMj8aIbtM3OyQOqOETSY7l2U/ikzoBWcK7/C8bOyQY81DB8JmWs09odNainCWZr
         DqQq7vicy0lQD3MpQBAhvnwV3hAPBAe4f4KOiG3HMwl7pqGnYbRVrG/MWXiZEQq+uOsQ
         Rlev1Z0fm31wTWWEv0b/VvtJpmyh7hnCX8OnkXeKLi6otIZd9CYhwQG4a16t6veuFhWi
         kyJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d6VCHS4l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10si1020211jaf.62.2021.05.24.06.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 06:55:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d6VCHS4l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llB3Y-0000q8-Sw
	for alex.bennee@linaro.org; Mon, 24 May 2021 09:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llB3L-0000mD-N1
 for qemu-arm@nongnu.org; Mon, 24 May 2021 09:55:31 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llB3J-00078P-Ng
 for qemu-arm@nongnu.org; Mon, 24 May 2021 09:55:31 -0400
Received: by mail-pg1-x529.google.com with SMTP id i5so20182907pgm.0
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 06:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m4x/folklImijuhs/eH16sRjsuad38nJbmaXMH5O3/Y=;
 b=d6VCHS4lHyC8k+wrJmI6ewVDhDxJOZZjGbao7tjf7lwrA5bFmky+2jmQ50jwISRu30
 NSwqxQdVTr0dgggZDGPQe9pyoLEnZuXTwrgweaecU5SxSv6MBJIWd+rAuGlc7tMGO/Ki
 e6jBDPYucfyE0y2RaWYpkLHR3FB5Odioa9dD2Em0jVaT+S17vP0C77jnKhVWFetEx5Lp
 +DkY5Xj61Eh1FGQgmDjJrsvt+In6aCwvZh4V+Y+01RNS30dqpkSgXhkrrcQ8UkEMH+E5
 P8ExCO6IUlt6HbDmANf1JzQ8S3ASBkjl5c016xFcGkFEXgZxJ7eqVSC22aXHzUN4nqGe
 ILkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m4x/folklImijuhs/eH16sRjsuad38nJbmaXMH5O3/Y=;
 b=NzJvgoavocYnrGpof0VbC/2waeTPudayXQzINJgRdPwKLxldYm74r6QgHYN3zTqgJ3
 b31BPYJQHBTFyxFXm0p6pih4jus7cHqsJPxy2MfK3vV9qSvVXaowEXKuDKVqi7IOonRD
 POFFQ3zwb5VbrGyEmJNeOCdPZza5fN7Y/uUdJbduv5i0noLNCDfQwfGvoOwMSokvF52a
 rN0hcnCj2OXKRJ8xe2swSdcqlBoWTsEn1igRtsQUzdEjjUVgoj5/YR55+BRriv1/k2oO
 C+mvfV3UuKxqPUWO+GXilo1DSsOKg58n9CdGr+qg/M7FmH5f8vk1mRBIu+qsGZUUlu6h
 ineQ==
X-Gm-Message-State: AOAM533iMDYdGBiFYi6pW6giM0VRLKgozGd1MrFT5wEwUNlfXsPbLoSL
 ww/i14foXekPqgFEhEWbxJHNWw==
X-Received: by 2002:a63:1608:: with SMTP id w8mr13487127pgl.259.1621864528076; 
 Mon, 24 May 2021 06:55:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 q12sm8986975pfg.48.2021.05.24.06.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 06:55:27 -0700 (PDT)
Subject: Re: [PATCH 4/6] hw/arm/armsse: Convert armsse_realize() to use
 ERRP_GUARD
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210510190844.17799-1-peter.maydell@linaro.org>
 <20210510190844.17799-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e5b3e07-b85d-5c87-8f67-5a62a924527b@linaro.org>
Date: Mon, 24 May 2021 06:55:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510190844.17799-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Devaraj Ranganna <devaraj.ranganna@linaro.org>,
 Kumar Gala <kumar.gala@linaro.org>, Kevin Townsend <kevin.townsend@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Crt+2C5nYziU

On 5/10/21 12:08 PM, Peter Maydell wrote:
> Convert armsse_realize() to use ERRP_GUARD(), following
> the rules in include/qapi/error.h.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> We'll be adding a new error check in the next patch, so
> do this first to avoid adding more uses of legacy
> error_propagate().
> ---
>   hw/arm/armsse.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
