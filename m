Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3529414ejb;
        Tue, 6 Jun 2023 07:30:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Mt1CsTvuNChW7CP5DVFJpzjAh9mgKjfnfRlPrq0y4WZgTkeBSb8TA8Lw+rC0TWzoHXJ6L
X-Received: by 2002:a37:c84:0:b0:75e:d598:7d0 with SMTP id 126-20020a370c84000000b0075ed59807d0mr1298962qkm.15.1686061807915;
        Tue, 06 Jun 2023 07:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686061807; cv=none;
        d=google.com; s=arc-20160816;
        b=Bbtc4BD7Q7IwNW08hnS5WtWiL7UbqcxQ9MDO6oIer5Qyt7DEPDGfI+MSNU5EtHvFGr
         Tzq72QQyl0oT/84vpxXBtUkIkbsU6Mswb+TRHMkI/Cncs8C/Ihrf+8vqLAid2E3bxwq5
         IPAm8sgDPbm9VMIlira68n4d9FtWzpq/V7b93Zf+2/vmu2DY4mR2k6vCYEyli4T0DlkD
         YpeJaWV8O71N5s+YpwOLhFZfR1nA5yRztO3Q1hLPznUhExrOiI7BOPIOrX/7zhJgd7t+
         hQq3+VfXJTWPVpmLTQ6oxYSKUc4yHy6I4lpPM+0mJIrRy5ExZgLmde9+70Y3+h/KVH+v
         BNxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=o0XnDz4BJ5M9khAi12lzjtgCuFHU98s/PWfB01AaiPU=;
        b=DmqvSALttpEwQ3Rd02OcHu2Y+nHTJEZ2LqVx7aBqYs7DI3JR2puQwwY/q+P6t/xHFv
         cZ0ubSKqzcqOPf26fhpR83un6gpYxpi7rSNH1PEuVRKmKR3Fd7ZKvcVdPxb+LVfkw7yb
         LCrXaWO5rt9ogy1M+7Pi0Nltsd+ZzOJKPweInDvvQfoH9lMjalCe/AR2U5b+0Mc0EltT
         5IKc8UMWLhf8lp1usqhQQcQ9ybqxyseoakXtdMEKMUsWkowVK/c0qSqBapVop3kaE5aZ
         YLlbNzM1bpZBAKvKtDKHVTtFPtRIktmOsv8mpYlFkvnlhwjDJCkCZrL/JW9bhWXcWEsY
         m52w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J2CyBKcY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p28-20020a05620a113c00b00759348adce5si5785613qkk.196.2023.06.06.07.30.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:30:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J2CyBKcY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6XhA-00039M-Os; Tue, 06 Jun 2023 10:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xh4-00032m-LX
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:29:55 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xh3-0000a0-3w
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:29:54 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-256531ad335so5079390a91.0
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 07:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686061792; x=1688653792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o0XnDz4BJ5M9khAi12lzjtgCuFHU98s/PWfB01AaiPU=;
 b=J2CyBKcYRJxR4uZyg3TRESo9+RxXyDoeFAQacTzIW5A5tvIdxfYs+lq1wlrQOEieVg
 u1pvyOdeXnq4zuo75bgOBQ5eG+hPhltMuvYJ7F4rWAsWT9WKEcfPBd0/FCjNJTgpONGK
 n3VWtCIktuXh6rDEXaLKRdaLMOpNmnHn1jaFGdbzxo3ZFoXisAaI+oVDiDZOzy9JukRq
 Gy66MkNy+JHk/clJqoQCg53FQ4c0eskWrJfgrr6bx30n/l0D2JRRYTOkB8rjvSKiOgRM
 88tMfQkDM5DFeqjMtCjkkAvC448PkFuSalQ8UFMbjOjCH/CdL7CjxubWd+p3LNF6JmXc
 fG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686061792; x=1688653792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o0XnDz4BJ5M9khAi12lzjtgCuFHU98s/PWfB01AaiPU=;
 b=MlL5rAQ2xLEQFZ+vlgDVB3FF8lc61/RP767KfFSYu7mWc2L8YVIQGgKNJkpyJ/khX7
 ByKx8qPyroWkUVqIfeIka+AMfKcDuRmqMGsrGyL1bghT/f5gXy+k7Sjnp003CjIyTqFI
 g1tURjhZxzgSUyiRbSR3ng1D9otpd2AZxHPhIAr4jXUH6fy2sCefiSWRYVw/vUlZPFn+
 7km7saGW5FxOUfC6Vq7tuA9NLeBvAQHYT8DqD5gg9KEUpijBvKQVQUOgLRQci3DAEdrR
 Vj4gAE1Qt/G9FmMr1JsaRiaMe6RXs4600DCW1lS9578Wv8TMnvT7cfiDWx+9WuixLc3U
 R/8w==
X-Gm-Message-State: AC+VfDxD0KS6fqRNMtfw1lEYK5paN98R+71hV83lQH8RkrMbIZ8cUPb1
 wNLQk4vlTSJU4ZhBh8SQnsccTw==
X-Received: by 2002:a17:90a:194e:b0:259:224a:9d05 with SMTP id
 14-20020a17090a194e00b00259224a9d05mr2090396pjh.3.1686061791808; 
 Tue, 06 Jun 2023 07:29:51 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 em20-20020a17090b015400b002535a0f2028sm9551098pjb.51.2023.06.06.07.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:29:51 -0700 (PDT)
Message-ID: <324917f6-62fd-9930-8d33-725ec934ee75@linaro.org>
Date: Tue, 6 Jun 2023 07:29:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/5] tests/tcg/aarch64: Rename bti-crt.inc.c ->
 bti-crt.c.inc
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230606141252.95032-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: POaelspynoq7

On 6/6/23 07:12, Philippe Mathieu-Daudé wrote:
> Since commit 139c1837db ("meson: rename included C source files
> to .c.inc"), QEMU standard procedure for included C files is to
> use *.c.inc.
> 
> Besides, since commit 6a0057aa22 ("docs/devel: make a statement
> about includes") this is documented as the Coding Style:
> 
>    If you do use template header files they should be named with
>    the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
>    being included for expansion.
> 
> Therefore rename 'bti-crt.inc.c' as 'bti-crt.c.inc'.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/tcg/aarch64/bti-1.c                          | 2 +-
>   tests/tcg/aarch64/bti-3.c                          | 2 +-
>   tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc} | 0
>   3 files changed, 2 insertions(+), 2 deletions(-)
>   rename tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc} (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
