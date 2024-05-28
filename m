Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp48906ejk;
        Tue, 28 May 2024 09:03:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU71WLe6/V5VsiPmNIw1k20a8dFiUWgvUKWgkTOZHL/jyhtIJsLF1VXOAS6FAubTLJTHWBK4k8/iKo7ec3IYf5Ikp3HbESl
X-Google-Smtp-Source: AGHT+IGR8i8g2CHL6Yq8+mLQ0g5pVcwuSjEbEoVFEEf9T+BOf6cy8ACBRVLTjwUn8H488bG0Hcog
X-Received: by 2002:a25:8185:0:b0:df7:9921:7056 with SMTP id 3f1490d57ef6-df799217a82mr7736024276.24.1716912197994;
        Tue, 28 May 2024 09:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716912197; cv=none;
        d=google.com; s=arc-20160816;
        b=Ae6lvILnMu12C9vj2zMtRjlZLQqRH04FppLEU9XmVzzRPOhjbzAv2I/K2TzAFbFxCi
         9p6Pfv/USWzkrSx3SKNFeUOmYNez3H7oyKtPb2KKkQj65z28UDKkD8NileevWs89zBaa
         xnY1CtnwjZJFrMu+Vfhm5W+NvIUpqAsETKi1rQDhbldMnvzhOkdkMNryJBes+JnOxbqp
         1QTHj1x6bXrMvAG8Hx3NHo0GNddCEQl2sIg7ppLtiNNpGEJgzOgRmb3h4HEg2ROmLfDj
         jphuEcEfbgeM4dblkxXqtViE1iR4l5np7TFKC0xosPmK+9sOwPnLYjSCbNPbfupE+Fnq
         u8jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ItU2xJw1LbyVLk1x+30RAb/uRezAxAqiS+M0e/yJEiA=;
        fh=+w+huDTJDGwJKnyVszQ7M/nlnsZT7DbgW2iZLJMD1QA=;
        b=Hg+4H4RJ/IuoF8QyH4MLOk0waQ0a6t+loU7XgQdL7KOlZ5LSHmh9kBt2XPqvVdQh4X
         tBPdwsNSEYX+GzpmtIxVWNtnPzHrYl0NUSoUbf5GIlnV3Bh5xk5Gt+FUUMXnph0s1bKl
         zKBiGA3ipOa/8NPl2IJe+36dr2X+1Jwhe4NONWe0KfTpJnww2/Ro4RQh486cxUhA1tvE
         lE+Ft+zdQKGnUt4FzDZalUGgqo6TpkAW7+6adgSszTcB+SpbnXhQFtl1RxAFvC07a1bV
         jcXEATsJTZ5Pco3z/XeGDd94B7g0dGaKKPGG3Y+MWQx3GomANny0DdPzvxJF7hyNuzRf
         zEyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z92C/aoF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3f1490d57ef6-df78bf38c39si3416451276.210.2024.05.28.09.03.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 09:03:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z92C/aoF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBzGS-0004hU-Iw; Tue, 28 May 2024 12:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzGQ-0004bd-K5
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:01:26 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzGK-0007gs-97
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:01:26 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5785161b98cso535333a12.1
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 09:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716912077; x=1717516877; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ItU2xJw1LbyVLk1x+30RAb/uRezAxAqiS+M0e/yJEiA=;
 b=Z92C/aoFarOxTLPpWyUAiMLcLSQvvuyH0dIRnRMBX0fvC7u1mqR1Ph0F/i7b1/xcDb
 4QqytWAN/BPLDHiRP0vIEFSRcVaAr0puBPDEiCq2qyREVRMPswoEBGjqBDi3q0ShEmR5
 sGOcFvqEYfu4tqCyDxRnedWThPy9x50xRtGWWJJ9mdrwXxXSfZ37CWG5a5c52ujSuGm7
 J4Jzc6D/KkHfIvJ9WVoWPfCZ7Q9QL59tKKCRlsJL3MeeFOTz6UJvq38ov3AxV2ZSdrjs
 EHljizmif3mPa90m0MBZQKK8CwmTQyRDq1ZW3e3cj2cp2aqh0oDkzdapzu3Vf/C4JSSK
 eJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716912077; x=1717516877;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ItU2xJw1LbyVLk1x+30RAb/uRezAxAqiS+M0e/yJEiA=;
 b=Ufm06VB2Jw054tnc/uLT3LYBU3ZZk05D+NFedZkvDq7WPFg0tpkrmcKCXuva4kkLUd
 e9/HaE6q+G3VJ8CrGvY+A7FS2bWAZga9CHIhbiNmX2fZNjD87oapSM3awGjzknORL09r
 LizTbMrZisHcphFDu9hEJlBABkSkanI3trZEr7XQvceUwKKPayAGdGfXstdz/qLjr52D
 PqWaZJdzW2U4aZgGgApshTl5wXTpvZZKGPqsWG3KjtepZDrk3lWTdSU6WjzIfxAVm3+S
 8w3MdVkCYF9NAdYr887zhaIfS9yMus0B2fngorQqWB/BG+LBi8F7QOEp7bNpaPrhN4M7
 Ewtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHz0M2DqOpbKX2PrwSVKkQifLtnoxSJ4kA7euj2mw788JbkdHCOrwr0r3LWDFe+Q6evw3c0oxBPpQqfE3jhjnhdVDq
X-Gm-Message-State: AOJu0YyY7x+JvV6L7qkZrs/1lYMi1LOw94RNvaDrlJ0ZRuDh0lagQEGu
 cXFmRjrEYkqvy3XAQ0F4WP/Mets2qq4I0Xfx4ERbrgVxmxJPmlG4tkDFFdbxunrdXftRkcawT/2
 rAoSfXPdrcGfix01AEbD5pLvc/aDNCsRw+qTCwQ==
X-Received: by 2002:a50:c907:0:b0:572:689f:6380 with SMTP id
 4fb4d7f45d1cf-578519144e9mr10481072a12.3.1716912077432; Tue, 28 May 2024
 09:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-55-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-55-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 17:01:06 +0100
Message-ID: <CAFEAcA9pm+-pfm3xp8boF++EncTGGGo7Ws-Od+HKsPKt-DaPGQ@mail.gmail.com>
Subject: Re: [PATCH v2 54/67] target/arm: Convert SHADD, UHADD to gvec
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: AzPzGo5AJlPi

On Sat, 25 May 2024 at 00:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h             |   6 --
>  target/arm/tcg/translate.h      |   5 ++
>  target/arm/tcg/gengvec.c        | 144 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/neon_helper.c    |  27 ------
>  target/arm/tcg/translate-a64.c  |  17 ++--
>  target/arm/tcg/translate-neon.c |   4 +-
>  6 files changed, 158 insertions(+), 45 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
