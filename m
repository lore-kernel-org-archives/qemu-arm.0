Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509FCCCD193
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 14:53:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vArG1-0001y0-L3; Mon, 20 Oct 2025 10:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vArFy-0001rJ-Bp
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:53:07 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vArFv-0004eh-IF
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:53:06 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-78356c816fdso47158167b3.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 07:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760971980; x=1761576780; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XUGiSMlcmt18CxYz+vf/EOQCgZHjh36uo0NuPzN1UXU=;
 b=Y+WQPmNGnAcIA5iUJ1E71bXu3nmm1811cG220MbuoJ0TFGfsn+SJRxBw7GXeWKI7Cn
 1F1XRUhgdZE6coA5ec/Z6YkWDHimU5Gkp+U0Bf/0WVKfoRj312POih5y3LT6vbNAH4yr
 ig2aFnvf9f+ZGono2l4hrcSKhGiodbkgunazPCezcHGA1H92xEbpRl0ugdbjbnCFH8Pu
 dRpHMJfXTNLxG5DYycBajAaE0datEszfEun3ivXVS3RWQraj+c9nUv6kn4H4RiWtbKCD
 WOhWY+nWV8y3yKxuwFHLgwkl4sfU31Ge8AaBavNhdPSv3PaL58vXVsHkL4mRhqxy8NhL
 1knQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760971980; x=1761576780;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XUGiSMlcmt18CxYz+vf/EOQCgZHjh36uo0NuPzN1UXU=;
 b=VGgHFIKxdA/NWgoJlLa6A20Tut8swErDNX80e8WrtiNDmggyA15/j99oyK1nHXybTD
 kLGn0ARh9DZ12OshiQpH1NiYCRkluS2+k5qO+4mDkjiy99LFHYnF7qnu/pgjahQKWVsr
 uLeYtQs8nqub5S5HYIGKoKk4iYj7wj9kgk6Nhv0Crsh6+/B4XiF7vl82JG0b4o6MUamO
 8F2BywsBllmPAUNJKUkYgqa1D6nNw7ccOHx02G8nhzZ6zEYUZGIr4QIRDs7fMu3iUOVP
 qSArFW2UdKHsGAvZ8S3ouawc8cPiLM9LgnxVgnzatLDAJM7BKnLGGlINhCJ98hjW8cL6
 M9vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyFE4iv4T4UaKkXdr3SGYAO+096NdGbpAWlJyfoZ9+uaU3l5oikVcfDlEiL/kT6SSXK88JaGm2Kw==@nongnu.org
X-Gm-Message-State: AOJu0YwdApLOFlscGolnj5QH783RBQtRFvKvdL9fqZ1Tp+zGm7m0VyhR
 PPwurwcxb6yjizhFFabdlcUxNqHqms+JN+ViNOLM/8M7p7U5Gt5FZdQFTTYEdK29d+uExuVAbQS
 Z4qINULwu56c6gkTYcIuHJ9ByypTTLDa6vXv8ku1/HNCnrcquaaFb
X-Gm-Gg: ASbGncudT+11FrwFCiVbrfWNGM6GtoaHhAhEM/J56/zXQDv8ZCrnY1p1KOKHX8mvye0
 O9X/eY5CMnhzpLqMdgBmnJnaZ7PYcoMgUT1jOUapqoY+EAMhY1CKPR1IzGNMiYZdeS8zzQ5t2Nn
 kcDPZLpNa/187RbNunMQ/UG+9eOBvAAUcKP2OA50H2aSDz7/eoHC7NaYpKz6jtcMEAONV+sdJal
 Ml1ozkN8W138sOoLgQkZeYcnlC97yHWYOrEVugYRlOPQfyFtfn/Ily4oXsJtw==
X-Google-Smtp-Source: AGHT+IEwPC50t121rmzGAexjxCqsCiT1Fu+VdcKI+IeNz2I819nIpuelI8Bswa4C+909fW/rEFXSpnokGh7ZBnARpTo=
X-Received: by 2002:a05:690e:1407:b0:63e:2b26:a8ad with SMTP id
 956f58d0204a3-63e2b26c295mr6425272d50.38.1760971979709; Mon, 20 Oct 2025
 07:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-35-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Oct 2025 15:52:47 +0100
X-Gm-Features: AS18NWA4z-Jp0HeDgmRoUHcS9CtavLW06qaJuueFDSD6C3gzisoH0k_brfm9x98
Message-ID: <CAFEAcA8dW08ZUJ1MnBvQfeimpxszphkNZAv4cLw6EgshZtSLvA@mail.gmail.com>
Subject: Re: [PATCH v2 34/37] target/arm: Implement TLBIP VAE3, VALE3
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Tue, 14 Oct 2025 at 21:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/tlb-insns.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

