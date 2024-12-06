Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp841821njb;
        Fri, 6 Dec 2024 05:25:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUgEm9X+JqVUW+DMJEQEk3c506u/7C29TDpzzRVJrbODhLlUahK8esJ9zllq4UKiDJoy25c4GFFdrknSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGDdrR8Zvk3A3WcHLH3+Uslt5mud/Dl5ajB612h1AUhfOCaw/NYMU7uQH8jyuXbnt69+RGz
X-Received: by 2002:a05:6214:cca:b0:6d4:1d9b:1562 with SMTP id 6a1803df08f44-6d8e7177c58mr36923336d6.30.1733491554749;
        Fri, 06 Dec 2024 05:25:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733491554; cv=none;
        d=google.com; s=arc-20240605;
        b=ERF8pxvYsQXjn0JGfwjr8ldydb0HVQ7skurBSOy/gzMPpX5eA1b+9tW5bIfTuUXUkk
         WMKq3WwSYb7YighDlCxTupzna/sB3dh+L6+Joc2ASscU4xWzGckDfbuXHnIlno8UKa29
         gP0yIUZygDdz956+T0LZYtS0JDw/ffN0LOkcwGjziaJ1GPd+NLryGUsy8RIgpSh34qeU
         RIS7NLjAD5I6+VqGDF/PSHnxYspnCE1XJ96Wiqp0fx4SYPubb1Zo074CTrRV0VYe/iHj
         ezlx0hw9HTFtR0NV8FhhgNZbKY43vZfPJM3BqmlokCkzatMWMpJNb4wx7MrYzhBiKF/3
         DQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Vh2kmXKx7DBmmLuNdd/kPr1NgTRTLmZ5J03mhylEpiI=;
        fh=9Yo9Hl8FJeQPqU9OUsPENdSZ9ZT6W80QUN3uwDSnZYQ=;
        b=NK0hB2cGEfMY7GrHdJ8TsWw2mCaoSOycPpX136juoBNHPohVKabqCV9tnoZ+cVGcU7
         iULSoMvRJ7oqC3A1ZE3o79c+gQKH9HCyJnrV4HCXGdx5b6isuFtLb8EIvBsGF9l0FRx8
         aV6eItdJj3YucC6e/4hyOBpdEM+gU8s2zN0suZjV1xfC/2EIpXbCEuSQz7tSRBgqn72P
         RYTGjXaxZqqH9wfAbKw+m70vGCuDx1E91zFBEQjpsSaVrRw58HdkMp1bo1K5pOzlkwU2
         UvqwFYiuWbxz5C6FBJAA9RKZwDU92tZcdgc5lCuxOlKJTVNtMG207smMqKLT5qhHS/F4
         HezA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H7SYa5jQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dac2b517si31538746d6.499.2024.12.06.05.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 05:25:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H7SYa5jQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJYKp-0007GP-Ny; Fri, 06 Dec 2024 08:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJYKl-0007Fu-1i
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:25:27 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJYKj-00024W-0p
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:25:26 -0500
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-3002c324e7eso13692221fa.3
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 05:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733491523; x=1734096323; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vh2kmXKx7DBmmLuNdd/kPr1NgTRTLmZ5J03mhylEpiI=;
 b=H7SYa5jQsbmrCys04HlXMsaJquZSBdUVNW9wQDZWb16z+cEsrGCTXksLiAfJ3jRF8X
 ke+ndCBYsontq2h8KzeqtvNQCeG6LQ29dGX3Sn5Z/vlAjZGXCf5e6CpnCwHq7J2nqXSg
 Rh0pzHk4wJlrFykibpeAUwhTdSStlo1n0xBmKnKeVsIcanqf13y0LPPIlLtN3LJ6SRog
 mM07e4Kjmtvcp4c/73j9doyzNEYumhYqhgQoekQPe6WIZXhZ7lcu0D7zjM3xx0omiMDK
 Zz4Oyl4l/8rqrCTzn+3LGBHxzmGSg/q++XesHDM3thAf0XWIchRWASldS5YYcMoedjyg
 Hg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733491523; x=1734096323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vh2kmXKx7DBmmLuNdd/kPr1NgTRTLmZ5J03mhylEpiI=;
 b=qyGVEgyfvsykUgvg3Exjf15fShwfzDCsL7u8NA1Xv4lLlA7JrzaWSwzQ9QcfSx2PcR
 eZEU09+zIrgkR0a+ilMrjknmSxEd9LzOi2GGf1NxJ7OX/SWPbQCqDeBQeHzgsYbAJs/u
 u6KehaB4AjeEFZWmJKxOZ5sZKEKzdBAJaYoLBfO73Sy/OcQU1LB6daWtkT+TmqkzmY3E
 LcudlTZI+cGxT03XaTvC1ID1b5KUFYtDiKw4xaBQT2J/3clTvryVZqwXeZOPq22GneQs
 Zs2mmJYdparIzxPpWvloMLRTASfvqeiRRUAn0wbTZ1Jh5CKWsU5X7+rhdX0WQ8Sh/Jhn
 cZzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKmha0ateRLAtRaILJURisPKcHJp7AcbstWJeE5euFbLTHRl7U2F6aqVEe9u3cxYR0ZrR7DMJA2A==@nongnu.org
X-Gm-Message-State: AOJu0YwXZ2QArTaVTjOpKxPiIiwY5zqiOOYJprWv+fC3S9fK/HHLoDuJ
 3PpPSm+qL77SDVW7VjFQZmYJqpzlBZwFOlMK7Y/OJvygHgd/BBXwJqkCXTKDhXlpAvNtt2/1oue
 XMK3WDDKaG5WeLY9eaNOqNyjH93X4ND6/bzNcbw==
X-Gm-Gg: ASbGncsYsPAzv7XcvmtZspE1C3XcKKX2zqBdJAqbMlY7jinCjmtqU4Jn3DHNiG+gh4X
 kWqOWXXbjr21vekjaDSDnNHlE3dXHAA1k
X-Received: by 2002:a2e:a888:0:b0:300:8ff:d93f with SMTP id
 38308e7fff4ca-3002fc46122mr13436491fa.22.1733491523069; Fri, 06 Dec 2024
 05:25:23 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-30-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 13:25:12 +0000
Message-ID: <CAFEAcA96o0NPtgeRGCdKYML_k0S5OqZJ6pU2PGcB7OzOFVG5+g@mail.gmail.com>
Subject: Re: [PATCH 29/67] target/arm: Convert FRINT{32,
 64}[ZX] (scalar) to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22c.google.com
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
X-TUID: 473bluMDFoZT

On Sun, 1 Dec 2024 at 15:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove handle_fp_1src_single and handle_fp_1src_double as
> these were the last insns decoded by those functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 150 ++++-----------------------------
>  target/arm/tcg/a64.decode      |   5 ++
>  2 files changed, 21 insertions(+), 134 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
