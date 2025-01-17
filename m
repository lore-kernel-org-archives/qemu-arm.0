Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp4527173njn;
        Fri, 17 Jan 2025 08:35:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXjOiFYymhWOVOfnUymnDAaXbtnJ70kIFtS0dwL7k6X1IZR5UdLdQzj2vxJvpmoSfjOBhGbJT5FAzIS1g==@linaro.org
X-Google-Smtp-Source: AGHT+IEXZTFlWVOWaEHwEA8id6gAQ9uYgIJZKIyLuVGHLQA7suyM8BoTbiAWh+dZXB60OjnHNEli
X-Received: by 2002:a05:6122:660d:b0:516:157d:c5fb with SMTP id 71dfb90a1353d-51d5b3a63admr3065643e0c.10.1737131706927;
        Fri, 17 Jan 2025 08:35:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737131706; cv=none;
        d=google.com; s=arc-20240605;
        b=ZoQhmZT1/YWnaloy1C4o+dlJpSVb/pNJnCRRciRdRqfsVAj+YWI/0IKJj2ZsLtDmOc
         d3PjxyLomjFsf2ZdrjZPrcGid7mpsHEG0Q9S3HFGDPjeC21axSKYTBossKdbdFYTZBt/
         BVYb7g3bGolqbd5ZrDffkuWdQSp5zvOC4fMCS6vUnLbHMevkqCzOY/25AUNy3YZxbYpX
         NujVQiAsROMZNMf3/rb547kGnP0bnKLWekQIIGMlSX5QRQNCz0ryOYP8FNM5Vw7iLpYj
         /PH2KamAm2aGcX1GPFcQ+NO+vnEcdXommvQjz5Xx17gZU/CRTuxOVKy7JbtsaBsCP9nz
         pnmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NJbxbifsPoPkmiy+DwSNRXcXtmQwysecWo9Wj6j4Lag=;
        fh=v3c511B+ENLQAWdr6n/5ru/YAFrGQa9bSmgT9Xc2KHc=;
        b=Va3vlJAExTXZ25/v0J3x1KH6LFWmPCOROZB+L1Mikcalo/obBSI0Y6wm6QSC4yupbN
         JQ16ZVqcs8AMHT29V/6+36/ejtAW1lMBCSxUOMDglhLviwzjSr7vfoMkIRd/2zkenIua
         aFcwixC4XoZ50bU5pFJBChSmjixWbVjzuHHF8qjF034Bn1DqMCS0jk4X8p7nOFQRaJ31
         idfye1sP7sdkFxTvFVT4/Ua9ebcxRtRTsMNbwx8CsbbT73Hlbn3hxSKaizZryV7qu6zF
         7lQv72uZrgroDv2n8mGerSr23jqlABDc0/3gtrr1Y21oeLFTb7tgokiay6C31/a8jmIz
         4PvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xPRYAfOq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51cf57831e2si946579e0c.172.2025.01.17.08.35.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2025 08:35:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xPRYAfOq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYpIn-0001nt-Rx; Fri, 17 Jan 2025 11:34:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYpIm-0001nN-4y
 for qemu-arm@nongnu.org; Fri, 17 Jan 2025 11:34:32 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYpIk-00075j-Kc
 for qemu-arm@nongnu.org; Fri, 17 Jan 2025 11:34:31 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso15677565e9.2
 for <qemu-arm@nongnu.org>; Fri, 17 Jan 2025 08:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737131668; x=1737736468; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NJbxbifsPoPkmiy+DwSNRXcXtmQwysecWo9Wj6j4Lag=;
 b=xPRYAfOqPh9VC1mmYdfWrclwJ4MW4TjZNQFWE0soywsJ05AQgszWaiBeqc0gXBkd8V
 WKOKC1TdVsE0cbVoa6v8rjB9NGf4TJQQ5e9j+4LRWqrLidyzgdohz2nMB0AYiHzhrg4y
 DuDutTNaYsgF7zsoyGqvbZrm0WJ1DQ7RK7DwGMhivqxTlQwO4BVaJEICmMzRPU92U2Nk
 yZ+5cYm0k33v3vGY4YH65E7s4wxMcRGfK4sYJOARg2NwPeejCznP/rhXf2LmyzjRqslN
 f73yul+hHwGxNjkKvMOPhIpEB9ChMMBEdSOl/nXNZ1F5bj9fxcjIAaqoY+pMjwcPXqbz
 gMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737131668; x=1737736468;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NJbxbifsPoPkmiy+DwSNRXcXtmQwysecWo9Wj6j4Lag=;
 b=cVPqldeXu5Jh3Spbz71eSFSUBQFeQQd6S5I7rZANtR9xxWKUwrFRGpQkghBVv4uixO
 CzUdKwr92lH/Zw8LLku46Wp4bmCqyserQHJ+rykJgIHNmAD/9PI8s7DDb+/VHMEftC66
 KySuksacbwOsYnBHV1PqeQfXcbhZGxPCsJM1v1lDf9iTcVJSp5BGhFEwdw7vnsB4Gqdx
 EhBXGzd2E//DKm5Ga39vynWhyOEbcZbOLRye8+Hb/K+FtEEykousPecrf1vYlYoL8xBm
 fbalvCIHbiFhfBMj/MTX3YmVB+wVD02oayxvSU0FyCaYGwhA9RI5vL1bblpa/fwlo85Z
 MD6A==
