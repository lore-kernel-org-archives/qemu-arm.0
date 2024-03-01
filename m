Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1261998eja;
        Fri, 1 Mar 2024 11:04:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWWVc00T92Yrc6LYZm+RxuXSU1ws87ppz+6IWCPHAsFCAXUZl04u2ha/CUID6wUmhqWHTIzA7z5YrUrMKuWLC7DefrNhtF6
X-Google-Smtp-Source: AGHT+IH4qqX4RVdPbQZyXapMTz8yGCp0UvjEQ7SQisIheJR4YWN5dpA8UP0LVn+ixZNSWBTikLcc
X-Received: by 2002:ac8:5754:0:b0:42e:d2e8:7d23 with SMTP id 20-20020ac85754000000b0042ed2e87d23mr1211513qtx.2.1709319888421;
        Fri, 01 Mar 2024 11:04:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709319888; cv=none;
        d=google.com; s=arc-20160816;
        b=emLn2dfu6LGjY+kPOsZiZ+ppZ7zTlSNwPmDQvnkh9SoOqirbCUSzlaA+G7b+/fTHEw
         UPBzKtdpiNuKkpAzKKqBJWy9O9upn/pzkblHv74yRq80qV7aPw4s/l7qNyrwOQOwbg1N
         cxLvXry5s5w0T8//ie9mj0oXxa52I6UhJcIHhtvwVrgk8S90kpIwTtF2pHOPlSQEzKqr
         XFz7cUbthj0dcvn4y61KQr6aCOpA6stwahu0re46aLN1D+KbitGfoS+aqTuhoeNmTuZb
         Oq/oxEQ1dKcOYufhaD1DIU3HH1XMnfxw7o9MSmDEH8GOK5gPQu/IPZ7O/vos1prnOBD8
         oOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sbbQzXlvGesnWORgLlEla8Z960pQ0cPJxPFpzNxBQjk=;
        fh=zs94ayv8BqJ4jh4YXdPL5CMtP4KcP7OoAl+4dy6bPAA=;
        b=rrdM6ncIX/B8dJOw82XJQzDkeIwwkwATIbyui7TEjwI46cuPKR3R7JlE9zdW794OHc
         DB2ycvbYSxrrr4LSbMSwZt8+VZf8b13sAgM0EFRY+aJmfA4ePhIzZ+OVF17++tYOzA4T
         vLVMzKq8cEUS/9Q8dqKhyCt+q8Nk4FO4S5Zsbj1uLARmOcVAf1ajq5hXTaq8L9XkCYf+
         CclJar1JMh3HUmudEgRurcKJFBePWfqzRecyb3zDVmdRS4zm4rewGeS4ZxPjJjkRJa3E
         a4NJgT7huW0sYW+EEOatpSbXEgZWWgj+aqYbjCXmZoKz0R337uAb1XZoBVgWObnoGNEf
         aWfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AJVd+vTk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11-20020ac85a4b000000b0042ec83e9754si2114402qta.12.2024.03.01.11.04.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 11:04:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AJVd+vTk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg8BT-00045f-Rt; Fri, 01 Mar 2024 14:04:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rg8BO-0003xU-7a
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 14:04:34 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rg8BM-00053n-F7
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 14:04:33 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-412a9e9c776so21743145e9.0
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709319870; x=1709924670; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sbbQzXlvGesnWORgLlEla8Z960pQ0cPJxPFpzNxBQjk=;
 b=AJVd+vTkmWHEBYfngJ9ZT/7+DFU0H8fIdtFxVhBR0UNELq+uAVd9Eq72uaLokY2L/j
 rusPuPOCQvdO9iH7ISNb48sepz3jhCJVu+wWht3pjhunwkkm+w4qBVhw945ECZrUz/r/
 jz4Qz+VkHTNCe5qhJnitjvoVIOm8VbcZFDYlrLHYKSYikdk+xUBu5+sXn59+FqIt1K2H
 KnJq5tdecpsX3vnRv7LMyCn/+Uo+TqEEN+8Q+S0aUlwHevaNJcik7W0lDBkg3lZooWPe
 lTzJjDofR9NsvFf5jxP0IvZKnwVgn0N0uLAnGYz0QuJDBhES/spuH9+AbJQUbw0VZLNc
 kX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709319870; x=1709924670;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sbbQzXlvGesnWORgLlEla8Z960pQ0cPJxPFpzNxBQjk=;
 b=IA7vYUTj7cUYIM0m2+Bnaw29iH3nAIfwZ+fCFrzRcubhZrEGiGTRg0HPJ2658qHZuJ
 zBsI5G0ACQttMz80Xur5TKceyR03NZZUDupjhZydbqqhBILrLyBduAUuThqYpZyA+tdY
 odchSNFx9HO5YzwHpuXXbqqVToLCbvhCd+TVIQwLs5E1SZVcWd4HTB7q+xv7GcaLhiQR
 1ENJjypTT8dDE3QAIKuFV3ZCKrnt6gLlutQ9dn8fCeGX4bBvmdXZ63feWrawOebB8szC
 9pChWwCKvf5WXUvoZPh3z1A5cVcNZn8bqVMghm67H4MrYitknR5r7XN6/4mo0j5NlTME
 bhmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX72rBVbdJ5rzxMFmtQVAGo+IWCgmMurSEgS2zb48NSdAIewFPMmR3avRRJn+wsfqwwKGXLw03CQE4aIHGCZRQ5wbz6
X-Gm-Message-State: AOJu0YweSWCHJbuKx29a22pb434KcIXgv6cSmYO/OAgueVbc258pIxMw
 9Rm7JY9CkyEmJLMzoNjTLcsr58Vh7xJVZF/QvlKM/oIOASBdqWUXbsR42QYrm7w=
X-Received: by 2002:a05:600c:154f:b0:412:bca4:6a00 with SMTP id
 f15-20020a05600c154f00b00412bca46a00mr3287036wmg.18.1709319870300; 
 Fri, 01 Mar 2024 11:04:30 -0800 (PST)
Received: from [192.168.69.100] ([176.187.210.84])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a05600c45d000b00412b67388f0sm8572229wmo.6.2024.03.01.11.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 11:04:29 -0800 (PST)
Message-ID: <1068621a-fce2-4c1c-80e4-a9f5cec74e22@linaro.org>
Date: Fri, 1 Mar 2024 20:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] target/arm: use FIELD macro for CNTHCTL bit
 definitions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
 <20240301183219.2424889-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240301183219.2424889-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: J9LLrPA/BxQj

On 1/3/24 19:32, Peter Maydell wrote:
> We prefer the FIELD macro over ad-hoc #defines for register bits;
> switch CNTHCTL to that style before we add any more bits.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 19 +++++++++++++++++--
>   target/arm/helper.c    |  9 ++++-----
>   2 files changed, 21 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

