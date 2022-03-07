Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1533935lfo;
        Mon, 7 Mar 2022 06:34:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJ//L4PzT/5qyuftMFwePhr6iCD0vwTBismdKuuNMH7AqW4LY2nzFFme3bPFNSHgDM0ZtV
X-Received: by 2002:a5b:145:0:b0:629:4ec6:bd74 with SMTP id c5-20020a5b0145000000b006294ec6bd74mr3300237ybp.572.1646663644152;
        Mon, 07 Mar 2022 06:34:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646663644; cv=none;
        d=google.com; s=arc-20160816;
        b=xlmX9EmImmLVP/n7nuP9A1p784sC7y4yvk3vhYukS3sdVnfHhXmZyt9Rho36lrBbEC
         1Qj326daQsdro79oLlzx0c3zRBQ3xFKy0RtmJfxRcnIpMcB1sDCH5uIWOaNgBJuZ8VKx
         iTL4yCQfGhFnuZmCVki5VgnZmDoeZCqHIXWVzhbYUPaul9DgliZY9vzCMyeb8UGsWTSt
         wakQdnla64/xKHPRc7FkxYvwnskZR11HpjjQnKZw0EVFmIc+k4tvBHKTKCfqpM8sHX/q
         UOr46UUgoL8Zf5/s2ZxM8ouODXcrMsjkHkRcgw4aA15fVUxEGjm9KEuXl9JtIfgQV407
         Tefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eHe7QKewDU6T8U9aLWBhB84yX46s5pDxzqTUOY8lSOM=;
        b=Do7mZLQInowJOXpHb5hE+IqrKrRlUohd56hqAeLKq5rAwtfdJS9H1eGQZyMZwsO0GN
         OGKZDt9bQXw9bp6FaioCwqf8rIwQuxqdkAgzgz+c1Snqfb2tOyGLgNG2+jBRloydProJ
         wJBJa+IReACz9C0/aDQqQ0haMtDj3TLb2yWDFoy82XQlzw90Za9JAkDVeyUYvYVvwLrZ
         LobplYEU/e3VSx7D3ZP5n99WRUYWplF4VbBZLa0arMtARxhOwRKy9IVLR5oMw8M4i8Ii
         2KB5o/W38YLQP3b3Eil12H87lZeeVsIrGMy7WcCCKPyhMEaCRtBwPzGTQJ9FPxpvtgOs
         uAiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=neEzHrR2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020a81db0b000000b002d035ccfa95si9166333ywm.313.2022.03.07.06.34.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 06:34:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=neEzHrR2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRER1-00077Z-Jq
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 09:34:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nREQu-00076E-Nw
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:33:56 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=43615
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nREQt-0000bx-3Z
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:33:56 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id g26so31283613ybj.10
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 06:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eHe7QKewDU6T8U9aLWBhB84yX46s5pDxzqTUOY8lSOM=;
 b=neEzHrR2X7II5wCRYoiu38cI3EnT96/N9VSVmWjtrUzVghJF+ujOT88N0ljl4eJmZc
 b//PlKLx6DoMkCOQnXxomjLgw9GLz3FBbjonitzjxIS/GEydc1jICArtfDysI2xJ628/
 YCteWlKaRspDXmXp4nHGMqzsg4HejAofvlhwvX5Q3k3B6eC3wayObxHhLW4CMi/0U24T
 xabIcKizdduxp0gkgM6/bdTFNI3f1127jFgsa3OqHHIELczToPVhhfX1nuFaicvTk9Wf
 ydZIjIYjdRftvIxXHDMFa/ymMODYXIvnoGaPJk50DUCjdIoEbW0YudnvyDPfRZNuduMb
 WOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eHe7QKewDU6T8U9aLWBhB84yX46s5pDxzqTUOY8lSOM=;
 b=VeroA/bcgltlJCGI/Q141yij+ftha4IugvNGGIQ8iQKlgIqplobUNLM8QyO5HLSxkO
 q/Z+yl5SESKxF0aCW5CAR7nr9tvY9cNuGUF30A+6eT9DXX4O6TrzRkl8NYMcNe0P6smU
 9FF6DfCMkzljs9G6uPSH8jY+KTGBUf6nYahtWc7oEbk6sP+PeJDUGrdahVu5hXtABQKh
 veARLASwGv1qwQKra8aYDy/dpL4Unb9ASeeRlj5R8yHmw3prqV4B6pqBFaDr8c0ixwyZ
 DvErTRgsGxnJmMcWmVNKOWYGTNa0r5Njm2H20/rvi1oS9swvyTgsKwKJ3z2ekF51rMng
 4HuA==
X-Gm-Message-State: AOAM532QLWX9Ni3a4WDO54xrV8KtxJNk8OpGvL+zMRi/4ZMry/E/a58a
 2Aia4v+b0JWMAHarL5Pkt4grvKezXb24LEZDJkCQaA==
X-Received: by 2002:a25:d181:0:b0:629:1919:d8e5 with SMTP id
 i123-20020a25d181000000b006291919d8e5mr6988643ybg.85.1646663633970; Mon, 07
 Mar 2022 06:33:53 -0800 (PST)
MIME-Version: 1.0
References: <20220306194003.13030-1-richard.henderson@linaro.org>
In-Reply-To: <20220306194003.13030-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2022 14:33:43 +0000
Message-ID: <CAFEAcA9dGr6=CC=LTRRzyzCOSDOyNdGaKGboR8BSidhp6c_i8A@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix sve2 ldnt1 and stnt1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k9OHp3pbYNqU

On Sun, 6 Mar 2022 at 19:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The order of arguments between ldnt1 and ld1 are swapped in the
> architecture, and similarly for stnt1 and st1.  Swap them in the
> decode so that we have "m" be the vector operand and "n" be the
> general operand.
>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/826
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Looking at this more closely, I don't think these two fixes
are sufficient. In particular, "the operand fields are swapped"
is not the only difference here. For LD1 the scalar register
can be SP, but for LDNT1 it can be XZR. Our trans_LDNT1_zprz
calls trans_LD1_zprz, so it gets this wrong.

I'm going to drop both patches for the moment.

thanks
-- PMM
