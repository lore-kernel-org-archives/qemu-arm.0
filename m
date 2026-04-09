Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B6EE98FAC
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 04:48:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAhJg-0000bB-84; Thu, 09 Apr 2026 00:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAhJZ-0000ZR-N1
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 00:48:26 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAhJY-0003Kq-4h
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 00:48:25 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4887f49ec5aso5812115e9.1
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 21:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775710102; x=1776314902; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K2em2HJoNSMypReWmmrKJotGP+z0X4FtLDyx/1r4xGI=;
 b=r6IZS8Pznwba5xOTuTcqbSsT5jDO+ehiumtUtxaIKCh9FI6qGdJilCQWxK6V5xvqtM
 IdbYi/Ydxevse1e+AGk70/3XHNYCBnPOjqKloH7+Njxas5ZWCwoyiF6jvtRgP39P5beI
 /nNpriUkD7/tIgM5D9DCisULkJKbmb50WfmU7duBwvRV4hrdhL37EMWCe1vOSz92vJ8L
 we9KJkVGZFrUS4Xhe7PCwPzrvNNo12mbFq1TnNjbLV8osXqennofqWjCAPfmNKnOvcRR
 rBtVzxkUT/vVoSkFugyRiN5VjwPWqahMYYQaPnlB/+bz8jvjIclZXoNyHmy35cKfItnR
 Zzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775710102; x=1776314902;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K2em2HJoNSMypReWmmrKJotGP+z0X4FtLDyx/1r4xGI=;
 b=njxsZ00swNGDB9Jp/S4nD/fqQtnHe9pfqIJV6Yw65VXGIhS1mjenHSOT2qiypr0/en
 etrCBRKLD5sCmuZmuNvQ/LaasdDp6CH37cgl+JJQAQyZdMLs/1TnxEe0mJYncxNQvqnC
 FLnLVaoC3ZneL153QwB5ydHnq32E5qT7IEIxwBgg3oQHDSy4n9rBJ6uAGRgjoz4coBED
 rEX6Z1R57+5upBhBrOQsreSGWGrGyxOCR4vccMOVpRu15RRDGMNAc9ADKOsXBo4OfbsX
 mF3Q0yXO1b3B4uUBoQWYfMUoGwnvIWXf85yTxQ2cHyzejm28jdQ/itq/m9cugucoPEcL
 Lurw==
X-Gm-Message-State: AOJu0Yxu0dn1HXvtoCIpIsQBhyigyWwgOQyWc9x/kU6fd8TTQ0Fk9qCH
 8rzt7xr1uQftiOGE99lLlPk4x/zU6NOh2lHW8wiIaquIRy7bcCC+QhOJr8ma4Tonmyw=
X-Gm-Gg: AeBDiev3KR9LC490PHpAxalq+eQSHA8FtPcQhFKKzIgLRHjhuSH98Dsh+E1YOCdzITo
 ZNFx7yRHaaxf+G74lV5YrrhtjODRReibp3E8mpMkKs5vWuYBZZUerl8rTUhpsmQ1hhRqiqn+fv7
 o5MPwFaIrDLYSR13vpr7iUa01uOPgFrrHbdXqPBN67E4PEdy0MekJ7qJqWPnj0Fa0CihzQc7BkO
 DPAQ9tflCmQ9r4TvqFV+Hxb5Zc6gR/FfMe8uHqNIaJtE4kArR+MfWSTn7WHJTDi6d4zgQiFgwDP
 jV5k+4hW6mHxzenHdAxd3rtjyLwOwMi7HAPqGRpL4xzuULM/32JBh4PNJPYZYwuI0fr94ZCwG1/
 /okRE/BhN5brceLrjwx/xjLxxS1odmqekhHdJBnz/m8ZVNSrBg7H0Ajod3+70u1r/7TmmtKW8gI
 2y0aAfRKGHWz2N0xKa5+0hHHi2zCFW2N1jq2EbsDnDmwyhHM1IeumFGr1kOLaCOvOdXQ==
X-Received: by 2002:a05:600c:3546:b0:487:5c0:671f with SMTP id
 5b1f17b1804b1-488996e8774mr332515595e9.9.1775710102482; 
 Wed, 08 Apr 2026 21:48:22 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a6f1esm62059131f8f.2.2026.04.08.21.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 21:48:21 -0700 (PDT)
Message-ID: <b6ecd9cc-ca5e-43bb-b0f4-4128f8b947c0@linaro.org>
Date: Thu, 9 Apr 2026 06:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] linux-user/arm: Restrict regpairs_aligned
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pierrick.bouvier@linaro.org, peter.maydell@linaro.org
References: <20260409035015.132370-1-richard.henderson@linaro.org>
 <20260409035015.132370-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260409035015.132370-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 9/4/26 05:50, Richard Henderson wrote:
> The function regpairs_aligned is for extracting a 64-bit
> quantity from a pair of 32-bit registers and does not
> apply to AArch64.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/user-internals.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

