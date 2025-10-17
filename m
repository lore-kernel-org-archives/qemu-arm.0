Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0905BCCD195
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 12:57:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9k0m-0006rg-Pf; Fri, 17 Oct 2025 08:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9k0l-0006rI-C2
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 08:56:47 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9k0d-0002Ii-Rv
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 08:56:46 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-63e19642764so848579d50.1
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 05:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760705791; x=1761310591; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QLuuFgUrjqZj2YufUaU5wjLVsYpYDQu0Ovw21kGZ/gA=;
 b=RT28SeWT95TaaSeTMsZgCN62L7++TcCWuu4u1ejeuMJBbMF60tkRon/Yk09Ts3FFjT
 QG72QvI2SV3dBsan98udIZ4Fm7CUJu/e47O2ET1VMWshTU4Y+56elQLJQGS5Zs8ALDjT
 GJdQSursYxgF3LztcF19vP/M8JULe6I1cxEeOr5jmigi7DoOuNielagtUz1WDmFCAx7s
 pHUc16SaGIwnOfT8Hb/QU4eSAw8UYWHhhRzONzznQPDXgz0viWYJnUOOvVl2iNXJnrea
 YuftIsjsGFt22K6GuIY8bxvQ5nOGPv9qS8ueDs0MYxWoktYZuaI/huHzm6WnwC/loSd1
 07Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760705791; x=1761310591;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QLuuFgUrjqZj2YufUaU5wjLVsYpYDQu0Ovw21kGZ/gA=;
 b=ih39ecV11MjpOQowpfqkUgsiPFiDoWRMKRf7e4ciTNaJnZG2RlXJ0DIjrqK5yC+jjQ
 IWSC00cJxgW8pCX72EySKAjkMGK/ism1xJSN+BA//Wy2FmjTa4PNup8VVR32VIPg+udu
 yxJA0gwJz160DOAGLvmKQckgLX8y/ttxVWPEv15ferYUWHiw7aCjfZPz5fSTE7/4j5B8
 vwCg7dCdNbBpW1arqHA5BKnaZFoQ6u7c3djdln1Tl4W97g4YuEjphyKGjlHdzCm0ffKx
 Th1KBUj04piSgR0mHO99lhx0wqOLw95ej5nosrg6MP7axzuH4sKg2sJ4xZCS9Unk6PZ0
 GVKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr+pyOiLKNkTadZepv90RngoogoxJkBN/Aez4IRo7vTCWozBh8NKD/akIYr+I335weJ5x/J7q/Vg==@nongnu.org
X-Gm-Message-State: AOJu0YzFyzkdGW+bAEk2jEgOsNVvDkv1hCtAOM12LST/I7Pscm5hej6M
 6guVT3b3Hbjf2zKd4I+sF1R7kLGNZSzCfXesJwmJE828DjsS6p4/cNDJtz0uxzO6Sb9vIRUggua
 BOLwkRz21TKzh5CIRzHgRhaOYzkn320rrlTO2auw1SA==
X-Gm-Gg: ASbGnctgbteXP+9bBYU7rjqZkjD3uwXw2CXxryoofOT/TRcmnLSZ3mwVhPoAWAylE4v
 0NRHtWlumOoKzyJ/nyIfvPCK7yNGmwK0VnOg0eNobCrRnu0JYL9MucRISdnJBUAKJTYTXiUJuhf
 zwJFp8o66KCnNMq9cbgP8Kx4C1+un57PGCAA3kov1+n1qnR23Ifo8P3h8TB2aE1WLRmPq2m+bMZ
 n7t9dV77/L7j2A/3Jp8k0InEYPRyhh/86ZwENkCDL3pA89X1Pmm8C+aFG7+/A==
X-Google-Smtp-Source: AGHT+IE9c/cZ04N3GOH5OQ0+lqzHP3g0cuARud+eax0q1YlenyDKeFkC/QyUDZTPYXqh1tKMfdXBjWYkyj2ro9s51Vk=
X-Received: by 2002:a05:690e:144e:b0:63e:1d91:f54d with SMTP id
 956f58d0204a3-63e1d91f657mr1109187d50.35.1760705791504; Fri, 17 Oct 2025
 05:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-4-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Oct 2025 13:56:19 +0100
X-Gm-Features: AS18NWC-BZ-1hewTA9aSgu9NLBslImHJPa-tueAwAWeAzEeKJu5nklPDyi_sUnQ
Message-ID: <CAFEAcA-a3ux0gfOvN9Rq3B-5w12TMeBO7rrvSwFb9pm-XHx3iA@mail.gmail.com>
Subject: Re: [PATCH v2 03/37] target/arm: Update ARMCPRegInfo for 128-bit
 sysregs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Tue, 14 Oct 2025 at 21:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add ARM_CP_128BIT for type and functions describing 128-bit access.
>
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

