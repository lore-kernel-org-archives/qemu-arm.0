Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3526981njb;
        Tue, 10 Dec 2024 10:14:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWuPJ8kidV92VIj40B6gqUrbSsx+eP+uWVv+DHkvpB5vePXP7XLBsaijukx0XtNeMMZz0lMPIhm20GkgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFW1NiPjG29p6Bzbm/wgSxwQ6KsJJt4kEYsMESVfrKa7ko2/Qx1Mol0Ad4AVcpC+U2bj6bj
X-Received: by 2002:a05:622a:34f:b0:466:8eb7:59c5 with SMTP id d75a77b69052e-46771ff3761mr97182251cf.34.1733854475430;
        Tue, 10 Dec 2024 10:14:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733854475; cv=none;
        d=google.com; s=arc-20240605;
        b=kOlxMAxMEMJlRsB6NMhQrY8VuPd0WF2g3erJXpolQ6+762hFbiNfw1OVXCsdvNw7+z
         LNJXxJ3IMvPJEBdbYvQZAIAiuZ+LT5cBcvML41iarzvLNDPyOUSeWWyCNaowJJpuE1fk
         ucNO3CUK3fEAHD9iVf2fb6OHRf53HvOTZZAPQo1WY6ck1YruprR7BqRw5jkCvgLoPphM
         Eg6bvNydodTeQtQcY7ZdhHg0f7Gsz1jMWQh7DYGrNtbiapl8O36EhpbY8Y75U7vXlDTq
         YEcnXTWzAyybcyiFxr8cJrSfZMF8i78qIwm8Vh/zdrBZz47jmYLoLEV9hhUcPZqciP9I
         AB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=GWsog/lsGiL8G4q5MO66poQ6hOfPYcZ/GRZKvTBrd4A=;
        fh=qykfU1QwL6tRghrSPVD98eo+HdHSrbu1dzCERZgQEZ4=;
        b=ZgV9c8TABLLGSJUtQOs82u9k5+4P1mWb81B8RT+1FtcoXDTi0qVzqbuLfdIll5y0Qx
         PFMyKtbCuJKxEPUqNL4M1NJ8rid9tNwky1pA6NdhvYc97e1Ti4q4syhOF3lwhRwpv+3T
         FRTtaTkdpeHgDu7VaGFo0kpuEkWJjh4FuFlbWTcKBEybprEI3EPfbn4AoFFe7h0ZgBG2
         7yix4oOMQrklKA4MTBv98Vs4T7aszbGUhut+vbnHE39IANZdzbpAGfna/cndZkYCCgBJ
         UaT8DkCrER2usd/D8lb9rfdivBMKv0OV6S0dL11VLzoraDclTCbFu5BtLbJHpBUisr+d
         bB+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gx8h93A8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467864779e4si6798961cf.122.2024.12.10.10.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 10:14:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gx8h93A8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL4kD-0006iz-Cc; Tue, 10 Dec 2024 13:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL4kB-0006hy-F6
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 13:13:59 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL4k9-0002m4-4z
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 13:13:59 -0500
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3eb441c2f28so718269b6e.2
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 10:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733854436; x=1734459236; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GWsog/lsGiL8G4q5MO66poQ6hOfPYcZ/GRZKvTBrd4A=;
 b=Gx8h93A8riD5LH29JZthpepeuGrF89ft0yB1vATzKSd3LYaNwrUXJfqtYz8wbJonPk
 r/KqWKGmbELfrLp3Hvcy6P/5fDcEFXzzYAFPhsTzRT1n1lzIbgpI2GN5jZ6B2EKIHH6c
 0aUNwVSrNdrAljeXVVDDjaubxvlzRRODzfHMvrWZA5sKNjysbZRZlBYpzS1UXf/zdOFU
 eUQf8S/Qz84w6jS8QaLncCoaheNv/+Tc45I5I03yjMjapQyiyhbmHXU/fTtvnu7aXsT7
 agCg/neLUOxdqPFFiG+6JoBBPiZCN1xhs8ePcAqCztpm8lwzYVfGll0SZjJt3vGT3+22
 IGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733854436; x=1734459236;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GWsog/lsGiL8G4q5MO66poQ6hOfPYcZ/GRZKvTBrd4A=;
 b=H+upIhRGiao2V6sEBGcS4vApU0K5nwDnnqnGYCEX0JJK1CyccFDGBCuP84oj/iGMpa
 7HuX7o1BH7PCrRVi9lIONN9JsvhA9LCRef94D80wAa7KjCwhAHg0JznCWNLunhk43bEd
 vaWpMioT2P917WpwMlm7yLP82Mz8uVevR73TAfXga4SHIdKG6RRgTPQsKF/1qNujPkaJ
 jVjZXTngvJgXryW+UVVD1BoZXvQiaVkDxUXSlj6jrA0hO02/q2JxGIx45sJWNAfj3wpm
 4hCg3pIHzNnPZbXqh+7jJMhN8/QTnQM0REIu/+DI5odRv09DONhIpMVt24/c1TrtXL4/
 sZaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT6SL8dcaGCYhfWm3JH3idzVz4OMjca9Z0ziuEqGjbrdfKZ9JCXQJZu4m3gdSrkNkiahRS4Xbxig==@nongnu.org
X-Gm-Message-State: AOJu0YwTprFkI9aWfhDNz5bgIe28sbh2ORb8T3Ek7yswOcLjPn08Jhvy
 kUAKJFDDpmf4PIGs1cdg/yT1Lqwp9s9+Qgimt1Y5DC2VYWEcoSM4WQq/mTdtC1M=
X-Gm-Gg: ASbGncuvtVTahjjAHEOI6BDVB4qXbO0SpCacuzpuES3+cuDhiYgRlDAXZ9Jj6RkquVX
 JOxI71RK7PijfbIUEM30dCAuTp9rZnIf7vSZXpmUi8/iLi2n887lDpX41HPBNw3nGcsF0IH9bCA
 u8GWQK0FsyWrWEJYaN3DOrdKEow7yly7nQm7/gf5iOJVHW0S818OeuLMObcg0lhGnCT1NTDHq+V
 zbsJKvlO9hiGeZGahqhrvKPrmYWQFjkq2nhixcqYiFRdh7s/ZG5Mtgk+s2vomflUXnX0m8=
X-Received: by 2002:a05:6808:3b4:b0:3eb:7973:111a with SMTP id
 5614622812f47-3eb797311efmr1138083b6e.40.1733854435865; 
 Tue, 10 Dec 2024 10:13:55 -0800 (PST)
Received: from [172.20.4.119] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71dfaae5a5dsm949491a34.28.2024.12.10.10.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 10:13:55 -0800 (PST)
Message-ID: <ee1f0cf0-e1c3-4ea2-bbd4-f278532ad2f8@linaro.org>
Date: Tue, 10 Dec 2024 12:13:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] target/arm: Move AArch64 TLBI insns from
 v8_cp_reginfo[]
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20241210160452.2427965-1-peter.maydell@linaro.org>
 <20241210160452.2427965-4-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241210160452.2427965-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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
X-TUID: 9m5duMoWtyXy

On 12/10/24 10:04, Peter Maydell wrote:
> Move the AArch64 TLBI insns that are declared in v8_cp_reginfo[]
> into tlb-insns.c.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h        |  11 +++
>   target/arm/helper.c        | 182 +++----------------------------------
>   target/arm/tcg/tlb-insns.c | 160 ++++++++++++++++++++++++++++++++
>   3 files changed, 182 insertions(+), 171 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
