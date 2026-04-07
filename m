Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5B1FF5134
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 19:28:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wABs6-00065d-Bb; Tue, 07 Apr 2026 15:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wABrv-0005xj-P7
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:13:47 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wABru-00039O-73
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:13:47 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso32593815e9.2
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775589224; x=1776194024; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qYd9y7jsUtq/jXOrtKexQFCwV5hEMo9e0sWL6zQmD98=;
 b=eUUK2drQkYousa3OXv2byp3Z/R5iHpyuLmpYTRuGHizlHSW9b9bubWVOiHR0BC+F8Y
 9Hm/e8VrQATt4/p1L9kDlR1hMqAqw4O+uGmzYSxbEpcdE+f60x3MLhC9bz+WO5iZCiQ6
 WDAomcyfxVmAgO13onsdWgNfpBy4to04ZesOT5ws25cfiVDq5n/nAwSFp5mAEgHLc+To
 0YPScYdy/Xj5lrw6kw/7+e2OKmJp9zKJCxsRRWNn2Ew1LLGJwMuDsY3H1aagZYAtYALS
 kXaMeRoeSabrQaUtQRkaJkCttPyPO1j2TQx70MELWP5P8rpo+sml8nWBCS7QF1ywPHJZ
 EbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775589224; x=1776194024;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qYd9y7jsUtq/jXOrtKexQFCwV5hEMo9e0sWL6zQmD98=;
 b=C/uDm3EuV4ut5vGp2WLYZm4Y70Hxdav+xOhm5ATavoZ3SDeAegTLZ1M/Hb8PHj5Ctp
 frt0u3AgSXFjp3qU+5mRbjnVWwAa5mw2MOuyIDyo02RunbLW57agTGRb2+n3itC4SAd8
 UpJx/5fkZvNIFYOaYY+T3yyHW1TUwNjBVdJQq5/8psgBh6yGI15HTT224KkLRhtetieQ
 johyrr7/3ZUDiPnlJ+liLHU8TVVQMNv9cZ4dUsbFP1aWD8JIyP2UDgY4YRN4f9Ec430M
 Pu8wIpC5RGQ85zOua75K4MWAkyPPNdPwZmW5xoqY7m2/zawvVheRnIlF9AVFiFYpUGQF
 RoKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFUkBlfImWCIgH/PC2kRctd6KclWIgk01Sqw++pQYuDfmb+KU7pcMbOPjcJ7Wc92qKqNUQcJIR9A==@nongnu.org
X-Gm-Message-State: AOJu0YyWIHbZrcIHuld0zH4jyBybG4r2XQFUK/uPp+Hk508Tbn5cuWG7
 QVAPSLhQm0pNPGmDI+Adk/UT3LJjvNyHaikVbQLS4QjdxHdab8R7WPJ7CAy/DqSkgu+EPyPk6B0
 mSFWTudc=
X-Gm-Gg: AeBDievLOHMpFhenR6+IeqyTSqUqrZz0BV5sWJOhFVHl/AYszlqS9qjZec5uDOK4A5y
 ZglDk5yGy+f38nEx4+PPrhqbdFj1GgYTYnEc9IoIMjeUJl9Ut6ppJ1Lo37LKr+7FnXsoBUgs5eN
 rAKh5dlmyEl+A9o0f8a85IfiVRG8NluIxDnv7BUNuQ2nwcZ5Rrs7+xjjMdd3jqht9zgAurfP3SS
 KxISPhiV9t/wS7m+ZvizVI9cMVxuTyuLvOHJNN8deqkq8BvJNvj2cJuN3fsid3TdNPAk/0Jt3ww
 MTj696uZRFDXGtitrQA6tt1RGn0dBbDVChM4ndwX6MKJoSraAfRUDnQg4sRfWZvWlMdlruTXm73
 QZgOStruvKVrigjMdVHVG+mgVnULj+0S0kBnjVY+AXgu/SBF3qMDu2fEP2aOSJurZCGEJctzr7t
 U7NKA91cQjTcDlplvO4r8fxhLyRJLeTRexuwcMVAD7RPFYNnsBJTRePozn3l7mjHfOeA==
X-Received: by 2002:a05:600c:3546:b0:485:2f4a:6ae6 with SMTP id
 5b1f17b1804b1-488996da165mr259316815e9.6.1775589224181; 
 Tue, 07 Apr 2026 12:13:44 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d289asm51269290f8f.19.2026.04.07.12.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 12:13:43 -0700 (PDT)
Message-ID: <974cdf32-cd30-4267-b785-bad9abae088d@linaro.org>
Date: Tue, 7 Apr 2026 21:13:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/20] target/arm/tcg/translate-a64.c: use
 translator_ldl_end instead of arm_ldl_code
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
 <20260407022748.57629-17-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407022748.57629-17-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 7/4/26 04:27, Pierrick Bouvier wrote:
> Allows to reduce scope of target/arm/tcg/arm_ldst.h to aarch32 only.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)


> @@ -10812,7 +10811,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>       }
>   
>       s->pc_curr = pc;
> -    insn = arm_ldl_code(env, &s->base, pc, s->sctlr_b);
> +    insn = translator_ldl_end(env, &s->base, pc, MO_LE);

Maybe worth a comment /* Code is always little-endian on Aarch64 */?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>       s->insn = insn;
>       s->base.pc_next = pc + 4;
>   


