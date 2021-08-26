Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp623819lfb;
        Thu, 26 Aug 2021 06:41:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLjpu0hlMGvwI6vk1kJLxyaZFTpqlRuSaGpJL1PGrozzdSJKV8980xbg2Nn0GuTTuW7HIO
X-Received: by 2002:a17:906:9b53:: with SMTP id ep19mr4571867ejc.86.1629985290606;
        Thu, 26 Aug 2021 06:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629985290; cv=none;
        d=google.com; s=arc-20160816;
        b=CMc6wWq3lgIlLWNyI+jisHjm4BPkj3cTJtJU3VcHbLiCioqdRhRcjOeyOVL3lfjQHu
         WeiIbWrlJ8W3x2kz/fKwYVfPKxc5sOakgTIdo8oUPaSn6wY68iA5I8oeZIFYUWhAbsxJ
         rG/S2ubkMytsfcRqUoq3erA1RQQhi3obs8ksKzOw7gnnxyU7SMFVelhfg6om89/4Ydv7
         Sf2vC+lJg+4/y9TnyCnhy8bLO/E0UE3qwbIviTN58g+QVv/HXgNK0yvNz7HQm8nFPZZQ
         B3UvSbN5RPFsyfelLUt8/6MDgLsqftoHhjaOek0NxU2mycJVSZ6+ItZJmXpFo27JnkMR
         tjGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a6vXpH60FrqbEAmgek0+3fo9ZGa7cKL1PBz9TiK6Abg=;
        b=AoHt4YgHHkWaafdAyHRuVGbLCNz6ebrAsXpIzVr+Uc2/OnqFRqWvV/YSfLhEIAs7n+
         VXqFsqwXrbrusgM53mfAscyQXwegZ9L/6Uh4ULuLXnPrYWT58AxMeEgsJuVNXJH3krYA
         LUWNqn/BOXrhGBnKXAhR+o9ILx9AS6kEvvYxPSoKI5V+dPWR+UYNHsPNNXoGx2NTnJWS
         7svh9GaDjYfECN9Q+knDJG4vkPxF/BATs7aY7Jhv/jMZj+7KM71cafSwJX17kE6CnBPi
         lrIcVRvyDyTHXQP6Qhmovn51bI7JKG1X9ODtSZk2nUL21TVkQECgA8QyxVclu3fe5iiN
         9Ytg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g25gu8We;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5si2960391ejm.413.2021.08.26.06.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 06:41:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g25gu8We;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJFdJ-0000JQ-Nx
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 09:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFU4-0000kL-Ju
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:31:56 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFU2-0006IP-BA
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:31:56 -0400
Received: by mail-ed1-x52a.google.com with SMTP id z19so4671978edi.9
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 06:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a6vXpH60FrqbEAmgek0+3fo9ZGa7cKL1PBz9TiK6Abg=;
 b=g25gu8WeMgLFhZEMaxtQH7ZvHFyXbQsUX7+MrUA+uEeMXByF5HSOX9Rz8EOYzaZSYR
 BJhYug5XTvZ+S52KMMjsuUxYFpvtCkU938HrPEoCBC+GLMRAM1G4EuU/6B7A6XL27NPK
 R5tw5h+okNaV/BQkM2tqhiIb6rjZOqEfY7XpZ5F7qnhxWf/KbaBuoLrK+LemAyrCHkps
 s10nBUOED3RFQ+vaFNRHOMFS4Sjh/UfOfxOPaRS/kuXzL6fx46QgjnSFioc3WlgnjrVd
 UkKCLvMvlaGS1e0Evgwrq9NJv3b7OjRojE1s+ZUH6O+QLMc/R/pHIeo8Evv1yGjmDj/u
 2Dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a6vXpH60FrqbEAmgek0+3fo9ZGa7cKL1PBz9TiK6Abg=;
 b=FfD/2pfL8kbAVMvJ/aHbfvvjLcnVG0GpMtHskGyfda7I69PVFmrYQYLSq1EKomf0O8
 ig9z7tPCQ2fOEl726Z5VtS1l9YNYsZa/Itd6fKPyMg5jSV4YqjqHt+PQ7OcT8fGuoqgF
 P0XItPYzbEVh+3J+Rrwa5nNb+hueq3O5f6hg7JsE+zMOlO5inyDZ7JEgjoP7NllbBJR5
 lD/9HJW/4lwLvEiJxYB46FjC7DwKob7fYFLxyVRaM28pCwCdBX9i2o8yZ8SrqvBs58c/
 LkXxFyuLNTgmaUwhXNt15nNtYmCF/oWA1/O8iiZzFWxl8y+LVqtgYb9hzaVFwRC3PTbl
 70dA==
X-Gm-Message-State: AOAM532RbFcv8NQAPfErUimU5O37azaJgE2WoElj/OFIEp1TtU+X/YN+
 Fdm9P1Um4/HNuTFWhckh2sSrR2F4aGxmnhbwf0zGOQ==
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr4232988edw.44.1629984712863;
 Thu, 26 Aug 2021 06:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-5-richard.henderson@linaro.org>
In-Reply-To: <20210821195958.41312-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:31:05 +0100
Message-ID: <CAFEAcA82iZptWmCcgonZvLTU4g+5nnEEQDdtHD5y=X7m82N1Yg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] linux-user/arm: Report SIGBUS and SIGSEGV correctly
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: UuKOToP1PcYl

On Sat, 21 Aug 2021 at 21:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pull the fault information from where we placed it, in
> arm_cpu_tlb_fill and arm_cpu_do_unaligned_access.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Pulled out from the larger unaligned data patch set.
> For short-form FSC, pc misalignment is reported in the same way.
> ---
>  linux-user/arm/cpu_loop.c | 39 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c


> +            case 0x3: /* Access flag fault, level 1 */
> +            case 0x6: /* Access flag fault, level 2 */
> +            case 0x9: /* Domain fault, level 1 */
> +            case 0xb: /* Domain fault, level 2 */
> +            case 0xd: /* Permision fault, level 1 */
> +            case 0xf: /* Permision fault, level 2 */

"Permission"

> +                si_signo = TARGET_SIGSEGV;
> +                si_code = TARGET_SEGV_ACCERR;
> +                break;
> +            case 0x5: /* Translation fault, level 1 */
> +            case 0x7: /* Translation fault, level 2 */
> +                si_signo = TARGET_SIGSEGV;
> +                si_code = TARGET_SEGV_MAPERR;
> +                break;

Side note: for cases like this where we can tell MAPERR from
ACCERR based on info the exception handler passes to us, should
we prefer that or the "check the page flags" approach that
force_sigsegv_for_addr() takes ?  I feel like the former is
nicer, because in a multithreaded program some other thread
might have changed whether the page is mapped between our taking
the fault and getting here. But maybe that's always racy...

Anyway, other than the typo,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
