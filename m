Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp45271ejk;
        Tue, 28 May 2024 08:58:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnuMPLiT4+0HWB9iiy9Y6NOZrMO3PN6QuiTiQVDuvHIiDPyLAlw5pxmM1wxwq6587m9HQkGrbfXLMP/mtvPHoLtFH6mTI3
X-Google-Smtp-Source: AGHT+IEtfK9ZLtF23dfupN5J9PJEUMxLEK8g7jh/LzNx2uXzBSm2aPA6TCO36CQQes+gjlexEayW
X-Received: by 2002:a05:6214:3d8d:b0:6ad:7669:89d4 with SMTP id 6a1803df08f44-6ad76698b06mr85230296d6.4.1716911920537;
        Tue, 28 May 2024 08:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716911920; cv=none;
        d=google.com; s=arc-20160816;
        b=OiNPzNhRshwMXH/K6h0LAB/WW161TN9VKbwEJt2jcwQdZSOiKpJprLtCZMYq8ZXsx8
         xLEoFB2EJ+QFOLmm2pJ3DAg3WN8qeMrspays0+x6ZfjEFdr7kTYHvinOoYCYZTtdad4b
         ZWHXUinRiGb1y/4uL0BQe209dHZfkejyx63WJTuyAKD3NPWPpBPOnPkpjhyUEi4ly4Ak
         rQOOKO0VyUlmEUEKG3GKhR2FAsEZxIj9zbNnaaavi+YbNKgnRMXWjmOLGc90prB3mL/m
         WX46unhd+XpogJqHZ5+jiCyYohniMEfyCV2hSlNHBNi6yXufmChDtAd+Kx9ZUy1NBLWA
         OSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=AxkRlXyboYQiQ3E/mkfizR+uQU7sfvCB/zKya05Q66s=;
        fh=UaeXWyEC1du/p2MXi3g9HBYlHRWn+8aeoBhQmaXaGUE=;
        b=nL7RAAC6xIzBTR3PAP5doX8tZbZM+/XwxYYajPnRi7XcpjspBqs6Rk6gvnV9kI9A6Z
         kuulcDH4vwI98iaELFp/7/bll/rh2R7071g9VhZ+k/MDhDe3hMbbMtRr4rNrY8+SGfGY
         XvSlLPujK4x5qwZfkjDyGiU/TY+uoBxEnVUgT0PXwNaMIRE4XSgcgTeN9o3T/wZSx9ga
         FqoUIJZGQqEnbBu8yUPR724rKIeGynTVl/Eg9hwbcuCxCWktJ1032vEyUHpz//QUiRus
         8SXSbZusaFl6EMcgEk8d567gZRKbRHEptm3sHNZMdZWHxt5qf0Xf0eE/QjJ9kB3OkFik
         QQhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lW5ArVJI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac162cca7dsi104786606d6.538.2024.05.28.08.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 08:58:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lW5ArVJI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBzDL-0001AG-D8; Tue, 28 May 2024 11:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzDI-00017M-1j
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:58:12 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzDF-0007E4-B2
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:58:11 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-572c65cea55so1814820a12.0
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716911887; x=1717516687; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AxkRlXyboYQiQ3E/mkfizR+uQU7sfvCB/zKya05Q66s=;
 b=lW5ArVJINV8XOHIczcfdgWGhxH/Y1jpZQYMEfegPojjM3HhOTCB3KW2v52Tr330p3R
 gDEQcUlKUsajZfJI2WtOFQxEA23SBN0LEFYtZemQibc6ANiCIeKdUr4lv1r0oJf2zsqc
 EtKZLL4mNvUGbmPAKFdnQpd6E7a3V7WqoTDYTY5f0jyH3nNAXhPpssbf9IF+PHJwmJr9
 5//MJvR2WA62IkPnimdxU4y2quWleP6uLghQz9Me88v0IODy96dvv5mhloQu3+gwT//T
 nYjHTBRkP8OMBZfTDPbO/iQkEQc+a+I0M4KrEXCmjycLkY7vf+gGcEg9nGFJ2IYgxtlv
 4wtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716911887; x=1717516687;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AxkRlXyboYQiQ3E/mkfizR+uQU7sfvCB/zKya05Q66s=;
 b=aj5zZBfFvMFhCgBQ8fAt0c0FspO8uspRhGuHjdmeEg6S5XIf8AVw1rq8igzpH7iJGr
 QSRs79JD/zlrdDfaprPuYpVuFfW4KjSJUYvjgjNwlqk3d77/isSyGRGwMuwRN1CGfdyV
 r4CH1dx4QlEC33QITvwev+HZq8xSD0+w2eN9l08o0Ddyn98fQGkZ3KKyTYB7/EtqTLju
 Xu2/KBqzM7E1pKayqIKEdtxtIGCxyLVF72lXE14fIVw3uYN7aGNPwYI81N3OfcHgNKqq
 eD1KXWNvx5bT2MrryrcEpleb4gpROKLRB5Mc7r9W23nz4MHCLuZY6OOyl+AOmwj40S/y
 OdTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtKgRstGkRyb+ew6Z5yC1KQUeKCkjn1mh9PzFCal2FnZQhrmTShs6OoOFby7npUo4fDdiuikpXUHQa384QIOkI4MjS
X-Gm-Message-State: AOJu0YxsDjgmg70tOZ/zvp56Ar4z8E0GdQfLBIOquakXFsYY2XrDfe6W
 ZF+FhPie4cm6j2tL2puwBA05yxFXUGMScKNnorvbY2i8ZItyTPCjPz7LaQoeibUhGqVPvbVlw2o
 1cTsQcLVRrhCWm8XvXsJi3Mdax9yXto9aU+ivHLoF4O3dgvJe
X-Received: by 2002:a50:9fef:0:b0:579:cd1c:8d69 with SMTP id
 4fb4d7f45d1cf-579cd1c8dc9mr6414835a12.2.1716911887488; Tue, 28 May 2024
 08:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-52-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-52-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 16:57:56 +0100
Message-ID: <CAFEAcA9zF0ch_0onhH+O=K9mf8e6MjzzNUZFrJX4x5jLmK1Y1Q@mail.gmail.com>
Subject: Re: [PATCH v2 51/67] target/arm: Convert CMGT, CMHI, CMGE, CMHS,
 CMTST, CMEQ to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: /6kaivEUpvzI

On Sat, 25 May 2024 at 00:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  12 +++
>  target/arm/tcg/translate-a64.c | 132 ++++++++++++---------------------
>  2 files changed, 60 insertions(+), 84 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
