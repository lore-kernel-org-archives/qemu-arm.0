Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1844042lfc;
        Fri, 28 Aug 2020 15:55:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN9PFxhv7War12yVba0mAwnBdrAMh8p1Y+ooNdb9B3tPB23ZFWRc0h36GrhT3RrVh6NeUk
X-Received: by 2002:a25:ef4e:: with SMTP id w14mr5460975ybm.225.1598655357667;
        Fri, 28 Aug 2020 15:55:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598655357; cv=none;
        d=google.com; s=arc-20160816;
        b=teDb8mtpSnSddlfkj9urHgPHczE25cCb2IN04ngTnpRZHiX3cwtYUU5XsfB9bqyFMO
         /oFk7lS6x/AFPwkqneHXJauVLA8YM7h9EGQztE/HdwwgRox81J1ABSwdz0VYgjus/Cu4
         dIHTXPljrfddUMQ0Gr27deO+dXyV/y2evJEsoLhBzxWBTnc3hIM+/VzQD6sncsNTP8us
         9rEABLLy9mGeK3mrNviNyqwMKd5c/xy/cWu0QB8MHMxLgWc66cTITfBfC/5Ur55DErT5
         DTDThPt6XVbtFazJ77O19GdXzoo6c67BtyxpWku6jPL6d6kmbbkuTv0PCAKrzO0DKskL
         1Vzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5/dJCa7NOOjUArpr4SFdPAnbTiARGpOJMfas1h2n7iI=;
        b=HEykgHXB2ewGQTNjbwLMrwSSqVSs4e3biWHvt7/w2BJ++SuZRjVQXcYyA+nOVeXQne
         YPIU3tCwKuN+3Z8+AXCb7TdCML0dzo/PISq4h+ZSramvwYBtO77HsRhQ/9xwW1JWVoOJ
         uSwTZA6IKPqIKf/fo7SUGZT/s3EZv7LCyQlUEqvuD8Hsr6R2IWLPgp/EA1Qo3/WmsQ/I
         Kmgo6fk18uPF7XGgePxmKcJvFta4PmlJLDLE17TzcF0ngXGBjN5YlBHdsG+dJHKxl+Bt
         comxYkwOTnCNQ/JE0eNDb3P/x0r9kwoyMyi1DDKeenUdhlbpHK9LjS1qiq1wTYFBwXvR
         yqGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=htOMOnBS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5si563995ybc.111.2020.08.28.15.55.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 15:55:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=htOMOnBS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBnHp-0007oJ-4P
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 18:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnHh-0007m0-V0
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 18:55:49 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:39691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnHf-00035j-Cv
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 18:55:49 -0400
Received: by mail-pj1-x1041.google.com with SMTP id s2so234257pjr.4
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 15:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5/dJCa7NOOjUArpr4SFdPAnbTiARGpOJMfas1h2n7iI=;
 b=htOMOnBS8W2h751uQ13ZSUkVKF77kBO92OHDE49V9r6YFwxnYvWldC4QscUqggtwQq
 ztda5WJHK8sSuV76PTKFIGj+SAMbLOqLEUKjwePkgp2zh37kEJOgeNjCNVTBzHeLDuGo
 byP5fR5Cjp2wnkDJ9tX3YZxWgy8XvM99jcPIafhdcBaxTGaRDgvUeX2XsduHE5iwMjAa
 hAFLkOhgqdsGpk7KBr9Dx+yDWD1OrfePmd1xlt3UAsSajWt0tFJCL1rPDkzOUFPTcrJe
 xbc6IkOf8vDKatcBleLCP1Gy2ni0F0Uc9hgeBqqU0SYhLbI+Pxu3JSDJoUb83WDvKINv
 xrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5/dJCa7NOOjUArpr4SFdPAnbTiARGpOJMfas1h2n7iI=;
 b=Z3RV6cYpkNIgSzpyQGtGhBgP8MkMQrlJLqAdfzRJRfmqR3zDM18f+C6n6Zlc9eRQBQ
 /qpkszA6C9PwptjlsQsi9PoJtRuZ/GAEbwxDeiSTwDfYKGeDWaVzVLiI2Xq8UfCdRI7r
 4s6OyXUQw1qEmKiJqRJYjah8wxAk0/NETOkS4jcNAvYt4AXAy0UsjKlE9EZXZE0RuxU3
 OgLUNrAGjHaxXQOxdEcGzmOs+dxxo/fS/zxxEwrOTj98yCYLmnJzv4O93uOss+FbphUW
 lU9IDOcp7yuFUhQyXCB377OXJ920C1vJlyQBdqvLjcFjSpEEmH8WCV3X3UI9MB97CFQk
 tirg==
X-Gm-Message-State: AOAM533LYG197B5IKImpTFYDi1Il7kI02sSai8OQjBzZ9/WxFhSskkho
 FGsVTSNTPyawB6oIAVLIJcNoMw==
X-Received: by 2002:a17:90b:3197:: with SMTP id
 hc23mr996633pjb.110.1598655345740; 
 Fri, 28 Aug 2020 15:55:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id il14sm319268pjb.10.2020.08.28.15.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 15:55:45 -0700 (PDT)
Subject: Re: [PATCH v2 31/45] target/arm: Implement fp16 for Neon VFMA, VMFS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-32-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bdaf3f21-11af-745d-ebef-cf2d72c58294@linaro.org>
Date: Fri, 28 Aug 2020 15:55:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-32-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-TUID: yatdTQnwMDJU

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the neon floating-point vector operations VFMA and VFMS
> to use a gvec helper, and use this to implement the fp16 case.
> 
> This is the last use of do_3same_fp() so we can now delete
> that function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             |  6 +++
>  target/arm/vec_helper.c         | 33 +++++++++++-
>  target/arm/translate-neon.c.inc | 92 +--------------------------------
>  3 files changed, 40 insertions(+), 91 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

