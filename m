Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9A0C83F34
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Jul 2025 22:03:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uctBC-0008KY-01; Fri, 18 Jul 2025 18:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucsgh-00056r-J6
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:32:16 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucsgf-0004mQ-3G
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:32:15 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-235a3dd4f0dso16186815ad.0
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 14:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752874331; x=1753479131; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xwrhbGi7cQ7T1Gwntpmg9MlPdNpGkcCo4WpRIQqMUOI=;
 b=S517Y+6csp9zZHnW7wXU2RAmdeB6aC/mSeHUJEqoZixNpYdOB9BiLIFYVVupWENwAa
 BCaukO+zYiCdefQlBz2B5jFrI02iX02zyptavLfiR2UyXX6esMjZv4gRMreMcDyKMpMI
 dOX7jB6Ae41nz7XHBwQe7Y6vEa26PP+TB2mFuHWO7r7eOPubg29ye7dEvgEF6NJmwxTh
 oOB2FCNGZ95xIfP7doL5yYFxo4Zq1FTMZpNob0hk5x932ORMK21Iyl7l4clVmNS5wxoh
 ibioJx1XBKWzRYMH6wxPuuLTF5hTy/uKfFyh0WtS+ZbHbpWD5NWn40mURlFFHN2U6HVD
 vdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752874331; x=1753479131;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xwrhbGi7cQ7T1Gwntpmg9MlPdNpGkcCo4WpRIQqMUOI=;
 b=hoLTmQP+K4IboRYuTPRBSIbUJmZ2cqfUVEMrr+QlEzXRekf8HM+u/djmO9PoF4iqjX
 aCGx8CBWOeqfeIN5O59g0YrDbvEaqpL/jQ4xyk1z37bveIDKH2o0WUcKSTqpapgwqPfh
 4Ca2ZjNtKV+5TwZLOeNw1hGIFlpbciC1V3midOO2cNqsOek0kEG7GA9Rfg1U6fQNJfD2
 Tb2we8e9Hb0FLWOOh2TDcSvUFrxyCtR1tT38/omzmqTWtg7FD8Mr+3WHauZPjHb40x+H
 uxalXeJda0wc2KrWO6U2al3RrTT0bAoA4s3Dsb5KdqNJbCcJrfodMBFLLzUaquizby2t
 v0dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+vW9XwRRrg9QvHKPgGWWLm8+fF/2ChyzSYvp+jjbMm/JzBF8IvMJW6ofTHLAPEjcEUKUq/1WyEA==@nongnu.org
X-Gm-Message-State: AOJu0Ywf868wpPRlYZfHCIfFTIyKcKDm5lFqEUNxLR5ee6cela2zOwGS
 fkTSIk8M1T8ixycnWdTLuMkOsRSHdLX27CORkDkhtjaGg3t4AOehD3wMYe/bn6EUM+8=
X-Gm-Gg: ASbGncuQlzDfR8yEg9zlHdGWpVKhMrNO+s52L+ed+G1ss3vFkJpBxMcmolVhLK2/Bh4
 ZOviTs4lfO5prwqMTwkCBtUb4+GlPVZ6W8tc0UjkI2PfcqBglgzUPcpmLSgaGCAFeWhyU4QUh4q
 3krpha/R9y1et5jnoJ/Fbr14N4SeyExVdA2kXhXsou5a/1IE+W7qPfMa8BBzEZ0CNFqBSJ4RDoT
 qUFfYD37JVn4SCoRWu6oo0cjOKe6c+qRyNIEkjeMNk8APalQ3ZKcBW4Gc5kmAbe7Uo1lapuLNoh
 Uoxa05VH/WU1ALQq5rlTYuhaeL8WskuWWurh77oAfFfF7w6aDtowPV9ArwaOHCr+JPNfO2DqC4a
 P09Yjwxyzu6d7Uu8GT5yfu0gg3pRJI80++PKTqGhtug==
X-Google-Smtp-Source: AGHT+IE0dWUPA5hKJ+DuIsLHGI25jwN0nVtgVecmevSUYzgZ8ZfyvmZcPe1LtOwg5C8Uee+tIZAvPQ==
X-Received: by 2002:a17:902:e807:b0:235:6aa:1675 with SMTP id
 d9443c01a7336-23e24f94b60mr183163975ad.52.1752874330930; 
 Fri, 18 Jul 2025 14:32:10 -0700 (PDT)
Received: from [192.168.101.134] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6d199fsm18031745ad.134.2025.07.18.14.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 14:32:10 -0700 (PDT)
Message-ID: <1325fc26-ecd2-413c-adee-7dcff7d0b102@linaro.org>
Date: Fri, 18 Jul 2025 14:32:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 02/10] target/arm: Add BFADD, BFSUB, BFMUL,
 BFMAXNM, BFMINNM (predicated)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250718173032.2498900-1-peter.maydell@linaro.org>
 <20250718173032.2498900-3-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250718173032.2498900-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 7/18/25 10:30, Peter Maydell wrote:
> FEAT_SVE_B16B16 adds bfloat16 versions of the SVE floating point
> (predicated) instructions, which are encoded via sz=0b00.
> Add BFADD, BFSUB, BFMUL, BFMAXNM, BFMINNM; these are all the insns
> in this group which do not change behaviour for AH=1.
> 
> We will deal with BFMAX/BFMIN (which do have different AH=1
> behaviour) in a following commit.
> 
> Fixes: 7b1613a1020d2942 ("target/arm: Enable FEAT_SME2p1 on -cpu max")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/helper-sve.h    | 10 ++++++++++
>   target/arm/tcg/sve_helper.c    |  5 +++++
>   target/arm/tcg/translate-sve.c | 22 +++++++++++++++++-----
>   3 files changed, 32 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

