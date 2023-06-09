Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp610890ejb;
        Fri, 9 Jun 2023 12:56:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ECVrlLFDnwMQh2MpetdjRL5lmy+6aTs/E++ryRdNjD49kMKxSAGGWrbtO0r/dXXKW58G+
X-Received: by 2002:a05:620a:8083:b0:75d:8e6c:6c0c with SMTP id ef3-20020a05620a808300b0075d8e6c6c0cmr2468102qkb.48.1686340578150;
        Fri, 09 Jun 2023 12:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686340578; cv=none;
        d=google.com; s=arc-20160816;
        b=YwwDv+fBUGpeRW1epemc8indBNBBX01aBwXCxUhtw1nhbrQIuT/Do7PqIzIuytnwGg
         /2KLbX0HTScN3jLnf5C1/Yx7naBI9Uk8g3YodsyBNNDux2aDQkvTPry5b9R4DqWWlXSd
         TsETwbEXi6ZJKamGn6tF4TqfGwZKe23G0/PIlA1wJHZZw/xX6/JLxGcBV7wmoC94aHBF
         cbAPZZAa6S8pqyghr5E0xmzxegxFYWaJ2Rr+EiYglyspvjrCoS/C4AjehI3LTsJgPHyp
         p9U69u9wnAFxExXIfMfvBCR+OPbjJBIeXPLoRDF0yaw5WmGGtn1R2gBkvCYSPWLhk8Bl
         50KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8Gg23vZroQxETI6pay6anvqx8zAzvFM1fFWvUKvVTHs=;
        b=Ud8gBlnazMJuFDAFPF22J6Z9dQKZXFC1U+FhgQ6/8gikEN3wUqZiA0E0L2LD69bPVk
         Fj6wKdnYexMqGO5zkLFf6DOVE0myHqMyw0F9rx3zMnw6AG17y9HTPLzV/RctIqbDZHa6
         cz8qia3w91Wj11iPQ2DGyt1nbh2jTuXCZCf1FIQTbHPy7GhGy429g9evWCv97biaXlZ+
         VGQjgejENRosopsWkBV7Vkbcchz7XzbPxNHRAsObmiYME1oiNaVhFUZyxJeghNC5zD3G
         fWxypb+YVIguOHt4eMSQGjXq9XxkvPtn+sp2RkQBD7kwKSYSwLF+GTufGZAwXdMRpHLc
         uQYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hqEUl3Qk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i22-20020a05620a075600b0075b247b6b33si2467894qki.314.2023.06.09.12.56.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 12:56:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hqEUl3Qk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7iDP-00070i-Il; Fri, 09 Jun 2023 15:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7iDO-00070U-ED
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 15:56:06 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7iDL-000353-SQ
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 15:56:06 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-65131e85be4so2254484b3a.1
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 12:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686340562; x=1688932562;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Gg23vZroQxETI6pay6anvqx8zAzvFM1fFWvUKvVTHs=;
 b=hqEUl3Qkg/8XlWhKUt2qh9SzMuY1sTbS+aGEDR3o8zWrt8QI3jlrC9lqzFqYwCuf7k
 Lu6g36tRymK4gCMGH93nxngTFBlB5de3jSgtAQcN6inhZotNwUyguUWU9o9qb3Hp/Bv/
 IDN7IXNmjwGIDneERKt5595UdmJktgSCCo27wQ+GVurA3tdfL4iY9bI+W81azohXuipR
 1k3rLFLuf3G/NrXn2CRBG87vbV8UwlpOQMQPE6jQB2gFWMrA5u6QpovDXX4pWfOVeHv4
 1slPW6BrTqCcGSdXetD4zlH9AyzwvdeTeuVHrNm32F9JEnUtEFjtQUqZBgBg5AmqeNE4
 Pojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686340562; x=1688932562;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Gg23vZroQxETI6pay6anvqx8zAzvFM1fFWvUKvVTHs=;
 b=PGM8ZiiaMAAiDMGl/gm6UEx10FyjIFbJAjhx1oUYrEx1Y7vMIjotkb2RROi+ovgOQ5
 tSiXLqcAJS8bxB7h6YyzFyUGccZvtyOPB/IktIlYCAcGFZqnLdmE3QriQ2MHEIR974I3
 QRqhSOSqqx8H61VFD65ysAjid39AMBYulFHjt/BKHRo5ipD6rI+ukp5KK2TqlsIL8WGI
 h0JmqFJs+pt9ogqbXhYD8F9Snhak80h3UGq8FOzWinnava5fnxRfRm84b7MyIs/9gtYJ
 Vo2m5FCydfIedjVyrcK/o1aYQ9+zZJwLrBiBxD3vw+ZpY4XtFnh3Wt1E3OrZYn3k0qxQ
 04jg==
X-Gm-Message-State: AC+VfDz8NJj+cl7C/8oTjkINOgaQw/JT+GMXIwPiCMBam/YkqvMVF2f2
 oYPM1HWB+Gu6ncw9vVThImu6bg==
X-Received: by 2002:a05:6a00:3a17:b0:64c:4f2f:a235 with SMTP id
 fj23-20020a056a003a1700b0064c4f2fa235mr2697966pfb.30.1686340562188; 
 Fri, 09 Jun 2023 12:56:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:20be:c4cb:f609:8cca?
 ([2602:ae:1598:4c01:20be:c4cb:f609:8cca])
 by smtp.gmail.com with ESMTPSA id
 e21-20020a62aa15000000b0065014c15a57sm3028211pff.35.2023.06.09.12.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 12:56:01 -0700 (PDT)
Message-ID: <35d7f33d-5dc1-b6a7-b40a-409c2b8ebacc@linaro.org>
Date: Fri, 9 Jun 2023 12:55:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 18/22] target/arm/tcg: Define SME set_svcr() helper in
 common 'helper.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230609104717.95555-1-philmd@linaro.org>
 <20230609104717.95555-19-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230609104717.95555-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: zRBB/DrcRDlq

On 6/9/23 03:47, Philippe Mathieu-Daudé wrote:
> SME set_svcr() is called by handle_msr_i() in translate-a64.c.
> To be able to restrict helper-sme.h.inc to SME-specific files,
> move the set_svcr() helper definition into the common helper.h.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.h             | 1 +
>   target/arm/tcg/helper-sme.h.inc | 2 --
>   2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
