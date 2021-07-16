Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1473887lfc;
        Fri, 16 Jul 2021 09:59:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMRM6o/PFoirsZptdob+q8h6FgS2CzDy9wDo+klBkSqxyCApKamD/qxNHRJJoJAwcv+AQy
X-Received: by 2002:a37:41c7:: with SMTP id o190mr11022491qka.201.1626454760837;
        Fri, 16 Jul 2021 09:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626454760; cv=none;
        d=google.com; s=arc-20160816;
        b=Dp8ZhfFidZyE3StnQ4RLUj6x+cGowxqQ17sYksduTRiZU+w4GZpsj+3PtMc9NlPttG
         AJAKKMirqXvJiMIA9nXlarlxdRO84v1Tozz6FRykaSWSrjMyKHugxpA/gqwlx50xHqE3
         bL3pEpG7J4Qh12rLkvSBGqqQvOByHtA5RHAry6JmPhLCRA/Y3ngFx0fxKsEfz6cez5Is
         +jx9FEbPROMAQqsFnch87p+u+D+46xaqRUYOToeYK4CIox60AkUbz4qA5TKdyXARWmbC
         VJ4ukxMGpNsSML2BxE4LNjuO17LV7sX/rfoHBD2MV6Ie5As3BYlfmaOJye7q519VoZJH
         Fpdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=85w98ZHdXri9LNUBYklPMhrggvGL2og7RnDkOwo6Goc=;
        b=cMWfax1thmHSDAr2heV+3uPNhTmSywmrlg8wlCZgbnH1WGlPru5WTo4F/ggVyz2/fu
         nmCK3NRo9XRQNkQE+Pb64tj2OpOajRMtPvA2IldESIz568fPgtHoClTXvA8TptmgbDYj
         hohd/5FVtwfYUD6bvpS+7maeJpC2f65PsQ2Qq5lmjMQL4FexACKDG0b9QsyrkrzjLHvU
         T2yvSobc0GVa1DnJIz/A2Hep6Vfc4PD/bBQ6Hsm8wNTszbwu1Z0/UZKycnPR6NMN8JAJ
         0x5eooXjtOdS+fZ/hQWnSY0xRuYAel/dTqaVQkvP5YzF2OnTKgjU42p5X1ujReh4diJB
         CldQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i83cZoA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21si6311750qko.13.2021.07.16.09.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 09:59:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i83cZoA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4RBI-0004lE-54
	for alex.bennee@linaro.org; Fri, 16 Jul 2021 12:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4RAh-0004kN-Vy
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 12:58:45 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4RAg-0007dy-IR
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 12:58:43 -0400
Received: by mail-pg1-x52e.google.com with SMTP id k20so10531804pgg.7
 for <qemu-arm@nongnu.org>; Fri, 16 Jul 2021 09:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=85w98ZHdXri9LNUBYklPMhrggvGL2og7RnDkOwo6Goc=;
 b=i83cZoA62PhL/LhJS1mtzmjvpBqKTVuw+bb99p/7vZeUnUcRS9kjoRxTZUUiT9XnBw
 2lv2s8OSCQ+2gLgFapuwgDH6oRdLLvLy+lm5DklkgtjxpKTI7UxfGi4gMS8h7tSVIqdm
 3ND+gW1MY/lBCbfT78NINPru25+SkB5+xbQmsgQosFKOCq7lxoTuR3n5skyFxGb+uT3Z
 eRIEqVmOq+fxFOnir7bIlwnnvFRvii5dW46h1NOQdq2vm6Lcv62yyeXDt+23cUaipHPq
 /E6J4aw3OPhKAV+3CJaXO6YPHITdms8aVb5KWeYB3qxgvfcGQFdJ/gqr/ATHJBgps7LS
 Vcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=85w98ZHdXri9LNUBYklPMhrggvGL2og7RnDkOwo6Goc=;
 b=f5p6X11+5dRfcGlOlVSdQSHnvn1vv6RB9gliCnrc+Qqn1zJ8rIEhsoSE3CKZUJUl9p
 +qwNyzvHt9Ya0BGBad7Lagy4sB6k4dMgwihWCZ+FiEs7E8rCxOyVO0kRamr7qpNplVvV
 RJRLnpsvIz7MxMWXJ9Xn4jVSinhrjzkNYi2+qbfAdmvyiRo27BhWOrGLJjW9ZhVmR7Xp
 20uXZEC08SVLi3nsNIYSawsLEuTLXSdFbYrDRr2uzaS17kXk6jrl7hT5wX0noLBq2hSE
 dwiZwNqNootVLmFDkDqeWSs3WNCSRjw3fDaVsRifB9/8oHhDz0J7YuwZEvXPyTfPQqyQ
 VOuw==
X-Gm-Message-State: AOAM532RpBwR81DwwRRNz0ky3OnhsQ0CWGv8Wf20Hwu892S+E82DfJXl
 SeD5aAOMmgZWbZmaX1NAUElKng==
X-Received: by 2002:a63:9d46:: with SMTP id i67mr11005231pgd.225.1626454721249; 
 Fri, 16 Jul 2021 09:58:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id e13sm11130985pfd.11.2021.07.16.09.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:58:40 -0700 (PDT)
Subject: Re: [PATCH for-6.2 10/34] target/arm: Fix VLDRB/H/W for predicated
 elements
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9ede02f9-e42d-d4b0-9137-c1ac1e4cec49@linaro.org>
Date: Fri, 16 Jul 2021 09:58:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-11-peter.maydell@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aTVD8wcsugt6

On 7/13/21 6:37 AM, Peter Maydell wrote:
> For vector loads, predicated elements are zeroed, instead of
> retaining their previous values (as happens for most data
> processing operations). This means we need to distinguish
> "beat not executed due to ECI" (don't touch destination
> element) from "beat executed but predicated out" (zero
> destination element).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve_helper.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
