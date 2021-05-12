Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4793096lfg;
        Wed, 12 May 2021 01:54:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTSFE+iz4qUWAW0CV8W1lJItxDSwy53ciHdSX1L692Fl3he3vkvOviCzfJlwiRghL6P74I
X-Received: by 2002:ac8:5fc2:: with SMTP id k2mr32890815qta.212.1620809659677;
        Wed, 12 May 2021 01:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620809659; cv=none;
        d=google.com; s=arc-20160816;
        b=HH7sfKPEhDuduOxfSdoejAQhetWtBzidDGDdL0cIOCgF+gq2Y7t2vahjnT2WXJCV+T
         B1oODkPbUnenyScxr6E/Z2x9MADNxGgZGx92I3Sj+J/tF0uc8OcuQKJBQf4tj1HWpH+M
         45FXWS5lV23TKbFTw59NbXw3Ea1LFyjdQBs4M+IxmWpjKfbyT/4v9YsP4YZsZ9u4z8mm
         XLmlfSL9mk65Ngl7dHofRZC2sqfmxU9RTViHH14d59RpqRX/985oqk7U0jKRL/xVh0xT
         5sXPR2s0Wq1r/D96SIR5fgH/aIlAA+xn+j3FbrpQ5AQpM0NV2gtUTUopzHHGeQc2TwdE
         H/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vU5vYZr3Im3v3yBjS51n/PtbLwd0EcQ4+ApVA0RZprY=;
        b=Uij43K+rl2Fun0Lf0AgCs5FvdJqsXBHyLU/LLWPmvPd933FAXpHEgX2MQcTtM2pGJ4
         QrPtEnRfyo0g6eP3gQnszBxA56yUfwbQpGyDYS5mPXZDmqSjutqQWtBRaK7Kwolfxby/
         0eerZqehO/R6p6TKRyLmCyIvJ+uvgrTU3N16jyaWJ2DF8sGWKYlfKBsXLN0/RVPN7hpS
         fCWHqfKr5+cGlVxHhX4I/Wk+mWDrSPASiPfW6F723HYgxtezSpkbqiDJJC3RQRGnoMkO
         DWdHTcLUoIPMKBefdDC9uBP5bToITf0TOFtMapCIO8KIXNm1n9HB2zXrWCsFMkuKFEyf
         tXHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ghpnbk9+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si13788013qtj.276.2021.05.12.01.54.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 01:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ghpnbk9+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgkdH-00035G-1S
	for alex.bennee@linaro.org; Wed, 12 May 2021 04:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkd3-00033Z-Ij
 for qemu-arm@nongnu.org; Wed, 12 May 2021 04:54:06 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:38843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkd0-0001eM-Hd
 for qemu-arm@nongnu.org; Wed, 12 May 2021 04:54:05 -0400
Received: by mail-ej1-x630.google.com with SMTP id b25so33771296eju.5
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 01:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vU5vYZr3Im3v3yBjS51n/PtbLwd0EcQ4+ApVA0RZprY=;
 b=ghpnbk9+69FSwtIcHOEzVtzVRevDDqRjlO06JlFLDXBnG15bxiFps+2yksPJn2QJ+4
 heq1zPAaiS9/mFgrWtfJORHJHYafAEcG0odnfxVeJLptQEVbxBb61L4SGCCCFnUc8vSm
 evoXjzO9bpJczlcN+9l/jRsrSUtQEvD6YwZW4zMoqPbmbYlbzWwKf15VVhYYVqYazmeO
 +uHPXDkbefgXW0ukXEtlpJt5qIjbl64xQqnRJ8spxwdX3KXtTIOcgVmfQp0YkU0uYMXW
 TtAloq0CUceyvZ4O0CZA6M3LrOf23V3voq6hZDhGY3K3wMlVWfxCNM5tlX7hCAmWUoCw
 52QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vU5vYZr3Im3v3yBjS51n/PtbLwd0EcQ4+ApVA0RZprY=;
 b=bBkIazDrZzmHEP982RcWoEi+dpD3hY/bAv5y7Th2umEHyIWBfm3vW64KQ9uzPPvynG
 aAVKrfWV5YCYYyBcKJJ2OjsvmMqq1khcCqprokY42rEFQ+fnfKco30FgZPFcAswtA5zF
 jFjYqnnX2O9pb3A5x2SflF3e6d+VxNCYcDqYwTT1Uv2ulyMG04aUZ6BcPAVks1O/NEGu
 tEADu5XmAY649JFKq8OyelISb13JyJ7AUVnMQrKEEK05lEXTGm6yEIxlEXk+6cqz/ZGF
 H+EyYdLhy0hLviYGUj6WEHoSSXo0RPQ2JnabpKTNI448vDNG5Jt3d+uk1cHcOkoMTnah
 Io/A==
