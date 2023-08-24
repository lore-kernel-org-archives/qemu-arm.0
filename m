Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp804881ejc;
        Thu, 24 Aug 2023 09:02:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIKf0bHZRHsjgwcE7ET3kwyZNgU/X76ggie1AqIOnDuGnyNe8nLiu3exKYdwqaNWaZq2eN
X-Received: by 2002:a05:622a:134f:b0:403:996c:9fa7 with SMTP id w15-20020a05622a134f00b00403996c9fa7mr22940874qtk.60.1692892978837;
        Thu, 24 Aug 2023 09:02:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692892978; cv=none;
        d=google.com; s=arc-20160816;
        b=mouyTa3Y8pbGWGvuI8RZIeBGY8zCi5tiuH8wpenbKdf2tgjyiqY4bo8c9h6mIKU6Yh
         LoQr1oNgvl4xy6G7likkBXAFZAM34jE5Q1EQFQMwFiXBKVNqSS02YGrZohdjyz4SUsLa
         Bv9/B5wGhUomR18n5VZptWzfGKCIuOO3G4kfD8vt77tr8DwdRn21/ou1V/ZAFl86Gqxi
         32RP6OlO0zJ8C60dlUjsbzXYdB4SePEg9Epf8OL3L1/OQelRU+UOx1YeP4K9D89+h2a1
         umYSyHbsdY8GM7WhIRMIHfGjGGu8RShbO5x6SLKsFtzvTv3wbwLNam/IH69gXSYsCUxp
         uZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vWe9eS8eVZXO8P90ktu6f5qpHSoD/+PIq6FXrZKBQ3g=;
        fh=u3c4aEJTZih6uJeK/RX+Ie3RxhflpAqiPYGyGVOKCNg=;
        b=YcFf0TTpXi5gAt49v0rj4yclZGBE/bcJeXSDnWbPx4wUR/f6JzpA7D8Ns0W5yGmZO+
         72dQl/Efwp9ahJOcHpakUlkiojEa6EFczFlOAv/TzVmpNajhCHhegDFPX2rjkLGB2DNw
         LvZX+jvT5Zd6hLFnBr4TCnWyAZ7PFc7WIyTMM+FelY+oVXCZb1U99TswgqTwv8hJx7aI
         rpwVBFJebrRX42Yao+y5jceBr5EouRSrdpqTdsSUS9UlrOk8Vvltr1lzECCqqBhIZ++t
         SOLOhp43syL1mPV1139HYAJMFqbHwOdwsyISoZLZG2dNbI1eWvdWKQ5xn9HKppL0rR3h
         oHLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XMwRYmSF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20-20020a05622a011400b0040358f265f7si46363qtw.279.2023.08.24.09.02.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 09:02:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XMwRYmSF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qZCn1-00014Z-O7; Thu, 24 Aug 2023 12:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qZCmx-0000ws-Un
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 12:02:29 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qZCmv-0001CQ-O9
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 12:02:27 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-401b3ea0656so1038855e9.0
 for <qemu-arm@nongnu.org>; Thu, 24 Aug 2023 09:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692892944; x=1693497744;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vWe9eS8eVZXO8P90ktu6f5qpHSoD/+PIq6FXrZKBQ3g=;
 b=XMwRYmSFPjXhA1JCN1+IJCu0mFWB6sz7gQNJsVQMkcI8U3f6vdxP2VP79V6DhPqxle
 75f/yK+pfLXW9n88eLvLngdURcXMEEnb5Ty2+NiIyQgZf7IMYjZ4AokEMz5S1CzdzYc+
 zcQBtz/OBAl73uqUBJ8F7lSJKPYgbiA7ps9Tt4SeGPU/mTEMFEB3T+JljCboC9hwlKto
 LeZvo/WzaXwsY7HLTzqwIpCyt0L9t2TH4XY0WUXe7PCfHJW2ezGoDPuhjWBrprO0HtSd
 +NuBDsaLWpHuRZWx0DZC3IwQ5P6CX8gG9ss3YfKiTL3GuZS37rgjZGESgML9qXb4/a5k
 ScQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692892944; x=1693497744;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vWe9eS8eVZXO8P90ktu6f5qpHSoD/+PIq6FXrZKBQ3g=;
 b=ALosxB4l8LMxzT3M5tO+JeHAAwWQkYfj+KsS2sVQvurKrXYV10kuSq2dYFVAjV+mfk
 qOlgAp2mXm7WXr6jB3mlLayzuDCVgvH1GdfYC6Zt1pXbP/H60avY9jZwHq7F0VdVuZsw
 ZB53cVVMEnjRbauUjEVGQ8EolFZC/QqK5x+wehMym4D8GMElhop9U+KnlJePOMEoo8nK
 UdTjgzATR0qVMEJw8Tx5KNUuqnI2bEQts3hSLLIsld5kmfD24xx4XndXdGTfJ0Em0ynE
 /QPmeq0Lvk+q5dIQMrwmAQHAR9RKDhbFc6xDP5geLes8lcJdYvAluUwoEqZsiYTSKss8
 +Plg==
X-Gm-Message-State: AOJu0YxNrVZPRuwpdvWSANeJISSYKSMdT3jzBKrTAHclPi1Le20Z3wJP
 7Y6OcnN7gJ+aSriRRovBN+WE3FBEfpE/qmxe1HU=
X-Received: by 2002:a1c:7412:0:b0:401:519:c9 with SMTP id
 p18-20020a1c7412000000b00401051900c9mr2352531wmc.13.1692892944029; 
 Thu, 24 Aug 2023 09:02:24 -0700 (PDT)
Received: from [192.168.69.115] ([176.164.238.90])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a05600c21ca00b003fef3180e7asm2985549wmj.44.2023.08.24.09.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 09:02:23 -0700 (PDT)
Message-ID: <53f5a2e2-ed79-0dc1-9248-0ab5cd13f34f@linaro.org>
Date: Thu, 24 Aug 2023 18:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2 01/11] target/arm: Reduce dcz_blocksize to uint8_t
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230811214031.171020-1-richard.henderson@linaro.org>
 <20230811214031.171020-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230811214031.171020-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.919,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: W8jF7KVTTmSy

On 11/8/23 23:40, Richard Henderson wrote:
> This value is only 4 bits wide.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


