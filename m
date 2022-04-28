Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1641743lfu;
        Thu, 28 Apr 2022 04:06:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9030OLuLtdik9QsjIpJF++LVsVmsPZ/GTUUNw418TEO3D4i+15i32HtRblV8G32SBy2SR
X-Received: by 2002:a0c:a68a:0:b0:443:d22b:cdff with SMTP id t10-20020a0ca68a000000b00443d22bcdffmr23443184qva.47.1651143959912;
        Thu, 28 Apr 2022 04:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651143959; cv=none;
        d=google.com; s=arc-20160816;
        b=VW4cBCqNV87vP99XH2M8k9Um8Tm8PWFXpp9TnDA9gELZxLnvjBcJFOf6bFjmovcLwu
         Bg2HDDio+kaoMGKMy5eJZHu9IUDNaNez5rcbMI+0SnqbEFGIi/R3uQ1wKYVnPN3S/Q6m
         DuS8vTmx5pkXtpu9r1USGG7j8rzQtsPiX8Xta//IqRNr7jUWTfH8uDw/nNjFmx7Ens1r
         qOk0HX61uLKRqDxMYf7FFCW1ffPbTiHPG82w96uGnzrTH7o1x6dUMXleCQv0AKXB6izs
         dtfYLwO9w64fk7SMhyJbGIz6C7ryGspfvZpw5FNRmMJ3qn7TNj2j+Z+BBR43KY6B4PAV
         CfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8NrKcsVwvSwyJQuWcXWiIrIqPMgFQ0K4+XyZgsG01Bo=;
        b=w62r9OdWgEeXNRv+7XHgaZ3bY2H/R0FomOA0lRflXSug66Yh3RfxXhSR51/io3X6TB
         C2tL4Llvr2eCvdGw4DwFjG5+ESbggLchT2zMlVKCuges1aQSGQankwqkvGyNgIxeG1mH
         6icDjF1JObODIOp7e3XJpTzrvnbK0qkBGX30jbYcRfM/l9tsZv7vV7BiAJRnFFStxYcu
         2Xa9icm6oLsr3HMqV27JMWxyaNHwzNWd5r44ThF5we6nix7WtHSinJ2Ir8vbS7yuvVJq
         2NHEoS/m25Opvw7pPS84JfQ8vUgDt9lYne4OiNp2c0LHmXsrvpRqRaw5GTa2tWjf0ehd
         jqzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BUhq8iNU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13-20020a05622a034d00b002f344779826si1516105qtw.550.2022.04.28.04.05.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 04:05:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BUhq8iNU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk1yB-0007g1-9e
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 07:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Og-0000ql-OB
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:29:26 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:40059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Of-0007Pw-BZ
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:29:18 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2f7ca2ce255so47536217b3.7
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8NrKcsVwvSwyJQuWcXWiIrIqPMgFQ0K4+XyZgsG01Bo=;
 b=BUhq8iNUM8knzuZMZLIh9X7AcEePMpp8dXs3yevMKcxBi47Jx5FNB71Pf4PRL/ye8o
 ogKr+uhAN933N+cI4UXHA+oDW5RhB2Qqe1jbM7yG8rWlycSy5uBtAa/WcJohDCoSRltl
 YM/Tmvg7KGYroDqkmnmoVrW7eOoUPwoxYZ09DGnWsbnejGIsiDuREtI51q2gU+RVdpuB
 tN6/ecZOpTNfvrJncYI06tuXHfQUg++/8MjWuvd+DflKWhZaOQvxDwJiQNcC8yU2lf0a
 mJbJdyrhDk6ebT+W4xDL1Ax3gj5ayejUVClvpoEUcc1WJ3mfapFAf7QvwnLILjyheT2G
 u71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8NrKcsVwvSwyJQuWcXWiIrIqPMgFQ0K4+XyZgsG01Bo=;
 b=5o9yduXjABcH9xSI8UHNJZoLyPDh4asR7q2QTiGOJU0HbbTsiLswoHRlOAXKTpmYAh
 mZyFXtLBrJqvPjQQ+ils1qCks5V7hNo873RoMgHzYzi4KeFMy0U3Q/YYZizLrWvVOI31
 Irad4N7yJ9xXnOcHQHkci0j/3W50+8Xd5SGxeVjqjkI5txKHszJ44PqJ5Kdmd0p+852Y
 zAECqtkesOuxsOuJD9Lmok+yWYFSq/MCG6AjZkKwfkixT46nw1vZCTLToAf4TOgB0ect
 lY1f7dWUEwlfQxZC6X01UMxmnuReO2c7gVLU8Uk9V+ej/h+wuCqAyAMVuchr3c2AmOm8
 UiOA==
X-Gm-Message-State: AOAM5320WUTYDjINVZRzNHhFmwWvKFBPAU/lB6Psw4G3tW4GQLdaf03c
 SkbWYwKgqWZSQzIIi1DADDwzdo21eqdI/Ngk7ld3i3WcVyM=
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr32056261ywt.10.1651141751455; Thu, 28
 Apr 2022 03:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-28-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:29:00 +0100
Message-ID: <CAFEAcA_teoV5C1CjHCtpw4DztfimXchkyGh60qE1xoAJYApZGg@mail.gmail.com>
Subject: Re: [PATCH 27/47] target/arm: Use tcg_constant for gen_srs
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
X-TUID: m2mxzONvJMxO

On Tue, 26 Apr 2022 at 17:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
