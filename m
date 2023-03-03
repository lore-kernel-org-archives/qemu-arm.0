Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1388455ejc;
        Fri, 3 Mar 2023 10:27:19 -0800 (PST)
X-Google-Smtp-Source: AK7set8ejoGt5Iq1/0+lb5EgrZ7uWsWyJ7AO2BIK6JN77EnEjzY84DvxuufoNxqpwJeAvh6lNGSV
X-Received: by 2002:a05:6214:20a5:b0:569:1753:bb29 with SMTP id 5-20020a05621420a500b005691753bb29mr4817305qvd.42.1677868039019;
        Fri, 03 Mar 2023 10:27:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677868039; cv=none;
        d=google.com; s=arc-20160816;
        b=V6Sp/1e+Rg/KI6KKsXOQMz/vaRddKKeU8MVJ72sju48z6zzInZJzlUkSlsKtUGHKFV
         2VcKBEc+9h11XB8jX60M7HmeeMSbE9AQutZAEP5/LLlMmp6VpjZPQmHxZWhzz6w2+Jdw
         X5CYtnPPUshDxSpT1tt3+THLewQuafYrLGGUk+aDt1oLVVzRDIMC73Zi3ePlL9WNM9zG
         rnzpjtjFaR1X0N+uQmhl51mNI2mZY4nvYxRq1Gb4MXnHlFhsUb5ydT3FidRIO5SbOxj8
         c7rLixzzIKmGTARlFpL/PsON0r2OkbFc9d9mNLMtJUsC220mL03WDhYz4lfWLFdjMHER
         Un6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SzaEFIaH936rmwztYfs4EwnPvbhx0KiInX1KmJ6EAuo=;
        b=i8TLk+fqilOlEAbkSVZg9onvpLcc/gR3F2UA7VoCkj+fJrvDAnAuRaVWSAyntHt+wL
         j+7P/Q/jDe1YqVNOqXJhqwcsp8X586kmfdPsYEm0PIS5UWY7myi0UInn2U2AArWM6Alk
         DHqdq+DcsJfQjJmnHaU7sPyHXdgI8CD5QmCFqWpOgMFsR/C3R3umu3ejEvIW3GgLbQSN
         Ftu/xO7jmfPD3n9JlVNy5zHdPCUo/gyNYXyIWOIYzRFqIj7+JS37W/974ivUhIynfk6F
         WEUxfQJ3rqMuCbLBdP5uDoi59/Iy92W+VG/3Ud8R7JL08KPJjRRjp9n919qN8e/1+vNj
         +Tyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=alZ9+Z+Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8-20020a05620a024800b0071c19e6d114si2071859qkn.113.2023.03.03.10.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:27:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=alZ9+Z+Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYA7H-0007k7-Gc; Fri, 03 Mar 2023 13:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA7F-0007im-NF
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:26:49 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA7D-0002um-Hb
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:26:49 -0500
Received: by mail-pg1-x532.google.com with SMTP id h31so2024389pgl.6
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 10:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677868006;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SzaEFIaH936rmwztYfs4EwnPvbhx0KiInX1KmJ6EAuo=;
 b=alZ9+Z+YdFIi7E8Qrk0CbujKj5CTqe2L3q4e1V/5yjUKgLYEma9EaQxGqMiRDuZMhv
 YeNjO4pGRQ64up0Q/b2Zv8BlOda8M2nxiRSbTEfh7CH89a7S+7B+nQLhv/fPdiaHLCb1
 L5RXi8iy4OXAkQp/3lporiY1Tzl49jIXAFDxrqWmIwU20WyEGowe9jiv0uIyeyyCT+4w
 4apkCfX01GQdRyeFHdzx5JAjRl9li9pCjLgkoVE0vtQGBtixyqdGK7u3S5DnXqjFpWiY
 89xsdOiWYl6wrA3duL1Cn2ZKfp4g7A/egbfhtUVldRJ7hYZ7kddtrLsLNvClRFeUhi5F
 ROog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677868006;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SzaEFIaH936rmwztYfs4EwnPvbhx0KiInX1KmJ6EAuo=;
 b=RRTIUwmfFJwZa/2i0Bn47j7C1yidk561qHlFxt3XbVin60HHmERZsMyBnkcssH3F23
 8GJUNNGqy4laYcXCt3QiEWmffmGTlK/OuFcmJTH5oS6sL1bsVElhLrYYPAhsUYvYh2MM
 zp1qudvwx24sVMURHlwqqqr9JXi1zC3NkSfozoKay07WFAXaANN7c1Q7Ngd0GgQ7Ah9F
 dgGamF3OXgMBlM8+XFPL3D9QZzxuxniPrMup92aWMWwwvfSdTtvsDHbrsVivYDZ67Bhi
 duX0eb287PBoRTfR9oj7F1lAg+4gJO4laJ54LK1UNxUvfVkosWnr3k6KOlMIzCanl/Rg
 SNPQ==
X-Gm-Message-State: AO0yUKUyargS8CFeZSfh1AgZ42+30LT+eTNYloqzSaGEZ6eVNwqGI6Hr
 f10aV/8rutv6ATS9ljylrdnYt25PfDPwS4GBXAnNSA==
X-Received: by 2002:a63:8c17:0:b0:503:7be0:ea51 with SMTP id
 m23-20020a638c17000000b005037be0ea51mr826674pgd.9.1677868005877; Fri, 03 Mar
 2023 10:26:45 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-16-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:26:34 +0000
Message-ID: <CAFEAcA9EFEErB-C4_E30pedkQRFgT0z3A-zvPqMV5jZuSkAbvA@mail.gmail.com>
Subject: Re: [PATCH v2 15/76] target/arm: Drop tcg_temp_free from
 translator-sve.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /aG7NgZiu9f6

On Mon, 27 Feb 2023 at 05:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 186 +------------------------------------
>  1 file changed, 2 insertions(+), 184 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
