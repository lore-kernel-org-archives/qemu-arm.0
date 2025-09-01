Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17336CA0FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Sep 2025 06:55:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usyRs-0002Cg-02; Mon, 01 Sep 2025 02:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1usyRp-0002Bh-E6
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 02:55:25 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1usyRm-0004i8-59
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 02:55:25 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b0428b537e5so104246666b.3
 for <qemu-arm@nongnu.org>; Sun, 31 Aug 2025 23:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756709718; x=1757314518; darn=nongnu.org;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0xWX6XMK1RH4GwJTomShFt84b8vw11zBJnho3OvRg3Y=;
 b=OLRPRrxzZkgtoFlhbTA6/1V9ULHWbJMI4bUmus+TvIQGSEHESdpi1XDlBv7AjIxYaH
 wfzmnubDdJOxONnZ91jT8pwERAtICWPsIc4g69Sm+r9wtRgm8k/b93oS0An9o1DMiCDc
 W7RzTusvKWxDrriILsji6PA6HNnaI82JFgwVc+rXYzjoFs+zw9XNkn6bYhfbIeykQXsP
 q0oUrUSOxeLBB59kOUm6CmmJqn5emxkcmO7dS8/OPrTAMNAEKXfoR109hRW1chtPzF54
 gx+RHWK63krJUcE5tr813A2hBDKrCzHwo6xR+e7mJ5btiMD9BhJsaa29IT3TVH43qF+k
 12MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756709718; x=1757314518;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0xWX6XMK1RH4GwJTomShFt84b8vw11zBJnho3OvRg3Y=;
 b=waZMuepmFUqNdgy98Ks5L6ONzD/F+rlhYBv2eh7PT8ondyW+/F8pzZrxwQ+NDUJg8/
 S7bVEnZa4blAJFQQ8qgTVCuGAjkiLS2IgR+wzYb4p24JspzvK7uBUjfEuXcshQ/b/XIo
 ZxSDvzJBJR0RseU7vEpp1l7zJ1QIIiWArZjCpXUpw7cJbAREBfsfR0QqZ5WUj+96zG9v
 6c4IohIqo57NOorPO4d3S7tGCV/bVmn1O7ad3gDMXJ3wxVLI0+rJLIrfR+HPWqxZD/Rt
 bwxE5DTv0p0u8Nv6bMz1dbZ9UeNBeitgPRao1RqeNmOyr26VcGNedTkqw4YT6YmmChAS
 3GoQ==
X-Gm-Message-State: AOJu0YzsxZ+kwSQo/3H+01lJD4UEYa8E6+kjxs/+G/rmj/pHhHwmRS31
 Vhx074pdgZf8MIAHuqjdRuo9mnelup7dG//ysyfLxkXRVZNRT8axEYezXCrhL+0gQgXe1Rcoz5O
 AE9xG
X-Gm-Gg: ASbGncsEiGWg8ur5WjirpqpFaQs7Qnb4xwOXwmOThupz/7DIZOF4Ny/sfSogET5CAc6
 0zDZcfmgTk2D1DP7YVDP8NSxjOoDTGF6bbgvKO4j6m9MO9+E/hy4640bI5T2sIINAy5PEqqTo4f
 BeRnSFXXAzRrOumuB9X9njZflN5gcPp63pkaIwiJd6WBXKflP2klnkwh4nSxSjunaabU3mXNjrH
 yZhLabu+KnkpHnZ594s+iB/i5p6APY5vnJhkqbYz/6ygR7vmQHIXRlH4ywTmOs0grtCQ8RUYhBQ
 UyRihsApHdAiuEvmqhm+WOptUqUWUHX6hZD++76PS8ObeFtArHj5bWM7TdwwW01v0RS8bBAh5wE
 eahKU9MsSGyzrr34yzr55AYwxkrdW6vdsUdBWUiHoPZDTNLpyL9Rrevn9+5JVCUceUqiwFnMFvx
 TEgzLE//s=
X-Google-Smtp-Source: AGHT+IFAp+leh+xUu+VPGxOcyugwdkp6l1Nr4jErPzJQvNmiWrlHU+UC6K+QFiCET656s7UZEdjFIw==
X-Received: by 2002:a17:907:2d06:b0:afe:b781:e89f with SMTP id
 a640c23a62f3a-b01d8a70a40mr692042166b.17.1756709718059; 
 Sun, 31 Aug 2025 23:55:18 -0700 (PDT)
Received: from meli-email.org (athedsl-4441256.home.otenet.gr.
 [79.129.180.152]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0410138d0asm392137366b.53.2025.08.31.23.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Aug 2025 23:55:17 -0700 (PDT)
Date: Mon, 01 Sep 2025 09:55:02 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org
Subject: Re: [PATCH 37/61] target/arm: Implement isar tests for FEAT_SYSREG128,
 FEAT_SYSINSTR128
User-Agent: meli/0.8.12
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
 <20250827010453.4059782-42-richard.henderson@linaro.org>
In-Reply-To: <20250827010453.4059782-42-richard.henderson@linaro.org>
Message-ID: <t1wdw4.2uz7xzahoegpk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62d.google.com
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

On Wed, 27 Aug 2025 04:04, Richard Henderson <richard.henderson@linaro.org> wrote:
>Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

> target/arm/cpu-features.h | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>
>diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
>index 5876162428..7a0e515aeb 100644
>--- a/target/arm/cpu-features.h
>+++ b/target/arm/cpu-features.h
>@@ -599,6 +599,16 @@ static inline bool isar_feature_aa64_mops(const ARMISARegisters *id)
>     return FIELD_EX64_IDREG(id, ID_AA64ISAR2, MOPS);
> }
> 
>+static inline bool isar_feature_aa64_sysreg128(const ARMISARegisters *id)
>+{
>+    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, SYSREG_128) != 0;
>+}
>+
>+static inline bool isar_feature_aa64_sysinstr128(const ARMISARegisters *id)
>+{
>+    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, SYSINSTR_128) != 0;
>+}
>+
> static inline bool isar_feature_aa64_rpres(const ARMISARegisters *id)
> {
>     return FIELD_EX64_IDREG(id, ID_AA64ISAR2, RPRES);
>-- 
>2.43.0
>
>

