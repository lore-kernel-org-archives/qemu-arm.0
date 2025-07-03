Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp499985dyc;
        Thu, 3 Jul 2025 05:28:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU7OrGiViCaq3vZ5Kue77vPpmwkpDI08wFA5CMfZuPZZlminKmrGM3ECtKQgp9kXqSZAS99Lz9L7K6QgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGccQoGaTNz6weyl2bLEQr+xg+ClVZMttCWldzq/OA5p2IJmNOHsrfVgPrsgawg4ISgf1PN
X-Received: by 2002:a05:6214:2526:b0:702:b1a5:dbba with SMTP id 6a1803df08f44-702bc89db00mr50503876d6.14.1751545716574;
        Thu, 03 Jul 2025 05:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751545716; cv=none;
        d=google.com; s=arc-20240605;
        b=SQJLipDB68xs4yZlLrS0lMjKJRAIHkjzYmCwQ9Wxjk0w3DdKlQ7Ml92m8ObR+5+Rny
         cE6OrYGZKAd7Ipmc1exHDByrFFLg+pnn7v6EXGoa5TVXsT1zgHBJxX6WcjmTsipCIOPU
         QTYRdMaFV6u8/07wf0Xvj0sv1d++KqyasDaOtN6mllsRKBnuaZMcvsUvO9uxwDcrqgQy
         Im0luiRZCRjehAtXuUUD9pZ9m+Vvx0ppDX1hRkWx5ltiUFFVNz6et+frRaRF5KDr+gJE
         /Mzzmdoihut95FO/u0qfdOqGJHgWSpaNyCevOI+fPVHJeXg8g8rORy0ObO0Udk8nx/D3
         XwDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Xf3Tb5TfkpORZ0xl0voMW56/SAE8ScUjNkVmtD5Id0w=;
        fh=e2cqSZGaRYcalSqzgAhUo09jyeXSqdKG+i7/PUcUUAc=;
        b=XxJFHSeEOIDm6TOCCNy7zBLIRd1tJpBuE2swGWQcoNvtFBXqhlYphK8PD4UCWP7U+N
         PcMlyrXf/k6z/Um2qholL1n6j+YkhW1zkPzc1YTCowdWw+Jkt+c+VOGu2/FVIOB8HrB6
         HaywucQhzhuPonJd/d7iL7o0pFhfdApmyPMZ3/A7fgxrgcycsSCgnjsAUHgUqJeMioqP
         6q6p3tesZ1j0GGZExp8JIg3y9w6y+LCf10QIN9WgsfN5O+3DF/opKIJIlKDPbHVgAkG0
         mGFmLdWL6QdKG5JYLoTnUCKutIft4PgRqoSpZ1il/YCi1sLh63eywbu8nott52tnBEyI
         098Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KM+EIAOb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-700c21b7bcesi127655876d6.449.2025.07.03.05.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:28:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KM+EIAOb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXJ31-0000eR-QD; Thu, 03 Jul 2025 08:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJ2z-0000cW-IV
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:28:13 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJ2w-0005Hr-Pq
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:28:13 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-70f862dbeaeso58127817b3.1
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751545688; x=1752150488; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xf3Tb5TfkpORZ0xl0voMW56/SAE8ScUjNkVmtD5Id0w=;
 b=KM+EIAOb4qEwoc2WcGOI4wdTkLVBB1d0BHLEQ1cCvxoGem12fxN4kHvJyty7CNbA+f
 XFjMpTgHdcgdCECtUN0ao9rco5+hcmkBOawHcwYnPeS5zBgy7bdvdL7xcsaQH7d8agSX
 sAGOhDAVLGEX4mPJg3wm3oZQ8kNQ0gPvV1tB0MoOpe97m6YrAKksyaPm6S9Wo/Pg64br
 sl3TMxkuMpK/VKmE5JUJm4K7mBeil3YdGtoIzritLGYjWIbjqRPTeXKUMlSmdUrlZjMu
 Kaz7ZjFy7h3pA+MjV45A4YD/tW6wHr6CxM+3eN50lBIfTWHhK7ZX3Gs1nd6IUWH8tHLw
 T1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751545688; x=1752150488;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xf3Tb5TfkpORZ0xl0voMW56/SAE8ScUjNkVmtD5Id0w=;
 b=BQKT7YxAlwBB9FzQDLPd2RO3owC/NKtyr2NuexFVpm5IGMMqTU5BfVVz9XNJpDN1Fc
 2tFeCjlLjDUtWawDKwUQhmMNlzfbLIvPlbUx93WKsXtp/1BylUqQ11JVF54cyPX/hh0y
 wiTItknHC1fFtPjQ4tmx9ObmEbQZdthm/thobEIjMb7/qHxbHf1CVXTdjjagzIia/YRY
 WR5OgPUx+aWxnb0zzBbqFNAf6hXTTuT9/cnuVz8Z7CiyuftqL5cs8HrDBK652WGUX17n
 PQVzz6fy2+ZckeWHSMI2SVcRB7ku5MQvqIft6nooJvbKW1upLq3g5kxvF1VEWa/O0Iqe
 N3Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfkBJNlB1CAA/yP2Ugq6T8CX5ENKzCUPRnKXqflqNUBrXYofponBpLz6TAODAmyjQXuGCu0qeJ6w==@nongnu.org
X-Gm-Message-State: AOJu0YwLTo+Bwx/lVA0fnf0DuQFP6COqRE3XjBoSZD5AFENMRz0P8b1N
 kBYQtFz+CQZnM+nKBSNrj4XX4dfuz/7LAbM39qYdTv87r+sdFqL457dUc/yNI+360ie+++cXxc4
 jqjQDG7xBdaADvCEWYinoIrGoSSDulCN5Gdr5R33jhg==
X-Gm-Gg: ASbGncuv0N2NKyWyiTyDu39tQLkvr71IWK/uhAYYm0CmOjgReA7V6CilF2gXAYIhgrn
 qNcPpld60aEKpQuNwFE/GiRHCBQ8L29ceYw2u/FZTOraQ6hebZFZyY2sN2kMQkUhFuL3C6bXi1T
 XAINLD7vgsT0wYSaL/e22vFmd4UgYKsE9RaRG/VFjzDMdY
X-Received: by 2002:a05:690c:48c6:b0:70c:a5c2:ceed with SMTP id
 00721157ae682-716590e59ccmr47950257b3.25.1751545688227; Thu, 03 Jul 2025
 05:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-79-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-79-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:27:56 +0100
X-Gm-Features: Ac12FXyi-oorqMr2HfohgtPrRDfgaH4BBhlRKFot0r5nJ22PJe6X7ThkO1MJE-I
Message-ID: <CAFEAcA8xjSMXYkhUWwf0fQo=r=4frifLbpi4dpsyR+MMnNMz1w@mail.gmail.com>
Subject: Re: [PATCH v3 78/97] target/arm: Implement EXTQ for SME2p1/SVE2p1
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
X-TUID: QH50nLkIYnnK

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c | 49 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/sve.decode      |  2 ++
>  2 files changed, 51 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
