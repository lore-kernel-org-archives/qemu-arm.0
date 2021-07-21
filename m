Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp6162934lfc;
        Wed, 21 Jul 2021 15:25:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvxjgo+dvNVDyTi5nArbUseduoj1wPf8QKucvBXaIXuDPi2hJSNpGPTQae7BBlmMT9gS9N
X-Received: by 2002:a25:bc0e:: with SMTP id i14mr48938853ybh.324.1626906303653;
        Wed, 21 Jul 2021 15:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626906303; cv=none;
        d=google.com; s=arc-20160816;
        b=pCBOiywARugoeqdyJwYjw+DS4/Od/rj63b3lzVzx0S+zqhJWzFZzyj2hLPGFsiVWUy
         3nJ+MSjiu1A9J5tThIEkrMwNOPEeNn0GTRByUQAEsY349hHn94UdOXjOrzj/uGSZjYm5
         7se35aCcXj1Vug1vafzlYybQJsJQObiFn3beRI2eVT9AotwjOhgJNWw+Npoj3ffZkjeX
         rRF5WfE357daFL+x1J6yD4SF1dBlGrHD+uYNWo1TD7nFIl+AZn0k4Jh2PkhagPkZTzPf
         Z1y4S9fQqwUah2mz6v77SwQC8Wj0JzmMVHPdyUgVac8t+iOKnRBqHq6F4z9M9c8ENnf3
         SdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=I3uypPBUs/K+OQ1oU8Jaf0GwcXteSNP/AhJhrlwFnzE=;
        b=0vYoUC4lFYqCIpFV+mBST+REdcZaXuNCtWAn6uD/Wh02W1/DzDOPEUk6wAZHJEwbVY
         BXCWXvsBXWV0enzJ6vkpkCwngWq0tqjRy3DswJ4hW5PYD5/FGIQMVm4CGvMxDnHZQQaT
         jgQ2XEHh4+nUsQudIElmC85DnuASL3EdpmcxgGEYSm3JngJO9W8ygkmCnU5OTkqfCLzW
         Mjw0620VKHEmdQYmKXXGQSj58eCA2vq8ssjTk8sGvNYcIy749i+XHvxBFHS/q7cWjPEp
         z4AAWmNoxpHbddk/20xASTgHllwbnL354GIIYs9wMtPPmUoFfcsBX84Zpwhy67dL2kMA
         a6mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CLZUVyFl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5si26886721yba.438.2021.07.21.15.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jul 2021 15:25:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CLZUVyFl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6KeF-0003Mc-06
	for alex.bennee@linaro.org; Wed, 21 Jul 2021 18:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6Ke3-0003M0-2b
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 18:24:51 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:44927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6Ke1-0003YP-3y
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 18:24:50 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so2731608pjo.3
 for <qemu-arm@nongnu.org>; Wed, 21 Jul 2021 15:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=I3uypPBUs/K+OQ1oU8Jaf0GwcXteSNP/AhJhrlwFnzE=;
 b=CLZUVyFlXUbjqzkVJI5+3jke4kAxs4hZqSwMYyNoPsBKGbETC5ViHruqxGIHGMIH4v
 N18HLlEQDdWxMlWnYM3A+HsV/pQP7rksmBB8oOdFJsxy4dYlZsUHYzxJNvLE4hNC/8JJ
 2ygsowP5HcriMXkBIEFxxTKr4VfwkmhTwnwgeyxnjDRTNVpXtpwfa8re5KxaBsGXSBqq
 ljDB8IWz9TQNVzzviYLN8k7/0F1iXuqN/6vCOgII3DPtKPs6w8QBUHpSeNpV1Dyqda42
 ZLKgUgiv41YKcUHwnDUcsD1JKwYrRn1GpjhLS3ttVOxYjOfmM1ciaPb9iE26iNsgSzsm
 5M4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I3uypPBUs/K+OQ1oU8Jaf0GwcXteSNP/AhJhrlwFnzE=;
 b=RcEPvH6XvG6vdG5TiT1FYOs76ADEwCRN+aQ7WTnkzn8P5Sx86xbFeBrnk39Ou7f3Sk
 MNJutos/MWjKuAKVyGq9mKi4De6aUxr15hTAGgauRTWGoyx+moxzIa5Q+1VIUT+48juy
 zx7Lgyd4U5l35dfP5EpcNX4eH2v2m+Y2s8y9G5jlpkJzNF4fOiQPN7B1e0iRVqUzgn2F
 trBH91tgVF5jr7UA0/5EcGkwjPuppWiqHjDLxvbUXPI8jmgoca8HuA8HkrSDnw/0HM4Y
 UNU0BS4MDhavRLv8xTndfczpme9fWUMlhoxKOTNa+AFD6glqk3y9VpHK/r3luw6EPPp/
 N3xg==
X-Gm-Message-State: AOAM5304Edq8vyGkIBJ3cFVn8YCmOaFFVeHpQkvnPzcZjEZ+Wgi/lrHp
 ySs5CtP3aDLBsytCHTPpFE9wxA==
X-Received: by 2002:a17:90a:7484:: with SMTP id
 p4mr36244957pjk.40.1626906287415; 
 Wed, 21 Jul 2021 15:24:47 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id 78sm19702710pfw.189.2021.07.21.15.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:24:47 -0700 (PDT)
Subject: Re: [PATCH for-6.2 30/34] target/arm: Implement MVE VPNOT
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-31-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <26e71538-8f8e-401c-c0f0-f8164275b227@linaro.org>
Date: Wed, 21 Jul 2021 12:24:44 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-31-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
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
X-TUID: 0M/5QDjJCJMK

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE VPNOT insn, which inverts the bits in VPR.P0
> (subject to both predication and to beatwise execution).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  1 +
>   target/arm/mve.decode      |  1 +
>   target/arm/mve_helper.c    | 17 +++++++++++++++++
>   target/arm/translate-mve.c | 19 +++++++++++++++++++
>   4 files changed, 38 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
