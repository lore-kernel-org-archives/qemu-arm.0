Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B996C87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 20:57:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhDqq-000884-H4; Wed, 30 Jul 2025 16:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDiM-0007KW-QO
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:47:54 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDiK-00017G-Kk
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:47:54 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2400f746440so2707825ad.2
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753908471; x=1754513271; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xDcHaXRDHxuv8RcTViw5pgusysHDdhneyUp+Yjz2rdI=;
 b=xK3cuzqohpPzj2qqr2F+JOY9FvQs1pyMFFl3CouBYGvcM29ENWybkj/GhneCgHiP1u
 BMyDMu12aZO6xo18UD1lNh9tc44D0czk51LF0J7Y7mnynig0CawgKvWaDdaE+AQYhLNG
 2MaRY/V17usRR959jyWCdn9jXGxaoejZ9dK1vhcczU7GWzERWNbmzOjjzTDibUV3rKse
 bM/Na2I+scQ1HKLIEY1Zf7TRBaheEYKogc9mcO67A43AUTUpYsHmb5iX96kV3J6OXLjq
 UXfxl0DXzDaby7xGERc9wzy45N9c6vOQD+uNdPgqdoeY0zhaIGirukK2ByWysiQYZmnl
 D5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753908471; x=1754513271;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xDcHaXRDHxuv8RcTViw5pgusysHDdhneyUp+Yjz2rdI=;
 b=L7yA0YPE+1hs3HA5XrtcVV7CLp87RSOO3JL+pjZZB/dKXtal3lVP5+xDsDx1sDm9J0
 JwsfZ7GOZdD3egWoKcanc0Jt6/wn91k/6WziJn/Yw1V/EVZwIVrqruz4ssjZfy2iTmXQ
 aKP+MkPw3VBrCZtQjv1oQDCvlp0ejWGt4uQ8ta5MpnW1+g94IfuNYfxs+CaE2eYS+DZ9
 N76cPlZGy+J1G/JbSDQ0GVSMFSO3SMsjSPSaiefPUJPWVvYK9PYQceOSxyuZ3+ybUI3o
 iiwfK6lI04cnDqInGMsFXKBFI+gKBLBnZ7U+S0yJDed3QEAv6asPTFrAK2ElpcgGjkva
 3CLA==
X-Gm-Message-State: AOJu0Yy7jUNzpeGiUMf9hf5/nmZCZdF+xLyEfybscY4kLdd+IW4I1/RU
 tAqIEo2qqy5NUTO/GW29aGtuVhn5MVbPO3UOaaIYcK4ofjMVERZ/l1kAxWoe5V0mX9Y=
X-Gm-Gg: ASbGncsyDovkfVRNVUeCHm35llAMSrvoI7tPpIKdePfDXO2WQq/Ft3Sb9J3WKT17YC7
 eZME5fscrSRlSF51XEuaA9QS7xhH+ftPdP7zuZLzkTOW13LXTyuHTonRh67lAqgmclkxpYJt6r8
 J8f+Czxk8X06qTwWch1hfE//ERkAXonyoFTzqCyyY2UU01Wdv86FwvZNLj3Aj+a4grhoVFPGuG+
 AOYvTzLgh/GsdCe+UF8GJwtqsdDM+Kqz47AnXGLnKaGZcqDEdIcifegJq56c0jDmwq+obisBaMM
 kpIbd1C10amk3kHuOMdMzNCmu0o8ERmT3bm1XMLzLOGPGxrRDaoGQB2+OT5Av0769Ba5cxqv88d
 8yEzEumR5DyI5KnW1NDtY0f9zfsqN9NckGbo=
X-Google-Smtp-Source: AGHT+IFq6nqm4Ma7XDB4v1EKiDkqAGvDIghVGeAfT6tGurzVV+5uITvjSqyZdpXgUHvAwcnRMt/fxA==
X-Received: by 2002:a17:902:b489:b0:235:15f3:ef16 with SMTP id
 d9443c01a7336-24096aa37b2mr55787335ad.13.1753908471226; 
 Wed, 30 Jul 2025 13:47:51 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8976f08sm119075ad.103.2025.07.30.13.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:47:50 -0700 (PDT)
Message-ID: <5ea42392-4cc8-4c4e-9de9-9ed3a165d173@linaro.org>
Date: Wed, 30 Jul 2025 13:47:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/82] target/arm: Expand syndrome parameter to
 raise_exception*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-21-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
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

On 7/27/25 1:01 AM, Richard Henderson wrote:
> Prepare for raising exceptions with 64-bit syndromes.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h     | 6 +++---
>   target/arm/tcg-stubs.c     | 2 +-
>   target/arm/tcg/op_helper.c | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


