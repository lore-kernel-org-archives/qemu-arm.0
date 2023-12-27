Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1202793ejc;
        Wed, 27 Dec 2023 14:40:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeSDA2MfhY/cuvcK/y2n8yHQiWGqKooH+lrwGuIDlOGtSNrxByBvgjSi2ZQDa4zIVCYoln
X-Received: by 2002:a81:b722:0:b0:5ec:f73b:711f with SMTP id v34-20020a81b722000000b005ecf73b711fmr2179668ywh.31.1703716851713;
        Wed, 27 Dec 2023 14:40:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703716851; cv=none;
        d=google.com; s=arc-20160816;
        b=jJmM6+1WJez1TlFgSw6hnOuF+dIdhZnUZVNRWbShzK7UktPDP512Ed7GnGOfeIBMn6
         +TfYgvPEtWvSgpFJKgQA3XLMuUP+rbwDuU/SrmxJv7CtTIVYnj8l9fQGIpPBPWPCz9eK
         MdREZFMfGrjn5hkwSIikzRae3kCa2wSy7sf3nota5OKUCYn9+84A1s24juiizqOx+/xW
         kQ54vhyNwK4jZwP8nrqX8rLbH2yjCl4TEq7OK5FrSn36wRBZ0TeTpmvjVr98mBQ3igGx
         rzyCAb9IufzEUmFs2T490wP66CK6uxDsV4+udO+DUirL93UoN8rzFciXueSqgKbL+6fp
         Lb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=k2niL5YaFS0EBFtoVfbLTXFZi/r3uPyi3V1hKPaD+O4=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=gvPKra1d1PMLLUhfaaPlWn0jpCIMQw/yyWkRF/zWKXA66/jpWiPi+Aek5C0y9oeIHk
         u9P9wFLe4JWVwHsFabnVrwT7d7SLbffaU6D34h6TCS1d0mV4ZJR0w8ehtAaA02NgVXY8
         Yo228+NYNvHzlsiqszVUBgetKcSz4mryz/KcM+qJxxy1COr8YGL1HK3mKgQETv6RXHA6
         2sQSHPWuo1hOFKKq20FSWGxGlhIQUkSCl1fuYaQsbi/nBfw4HAz1e/ZGSDZT1HpZnp+e
         kEiv+Bb03mPRhU+MOyhBUdpQzR1Ife/d0ZkGAP7lPwP3nqMQns34FvMJFQwqRkvjeUoY
         w9GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QC6sWuBs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020a05620a0f1300b0077d98a59b2csi16093334qkl.445.2023.12.27.14.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 14:40:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QC6sWuBs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIcZw-0004zg-JD; Wed, 27 Dec 2023 17:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcZu-0004xO-3a
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:40:42 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcZo-00073Z-SX
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:40:41 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6d9b1589a75so728876b3a.3
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 14:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703716835; x=1704321635; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k2niL5YaFS0EBFtoVfbLTXFZi/r3uPyi3V1hKPaD+O4=;
 b=QC6sWuBsuVeJ5oQN/yqR5I8sv6DxlzZIWWPs+J5YdMSwiZ3sQccqgscKYCHjvcZREo
 jF3eF+jjPkNTQDOUK2b9vtNSfbC5qpqT7lV+cdsbjj05d40MxC4h6sQfQtndfPHE1v6p
 tJzXVVwC2+QKNdOgTQiVeeF2rmAVESFRRW4dOUcy2nRWYmUVIKYHbmfUrFE2ZMZNug8T
 IfvQSSTme5YIsJITlOv25sxfsSbHt9M997hl24xL1ocvcxN81U8FuXkuNfEsauqXrBty
 oeNYP4P+hEf77UJ3q0wv+OEXbIZPARRYJIAmB7b1oDe2S9AEja57yQAPe5il7Drr48Sf
 ELtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703716835; x=1704321635;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k2niL5YaFS0EBFtoVfbLTXFZi/r3uPyi3V1hKPaD+O4=;
 b=AWPin7b7rH5RK4NYc712YSz92TT1nLm8PfutDn21scUXtGIki4vVrjYV86QyezxJBT
 Y92jCM9YRqLfvVVkb+rL0EtRFcWFQtamGfUQHnU3AVCQML+9q275sizsZM2EymIuz4sc
 3KVjjYLZdn5Vk+alSgw+3HiDtw779GbOVPrhjtdDbSzFmEBXpFGe9unPTnZ0E8aNwXhO
 G2NE9uOL7szocQJZBTdJ6cCU2ly6scTbyYwQ9wM61OVeBtDA/Qi6H0dNf7EfAQBXvdU3
 K62j/Wm8dHBL2K6BokZENG9PDtKB8m8Grlt4G6O+H6qNPv+U0Z1vI1iGlVKmJwCq+gMh
 CUqA==
X-Gm-Message-State: AOJu0YzI/nVHzwnaURhrJM2BN8hv2Fnqua/x16ZnYJX2Fj7wLZhn9hOx
 Vn/lOhUl4C+aw2eeZtKkKBn932nzqrwM4g==
X-Received: by 2002:a05:6a00:1a8c:b0:6d9:c515:28ec with SMTP id
 e12-20020a056a001a8c00b006d9c51528ecmr2412237pfv.69.1703716834849; 
 Wed, 27 Dec 2023 14:40:34 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a056a001a8a00b006d99cd6ec89sm8403478pfv.185.2023.12.27.14.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 14:40:34 -0800 (PST)
Message-ID: <a251cdaf-8017-4d94-824e-dee87e272902@linaro.org>
Date: Thu, 28 Dec 2023 09:40:29 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/35] target/arm: Trap sysreg accesses for FEAT_NV
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: qOmjhFZnrKcP

On 12/18/23 22:32, Peter Maydell wrote:
> For FEAT_NV, accesses to system registers and instructions from EL1
> which would normally UNDEF there but which work in EL2 need to
> instead be trapped to EL2. Detect this both for "we know this will
> UNDEF at translate time" and "we found this UNDEFs at runtime", and
> make the affected registers trap to EL2 instead.
> 
> The Arm ARM defines the set of registers that should trap in terms
> of their names; for our implementation this would be both awkward
> and inefficent as a test, so we instead trap based on the opc1
> field of the sysreg. The regularity of the architectural choice
> of encodings for sysregs means that in practice this captures
> exactly the correct set of registers.
> 
> Regardless of how we try to define the registers this trapping
> applies to, there's going to be a certain possibility of breakage
> if new architectural features introduce new registers that don't
> follow the current rules (FEAT_MEC is one example already visible
> in the released sysreg XML, though not yet in the Arm ARM). This
> approach seems to me to be straightforward and likely to require
> a minimum of manual overrides.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h            | 34 +++++++++++++++++++++++
>   target/arm/cpu.h               |  1 +
>   target/arm/tcg/translate.h     |  2 ++
>   target/arm/tcg/hflags.c        |  1 +
>   target/arm/tcg/translate-a64.c | 49 +++++++++++++++++++++++++++-------
>   5 files changed, 77 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +             * (This makes a difference only for a couple of registers likee

like



r~
