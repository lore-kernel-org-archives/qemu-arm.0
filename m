Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp6154937lfc;
        Wed, 21 Jul 2021 15:09:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpqtMLuUeiPpRR8uii9Cf9bbkv+deb6CgqsMlaqwQ1fWOMAriwIOKdhQt60LP61fgILIhs
X-Received: by 2002:a67:6981:: with SMTP id e123mr36717356vsc.50.1626905382856;
        Wed, 21 Jul 2021 15:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626905382; cv=none;
        d=google.com; s=arc-20160816;
        b=myw8KDuzxkSVMxaIpB9bHBPjvqFW03IJFZjbZhzuE2gbD6GEsxzzMTaflE1d471Sjy
         p+YJAF/ZpBORXd3F/9N8C0JNoGsOLK0T/O8FCelXOPsHZuTIu2sIWAbJ6dTGI3uQ3Fdo
         qRyZkD8WgiOGcD4nwigluXAE9Qk7O2zmvuVdBOYMFb8OAeZgqFB27jXxy5QzKZwpvJCd
         2z827MqpNHE6LvADAAub3Uit2OQI8YIdYP7wInMYSNfvFUVXHAENGsMLgjB6O8KKvdzR
         OIXNutBxYA85l7RDhagwBLjfr25/IVVsSC71DRPzKed4SUhR/pBJ2Qtu1X6cmBmq83sF
         tKeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=na2YML8227GJUUltjCtJHP1HfSO+morclkqyZm8Ep1A=;
        b=f4dvbnnB73G+5SbZ84ekIIMZEr3b43nkKrabdb7S2na71zUIThlDGxnG+SYSTHtI3l
         Lzk/kush7jIULniCxcvs80bNL353hvAX9PeDC8ikoScHQoTr9at57gQjCbTuv/cRLoWq
         2vL3PTTtup1fZABM1UT1uSP5rlf8/ttVnOYndKXvXF6M/OTSKsGXEbVOSLiqaOZuygqQ
         Prj8TtOyiL5MuWshDoLyHJ+H4bDBCCBTRA0z+xoayEyuq0kxxkfPW023tYPBk1/P8W9q
         e4YE1tD+tOed2Tw0VQJwmZUiPXFs5YyQ4ZyCMWX7+/bwEWrQ4Hl1ZdN/azyn5/gEB80R
         SZpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yRcvlpVR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b29si12471404vsj.184.2021.07.21.15.09.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jul 2021 15:09:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yRcvlpVR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6KPO-0004Uj-6U
	for alex.bennee@linaro.org; Wed, 21 Jul 2021 18:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KPB-0004Te-Bw
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 18:09:29 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KP9-0001rx-QI
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 18:09:29 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so1391066pjb.0
 for <qemu-arm@nongnu.org>; Wed, 21 Jul 2021 15:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=na2YML8227GJUUltjCtJHP1HfSO+morclkqyZm8Ep1A=;
 b=yRcvlpVRB1rVgMzRMQSIVp5gXN5OScuBUF1qozkeKQfVbZGjev/ojEEIgPq6CKBvsP
 IRn10wVd3Y9n18t53sO0XAUIREruO0pht2A6Iw064Wmcnz/x6tynlZfMWAeYThvOZVqF
 A0o9yms6pCot3KfV1AKpjF3AEK56Mqms9xl4LOHqQ17VDheOBjgB3zvQ6xNYlB04NWhx
 2J7G6zYjFhYWG3nSiKcjvwsSsUGu9w8qvAJ7/Dg1FwYM3tMTIIGaTVPIjOvvFEprtSjD
 JqtYHvl8bWZ0ufbQnEHvqSRjJAYgzC01RDKPmu3ytqg+chtfrI1mnMWlZkitUYmzRUHJ
 POJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=na2YML8227GJUUltjCtJHP1HfSO+morclkqyZm8Ep1A=;
 b=Y7BHGoXhXY+etg3lgvn1XR9ueFBbtB6RA7sMaFkJXm4RwvU93+GHIRVVvPcedJ7eyx
 E8QY6egZNeIeXRyks2rn3bO1yiyGvnMd6ly0G76faPp/4fDElyDdfEB91g3zu36w4kYb
 H2QI2rcCInI83/5RVC1iQj928rQxSa8Wa9Df0g2wvYsCZk2UCEcnIWlCt0xMk7J1tGB4
 XfqtXz8rl1QKnSxqe/L+dbCiaCKZieRQgM6GfmlvS+LLLOE5tRppezkb7+RcIcNQLTdQ
 jRJp8UY+tFNA+wNBmz6uUIRuDxIIn6rKE9HeObcNC4+TOVc8EHhiMIxlN7XqinYXSD4u
 tYiA==
X-Gm-Message-State: AOAM531RjWJXWi42+vpZgBqHEbegoZnL/YrbpFEvI7qlrQWfVgZjvdmj
 5gj6uybtH9106cUy3NZ+saie7g==
X-Received: by 2002:a63:5952:: with SMTP id j18mr19987722pgm.366.1626905366356; 
 Wed, 21 Jul 2021 15:09:26 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id d6sm29257055pgq.88.2021.07.21.15.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:09:26 -0700 (PDT)
Subject: Re: [PATCH for-6.2 27/34] target/arm: Implement MVE VQABS, VQNEG
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-28-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2dd909f5-0483-c2e8-aec4-925f419b70ca@linaro.org>
Date: Wed, 21 Jul 2021 12:09:23 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-28-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
X-TUID: znWpImEINKRa

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE 1-operand saturating operations VQABS and VQNEG.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  8 ++++++++
>   target/arm/mve.decode      |  3 +++
>   target/arm/mve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 50 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
