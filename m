Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp194756njh;
        Sat, 10 Aug 2024 03:32:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFFlNugHVqNUZEslYjQ0wWT8oJE1SegrC3ZCwiztrko8YJDj00Lu4aTawqEvcQPbBRE3YC35ZnI/SGrwQnRsw0zNnNbFzw
X-Google-Smtp-Source: AGHT+IGnQQh5l07k2JNCeZPJHSZvZe81hd+ece5xknAuBIs3THuRwRJFBezrcHcXrevFfX/CrB59
X-Received: by 2002:a05:620a:46a5:b0:79c:ad5:cd7d with SMTP id af79cd13be357-7a4c222e064mr678569285a.23.1723285923893;
        Sat, 10 Aug 2024 03:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723285923; cv=none;
        d=google.com; s=arc-20160816;
        b=qM6di6+epaD6PCwJkR9CfxlZbeIGYG0tSPSAzrPEoEaZUbWEuBE0tOhvsXdcLQsgBQ
         cHQSNEOgkeftyrbnYyxCUyQiEZsXUe7KC8HY8g7ED3tPsUvWVD5IbXVBLq+hQmqu1GB2
         Ll+fcUwNCZ8MhI/U6lbVkhAPQZipqiFYobmaESmDuzruPTfJZh3fhalR/RSHRyB6ssDz
         SSMTOkyYupMH83UKpfka4k+rf4XVZBSb0Wpd76uJopl91OzborimiIoGLXHGxXwHA7qQ
         LdVgCH/yTWafLV4q9T2KVg8mkjsfBV8wI15RQqgv3WS5qJbfSRThUxWDVwG7QkbNsKJz
         lzeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=y25t+TJxNw42DZozoQ+uUPD1k1WiAZ6yQumzegCb2r8=;
        fh=kq01q1Dep0Do7+IVmYWi1vJkIsfBiZs0ZHKrLjElPqo=;
        b=hWvOj1nIjWvJJhTAtHWoQpzhfMB+uxqDcEAnwRt+ikrGIELhAy8hhKZAw8+62PwYpH
         W/SaEWDG9Fqb0vYdMe+onhH5mHy+ik8UnKrODObyu1sIBWapYdRQFMto6PnqCk8OcDLY
         alYrKBhB/12J0p6yd/zTYm1EWY2kvhVHCr8HS/pckBHPWLkII7mCeXWlSl8QGbtAnxxV
         yBwQ32vmfE9KnZRPRnq3ppKx9zPhtFyFMZDFZiZEtf9GqpuS3Yz7R757+JecdWUg/lAF
         6rThGwP9f1IPuMMFTuRSOUBKBNuvU1xf+iVJw8I6kyr/NGPzNXainiN98VlqEb4Hznug
         GD3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UHZXqpik;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a4c7d661e1si158616985a.60.2024.08.10.03.32.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 10 Aug 2024 03:32:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UHZXqpik;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1scjNT-0007pV-Tl; Sat, 10 Aug 2024 06:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1scjNS-0007jm-0Q
 for qemu-arm@nongnu.org; Sat, 10 Aug 2024 06:31:14 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1scjNP-0005GI-5A
 for qemu-arm@nongnu.org; Sat, 10 Aug 2024 06:31:13 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-710dc3015bfso892242b3a.0
 for <qemu-arm@nongnu.org>; Sat, 10 Aug 2024 03:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723285869; x=1723890669; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y25t+TJxNw42DZozoQ+uUPD1k1WiAZ6yQumzegCb2r8=;
 b=UHZXqpikKR91mfIbzdHCQqc0kH8nmQXnuwb0MHQvsKo1L/eW5FBSbU9xkJ2fWoo8M5
 gYdnEVnh9Yt9bt0HKO42NUqMJxaS1dOn8eCFetXOBAz/eupk50WLRX7UmG37ZJttLmVW
 guTfJnnXIvEznvOKay3K9LYeRnEuvA5XbJGLx03DBlntoOmMNMF6Zkk7SmydtZaIhBP1
 H2Hw4UYNr4gky+Bc+qr3P3PgAeBqxsczByPQJWpekWdsilYedFZBex72Czu2VJg0VYEU
 EY4HzU0VCVhaHBjX08MUWswKtj9/4tmZRmwDsCLHAGAur8wyQycczeYH/+3uC/LnabyJ
 WKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723285869; x=1723890669;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y25t+TJxNw42DZozoQ+uUPD1k1WiAZ6yQumzegCb2r8=;
 b=EAkvIiCNZ3haUcmlKcI0GiGu4zTP0PlKEGW1hhSE2OHpAmKjmaw9wx0VEfrNf70yIq
 oyWuHzvxgP450rpLP1nxvluufLHEJ65wLY/RHHPPqsiKy6d8Cb5xfyJ3m/OBDRlqcSMB
 MYVldLrUlfJ+LVc4IdpOB9WV+aLd5qxoHOz6MSF5eaC2dX+d0rxoxaYvQI25Rf5sv9lx
 1qZqMrsjsc/661O1NZfa9PI0c60up0mBqfk0Tot4nUPHwpduIWPvBo9EFKm13XAQdIFg
 jm0UTtjh1vgwkuSTHG9XlA0JvchiNCtggBNdN7Kn2lnDnaVptQtZpX+IA2qUretJcs8k
 yrvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKoYbE/Pb/5KdkqUT+6EYttgDfUganpekM4vamwAElpcsqKrIMmh2XNJ2Vs2MB4BtreF/6LNP6w0Edl9OckNUnMXj7
X-Gm-Message-State: AOJu0YwMiO1L0I3Bjo6bO7Wsji7bl+jgf30xHEZxLPwSLD78z6nIab2E
 wbnAZx5Yt8J1yTj70tfYCPZPoZRXvbitCtG/b0966hIYixzSiAKD831nAqT+/y4=
X-Received: by 2002:a05:6a00:3d09:b0:710:9d5d:fd13 with SMTP id
 d2e1a72fcca58-710dc765225mr6801774b3a.0.1723285868426; 
 Sat, 10 Aug 2024 03:31:08 -0700 (PDT)
Received: from [192.168.1.113] ([203.30.4.111])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e5874e00sm1064009b3a.12.2024.08.10.03.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Aug 2024 03:31:08 -0700 (PDT)
Message-ID: <54088801-9425-4522-b801-96b8e3f0834d@linaro.org>
Date: Sat, 10 Aug 2024 20:31:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/arm: Update translation regime comment for new
 features
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Bernhard Beschow <shentey@gmail.com>
References: <20240809160430.1144805-1-peter.maydell@linaro.org>
 <20240809160430.1144805-2-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240809160430.1144805-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: HS8HkM5bG4Nc

On 8/10/24 02:04, Peter Maydell wrote:
> We have a long comment describing the Arm architectural translation
> regimes and how we map them to QEMU MMU indexes.  This comment has
> got a bit out of date:
> 
>   * FEAT_SEL2 allows Secure EL2 and corresponding new regimes
>   * FEAT_RME introduces Realm state and its translation regimes
>   * We now model the Cortex-R52 so that is no longer a hypothetical
>   * We separated Secure Stage 2 and NonSecure Stage 2 MMU indexes
>   * We have an MMU index per physical address spacea
> 
> Add the missing pieces so that the list of architectural translation
> regimes matches the Arm ARM, and the list and count of QEMU MMU
> indexes in the comment matches the enum.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
