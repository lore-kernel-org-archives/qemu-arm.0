Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1094098ejj;
        Fri, 24 Nov 2023 03:42:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0m+8rN4Rsm+7P886tKku7JlOHw6vgUL7uX4Dp/xosIz8xmDYUDpMbibisZc+e+BIvfoYy
X-Received: by 2002:ac8:590d:0:b0:423:74a6:f83f with SMTP id 13-20020ac8590d000000b0042374a6f83fmr2413655qty.10.1700826131541;
        Fri, 24 Nov 2023 03:42:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700826131; cv=none;
        d=google.com; s=arc-20160816;
        b=tEd0FBqwW2oj/P7d5PbgqaViwr3gYRFZy9jnTWMVkQaoBcbk65uR1aOsJgW/BrF3/A
         B2A/RKYl8b5Ti8juWpZwRDwR2YMNTA2W4RG1ii4Spn8POvFk4pBlcoUgeinI7oVw67zE
         OAQ5+5fFycw0DkJNl5l8TobcFTNECJDewLZ33BIRy0HbHfvA09kYxSuM+8tiKXg2PleZ
         DrFUqxm8DRRoQM6y5VT1ncXCt/24p84+KSdXDAEt6YJVYF77abVSp3VfW/9cF/FEZyFj
         ItZIsKNlDysSfUj32ZWblY0aR1gd3xR5pQlQd1AED4f5Zvfa045r+A5hLN4rdByFYbTw
         KnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=LLdTj1hC4loE8PyfPU7TG4P2nXHktOX8GhzvC206YiA=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=LgwiOAeeSXWvz8yY5uanVzvoQcB5+Q8LxYN2mEDGPTsYjyFaa2KXDPYu2YvmU1GO1R
         WR4NVvL2TgEm7oqVw046FqIMHTXQX8RD3qA+6r2Vq2YC0frB1tydSWokKbqx9iHUE2kx
         +7m6vC9AkEGfF3D4jOj6lFzvZZDGwZEdRQ6VfoasIxtcFE0rHyEKDoa9Zq+DHyikI/wC
         trVMZSuGDutVwR2ixFoFZiOO6QdVOslgbkaTiVugEkJDZZupM3yHoxRSHZ/qiGB5jBt2
         4P3Z6lJm4c2Nytm9aaoJwxGra2XLsV5zt989JfCN4lRMFauNO4J1b81UA5LlCQgYR+2H
         uiiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TwqlhA++;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020ac85f8b000000b00419576c2d1asi3112347qta.773.2023.11.24.03.42.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Nov 2023 03:42:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TwqlhA++;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r6UZC-0005ZH-LL; Fri, 24 Nov 2023 06:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6UZB-0005Yy-1U
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 06:41:49 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6UZ3-000143-Le
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 06:41:48 -0500
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50aabfa1b75so2484666e87.3
 for <qemu-arm@nongnu.org>; Fri, 24 Nov 2023 03:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700826100; x=1701430900; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LLdTj1hC4loE8PyfPU7TG4P2nXHktOX8GhzvC206YiA=;
 b=TwqlhA++tZNMhNfxoOw5z6r9q/7w1SM+cbwDI/4CeAEgvlFaRTEPuroH3eQV8R6o0N
 wIaFbJJimpRMOb3qscXwRWaXHV66B+HmOdDaMyjJCNWgi3V2/Yyep7ny2fBgl8Qeihuq
 1M31IJa/FAxZm3BQA/m3+tEKqtahTWTd/qzBhwNB2AJU4MEcDw1DsFCydNHaD0KN0gsd
 czQ+4zD2wcKoGzyuZ9AkZFKT9hfrWgUOPGFnjm6j6U16ybCkUtqXl0NXrE289BlyCLpG
 V0OuFqGiDo7ewg5sYyTPo4ooeIYXzz7Napej1c41x5asTGPzl1zskRsn7u/mandVwzms
 oA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700826100; x=1701430900;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LLdTj1hC4loE8PyfPU7TG4P2nXHktOX8GhzvC206YiA=;
 b=B10pJc5qcIKdTl6+63x8ygabWlW4AqJfxqwWgIsMhTOmYWJY5MB/ixpFm/3qHPJx+2
 VSJIZ3f8II6/4FtF6TXYE+T9Ntrms7h1b/qb/3/gfda4hMdMiw+uS9ijVA+kYqmPo94V
 xGebznsCw5nvtGe0dE/9aFnTmPXw6AiXg6F1u38vwTbRcC1BF8PZTP5fPgz6PnZ/GG5n
 91a6oF0ljd9iX3iALRd4Nq9l7Ima3tKk3GIlbTzrC2SxG6sHyjlSYeoCV+J+hb8AMWnF
 BJuL1cFxP9wg8aT3TzCJ1xWtpZ1R2hp55LNS60TKEJ036gGJHi6KyHTP5yuDJBV+tyVu
 rk5Q==
X-Gm-Message-State: AOJu0YwhMmRBge0qB6U7OeCD6VRmlfcMbu2qGHa1Ysq3Ir0aQ0i8t/my
 xcMQ93l+iA5Ilrg6FRpoN9cuPFPpJ56vXwnjjGY=
X-Received: by 2002:a05:6512:3c8f:b0:509:4587:bdd0 with SMTP id
 h15-20020a0565123c8f00b005094587bdd0mr2414694lfv.7.1700826099880; 
 Fri, 24 Nov 2023 03:41:39 -0800 (PST)
Received: from [192.168.69.100] ([176.187.218.17])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a056000025700b00332ce0d7300sm4102681wrz.92.2023.11.24.03.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 03:41:39 -0800 (PST)
Message-ID: <89482575-2fe4-48f7-86f3-1bd77baa4475@linaro.org>
Date: Fri, 24 Nov 2023 12:41:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/21] target/arm/kvm: Merge kvm64.c into kvm.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: Vm36d13BgJIm

Hi Richard,

On 23/11/23 05:42, Richard Henderson wrote:
> Since kvm32.c was removed, there is no need to keep them separate.
> This will allow more symbols to be unexported.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm.c       | 789 +++++++++++++++++++++++++++++++++++++++
>   target/arm/kvm64.c     | 820 -----------------------------------------
>   target/arm/meson.build |   2 +-
>   3 files changed, 790 insertions(+), 821 deletions(-)
>   delete mode 100644 target/arm/kvm64.c

Reviewed using 'git-diff --color-moved=dimmed-zebra'.

> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> deleted file mode 100644
> index 52c0a6d3af..0000000000
> --- a/target/arm/kvm64.c
> +++ /dev/null
> @@ -1,820 +0,0 @@
> -/*
> - * ARM implementation of KVM hooks, 64 bit specific code
> - *
> - * Copyright Mian-M. Hamayun 2013, Virtual Open Systems
> - * Copyright Alex Bennée 2014, Linaro
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or later.
> - * See the COPYING file in the top-level directory.
> - *
> - */

IANAL but shouldn't we keep these (c) lines? As:

-- >8 --
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 7903e2ddde..b8fc1c8d87 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2,6 +2,8 @@
   * ARM implementation of KVM hooks
   *
   * Copyright Christoffer Dall 2009-2010
+ * Copyright Mian-M. Hamayun 2013, Virtual Open Systems
+ * Copyright Alex Bennée 2014, Linaro
   *
   * This work is licensed under the terms of the GNU GPL, version 2 or 
later.
   * See the COPYING file in the top-level directory.
---

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

