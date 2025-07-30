Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C830CC87FC9
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:24:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhEHp-0003JT-5a; Wed, 30 Jul 2025 17:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEHH-0002GH-Cs
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:23:59 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEHF-0001dd-W5
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:23:59 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-23636167afeso2867995ad.3
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 14:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753910636; x=1754515436; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R+bE8hWP2JeWMfSYD3qEgTDgSjiXVeqB+W8RwdlLV+g=;
 b=irAgrL1URdeoFCsQkTQbK4SS5b/wU9FbPeOJr7QUEymIFk1KAzSYGDnHa4wZaXiBVD
 Hx+mHG5Gh/BPjnWawFa3yn3KAyjnip99QTvKkdzfNyzBr33M25dqyLt6rVxp8RQ5bi5q
 ThqZv4+qfdvL2qMQv0/x5wJIw6hfFeBCnDO3pNoiJC4IDVAo/JJNzkmFYKmPMIFurdor
 gnEzXIm98HsI5wQ6A3csfHju2XBDBfg5/pzZa1StIUpSC3YVyuTX5FFuA6p6cURWPLK8
 vCa+HgVJ1vyHn79dgq5ixZZ39uc8kiUxo1So4mRDaL9mJSP0NyovIvE5QAF6P0hBBS+3
 nTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753910636; x=1754515436;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R+bE8hWP2JeWMfSYD3qEgTDgSjiXVeqB+W8RwdlLV+g=;
 b=Hb2ENMh6+oEEeIbttodL2hzb2Vq+hm405VOIc/aYA53XXiDenI6qD9I5XDTiANRrIm
 to8Rraf2I7qQXSa/iyW6txhQGXy9KnQdfYUswALOhl1IJ5H9ZD6sWxpCCgWl9cE0XJ6O
 a4TRYpmdvGqdmFp1Uw+/wM5l+Wm8UJluQfpdJ5HnwWfNPbB6XzT7gtWyDbpA63ma0PWN
 uhEXWyxUkmqmys11xuMdm35pZAGZLvsnFhO+Vyov6ZVTFcFQw62AcgrPGbTJ7qwV6dJ5
 YLVhCnrLBIPnHr5RZISAyQZ43kurCGH0yxuam4iJCZms6waaX2gmAp70FFle6RvObuNk
 SVJQ==
X-Gm-Message-State: AOJu0YzoKyc36p1EBuLz/JtG7SOXwfgNHB1Po36W+IygcHZoZcmZXevr
 PBhaIke47nrRNJZPNGzhfG65C2VcDZphgXQ6YrUHHAPm1wXyadnbMHh8rXx/T1Hh/WA=
X-Gm-Gg: ASbGnct7r82oNfDVwYu+CYGN0hmwRdOkMeitE0CMdjO5p0jKpqHlQPHDhP1XVSwMjMK
 ikLkxpxiHIM71Y0b67ungEO+SEyKIulR8Ay3khAZ+7JYnE9qVmBZo6tWrTuJcqkx/L3B3oVUvi6
 kVDgWEjmIvvUb+h8SazfcrlriCyAUIijwqzFxN2dU5p2LWtAt3rWUEAtgggWfefJVQ3OYsmNUVL
 87aRFzPVJhKSO2fz04jIrewVmcIaqAKp9UegknBoVyCzjq/OCwgYnjEmQbZqV9xOxeK3odO1CGI
 F7l7NNng0IieSMtSHI2WFcKeSZiVwUQ06DTKbP7R28BVu+JiD6ZDVbzacIcOYoFG9hEwgZuIOwv
 wMzZFHUBJqInSUChZ2GTQ9q6rYuQA0KicvSc=
X-Google-Smtp-Source: AGHT+IHsfPKXqWoakxub6XLBz0kZZ537VcqitU8IuwQFXaoRqHa7vcUcWs1BO2GLQwWPFoE4yUlUxg==
X-Received: by 2002:a17:903:2290:b0:240:9cf:99a8 with SMTP id
 d9443c01a7336-24096ac5979mr70086955ad.11.1753910636373; 
 Wed, 30 Jul 2025 14:23:56 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8976a06sm544535ad.81.2025.07.30.14.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 14:23:55 -0700 (PDT)
Message-ID: <3fcdbd79-a36d-47a9-8ea2-275b53d52441@linaro.org>
Date: Wed, 30 Jul 2025 14:23:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 39/82] target/arm: Convert regime_is_stage2 to table
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-40-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-40-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62d.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> This wasn't using a switch, but two comparisons.
> Convert it to arm_mmuidx_table for consistency.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h       | 5 -----
>   target/arm/mmuidx-internal.h | 8 ++++++++
>   target/arm/mmuidx.c          | 5 +++--
>   3 files changed, 11 insertions(+), 7 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


