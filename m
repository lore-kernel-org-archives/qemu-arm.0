Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp420363lfq;
        Thu, 7 Jan 2021 08:14:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypKTIkVdGKmpfPEz6OVn8MVq2ZLzj4Eob8uG7gPD5Ce+0mLVF51Ddr9ypjUo6aTEk5lOMI
X-Received: by 2002:a25:5783:: with SMTP id l125mr13649065ybb.175.1610036067489;
        Thu, 07 Jan 2021 08:14:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610036067; cv=none;
        d=google.com; s=arc-20160816;
        b=S2mC/BaTBnA8AtFla+jDgSSej0ZhpVal5LZpGd0DW8BH/9ifKtDZT3hqFSCuliAUB9
         TuIn+MbK9f0dL71Lzd5KL2HQ1mHEtu0Inyo61CEZ8ez0/MO4k9CO3GabexQeCMmj7NRC
         yKbnydhzcW+5a3WGfJIEBqAZYJePA+a7l07g2MgjAzAXzU1o+xPIkncqh/QbKuVKcxV8
         scNP4Eb4odTjW6OeKhKqEMtacR630R3XP72fIjN86EwxL/YUoCYWYZti5Td/lo5ou3cg
         cZkE/Aa2+MtPGF53zO26x5het3EcPiphcav2L1UaU6OONtPOqnFMqZvP8FFlqo/T6eqp
         lnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3gyNTpmVb+gvZKLlJXsEf2FO0mbO3KnktSmyqB9OPRA=;
        b=sRiwsLW6kXjeWrm+YWFF3OdEhYbTbvqTczgjk+zJKICXYUpPaxz5dOgjih0ycDIIet
         dXLMTw9CY+T00tlv0cNyu5/n+DIopp/l4IKwCfEL/s0W52uCOj4kZ729FzYNKf/DUX7q
         TF4TQbuGQbc4GCF/iAnkIlkLSkc398F5jaFTCYsDBD3vaVQIILpFQarxaaZceI7FhJtL
         cz6vGw+ybmFC36wXci//R2z+a8YRzLbvAXP3YKKcA+n8a9tOAA/HB0EjxfM0JNnpvIkn
         kKBJbc/M3oG+7DlBPT2ZRwEuuUVFo8duus8JLIQLs27svv/uNpOm9BoLhEehL1N/LZPZ
         w9FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a3K7tRkT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q67si6505975ybc.70.2021.01.07.08.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 08:14:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a3K7tRkT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxXve-0003Qo-TG
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 11:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXvU-0003O8-PD
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 11:14:16 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXvT-0003WB-G9
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 11:14:16 -0500
Received: by mail-ed1-x531.google.com with SMTP id cw27so8282506edb.5
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 08:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3gyNTpmVb+gvZKLlJXsEf2FO0mbO3KnktSmyqB9OPRA=;
 b=a3K7tRkT5kJ57aYGXZZ9r7TYUz0X+CphM9gF9io/GtoxkgH6odSqCfD6dTER3Yy65M
 CufUrYD/71WbnTwjXA7LjV+qrFaNWNZMdKxbcbpxf8JZLqdO8wlVQ4h91GboH2UwF4km
 cg4vRLXR71Uk+r/vl7f2LCuA9eYEpdBDJNegneJUrE0RAQHjXSD73/3KXb/0AhT1jmPj
 kwRjMlafHdAkRvPXOgMWPzl2t9MS/grwbXLKWyHmUTGTlEaYeNtMUQYqqi8tXT7HUz04
 78InKTm4A0N91Riys3J1+xE8PpWXaTZlhMVFMm74RXGFM9urhcG6FwQ2UJOOitLLH665
 0nMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3gyNTpmVb+gvZKLlJXsEf2FO0mbO3KnktSmyqB9OPRA=;
 b=l5TrDbJ+qu2YH33Uzc0muaNRZTwSPOPYswI3gPzP3/Ea99t/JGuql6JRdP4piviRnQ
 YTA2c0FiFbxt5wdCet2HLsJZ9uEH/H9HkmYDBshY3jLX0+nNg9qCYeRB/Hq+lZR1vI0x
 ICWAewH2Zcq1J2i/NerFsGjUCajNnQ5ZQEk9vBh2ziX8RceqbQ5ENW9MTu8dpwH/zrvl
 cFavDAYWc8QYtHZfLoxgakoHI0gdHZPl8IxIja+A3WHpQx3Ed3ZS6h5jjomRbmANXKlp
 GrKtQI7adkUqlhP3xboaWndlZzeR2elM8rnvC8IfRwTjLAykwA8zUukH4Qtfyc6wpHWB
 3jIA==
X-Gm-Message-State: AOAM531s8wrx5t1AuhspIlSnQmasxnaudWWzMKfe6GEX6LiC7p0+wDVA
 TZ0/RzXN0uK8KRuoZIztIdXevs2s+8NoKRDkMhs9WA==
X-Received: by 2002:aa7:c353:: with SMTP id j19mr2207303edr.204.1610036053978; 
 Thu, 07 Jan 2021 08:14:13 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-14-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:14:02 +0000
Message-ID: <CAFEAcA9RyrqDuSyoL=G2xJyzvs=vy_2h7OGWzsW68Xan9B9v_Q@mail.gmail.com>
Subject: Re: [PATCH v2 13/24] target/arm: Enforce alignment for VLDR/VSTR
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Tcslcmwz/hGv

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-vfp.c.inc | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
