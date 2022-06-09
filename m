Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp609454lfb;
        Thu, 9 Jun 2022 11:05:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLI6hJtTyiHgzOdnHZU7h0MsP05VggF9v5CYMREzNqq+2JnfgBEBl/I7iWio52mu0fkAqA
X-Received: by 2002:a05:6214:c6c:b0:46b:a505:4937 with SMTP id t12-20020a0562140c6c00b0046ba5054937mr15667978qvj.83.1654797944024;
        Thu, 09 Jun 2022 11:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654797944; cv=none;
        d=google.com; s=arc-20160816;
        b=Q+W6/ktO8LXcQ093vp5OS0+7cyZLXeotJ7ZkhNjFNLbKp6ovTvZQ1GwXW3BvX06WJo
         X2HqkcswkOjPoE5myY5O/HjiUu2mixrn6oFzrdevwLt1bGTFQwifX0yR9U9QwsAHr1By
         YvYY76zXAuqTIgbQhYCCtDrDzZ2+CmVB1/0PKz0LAjH21VXPEJgqCbY5AbSxXXpyivd8
         H7FnRVMfTqk3x5vQqCndhnKAHg6ZJ+5HZbbQqyxJiYzlmFPskCC2HwpHZ47yGi4/iMLA
         6eyhkhSr1zGVtyOv4pkVF2vqx84iw4SYIOuABSJpT0CXH/KLnwrHlvfS63bpTNNeOj+u
         y2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=W1eZeSLTwKkrvIeTP0WqrQdKj7CWhHK0y0yXcwNChMI=;
        b=YX1RsV/1nkX9BwGCUFlkI6fQsP99hCBHbRdiDcp6lqUTCqt5uUTuRf4/ZKU8O17G7F
         m+CyfN1WRumdAuh53wAw1XRn3f2F+MD3Q32wu9hARvwUo7hGXNgDGCdN0E42Ds2ETCwB
         o4JY2cYMn1xmNfHeco6SVWaR/gTHt1c3UT+1eLJ911YnY3zPS0mLl6CQOwmgWm+ivy9R
         pKSN/tZXAK1lTx5rrzMKAK3J3twKRuET8b/3PR+xw3c/ouepG4BTIdUk5SoAPgBXyJzj
         j1leaxT16Y5ZbG59hSGYPYD9UKCDIlzaAS9XglV6UEhLg1HGH3b/l1qHE/UUX5O3YA6O
         5wiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="E/pzjpbd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19-20020a05620a295300b006a6c362b0c3si7141950qkp.2.2022.06.09.11.05.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 11:05:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="E/pzjpbd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzMXP-0002On-DW
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 14:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKfI-0005qa-1L
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:05:44 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:34918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKfF-0008Ez-0N
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:05:43 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31336535373so95212047b3.2
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 09:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W1eZeSLTwKkrvIeTP0WqrQdKj7CWhHK0y0yXcwNChMI=;
 b=E/pzjpbdnXVHXQwj8mmZuoI5UltV8CUUhEBjwTP58NrehUuAy3xyX0/H1avdICWqkY
 pEU3fQYJfKLlWCrmUm5uJADnkPBEnGCDHWe6XjKhzUo7x8OgOPgHnZA+ctEArW0fddbW
 X78qoDGvG0dZPxUUpOUpF31PH4MuoeFWxmPTkQH+tB4RwB1Qej84bmRkd4BXIisDp1KM
 +zNO9dFt1j0kuYuJRyJUNaKS256moCQGe6PMZYtY1qMmxEcM58+9kt1V943Vxyxqmovy
 /2UpM2L/WJPACUoRidbN0ized2ybjiy+FiOPgWnXy326yR5Ze0VEJqRA6VCZrdkYTe2Y
 6jCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W1eZeSLTwKkrvIeTP0WqrQdKj7CWhHK0y0yXcwNChMI=;
 b=Z1NQLfpYNJSKcGC+n9CqIFN5aM8hLfdWElHxSxrZ+/Vttbfjex/s3xEjnCeJcbQXJR
 sQyk0IkhoqZ+GpET2k8qZsXJpmLhkedIRbFFE2j68X8boULOHVmuo2syqgUhv7/H6FcV
 JwZX57p1fGmFP4YN8gMuYEEGvunrjT31kP+IIM/l3zEG0FdFPAgmN6cfch2LNmjZW7yY
 4BoHoTiLI3qpSMmu2VedVqVvuYfcb9kTc9zx/u0yJPBKm4zp5btFagU1VPaDLN+3NLBX
 V4JsR05EB3tfLE8iM3096T3Duh1oDSdV7gSf572VdAnweeYINv4W+kztB4rwWiAFKA3+
 8Ypg==
X-Gm-Message-State: AOAM531IjXaVJkAHAiX24/D2L6oyhKGtMvsNBVq+htB3fmW/p9LuSbA2
 Uu1A8HofSwLK4YH2Eewr4H4ExxVEHzx6JtrVG/WgDQ==
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr43259606ywb.10.1654790738926; Thu, 09
 Jun 2022 09:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-13-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:05:28 +0100
Message-ID: <CAFEAcA8QVv16QPjnDdBFhw--2fHHVV3U8v+jg2Zan=mT3hGmvg@mail.gmail.com>
Subject: Re: [PATCH v2 12/25] target/arm: Rename gen_exception_insn to
 gen_exception_insn_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XQum0ZfE4UGh

On Tue, 7 Jun 2022 at 03:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h        |  4 ++--
>  target/arm/translate-a64.c    | 30 +++++++++++++--------------
>  target/arm/translate-m-nocp.c | 16 +++++++-------
>  target/arm/translate-mve.c    |  4 ++--
>  target/arm/translate-vfp.c    |  4 ++--
>  target/arm/translate.c        | 39 ++++++++++++++++++-----------------
>  6 files changed, 49 insertions(+), 48 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
