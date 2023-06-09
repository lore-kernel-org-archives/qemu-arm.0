Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp605123ejb;
        Fri, 9 Jun 2023 12:42:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6kUzA6/TtEyw7voNmp7lx3hVxky3FbKLhBaMz5TIybWKL7ExW+o6LkZke0+XJmw2tNFopz
X-Received: by 2002:ac8:5784:0:b0:3f6:c5c7:fc4e with SMTP id v4-20020ac85784000000b003f6c5c7fc4emr2439803qta.28.1686339750572;
        Fri, 09 Jun 2023 12:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686339750; cv=none;
        d=google.com; s=arc-20160816;
        b=vMYXlagXYWyS2m7mSSLoeQeciIxK6ldYDxMiql6vgPNZAxj+XAEAzTRCKYqP3NR0kc
         zHD0oLWUUAOkIlB4U9qDIfmeEEGTsKKpPtZmJDNsdZtpbxSf9wR4tiHhUmZuBd0G9OpT
         8jq2gEqdaT8uHTu3AZ8AE5dt4iGvwIB52uHaXyAv5ONYSBS2ubiaMAdvi2cKyDE1pVbl
         WKw969y/0hvRYnZ0ujBRJFgeBvouAvd4t3G9xvkcL+zi57yEcZLR1AlCT880cCVvj8v2
         58lzHO/8+n7wMLAI0EPXMRfbz0kOn29waD21BP0GZjCnZVN4RFOU+EUfkgU4CnUSLWSM
         iEkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CWgEyfGBYAr6DbHtzbnXgH76n0fj4zQQnrvMvFuWBIU=;
        b=mqfkIBIwqqgNuxO4dlQ2HMrr448qbZs4dVeCphc9VxYdAFEeLlHWpq2iCPkGAfNDfA
         6/PLNFPLLOqYoHQLeSxHN/InmYNGbBEvVBO5qg+NPu8BbFCXrIcEJWwMuTGIH+dDQajZ
         XHfeyrHpeTM8J/795Puh7AN2XRsBdpqFLZ864A7TOX4T8RMSEwBGXrX+sWshyKioD3kh
         BMa7LARIW5HO2YEHXuijuoEj2hW8S3B6g0p20n7Hp2vJYT7IPOSDV3ZWF58rQEk13OzG
         5m6atJegvGHZU3tIsb7DBDpIXEyV//PDqop9QwmM7o1CScFkwog+XDuH67nUSuh+r3j1
         KKRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UA3Zi+Cr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20-20020ac859d4000000b003f5619a8921si2571332qtf.242.2023.06.09.12.42.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 12:42:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UA3Zi+Cr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7i02-0001hA-Ep; Fri, 09 Jun 2023 15:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7i00-0001gi-P0
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 15:42:16 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7hzz-0007nz-6K
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 15:42:16 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1b24cd75989so9044265ad.1
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 12:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686339733; x=1688931733;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CWgEyfGBYAr6DbHtzbnXgH76n0fj4zQQnrvMvFuWBIU=;
 b=UA3Zi+Crpmm8NelxJEYfq/2Cs4g/vYk7WAvGCRrEGK9+DPOlH7+umazvM6k6maTN5w
 wSQGQlrarDlUgA3/pHCOxp9nGOnlNOB1QVhDX3/wkq46W76t6uC7au1rjdSjwxFHo0V2
 ahEL8PS7nyVU7RLe+QqJfDc3kRAV89AEu5DQiwU1ZHlcZlxIse5q4N7hLySBivHrB+p0
 tJ+1rDimbO1jhFHbeqf30zdgAVI44j+4srFU/cDbcpf+7lLLTTUXIfmg6RQa/n1uleoS
 vyfnXajtETTJSkvjqZQmEOf110ZnQbEc7Wkx+3Ge51+sPkEDQ5ZCHQpPmS8v1LlzSBPL
 /0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686339733; x=1688931733;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CWgEyfGBYAr6DbHtzbnXgH76n0fj4zQQnrvMvFuWBIU=;
 b=Nwk4pM5SZJ6Ab5x05jjWYoeV9J/pD0Rg5iHQT2QRH6NoWu6o4deLCyNd9hhGdspjMA
 6E5hWFteBBRNqgsJdcdZlZ1buJ99kb4vqEeCiMTGHLugl6sd2My5CspVpKKUGVLEMJpR
 HrigO42sTd5aOg4OFgVYpCnwWV1GKFpUSQNew1bySPT8ktxYCKq9O3EwiN7oFelR1bvu
 TsxbKXWWi+XwziKmtQfu0afFYhtGd8KINgpzu9u3MurgmULgDTRJJX63P8jKly9MJK4r
 ned+uvJ7R9kiarCjqmRfubgrTsegm/P1q5yQcn87owmBuZwu08wV90q/uVLeSxmonFWl
 W27A==
X-Gm-Message-State: AC+VfDy5U6+j7th+lM839oLWUE7IAwycHGuTYgsnk8wT7SBKRgAGHkMZ
 1w+Lp5pq6/CBLwPl6mvN1z7oNg==
X-Received: by 2002:a17:902:eac6:b0:1b0:6e18:ce49 with SMTP id
 p6-20020a170902eac600b001b06e18ce49mr1858130pld.23.1686339732968; 
 Fri, 09 Jun 2023 12:42:12 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:20be:c4cb:f609:8cca?
 ([2602:ae:1598:4c01:20be:c4cb:f609:8cca])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b001a525705aa8sm3590206plf.136.2023.06.09.12.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 12:42:12 -0700 (PDT)
Message-ID: <929f60f1-187b-5258-de32-90b0e270b610@linaro.org>
Date: Fri, 9 Jun 2023 12:42:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 12/22] target/arm/tcg: Move neon_tbl() from op_helper.c to
 neon_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230609104717.95555-1-philmd@linaro.org>
 <20230609104717.95555-13-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230609104717.95555-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-TUID: l0fq3gQj6Tpu

On 6/9/23 03:47, Philippe Mathieu-Daudé wrote:
> neon_tbl() helper is only called by NEON files. No need
> to have it in the generic op_helper.c, move it with the
> rest of the NEON helpers.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/tcg/neon_helper.c | 22 ++++++++++++++++++++++
>   target/arm/tcg/op_helper.c   | 22 ----------------------
>   2 files changed, 22 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