X-Gm-Message-State: AOAM532f1QslkmGpJknUFYSbzcI8JPj3+1Y8G1xiTEifUKWM+N2TOTqO
 lccuDkMJw8+YDTKo8cYpL+tFm4jyvxrsBCmbESwGhg==
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr36062349ejb.407.1620809639189; 
 Wed, 12 May 2021 01:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-27-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 09:52:45 +0100
Message-ID: <CAFEAcA_OknopgKOtwAoiLrKEXmtNDYpQ5EycnkzBuNbc7WLWag@mail.gmail.com>
Subject: Re: [PATCH v6 26/82] target/arm: Implement SVE2 SHRN, RSHRN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
X-TUID: CjjHOnLXMxXG

On Fri, 30 Apr 2021 at 21:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix typo in gen_shrnb_vec (laurent desnogues)
> v3: Replace DO_RSHR with an inline function
> ---
>  target/arm/helper-sve.h    |  16 ++++
>  target/arm/sve.decode      |   8 ++
>  target/arm/sve_helper.c    |  54 ++++++++++++-
>  target/arm/translate-sve.c | 160 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 236 insertions(+), 2 deletions(-)

> -#undef DO_SHR
> -#undef DO_SHL

Did we want to move the #undef DO_SHR/DO_SHL rather than just deleting them ?
(I have to admit I'm not sure to what extent undeffing all of these macros is
worth the effort -- I ran into similar minor awkwardness in the MVE
helper .c file.)

>  #undef DO_ASRD
>  #undef DO_ZPZI
>  #undef DO_ZPZI_D
>
> +#define DO_SHRNB(NAME, TYPEW, TYPEN, OP) \
> +void HELPER(NAME)(void *vd, void *vn, uint32_t desc)         \
> +{                                                            \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                   \
> +    int shift = simd_data(desc);                             \
> +    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {            \
> +        TYPEW nn = *(TYPEW *)(vn + i);                       \
> +        *(TYPEW *)(vd + i) = (TYPEN)OP(nn, shift);           \
> +    }                                                        \
> +}

Doesn't this need some H() macros, the way the T version does ?

> +#define DO_SHRNT(NAME, TYPEW, TYPEN, HW, HN, OP)                  \
> +void HELPER(NAME)(void *vd, void *vn, uint32_t desc)              \
> +{                                                                 \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                        \
> +    int shift = simd_data(desc);                                  \
> +    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                 \
> +        TYPEW nn = *(TYPEW *)(vn + HW(i));                        \
> +        *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, shift);   \
> +    }                                                             \
> +}
> +
> +DO_SHRNB(sve2_shrnb_h, uint16_t, uint8_t, DO_SHR)
> +DO_SHRNB(sve2_shrnb_s, uint32_t, uint16_t, DO_SHR)
> +DO_SHRNB(sve2_shrnb_d, uint64_t, uint32_t, DO_SHR)
> +
> +DO_SHRNT(sve2_shrnt_h, uint16_t, uint8_t, H1_2, H1, DO_SHR)
> +DO_SHRNT(sve2_shrnt_s, uint32_t, uint16_t, H1_4, H1_2, DO_SHR)
> +DO_SHRNT(sve2_shrnt_d, uint64_t, uint32_t,     , H1_4, DO_SHR)
> +
> +DO_SHRNB(sve2_rshrnb_h, uint16_t, uint8_t, do_urshr)
> +DO_SHRNB(sve2_rshrnb_s, uint32_t, uint16_t, do_urshr)
> +DO_SHRNB(sve2_rshrnb_d, uint64_t, uint32_t, do_urshr)
> +
> +DO_SHRNT(sve2_rshrnt_h, uint16_t, uint8_t, H1_2, H1, do_urshr)
> +DO_SHRNT(sve2_rshrnt_s, uint32_t, uint16_t, H1_4, H1_2, do_urshr)
> +DO_SHRNT(sve2_rshrnt_d, uint64_t, uint32_t,     , H1_4, do_urshr)
> +
> +#undef DO_SHRNB
> +#undef DO_SHRNT

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
