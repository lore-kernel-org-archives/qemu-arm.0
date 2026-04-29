Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A693CCFA13
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 18:46:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wI9ux-0001SK-QY; Wed, 29 Apr 2026 14:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9uw-0001QC-2Q
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:45:50 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9ut-0002af-Fh
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:45:49 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43d64313c39so85729f8f.3
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 11:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777488345; x=1778093145; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=otR7nzyBm9qB/OtUMZdNOUoLplrO3rWA+tK2u4B8a14=;
 b=farx2DF+4/7BzSaRsI0hk2RV0bGfAHJoPkyyVzxVLvxHPFVAUYdrmXZT7f0xghzgFw
 F3OUNI9wXEw3Hb443z9SDNBjVCpQFxR5tyLX2hYywrUDGXcgKvqAy/X3TQ31jzY9Vw1c
 vaYzoOiwl0WQwP84cWr/J+3CKrsQk2I/K7iEgRQt9VqgqAZB2yvSZEBVCRe7WCDFr8ru
 +D6Yx95Y6X3swiawx1FUYzt9bh6LXbLlEimkd4Fz0UJ0l4JvyoKjz30v1uWYsXdPmg41
 5AQ/BHOv+fdukSf6Hs3FEe0nIUHzNgccO+qiUIiB9RtYStlJVBLY/kLwDYqxWH7eNmnO
 kOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777488345; x=1778093145;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=otR7nzyBm9qB/OtUMZdNOUoLplrO3rWA+tK2u4B8a14=;
 b=cmxBSeA3e6HFBJid8rUnLfITSHnbvX0s4bF0L0TjGNFM8N4myMZec968xuchy5UsX5
 mS+ZF2IcdBAoeWOXkkQophelE5g6wbXGs47ndazRJ66Zokl6W04BxPUsHgO5TOKkZgzM
 zBtnooZOVHX/ffEVLLn0quWjSorIAVP9x83353FpPM44JSuZ/82Ww5/TMz+WfZzAo2Rt
 hST4Onh5Vm3CqcUQ+XQx3BVf4F/Cm6tlP9ha0j/kRx6KooKWZKxcDH5UTBhfEsvgf44E
 6EJ7QJ9kr6Q8HGPf3JEhPWOFYllEjodCzt4qQpaV3UxmyzS9jLY4e0/lKGIhj4HoWGP0
 Sy1Q==
X-Gm-Message-State: AOJu0YxV9AfpzFA56c6e4A0vUcY8/qX3sHzs5bD+R/1JDhvvC+LMkJ4U
 HSZ8JihIa9nF7ZQWX6xkCIo7ZvDDTLmnUAOOjqaBAGLISrwdn6eWFCFB3mS1RiQM+IdlGET+tp4
 ShVyeBt4=
X-Gm-Gg: AeBDieskl4ugZf0ZGkeKStGwsMk7AYTzOq/8UkvQKpf6KcyamWgPnfGBdMMaV8fKzH3
 6dcnQlme9oS4s5OVNI6s1Ts0EuASXnffZy4llgkmZiY7UyHB258M7oLpLhe4uW+5HreOOgsikjm
 mjm3vLtuSfcISJWxCFb7BDs6lo/EaXwofjTaWFFLEi+Sb3IljUHEWua2lYCJqoboUXShC7NqGsN
 5EzGQPMpoqcuaukkyg2vOHI1i9djMPO7mW08DXc4Nmy+8SqjW8rGzVTztvA+iDS6/gbkS5qYDB3
 AQpa8h6g5GJRXbv7ofNQDm/P73lBw/YxJMddIJYb4m0J1ou5UwJkePJ4wdRawzlwo5ENHpWKX3z
 qnAuLmwL4jQMi/dDEhXBjfNkTNABrq0BrnYjCDZc9z8jrWPfd+X5jTJO7aYDnowWy+Ci5GP1Pct
 va2eYGHlL409e+1JDLQx8aSkC/XCeOz9gYkcvCDrTsOi6tVJMPwakUeFlccTnObeWnp03Yb6XRJ
 gTGGRZBJJwkwGQ=
X-Received: by 2002:a05:6000:44dc:b0:448:75b0:5ae5 with SMTP id
 ffacd0b85a97d-44875b05b2bmr2550065f8f.0.1777488345117; 
 Wed, 29 Apr 2026 11:45:45 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b76e5c0csm7407810f8f.29.2026.04.29.11.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 11:45:44 -0700 (PDT)
Message-ID: <53bbfe05-7022-4144-961e-5966f53d1c99@linaro.org>
Date: Wed, 29 Apr 2026 20:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 45/84] fpu: Return struct from float128_unpack_raw
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-46-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-46-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

