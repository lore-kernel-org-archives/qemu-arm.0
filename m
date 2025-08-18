Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D067CA0EE4
	for <qemu-arm@archiver.kernel.org>; Mon, 18 Aug 2025 06:16:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1unt9k-0008Tc-4i; Mon, 18 Aug 2025 02:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1unt9i-0008SW-LI
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 02:15:42 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1unt9g-0007JD-Vs
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 02:15:42 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45a1b0c8867so29484995e9.3
 for <qemu-arm@nongnu.org>; Sun, 17 Aug 2025 23:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755497739; x=1756102539; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hLogK+R1RBryQpe8LLdPWEj6d4ZcliC947B39ttSJUY=;
 b=ouLXka2tRsfdcMRYb/JmVh9mvohtS/VAjJ1mCE3uBkr+l5UL3fdGBiVmI6vL+jcUmC
 meD9vmkr0PBU3mq/ZzuBUGDV4aDWv9IKY6V2RPdpFJySC/c7fw6kIYXSQMd4TZnsQ5Of
 unAc5f33FWt4bqVuRbW6TIbd4jeCjt61f2sN2/ZdVEpkYBB4gx+tx5ePBRs50t3R/4h4
 W+NJ8CdkIedMR9WYXodyJWbBS2mLqgTK0vk525szXaAc3nBnDUgtDev2Zf/fPhd5khBX
 dAw5pbA/B2J134AOfSmew5X2YeAu2OkTH/TZJPCcFpkT1YKTLCWFHh0nzXOOrCqQ+Tnb
 Nvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755497739; x=1756102539;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hLogK+R1RBryQpe8LLdPWEj6d4ZcliC947B39ttSJUY=;
 b=F6Y+ztd01+XNzdEHF2VFDzKk/SWJ3VYjVZkHzchgOuxAyQBaEzhax18ENzWgK8mf6a
 yJt1JpUrF3aEIsg8JEn3QqxGElPDFrZSd9uzpb3dB1MsNyAyLTaqFsYN0bFPkQEBuBRz
 dR//7N6hlBIIoEFjtedoIyb+6qMqu4hLYW4ZgaVTW90meZkqSXH4mgzJ+KhxtPOsy0xX
 4ybhDIxij0lTyxU2favAJXwn2QQp21c48Gh6LHCo7kM6Bt5LYTuBgSr/RNzf25wYR4Zx
 NIH7ZsRlcCI5eVGzz3GC6wVNK5YTb3LfbwxOI2JKYKDmBVxGOywI3Fo1pTyuX4f4K8dQ
 vW3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQZrUYGNA4NBOCh3K2V38ezmJ7lQkK19qdC395kfCXKVKy6fzuLIevMAtFxvyEqZ0ThDfWQQtceQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzw9DIeH72kyWeDhMtYrECQNyQOgFdkd/O6cRb74LOQbz0e72jG
 mYb3XVBWTAGLFY0gAqv7JssBb8LQB3Qtfc+UOYUTBSblQ4b/VdxXja1M7VmeCALHk2ONsaAlvIP
 Va0Wz
X-Gm-Gg: ASbGncv959/y3QXHzRe+sBwg0yeqEHNl0fY7qNdbK64WtMIY0V4Fx6zhTzxtLimT/7g
 qYImvUPT4sWgLzWEpsdxy/xfyAXJ/kw4oehIuJDgjgfDbRKg9YtfAMwkdWWF6mJfzBGD/TTruQJ
 O7BfVJktcQQQKP1XdetSpmLP6Oecf2W1e1U1A94GN7X21HIsFU9mzeNdMg0Ojva38pqovXoTEiF
 GBVZ5yNNCoU/v85z+Fcy4oXnog++FDhtZoBv+r5iNV8HXFWbDyU/hbklz/WbnXnkKv/GmEJw0+g
 9DtJ22X1hpK8GgtNk9yQjggZ9vXW3l7ZSKdhqMxEkKC/9u2nx6Zm5pki/dpPY8Lgpl6M4wA/lQz
 71yjSiJ8p4ZjpnwjUSCm+ijzlv+u5UtUyTUto+Mmam1mZFlvVVXy1JTeROtAjeiF0Mw==
X-Google-Smtp-Source: AGHT+IG8zV/534OzQed6SUnQjzdA8jmCCaRWNSvgXdSwjelclVS8XKlraa86HHhFz3exhJMMzISCcQ==
X-Received: by 2002:a05:600c:1906:b0:459:d8c2:80b2 with SMTP id
 5b1f17b1804b1-45a217f71b3mr65203815e9.7.1755497738880; 
 Sun, 17 Aug 2025 23:15:38 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a22321985sm116395245e9.17.2025.08.17.23.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Aug 2025 23:15:38 -0700 (PDT)
Message-ID: <8f701cf5-5187-4d46-b6b4-1075e090efa9@linaro.org>
Date: Mon, 18 Aug 2025 08:15:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] target/arm/hvf: Remove hvf_sreg_match.key
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mads@ynddal.dk, agraf@csgraf.de, qemu-arm@nongnu.org
References: <20250818041354.2393041-1-richard.henderson@linaro.org>
 <20250818041354.2393041-6-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250818041354.2393041-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 18/8/25 06:13, Richard Henderson wrote:
> Use conversion functions instead of table lookup.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 35 +++++++++++++++++++----------------
>   1 file changed, 19 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


