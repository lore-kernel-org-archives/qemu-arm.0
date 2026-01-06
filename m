Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8972CD0421
	for <qemu-arm@archiver.kernel.org>; Tue,  6 Jan 2026 05:23:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vczXS-0004hD-53; Tue, 06 Jan 2026 00:23:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vczXQ-0004gT-FV
 for qemu-arm@nongnu.org; Tue, 06 Jan 2026 00:23:24 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vczXO-0005qS-Uw
 for qemu-arm@nongnu.org; Tue, 06 Jan 2026 00:23:24 -0500
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-7b8eff36e3bso966140b3a.2
 for <qemu-arm@nongnu.org>; Mon, 05 Jan 2026 21:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767677000; x=1768281800; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W4U7GKAOi+DBgNgFxG6tVG9Jdw7fSE/UlxtvmwWvK5g=;
 b=QwDcacedoht68mHcQyuXMn5RjHVIcXJS+g7jJsACFM+I/cZiBHz8GnjLUnqsHh5pD2
 quwb3sCQ6ijSdJEDVKfN2mF3S7xCxfNb/opprNO4xwegKD8dSVkYvmPhsuPYFXRrW78e
 vwWwBzy32JR6KQXrkIHW3ptaxRd4QPCWvm4ezcIIgsdAp+1X6i9NxGzmdTgGk5DkvHZB
 X8wxLlt8Yvl0m7UOaZGd/fS2xNrabRjuME/6KW8kIbdkb3GwVD91CUNEQJip35naGGTz
 xdcbWodo0U91kAsl6HNJEJTlLe/HRjiHZCEKl96nugkVC75P0d0tun9rczHMLF7MPjTX
 A6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767677000; x=1768281800;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W4U7GKAOi+DBgNgFxG6tVG9Jdw7fSE/UlxtvmwWvK5g=;
 b=aX37OwvguXhxglJ/ptjVosyUkHWIoeZENfSGEb9LfJVNtQxJkLJMJfhriXcuffT3r9
 fwO1zC2Uc8lK7efh9R1xg+/cx4GSFxJckNDUiSc3i2XpC7COCi3T+umcpSqLphmJrtz3
 JjHjYCDeT/zoOyWRpjxPeS4t7MJPAAaNRyH6W816/dqSVyNVNKgb7Vqnz/Uf6d9WTJUD
 Xc012lkpS30/qQ79v9akZG+AHO972jJZ+Ee+GzYsNjnjPWS8YqWJJ6gAwLI02SRlkmns
 sAaTWxsmvv5L3eWQZ8MB9+MzVqeh8FBZzTle0USijj6Ht1YBxQX8xD+ESTf02HZs6HEb
 yrIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPDv2FCW6uMvNF/bRJwN4fX/aMK/YonvUENz5ZhzOspDQJVxFdIHHEx12g9sNjiZXUFkQOjbFRRw==@nongnu.org
X-Gm-Message-State: AOJu0YxoNf1I2qHRojViREAM/08EL0X44Qi6+A8PyNyCNrib/24IkkGy
 PrTSVFzsBanVptiCwqDcKNcjlEOvaoV/nvaffG4DU144IqBnqO6WjRGHHfzmquYlYwk=
X-Gm-Gg: AY/fxX47FT9Z3oYe0YfErnKxNfvg6jg7ibnKx07tM4FOucscJt3a+HI1jSMMs9EecZo
 JmF9Wb04j/BU+a2JAiGJbHIKPSRmo3XoxqWt0NrPnlGQlhKpv0wCQhwYEZCFvTTFGoMl3V2CDhy
 KclaJwq6SUexsdt4o8rtEaJHXsYB67iaU/RKk+URMg7h1X977PuCJmtVWTgH3psnp6/XNj4rYpM
 moqRhZsvhHYKm4pqMgK+qEqg1u8O85+s7CPw038DLHe1i8hkrWBkFXJtqZpy8060vwgMz95q32b
 Rci3aQF4BWNmgI3TNNLYpSGCCL5ber3EucIedBAxoTkawS34npocNMT1Uwv9xoRqlUVY0ZwcFDP
 aHEcFRDiIEiMJf+g+y79FHPGbwpgBAE3JyTKx0DUTbjJ+6K/iF9nnKpZsFsTQ4ujBgOfCC5g+Cn
 Iv5Pypvl0HZNp8tUQy2Y001AGQLnNrGA==
X-Google-Smtp-Source: AGHT+IHnWIB5IIfaV32AyO9rAeD20DYGknObQ53/TXEKe9RJaxWf5+Jg6LwjDNHWWbKNhMlx7Jyvyw==
X-Received: by 2002:a05:6a00:e8c:b0:7b8:16af:3bbc with SMTP id
 d2e1a72fcca58-81881e0b984mr1551960b3a.31.1767677000465; 
 Mon, 05 Jan 2026 21:23:20 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.201])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819baa195e4sm793887b3a.3.2026.01.05.21.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 21:23:19 -0800 (PST)
Message-ID: <165e6b10-97f2-4b15-a38c-a7df17c75e11@linaro.org>
Date: Tue, 6 Jan 2026 16:23:13 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 12/12] tests/tcg: add test for MTE_STORE_ONLY
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20260105-feat-mte4-v3-0-86a0d99ef2e4@gmail.com>
 <20260105-feat-mte4-v3-12-86a0d99ef2e4@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260105-feat-mte4-v3-12-86a0d99ef2e4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

On 1/6/26 05:15, Gabriel Brookman wrote:
> --- a/tests/tcg/aarch64/mte.h
> +++ b/tests/tcg/aarch64/mte.h
> @@ -51,6 +51,18 @@ static void enable_mte(int tcf)
>       }
>   }
>   
> +static void enable_mte_store_only(int tcf)
> +{
> +    int r = prctl(PR_SET_TAGGED_ADDR_CTRL,
> +                  PR_TAGGED_ADDR_ENABLE | PR_MTE_STORE_ONLY | tcf |
> +                  (0xfffe << PR_MTE_TAG_SHIFT),
> +                  0, 0, 0);

Just rename the parameter for enable_mte() to 'flags'
and use 'PR_MTE_TCF_SYNC | PR_MTE_STORE_ONLY' in the new test.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

