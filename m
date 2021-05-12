Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4797428lfg;
        Wed, 12 May 2021 02:01:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymbzNLrVHYO4dHoBgiTiyPeGcTbk9c1DIoAlV7OBr2rxtmzZBrD9GtSRo5OyqkRmMHD6eP
X-Received: by 2002:a1f:4c83:: with SMTP id z125mr24513585vka.11.1620810083662;
        Wed, 12 May 2021 02:01:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620810083; cv=none;
        d=google.com; s=arc-20160816;
        b=Cs4FA9rAHfCQR4XcxFvxjYZNwiZFtkKiTgxVCF2wJbVHVeMZ6UZIAzZfDqJtGvl6ou
         +ZWbAA3gnptM0FxkXYMMK2WgF2s8M+gKkBpkv+iaiNbyP32GHepAd02b/6zKr+tbCZt/
         XmCExgX1gtUY5Tkd4e4HeQ+pMC/JoE4h3qxG+tc57aMD1Xh/OSog6tkqAZUQBpDAEECF
         jrDuSEZ++aL6NSXYDzoeH5mJWVj2ykWyIGKA2BezVEPExDGL1wNn0zZo9iSGfkY/2uAS
         AhiUkdr1n/aSs3SNj/2ObNexvDKWd3C7lNFz5fgruXWHXLNHBG1Xg1PCGJ2mJ7fRvXOi
         0WbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SCeWcIdT0QPDMv2Vpp6YLFQgrh8sIwKUZV3woYqsN0Y=;
        b=xojySX+JkhFT8UKEq20592MuM1fPaEzj9oQPYk06Ld7x1uG3DVkxlmUnzD6RjoHo3/
         ZdWc7YP0pYLs9nPjAGXuel3vYMDrL1L+R4Zf8lDKp4mLFPsid0d6eWQi2chiVC5TGtdQ
         rcNuPLZ0V96CH9LueATBWR9yDDddPK5/YfozKTbITWi3hAm/dVup5QTdJEuzR2/JE/7q
         A1TPCkfSdAmvcC3ti9IbBdGWP8qbUTbbRGDoSyLPaZk1tb5Qfhhklsw2Y61pcE5RENad
         egfirk8hj8n3W+g5W9MCcSwSztpZR0rgp777drKVJQwN+S3W2EOJsaLjwZRYkvpLu64R
         ussw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cHbGCvl6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si10783269vsh.113.2021.05.12.02.01.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 02:01:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cHbGCvl6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgkk7-0001t4-0g
	for alex.bennee@linaro.org; Wed, 12 May 2021 05:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkji-0001qc-2G
 for qemu-arm@nongnu.org; Wed, 12 May 2021 05:00:58 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkje-000672-CA
 for qemu-arm@nongnu.org; Wed, 12 May 2021 05:00:57 -0400
Received: by mail-ej1-x632.google.com with SMTP id s20so28343065ejr.9
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 02:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SCeWcIdT0QPDMv2Vpp6YLFQgrh8sIwKUZV3woYqsN0Y=;
 b=cHbGCvl6341YKe5E2OhhRjJ85RIe0LAdSYO3PA3R0focIkX8v6TKF7/HcU/amc94j5
 ZUQUADmhN4AbGcbJ+oaagAxUlnW/Xf6UIRa+/R0/czgR1mwSpVmPvuR+tgLJmDDNfHpx
 Khf4J9w6Y1PS6VYphcubMyv9CC+pfX+K0fUbE8QC3+0WcGw3EV/bB26p7rPS8TVx8bFA
 Y2bjLJIJWZG+uF/HdIzwgPHcC4buMweTRUXBQZiRWU/xhFuXVnGieY2B0E1YclhfBf3G
 Kva43eskCI6/mG5AZeM2ILdM1ziOOODFnheUHeVLwWJcekLGnjt51AmTyBrgN56/cQiN
 CjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SCeWcIdT0QPDMv2Vpp6YLFQgrh8sIwKUZV3woYqsN0Y=;
 b=jvpGq/74/uRiw4i9Yx8LGS9YGctNP/2aOvnbsvIajU19xexP0ogznhXEjgXzxc+Pwk
 7WQBVFIHK57MKGU0MqwsD9iwUbm0u+YKyxw8Xod+zPaDeKsLuIyNn8wj1meTRMa5PsHM
 JB1Xo8Ck0ZKxUB7dpstC5OirbINsgmViQRLxlu4MXE9YVjhOGcAkD/ChEm+ip+yf8AKO
 QY6So4ktsqvZw8tCeR60jchVT8vd5ZrX6ZSla8IZpfOP6+JJEu6QVNGWBir7nUSCZSXG
 4Slf8uBATxn5A2OQBAHcpybydeAUmKIkjtN3+HVYkmdJrtIZIEgXecIQSDj27OFkcDIq
 /Z8g==
X-Gm-Message-State: AOAM533S1VPdYunUAWbB+CIM5UDt0x0gI1CCUHYpvBxuuFopXlgmKn0Q
 mO37Xgbv0fb9GF7pMFkjEEmx2Bw3FMLsTG8yxDBJqg==
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr36089903ejb.407.1620810050509; 
 Wed, 12 May 2021 02:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-30-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 09:59:37 +0100
Message-ID: <CAFEAcA_2rsJNFqyH=8_yWVtoRQ3iuKJ4X=THk-hnw+XdS4P6AA@mail.gmail.com>
Subject: Re: [PATCH v6 29/82] target/arm: Implement SVE2 SQSHRN, SQRSHRN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
X-TUID: j5obDwf5Ht+r

On Fri, 30 Apr 2021 at 21:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This completes the section "SVE2 bitwise shift right narrow".
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  16 ++++++
>  target/arm/sve.decode      |   4 ++
>  target/arm/sve_helper.c    |  24 +++++++++
>  target/arm/translate-sve.c | 105 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 149 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
