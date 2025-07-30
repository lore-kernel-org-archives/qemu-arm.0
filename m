Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DA6C87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:18:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhEBO-0005Pl-A2; Wed, 30 Jul 2025 17:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEAm-0004dA-21
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:17:18 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEAj-00006U-Ql
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:17:15 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-76aea119891so1208839b3a.1
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 14:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753910232; x=1754515032; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HMOC7c6iorBoiuF2w05EPwiDgNn/tDUljKa5gEpvj98=;
 b=eVAkWzbjARm3C92pR2shwPMPfv4hk52pJ6hcwCZJdfL2JP592QAmpUzPQkIjwK/mBe
 fWmYCIUCFSPgql7jh+Gd7BQ4nolSvMyCmFn9+3RK6Cc1EZF/xhI+B28tzBkBBGWgEW5A
 AXCPVXTbm3bmQAGwSx4BHSujUUofemwoI+K8phDTo8q4hR6Gz5JILK4Wu3FMO+Ak2No1
 sg7gWpnQJcWc8P9wvr+JLOtPpuQV6/YbD3aGyIWKoc4oxkx3g2WwQQ1x1nMbAa9F8+Au
 tEX+bCifJ1odXqNSEu5vtkXDtaZk4EWQFoFrE/hMnUJmRxBthSMPytLTjZz8ArmnJe5g
 cd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753910232; x=1754515032;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HMOC7c6iorBoiuF2w05EPwiDgNn/tDUljKa5gEpvj98=;
 b=WN8XPx1qu9LC6LIUqtrV6zmA5YvfzbV73ezLSj6WhwpsRIkkciFzYqQPwBG/DaZtYe
 13OTIXOn+DNMyAW5HgnsLaImfhlLE3fhwg150pyW3LGumsAsro16DY+GsmGdjAdtuYj5
 /MT0r5Iytb1b/XJ641tDZwt6PzCoRmUDPq/JblsCdvti8XNB94HGcU09lYgwLK6M8vKQ
 thEB4ulP5e3si580iSE0A+6gLkIwqb/nJu8wZljBdP9qJ6y0Bb4DFT+x++pDKAfwAC96
 1b5Ee03M8qhrngl8UDyXoXlIs+LG3hJN3dHP+4idsO68TXtEJhjl+cVUYPn1NRCARDwB
 opJA==
X-Gm-Message-State: AOJu0YzQVwR7p45b8JMcRpoe0A7gkXWFBonqYf2dQ5GbdXqTxI24vxTz
 aEoo9+dK/Wcrxbb2F1DsSIA61A9B46nKmtnYWth8/+zr77ItJQoIX2SaObzV/+lltac=
X-Gm-Gg: ASbGncuWRCzxRBlhGDk5szjAscJB6O5J/j1plPUv4jRei4EcudW81Xcpa/MwpSB7TqP
 3vRiwMh7CoCsZOFK5w5we7jovFJJBPrPXy/eMFc7x5yqt5TRjiNjIaGtDv0TTiJ9nFpQ+b5SaMG
 TqiD1aBdLH/AZ6JeMKGz2XeK3GXXNfdChjTt6VIcB4a2hUvhddQoeQuq7FGutsV2D3mkXenwxRW
 UsecbuoLt/nSaiVVOGcNd5E8w48desJ+IokpFelnrUuRy5di6tfeSsUeMhN6U5viEHdke3H8DZV
 4c3CzKctOzswBremsaECZl/0oI9gMFedmauFj+naka/Wu29kLy39DcUBiosGixx2Zu4/qNa+QyW
 uPAtE39ZDlBECDrXfUAlEtRIh2UtsQBjMTW0=
X-Google-Smtp-Source: AGHT+IEyLuTXYUjHqxt3ta0PRmJkza35kz3PKelRuP8Y0ABqLgcEw0OD48zE5dQvZGONWv305SMRNQ==
X-Received: by 2002:a17:902:d4c6:b0:23e:3911:433e with SMTP id
 d9443c01a7336-240967c623dmr73253685ad.5.1753910232021; 
 Wed, 30 Jul 2025 14:17:12 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aca205sm397095ad.193.2025.07.30.14.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 14:17:11 -0700 (PDT)
Message-ID: <5174ca41-fe58-41a5-9e89-ff1bf3770eeb@linaro.org>
Date: Wed, 30 Jul 2025 14:17:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 34/82] target/arm: Remove unused env argument from
 regime_is_pan
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-35-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42c.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h | 2 +-
>   target/arm/ptw.c       | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


