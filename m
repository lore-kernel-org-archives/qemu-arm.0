Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4473329ejb;
        Mon, 6 Feb 2023 10:48:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+5LCRVi2ohczZw7zvcE/SgLCcTXCa2w1wvFDEjl6ESCM6P+/qtYeQ+VDp7pYRhRpG8WCdT
X-Received: by 2002:ad4:5dc2:0:b0:56b:f0a4:7b77 with SMTP id m2-20020ad45dc2000000b0056bf0a47b77mr225558qvh.6.1675709333636;
        Mon, 06 Feb 2023 10:48:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675709333; cv=none;
        d=google.com; s=arc-20160816;
        b=E+GixBBefwlma8vlRsiulvTtVm/3v5AC+kJb6kEowGZ+iOO/uYEIFl2iK0VfP7Qs8M
         1SaStnXOm2rnFEch45FgBO4tjjrlt1w3Ib7QZtDzRu20fIGa7hNJKY5XXal7gcv01iJ0
         Ut0CzT8Lgi7pYE/wPJmBUPjY3vQkOINV3jT3CHUd8Khm9yZz3TcxIIZ3PtSPoYS1lkr6
         t0iotBb4mZbpt4Cqdxrlka9Q9ORulOtekhpokhhUR+bYVDINRVRVekQkegFCAX4XPmDv
         /rdKpXpR9b66djSQodpezoqOtFocnNh+KUOfxq6peBHmn+G7QAi+NeWXHjj4EzW0/ETx
         SOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=p1flEmWceucDraALO9IuYQe7kG3zwnYHJvlOPd0gXSo=;
        b=ngv3peoxi9NJ7rDtag1vy2vPZuanhBCuZvy3jvFUTS+bN5OECZMnUmNqMdvnvNUzl0
         z7tvughPSXTB9fC7OW+pRGV5P0TuurZCxKorCznTZD6CrOMMK0tVV/dYQYwgGUZKzM/s
         YONn21zFKHnFRJofDO8LhVR+B1QiD005G9HgEt+iO1+Jw7S3DagwPC+MQM4DbyvEIxOX
         kVrwwPsaXJFvokQdp5DkqyOQt3rTtL5Db+NfFyajU1rurrhmlpIsczXW9nDmmKPMl9bu
         A/LCdK3mCMvZfHLbH7Yi3z9rLW5YukcPPcEcyxieenTbjoFznea+AD3yCcKHX42gr6Bm
         BXCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kL9Fi7Gl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15-20020a05620a290f00b0071e5ed079besi11726530qkp.71.2023.02.06.10.48.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 10:48:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kL9Fi7Gl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP6Xf-0003Hk-G7; Mon, 06 Feb 2023 13:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6Xa-0003AW-Uk
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 13:48:36 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6XZ-0004hb-8W
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 13:48:34 -0500
Received: by mail-pf1-x431.google.com with SMTP id bd15so9078732pfb.8
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 10:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p1flEmWceucDraALO9IuYQe7kG3zwnYHJvlOPd0gXSo=;
 b=kL9Fi7Glt7Yo+WYMr9AdnYNa3wGaUBCJdj1OeTGo6pqCsSbA6ReO0BGrgIKrC+vZZv
 cLGavCXYoxMrz1DowpD64XXIt+N3RSjyQKpiCxo49rzAXd1pcs9KBvDbLN63ZBg+EUjZ
 zGlps9Xsy5peYc1+LRCK+pUTI6Afw15LJ3xKQrtDBCKC7eeH3SENiW2TIQ+nV5US8cqP
 +XAhezfPKlcu+iL2xhi89q2+Z6U5PxPi3cy3DaMcWVj2w+TVjs4NtK/kze+4qiJAqv89
 B5QvAAxWjzzZghKVi60gLhY/2oWhnKHr5I8tI5jsF7xohQZedFFBIygVPe8j3MZgz/V9
 RndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p1flEmWceucDraALO9IuYQe7kG3zwnYHJvlOPd0gXSo=;
 b=bgsxN0SW/5rdYulkxf79yHMM3kQMBOLs7Sim2zakd41l3jAwFpM24/IwMe91m4ipfG
 MDYCFIx6OjwxR359CSeYRpYABJuhfFMU9XRmPsK9hMIfHZOaX55I5GoUbF9aLFpuO6ig
 jsu1+KECFEW5+FWNrpR+d+DmFcziib/IRbQoSBUPbO08zAtJfHgEYYyuyE5mTPmxmNSi
 HTlaqbCE+fHLmbCKSo/d1q2tUd8xlKO56JyBoEp6dHWpLf+JpocibgCCFEia9xoMY9tp
 iub3ONedtVXQ/S89Bj6OjW+YvhkSAjfUl+5nXoD59fmFrhNJsX9WN6CcfvpeEb+4yxht
 rlBQ==
X-Gm-Message-State: AO0yUKXHncxLweWhtTEDY/dFwwQ3PQr6py3Cg2jOcV6f28uUeDFsP1WW
 2H6fyK99Nk6fdNIeLZWaJZA2JA==
X-Received: by 2002:a62:2784:0:b0:593:acbc:94ca with SMTP id
 n126-20020a622784000000b00593acbc94camr311550pfn.33.1675709311529; 
 Mon, 06 Feb 2023 10:48:31 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 u12-20020a056a00098c00b00580a0bb411fsm7657049pfg.174.2023.02.06.10.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:48:31 -0800 (PST)
Message-ID: <8947a8d1-755f-4794-2f96-0361cb2e6e05@linaro.org>
Date: Mon, 6 Feb 2023 08:48:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/9] target/arm: Restrict v7-M MMU helpers to sysemu TCG
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
 <20230206121714.85084-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206121714.85084-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: RWi1mvMqJMKa

On 2/6/23 02:17, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/helper.c   | 2 +-
>   target/arm/m_helper.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

This seems like it would break linux-user with -cpu cortex-m3, which is used for gcc 
testing, iirc.

(Real m-profile can't run linux, but using the same thumb abi makes testing easier than 
using semihosting and initializing a board model.)

OTOH, we should be able to hard-code the mmuidx for user-only:

     mprofile ? ARMMMUIdx_MUser : ARMMMUIdx_E10_0


r~
