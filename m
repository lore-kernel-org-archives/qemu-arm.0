Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF34CD2F7C9
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Dec 2025 09:29:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRS7c-0001kr-Ag; Fri, 05 Dec 2025 04:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vRS7b-0001kL-Og
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 04:29:03 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vRS7Z-00030v-JG
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 04:29:03 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so15360565e9.0
 for <qemu-arm@nongnu.org>; Fri, 05 Dec 2025 01:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764926940; x=1765531740; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6hxszPxzWI6GhMQ2yDnvupq9aExmicIE3wvtwVlr4P0=;
 b=Ea7w3b8rczt8k92vO6KzirNHX2mv8w+Rensb7QK0aayqI3LpofEunJO8u8+qeM39nG
 k2YqMXMcDXmZhqPNNTgwHdy75hhRZSHYobhl0xeC7ilmwFqLpYgc1haeGml/voZ0gODY
 R7vaDzQJM4zWnMx1oN6BJmghcl/9sc+Fj9oMWu+Tnl7B19/PunorbCawW6h+g553WmVd
 677IvvQBUtg9dDwJlc1dKn/X2pp7TfgthAOn+pCdZbW2p7x6HfyUQqwTDHp2jo71zsis
 h8WOI+yfhmw1wj8bnVAH3M9RlbYzNyE/snHHM/eKiB6oiSj9lrMLZ66vEqCw1KTxPaTD
 8zCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764926940; x=1765531740;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6hxszPxzWI6GhMQ2yDnvupq9aExmicIE3wvtwVlr4P0=;
 b=aUdf00JbBjETjWAFNjjPkCZj5S0+Ee5vU26de1dab5emjbOgoNyucYavVLnjb8t3tJ
 Y0t+H4X9b3eVSHDYRuFtHrOnpMax2YQj7APUkzaQPAQzk6kHcOd2vKlLOHYFZBelrUYH
 7udPh43Qlgh1jHuvcOg0ERlRCUQZE9aI5nddF26/ga/Vugdg3Gd5kHKemFIlBFWQe5Pt
 jkyFfd+A+P/VzMGP/gX6ruUR7ZdccryAHgY3GSaJYXYrXXpMXH9KLIDNWU8wFHBtohCA
 Q1lkDspslVEoYrt4YxNvEf7LkMkGn25hMWur+XkdSvYHDQRVOEEaqw3Ku7rGbMFxhb4g
 LV2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7KhLOAvwN/+c7uMzBAAnjq5x03xvDlwxQDCW8f0l3A950lN6bPwEiPBY5M2p5FCLFn4qg4nJaCw==@nongnu.org
X-Gm-Message-State: AOJu0YyoNA9WtVZuHRGi2DOs2BVi8TMVMUFDNwwfK6rBKR6BvPftO3ie
 Gz2HvrCqT7uBI+/T0NRGHiTvnA/c1NhKc8995Rv8KNzOU24wieAkO23+dyMm41TPCjQ=
X-Gm-Gg: ASbGncsBspqJ2860+mDmKIO6yzgyYlkooEH7iw8nQS0apeBlAky3G9F5e/bwCY7qacN
 dqPjL9gRl6pcJW/VAfhahxNOov3xbKm6N624eeYUEYDfrtNfyL7+cBr4F4M0lRYKVzKzPR539nR
 7jTEP2XnpJtoYY6RmKb8TZbxGYojRVATRyV2q4kV/rkKQB57zdxRR8VB7TthOsIsXc/vQn1VkTJ
 CNLZ9bUv/uHJ99QpVBwWcVt5Y6YEIZfvY1lg4gG6PPpYozhyvQDjvUWY3BNPW6D0I/mk843/YAR
 SWmFt2ykWSUQ7yrScv/k+06EJy/s0d/vomrfJaWnQlPJhlCDrcCQzshUopsnLbenJzIqkoX2GIz
 ClNhmfq8USYyIb1+nOAA3K7Gu2S7v429IjQZ7uCn/v7PstfPS/9kQr/B1yYyUfStlDP1vY4m0YE
 0aM5DqsWLRGFQ=
X-Google-Smtp-Source: AGHT+IHb2nDaZpuuLDYCMB8OgQpIPOzH5qjYQF7e2GQA2BixkyYhPNPbNmnuv3AfMNLL8WRXKKlc6g==
X-Received: by 2002:a05:600c:1c9e:b0:477:9c73:2680 with SMTP id
 5b1f17b1804b1-4792af4047cmr95729225e9.23.1764926939817; 
 Fri, 05 Dec 2025 01:28:59 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe8fe8sm7670787f8f.2.2025.12.05.01.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 01:28:59 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4305F5F7F6;
 Fri, 05 Dec 2025 09:28:58 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,  "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v3] target/arm: handle unaligned PC during tlb probe
In-Reply-To: <aTI1VZHxicpycoLj@Jessicas-MacBook-Pro> (Jessica Clarke's message
 of "Fri, 5 Dec 2025 01:28:53 +0000")
References: <20251204203540.1381896-1-alex.bennee@linaro.org>
 <aTI1VZHxicpycoLj@Jessicas-MacBook-Pro>
User-Agent: mu4e 1.12.14-pre3; emacs 30.1
Date: Fri, 05 Dec 2025 09:28:58 +0000
Message-ID: <87fr9ps2ed.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

Jessica Clarke <jrtc27@jrtc27.com> writes:

> On Thu, Dec 04, 2025 at 08:35:40PM +0000, Alex Benn=C3=A9e wrote:
>> PC alignment faults have priority over instruction aborts and we have
>> code to deal with this in the translation front-ends. However during
>> tb_lookup we can see a potentially faulting probe which doesn't get a
>> MemOp set. If the page isn't available this results in
>> EC_INSNABORT (0x20) instead of EC_PCALIGNMENT (0x22).
>>=20
>> As there is no easy way to set the appropriate MemOp in the
>> instruction fetch probe path lets just detect it in
>> arm_cpu_tlb_fill_align() ahead of the main alignment check. We also
>> teach arm_deliver_fault to deliver the right syndrome for
>> MMU_INST_FETCH alignment issues.
>>=20
>> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/3233
>> Tested-by: Jessica Clarke <jrtc27@jrtc27.com>
>
> v3 is different enough from the tested RFC that maybe this shouldn't
> have been carried forwards, but I've now tested this v3 and it does
> indeed still fix the issue in my testing.

I did re-test myself and figured it was only adding to the robustness
but thanks for re-confirming its working for you.

>
> Thanks,
> Jessica

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

