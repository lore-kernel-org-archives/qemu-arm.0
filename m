Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4955444lfb;
        Tue, 27 Apr 2021 09:45:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzg+X7Ur71zZEqLJDGpiKU4o4XTXYNM1FUh/XH/NqW3aMFd+bELOeOQAwmjwda6H9Uh5IBx
X-Received: by 2002:a02:ba19:: with SMTP id z25mr22531504jan.52.1619541941135;
        Tue, 27 Apr 2021 09:45:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619541941; cv=none;
        d=google.com; s=arc-20160816;
        b=E7cZdqpwAIwRgoz/YYhllns+YvRocVDpJVlMsNbpJSW3B+vmqYgP2UXWNpV9rJZBpj
         YCketBIXW0ypatxhgwZO3wy0miS1oBv4jIjZR01H2xE7wEEsNcH7STuwwww9cfzhg0ZM
         T9joDY2q1UWGbB4A8FTy0ZvKCyXmSevmI6hQaUdlGH5K4pNz11c2toaxWhZXc5+inIeC
         oxhMc/4/7FljV6vnB7sa1Eg+pcOseyYofeJ4lq/MOSG6AKLfvYLrxdesawLO/X6+qiSr
         V6Oo46ttwzErJyFb8pIC9ZjDMOVJ4AxhEfqYG27tqCbCvUQNy2CVq3MYHj/KSeaEPwGM
         dytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WpMfbPhLOQscSZoBg+QKpJl3Np9ZqmkvmrxNZaSbj3s=;
        b=Q/Kk1RFsZNtaD89Kl8e2yIdP70peqXu1fDcX3VvpcCSYErM6krWiLd2wfide8PhR8s
         UA6pogAyYc04zxXm3tVGNf/Ek8a0SMz+Lsr/TFZh3LqpKs0OItyTjWpRn/5i3j/QhU9U
         /HIH9ZKql4EEzGrD/HlMKoDPrTNWVvlUqMF3kWY/ahxqw7XHj9ZAWjRyZkfnEiWcPo/g
         +NWfWhXB/U3pyRXmCkcIIesQ53UJAynvKn8hi3G8LjetbVTN77/263rgfMjSaZ9pl7kZ
         As51FViRuM/6CP+WDhifgAWeuS3pEsmJSlQ4rb235xL+w93bSNZTJHgGfKwrjDWEspap
         X4aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZopxJGeL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7si3801497ilm.111.2021.04.27.09.45.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 09:45:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZopxJGeL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbQqC-0003b4-C3
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 12:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQmx-0002kL-Em
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:42:19 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQmv-0004cK-Rc
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:42:19 -0400
Received: by mail-pg1-x52e.google.com with SMTP id b17so5734836pgh.7
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 09:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=WpMfbPhLOQscSZoBg+QKpJl3Np9ZqmkvmrxNZaSbj3s=;
 b=ZopxJGeLbYsyFX/BNNTMWfsQPdOrH6UOvSbbGCF+NLul2wBkS4KaUtDtubd67BbQT2
 1e4Wk1a/NW+7yYwtB9Zb1KMIteUC7bUr4hehnB72tmYnHoTzisRq2hWWmCQzo4IXP9hi
 AhcFFnZsfXfL0NUwzZOrEh3u1axBKufyIBCdTYjYP8x5BNngHNLes88RNgLjOQBKvXFu
 SRqYTGWN0SufcvK0l+UBpRoaCXL56jjq6h/A2UV8xK5J6P1HXI3YahdwpMmrRT1QyxI3
 dT74uYYteGH51wxAD6ldNwrAxubG3ZrJW+MtGMCDVm51zeo2XuQdD1yvMw9Mbsp/65Rj
 NyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WpMfbPhLOQscSZoBg+QKpJl3Np9ZqmkvmrxNZaSbj3s=;
 b=Rs2+mgUJv3ZBsCIe9DhCOufUYm8I6Q5JVbZD6qhmoFX+n9xAXwnGQDDDMDLuLPuTEr
 xo7MbK2JXcP9nAOJ3HU/ZxjN1qVbsQBxqDHGiVq+maMdLTZedGHPj8suHRNSsLsNzm09
 0sBeRO+syuFZtqD1ASbc2XCnf/4CC3avr4MhSNvG1z8kI8zEWNObL1hG7ICr543X/TzN
 eR5ccm71+S6Ub78Y8qTsXKKrtaJMIZwFAXu3H+dwx+HsEBMVz2HkQjfFDeLbkeRO0kVm
 fxvyVM49zjeYPa2t77uRTryPi43Am5joSXgjIYrh05zWXYXAERI58fuQdayPrDQDnSfI
 d5Ww==
X-Gm-Message-State: AOAM532ik0mORrisCxQRCKui078aZWyJH2zqvvJYjYfPhLLZTYsFSCLX
 Q87O71fehNJbx+aYV6yxtoq55xhNkr14Hg==
X-Received: by 2002:a63:d143:: with SMTP id c3mr22169045pgj.99.1619541736223; 
 Tue, 27 Apr 2021 09:42:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id o127sm3101485pfd.147.2021.04.27.09.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 09:42:15 -0700 (PDT)
Subject: Re: [PATCH 03/13] target/arm: Make functions used by m-nocp global
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e40b2ac8-0d85-56c4-32b4-b79f139a51a4@linaro.org>
Date: Tue, 27 Apr 2021 09:42:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: 00adtzBUoyhk

On 4/13/21 9:07 AM, Peter Maydell wrote:
> We want to split out the .c.inc files which are currently included
> into translate.c so they are separate compilation units.  To do this
> we need to make some functions which are currently file-local to
> translate.c have global scope; create a translate-a32.h paralleling
> the existing translate-a64.h as a place for these declarations to
> live, so that code moved into the new compilation units can call
> them.
> 
> The functions made global here are those required by the
> m-nocp.decode functions, except that I have converted the whole
> family of {read,write}_neon_element* and also both the load_cpu and
> store_cpu functions for consistency, even though m-nocp only wants a
> few functions from each.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h     | 57 ++++++++++++++++++++++++++++++++++
>   target/arm/translate.c         | 39 +++++------------------
>   target/arm/translate-vfp.c.inc |  2 +-
>   3 files changed, 65 insertions(+), 33 deletions(-)
>   create mode 100644 target/arm/translate-a32.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
