Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp100325njb;
        Tue, 30 Jul 2024 18:36:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQ7srdyZrDPed6pbJnhiqMQEBRoA0g+J28BGJBeHQLIUdf4P9IQrjP/vyumwXB2ywhMK2WlF71grt1Q1aign3vzD2m8JlR
X-Google-Smtp-Source: AGHT+IG4OGBQrzFlojqbje6I2+78gfnTc1UktxEjRoz6TMx6zqnyEnHCWIOItdxkG4w1LWIc0Ner
X-Received: by 2002:a05:6102:3a14:b0:48f:e111:4ee1 with SMTP id ada2fe7eead31-493fa4a2ccbmr17347338137.28.1722389808661;
        Tue, 30 Jul 2024 18:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722389808; cv=none;
        d=google.com; s=arc-20160816;
        b=UgcfvQvA9ModplvU7ejPeHo9zxFUsJqzqss8XjBXrgGnQ4cOhShMh28BwvzdGxTLWY
         AnSsSkCQRcgSC09RXbKEgU6QBWL1jO6nITkxdKB1vkh4RQCtskjluULoqVk8whmm4uM9
         m/eOTitOlwxhoCaItDwxi9rQo17CWNb9zQOJEl/RBoJsEAdLn0xRUm0TQGK4pRhYU03z
         spEzKEu7KnHrQ+o2nb6ReyAFwd3lz093YNRm3+Q3SV5g4pyU2OXO6KsKh1cBl4PeIi2S
         S4j375QCXyk1E14PyDeORud2fmbhpVuvNEpXqyhHK+q8GYZeDP86yiqcM+xCgglLBFMU
         HWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=pQF4s9uQnFfbaRqSbtrsGmn90L2sjVXg9peNVQkjyHw=;
        fh=fgN8Bqepbt+nxzBUyGKZYj9/NOFIDiNSHcj16ctOWH4=;
        b=S+z1M3l7TxVgnwHAIeAK9g+L1MCjOWZ6qMSdYfvuBd9D4XBjuMVQ6sOeEpRjVh2OS1
         ukI65okSchtxlyVOXLKGZ1jkFkdtN7aZKFvY5ofWEaMZqSxr/SZ5SfCjQ4U1uMJxV6Fh
         c8TgNSfRfFmhsLOFiM40292XSCklMwliUqQOym0yHsSsDpxdtHXq0hkb+O6g2HWiRGIe
         jXyS0sdVqeIM1BzeO6ldy+VijbaHOENt2jQ7B6IIJkkkoiVi7wDdzZtiPwhyd2S63U4K
         pHl6AihXvrDowo2DiPtxi9EqgbdhyhJQ1a6kIRRjLuKCfRXPcRlA5c0h/V/bnbflVewX
         58RA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aVXaodLf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d73998e2si1425957885a.137.2024.07.30.18.36.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 18:36:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aVXaodLf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYyGj-0000XZ-S3; Tue, 30 Jul 2024 21:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sYyGi-0000WA-Nf
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 21:36:44 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sYyGh-0007Gg-10
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 21:36:44 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-70944e9ef03so1771879a34.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2024 18:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722389801; x=1722994601; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pQF4s9uQnFfbaRqSbtrsGmn90L2sjVXg9peNVQkjyHw=;
 b=aVXaodLfJASBGfH9PZcERvWruik3vYXJukumW5ry6Tkbl6xTQlutR0hMHH1drxWsTP
 AgJQDjRz7o9RCSGdmHWGcxQfIzXNv0fmsuQToVPswnxi4tZJaqROIAFFsBHYA1dPpb+0
 gX/lsrSY8jYDL6Qkj4jIsMp3Z6aiMaD/5+6EVG1j4irhG2KNiY0y8gsy/7wPemDc6VO3
 gx/j7HzcwGBsiGNVGIKa0qsSuwOH3OfYh23KLui2KKX0Nc+pyAWUNMsBPncCmdm8GyVf
 oCjVNRaLpvztlAMzvgf6J/Wv7D85Q+Sbz4CkUypjnLemM8aQxZazbLKzRYzUyenZX9cm
 h4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722389801; x=1722994601;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pQF4s9uQnFfbaRqSbtrsGmn90L2sjVXg9peNVQkjyHw=;
 b=KCMeqBTjEz6LUlTt1la/uARUZJ46pnxxvXKNXRz7Lc/y9j2iWdljVFaOz/Fd8OyUqo
 0p7yNOh3MuPRmrvITfJC6K5RY1UDDIQ1fK58gXVaAgUSOKptgd/mnLchzKVtveIdmNHb
 hycCt8EJ4x0IjK0q3Y2yz7ftkwRaLI1BJbvUihoRSvvStK0L4TBjxtVr8pK5wfnsQzMQ
 ttSOFt/4gibI0EYvK0VqnFUcr3Pkoiq6Ne5JIUrnV5aIsw20PylSjCpWsE2UOBU86Mwe
 I7vCLSoUOcyXVMjqLY5ciu7ruf6YeQgi2q9/Fhz467tvCt7i6DrRGoWztEpit0Y14N1v
 zqUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjg7SrfcltdWiCyfsc62FGzkzSa1ds7wk1N4LBLxBiuRkRaqFOL9qBwVe/SQeXbFfCDdBmc4AMTBIDQM44UDKQDHHB
