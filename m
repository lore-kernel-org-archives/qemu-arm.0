Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1649191lfu;
        Thu, 28 Apr 2022 04:18:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfvAlN6WMTmjA9prYji6PF3RiAnv5kWAqS6ElsXHog3rkkfmbn+26NXRWj5KQYK3tMl2BR
X-Received: by 2002:a05:620a:2912:b0:69f:529f:df13 with SMTP id m18-20020a05620a291200b0069f529fdf13mr12327675qkp.129.1651144710763;
        Thu, 28 Apr 2022 04:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651144710; cv=none;
        d=google.com; s=arc-20160816;
        b=QNdibS6FhvI+6JgJ+x10ZQhS06+n0ANSgaKc1eNdrU+Pc0Q/WpjrO9AVa/ZWPxr0B8
         dwwipAT/YN9TS2nNcMseLjIUevK/PUfpAYGu8DyD5ixAdqP2sMdCzV3wNEtRuj6u4aiF
         q5rG9TJqtYjZMjS2dC9lOPPfzf9RZzgfWwJy8P08t+vtEkwGcM+8rKyV7SyXUCGsMto1
         eAHGlAYLWsjiZXDjs/cHA1q9N9BgCcBdyE+/jm5K/7aZKvkTXCBJFYD5igavEt1K+6kY
         fJmFzTjyCvtxxbpAjpQ6W2F9Han1WCjM7l6PIqJzUWuoKpwd8eExfLCwXbFpnh3MxMQW
         FfbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SL7Dt+JgQexzoWT3uVwb7dTDk9XMW3uyZE3tXJdDdsc=;
        b=IJhFOMpKvuxpZd/LpNCDVbTnYGtuo4rcAyTk+XPCs9sOvh9TNeores3J3Lj5DaK2RC
         M4NLkBGn4pa7hC+Onp1V3zeu0R1e/s3TMLA8ABTggpaIybeUOr+phuRYaQYUURNcf9Sz
         6ZmGGbrSDtsXhkLamTIVXiJvf/YzodjttUWS6WcFu8lsTS54+yUsZhd5fQ1e+xxa/q6R
         B+JCnTGTGR1YCkVVSY1E6wKKbgTH8RelMC9vNiW7vwvnUEHiQrYZJqvPG40BadDQZDbR
         kqL+QYYPIcsaIjFfxXg2LBfnZ3BkyJaDk7X8u2X9bkjf+Duuut9bG24R6LQOuMCkD8gV
         bbVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OAJnEfoQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m63-20020a37bc42000000b0069c2a49989asi1501173qkf.480.2022.04.28.04.18.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 04:18:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OAJnEfoQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk2AI-0003IT-6Y
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 07:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Wh-0007Bh-OE
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:37:39 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:36352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Wf-0000K3-32
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:37:34 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2f7b815ac06so48081637b3.3
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SL7Dt+JgQexzoWT3uVwb7dTDk9XMW3uyZE3tXJdDdsc=;
 b=OAJnEfoQku5h+fZWEzu2bL+jd4PjVGmOyFxUAtLzykbOcBfXuu5hVMLt6UT6uxpF4t
 m4/36dFZPKLMvUXXvDg6y6ZH3Vino4CWcyiu7VQ1ju79yjedkTAls1geQUd4prfsSw9m
 QHny+4nJKaol/aByThM5NRluQki9VYbuxZGY43AHdUNSauxH414HFtvnVVUfx//JukY1
 hml69Fv264pL/aL28xaJ4j2+/vZi8Osgq0G9jbMO4N2m59dYReAE0/ahtPydy8N1Hkdd
 sbDnIAWUc+Ob5SO1WRfi/hS/kJGPAdaT8qDwTguTiBdyiKuyoryX50XvM+2mpWQScKzU
 IDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SL7Dt+JgQexzoWT3uVwb7dTDk9XMW3uyZE3tXJdDdsc=;
 b=gjLUzsSAB85tzrV9cn3JOZbD6LWV5lV8SdjLwpu4WtROe3Wnk2M3rlRKARWWx9J+6R
 FUJ/x3ICUl0QoWu+kygbONrQm1Nv12B/x1OJZIM6aVaAMCqshdr6ymMjs3rYWT0HCr1O
 9zcdhZ3Z6/iMv06m8c95zO/Eqo4Y2f+qCi2Sr9HtvujGIEUJimyBWcSB4oova45Jcc6G
 oThMxv3+gNkAGtOxViSgfx7u40eUHxK1eiYa+GLG6Ik+Ve8Xa3n8vpicqLX16GD6Fkgs
 7h9dGdOpLkpi9zni2N8PifFMzeeJR2nnTr9nPicldx/lh5tD2TURh05RT22FVOLGN7AP
 Qavw==
X-Gm-Message-State: AOAM531sB562Su2dcvrQYOqNkb8V751BrCbWsX4Rw+JtMQsGloIYacdA
 uGV8+XarDrRc3py12oKM+aF8wOpoCpquIte90bVm6A==
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr23128488ywb.469.1651142249434; Thu, 28
 Apr 2022 03:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-32-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:37:18 +0100
Message-ID: <CAFEAcA84pVaDJeOviBfE1QaNcPLtN1CbdLRCPribLenkWkqVrg@mail.gmail.com>
Subject: Re: [PATCH 31/47] target/arm: Use tcg_constant for TT, SAT, SMMLA
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QTZ8Ryeqkswk

On Tue, 26 Apr 2022 at 17:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
