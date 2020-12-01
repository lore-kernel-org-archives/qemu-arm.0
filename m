Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp189756lfb;
        Tue, 1 Dec 2020 06:10:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxF795jEuDTMt4iQERuI2gnIr9pMipqHjZ//4sgXze5vn35MO1EuE7g/JQVeS0NMWuv6M/q
X-Received: by 2002:a25:ce8e:: with SMTP id x136mr4624728ybe.488.1606831821708;
        Tue, 01 Dec 2020 06:10:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606831821; cv=none;
        d=google.com; s=arc-20160816;
        b=BSBSvB8V5EWc8TET/T6l4Ozmc87iyebXHO7Yh8XeLiAsvdow3q6SIUkS3fTymNjBmp
         V22ZebFCZBOysJd6UZaGJYHAuFTK2irTIUyYEUdylcSwboRRBRxcp+GOyIaG9Mk1rS5Y
         JuUHzUZlgpZesTNGrTFScnUsVmxOBkCGexOWrrvClnfu5DO6JnWntSH5I90HahqTeU4o
         bNeRKRiVkVP1Vlwj5SRvT2t0r9ys6eCBRKbfseS317h0hS/Zg7XRnS/stwmn4tqWgCVJ
         7hfL8N59qE4sKexLvqb5GKhJQSgxMcOGC4ycnn0wHiu+PSCSv79p0sGdd12Wv8M1S+yh
         cpJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2hDTG7eH2YALna29gS24auN6LcZA51ioUvnvzX8r81Q=;
        b=QfsjFsAs4LAmy5f9k94A+Ds/OHHC0m6TwlwZQGD5+vtmjczve5tGa8rVlXolpwDtW/
         +gQ2d1DPhY6y9XQjCErFzP+uFB0A3AoKobMsTXVLUY3maiouNGgTx7zLufp2SHfaW74K
         f47crX2hHGXGe9m9/9tQs8CsgD7K+YMJfkRQL+GCx6veQwdUt74Qr/sT51UGVXE3KFee
         cJ1Y7GAIbSBlTaDHyluoEzIdQF4mhlhz1iN4fNeSgDFqp+PAsTSFMxeVKVEhyRoXavkr
         iJz9lNkidTohnnJ6wsl6OrqN8itj66D/Xi1ye0lupRTGCgRSbqQfVGtr9UIHPU9PB9Jt
         zlLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=glIa8q0L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 83si1742468ybn.263.2020.12.01.06.10.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 06:10:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=glIa8q0L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk6MH-00036K-3C
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 09:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk6M8-00035u-QR
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 09:10:12 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:38387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk6M6-00049l-0m
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 09:10:12 -0500
Received: by mail-ej1-x643.google.com with SMTP id a16so4374052ejj.5
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 06:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2hDTG7eH2YALna29gS24auN6LcZA51ioUvnvzX8r81Q=;
 b=glIa8q0LaM7pBZJesYfNjhj5rcRfSnokhgBJB9Od9ZNuN1ZIn/PURuvC1sVcvSJ6Js
 2OMHWGiUOwHrfWm1hZ+mFTdJxGBs5rCFt517htU3nvjVnuVlMnFpLJ9io+JEfWUsHYRZ
 MjFKmmIXRfBV2CGxUV07M8AKdFSInBSsb2WxGzvT7qSrVPvAyG1sDgrdV0UhfUiB6wq/
 +c5nahN4xSH8XrM7AHi18mKpCRbUtS3ro2S8AlXsjRJea1jXFwUcEfaWoknicGLVnzFE
 q5VK4pQ6pbKV95MlN8hMe4zsJZolcO+9RX5OTii/9P1ROmh/JkYpWaYYo4k3/ai+5v2K
 Lwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2hDTG7eH2YALna29gS24auN6LcZA51ioUvnvzX8r81Q=;
 b=fm4nWx4zvAorX5gvUNxsRXDBNw70wXPiV6Ho+83Hml+C6Y1wb8FebHXL5YAByYDtHW
 6llYtquvL01/P1yjjjqOJrNVGH65xD1mriD+r7FbJYTi4wfWOu422ahYKDz7k8cLbFwK
 ovXvjj66zSEMJwosSfE7cT7Oq66Q2BJLB8c2cdzIRbNmnyNdiMdqRDuxF8oeBvy6h4AA
 4OyBR4lAWstERamGSXkPQBjz5B0l9KHMu4Sl8lcpGO3+OHolS2cM1+n1Ly6GJJjEtXYd
 oyZcLpxuLYYc2J1IujJORHa0T3BHpm8SlKZYMivoTrQ/HNIyr2KaSQhlipMgXaAjpzxk
 psmw==
X-Gm-Message-State: AOAM532/N7dpy4FYrEUN18czq5t/YHe7TWYbJyoFF3VBoD9FZialJdeC
 o4B0V+NpYyZC9BCyoKNyqQOKfOxR4r2vVRyGhLZ7bA==
X-Received: by 2002:a17:906:4bc6:: with SMTP id x6mr3294956ejv.4.1606831808587; 
 Tue, 01 Dec 2020 06:10:08 -0800 (PST)
MIME-Version: 1.0
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <20201125040642.2339476-11-richard.henderson@linaro.org>
In-Reply-To: <20201125040642.2339476-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 14:09:57 +0000
Message-ID: <CAFEAcA9mC3XmOgNyxQuJh_LbK94wbvWYNUz9NkBDk0EjXKgTOA@mail.gmail.com>
Subject: Re: [PATCH 10/11] target/arm: Fix decode of align in VLDST_single
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 71M45zN8x31+

On Wed, 25 Nov 2020 at 04:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The encoding of size = 2 and size = 3 had the incorrect decode
> for align, overlapping the stride field.  This error was hidden
> by what should have been unnecessary masking in translate.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/neon-ls.decode       | 4 ++--
>  target/arm/translate-neon.c.inc | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
