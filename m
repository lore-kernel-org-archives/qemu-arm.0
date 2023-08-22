Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp780193ejx;
        Tue, 22 Aug 2023 07:59:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc1spLNI+qEaRzxgZhhBlqNauLhjS6/zpnxeNxMlcG0c3KzuDTmFfacusGYW+Y5Q+fwg5C
X-Received: by 2002:a1f:c5c4:0:b0:48d:bd2:fc34 with SMTP id v187-20020a1fc5c4000000b0048d0bd2fc34mr5787591vkf.7.1692716389537;
        Tue, 22 Aug 2023 07:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692716389; cv=none;
        d=google.com; s=arc-20160816;
        b=Fv3fgeKMt8HSVXydoEnFzfajmzwnrdZlgNWIntlyGB8OortH1D66wu8RkOelXHFAkd
         HJauiYVaOz0bOpK0qwmCKXhT0y0ky3/nQzzq5nSE/waY1dHZ3M+atFPFzVGdgycnNsMl
         FI/a/YOCB/wQcx0g9W3lMUGQHgr+s9Pqf194osbT8Kntb093/ry89lfOk5Zdy3Vata/2
         yt74qLyW6h3DduyqiVuSAENgl5ewf/VFYdNvakiYO8wYAuSEZmYHjzGY3gRFz3+EFFxU
         1twGdQpGBs7Q/6PWAYaxgiVigi6v/yNzbggfaAsi7+hmGnsRlO9Mjrmp7/0LT5Je19YC
         adMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lzualKWYaXny5AQniRFo2a8WnbpJADHPG/kp0LtcUEM=;
        fh=IzkshJUGWO2UnAxhT0rhoUSUmHocHU9nyHGLKQhM9qc=;
        b=AsKEj1ysvw9Ac32dmPrIs9lKHv/vsKcLkZ9Xedhukgm0O9uKIt2M/VOgaCvqAmbBHT
         YIESPhazh9/MsyS8rVO5sTIV/x8XTOo6G3CztO3eMCyZbpr8rL+44YwSnKWWa22a15dn
         e9oHpqdsCX8tPnlskwvbPmSLpX2FROKvEjCwXZrmVL71VKt2I62VpO3ooS+zliwgfFBb
         qNERbphn0mesY2NdZSFO4+zM134ZKTBgJbbbmjdnvgLyVcWF2HL0150MzKsYwJ3VBYx2
         CoD92RL5/sGJYleDdixRz1J1eT3BD4RdXuQbFtqNJfY/xKQRW1JqTryh+i2FCs6HZvDO
         PvQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ISwKSuZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i25-20020a0cab59000000b0064f364f3585si3918641qvb.16.2023.08.22.07.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 07:59:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ISwKSuZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYSqz-0002Eo-K2; Tue, 22 Aug 2023 10:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYSqy-0002Ea-Oh
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 10:59:32 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYSqw-0007XZ-L4
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 10:59:32 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-68a3e943762so2319488b3a.1
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692716369; x=1693321169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lzualKWYaXny5AQniRFo2a8WnbpJADHPG/kp0LtcUEM=;
 b=ISwKSuZUshVXeAEZ0aS9PEx6qPQoBilygaysuHXzoKSth6qPl0Ga4epMe4mX9d6GXG
 k/H9GWTCA/lVKsxkzNMFHQ27FIlNhwiqR4mUBN6smwnhgB6DI58lfK6aMNhs/wmPgHxC
 Dew1jA+ezRHnetHuLjPfcMjmTDzQGB7L0VKL7niwSKH9yBamyPG2gq9WZJAR+rnaCgkE
 S4Cd6J08aSB5cad4QBW71J+z+xHefYJRckgrUS8zQSD4LxioeVaMB1IA/yXq0o/m7qpD
 /f+Qs5GBPLD57rbU/RzvAr0+8y7S7Ct6JjGkfJljdGMyw2yVUgHC1hlqZIF1qabCI2em
 BDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692716369; x=1693321169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lzualKWYaXny5AQniRFo2a8WnbpJADHPG/kp0LtcUEM=;
 b=MbGWcrMAXhpF5Q3FyT/y6J+tKchNiANY+sNS4NOJN6UzwgesVfY/SiRGPvmt8HCvAz
 EVI/RpLG+Oad1pbtj4i8048iSKHJPKGY8vP7yHtMhH/mx/FqbkWJfDB7fmWTWWo5zMU5
 UOXGCu5DZ68ozgEBz1U70J+1/iCN8jSJreZI1j+IFJ29L+zSE6+KO4yKaYnh/oRlAPeC
 qE41qG/JV8cEze8mlJdZiOL+tn7b245NXB4yjIClmvLQ3YeANVqL0kQRzoHUw71qLvGh
 zFlXfToEms3eaLfeykWI0iv3JAjLlVif/fVde+7kphybxvFU0wucx31vBPKlWa9hL1n0
 hjGA==
X-Gm-Message-State: AOJu0YzW17KpOHPj3/YZfXS6+NxdjP7JwTk7K+RX1DXmrpB4oX2a58SO
 Df++QCKENDJr4dwE5uIxMKBMcw==
X-Received: by 2002:a05:6a20:4421:b0:140:22b0:9ddd with SMTP id
 ce33-20020a056a20442100b0014022b09dddmr14002319pzb.0.1692716369176; 
 Tue, 22 Aug 2023 07:59:29 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:4e3c:f4a4:b92a:b5ab?
 ([2602:47:d483:7301:4e3c:f4a4:b92a:b5ab])
 by smtp.gmail.com with ESMTPSA id
 k1-20020aa78201000000b0066a31111cc5sm7878047pfi.152.2023.08.22.07.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 07:59:28 -0700 (PDT)
Message-ID: <2658cb0b-70e0-3482-d427-77bf720ed5d0@linaro.org>
Date: Tue, 22 Aug 2023 07:59:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/6] target/arm: Use hswap_i32() in VREV/SMLAD opcodes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>
References: <20230822110129.41022-1-philmd@linaro.org>
 <20230822110129.41022-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230822110129.41022-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.767,
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
X-TUID: er32V3XezTIJ

On 8/22/23 04:01, Philippe Mathieu-Daudé wrote:
> Commit 46be8425ff ("tcg: Implement tcg_gen_{h,w}swap_{i32,i64}")
> introduced the generic hswap_i32(). Use it instead of open-coding
> it as gen_swap_half().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/tcg/translate-a32.h  | 6 ------
>   target/arm/tcg/translate-neon.c | 4 ++--
>   target/arm/tcg/translate.c      | 4 ++--
>   3 files changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
