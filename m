Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp416919dyc;
        Thu, 3 Jul 2025 02:45:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXbw+e/x08GBN+fdORgWbNcMc/g0HNnKPqWazp53kn58nfbO2ywwgiDwy7REegdw2lng7w+ZAi57BrqBA==@linaro.org
X-Google-Smtp-Source: AGHT+IHdG6dhQ4bEgQjYFf0LSrbKZHOeJnHNp8tILtJNTH0YI9ohifCpltLgWUz1Tuooe4SO439g
X-Received: by 2002:a05:620a:408a:b0:7d4:3811:84b6 with SMTP id af79cd13be357-7d5c478e967mr892796985a.32.1751535946411;
        Thu, 03 Jul 2025 02:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751535946; cv=none;
        d=google.com; s=arc-20240605;
        b=IOi9l/6BNXH+LrgZFVdbpa36cd9RYo/GZsfbbbUVzewNWwgDF5RgLS5gPXGrbs9IiH
         DbRPHGhmWXueiNW7oHywrwF8PqIdS++6Mby3qyoV/b7F/gviulR91kIPwPKqKdgDa+xJ
         DK7COHMsY3WjuARyV5U4b1KWOMfK30G0zWjL6rqfNYOh+1IJXNR+tSKOonI8I13BNuJq
         hn6XbwWAFyQ4PrPLP6BoHAWUICtrzogug5PS2/8M9CJP7ivobRBEL/j5eu/JslTPvtAZ
         q7lEHjI+bl6S/P/le9bcnqt3A4j8uu43T4unkFnjrsA2HLWjYsf2At2Fw3Wv9L22R85o
         gLFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yqLrDQKiB7p2Djao7wyoxhIuPDF5XbtOnum5lvMNefE=;
        fh=VTkhQBiYsTp/S5Hrq4QzVaCZ+iTJy5WjPXdNo7XP8rw=;
        b=ZQTaKNi1H+Sul5WGPxY2rDAhq3t12rfjilhvP06q3MOK74VL6TVi8ECv7iJs2uLEz1
         MISo5fSrTavV6eak/KHUZof6ReMAl3BupgqY1QJWVWUcS6FI3ycP3kB/9poPYSaTCIv9
         LZkETwipNkoacxDvpxFlETW9Ms/S7mg70UOfVpT0SyWYqVbzJaArZb3pSHYZtglIOFgI
         LBK7wUhFULNvz9fJCjMABNxbBtj/at3se9ADuMacuL9jTDjaxtgCOdW7Gl76mvG7eSne
         Bw9oh/Fdn6rrsltLSO3jaRkQbKFcEcBWH69m9Hn4s223p9IvIZf3VZLcW4nknYSlWU2H
         6taA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T2r9rbFl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d4432a25b6si1409527385a.619.2025.07.03.02.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:45:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T2r9rbFl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXGVe-0005rG-F5; Thu, 03 Jul 2025 05:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGVa-0005nz-3g
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:45:34 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGVY-000885-E7
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:45:33 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-70e64b430daso59420867b3.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 02:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751535930; x=1752140730; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yqLrDQKiB7p2Djao7wyoxhIuPDF5XbtOnum5lvMNefE=;
 b=T2r9rbFl9qAiWLzeAfbv/2C2ItOWIflqxjyASOrs8NFNUrh1koUzMepT45m3XyXuA3
 EMnDfQfg8joHP9tDFHDBKcWHCxO5aSKH7v5gqOofghI3NSeL8SRN9WkG//Hh9UkijUSs
 xiJR+8y+jw7XFY5Pv32oiAgHrIzGqgI0DBuXKfMKylNQ2lDLJaoUmUIQpKHbijt1MPD5
 Hiseo26relPVhvn2O22jUJ1DTo0OQ44ZZzGwcoslLcmN8ZTasXazkSzuQcSlEzxIvFEr
 UYHEbBGRfRHSve/zDS79CP1ybuolH+htGOf4LYmWqtFvB4/9bPeBQIaEAeWFsPVJ2p8a
 Pg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751535930; x=1752140730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yqLrDQKiB7p2Djao7wyoxhIuPDF5XbtOnum5lvMNefE=;
 b=PbKElC2qmxJydshGUF9kWGpsK4K82wWyezb6yODSV6z4brCFgyyyr9WV6ZkuaFDaXK
 yV4eUlR+0GesVTH3KXfFj6ioQ7IEKbY+agIRrPtCfL3/xcU4j7jzUbjwqPNResmD0Rld
 FuAnaYvdXld35DBjlsUx+j8nL1BitJe9gNN7xQ1aAunn6AXinD3mbZguIdedhR4L7KT9
 APdUYnCor2kl26+VpLdPGRcKXBW/1MWT3sjciPg2xIwS50PFjrmikOKKDQi18y54VyXg
 x3xC3MGfGF+HXKDqMhcqwd1vxqax391sUINMDXlgiIqxFMmww00ZMfbgnDjaJFiWI4O4
 9JwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgdvv2LZ353YYk8Z4E3TJo/BsZwHKvxjouB0bIEFB5ziQpUiOgD64ITsYBtRjOmllAX6YaIOiHpw==@nongnu.org
