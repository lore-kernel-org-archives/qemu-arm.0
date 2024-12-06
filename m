Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp972287njb;
        Fri, 6 Dec 2024 08:25:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUcECDloNUL76Rzjp1VCEfAcq+yyUomXQrYICFSt5k09+phH4Yt2CRFXCgnLP4Svs0y9MtJtVV0AJqnQg==@linaro.org
X-Google-Smtp-Source: AGHT+IGp47k1gamVY7WFXkGRtSmui+tGi2+VcBzg6yqUlLzk8Alt2uFlZHtk73MbiH1ZjBlK9UYW
X-Received: by 2002:a05:6214:2028:b0:6d8:8f14:2f5c with SMTP id 6a1803df08f44-6d8e717de65mr75525246d6.23.1733502312670;
        Fri, 06 Dec 2024 08:25:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733502312; cv=none;
        d=google.com; s=arc-20240605;
        b=Zc/UBYpJwBS1xpoNbtaR3LCj78qQLrw41hJ6zdn0kf2MlO69/KlxTZqp2rlbOiGH7I
         QP3SaPIQz+wFgKD2ZNqQ8TNzVet9s4KxBEB2bmeNJPc4jItvCewHdUyyL5ar6WbydIe8
         vHJZTgxToERqpbejYnL9vwSx6xOqBMukY4lKmn7tXqj0ujPGBemWGVnEWYsIEACRPbVI
         jgGJ+0lUMzKQJzLsNpofwtuY3RcA2exRtwQESTx6Yb2rOauwztGmduSuj9W4llo2C05c
         R4riuK2Amg0Kq5l6WnFtTli0oHpDQgp+Oq1APq1gIUrrTeAQxUm9UcPGbcoK0URWyhLI
         3skA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jeg8gEIFGwtRxqg29I8ok6MAXCgiF7d+5z6yZXoNI7c=;
        fh=qa27MGzKfLn4/sxT09mqr6/qhqxUep6bfc7dpIdyS3o=;
        b=NQRzDjFJTp+OirSrctuw7pEP0LrmpPdD54ObmxieCY8AUU2PVs71x9aLiBTL93hsTc
         W4x/dApIMVfbBg/0/oI+9S0VrRpck5KwFKV0dKCsmd4XcdsqXrqhvGR4JMDYP/EAJDps
         x8hWIKd0hLFdLYU4xIsWbwp3AEfe6zhj+YSQz0RZ9PLyudYkG5vMJWY2Fp7mgQiXqv4j
         ctUrcJef3rDNX9UWel6fPl7DDoHc7ckZP4avH5BN8i1nEyGVODdbcuFnAh3QPr4KmhcX
         EzVyar5hb8kw7mOD/AUOfqBnPUpkmm4AK0cx+e0tWm0dslEjxwo4mEGn4OocWh1f2cpj
         gHdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yPhDCISX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5abf8a9si111945385a.597.2024.12.06.08.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 08:25:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yPhDCISX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJb8F-0002Ug-Lr; Fri, 06 Dec 2024 11:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJb8D-0002Qm-HM
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 11:24:41 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJb8B-0004ye-My
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 11:24:40 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d2726c0d45so2955169a12.2
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 08:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733502278; x=1734107078; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jeg8gEIFGwtRxqg29I8ok6MAXCgiF7d+5z6yZXoNI7c=;
 b=yPhDCISXFHumXqBPWXHzBDTvt/oWgKR3zxDUPv4R4mePuiZ3f7dCnZ5DNZs4hBkjV0
 NsvO25swBs/v76c+gI6ly0ZmEN15kq6W/wsF5/3QXDu5eih94pPocAoeNTLdOKr+dI4H
 5Ho8DbFgpvjzRBRwFvvvXtYNukn8ToR/xEZGLQpKFgHVDB0C7ejz44y75JGZTNKCqlek
 HSLF/uXlKkP6vyKgEtRgAeIjn2HLjMKatNgfKEHJNsOLNqZglRRlF4gQkhmIAsq+elkC
 YiVzPGtzIKiDvT88Poj4qJRGVVOgDEYMmGUJzn6sgBhICajx38YrlGXizGTiuYg7HGKa
 8cWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733502278; x=1734107078;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jeg8gEIFGwtRxqg29I8ok6MAXCgiF7d+5z6yZXoNI7c=;
 b=JPHqzftCDyS0A0ZqTbD3AvLcsEn8Vi9NqhPqeeGZ/j8GAp3qOsKvkzHl9SLqqamymQ
 R56S6YTxNPKqASm2AukklrRttAOwUdRGLfasuYf88/+Bsrqr0T1gD3ylBPubpt2h5iyh
 A7Ykb9ZzH2JKO4f2QQre+VRI4rOieFojlAoVOxiWM8nZTc+Ncg6hIhAr+kxtPEOgeHiD
 xwarWlE57g3AZUbDSh1wBpuU4f8fP7MXJ1a4xZ1O8wbOkHkxhO3eUqWudcSjr6WHi7DO
 L2GvUu3HIh9sCMhLFb1hryHooEIfIeQN1szYfqt450pWdQTpyM4RflIL1RthKNlJPSDm
 SYWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+yK9UNi9lS9PTrnSx2cg2Yt/RBK3y8L4ZWgQf46vI7GFJ1Bbd7j/KjgTE46w4PTHOKgPEcygHjA==@nongnu.org
X-Gm-Message-State: AOJu0YyRG7/UgTtSVsTKqeyANyoAXbmeBLhLJpaRQ0SUNU1q4JfV5ztO
 6zEI2xkOmBqLA0YBCNQJgWhW7tKriJl/vkOJUUCGjQXymfHt1IdRG1QeqH8FGIz07t4hrvRSFZ7
 2GhPcsbHgP3m8I2pb/4auW1NGXpzHqm62XZw1CJqEUoeo3X7i
X-Gm-Gg: ASbGncsLXDPnsCW/fEU0RVyKLPUR3mgSOeZToae6kKI0qo/caF/34Gm8eH5kKykDSqf
 7VLCTdUn0UqqX2a1BJNudET66sv9LqFkEEL7v
X-Received: by 2002:a05:6402:2349:b0:5d0:f904:c23d with SMTP id
 4fb4d7f45d1cf-5d3be785c74mr4398892a12.28.1733502278008; Fri, 06 Dec 2024
 08:24:38 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-58-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-58-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 16:24:27 +0000
Message-ID: <CAFEAcA8EFbW3QTz4-DeghL_f3nTU=jJ3cGbLPy7eQGazRHkrRg@mail.gmail.com>
Subject: Re: [PATCH 57/67] target/arm: Convert [US]CVTF (vector, integer)
 scalar to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: taYcC/OY9+pS

On Sun, 1 Dec 2024 at 15:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 35 ++++++++++++++++++++++++----------
>  target/arm/tcg/a64.decode      |  6 ++++++
>  2 files changed, 31 insertions(+), 10 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
