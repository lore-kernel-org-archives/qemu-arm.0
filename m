Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628D5C87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 20:56:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhDqf-0007Or-7x; Wed, 30 Jul 2025 16:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDOO-0003dD-4G
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:27:16 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDOM-00046U-4D
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:27:15 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-3137c20213cso338725a91.3
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753907232; x=1754512032; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ydqOzYMSiTHrp0lzxlkXWJp5kp4/hOFIM1kFanwyZso=;
 b=LPV61eS4GJWJfJ1YICn/K3ggjCsBgSmuoVvExrBS+QzAbeCVfwe+JoRUDi7XhU5d6c
 fvIEOKbj09HOH5IwpgEoHNSCrkFxz1RUXD7drh0PNx3KEDe+ibw4aMZ3WtnGj7c9fQbr
 ElxP2nbxn2XToUj8BKmz5baiMZwHdu+aHhCG8oFkDlSG28+FweVfqhRwMogwlBCf/0ba
 fzbrHOUQysyVLsR9dOScCOBzgkUIGh3ygbf/0klAUiWRJTP1JFasawL4xqqRh1yFtQ+z
 BRmwlmDGWUXwzAwnrZIqv9NXs2xz3oSBaCUaRmLMN5ClkyVpb5oo9MAmY46HXFqoo6B0
 msIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753907232; x=1754512032;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ydqOzYMSiTHrp0lzxlkXWJp5kp4/hOFIM1kFanwyZso=;
 b=RKxLCCdf19Lsob/8oiA80E4mvY3yoFPXyPJHqQ05VKj2gLjFSlBhc3FDQJrlWVUupT
 g1ohgWejtgpJAe4IbNKix0O2yFEwalS1pmty7YZzqA+zXwM/nNKJ9FGKAxfvz5DUFxJ1
 f5mIlL58x5AbyV3EPu7QRml8AYBwZ1QHTBlmu0lsSmYZl4qicDqW6tkeU4oT6CAqG22m
 tFPb43QRlRija2t8BmawcUihriuZeS7FWdpP5OqwZ0+e2aRdn4YvNb+/TTJkEFjtLuYY
 EYDq4ps4AcnAOEPqHql2kMR3DdaXdKHydz4ErW1YMFL2NFh67xbqqkTr4SmaLcN4jwCs
 4VWQ==
X-Gm-Message-State: AOJu0YzUKJ0tal7QDhFh4hL1IG3dvU5w0cyeGZckLcsSiZRknKCMDCYO
 6mraZXUisFjbhCsbjbnDNbc4bMcUT97aPJimZsZ68/vOBLjNDjIs+JlbaJ73VxBlq8U=
X-Gm-Gg: ASbGncv5hQ2ejBvBtVA6FxDyE5Yjgp6RF0O3iNNtFskO8KAx084wh4FdKDaKzcCaCyN
 fOCFj+7SNXRiEhYMbbn7xMwSMQQlvLcJcT7Xs40fdPJve+Kc7teqWTqY3G0RY/Cixa13isrWySv
 slwHch++iXj9g8P3EX9iW1MrTDoHUzfzgg0daQf8j/zFuQc12+V83SUWHPGckAB2mWpM2dBA9oH
 CxKUDb+boJ0mRnC7YT3hY8esBq0k7DxVcmS/uyhqTxNDXT2isNBxiIgQgxXAYMIcJvxcYR/XAyS
 F2O9CcYwbGNYUhoDSsmoW9hoWFMNyfpCNI3M977CgOoOk2TnYbZ0aubsEvi+9KabaHS9jCXhOm/
 Y5Y4CY0woq+HOE+s4H1y/mxeh8/b5PcJb39w=
X-Google-Smtp-Source: AGHT+IFHWGyAfmwFkwcWa01z05pk4zj6sQJlEBLGOegfOMd58w/BdPtC8nsuNPYB+iv6U/nRLYaP/w==
X-Received: by 2002:a17:90a:dfc6:b0:313:1e60:584e with SMTP id
 98e67ed59e1d1-31f5dde8749mr6024408a91.9.1753907232251; 
 Wed, 30 Jul 2025 13:27:12 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eca6e9asm27898a91.18.2025.07.30.13.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:27:11 -0700 (PDT)
Message-ID: <68054553-a60e-4e10-a32e-322395691201@linaro.org>
Date: Wed, 30 Jul 2025 13:27:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/82] target/arm: Add prot_check parameter to
 pmsav8_mpu_lookup
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-2-richard.henderson@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1032.google.com
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
> Separate the access_type from the protection check.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h    |  5 +++--
>   target/arm/ptw.c          | 11 ++++++-----
>   target/arm/tcg/m_helper.c |  4 ++--
>   3 files changed, 11 insertions(+), 9 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


