Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4378ECA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:26:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usO52-0002Qa-T4; Sat, 30 Aug 2025 12:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urkAQ-0003br-LD
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 17:28:22 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urkAO-0006Zp-MV
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 17:28:22 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso8955445e9.2
 for <qemu-arm@nongnu.org>; Thu, 28 Aug 2025 14:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756416498; x=1757021298; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BlDpQGDeexgL4ACGGabqUtWDKUNnzKeqB7cELlVQs+8=;
 b=eGhyHlhsLBkSjgs5Aygf9/52QDZm9JG6urvZlwDRDxce1sXg7wOnwfQYen96HdGRpg
 b/hNJ37VljzAety5WdRH2aeyMnOqX3Ecj5knJET7Pdti6BmoebsxauyHcj1ZHK/tSC3b
 KaFgPpm0dCfPlx9xrlZZ4TqM/A6a4Rm/mVj1K5iOrhU6T9CGUHNcGFwo0rmlgPmQW4AU
 GNnkAVvW8URmGaT3w4QX3QKWMsvlp42HuBmlJ/97yH1D3FAxxGUYVuv7VFyw4bEQQNa/
 JnEuwB9iFdZFVKv0F+FaabAR30if74Z3Uh0N0MfBIPio9IzVWtA8refFPHoVPEmfzAF6
 9k5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756416498; x=1757021298;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BlDpQGDeexgL4ACGGabqUtWDKUNnzKeqB7cELlVQs+8=;
 b=mJ53aS5aCxS6aLzzeB+5J5bRpf2d+SFebJgokNXz2azs7QhFfx8NYol6Lenw3vElcI
 c/eraCkF9ZtCLhRm73OBu7yXH5WgDsCldszQp656viRXShLgdf7tbzw/HA0+uiWbClY6
 NZIjCUhnmcwY5K9CjsDRlL4uvNZsIzDivETcEzQBgfqOYD6TMZXi+pYZ2QuWv4hJ4AsT
 gh1O7VKz/1L1aEQRUeYKeH+btXgK/v2MNmm9sQs1Uzhv0G8PObXTTglUnBy9ffSGwOrU
 ImcU9SNNNOT48cBiZUgZXFaZUie06JOUnuUT/mL16D9NW9mAs6ArRHKa25bGnFxSGX1g
 bLXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDKMLI3mI7OIUFRgY9DSy0NZfiYxodcEsGasNw+YT7is9Y2xWGECuyr2Uoiho2IKwigfHSS4JEbA==@nongnu.org
X-Gm-Message-State: AOJu0Ywcmzb4s0TWOwNec/8nGzn7qGsh3CDQpZ+C+oJtVkZfLY5UEZca
 h4eKPxykmxJMNPyjh7Vmk3s/6DCFF/+YuB6Gr1n8eoT17oWU+1Du2TT/QOwq6PzReMY=
X-Gm-Gg: ASbGncvlaHjGm1EvfysgCY7+ABx9PzxwTc22uGNpMALnVXqaEdWRBYxoXOmzmabKwVy
 Fnsy0X7o5RdJ3vrYBBNmED8mt2haWxLjwYpfvhyOtbqLcnVw5Kb1mBAUnJMzbZQ7WJ+1BuBufxW
 fn5fSl3CMtbwUkrjNqGZng8vYqyBaR+EL6HICj0w54VvWTPjKAXpUBgRqXHcjpiMHtThzi9irP2
 a9ni6E/rNLV3J4094CEkc8b+ZR8Xrppgqvkmc5yJQLtlh1isbUSQjyFhXXRBSUvqqzY4/L+pXhp
 0pnQlWlqJ2rpfhvLWnsgnhSdcc4WdaYd5HoIaOi1E0Ct1fmw8kYe46Xz1UoUdU/tpHc4ZA2a0qy
 QDHXsb9RrGxEXDBXt5DT9CgsLlCQrm1d/ds4nJCpzv+CWKgGBW78D7yAZL3bZJQIGJ+24nEGyI2
 rxwDQRoevKMlE=
X-Google-Smtp-Source: AGHT+IGDHOLM+tjMssymUkWg8aQ5/CY+ews9bcwv7CsYLI0owO/EK0aksL+ggx8eAgmGenbiJEGbtw==
X-Received: by 2002:a05:600c:8b47:b0:456:19eb:2e09 with SMTP id
 5b1f17b1804b1-45b521ca71emr240993555e9.8.1756416497841; 
 Thu, 28 Aug 2025 14:28:17 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e7f0dfasm9828025e9.7.2025.08.28.14.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 14:28:17 -0700 (PDT)
Message-ID: <23ec53e6-6cf3-4677-87a5-44063c5b0aa2@linaro.org>
Date: Thu, 28 Aug 2025 23:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] target/arm: Remove deprecated pxa CPU family
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250828140422.3271703-1-peter.maydell@linaro.org>
 <20250828140422.3271703-2-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250828140422.3271703-2-peter.maydell@linaro.org>
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 28/8/25 16:04, Peter Maydell wrote:
> In 10.0 we deprecated the pxa CPU family (pxa250, pxa255, pxa260
> pxa261, pxa262, pxa270-a0, pxa270-a1, pxa270, pxa270-b0, pxa270-b1,
> pxa270-c0, pxa270-c5).  Now we have released 10.1 we can remove them.
> 
> This commit removes only the top level CPU definitions and updates
> the documentation. Removing the CPUs means that there is now a lot
> of dead iwMMXt code, which we will delete in subsequent commits.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/about/deprecated.rst       |  21 ----
>   docs/about/removed-features.rst |  14 +++
>   target/arm/tcg/cpu32.c          | 163 --------------------------------
>   3 files changed, 14 insertions(+), 184 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


