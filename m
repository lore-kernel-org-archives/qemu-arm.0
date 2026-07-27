Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22E9C53209
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 17:49:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woPRD-000426-Fw; Mon, 27 Jul 2026 13:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1woPQy-0003zG-HD
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 13:48:16 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1woPQw-0005KH-UG
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 13:48:12 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2caed617615so30941675ad.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 10:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785174488; x=1785779288; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=D6AaTX4Uqd9bA6yMQ+v73NbLFYn5C2iFqghzbvxGqqM=;
 b=u0wzke3R3xU4xohkh0mq8D/4qpjV/EYHiYLYsQ6IrD3ROBMP1RaxKMKYuaIbNMptC8
 8kmZqE/By6fuONNIw05yXXAlL2xnvXuMvBsL4GKgDPh32vM6Pl+BCDbjZA5PJClNXcy/
 u5fgRC5LU0BT0xNZ1+CjaNbIaXmkHLGMM1zGRleVFBmq6mjXTbiLZ0b6giK4oyO+mR4R
 lGiY/bmKTmhCm0c6+X7KzCjUC4d96xFQsIdHs8IZ9yJDyMgcXZbFtarCUknuQASHRbSQ
 RCHH3Lni7yP4uk+79B5mr71aPzPkPKuZIBjQe9GmIHwrohSo76uOOrZ2bsmOxoIJlAON
 Xs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785174488; x=1785779288;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=D6AaTX4Uqd9bA6yMQ+v73NbLFYn5C2iFqghzbvxGqqM=;
 b=L39MKUHiFvNSEMMYYhasGmnPyF1tpbt7L7jz5pYr2UQTqgM46/HRjZlgaGbZQL+3hl
 xKrUQqraBvf5k+9cvCcWDOTbUpBzGhriZmQ4LerecF7WEg9SLNHzZMM1OczqSMJqf1Nd
 HXOHstNZbzP30TamcxgW2s5c88ip/gsjFJFRU9O1wu2oVj2SyiBt+fyTdlmfcvEkNERs
 L/Ma3oq20uZ6s91U7oCGA7evjGSNCz+VmDi1KdqTeiAs0nty9xpWrMVMslMqRJn8/Gxs
 vvcf3ZBWkPK2CiwICBFbhBlU4BJCO04vioHe7b+BaemNSw1RxE/eIB0zbdnRj36w/dGY
 N70w==
X-Forwarded-Encrypted: i=1;
 AHgh+RoHmqNPvhEPXNDNgQEGrkp5f9RWK0fpKGybIGpQn9+7sRnYIuSHuc3nOJbUNP1bnzp58mHLhwCChQ==@nongnu.org
X-Gm-Message-State: AOJu0YzppPWreY1hZuwvTfSNBepyRVM8S+F15cVnriCNwcz0qwpOYnoQ
 93z1zv6DFHp+d8uc4nwtfFCgPlL79nNGtdb7+1A024BWjKkq8X4i/iyZXlV/26hblwc=
X-Gm-Gg: AR+sD13GZlUXrb5hjTDJw5H8YbjjZIQV2EVXGSrR9NAq9iIXzw7kNW2LhCmHHyUkFFL
 57avQQvlFzqBtrziAQPl3MT9zHIGWxnhsn3XuYayKHXNK7f28pL6vD6r/xOCNbjph8fTgXva/3b
 AuaUBqMPX2gq+D5ctAJtKbqTyGLRtbVce/xGVKzF+ba0zp9+cbQXKkLXMnSLO5vT437INf+gxjH
 CUDh0V85j0zwqOyNevhTn+Gl0E0WjXvnwQeLeCXe+ogCnfwnDgnttjNZCuMiW8eYEF7o03QCblC
 Kh/TGywdyhg6zb58v98JMcVVzWx2YMtRScGGyXWhsDhzS56L29UcRSYKgVijDjdxXA23yTYJZSs
 oWwIOnEJni8AqzicV5oiceyLMv7Ev1yUTZI7q/BKfzCsbcLkr12lV25VPAsgGIwoB72bw24Uh8g
 Nb8OIgk8P0GMumMb/iRcMnSEQgnQ98fGaEyb5SfklbOk59ncUhz8k/
X-Received: by 2002:a17:903:acb:b0:2ce:d34a:5959 with SMTP id
 d9443c01a7336-2d00f48d041mr2220245ad.44.1785174488306; 
 Mon, 27 Jul 2026 10:48:08 -0700 (PDT)
Received: from [192.168.0.4] (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cfde7d978esm38836485ad.59.2026.07.27.10.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 10:48:07 -0700 (PDT)
Message-ID: <ad7b0a31-5bca-420c-9c75-6e90a930d15c@linaro.org>
Date: Mon, 27 Jul 2026 10:48:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Don't NOP the SEV insn on v6K CPUs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20260727151325.1428686-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260727151325.1428686-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

On 7/27/26 08:13, Peter Maydell wrote:
> When we implememented SEV to do something on A-profile rather than
> being a nop, we got the condition slightly wrong, and made it only
> effective from v7.  In fact the instruction's Arm encoding has
> non-NOP behaviour from ARMv6K.
> 
> The effect is that a kernel boot may hang on a v6K CPU like the
> ARM11MPCore.
> 
> (This wouldn't have been so noticeable if we feature checked the WFE
> instruction, and had made the same mistake for the condition on both
> instructions.  But we never have done the feature checks that we
> ought on WFE, so the mistake on SEV meant that we showed the 11mpcore
> guest a WFE that did something and a SEV that was a NOP.)
> 
> The v7A Arm ARM is not entirely clear about whether v6K has the Thumb
> SEV encoding or not: it says "ARMv7 (executes as NOP in ARMv6T2)",
> leaving v6K not stated.  The 11MPCore TRM says it has at least WFI in
> both Arm and Thumb, and the v7A Arm ARM uses the same condition text
> for WFI, so I make the assumption that WFI, WFE, and SEV all get
> their functionality for both Thumb and Arm in v6K.  It's possible
> that this differed between v6K CPUs -- the 1176 TRM says it has the
> v6K STREXD/STREXH/STREXB etc, but the WFI is the old-style cp15 one.
> 
> Keeping the condition check the same for both Thumb and Arm encodings
> is the conservative choice: if guests try to execute the Thumb SEV
> insn it will be because they want SEV, not because they want a NOP.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/work_items/4044
> Fixes: 60e7ee5bb7cd ("target/arm: implements SEV/SEVL for all modes")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> Picking this one up because I think we should fix it for 11.1
> and Alex is on holiday. The "WFI and WFE should have a feature
> check" part we can leave for 11.2.

Really?  I'm tempted to call the mismatch between wait and signal to be the "real" bug.


r~

