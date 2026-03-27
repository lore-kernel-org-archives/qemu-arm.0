Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADE010F287C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 23:25:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6GYo-0007CO-Bi; Fri, 27 Mar 2026 19:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w6GYk-00078l-8A
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 19:25:47 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w6GYi-00072A-Nu
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 19:25:45 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48374014a77so31606335e9.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 16:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774653943; x=1775258743; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xl3xeWk/amskwF/NXuAie++rDm6J2kgdPA15m364cHE=;
 b=EKV+dKA6X/h/JdVnS+noMFtPNqwjeDKTZ/JIWW+RyruERYsWcHLrnYTG/WKB6X+mmm
 fdH12KfU0CSW+QW1VYHxGuD/xmkf9WMr6pS8WkhIZaouO+MYjXTCGecYl5fuLXX34/k9
 Y5iSUCJmuEwN8usJKR2KGU768EAA5Rn4VQjOKXn9TysKEzBptLPsvhDsaEw9sqCtDc3b
 VWc5Gea8KOg4fdSJ0H7YMvEdQY8JyzyZpZtikt61/8K217zcUXMxB6c86Ojzra3Aonbz
 pdMwo+0D5lvWSQjS6hHneiImw5NtRf2fpfTbFbxYs0Zekf7gSdBvTe25fHBv+Rya+vIY
 dXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774653943; x=1775258743;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xl3xeWk/amskwF/NXuAie++rDm6J2kgdPA15m364cHE=;
 b=mC0L8IcRi2GsPuG0866bKE6xDIzg0/EavpimdhfBnLeMbi5u9mB+CLRnSSoNaWTzqy
 gE+ij56kHUfdhOmfzNQ4u2Zckk1FsVJa2ukyYvCpAfahnkJqlwqbmjbNep2kU/ZbByzh
 9LzMisjAQ3xjHBC8H127hO78Xinp08o84sGAvTRs2pvPHwucXaK6cGN8tK435H7pPsml
 b+XAt1jx2l/B6GzmTgEXvYrfcEIOnEaWGvhF03Wtv4HU+qf8Ws+ui8S3b6p1cjaMttCo
 25nh6h0Uxz9GwmeWTBk0r8VAcapD9gWDc0X37M5QZZUXOs6Btoomn1EvofYmPsMnMYLv
 USBg==
X-Gm-Message-State: AOJu0YzmJXhyvHNz7nxEpAtR6VP140bNEMUBXvP+OGzSHpZx5s5hwo1W
 QvMcvZZQDLVnsYYZcVPiIWVrWs8TwP7BSr7//2FS8acG+NC0Ho+HSnLDKODcd36TDSo=
X-Gm-Gg: ATEYQzxpHT22WVOOZPlJNVdv542UQMUzNGhp2TQLg4fKNuyt39bt8G07UIFO6IFU0n7
 MEE/7Ovj+kpRRkQTn9xCSJLycumojhQvSGcNmIYSTtt8Q8koWy8RY9ZjqsLQNwbdQVvrGhLCfgc
 TJinnxVBnTJsRLojNUHaaW1FuOlkVJLIzkLjqs8c56YneGt4W3R2ws75G62IVlSIUS8Hp7Zfmbu
 WN9sISARUBHOgk51w4hg9LithBO4IRaWLX0YWeuSMPvYRQ3tDdkeFR6XT1TxZM8v3eSq4jBIvO/
 heF2tx5zK+d1LFPpQwtHusucx6Zr7Igh57GHp+Y87inpWMApaOarpT48ZKt6cPLgisfKSNhEB5b
 fRXtyfm8nvQKhmIB8CJ0PEm8IAd4RcgC+xXfJ+OuXIPNnYe9VmL1rzHXTmXbhwv2P4UB0GVo5I6
 24S7DdorJEiSFLBWqMIqc1wLfZphkIJi1WXS4ji3u4Yyi3eo2vDXDUcaWQQZmPXA==
X-Received: by 2002:a05:600d:8451:b0:485:40db:d40c with SMTP id
 5b1f17b1804b1-48727d4596dmr61518595e9.3.1774653943179; 
 Fri, 27 Mar 2026 16:25:43 -0700 (PDT)
Received: from [10.202.147.66] (147.149.216.82.rev.sfr.net. [82.216.149.147])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487278c71f4sm44409505e9.0.2026.03.27.16.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 16:25:41 -0700 (PDT)
Message-ID: <acf34f79-5713-42a9-b841-ca3b17d77190@linaro.org>
Date: Sat, 28 Mar 2026 00:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] target/arm/translate.h: remove tcg-op.h include
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
 <20260327165042.604105-3-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260327165042.604105-3-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 27/3/26 17:50, Pierrick Bouvier wrote:
> Include tcg-op-common.h instead, and include target specific tcg-op.h in
> files needing it. This intermediate step allows to clean up every file
> (TCGv, tcg_gen.*_tl.*) in separate commits.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate.h     | 2 +-
>   target/arm/tcg/translate-a64.c | 1 +
>   target/arm/tcg/translate-sme.c | 1 +
>   target/arm/tcg/translate-sve.c | 1 +
>   target/arm/tcg/translate.c     | 1 +
>   5 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

