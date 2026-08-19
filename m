Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62672C5B572
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Aug 2026 15:06:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwhrd-0008DV-68; Wed, 19 Aug 2026 11:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwhrb-0008D8-FQ
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 11:05:59 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwhrZ-00024I-Jt
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 11:05:59 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2ccf2360620so8759035ad.3
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 08:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787151956; x=1787756756; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=br9fDUNcd96vwGhn1ZNCB/BiQhDD6ktjxAW0cbXVXL8=;
 b=QrdIxcFKLm60zW+a9MkM2hFZiIktpu5d97IZTjlX9v/u8ltMPxlBHl+HVpeRjxKf5x
 ZWQNpMzSidQvg+jOWvOl3NaNEr9e9pdMFBNoBfMFAiyuS3smUS9/x26CikDfQFpTu1Hj
 UoDFSJDtik+MSlnKmI5GSFsxsYo+0ll3AaIkwg0eAN5kHpfo/xkJyoDAK/naILcJCQNI
 niavXoQ2JWRUC+5NoamQxR4n6FWkjT/txB55j1kL7dzF2vqecMOSALz4b3MPrHbZGiEz
 LW4FpQjfifWIPZ7sWN7+MplyeChpTDMVgoC24P6Y/CKVo9riohCROuG7ABmw7ui0bqsz
 Couw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787151956; x=1787756756;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=br9fDUNcd96vwGhn1ZNCB/BiQhDD6ktjxAW0cbXVXL8=;
 b=Hcl7wimz+8bcFmtQUpoje6qi7lGrwBapP1uaojUxFVEp5vKVdYURdRrtiKB9lBtriQ
 +1BKv5w25fshePvlSwW+4z7GnXcUAlAcl5EVm2O5AxhgN4aGC/cFkTJimedPIhu4fJJB
 Ne8HmV4ZgfS6zKQkdadG1tZSSjnOsbv19NYLR+3PM1COM0ZO7FREmNYD9JTAiJzC664p
 2lXP1gFsiKbyjcYQCVq0bYWDLjlH2i84o0haTVTQOLtnqNGBMpvHRSPw8QOSzXQmllZP
 qoX7IgrmMSsGARpHjFiPsr8H8Uhv9/MszqDXV3zrJ2NBCcv62VJGFjiMo1v7G9JN7aUB
 t0BQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrBJ4WuZhsqaxsOaN99YXSKYDidj5zMvbLi6RnaSj6NRV1jsFZCR+uNHUNKMxZnywMoFg6mveyGWQ==@nongnu.org
X-Gm-Message-State: AFuF++ncm0e9sdq/wCEpdPT89aHeoXXA4tyHtW1k8dJJQXC9kOYBJUft
 ZBLygmiM7OjtqFU7wJ90gC7NgjyHFI8i4RNdX6EwRmgS4/vVCHcZKXZhKnk5RuVdGi8=
X-Gm-Gg: AR+sD10hGdinVxnTmkQzvqC6ErJ3tC2g1jGUZ15mBORvT/ovqNOjxduSmfsG1L8yLwT
 Sl6nHXlCjJmBpe7tRrEiny+xk3Wrarlw38/9+8gdq7xEcNx1gvBOCZEr8A1PH+oLLmAa4VlR7XV
 G8N/iTrJ09VsJ8mRHAH87+DsXm299m9ajsN2RRu3S7L4BzlYetwYgkQNCIOx+LT4OXFYK4oLmV0
 +bFs84iX1p2xW2hA6d536y+dhcIFX91LZTWxt0HkBL6kj9uerCUqlVj2wbsogS/uSH1uqTF/GLS
 f2G9M+t85HD/++88qEcWFG0uRPq05UG36KzUBm66XNlp3eRLRLvVxfRV2dIlA1d247wIyrlrnb0
 DsXl6Omc3fxv4xDoTWNKjLyLCUIF8NcBPqqQHbFinxa4rLWjgz3pavUNhhWlQH8ED2pP5cTTSnj
 ZAyPiHJt+vvm0PRO0VUEOuW/gd0M1VofF+agoXEbqJQPSMmt4iBCoJxkusYsmkeGdKDTAIyI/d8
 ExJOXXS0H3+AIO8uMLO
X-Received: by 2002:a17:902:e80d:b0:2d3:a6db:299 with SMTP id
 d9443c01a7336-2d5fd703145mr92823625ad.6.1787151955835; 
 Wed, 19 Aug 2026 08:05:55 -0700 (PDT)
Received: from [10.213.131.227] ([172.56.154.52])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d5bb4dfe6dsm28479065ad.18.2026.08.19.08.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 08:05:55 -0700 (PDT)
Message-ID: <c1c0c724-0d3c-4bdf-9e9d-86f4caeff6b7@linaro.org>
Date: Wed, 19 Aug 2026 07:55:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] target/arm: Add new feature ARM_FEATURE_NEON_TRAPS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260817123838.1578060-1-peter.maydell@linaro.org>
 <20260817123838.1578060-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260817123838.1578060-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 8/17/26 05:38, Peter Maydell wrote:
> The traps configurable via CPACR.ASEDIS and HCPTR.TASE that trap only
> Neon instructions are unfortunately IMPDEF about whether they are
> implemented or not, and there is no ID register field that identifies
> whether they are present.  In practice, they are present on every
> implementation I have checked except for the Cortex-A8 (which was the
> first CPU with Neon).
> 
> Add a new feature ARM_FEATURE_NEON_TRAPS which we set on every
> ARM_FEATURE_NEON CPU except the Cortex-A8, and make the CPACR.ASEDIS
> and HCPTR.TASE bits RAZ/WI unless the CPU has ARM_FEATURE_NEON and
> ARM_FEATURE_NEON_TRAPS.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> We seem to be a little confused about whether ARM_FEATURE_NEON
> means "AArch32 Neon" or "AArch32 Neon or AArch64 ASIMD". I have
> not attempted to unpick that here. I have also not gone so far
> as to set NEON_TRAPS for the accelerator CPUs, since they won't
> be using the sysreg access functions anyway and (other than KVM)
> they don't support AArch32.
> ---
>   target/arm/cpu-max.c   |  1 +
>   target/arm/cpu.h       |  7 +++++++
>   target/arm/cpu64.c     |  1 +
>   target/arm/helper.c    | 17 +++++++++++++++--
>   target/arm/tcg/cpu32.c |  8 ++++++++
>   target/arm/tcg/cpu64.c | 10 ++++++++++
>   6 files changed, 42 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

