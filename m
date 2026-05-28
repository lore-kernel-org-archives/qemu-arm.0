Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CB6CD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 22:32:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSjH0-0007q3-OO; Thu, 28 May 2026 18:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wSjGz-0007my-Dx
 for qemu-arm@nongnu.org; Thu, 28 May 2026 18:32:17 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wSjGx-0008Bf-Nb
 for qemu-arm@nongnu.org; Thu, 28 May 2026 18:32:17 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-82fa8d6425bso6119287b3a.0
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 15:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780007534; x=1780612334; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hHv/FV/3zx/fudig478+NVKJKOIFAyYZJY+3lVapc+U=;
 b=GBxvV8Eugd/jzk82NPLb5iIInzYY1qrzZNtmmHX5RkdX9MkKKkcZyp6JjK1ml2De81
 w/OS7pYLqiV1cVX3Lj4bchONP85WJVNyA4bIn28p/FG/y/34A+Yg68/JXaflN9DwQpgw
 pEtP18JvJHnWe9/iRJE7DA+qXSjO/oGCcEDdCqlWn9j+Hn5qiEcd32Qsenj1nN8ws8fJ
 XIk53JQzB+2AoWiTNtAE5Fb6ZT3aOITeF5m6en527xuJ58dp62ispULSGPmA9KUF7VGx
 3XuEqTcmLecRxKpJyxps8fefQuWI7jLvv3MAyp8t3EytxU4i5QKHtV5BIRWXbxA5G303
 LqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780007534; x=1780612334;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hHv/FV/3zx/fudig478+NVKJKOIFAyYZJY+3lVapc+U=;
 b=oZkQCnchFIW2pe4wQDgFT+9g8xKTc7oKku9e+nPJxLO3aKX85RmpigOkaxgHX0tegW
 nkILLzJGmxIilR8EFSoZxLw3QeLJ5bxe3Jv9lZUh03BtSCNdSBcbvX6OdlCIf7WyEM7+
 h9PQJaNefE2fYf9lpw7crZ+veGe0FvNn2VaF/RWpU/jrqliukBnGymIk+7jOq9X4odOY
 2XMOvGr6on3RSPgs0kdXQUn940kmlkXAP2pon4ukyp9e1Ong5rZ34EVtzzRqE6QxGMZs
 woCKcGsHgyz8s1pkFuJrYaPTVS/iPjjwe1pGXJc0w/qPwWymwAlld/rfXY41UWne4jS9
 3wmA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9c61YfgRo/hWZg0fLdHFt2ImDPTVauMUugLtlIsZuxBqLH2rbsDlWYr3AJ3jC2SRDO6iZ1DLBXCw==@nongnu.org
X-Gm-Message-State: AOJu0YwhUtagUvlIuZDm9aE53B1QFAEkbFe5mZRIxWc0DZnhmGAUyQ+T
 IG52i0uNoU4sgVHbuz7zX/vshwO0jRvM0YbUmAOpxGWRFbwjYiLox34tnlhe5zml8ps=
X-Gm-Gg: Acq92OFh6YhIDN8Pr5hwvdomhH9TUQsnwG9oexZG/AIEsxGGGzmeo7GFyiRN42lxZRw
 Fk5UwvYInytjH7TpGRfpSnje24G0gHw9xaTpI9y6ctaEc4g7JC8gIbj/ac7FQaKgsbeKmqtLpPX
 EhO3V8CHWCvPVF8K1QmGmPuQS9UpKvuLaLf9w23asb4eHUTO7trC4cj3UPoSzEvxByA4Pk4kS9L
 GDcxRieo6BDuf4ELfh3UBkBj07CP2yeLi2y1n72htAl4K0K9pJhih4O+y/XTazBOoS1jaSdLRP3
 RDUquAMWu7+rTefmpjNJxjZm/ku6AODQlCTAZt41XXxtHUomLQKtNDeGHR9WSrbfgv4tonfRNfu
 ACszPH98/XpcyaOpPxHitR7DI93vngLis/X7tWgxQHkJt0lABVefGAlQ3u5yxVhz8mWLjsb3YcU
 ECoUkIcjetuB8OAEcy0LhepLH1H2+F3L0Jzj9td/76WXUEYus=
X-Received: by 2002:a05:6a00:2884:b0:82f:85c8:fc19 with SMTP id
 d2e1a72fcca58-84212c15977mr125027b3a.11.1780007533659; 
 Thu, 28 May 2026 15:32:13 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8421310cd89sm5570b3a.18.2026.05.28.15.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 15:32:13 -0700 (PDT)
Message-ID: <5359e054-2bfa-4188-9b51-eb3d2177d8f6@linaro.org>
Date: Thu, 28 May 2026 15:32:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/15] target/arm: skip tag bit bounds check if MTX is
 on
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
 <20260511-feat-mte4-v6-11-8557cc1313b9@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260511-feat-mte4-v6-11-8557cc1313b9@gmail.com>
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

On 5/11/26 07:01, Gabriel Brookman wrote:
> Virtual address canonicity checks should ignore mismatch in tag bits
> during translation step if MTX is set. This mismatch is checked during
> the tag check instead, in that case.
> 
> Signed-off-by: Gabriel Brookman<brookmangabriel@gmail.com>
> ---
>   target/arm/helper.c    |  6 +++++-
>   target/arm/internals.h |  1 +
>   target/arm/ptw.c       | 35 ++++++++++++++++++++++++++++++-----
>   3 files changed, 36 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

