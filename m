Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp209233njh;
        Sat, 10 Aug 2024 04:39:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6t+fQVOO2Sp4hmCR3vWDqifc7ONQJ3Eo+IqKlx4kfk6AFciogQEvfe5neXKBdJVyxPLRzclawKIepGA==@linaro.org
X-Google-Smtp-Source: AGHT+IHidalu9KwbvKHPEOSGnicgQNoiGQ0SfmMvazZo/Uc+kMSHeEt0RaRyS8N4NiA37tYGJ3tT
X-Received: by 2002:a05:6214:2c0d:b0:6b5:8d15:d139 with SMTP id 6a1803df08f44-6bd79c4ff19mr68315756d6.28.1723289959224;
        Sat, 10 Aug 2024 04:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723289959; cv=none;
        d=google.com; s=arc-20160816;
        b=A+ns4YHk9DCFakfUftdXt2BX4lP3JfpR5hBRzkcTBl4DKgMhW3jGqbQa2lO0ZwBgK+
         LqmJ39yDI+CGbWIIeMJ8o9+Gr8+WUsQ117vf4a60J0v0iYDuc4/zrb83DSAQLY/LarzN
         oiMIVMqaAiJlAEAeliORML6aP+aw/08kSJvle4MKc88BhddPPN2HfMAkUCmVrwn88Iwu
         twEZXtEF1tOlaYS3ui5TL6wah5wyryREoB5k5socxe5D0GtgCtmIXihh2EZuf4XRl6eu
         pGGaDRD/9qivWhEfd37osvrgzbBzgDRsQ//Abi/0SWdW9Gj4Wc3WvCuhtgbQlrxGj9N3
         lK/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uFc8Sxs1W/r5mzfQK+iP1Okx2ROhixQYGlB++ayF+KA=;
        fh=Q0YRcBZ0LxxX4sYraJSV670JDyMKITdgGLzt8RLoqVM=;
        b=sdl/BZ9MaTSE5Q20bmcS+QT+5QlJFEZBTYcZKjDYSkcQTwLX7DLq5eNZWFhvteAviA
         UbEzKfbusWdDsJRAz60u/J+KTF4utc0EoJ1AHBbU/k6Y5y7Q0Zt07fjiZdAYPZavDZsx
         8CiwdKu27HYtaxr5ufiS3jUsLasHpmEihUQvjFaH1JyOSggbaVJne3rR9htseWaBAV4r
         d29L0XOTeYHftUoLmyAbvr02hiLn2ndc1l1vFoSWQH1rF2JX6ZH5deGmTLAVUYd3s8LS
         AI4r+T5mVMgaSjy+vmvOMG/3lnyvnvmo5K/+iJcMfvNuCQXlhnx6GOUKhegLiSrT1q73
         qHQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZfeRtLQb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bd82e71b38si17281486d6.425.2024.08.10.04.39.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 10 Aug 2024 04:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZfeRtLQb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sckQZ-0002gA-26; Sat, 10 Aug 2024 07:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sckQX-0002cO-6n
 for qemu-arm@nongnu.org; Sat, 10 Aug 2024 07:38:29 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sckQV-0006I9-0t
 for qemu-arm@nongnu.org; Sat, 10 Aug 2024 07:38:28 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1fd69e44596so20467425ad.1
 for <qemu-arm@nongnu.org>; Sat, 10 Aug 2024 04:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723289905; x=1723894705; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uFc8Sxs1W/r5mzfQK+iP1Okx2ROhixQYGlB++ayF+KA=;
 b=ZfeRtLQbQljo5ESj+MlFTEj+8tBgNkFhfoPvD52PS++ij9oEtzMpEMzWP3rEt5mClK
 VBz+yd572NvNAvIVqmfs2QqQgkdqpE+mfM8g5B/ftfO+xSRXYcT4FSopUUN1lbB35zxo
 7ShjpMVSCaMSATEFP6Ibio7s0WbPg39Nl4FyZZTGiAEVQ+CB00bWmy07R+YmhzYoKv8I
 GmHo0HT0QjEs4TDn5Li6M0bkXm4zoZpIkfAKBrb6YUsDKhlmCwAuDkEFyRporQFndDbo
 ndKEQG0oRO4GUujcZiijh/6IgXtO2vAin2csSjQy1gZ07AD+NUjiabCmPqMVaqvwpSRE
 u9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723289905; x=1723894705;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uFc8Sxs1W/r5mzfQK+iP1Okx2ROhixQYGlB++ayF+KA=;
 b=s/FrFxq/hbboLhyLz+qUzRKO0bY2Wwj1cpFz7j1CC2C4N465UxNTmdb2JvGpOCXHSa
 cZ0S+eKPeRDgb3oyVe/lg0blgB+XFw+k/sTAx9OeWdpjF/hahD8zJxdPbJqpqsV91ahi
 c3ywpDYeLN6AAENh1R9mVamk69Du6l3fj08jGZq3DQ91/znyiQtBUHOQcF9sJbFam9b6
 bdjSlaToDLsx4aazSb/dLaLQRK+jc4xUcFWYOauBlpOZnG1vKEIXy/l9wvWhuZ+mEOUT
 WjiNZhtKn57QnbX2V6j6b8g6qWjjgmP4x+rI60dwLSUCYPqQXmglItfHH2jELG/+RA0V
 BRqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhnEm6FxrWjRvx3SBuuklgikM4sZn6nUrW2m1ghJDRpDhuVxKmlcqqt0cwf3AGahZuq96NEtB69Q==@nongnu.org
