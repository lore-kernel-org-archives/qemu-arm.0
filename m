Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11CEC87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:04:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhDy8-0003dm-3l; Wed, 30 Jul 2025 17:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDg7-0008KU-MH
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:45:40 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDg5-0000lp-ED
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:45:35 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-769a21bd4d5so213959b3a.0
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753908330; x=1754513130; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gSQwQrazVrb7QrEaMK2OF+bb6EdKxid2Sc4F6hTjS+E=;
 b=t0QE+UVcQeplvaV4Y5KZJ4U+KgzXf1mUsOU4W/rUiRra4eq36zSk2wggS5tN8P3KOv
 IpvNgeimKeXrRfDRj/CIsDqPhOSkgZ2mytTh19eFQm3EKGRvyFzZb1RnQ2MA0bhceejB
 z4urBtLUDbsxjKS1wITtuT3SyqAyxtEneyjpp3mept3J1wA17K0mDEyefdGcPcopkQm2
 Aa9SyxTYrsacW+VnLBxnyvM+Dfuhl4AOuNrV8BqK4gJT8HcQ36UboWZN7af2iCeoeMyf
 OMHMv4P+TaJmLt0fbrFwxxZCNGy6nifoo0QfCF/9MtqeXh21fJCqolhW5F7M14m+dEVT
 hLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753908330; x=1754513130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gSQwQrazVrb7QrEaMK2OF+bb6EdKxid2Sc4F6hTjS+E=;
 b=Vl+sYtilX8rwWPUjl6q3hZNjQOp5RBXRBqrpH7F9VPsxp4NMJJUI+kOZuKIv9EPKus
 b8VLvRjNd/AtQrB1jqYsRWi2VtpoMv+rsPFBgRbx+SBr8fkqobEIiY0DeG/b1cP3t/Dm
 BemhrWzhR8UmmaoDbnDngkQMeyp/9Rghwt/A8HQ6X4ZpffdUPlOKdxEYUxenLx+uf3wG
 uosVSFyuadrOMsw2tEgJa1+l52YRMZJYKOgWQK2SvTYcPou5sCXMnbCJuWTxqASqDri1
 SvAynglktGjxVogPkZfAe/RGmH8oPhIz4N6rUnq/o4s4RDxVXudC8QlGbyrgMD+niAQu
 h5QA==
X-Gm-Message-State: AOJu0Ywtz0Ly62Qoo849+RyVbXgCKJseCi4jEZLm6sKFfz0XRU5bAugy
 68DNjOVtphWtoKm6l9lE1aJ3Oi6/Jb9ZBQpjooqsKwQ7X6cF7LnAl7YB3nbLaQ3HoTg=
X-Gm-Gg: ASbGncvxhV7NZN4xXgt5Tmn3e1gv5FkO1PRBR8lRfcNfzgw4rXXVfS9TJXvD6Z/bM/O
 tgeBb/+56XBi22RqnRPQec3aINj96UCAfY/Mv4HSHKmSeL8tqDbgvZFNd5AZIsCdJh5MRiSqy6J
 BFdZ/3PaCREegE+K0eTh+rHm2zKLoy7moe3NKDDpVC6Niyv/FEJVQ4Y6fSS8S+/P6Q5H4HW6PQg
 A/mfY3ZdZ9KLUp0VY/L3RkPhMnRFFFv6/vJR/mJ+ZhH3fj0RQQ1ptAH5bb7zRihsi6jCSbdIumQ
 TK1LLf5uVjIXJ58XjmbRDE99Dh9t+a3lGLEna70moZs2krlujI/yx0nVS/LNMvM7RvlTh/E5Qvh
 GEg+lOQSBuyCIKTcDOQxLStNC6OFZHkgCtwc=
X-Google-Smtp-Source: AGHT+IF3RCoD/7Tj65zBjNe5TftCcxtDadzd2LI8BrT6bWFDJHCaEDtXB6bafW+bOzkLy5FSE8BVyQ==
X-Received: by 2002:a05:6a20:7d9a:b0:238:3f54:78ec with SMTP id
 adf61e73a8af0-23dc0f6348emr7623892637.46.1753908330401; 
 Wed, 30 Jul 2025 13:45:30 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640872a180sm11396410b3a.29.2025.07.30.13.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:45:30 -0700 (PDT)
Message-ID: <4ae46690-34d2-4d89-8394-160ff215ada0@linaro.org>
Date: Wed, 30 Jul 2025 13:45:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/82] target/arm: Populate PIE in aa64_va_parameters
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-16-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x432.google.com
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
> Select the PIE bit for the translation regime.
> With PIE, the PTE layout changes, forcing HPD.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h |  3 ++-
>   target/arm/helper.c    | 19 ++++++++++++++++++-
>   2 files changed, 20 insertions(+), 2 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