X-Gm-Message-State: AOJu0Yykc0nbmNj6pTRw3T/TnklAr72ccPAXSlafrTG01qocwSchEuIn
 E8u+9Jyy0chfle/cPvPK4Po/7ApUbJS4/SLR9tz81H9Thtw3QelqcnBaRWsR6YNWkie/AH3NNcv
 1DSrzaatSTQyUkDvHz9lS2b1yYS5At4XjYl9RDEqCkQ==
X-Gm-Gg: ASbGncvoIrZnQm46zJYisWVRueL7OyHLdxUtMrOZuANt/p/6eaHulKhPt2g+Xn5lpYf
 x+3PfEjtkutlx9x3E4BD9kH3DDBGkbGI2p4qjm1IflbL+RHs3ErMktxuGLml51c43pww2ap7d/s
 0juLMhS+Yp/Qoh2OAarnxrXyKNKWG4TZ24dzLMOpWG/ORe
X-Received: by 2002:a05:690c:f0d:b0:712:cc11:aed with SMTP id
 00721157ae682-7164d27d0e4mr90397977b3.2.1751535930213; Thu, 03 Jul 2025
 02:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-32-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:45:18 +0100
X-Gm-Features: Ac12FXzYp_EOl4Fj5V6qX_5rlS4wbCmsU_qh2I4BV8fA2paflc3HX76WbAUu6Rg
Message-ID: <CAFEAcA8szLP4mEvkatHhbBJzU5A6w0XGcMRRJYr_HPSNgZmU7Q@mail.gmail.com>
Subject: Re: [PATCH v3 31/97] target/arm: Implemement SME2 SDOT, UDOT, USDOT,
 SUDOT
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
X-TUID: Xty+5B7N9u7M

On Wed, 2 Jul 2025 at 13:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



> +/* Similar for 2-way dot product */
> +#define DO_DOT(NAME, TYPED, TYPEN, TYPEM) \
> +void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
> +{                                                                         \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                                \
> +    TYPED *d = vd, *a = va;                                               \
> +    TYPEN *n = vn;                                                        \
> +    TYPEM *m = vm;                                                        \
> +    for (i = 0; i < opr_sz / sizeof(TYPED); ++i) {                        \
> +        d[i] = (a[i] +                                                    \
> +                (TYPED)n[i * 2 + 0] * m[i * 2 + 0] +                      \
> +                (TYPED)n[i * 2 + 1] * m[i * 2 + 1]);                      \

Don't we need some H macros here for the big-endian host case?
(For that matter, the existing 4-way dot product helpers also
look like they won't work on big-endian...)

> +    }                                                                     \
> +    clear_tail(d, opr_sz, simd_maxsz(desc));                              \
> +}
> +
> +#define DO_DOT_IDX(NAME, TYPED, TYPEN, TYPEM, HD) \
> +void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
> +{                                                                         \
> +    intptr_t i = 0, opr_sz = simd_oprsz(desc);                            \
> +    intptr_t opr_sz_n = opr_sz / sizeof(TYPED);                           \
> +    intptr_t segend = MIN(16 / sizeof(TYPED), opr_sz_n);                  \
> +    intptr_t index = simd_data(desc);                                     \
> +    TYPED *d = vd, *a = va;                                               \
> +    TYPEN *n = vn;                                                        \
> +    TYPEM *m_indexed = (TYPEM *)vm + HD(index) * 2;                       \
> +    do {                                                                  \
> +        TYPED m0 = m_indexed[i * 2 + 0];                                  \
> +        TYPED m1 = m_indexed[i * 2 + 1];                                  \
> +        do {                                                              \
> +            d[i] = (a[i] +                                                \
> +                    n[i * 2 + 0] * m0 +                                   \
> +                    n[i * 2 + 1] * m1);                                   \

Similarly here.

> +        } while (++i < segend);                                           \
> +        segend = i + (16 / sizeof(TYPED));                                \
> +    } while (i < opr_sz_n);                                               \
> +    clear_tail(d, opr_sz, simd_maxsz(desc));                              \
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