X-Gm-Message-State: AOJu0Yyrl4J37cakPzgsPd4t/Yp88UCzPSbVT6JI8FC3v9sJtFsuzceJ
 tcir1HKqbfvIikdG0+N8Wi/XbKwMfsfbx6nNaHuVW1g5WFJaOZM4CrYJ/VxAUMc=
X-Received: by 2002:a17:902:e54f:b0:1ff:5135:131f with SMTP id
 d9443c01a7336-200ae5ee46emr80933685ad.25.1723289904677; 
 Sat, 10 Aug 2024 04:38:24 -0700 (PDT)
Received: from [192.168.1.113] ([203.30.4.111])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bb9b16a2sm10391955ad.172.2024.08.10.04.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Aug 2024 04:38:24 -0700 (PDT)
Message-ID: <f0838b3c-8cc8-4333-a240-ecc8395555f9@linaro.org>
Date: Sat, 10 Aug 2024 21:38:17 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/arm: Fix usage of MMU indexes when EL3 is
 AArch32
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Bernhard Beschow <shentey@gmail.com>
References: <20240809160430.1144805-1-peter.maydell@linaro.org>
 <20240809160430.1144805-3-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240809160430.1144805-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LItL954zqxpC

On 8/10/24 02:04, Peter Maydell wrote:
> Our current usage of MMU indexes when EL3 is AArch32 is confused.
> Architecturally, when EL3 is AArch32, all Secure code runs under the
> Secure PL1&0 translation regime:
>   * code at EL3, which might be Mon, or SVC, or any of the
>     other privileged modes (PL1)
>   * code at EL0 (Secure PL0)
> 
> This is different from when EL3 is AArch64, in which case EL3 is its
> own translation regime, and EL1 and EL0 (whether AArch32 or AArch64)
> have their own regime.
> 
> We claimed to be mapping Secure PL1 to our ARMMMUIdx_EL3, but didn't
> do anything special about Secure PL0, which meant it used the same
> ARMMMUIdx_EL10_0 that NonSecure PL0 does.  This resulted in a bug
> where arm_sctlr() incorrectly picked the NonSecure SCTLR as the
> controlling register when in Secure PL0, which meant we were
> spuriously generating alignment faults because we were looking at the
> wrong SCTLR control bits.
> 
> The use of ARMMMUIdx_EL3 for Secure PL1 also resulted in the bug that
> we wouldn't honour the PAN bit for Secure PL1, because there's no
> equivalent _PAN mmu index for it.
> 
> We could fix this in one of two ways:
>   * The most straightforward is to add new MMU indexes EL30_0,
>     EL30_3, EL30_3_PAN to correspond to "Secure PL1&0 at PL0",
>     "Secure PL1&0 at PL1", and "Secure PL1&0 at PL1 with PAN".
>     This matches how we use indexes for the AArch64 regimes, and
>     preserves propirties like being able to determine the privilege
>     level from an MMU index without any other information. However
>     it would add two MMU indexes (we can share one with ARMMMUIdx_EL3),
>     and we are already using 14 of the 16 the core TLB code permits.
> 
>   * The more complicated approach is the one we take here. We use
>     the same MMU indexes (E10_0, E10_1, E10_1_PAN) for Secure PL1&0
>     than we do for NonSecure PL1&0. This saves on MMU indexes, but
>     means we need to check in some places whether we're in the
>     Secure PL1&0 regime or not before we interpret an MMU index.
> 
> The changes in this commit were created by auditing all the places
> where we use specific ARMMMUIdx_ values, and checking whether they
> needed to be changed to handle the new index value usage.
> 
> Note for potential stable backports: taking also the previous
> (comment-change-only) commit might make the backport easier.
> 
> Cc:qemu-stable@nongnu.org
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/2326
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This fixes the bug with the repro case in the bug report, and it
> also passes "make check", but I don't have a huge range of
> Secure AArch32 test images to test with. I guess it ought to go
> into 9.1 as a bugfix, but the nature of the patch means it's
> not very easy to be confident it doesn't introduce any new bugs...
> ---
>   target/arm/cpu.h               | 31 ++++++++++++++++++-------------
>   target/arm/internals.h         | 27 +++++++++++++++++++++++----
>   target/arm/tcg/translate.h     |  2 ++
>   target/arm/helper.c            | 34 +++++++++++++++++++++++-----------
>   target/arm/ptw.c               |  6 +++++-
>   target/arm/tcg/hflags.c        |  4 ++++
>   target/arm/tcg/translate-a64.c |  2 +-
>   target/arm/tcg/translate.c     |  9 +++++----
>   8 files changed, 81 insertions(+), 34 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
