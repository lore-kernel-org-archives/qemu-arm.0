Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB66C87FD2
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:50:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbAp-0005wA-9U; Thu, 31 Jul 2025 17:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhaxZ-0005k5-8Q
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:37:09 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhaxX-0000g8-LS
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:37:08 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-b4229326f89so1065153a12.1
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753997826; x=1754602626; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4lyau6g7ZS2X5dhFoC647e0I5kJk8G+2Y7odzEKMVBY=;
 b=iNAX1zi20Ih8nux4NqW4ZEHY/Ykn+yHXC94MGpilZmQDdyjFmDB0TVjuLVt+FSlaFT
 DyfAWVaXW9jRezyqNyX+Fu+PGVTHdJ2D8KPaEX9tyWoPWxvzqDuxz9Cw+Tw77nRguL+i
 jKrmMEuEAYTqzaJStTpjSQYOa569gC8z5989FQobSugihAd/ogqxSSwWvXi/qqDGbHIx
 xPy0VxA7sFFaN+gJdQFimB9653Ihq9noyW35o7chlB6ejsuVMiZPsCUNVapgW1v/5ysk
 5yyh+MMoLcNCPtEHBfuq2Okox9eoqg++LrUeQ/LsBdSADYw+sMj6IDl4RfieCq8qGJ1o
 ZGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753997826; x=1754602626;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4lyau6g7ZS2X5dhFoC647e0I5kJk8G+2Y7odzEKMVBY=;
 b=RpVyFiE/fTx2f69Mx5eyokvYU+GMyxgGpPDnyP5xLONNbI1rvyxo63N6YhCRsO9tfb
 ETB5Oi613coA474DCfyD1sQIyOA6PwRng52u03BJn0bYd4Yj2kSx8zB+ASbIA3c/5Hay
 4YIjcFmRVhuuY8eKB8mTb+YvUyDYOt47Wziv2gmyGQ+/1B6HY+k0E8N5SMdyA4NaYz0c
 1zWgS/MsDk3Q08SAl67+DnlhFrc+QCH6BfurhIrYRvLuprO/nlj1cgrRbLUjecrBnCnG
 1i+bUezvIN0xDCLSZfp4AwaXp+flf7Bsb80wmutCuJsapY0qw5xZ+Lfho0ou8N1LNSN5
 R4yA==
X-Gm-Message-State: AOJu0Yzcwxc3BQ4q9QqlbRMtLaTqG904vBVgfS6tufvJ/4r6lGH3jpl1
 hjQWtaN2sXk2NjroSLepmRTbjpdZmoSIZW5H7wmNEvRf0FHibiD4yPNCzx7Qul8B3+k=
X-Gm-Gg: ASbGncvg3XtURpX8D7WZkr2h/c7VxHAsVVPOizgQU0FjfVkfTaAZJvC3+8F47GA2LoC
 Oclf6mpuBAhoYzwTHuueAgY6CTr0qoFqzi97033CspNkq0gB0mg/ug8dl311Mxx2bb/rQZH0sv/
 7b7iahbuo2sQzCnkCfTlykOhcZSeFyfW5ICz1Tvfn7jxfDvjpB5//HEMu2QZQp0AGR+A4omk2g5
 Gpvmv/yp2anrAdml6En/H6h0ZA+Lsu2PbtZCsfPL62SPMLNQ4/uKiTdm/+q88xjW3nbYkpzFL3H
 e4wuXUhIFqOi4vm5dURzWDZtxi3Q6Y0tLfGIIbmQg8IzEe73kuV90erzYmqa32shhrZUWINlMer
 xn5knNSb+WH8cyhHUFSx56dVnxT2ktGxd6eyvl6ZhH0hfIQ==
X-Google-Smtp-Source: AGHT+IGuOKDF7frtcqHVLz9Q7TXc7FtHCMDBdUjiwRNjOXduin/2qLPwGEsSfeZA2ROEP4gc2IjmHA==
X-Received: by 2002:a17:903:2345:b0:240:3f43:260 with SMTP id
 d9443c01a7336-24200d2c79cmr51136015ad.17.1753997826190; 
 Thu, 31 Jul 2025 14:37:06 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d21dsm26003825ad.139.2025.07.31.14.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:37:05 -0700 (PDT)
Message-ID: <509aa5b1-d2bf-4e07-b3f7-97366f4abcfc@linaro.org>
Date: Thu, 31 Jul 2025 14:37:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 59/82] target/arm: Implement GCSPOPX
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-60-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-60-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52f.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h            |  1 +
>   target/arm/cpregs-gcs.c        |  3 +++
>   target/arm/tcg/translate-a64.c | 37 ++++++++++++++++++++++++++++++++++
>   3 files changed, 41 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


