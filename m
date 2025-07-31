Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2E1C87FD3
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 23:29:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhchz-0000FE-Pk; Thu, 31 Jul 2025 19:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhche-00007V-56
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 19:28:53 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhcha-0000xG-NU
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 19:28:49 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-b4239091facso207027a12.0
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 16:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754004523; x=1754609323; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JK0rJE4xO/dWWwPBopC74O5EzpH8MPrs0ae4fXpqeaI=;
 b=y1WwLraMwexnlfkEfkjJ2XHVsVcCRT7OZiZCdLc/2GyeZdGZd6Olgpjo7pVdQ8I7Sm
 KIC9XgfVp8u2tIjzMC+DfnDemjxybHhqozWrfbdkxFlrJeGnv86NL99XEo1qEzXZr34U
 qNuJp66+5Ae2TDKHHnsQ8HopWJKYbZkhF6oqoeyYSbMdDj7yNGZ01O30puXYWUK0Ic70
 dLH8xZS3Mr73eufgUUM4LMmjjfePJs0HCzGJ8rxu+XbNVZm0Bswdp332MM7av/C02/x2
 pAr3KLMkoUa7pxob0f+vX1WpaotA/N0DrsPfwpM7H1oM2Sxq2iDpnK/XMP0WxOKC0GEd
 ghKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754004523; x=1754609323;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JK0rJE4xO/dWWwPBopC74O5EzpH8MPrs0ae4fXpqeaI=;
 b=DV4mTZQr8OkwK0EEQnhk94QNTSQNtNNYWYUzRDFbnUurA1iAQS/zU5qfExNVOXVTrJ
 t4PY6J+6Db6T8sqI8G4LoiU+gz9wmyAMI4iKB2+lqGiSmm01vCxhDrGcPj+xp0VKBHkc
 zeEsTIC7koWVNX/0IV25FpVUlxFfxLJPwVQUlmx4NvEuxBx2fYDtqQVM78/nLGes8mVL
 fa+XqykaYtvpuHrm09XRzx+zED+98kIPwd5XEIQxwu040dMf20sj35+FzhHQiQ0zDM/4
 F06EkM2GH+6v4s5VNhDJjsEj27ZOL0iSlgYiZ4ChvEAFWlu8uR5fVjfC0p13J8mKH+2y
 ARww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVneZfghi15V+tZmevlm8/ZNBvLZ5GKI+KOJkAof1qlgcd2NFjJbdgtYewYt2Ms40997LyI9qE+QA==@nongnu.org
X-Gm-Message-State: AOJu0Yylft1eJgn1/Hiv3CEHXjG4jMK0Kx+9SwB5ZciM8JxEuKrh9Wtq
 vwQQNgIlAJzCtINozLERBC8TMknWUIFgASkQNdNj147GUpRR5pXf1kLG1V9I4qmiuJI=
X-Gm-Gg: ASbGncvu0OWuZxctvjIScLDwX1xmjvv5wlIsj7B5RWLnH+eKdyhY25sSnPMzEIVwSn5
 uqN1BRqLnIC3gBgMZFP4eAUzB/e4ViSL/IyY4i5n6Ox66GytlfZPMErkKez2J/GPfAyAmyM8804
 pIswo/mahfmiNENcS7qDyI54LKHkoW0QVepNzpIo6tzikqC4QBNzpFn7KxRUlTAgnBEabDFF9SZ
 VDL6VRpCHlVlmQw1XT7InYUXVYiCfjrkgdpdbnOuLFGS3IHfbMjIHJqbDvigtxxz1hBXF/Vc/N8
 OJsF8uopqJ9IJ7OmzbN4LMqAmY3qhTS4SpDZq6bUE/37XmWGGYZ9yNcsEUZNK3h5a5lAiK9H9BY
 ueXwa2LddOb9oAdO8IQWPJ2j9kqBe0l/P0zDWwTzQ
X-Google-Smtp-Source: AGHT+IEtLN0g4Ozxgv+CfhomlHpXaDU7HWWhYIGYe/HHJ7tfIZGhL1E2xjANeSCjEms2gs7OvrRnGg==
X-Received: by 2002:a17:903:291:b0:240:3ed3:13e7 with SMTP id
 d9443c01a7336-24096b1ca5bmr121316935ad.42.1754004522774; 
 Thu, 31 Jul 2025 16:28:42 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aab0ffsm27831675ad.166.2025.07.31.16.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 16:28:42 -0700 (PDT)
Message-ID: <cb4ffd4a-48fe-411e-8064-39059317b952@linaro.org>
Date: Fri, 1 Aug 2025 09:28:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] include/semihosting/common-semi: extract
 common_semi API
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
 <20250730220621.1142496-6-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250730220621.1142496-6-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/31/25 08:06, Pierrick Bouvier wrote:
> We transform target/{arm,riscv}/common-semi-target.h headers to proper
> compilation units, and use them in arm-compat-semi.c.
> 
> This way, we can include only the declaration header (which is target
> agnostic), and selectively link the appropriate implementation based on
> current target.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   include/semihosting/common-semi.h              |  5 +++++
>   semihosting/arm-compat-semi.c                  |  3 +--
>   ...mmon-semi-target.h => common-semi-target.c} | 18 ++++++++----------
>   ...mmon-semi-target.h => common-semi-target.c} | 17 ++++++++---------
>   target/arm/meson.build                         |  4 ++++
>   target/riscv/meson.build                       |  4 ++++
>   6 files changed, 30 insertions(+), 21 deletions(-)
>   rename target/arm/{common-semi-target.h => common-semi-target.c} (66%)
>   rename target/riscv/{common-semi-target.h => common-semi-target.c} (60%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

