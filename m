Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3722814lfb;
        Mon, 13 Sep 2021 07:24:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHVNMqhwsOzBjecEyDX9pBi70MewRxITrc6+SpMAF1zuxUUeEj0mSqal84JKmBJSItNEPS
X-Received: by 2002:a05:600c:2f08:: with SMTP id r8mr11563105wmn.86.1631543041683;
        Mon, 13 Sep 2021 07:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631543041; cv=none;
        d=google.com; s=arc-20160816;
        b=DbM1rp/5es6VCbl20X0x1Bo2EfPiawHH5BBfCEoscZhoDC7rpdJ0mePJHqbZY7jnCI
         4RFGfLg0T5QtOa1jJiK9ic3RRP8geF5x60WJEGmZ26HqV0x8Nn+aNnxYW+JiVFH9P7PJ
         Yf96wLksrbJ+Agh7r7Qiu+rZTi35GuxOLFXzxp/uRzWSTNgrAgpO3BmSiVNQeV0/9kFE
         qbrnZD47TA2L1FtEshMMTHlxy5vU7piSBWkxPKbbYf3DD1OR9PLPslNcEaGO3YD9xwKn
         EQ5jvvKSUpxB5/WqvXAcCBZLg18f3FkXIiGbJQQ4n4eoIgjjOyuvOh2CasaQTJS3tTTq
         GfAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=C3U2iNltkBAtK+iMGgBQB0y6DFLI8AXbAnTmRf35R3g=;
        b=KIKKctzJaXj9IeKHgHdrUnG0FUg46X0mflOQaPDbgIoII2ShsTymOQMBDUwiKLrSmt
         lsCSLN0ivzUnMm4HXd8VvhFT4V4pYplnGAuhZr0ssrdNk3Cu5SNHyTAQ1VszLSTFil9h
         Op9gu8AiffN9p0iAmqJa+ynWOciDeTXOiV7RSc32WM73Y1W6ZEzkLraDKwneMiDshVJP
         ZmTfF/RCo0fNFJL2M+rNNXZasDwaX1xuGSByVLZri9pJwxsS8WmU1E6VfEITtoByZG1w
         BPTS0A8U8S/bSqzaKIZ9bDP4OwDsWVsg2qdg40x123CD3x0zWT3nP/XDx30nLbAcDwqc
         P0rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V4Z87v8v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y206si7770548wmc.160.2021.09.13.07.24.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 07:24:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V4Z87v8v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPmsK-0002Yk-NZ
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 10:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPma3-00076R-Vr
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 10:05:08 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:44630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmZo-0002W2-OY
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 10:05:07 -0400
Received: by mail-pg1-x535.google.com with SMTP id s11so9529564pgr.11
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C3U2iNltkBAtK+iMGgBQB0y6DFLI8AXbAnTmRf35R3g=;
 b=V4Z87v8vOTacUsCZ/1O8DKPBLdJMcGth98wQoUTpf93xMwmYnGB+LuaVOhyKaOGXNf
 wFDX/wD7wIvn0f4NTXf+18yfqVcSAMF/1TUoOPm9nrFmwtUHEogx8oxBmEUOUJDnCNcg
 p1JSrMH0Ik2En0ZuX9U4LxBe3idKlTM6w3RLhJD3x4L1pRbd3GAGOXlAziTrUGGITi9b
 wIp7tvmThZzzaNCpqiEKkFeyzbDexZwjQu5+kfSxeEmXBjOEgg4IMsfRcE1BwgWMVkq0
 UAuGC2lmgAiIZuLnUIiOXRm3Z2MLSrAoFOdJNBxvKvtVG7LfsL9gFQ0zK5wKqSuJdrgN
 qNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C3U2iNltkBAtK+iMGgBQB0y6DFLI8AXbAnTmRf35R3g=;
 b=TVxFZv4Tx7/M/1yHG4lRH68YVyw8zUuWgbCXxF8ewMSJARzLDjwgBwRacCK6PRkwxx
 JOTMvEBQWjE2X2Pqwd4R1SAGMzyuUe9vRSPhOsqA5ZVSOSHcDi0Fiby5KF8tBX1mVJc2
 ICtER9gbRDcLwDY8J3Ac8o2+sUwJ1T6DMTase7jbjzMD9U8H9T/sFmj4nG+F4hEGUklC
 tuhuaQNEyJOAP61hYZ85Yh9vpWY6L8d/9emrP6YC9xEFofQqb0MhH6fRH9bArJaYvQhI
 TR28g4EsIn8BP6KhACLcM+FhCeqSQoaDY9TpZyo/v80saeNWF9ASwfJtyPw9Ei+Aja4a
 6kpw==
X-Gm-Message-State: AOAM531B8s6vk8TqeC/TzcrJ0FmDhYc6YnMy/z0/b4L87qoq7JDpI6Gm
 9xOCeSZTsvtsa8mKXKZv1BfjEuI3J5U9DQ==
X-Received: by 2002:a63:5f8f:: with SMTP id
 t137mr11160288pgb.420.1631541890068; 
 Mon, 13 Sep 2021 07:04:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d5sm7477157pfd.142.2021.09.13.07.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 07:04:49 -0700 (PDT)
Subject: Re: [PATCH v2 11/12] target/arm: Optimize MVE VSLI and VSRI
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <11157474-24e7-093e-bf8e-43dee299a333@linaro.org>
Date: Mon, 13 Sep 2021 07:04:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913095440.13462-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XWKqdfbJFUCo

On 9/13/21 2:54 AM, Peter Maydell wrote:
> Optimize the MVE shift-and-insert insns by using TCG
> vector ops when possible.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
