Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4676234ejc;
        Mon, 6 Mar 2023 06:01:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/4OjRnzdZfYldElTYsluJRFLpb0nchuBL+qYsNHvZvzNCxkmzrGPotYgH4ZZZQKo1JFk7A
X-Received: by 2002:a54:4512:0:b0:35a:54df:638b with SMTP id l18-20020a544512000000b0035a54df638bmr4315583oil.4.1678111289138;
        Mon, 06 Mar 2023 06:01:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678111289; cv=none;
        d=google.com; s=arc-20160816;
        b=u9wxpbwXGfGbBSbx2BsNUbVWJAebxTJ84uHjuP6uWxK+RW7njUzLTbE2IuKDv1rorL
         uv9WJWKiJkzwXC7Dwzk/DKZlfrcmlYaP01s128NvhZGPrKwULGP7hryGmsYjCkigVeYr
         iD5WObTzOKmPVKeitVMJT1XAWNYecUCZcTgEChO/NBt8GYAjLn6PdSPzMRC9V187hVIX
         Qs7+73IXdQCk04fkL2cHNhbRIumffndEy8QgXKlwNyEMc6xhdx3806fI1XrbFLsEIjSU
         Zo9V6Z7DrL+4BevvQVU8N+WYsXM8yRolwi0q/KpDOl5QU51a6KA7bGV3O+yRKDBw44BK
         xc7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=G5H00DqeZClDP4eneuHZ7EUSuWlAF3OuS9jWPVr2tG0=;
        b=N0xUE2WJ1HqwQ+QA97uQbKcEE6uLiDpTfkZWoGkIkroSOcWktw7zUbPlRjgOiXSHAZ
         a/P4YTcrhBXCuD8Wm74fX94VyDA547p75pl+ZatgB1alm1cezl2vgxm3mnWSq8ZPHnRe
         ylT/o3ThUQuIz1CHiQiuvBa9lm6tIViM4LwlUI//e56R2Jq8oXAmXziarf02JdXP4bFU
         yM5C4YMBii2e5nBp6KfTF6DcvHMsg6RG4z4uw4rbrXMqwRP0GULmuyyU2HKUG8L01uqy
         oka/G0iPMEdeJR9ndSEqzjRgqHRTtTNTe0bjBP+KxbRVWw2jqbRwyPvxqF1N6Zz3NmiA
         8q5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=upXsa5Dr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs15-20020a05620a470f00b006cdf00cfbfbsi8507756qkb.227.2023.03.06.06.01.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 06:01:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=upXsa5Dr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZBP3-0007qA-DJ; Mon, 06 Mar 2023 09:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBOh-0007Yu-PZ
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 09:01:05 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBOg-0006Uc-3O
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 09:01:03 -0500
Received: by mail-wr1-x436.google.com with SMTP id g3so8915466wri.6
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 06:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678111259;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G5H00DqeZClDP4eneuHZ7EUSuWlAF3OuS9jWPVr2tG0=;
 b=upXsa5Drzs9gyoD+LWu0kYYLAmGEwXA4iqHXi1GveweyjqkmfSrN58tBjw10L9Rhur
 1ybbfyE6dQ1JSSID7nkS8a7suil2WzOOAZe33uXZ6LfG7KsUQ+xp8XDCxuYWJSBcYd+R
 MVLtN8wUJ7f6oe1yybtJgCUsvCdybOdnEh10n22XWrl/jXy9vzjw7JaNPovJi7sA6jm6
 YHKlNNoCUDpFEvxIo3YtrvHr2gN9OKfeRvPPIm+GU3E2jIY2/uRYyDpUn5CIIxnAU5Qw
 QERZRaaoYDjPorKFlIGvuhLM7cjB56tFf0IWfQzWsg/XeFApD/8yVKA1Q928vKCabZEe
 o35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678111259;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G5H00DqeZClDP4eneuHZ7EUSuWlAF3OuS9jWPVr2tG0=;
 b=DC7wJCKWVtrgOZPy+T6gUqoqPFOmmeYuJadLdRnJSXxtbPAd6ncchSCmE8H7w8ygEV
 tHuYDTWmJI+bzJJJHbOaH8Yvfm+X5UADmYsG5Irj8s/RarOniZLY6T6u2g+cJfncyoPp
 x8MQn9R5mu1M8Pc5lR9Un2BVrbO5HIF3uCVFPaHPd3+Lh0YdSHbdzQ/tOFPuQKu68Bsm
 1ZjXIgUGAkc003hH2cechnFCwTiflMnoScACzHxldIBPaxmYrfFjNbul6QuuDpRHblBU
 3bl9RPUe3kK34n7C9QLSOLkjj1Uyul3QVtP9ctdeJe6A5NyI4DLvTXFUnESqArTp+DZ1
 aUMg==
X-Gm-Message-State: AO0yUKVMlbI7fEHTG1JX3YZFdMl/Dv7mblqSvP5vTjqamPXmEFNUd+ZL
 oOuhQx+VzVr4DeESa6QECRkYrA==
X-Received: by 2002:adf:ef81:0:b0:2c5:46d1:69e1 with SMTP id
 d1-20020adfef81000000b002c546d169e1mr8295008wro.36.1678111259261; 
 Mon, 06 Mar 2023 06:00:59 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z7-20020a5d4407000000b002c5503a8d21sm10136820wrq.70.2023.03.06.06.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:00:58 -0800 (PST)
Message-ID: <7b1fa1fa-5e00-90eb-29dd-413448167456@linaro.org>
Date: Mon, 6 Mar 2023 15:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 03/70] target/arm: Improve arm_rmode_to_sf
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: kqUHm15o0UFg

On 27/2/23 06:41, Richard Henderson wrote:
> Use proper enumeration types for input and output.
> Use a const array to perform the mapping, with an
> assert that the input is valid.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h     | 12 +++++++++---
>   target/arm/translate-mve.c |  2 +-
>   target/arm/vfp_helper.c    | 33 ++++++++-------------------------
>   3 files changed, 18 insertions(+), 29 deletions(-)


> +extern const FloatRoundMode arm_rmode_to_sf_map[6];
> +
> +static inline FloatRoundMode arm_rmode_to_sf(ARMFPRounding rmode)
> +{
> +    assert((unsigned)rmode < ARRAY_SIZE(arm_rmode_to_sf_map));
> +    return arm_rmode_to_sf_map[rmode];
> +}

Is the inlining justified?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

