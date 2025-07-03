Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp490187dyc;
        Thu, 3 Jul 2025 05:11:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtkasIH2aMlr4ULqr81zhEFkhxjYVrbBAcLGVQq+cQ36o1+HgPTjG9UMYuIjsyoSudzxh0frz7y6g3Ww==@linaro.org
X-Google-Smtp-Source: AGHT+IGeTbbdxadEchjxYrUwyjjmSM1TRkEyZ1fZGtbzggAHX1//0ylZHC1Z50vbgxuA2zOmhOcW
X-Received: by 2002:a05:620a:24c9:b0:7d4:4f9e:67a with SMTP id af79cd13be357-7d5d1c53969mr524447785a.7.1751544707093;
        Thu, 03 Jul 2025 05:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751544707; cv=none;
        d=google.com; s=arc-20240605;
        b=PpErCYA86thkrz5R772xFwL3CmI2l/W7Dlt0ymgDWS6HpSnTjBBQg7qsA8KJs4ZSCP
         hOLucrKDEefstzN7cifUBu62bVg3bL/t/jxMpBKOZTmtcRmJn87k2gig7l2FHDeuOzsu
         kY0eFJrWbvNmfglGv25s+GkD5OFubhtdgT5llh0bpJRBgCZsux2bAZZWI04jaOhwCgj7
         uNLrbXYCYmAFSyinwyfEhDzlXGGhAOnPRD5KMUSpNZF7NWz2PHc3MIqYJeQsyZjqDgdt
         T4uJssa9pNxqtZNnLBI8GCfW+g0poHKRCW4ogWHeHC7NF2oEquG+su+yPdXdLCgyBlba
         FQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dgz7imnHQF0ifdiqI4VfQAm3LZ6FWHtpQJA9PVJnEfQ=;
        fh=efGFNFyLT0MdxANkUQnNZgZP1+iABMz2VgAP61PwqHY=;
        b=aTOlgD1LVIb7A9M2LutkeeDLXR0w6GwAl/o4ONR6lpc+cu5Rt5ppP3vDEL9xDvhIZC
         qMNWvl50ZgvWG7M2cR/kAP/CparBj5V7rwVUfJRoSZrLudkQdGkrOxUGALQfIgZEwVHL
         QARRGYWjFUS8bFTws6fyzxxcWD29dA5+Vai2BW1L0XqhwX0Hph9I2ghJBOnmE5UYjpyg
         BRILT/3V9mtJ2KZzE0bF5zjHeywEeYz+8Zw61Zeik9JxaK6F72B9YFYGeeqqMZQ96USu
         O6g8PDcBfzIhfT9aMOmG5MxybhFxT7y2z0h2P2jECJiV4pBPEgqt3oAzB4WHmbSPAvDq
         Hl7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kRmxdpMt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d443193945si1435045485a.26.2025.07.03.05.11.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:11:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kRmxdpMt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXImQ-0006pr-46; Thu, 03 Jul 2025 08:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXImK-0006pR-NP
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:11:00 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXImH-0006cc-UC
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:10:59 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-710f39f5cb9so77931867b3.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751544656; x=1752149456; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dgz7imnHQF0ifdiqI4VfQAm3LZ6FWHtpQJA9PVJnEfQ=;
 b=kRmxdpMtzR6qbjTq2ZG0iYaQfYM8Uxfbfc3fvQUQiBMXkBJVMerr/vQxiaEiVDNpS/
 CFMSNx8tUG1FMaQ0zn3/U28DnkmmC95Qr/YXZ6hahVXJ2581JPJF/LrpiRu44w65pjT9
 eg3taXLa9YKXTYKTatavbf5V+ELTQFdp0U7ZStmPtaadRq81FTIKPM8AJupmWc/Aqh/7
 9tbroWTGinb3uh2Vzm7T7VV9iJBYY3mYJ5F0jxvtj5bsK3sW+dnjiIO/7Y+mNv5Lu+Vi
 DI/N/EiPXHH3OO8KwcZBGGnNKtbXxcMMBd9grGZAxNgmA0EEmSZiXOkiELVK63/l8EHN
 pEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751544656; x=1752149456;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dgz7imnHQF0ifdiqI4VfQAm3LZ6FWHtpQJA9PVJnEfQ=;
 b=o1CME+Z6qnMzc+sOpnShXWWtT1yDLJizbdnTrtLYi5KiVYxUVyHs1B30XHXgkq0QYZ
 0o/ieJSmPzT2YaI69zkDJ5jS9hNekHrgTkDx9u6Ah318OK8eDKJT06+ZRdzFm6JEbBgm
 18PHND6Lf+a4vWSYnonm6KYpi40A1N6aP6rdPyOuyixsM7TuMb/xTFnBzTiJYJO8zwW7
 HMUusTNRcj7r0JV1Wjhm5yyriB5ZS0fBlkRfAOk7lF901bBndVmaJWWJea7Chd7nTrAp
 94wGIV9k0hAfiLF8QWbnKgA+hV5O16eYf3fxm6YFO4tPwL03Bag/4zHeRGvonadW80Ht
 gB7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUZ4PB9qIQ6at/tdc/dqi0Or50iBCUM/EKRcLT2FA3kvzRkcinxp4vtHeNo0IW+zwyKPefXHVogA==@nongnu.org
X-Gm-Message-State: AOJu0Yxd2GvJX9xBZprzh2OHVhCFooEVcLnzJ0wPLngDFfi4yEsPsBUz
 3Sw9x7gQD0XirNcHZmcSDEVp0OHMovFMaNn50nkxnIBe++HQepQj67FYSms/I/q3vkT7i4wzWhU
 NUisE/J+PzjJjf5VvHxECw8UNjbBAVnclLHE0AOzx4A==
X-Gm-Gg: ASbGncu4DB78GRs7WoohPrKQ6mOuwGSbv+y7XpJ12sT7wGn9ZmmTtSAOHtO91fqcZia
 TYCHLu03R6W6Pbr1eqQX7gOYHJoCd5Gp/uIQYc12MwyQd5nl8CgYBeLrW7Qd7yyMSVWh6xjFN6W
 8pd1flvmzw0d2TJrFdExbVLYf9Ilo5+HW+ytoWum3ccLrz
X-Received: by 2002:a05:690c:b99:b0:710:f025:4077 with SMTP id
 00721157ae682-7165a32011dmr40496527b3.2.1751544656315; Thu, 03 Jul 2025
 05:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-66-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-66-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:10:44 +0100
X-Gm-Features: Ac12FXzIWLhrNH2p4jIxnuGLpYjhW9qwafzHzp7x7poguYKFicI7CJhACrvhdcw
Message-ID: <CAFEAcA8m2BO5wXY1qYA4HXMKZ-D2+oycdOPpNjXRcTPwBwyT-g@mail.gmail.com>
Subject: Re: [PATCH v3 65/97] target/arm: Split trans_WHILE to lt and gt
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
X-TUID: HvKeyoXF1p2z

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use TRANS_FEAT to select the correct predicate.
> Pass the helper and a boolean to do_WHILE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c | 23 +++++++++--------------
>  target/arm/tcg/sve.decode      |  4 +++-
>  2 files changed, 12 insertions(+), 15 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