X-Gm-Message-State: AOJu0YyYN8WQhL6vXq249Vx6IW+7YoNsPKkS5h3mpH2+sTcYXcgPHecw
 VfK/P+CX4GcfG8QsoC4bJLJACtdanDmNgazPee7G20GtCKlFuaaJXDFZ3437W6UQAgzoGxc73W2
 YuG8=
X-Gm-Gg: ASbGncvPNG7tmhcD1rIVWXisg6uos2roStpdLt5LyIwi2AYCGqgYIGQa0nkGx4BcuE9
 ZL5Wb7NQVb7P5l94G8KlvLxpPoB4DvAR3ZliYR9Ydd44Jy6hN6mcX9dTbqXbSQJdYFJz0Q6zImT
 NYuAfjzt7aTOfglxadLqzc63R2xDpezCoXOToky/Z/gLYe+4Xae4BVUqL15mv8kYXNFx4plY/+x
 nhqB8kMYbOCc6pSFKW2eobGpVVSsQgiCGJp4kqX5/ApvNRD1BQNCn2ypq5tdbXb0Atr/eemT2Mg
 VQAeyBQVq/LoLSpYHEfJcWnC
X-Received: by 2002:a05:600c:1f8e:b0:434:f82b:c5e6 with SMTP id
 5b1f17b1804b1-438913c7ed2mr28691825e9.1.1737131668458; 
 Fri, 17 Jan 2025 08:34:28 -0800 (PST)
Received: from [192.168.69.151] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890417a76sm37905685e9.16.2025.01.17.08.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jan 2025 08:34:26 -0800 (PST)
Message-ID: <6b7da4ca-eafc-4a02-86e8-6de59628ccfc@linaro.org>
Date: Fri, 17 Jan 2025 17:34:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] target/arm: Constify lot of helpers taking
 CPUARMState argument
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250116230435.87580-1-philmd@linaro.org>
 <20250116230435.87580-3-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250116230435.87580-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: xdmR3H/5RXt+

On 17/1/25 00:04, Philippe Mathieu-Daudé wrote:
> When methods don't modify the CPUARMState* argument,
> we can mark it const. This allow enforcing places where
> the CPU env shouldn't be modified at all,
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> I went via the "modify one and fix until it builds" path,
> and the result seemed trivial enough, but can try to split
> if requested.

Re-reading me again, this sounds like a random patch, which isn't :)

What I meant is I made const the functions that I want to use
with a Const CPUState*, then I built and fixed the call sites.

> ---
>   target/arm/cpu-features.h |  2 +-
>   target/arm/cpu.h          | 71 ++++++++++++++++++++-------------------
>   target/arm/internals.h    | 10 +++---
>   target/arm/helper.c       | 25 +++++++-------
>   target/arm/ptw.c          |  2 +-
>   target/arm/tcg/m_helper.c |  8 ++---
>   target/arm/vfp_helper.c   |  6 ++--
>   7 files changed, 63 insertions(+), 61 deletions(-)


