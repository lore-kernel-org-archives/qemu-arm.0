Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1451104lfc;
        Fri, 16 Jul 2021 09:30:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDidcsSJgbgu1NuCnuWbJhnZx8405xqX2SI56x51Z8rX7EULb6e2aHKWdoUBLYM9BIC0FJ
X-Received: by 2002:ab0:6486:: with SMTP id p6mr14524349uam.5.1626453020229;
        Fri, 16 Jul 2021 09:30:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626453020; cv=none;
        d=google.com; s=arc-20160816;
        b=gZ9aGI1OFWYBizKENhAdTtSz/41e+O8zBdWtgbz9e/liDaREQg0GV/8jOr2h6BwNWQ
         Gwtg8/yeVao00WDdSqowfk1+UNxmhR+njA5msTP873BbF2hd5a+Z819Hh/5NMTxUXaDD
         nmEnQyEkMAo+QY5bl+jsX6c3hl4BNTzcw+kCfOMYmTeui5I2uE5o6skEdaI3od5CEry1
         yHNuk3mfiukyAm3Nl2gVS6o6/bx5xuINmA9luzn9XeErh2aZRytH93F8yDd2S5Ea4ZJ9
         0meV+8kB0MR9hWwMQOiMTRfXsFBBlk6j5PnnC+dbMtzJXtwCwzQS5bVz8ujQW0cUmLwa
         H0jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nz6GLT1S5L2KFeboK4KPSNELzhbgKvuuamaB+ASn5Mo=;
        b=sRluDViC2ZFXkH4Qj/aYXGvyqfCkJyMtAf+h87MgYTcpL+T/B8G4653XeXkc4G6/FE
         a57FVgdfea+MPPfWD65Ivki5fyVSibhEfXKcql6su1ki2FO4n0kz5SpniYOAsYgGvObw
         Ejml5SVZWJmZTrycFDLAF52RQmqIzTyKFx2UKg2Ucr3ECTUM+W9TyiqLaObU4GkVS54S
         HvW5b8mkYXLlRghlNy8nom59wNse4AAi/BeMvoIlm0BcIp819HgklobjVs+9V4TBRjqh
         gymqvjQrs8tBurD+A5tvnwvPdrLwUFF1dfGxL7fPTqSmavMqSwG0dt3kWlDB3aGpqknv
         kA4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VS8bRFZx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5si9647492vkg.0.2021.07.16.09.30.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 09:30:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VS8bRFZx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4QjD-0001Uf-IC
	for alex.bennee@linaro.org; Fri, 16 Jul 2021 12:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qic-0001UN-RG
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 12:29:42 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qia-0004ak-Rj
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 12:29:42 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso7818743pjx.1
 for <qemu-arm@nongnu.org>; Fri, 16 Jul 2021 09:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=nz6GLT1S5L2KFeboK4KPSNELzhbgKvuuamaB+ASn5Mo=;
 b=VS8bRFZxvCMpBFK66x3uldrXIlHR9PBwFRKAnF/yPl/FeUJpFY+loKQF4lm21O7UqH
 87+slxaH5m+Q28HXpiHbtxMggmChde23CY4eN+bxRJfNday+AvP3MRzrHVvtCDBM1snU
 mXi4RX/ROfnvCG/5JlN7XTah1OGXJdqNQINc7S8qv+PrIxwYd/+0HALvUD4ajShOB3YD
 X7min44kHfPEizrYgLi1DJceDsSIKjx0iUy/diOwZ+X5otj0z9g5M1uvkHHedRC3Nphp
 eX90C7O5OV9nGueg7ysv+EAUSB+slfrtHQTcWFp3Bv+ebn6eavbZ++x543M3fGpb4JQ1
 YSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nz6GLT1S5L2KFeboK4KPSNELzhbgKvuuamaB+ASn5Mo=;
 b=Hoe2JtSaX8cEm632fsRxDYo7dPBkmOU9eRPg6lYbQsv4qUs+1ATZ3S+SuvphI0wWeC
 zPBxSLciZ2Ht1GPxfDW07Z/2VeMr3KYRI+f7y4/CJwqIpRN5+R/Njab+TC3oUkRSsjKz
 0WwueeXjgqnIS/KQCVkYU7rmmHsYgTodbSWjLNp8/WKeArGDfCqnRHlgUjBuGMzcXwws
 whNXaJ32VfY3aTrFfnFn94WIrUXTmSFmW/CfdK7gqPSsglMHdLDxUSqWqLWrxNxsOXMa
 B4EIx3eRie8/8bjpZkKeYmOxv+MBKtVg3Z0559H6ZEKpI2JG7GyPumWUI5hCeBED90y9
 ruWQ==
X-Gm-Message-State: AOAM533EyAUGvYOd+Y7Mi1MoGoA3Czmss1Ce4ciLwQzGHDWG6JnmWmBY
 an3gtnEhLowI7QfnmvdehRLCKzl8vYf+kA==
X-Received: by 2002:a17:90b:fd6:: with SMTP id
 gd22mr16550360pjb.37.1626452979676; 
 Fri, 16 Jul 2021 09:29:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id i13sm1990127pfr.79.2021.07.16.09.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:29:38 -0700 (PDT)
Subject: Re: [PATCH for-6.2 05/34] target/arm: Fix mask handling for MVE
 narrowing operations
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5fd384a2-1fd0-42b2-6adf-14ace864629f@linaro.org>
Date: Fri, 16 Jul 2021 09:29:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: V08g/Y+2hUeq

On 7/13/21 6:36 AM, Peter Maydell wrote:
> In the MVE helpers for the narrowing operations (DO_VSHRN and
> DO_VSHRN_SAT) we were using the wrong bits of the predicate mask for
> the 'top' versions of the insn.  This is because the loop works over
> the double-sized input elements and shifts the predicate mask by that
> many bits each time, but when we write out the half-sized output we
> must look at the mask bits for whichever half of the element we are
> writing to.
> 
> Correct this by shifting the whole mask right by ESIZE bits for the
> 'top' insns.  This allows us also to simplify the saturation bit
> checking (where we had noticed that we needed to look at a different
> mask bit for the 'top' insn.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve_helper.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
