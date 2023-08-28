Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3185324ejc;
        Mon, 28 Aug 2023 11:36:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFa/aArucfiENdrmSvf09NYKibTtetYvgktyS+5L3SaWEC9qOMgJ6mkzDqfDDa/+8hWYOT
X-Received: by 2002:a05:620a:d8b:b0:76c:bdbd:c521 with SMTP id q11-20020a05620a0d8b00b0076cbdbdc521mr29066891qkl.22.1693247787311;
        Mon, 28 Aug 2023 11:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693247787; cv=none;
        d=google.com; s=arc-20160816;
        b=WfE33Sz5KUfa6ISK6redl6glMQWttMwz9tmaChP8/54XB6Yn7S2kQPymF9IUOL71p+
         1gnPKdwjGkbFKjz2gq3AABFLE3WTOw4mBYL1Sx5oEtSLTqsjFtGqJmymx29tFQy/lsM5
         YOyMjF4Q4Xz02ZVqpZvZPgpz+ueWsqHQwDiNj+rSb+4fOWhUPQFzq0GK++qECvnbllQq
         ve/k/x4ZTI6nSfWEoPV7J3ahTjb0iwX8+sleprCBUa7w1WHDDzLJmql9Xo41lYqq2BMk
         TxmN0uBG89dluzcNhaoCWfR+nk2m4g0TTUlQ6HErD0wdBh+sKYLn7XQJ+Wb0/MUo1U8A
         kw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ap35gWkmsKtps5FixvK4VRHP/HpmvmfPGyXutx6eJ9k=;
        fh=vc+nqmKDbTj+9KCVcVasbHFTqitsy/RlC8F/3ZcIIWE=;
        b=jf6K8DdKYNOQ6LIOA0PXkiz0diqJTL/dCeAHxF0k96lTYUcPwqvpXHGzvlYeICnGNF
         psLt3hzwuEQ/RXUynp7xm6T+KIIhx7WB0fMmcX16ARN2FIwm3kjmHvAla/0GL9QMocmK
         rGPI5x5Gu1WEg6/RbtHx36P5hWe2Hd/YJr74blXN4v6owzsTCjHwQgws2/dYs4WyfQ6o
         ubRsdnB4NLDtDemrBE5isFOcYrEmIEd12+0Dq995JN87QvmjrUi3VB0oEjVzD1GePytl
         UjWh8Kon4c/1ubwN7PZyNEalN249QCTJSKmMw8UdYh13ZHWGI4y6cWq2p++fOl+nRHmw
         JMiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tmUqA4Ku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ra15-20020a05620a8c8f00b00767f8651ee6si4941402qkn.25.2023.08.28.11.36.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 11:36:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tmUqA4Ku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qah5m-0001BP-Ht; Mon, 28 Aug 2023 14:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qah5g-00017i-Lb
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 14:35:58 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qah5e-000713-GU
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 14:35:56 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c0db66af1bso16684825ad.2
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 11:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693247753; x=1693852553;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ap35gWkmsKtps5FixvK4VRHP/HpmvmfPGyXutx6eJ9k=;
 b=tmUqA4KuNEmgJGwUVwW9g/VmCZ+HEDfU7lDAK6e7o25DhCF50HDs7TYKShHubFC7L+
 BDbKMwY0DFIpsXAG5XU5fYQAHnaTOcvBy/KXi8vcS7pDC7ue3Wlkzy53ewqEI/e2sUGj
 N7Opel6XI7J6FY9a9/0YeUEksMzPBmnWHhbWB3hbLEHVR98hWgPJGR9lqvQgsHZu9JJs
 5V9EV4KsB3FT3LAeaAhob9hW5oI8ZtEaKfGKFtpdqIu7IsgxK7Dulwwtl20D/3mfUlFR
 CTTGOhQgxF98geDcjlDuWXUFuMxQwTIs+1ZPcu0MqdxIxJCsiGDyKRS1wlvuU6GRCMSM
 c6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693247753; x=1693852553;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ap35gWkmsKtps5FixvK4VRHP/HpmvmfPGyXutx6eJ9k=;
 b=bmytWfLuiYeQMQtltdFgW/afGDkChEkqmPSNVWDPaR3VCpPupxX2vk4KHFnqvF4rHS
 v2uplY9bxZZ3/VnBLjuukGzuhio92CEgPjL3OAtKt9AjSa/JlAJzVlXxnkKiJC+WOspC
 xmSjOSDMycZiYv6xfmJRyEqonxHPfAaZq+uai6tdohPwSe8vSgoUipZNSS+9+l98sMN0
 FtFrsTdhYsQEzqkAlNz2GerWDL5STh3LG9haUxtiw2X11RIwrcGtx+80VQcHEMwa3C4f
 NLyA1j8kM8uufiGCnP+aVBEG112I9r8NeWJbkdqAD2gWrjXQ22S/kYRuPj2JJ0COw8QR
 miqg==
X-Gm-Message-State: AOJu0YyzcHlExAS/7avR6u9SsMBXpSzFU0aHhW2cvPoLR3Unsa0Ql2TL
 5Uls31LDJoG3QdABS5jazKmmdw==
X-Received: by 2002:a17:902:ce81:b0:1bd:d92d:6b2 with SMTP id
 f1-20020a170902ce8100b001bdd92d06b2mr26038334plg.10.1693247752847; 
 Mon, 28 Aug 2023 11:35:52 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a170902d51000b001bdcd4b1616sm7698861plg.260.2023.08.28.11.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 11:35:52 -0700 (PDT)
Message-ID: <218e2242-7e72-68d5-471a-6736521dccac@linaro.org>
Date: Mon, 28 Aug 2023 11:35:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/8] target/translate: Remove unnecessary
 'exec/cpu_ldst.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230828145545.81165-1-philmd@linaro.org>
 <20230828145545.81165-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828145545.81165-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: nt82yQUebWkQ

On 8/28/23 07:55, Philippe Mathieu-Daudé wrote:
> All these files only access the translator_ld/st API declared
> in "exec/translator.h". The CPU ld/st API from declared in
> "exec/cpu_ldst.h" is not used, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/alpha/translate.c      | 1 -
>   target/hexagon/translate.c    | 1 -
>   target/hppa/translate.c       | 1 -
>   target/m68k/translate.c       | 1 -
>   target/microblaze/translate.c | 1 -
>   target/nios2/translate.c      | 1 -
>   target/openrisc/translate.c   | 1 -
>   target/ppc/translate.c        | 1 -
>   target/sh4/translate.c        | 1 -
>   target/sparc/translate.c      | 1 -
>   10 files changed, 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