X-Gm-Message-State: AOJu0Yx/XLN3q9GuGxkE5WkjC6SdHUj5kdVJOXMf5Lak+QMt+7FoTci0
 IEDViF749c40pjfw3qrBgivzTJeus8wwnhE4dDGQ4GOyibLIPdhUQXJEhx09af8=
X-Received: by 2002:a9d:7748:0:b0:703:5c2d:56a7 with SMTP id
 46e09a7af769-70940c7016fmr14165611a34.24.1722389801178; 
 Tue, 30 Jul 2024 18:36:41 -0700 (PDT)
Received: from ?IPV6:2403:580a:f89b:0:7406:659b:9ac8:69bb?
 (2403-580a-f89b-0-7406-659b-9ac8-69bb.ip6.aussiebb.net.
 [2403:580a:f89b:0:7406:659b:9ac8:69bb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead86ff31sm9330509b3a.144.2024.07.30.18.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 18:36:40 -0700 (PDT)
Message-ID: <a1c3324c-6065-44cf-ac52-f7038f99680d@linaro.org>
Date: Wed, 31 Jul 2024 11:36:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] target/arm: Pass env pointer through to gvec_bfdot
 helper
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240730160306.2959745-1-peter.maydell@linaro.org>
 <20240730160306.2959745-4-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240730160306.2959745-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: Ektuf01ohIbg

On 7/31/24 02:03, Peter Maydell wrote:
> Pass the env pointer through to the gvec_bfdot helper,
> so we can use it to add support for FEAT_EBF16.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.h             |  4 ++--
>   target/arm/tcg/translate-a64.c  | 27 ++++++++++++++++++++++++-
>   target/arm/tcg/translate-neon.c | 35 +++++++++++++++++++++++++++++++--
>   target/arm/tcg/translate-sve.c  | 15 +++++++++++++-
>   target/arm/tcg/vec_helper.c     |  3 ++-
>   5 files changed, 77 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 970d059dec5..aece9fd4aa7 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -1027,8 +1027,8 @@ DEF_HELPER_FLAGS_5(gvec_ummla_b, TCG_CALL_NO_RWG,
>   DEF_HELPER_FLAGS_5(gvec_usmmla_b, TCG_CALL_NO_RWG,
>                      void, ptr, ptr, ptr, ptr, i32)
>   
> -DEF_HELPER_FLAGS_5(gvec_bfdot, TCG_CALL_NO_RWG,
> -                   void, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_6(gvec_bfdot, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, ptr, i32)

Because env expands to TCGv_ptr in the translation context, I suspect that you can use 
that here.  Worth a try, anyway, so that

> -void HELPER(gvec_bfdot)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
> +void HELPER(gvec_bfdot)(void *vd, void *vn, void *vm, void *va,
> +                        void *envp, uint32_t desc)

this doesn't have to use void *.

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
