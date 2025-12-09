Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A45D3B7EA
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Dec 2025 07:03:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vSrk4-0003FN-3U; Tue, 09 Dec 2025 02:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vSrk2-0003Ct-Qr
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 02:02:34 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vSrk1-0007DO-Bt
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 02:02:34 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42b3c965cc4so2432896f8f.0
 for <qemu-arm@nongnu.org>; Mon, 08 Dec 2025 23:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765263751; x=1765868551; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NNcfyAcCwyGfRTgag78NaDpFRKLCoxinAHUTJgJ0dHg=;
 b=QibcLav7Rco3nAvpkhhxqVgYUsCzsBVpgYl/8J2KNCfHkaB7hp8BykDwQ0f2Oe8j1C
 Y8T+VCQVTqRI8//RcAl0NRFf0I0pdecQC717a+l/JgwVE0ZIVNYPdNin/zkXf7QUttzM
 +cPNoVk1AFymXDtB37YNHJ0sCDuJat0A431RVYxwenWhUFrC22Nbn08qCs7NA2cQL7iU
 6bXn+sHPdKGHyO7SlQPeN6syLP79z/iFoD3lrMrZ+AY6u3kh9A/tRfyLMXhQuq1t6aag
 Wq75h95yOy5X3X5PsJdj+W2HJXJZCAOlZ3Dmvgs9XswezsX9Y1EZfvDWIKQ/fsNykCG6
 FuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765263751; x=1765868551;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NNcfyAcCwyGfRTgag78NaDpFRKLCoxinAHUTJgJ0dHg=;
 b=gR6CyoOlqRYX73GoYvHUowAlMWJ/HAoC17RxQiU54G7Q9s4SigSPTmgLWpTlFcdBuU
 6UA92+44HtRGu9skns7PjkQZwbyPJePK6yrG3REaU8pYpJ6gFZghCnsNoVehkecBtFXp
 ibF0UCGj81R5iAOhW+swZmTZaYIkWydJmTOIfZRuRNorW3dI944BocPmZznlCr9pQu7L
 khjROkrZckYh4VELz81gkL+C5MQ6dCPgMWGdWquNCJaak5kcgZq3qMvgCiqL4YP3n/aC
 UPkok3N+wEelxRpU5mUyKsx2JiUZHvUKBOeZ7tPM5tFbo9G7Id0NL9qO/gF8gk/Ndr8i
 V25Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKFtnk+TpZZd8SKVufAoMXiP6gf8J0f3VA3l+m+inspwcX9PJhpt873ApCIwQXDRPG+xralq6jXQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz6wkRDpt55/yi1ghTq6/ZBMxT2Ztuos0KtuM+ISPVsb7YhRAXb
 Hkj1n/1j3zqbVCmIQLjr4u5e/yPgqzF3aXd0onSQlrWUiwgACSFGnGCOD0hKU8hn22g=
X-Gm-Gg: ASbGncuukm8g29FdasEi85G8GLjj0HQ/JCz0UdXJk4eL3ZWg9fIwfBoLD+I0T0EiMfr
 WQS9cpTPEdrr+kxWSP8xxWFKRTPX/4CnGqICx5/NVn6aJMtH/d93RpJ6Sk5N8W9cBn133BxhXbi
 AsIkfeQn51l2+6Fla9BQNyVgQPztaT+0kiTf+kjpzIXrZMnWww8L98gy/KikYWCQ7PWcfIbW6kl
 wA7eYhjC+Flw5YyHgJbQujINIWdLPAKCuBMe4MHt2/DCtD91hXY7azWFvos/Mdm1eZ+8UYZHb4c
 1nRBz48NhOzt0ljasgc2IeVq/LfpxUbipMTeZoSaxYHC0dlIFSkWnEs00dT08kf109chRfS7b6b
 pkVkncUgeb3H4B6dCN1T9uwwFiN6fZbj4mR9MGA9OAm9I95bNReATuOPsfUhpFpfi2p8msw8Afq
 RzPNjKzf911yeNbL9o0UPV/qFfuXWBQLYFT7/bVcyAC8jFwGIZzhepKg==
X-Google-Smtp-Source: AGHT+IGCWGtpNkrUKdhh1UWFBi3QTG9AdKqms5CQFV6lqW1HzxSQeXgI7NEnjfmJKkajOPcN6DvhVw==
X-Received: by 2002:a05:6000:400a:b0:3e7:6424:1b47 with SMTP id
 ffacd0b85a97d-42fa08e5cd4mr568543f8f.6.1765263750629; 
 Mon, 08 Dec 2025 23:02:30 -0800 (PST)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbfee5bsm29870451f8f.16.2025.12.08.23.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 23:02:30 -0800 (PST)
Message-ID: <cda3b299-3de2-4124-9205-228698c29c00@linaro.org>
Date: Tue, 9 Dec 2025 08:02:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Revert "target/arm: Re-use arm_is_psci_call() in HVF"
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>
References: <20251205151115.2035930-1-alex.bennee@linaro.org>
 <20251205151115.2035930-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251205151115.2035930-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 5/12/25 16:11, Alex Bennée wrote:
> This breaks a pure HVF (--disable-tcg) build because the fallback stub
> will always report false.

I guess I never posted the patch that moves arm_is_psci_call() from
tcg/ subfolder... Odd.

> 
> This reverts commit 4695daacc068cd0aa9a91c0063c4f2a9ec9b7ba1.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


