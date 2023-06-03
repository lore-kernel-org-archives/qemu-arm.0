Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1602895ejb;
        Fri, 2 Jun 2023 22:36:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ54kK1kvEqMi39CoDsbscAQA7O1ArMYMUQJXnorRWJExO2bOzRMH8d/pyNYTYB5l/xWySxe
X-Received: by 2002:a05:622a:1a15:b0:3f8:1d58:bfab with SMTP id f21-20020a05622a1a1500b003f81d58bfabmr506081qtb.20.1685770599821;
        Fri, 02 Jun 2023 22:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685770599; cv=none;
        d=google.com; s=arc-20160816;
        b=ovzl26uxym8EiW83J4Iyww5pRiBpZoH8bxmRrTGDiVEV/9PPGMkzarsKpXCebxbS3V
         BLx5mpV1x5d+CUy6zPvQf14fExg4pk4YxXue7TvxlJOwS2v/32zTFjBqmnICoZwvr0af
         /+6k+5NeZUFUstYjH0/XkLz+DT7JqGjsOyutdF36go8AW07dr4asgMKXWCfbe4bInhUs
         gUB/Z6lKL9EwFidcrhRc/OQWZUCICScKyIjpOb/+gUcjTM/94PLPZMC6zBWyqYQi9CIu
         AcCA1RSw+phDGk/QRYCtUZ214hToXJZmcYeIRbct5l56V2JHBgXxLVFWvOpWEt7JK+Sf
         DoMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=VN7IOryTl8esie3w7ONq6wgeerlf7CFA9U6TT4EyU04=;
        b=dE+m6ei3/y8IOmw2h1pym6oBp3HjDFJWT/pIHzFRuTUhkN9qgUlG1JIn8036ynLJdy
         WsnEwTeu7Lpknvx7xjrK7wKho6tOIHu6U2xkIhkTxbdMc3+4ukfEcz4ldrClRMiFx+tw
         LPsZ9ugW8C874fPtFCaUlnVPR+fxj2EyLlA3WKrMGayPzotR4H2vO33VIKvZv20eMZi9
         9mhgO1nbX5QrMSy9LmvGIGRH34H8+8nkcIHltjUD1UHzTQiwqTDKjKap/h/OVQvKpzKm
         K8AVIoB5ivoZRFQ6Vg3qN5uk5GZouFEXeNSJkHIEcFQg8ovZwIxH4VAv6cAt82BrQJAu
         mZcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WdkJ/P3x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20-20020a05622a019400b003f696427a31si1890387qtw.335.2023.06.02.22.36.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 22:36:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WdkJ/P3x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5Jvr-0007Gd-4x; Sat, 03 Jun 2023 01:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5Jvn-0007G9-Rj
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 01:36:05 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5Jvk-0004LN-3l
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 01:36:02 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1b0236ee816so22074535ad.1
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 22:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685770557; x=1688362557;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VN7IOryTl8esie3w7ONq6wgeerlf7CFA9U6TT4EyU04=;
 b=WdkJ/P3xdzIPu6DPDLjZa/pTXjGWouv+AocsW0TRZIbd2pV6siFjnVzru/qF1b0pvf
 N0pA+zQAoZJmfyMdZoU/x9EXdua3Xg7qkZHEZXEHkbRUh/K+AJbOJHdeONZ9mwJFbdWk
 bqnEMp8PG4M8rj2u9iaJres6NHp2MJFWMrxJKU9Bm/0TZTxdU7TfHqAzGkE6gXKK1iFF
 oIE/xfBrlS1gDeFzY7BckeZ79ef1S4cmtGvmEPL0W7kytG4cn5cG1SmH2EoV4uO8l7bD
 292t9GXIj1Biz8P1VwrPT5hD0/l/oqkEwg4SwxO4m/5dGJDQiBuu76OyUAu7YrNzljCF
 TH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685770557; x=1688362557;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VN7IOryTl8esie3w7ONq6wgeerlf7CFA9U6TT4EyU04=;
 b=cuykpICyEfUeybuI5wq9Ttk65iNtsFSyTtHsCIYinddS9qwiTbhM2bW2uyQkpYkgOG
 KxxKxFOY5zqW/GxZKH1YwqzqB2lDOVaWywc483JQWT6WpP/v3TCytTgLSMmAX/eqs/0P
 km2G14NxnoLMzI12X9MgIgHKJK5Wn3I7wbACGKSZ0OFiabilr9TC7Xp3D5tddomC8WO3
 hwNp9UGyr6iPhoMx8WLUkGbWsU/eGy07EluWzkR4vLfWTaVFDwerjD3gwoBeuAL2nso7
 kLSSB74krUOS4fpffRUESyRseCeTImYj0LTBpimDVQzxh1Wwtf0DZjghcw5ZUilktm7E
 JflQ==
X-Gm-Message-State: AC+VfDzYsrcpJic8zxVGboVN+ONs71NYWXa7wnDnq/frDca3OdTlT9hm
 zBJhRFJ72U9hOkumWYKQGOcaag==
X-Received: by 2002:a17:903:1209:b0:1af:e302:123 with SMTP id
 l9-20020a170903120900b001afe3020123mr1974570plh.3.1685770556713; 
 Fri, 02 Jun 2023 22:35:56 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:66a6:82c2:d794:68f6?
 ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 ix22-20020a170902f81600b001a943c41c37sm2311754plb.7.2023.06.02.22.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 22:35:56 -0700 (PDT)
Message-ID: <ea2a4436-61f8-69aa-6b1a-d6b64c72eae4@linaro.org>
Date: Fri, 2 Jun 2023 22:35:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/20] target/arm: Fix return value from LDSMIN/LDSMAX
 8/16 bit atomics
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-2-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: DDHb5nf7bY72

On 6/2/23 08:52, Peter Maydell wrote:
> The atomic memory operations are supposed to return the old memory
> data value in the destination register.  This value is not
> sign-extended, even if the operation is the signed minimum or
> maximum.  (In the pseudocode for the instructions the returned data
> value is passed to ZeroExtend() to create the value in the register.)
> 
> We got this wrong because we were doing a 32-to-64 zero extend on the
> result for 8 and 16 bit data values, rather than the correct amount
> of zero extension.
> 
> Fix the bug by using ext8u and ext16u for the MO_8 and MO_16 data
> sizes rather than ext32u.
> 
> Cc:qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
