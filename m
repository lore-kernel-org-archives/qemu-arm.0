Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp498118dyc;
        Thu, 3 Jul 2025 05:25:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUIzrfNeapgIm9XFnA+hn/fctnqEMPBOhXWAPTHGNIpd0xcr0eEfDF+de9lnlUj3ZsKsDH0nBAFX82XoA==@linaro.org
X-Google-Smtp-Source: AGHT+IG4aOfqadqb7Gf9w7iuH18kTv31OUC4J1NK6DVuITnzvqFpMjAxDJeI/4GpSNGn+QX4lNrq
X-Received: by 2002:a05:620a:46a8:b0:7d2:284f:e471 with SMTP id af79cd13be357-7d5c478e4c5mr979186385a.33.1751545502584;
        Thu, 03 Jul 2025 05:25:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751545502; cv=none;
        d=google.com; s=arc-20240605;
        b=KSoc01WPMaSZbRLO0bT9zGkq+k1jjIEeAGdq1ZrkWn5IA+bKflc84xBBDsfoW/OJ+F
         wodgjQiudLzpCoZBXEUDvLSpnIauVRBkjXg3pp4tHNhWbJ78pBOmfXHvemU0VwIMq87q
         9tJ3KX4K9taZd/rFWOrzgJBw6O1l2SNnmm2+UiUurCQy3yIAkV9JyrkURaAg9YdiG35Z
         FvrmAXg5ik+CDNskWzX7JUfvQ9DZjAndPTb3BQtP4NT4SVF/zlvtEOTwnR2IOfeZirLq
         QmTgTievg3TV5f6PblwU2bbDMN53E158n5vLSw/ICaxpLuYhuBXa8PVgbLbvzwFvIQYe
         VNWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=v+AwiiMWyFBLhFTvXF4KFZt1rk+9QPIOjHq7O4/eo/M=;
        fh=KJAMV7oyAjG40Nm+iYDQyF9jkmnhTkdkgc/UUKVC19s=;
        b=kzFClUoaXraJIGmXTnAKTsgI2SPNYDD6WYQtjLFtKtrdq73Ef4IkOEM6r/eHIuSZ9Q
         dfFGbrnTwAf4mu3D/9SsSTFxdguiJMzMdO0yfNFWkOOwnhSAEBb19LzdQI74yU3FNfR4
         s65iQCRdF0xh0MfWH5rKqkyWocpBNRsrwuQrZkuT2ThAg+FOyVenoGHo7AUXF38MjrOQ
         t2S+9wuFlHyJbKVdQhIE3vTvKuIUg3fzOn0+9+h2x9gWb8dShIbHaCI1IwZMoQkB6y35
         UmbgsA+kS3nFv8jiUw9A0V65jyrbBH8QZC1DcutR8QFOb3KsTq69YkMlvJPyf9B9Xeia
         dtrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UxgkinCh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d457263570si958854285a.274.2025.07.03.05.25.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:25:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UxgkinCh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXIzl-0006gv-6y; Thu, 03 Jul 2025 08:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXIze-0006fV-CK
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:24:46 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXIzb-0004Ll-7p
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:24:45 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-70b4e497d96so57859547b3.2
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751545479; x=1752150279; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v+AwiiMWyFBLhFTvXF4KFZt1rk+9QPIOjHq7O4/eo/M=;
 b=UxgkinChupz3PcdwFINiGQdNAaUFbH5zre+gLIZj0ro70PhPOlYvaBipaxKVEcgZjc
 NZyEPAtbNW/JIcr4fuqCZ/Od4ZyqjgNFvRf6Yg0Iwx8XK2bKgONuNeIsYHYcHbmjjFF/
 Tbyd+MvwYKQxBOjACsxbgaT4P5QhwqgC/h59daB45PuorAT/Jr9xStpGW/1YNpd50g2L
 CoYrw1SWD8t0ACd16RDK4SOIcUUkAG/frvPDk9aDFNJRGFIPQIB0aiMaUgcSlilArw1n
 WWsYm1B+JuS2Ol8UoE/die1B/u4Jidpehpvx1jLAJNrHzW4gGu7AbK+aVzzNpmqdNuk8
 AZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751545479; x=1752150279;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v+AwiiMWyFBLhFTvXF4KFZt1rk+9QPIOjHq7O4/eo/M=;
 b=KD5NlGEBxb9/2euQX9G7MK1ufeJit06dgxhuTvVk/p1jyD0sqLwh+21o6zLilsmyUW
 xXpBcsW3OQ4d7xXj53iTvmIdLfTAu1wUjxCTtzYkNqYx5CohyN6Ma2f1qaSwMc67LpOC
 YhybVPzPYIpj3G0bdUxQEZrD3owasLGAQ7My0brAqpGhGfHlmMcFK1GADF14mWAwdmu9
 SF34Fy8vpcgbgfdAOchyYFr0xWm3HBq5JEBpJ2TOGUlu9m5LNjfhGhktp0vfQ98WcI3B
 hyaK3gSganZufqpapJ0BjbxMtXxOTVDBE1podI8QIAbyWnvF8IRdfyuqy7zArypI8qSY
 LZFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9RQIsA9aJtopCgRozzQy7yKTIafzU5QqIbVIdnqWYILO5ewn+72cho4eBQGtAd5y5co6m5lMosQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz10RBVyjosnWylxg5NR8u9vwtdqfDsRTTpEq+kl8Rm7JPdML2g
 w5gl6uzYAwVY0fKobNz6uAmfwIvYNfHERJn77URH1BcY9RlKSYNjU2zRzdei9WRuDqWDebbELRN
 susFTbw8c4bA5z6TB+n9VfbSaCFXO53+mWaF5f9wbBg==
X-Gm-Gg: ASbGncuO+tnCMORd99zcm2DWT4wpIFDfufFWOM2aBDI1CH0FXeeIplVdmUxMaV1gz2c
 V5jsjUCiTWKPgcaW2L7Hd/X3PdhMBTEn1X/9NtirOjLgf5UGqd7R1k89kbSLL1H7Xfd9PTJb8jx
 406sCnXq8f3tyKnaxfAjhvi88pcMV9IQMVj/3rYZpi/yGprqNur7tvaII=
X-Received: by 2002:a05:690c:6a11:b0:712:d70b:45d5 with SMTP id
 00721157ae682-7164d4cdff0mr92240717b3.33.1751545479374; Thu, 03 Jul 2025
 05:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-75-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-75-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:24:28 +0100
X-Gm-Features: Ac12FXwo5TfK5W4YK9-rSWl8M1AJuMb3MUJ0BTQgbIcJ2_0drXO8scdjMQNPtJg
Message-ID: <CAFEAcA-MfbiYJJjLZutLqjroXJTwO38LwdtypV6uqhyU-Pzp2w@mail.gmail.com>
Subject: Re: [PATCH v3 74/97] target/arm: Implement FADDQV, F{MIN,MAX}{NM}QV
 for SVE2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 4CoPyCOobl6J

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sve.h    | 49 ++++++++++++++++++++++++
>  target/arm/tcg/sve_helper.c    | 70 +++++++++++++++++++++-------------
>  target/arm/tcg/translate-sve.c | 48 +++++++++++++++++++++++
>  target/arm/tcg/sve.decode      |  8 ++++
>  4 files changed, 148 insertions(+), 27 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
