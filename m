Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp38743ejk;
        Tue, 28 May 2024 08:45:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXAJ4U2urx2XdXenmjnlXlrCviwXVua5oAuGUCbKiYi3QmdUttBMm9qafQMsZKJSIHdGLzr5KoZbxGSVdN4oK5WqWDCwrLs
X-Google-Smtp-Source: AGHT+IFfR5OfmOF0Zt7lIO5Wh06q42MxETd6PvG8Dn1I03gqLZBDvEnoAncRkry7/F3jKtS7jvBl
X-Received: by 2002:a05:6214:440a:b0:6ad:79e7:fe3d with SMTP id 6a1803df08f44-6ad9cf58113mr4724796d6.41.1716911131298;
        Tue, 28 May 2024 08:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716911131; cv=none;
        d=google.com; s=arc-20160816;
        b=jitZNCJIpzA6538PW6Jz/7o8t+Is28eEt8dlulA3rmYO9Rh7oaU+i+xJm2/DEt+nsZ
         0XviroV38z9o0XA9Z2FeQKpc3+ft1riNYyvALtBLB8yeeUMku+pMkWnsR0shVqTONpzr
         TErHqHIsWL7L3PgBToOzrMx9IScl73FDOzYMhdu184rTy3Yif6RHK5qTfVoWfMaSKDWK
         Xbeg0D7y5MycO/pNqQ17ujg/u5C1J/Ljdes671nW+2EVIEVOdOYZktWnXby4syZjqg7K
         zx9rmikLKsvom7U1S7oZhpTKArB7mKM2R35oatMDb7GtvGPwWGtqrNT2zcIx6XgQzC7v
         o1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QbuCnmNTuvX5b2r3agw3dICJ8BBaGtRmibsL4YBvmf0=;
        fh=f/2SZK+RKtAXUAj+wTlJz85bBsFqZipxGOR5wnUhC2I=;
        b=au3xKMSHiwYqpRl2f8PP0zxQ+S9xUbc7tZK7amja4f25JKkrzMICj4nKX/NfxXtQkB
         G7OwAk371Nz3iBX5tfMOqAao/UtJJg41ZQAqPjTt1TMbebJzx5J/FUSIjOFSXjNTK+qn
         y9OJb4oDMSHbtyaMMPVeBnJdK8ijjAz3w99fyfvP0J0XqH+wSIoYiaWkaJTOtcIQ4n1G
         MOsIOgnyEN8JkSE6+KPU5VRnjPvHDs67vxp6YkX6+U91Ntk/XUKELn275au3Ip6yv+Q3
         DCynnS+wOxrBzRCmhsaJZ9zs5Yi32DGhYTWioidjwRLdGENVs8uuB/BR6Isou3/tmCDt
         tzHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4RWkX+u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac162b30dbsi107170206d6.476.2024.05.28.08.45.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 08:45:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4RWkX+u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBz0u-0005ez-W2; Tue, 28 May 2024 11:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBz0u-0005ej-3P
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:45:24 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBz0e-0005Uf-8U
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:45:23 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57857e0f45eso862923a12.0
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716911107; x=1717515907; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QbuCnmNTuvX5b2r3agw3dICJ8BBaGtRmibsL4YBvmf0=;
 b=E4RWkX+uMuI9XnJA4206Ak8wYUGrkiWxNXb6YcI2uIux12tXYGNOXYaoYJUfL34IDD
 NYuGBATFkHM5kOJS+69Na/1O9Vo0VQ++q1VwoX8PLsZ9kfWl6bUB5+NnrBGXmSeOiu4f
 tZpgJJ6tbvacgEgaLjzus1smVz7qE+Q5bivqQI6CwjU2C2MB+l+s+8rPfPxL7iP/eDLX
 TQiKYBLS7f6siYo0UhtR/xWYYIJ3uz+TDJcwtj8YNd7MHTRKPalXtzd5UxBfDqTUyrXr
 yP3uA5gqVgcvXOKXaw2YISE3VPkSIL9hTCWp/NGIkBDJsfsiOegucHh6vbwIRqwWRZRL
 STRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716911107; x=1717515907;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QbuCnmNTuvX5b2r3agw3dICJ8BBaGtRmibsL4YBvmf0=;
 b=CRnRwr0J/t2oHZ1tNydrJq7Ji/yKB1b5B/Hm2L8u5TdsjSVBMLvPMAx63jlHt34Lks
 fGwSOy3/SLEK98p6L5iozw2KrJGJ5brDP4ffNRd2TwMXad7a2vulsYn9XYl8f697ymZo
 +T87Yj7Qoqt2PBv+bbP7qJmEHWwkaVf2Zvbo687xnb1b99i7srmVA88R7qZJmOyZu7U1
 hrXYy+VX1hPMiIf0fbBAUg9P1pp2U1OQtYqn94h6i4odhzUQLCqAIBwv4Exf1sf7n81j
 WKfYdK0kQGC6iAQieMKWUNVqDmLUNXDVXt1bMxsMUAWcKddY7+8Hhxi/1L0CoSjvdldy
 jVjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDZKcb5b1+bLYJaTv5NkQzQskje4kx7IOBYm77JZjwhTQUw14ebXcrFLHvJCNbMuexWNGJpxdSanWs0X7hyvpyj5AF
X-Gm-Message-State: AOJu0YzGrJH37HFhZgocABmjPFJZCbVItTt3FLoiwDLBxW9IwprSs/vr
 S3Uov+7fIQ95KS4ISiZ3Lc7IQmGC9RL2vzCILnLnOmak6ehGxKRphsycqwgMYPCB1KsZSeVwWwm
 Nulb+3/VGyXiMXRKJ9VeqnP50FpxCpeorCZ99WA==
X-Received: by 2002:a50:d70b:0:b0:579:e6ff:c61f with SMTP id
 4fb4d7f45d1cf-579e6ffc790mr3838928a12.25.1716911106809; Tue, 28 May 2024
 08:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-43-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 16:44:55 +0100
Message-ID: <CAFEAcA9aNEDMLYt1t9H_2x3Ma3VpBOgs1EBAUi5E6rwEiMre2g@mail.gmail.com>
Subject: Re: [PATCH v2 42/67] target/arm: Convert SUQADD, USQADD to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: 842G2XRc7sKo

On Sat, 25 May 2024 at 00:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are faux 2-operand instructions, reading from rd.
> Sort them next to the other three-operand same insns for clarity.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  8 +++++
>  target/arm/tcg/translate-a64.c | 64 ++++------------------------------
>  2 files changed, 14 insertions(+), 58 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
