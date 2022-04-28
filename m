Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1626154lfu;
        Thu, 28 Apr 2022 03:36:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQmjrdm0jfHZ11BdheW6JRAHcbvQcYR5GDY7RtLKICWzsiq4HFzRYlM/jNqX43794Jt8dj
X-Received: by 2002:a37:ba85:0:b0:69b:d96a:a785 with SMTP id k127-20020a37ba85000000b0069bd96aa785mr18921245qkf.185.1651142165376;
        Thu, 28 Apr 2022 03:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651142165; cv=none;
        d=google.com; s=arc-20160816;
        b=Mp4xj30St7l26EEj9fuzRqnRNz/K8bCN5Tm2Z2OIwoH6jW0DTcRsdTFJZ2+utCsdhS
         KP8RNSLZKUQ6pdBhhLhs6EQ702Uk914GPEVaYNNPfD3S9ubQVQZVUxFZ6J1FfJlfzpTp
         dmiLRvQd70uaJ7FGR8L/Up5G1r0CcJYQbVcAiCNnZj3I2c2FDF7EJaRUFdNpG6UivXNx
         /k96rrTocHTtTmzEWks7f++NHYId0Vt9o1fSqxXXnzxbScdrMNOsuq7k6i+CN15ZwriT
         6xuheXNQQQTFJuEb0Ed/AkRrw2y9GDDSvLl7bmQZNG7YzuH7APdumnDPzxEtlFaVmQ9Z
         Ziyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1uK7AEl99ZZZ/FE7WFi6tVOeLAhwQv8XyZXlxRlpj34=;
        b=cG8XZwmsuHErgdVDBO4fFS2yRzOqwlcGtJzIij2MsfFq6rJ227SEQB3DSnxw8rzk2b
         OLDueB+bTn2UhFlDBKuAReJKtJHUHRquriAoxyicU1Ubg2svkgSsXLYn8sKHBEg2nf3Z
         soXEwRt579Aobfa2J38mgDgztShqQkeJq8JQFpOxwqBpwgfrYPF+0ccP/vvrF38BKRZM
         lXgnGTFTXMHXm0gLYp1pei4NLFR28YY4MQM6ksyz64XHdYwVjARKCgEg1DGCTyPSK4lf
         TjdnhVK8zJlu3p2RFTGVPafIuE/7G6m4kUiNiE60GPEbw2qwKGMKYuj6uD6wpb5sAn7C
         UOHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h8g8VuZu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020a05622a05c900b002f368b35c57si1514226qtb.519.2022.04.28.03.36.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 03:36:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h8g8VuZu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk1V5-0005Xt-3x
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 06:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0wH-0001ju-LG
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:59:57 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:34397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0wG-0001km-69
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:59:57 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2f7c424c66cso47110617b3.1
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1uK7AEl99ZZZ/FE7WFi6tVOeLAhwQv8XyZXlxRlpj34=;
 b=h8g8VuZuXq/Jx3mY80Noofwi7l2z1BZF6+N3DzEl0zSH5bjcTh6i2nUpRFjepf3aVM
 yP6JCCWR/N0fEflY1Y28N1gOEKz5/Q9SmZyACw9wLgb8PnMLlvb9bOzNsq7WcbwRJfMm
 oRhVeSpGoqzFu2hQ2i6/S30Zuv66Ir6C2ynIAhE7nkG2MREkp9HQ40/ZNxEZzYfAAGkq
 v/UCeVO7V9NuIIdDSuJHprONqVZIbBojIsO/fRnCyEo/bsEBXHv+CN/nNj5QhtQtyHi/
 F4SdMZnElaaweuCxwQXDDO5pxSTw7LEmoZNyyVksjyDnsUgnfDZv6frbU3nbA/0PTE9F
 t1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1uK7AEl99ZZZ/FE7WFi6tVOeLAhwQv8XyZXlxRlpj34=;
 b=zbCiB6xSv4mVdGV8bdDP5lIaF5SGx28QB06fdi26HYv9S2d0e2gZA4S11T0LxYlc51
 Fzb8F8miWNh9bjF0Wqc892pyGsrDMLWsYXSO9hLL5cbMRj+d30cLMGdT2/lT2uAyCcOF
 wdWqHFwhJ4sJbQXtK7dhF9MeqPngS8BE+sZ+750WY7SfwkagNKHngUKu7qlw5/XmWDZq
 pk6oC+yegd5tc2p7K0TiflZm1LQ6zwSeONWgxWvdsxpMURaVif8LfJ5XB+Kzmc9KZdCy
 +IudHPl4dRu7PYMl253aIEAelWSM4HvOQ8YBc/epweVOVWi43OtElHKjHw3UQQQ1YTaC
 QmtQ==
X-Gm-Message-State: AOAM532DJuseJOn3TlNK4a6sieytnenEVNFRxWKkvqs+pQ42xgHuHDpi
 BDl9j17o3eOLxqQuD+HTo+P7E/5CdCn+mZL4NiGBc1SsHv0=
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr22968679ywb.469.1651139995266; Thu, 28
 Apr 2022 02:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-14-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:59:44 +0100
Message-ID: <CAFEAcA9XRVBeSogF2mC+S9zH35a8sQUeOtArfn1m1Z7E25R0GA@mail.gmail.com>
Subject: Re: [PATCH 13/47] target/arm: Use tcg_constant in shift_reg_imm
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
X-TUID: bwBr2o8BoTfB

On Tue, 26 Apr 2022 at 17:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
