Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F980CA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:20:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usOcV-0003xs-Sh; Sat, 30 Aug 2025 12:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urkCD-0003sF-1B
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 17:30:13 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urkC9-0007Ih-QX
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 17:30:12 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3cf48ec9fa4so110119f8f.0
 for <qemu-arm@nongnu.org>; Thu, 28 Aug 2025 14:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756416607; x=1757021407; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BTAPLx+XRUCUScXigpuM6gWrdFLKAeOfwI7pBonX9Ew=;
 b=GPWsqayP85t3AKWbwH1v6s43nEpRujVy8C81prpldxoi2BM49hSAFbgsat0BX2rl2h
 Z1hF46TgOTcPQgGvZa41YoPiAGTCwS/IeRnvnr/T6F9JeHtrz6/1Ak9HTkQ7IztbeQfI
 kHqhMP6bcdYkowyji6/eqEgrg2yvuluT2gXQGZS3jLPt1BpSv0V23KJFQr4sdh7b2fyV
 A7XkeVV75bbsY1cD70ChPy4sp+VNIYfAdP1Ptjemu2c3xDAO1/5L6Ypi2eo4s2C6iV+0
 bWPJTKx2zND3i0Us2C86bdBgHdDyoxGc01k6IeJ9O+1gfbyYPi/5cgU052Hoe5tgMMcj
 eZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756416607; x=1757021407;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BTAPLx+XRUCUScXigpuM6gWrdFLKAeOfwI7pBonX9Ew=;
 b=VfnyZCZCtAHEhQhRRX9Z9xACwyNZ2cG3GNgkkVtigOIsNsmLbLq1lVNLLVDJnGmvt3
 QBmSNWvrzpi4js9HpAP4wxeO83wP7jYhz8nJ/mCdp4BGC18YxFf5azbOd6ETmgp9wZaZ
 Wbp4bmz30d3ZCT3QqhVXLg8yfNbHDAb6dB1pgN9EPX214Hs+GchPkUDyIBYwlg1z9aPy
 Bcrh71F/vBwpPyHmBwssT/koi5pwcJHtKSJXaRwuhWUawslQeO7r2eJS86ZJ9ra8p4u+
 tt8MocqPHqKA3IM5uh66SB4+Yk4p1AcprHS0Beh3JYVbiDpGatAFHT+xm6tPDVrGw0hu
 ACiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrmoRJODY2CAxHShOb05Kfq2WnbHiC6FzesUKDoSq2mAHajI63wGeBBrHbs4eAjoGQywmZ2z+TUg==@nongnu.org
X-Gm-Message-State: AOJu0Yw7jjgISCf2mISm4ciH3FFKKzdwapLILQjgawG0loKQFJWvRBOC
 V58ixGO+oYJYzVfI9vuGxIZ/F3vsi1dwr933NlK8xd7Rkg/E5ct8zJiAiDzrnK/4DTU=
X-Gm-Gg: ASbGncsnvylx1B/DJXlNF9QpYqyNAGNTnUZZhIXK+VtNw90lyZSDt8+L1XSrmdA4NNI
 GhZ8uPNGoLFDg5b+Zn3vv4xNn1RD2cqC7KW37L4IXAQ+ptwUx6CHfVPfuodF1u+ejLzCKlwBbZ5
 l7OVDyeVpCs4dbwq1eTXfFDhVgbr5TssJFwuWFF1474CU8Xxcud0C1LAJb8aLpXAhSNtAo+upVR
 79Bw1sCeeyKZB72nDIJChlAhYiJ/KtS3gca44QTuW3QL/snqqRNaVQxtVbKb3ZX49+VggKkf327
 //B30osNKYybxYp3L8fyQW48W7YOuhmUPhr+Vqc4vpZ7QM9Q2rAZI4dM7gQelmVkPvP1r90KP2o
 Kqv1mkpq4+X14LWGNcqVvGSdVYwfAujnYSPZfn9ggdN6fbUIEbF0yNvy8wNkyAI7dwQ==
X-Google-Smtp-Source: AGHT+IFN1TchzTZyzbUIFy7pnUTMKMLUULDNUOBRBjMFQYOoQIme5v8yFE7l+b7Da91NdzVrMtvi2w==
X-Received: by 2002:a5d:5f81:0:b0:3ce:f0a5:d586 with SMTP id
 ffacd0b85a97d-3cef0a5dc84mr1006297f8f.1.1756416606989; 
 Thu, 28 Aug 2025 14:30:06 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f306c22sm91440305e9.13.2025.08.28.14.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 14:30:06 -0700 (PDT)
Message-ID: <12c7bcb9-5d56-41c6-b680-8e1e49926312@linaro.org>
Date: Thu, 28 Aug 2025 23:30:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] target/arm: Remove iwmmxt helper functions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250828140422.3271703-1-peter.maydell@linaro.org>
 <20250828140422.3271703-4-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250828140422.3271703-4-peter.maydell@linaro.org>
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

On 28/8/25 16:04, Peter Maydell wrote:
> Remove the iwmmxt helper functions which are no longer called now
> that we have removed the associated translate.c handling.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/helper.h        |  95 -----
>   target/arm/tcg/iwmmxt_helper.c | 672 ---------------------------------
>   target/arm/tcg/meson.build     |   2 -
>   3 files changed, 769 deletions(-)
>   delete mode 100644 target/arm/tcg/iwmmxt_helper.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


