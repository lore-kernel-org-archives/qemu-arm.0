Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166E3CAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 10:46:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1jTy-0007qk-B8; Thu, 25 Sep 2025 06:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jTv-0007qM-B9
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:45:47 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jTn-0007Jy-FS
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:45:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46de78b595dso4095005e9.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 03:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758797132; x=1759401932; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dfRaA6gSzvSsV9rp7HGlFghNlywG8TzQ8wtJQDTIfEI=;
 b=kpsMfFSFndvDLMkmypR5QdtUHw0vevw7m/DV/QUNTBUaYtumqVBmAYt3UhyeG0dp/b
 48Fl8Q6PrkOR/3TEZVZJqTygHeeiOYA5d4EPCXEXCm+BeOe+HUZRoqpu8iwC0CH/pvtG
 lUYslhBsQiANgC7pBInP2H3um/zdkCm5Hm1peqXh/w8mIraB8gz3zttRYdjjdl7IR0jg
 8hICyjKwhBrL0qB/NGeBcJ/RuG2fLUy/KIXwaB+rX+sfj68vFO/9CJf9n590fmMW8EpT
 emjBKXaLw7UCe3upaFQH9tIls8cFYLMI7pMRHIXD+pzw+Mxz7iy7fkTdeZvGjYS/bSTX
 jvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758797132; x=1759401932;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dfRaA6gSzvSsV9rp7HGlFghNlywG8TzQ8wtJQDTIfEI=;
 b=qHt48NWD4HgIyYpU22fpcFbRTP7GrGvHlx2WLOyfMII87HMwEWlA/LulYlL6fwXzQ9
 MK2Gt1P/CEFNFocaJZvsLCnO2yu7m2UZYQxxfRe8sLc/yd9906BMW1FG71yYQtRGJeEH
 fjvcbhRHsfgyh+HdUm9vgd4/VM4tfUxNTDY6r405KgLjeY1EAILQrEAy8QleUMQ5nlDp
 9UqIeRZuVJ63STYN8bh1aMHo6Ok2g/6TgMgWp8YsKSP4KDXetC80Ofha9qddD+UIEJ28
 Arf/dmsTYPAEYKWiNxHJVdqXO5Q6aLngKlrgwke7xcRG7f769Q93NlUl6c3zV60lJRMM
 lOVA==
X-Gm-Message-State: AOJu0Yw5E3Tf3IRDDmjOBuLpwtfQaW9I16+IdI1cMdfrO9Mvf/xznEWA
 hrV35bl+0k3ifACBJZ/TIcX5oL2LgcxePdG/Zki1nG3JpKk5WXB7TPM9sGpsDgUN3V8=
X-Gm-Gg: ASbGncvOxELBFJanFTzUcQ0aOEXpPg+xRF256FbeGpEoI78BN977/Tx+0Ixkc7vjpC7
 P4XbS/IWiTWQoby5U6gBvLkfI6g8QOXIZ4Nm1FhNioXKD+9XCwLoAe76n/e5LtVu+8QS208nPKi
 1fPhjKgki5vgxV8Z21fEE/WO09pwP/Xtms0KRjCK9Ys6tecWx6/JQKtP6J84hhQEW2wUKsbrNcu
 srypwZ+sHb96bBd9fuSmotRfBwSPApftrnp38J8fDgDEfQ3EjS/wMvgfVlImMUxDPi0d0UD5+KB
 VqK1JNcr0X+96I8zoUwn72aHM3xrPtjC2lVwIhnyHGizVeA8NAOzg2wnEt7H/CzHkY5rhM4bpEF
 uEARR1/4Dggi7gNAKJ9JO+VyYUcp/aD8Xl9+gZN4oQizJ0ihjRW9DnFkUlPuCjEJrCg==
X-Google-Smtp-Source: AGHT+IH1LRZhQtZXYVh/15JefO6OhsC4FAFZOqbPs+f41Kq1L/3Z3h9jGIPNewr3qc7jKNpTwb5q3A==
X-Received: by 2002:a05:6000:400a:b0:3e4:957d:d00 with SMTP id
 ffacd0b85a97d-40e4c2d2576mr2885554f8f.58.1758797132429; 
 Thu, 25 Sep 2025 03:45:32 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33105e58sm14305605e9.7.2025.09.25.03.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:45:31 -0700 (PDT)
Message-ID: <9c21df4c-1e32-4c64-8dbc-61745ee94e5a@linaro.org>
Date: Thu, 25 Sep 2025 12:45:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/36] target/arm: Remove cp argument to
 ENCODE_AA64_CP_REG
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-19-richard.henderson@linaro.org>
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

On 16/9/25 16:22, Richard Henderson wrote:
> All invocations were required to pass the same value,
> CP_REG_ARM64_SYSREG_CP.  Bake that in to the result directly.
> Remove CP_REG_ARM64_SYSREG_CP as unused.
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h            |  5 ++---
>   target/arm/kvm-consts.h        |  3 ---
>   target/arm/helper.c            | 11 +++++------
>   target/arm/hvf/hvf.c           |  3 +--
>   target/arm/tcg/translate-a64.c |  6 ++----
>   5 files changed, 10 insertions(+), 18 deletions(-)

Well noticed.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


