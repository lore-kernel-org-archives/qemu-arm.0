Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1209065lfm;
        Wed, 17 Jun 2020 20:05:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK7oM5orWs/ls3L4hpKoZU72HKeiV2uqC2zke0SnMnX8QUr1u0vbirqUUnktrGnOm6xs+O
X-Received: by 2002:a25:570b:: with SMTP id l11mr3308769ybb.246.1592449515458;
        Wed, 17 Jun 2020 20:05:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592449515; cv=none;
        d=google.com; s=arc-20160816;
        b=UPetBz16HH8MlKaE4AM2m5aNxHFzleuGigrrdttsnqTl1+2tVUfzUgj5GL9d5w4emZ
         DosCf8fwf5+x8pc1DyvqG0Dtt8Zqdu69vNaoz7zKOIqAmiQ8vDGvsrs29WsMBeV66ijC
         EAXdd6xGoz5jt2XQ1nMKNM+bY1PZY7V1NkDfygEq4E1Hu/gOMSzzyjSuCtHkR5VDRM1D
         fEuuKswlJuskJ4ly5D0EhzcinqYlcv2awEYpQ49C6pvwOu3+MGrGaGwc0HF/5Em5YIoY
         cf972g2heAv7ctNPJ9rRAxq2RgvOVKuLUP5sI7PFs6RKf2nHuhXK9fDR1LrIK7rR+zKW
         H60A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XCVqd1ufSw2SUGilKve+IqRASg+Co0CGH9ys0/r8bJE=;
        b=LRBAOfSaBeBiMEYgLj/6TCuef7BFh5V0OejqTMq6QIAewk+iUVEmc0e/Z8zVm05sdM
         l3wZ9PoumB88caPVsioiEVrlJgg8PQLmRui8j3pcMBgLw2KYScGawWTYIfFLFpbvx8eF
         hG8Os8/7sslarD3IStiP2hmSdZHdXokqvRcFhy0nHaqb8WgmFaRK2O3+ndkM1ZmXvKgU
         NjAF2PdIe9j4EBvRhn6YrzuPhOA7yEsUL5ejSEu3BRsgij1uHkOvjA/p/8u0gXiFk4EK
         UTPU+kplBYr5NG0uCYRMXe55Cn7X0vyERNWxIFHIo2wug46YlyDVYF8GYmhCCTCLi2+6
         Ndiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oOBT9ejr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p127si1235455ybc.191.2020.06.17.20.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 20:05:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oOBT9ejr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlkra-0001aK-Qs
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 23:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlkrT-0001ZW-Kb
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 23:05:07 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:36730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlkrQ-00062V-He
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 23:05:07 -0400
Received: by mail-pj1-x1041.google.com with SMTP id h22so2004487pjf.1
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 20:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XCVqd1ufSw2SUGilKve+IqRASg+Co0CGH9ys0/r8bJE=;
 b=oOBT9ejrZhHU5MI2B73atvx0ZLHQcxNtV7ND5Z+4KQtkQKqF2kYCJV8+JJ+/TvY7aj
 Zyg7IVHfqYbwiHh0f31svLcIX9s42AAUO8FsVPJbCGkEt8K4yVaclsl9Cj+MGS6OYN3X
 tfYpjTeSPhKHw3GtvwQVo7Nppka0k0MWXNJQVKdoq/2GiDHqWIYlxOtdnQGRvYHkwxv6
 vH4p/FWZCBXSkI/16EtFVCZMU76EuvOU18N4/u74Q9kYCshSf5eD63NMK8YXBgYDwbil
 uY+MkV1lhp0WEOYJH1A6qfpRPLVfPgisH0j49/6JexaEi0sgLDHqgF4EN/wFsHXFGYFT
 WYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XCVqd1ufSw2SUGilKve+IqRASg+Co0CGH9ys0/r8bJE=;
 b=ADfdXVsy+PxfS+KLATqWkPtnHGHda+WDa/RbV3Ow5ARIj2BEw1O+km1i54JWSscQP+
 V1hQ82h6xPVQvaPTGHOKvsgFJlsT8u/jpW09JnJqwMvoDRtTMb5/CR0tRl/aXQ5Cdf4H
 hk9tiQWTiGc1Nw9BkLcUUSwBvVgac7CXgNBW7cnITrvtc9iWNFfKUwKR3mclQLtOZ5Nv
 blHwqUC9HGoappsoMsN8TaNX7fogj+Asdoti6m669izbl+Loo37oRuDsb+EHMaeU++5q
 lFMrxzZ+tryL/buGvw1tRNV0dHZVCHMyTYDPhkP9DbbvQeYO7f3PlP59Y/KXrTfi2o5z
 asYw==
X-Gm-Message-State: AOAM5301MnnM/YRmdWSYC9kW3QBcf3XQxL7Dre3FM1+J1BE2UUsKNLyx
 2bROwafHw/AAEuMXbuKFt77AUA==
X-Received: by 2002:a17:90a:e506:: with SMTP id
 t6mr2183686pjy.35.1592449502735; 
 Wed, 17 Jun 2020 20:05:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d25sm1016891pgn.2.2020.06.17.20.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2020 20:05:01 -0700 (PDT)
Subject: Re: [PATCH RFC v2] target/arm: Implement SVE2 bitwise shift immediate
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200430194159.24064-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <42119585-96b2-9dfe-01cf-05b85d76434d@linaro.org>
Date: Wed, 17 Jun 2020 20:04:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200430194159.24064-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CL+bFM8ep2Uw

On 4/30/20 12:41 PM, Stephen Long wrote:
> Implements SQSHL/UQSHL, SRSHR/URSHR, and SQSHLU
> 
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> ---

Thanks, queued.


r~
