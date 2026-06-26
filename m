Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FCCCDE012
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 10:08:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd3TN-0003Vp-2h; Fri, 26 Jun 2026 06:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wd3TL-0003VH-5S
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 06:07:43 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wd3TJ-0002lU-BN
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 06:07:42 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49222fb062bso8078985e9.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782468459; x=1783073259; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhmVoVsRENWb5+GuFKCUUtYHw1Ak22nPvmBwAoCV7ss=;
 b=cpVTl2mTV7R1Wmf45FdHkzLGpuKX11rNb16D21Dgtu8UGib4O4+slJx8ItgETqPeRj
 eG3coPBtxAauVNR7oQHLfOdccy+cVxDfv9UAiOWmX+9vyNt8fNV00PAsUMPYzMOgmZ8m
 3KgjIcGwbhZK5gyvpu6BVs/W51FXn1/4o22Adk9IrU9U7YB6/BjYy1Prnqu1pZy1kQet
 rY6LNIB1DgQF62swC57HNrDnVpfDZgztO2dsKmPU3Mb4K8HfXkqhsGUTPX7+t+kKNQ/e
 vXlTXkcTcVzWOgvAy66K/gNWaKBLpsnbMYkkuzQhgQvR3K7Bxur1XqPqFOT6b3Oe8PPN
 4nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782468459; x=1783073259;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HhmVoVsRENWb5+GuFKCUUtYHw1Ak22nPvmBwAoCV7ss=;
 b=AIGfJH4vIBQrwGVk9z76PeYvXTmu9jQ0ZOb9j7v7BLqzydh3nbZqugsA5Q9mOO00/9
 OrnyNC0BULa2OzI7nujLOTy7waMmVbtoeDZY8Jq6b6MQBzERYLmOYyOU7qAIwaTVr/Ub
 WMvADZcz+tc68ESmwH0YgQyv6CLRnmRe/O6DouAyINvgYdXXDXMV6xGbCzLZBDeas3PF
 OR7T43a2YKOOq5bOyZB0YfI8nkC6IWkBOWoZKkHtK3KmmCR9P4PI9By+x2BD9vqytp9C
 3Oj4SRlG74q2zJMn9/a8HnwsJ6GyRKFFCS8lunU59slqsAeJKpnOJ18g3Vo6wiopB6j7
 ZdGw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9smMZOwkM3wz/0LhaAEYNkCZ7fKOWD3DX04xdv/xtWYX4HAhIgaVzUrvSwRsTwaYLRpiKfvqihZg==@nongnu.org
X-Gm-Message-State: AOJu0Yx47GTGzt9MC4CEyDSfKadmEnh6UcMZ2na6un9YbTINErhp7HZC
 w+ila0lkW2HLxfW1F9Kf11oD1sgHFMGHa5QFVfuSX7ZJSca71PDPqIJTn2iCNowcQ6A=
X-Gm-Gg: AfdE7cnpKpZCLsazvjfc8cwp4Eb6MK9ZIG8zA3AewPNl2gczIG+hx7LoED3QgIHGrU2
 hG30oVWoUu96IGrQWMtg3qcX/HOgFKnGCA4ar3EoVV/uSPUkFNvFUQfJM+sA9IWeY/vEytOdq7Z
 O5YNw88dKULTm/rSpknBLW5M9pN1lz98eegyc/sYKfMg2VlZqzvkWx1VUXjmg8DBL4e5WYuiAJl
 em0tq1y6G8T120UX5iScAsO1jQa7n9ZjNBSahlW9VCWhma2y1HPw2fLnJnGtvOoPMm64wuKv1IO
 PIDwwmN8XWsq5JNiAVoacJkQ41LY5U7lpoTtmk/XYkL+7E0FlTiJ+6C+XMuHajDY/yQjFphQETi
 EkHXckfzDO5Ywf3CMX6qYJfkNb5XD1Ai08M2hBN4ahUHWXwAdZ8d2ZSCXTlg0CTlnchlcrj8aKt
 ChD9OFk/wl5Ume
X-Received: by 2002:a05:600c:6386:b0:490:ba61:7981 with SMTP id
 5b1f17b1804b1-49266885895mr85505615e9.23.1782468459386; 
 Fri, 26 Jun 2026 03:07:39 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268fe31b0sm73394545e9.4.2026.06.26.03.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 03:07:38 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C34135F867;
 Fri, 26 Jun 2026 11:07:37 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH 00/10] target/arm: Implement FEAT_SME_F8F16
In-Reply-To: <20260625015159.719300-1-richard.henderson@linaro.org> (Richard
 Henderson's message of "Wed, 24 Jun 2026 18:51:48 -0700")
References: <20260625015159.719300-1-richard.henderson@linaro.org>
User-Agent: mu4e 1.14.2; emacs 30.1
Date: Fri, 26 Jun 2026 11:07:37 +0100
Message-ID: <87se69haxi.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

Richard Henderson <richard.henderson@linaro.org> writes:

> Another minor feature working toward SME2.2.

This conflicts heavily with master - did a bunch of stuff get merged
that broke it?

>
> r~
>
> Richard Henderson (10):
>   target/arm: Enable FADD/FSUB (half-precision) with FEAT_SME_F8F16
>   target/arm: Rename SME FMLAL/FMLSL patterns
>   target/arm: Implement FMLAL (multiple, multiple and single, FP8 to
>     FP16)
>   target/arm: Implement FMLAL (multiple and indexed, FP8 to FP16)
>   target/arm: Implement FDOT (multiple, multiple and single, FP8 to
>     FP16)
>   target/arm: Implement DOT (multiple and indexed, FP8 to FP16)
>   target/arm: Implement FMOPA (widening, 2-way, FP8 to FP16)
>   target/arm: Rename FVDOT pattern
>   target/arm: Implement FVDOT (FP8 to FP16)
>   target/arm: Enable FEAT_SME_F8F16 for -cpu max
>
>  target/arm/cpu-features.h        | 11 +++++
>  target/arm/tcg/helper-fp8-defs.h |  2 +
>  linux-user/aarch64/elfload.c     |  1 +
>  target/arm/tcg/cpu64.c           |  1 +
>  target/arm/tcg/fp8_helper.c      | 58 +++++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c   | 72 +++++++++++++++++++++++---------
>  docs/system/arm/emulation.rst    |  1 +
>  target/arm/tcg/sme.decode        | 66 +++++++++++++++++++++--------
>  8 files changed, 176 insertions(+), 36 deletions(-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

