Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp988543ejb;
        Thu, 23 May 2024 04:21:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0qfuXjyWQw+u3bvCyODkh/+3CQ1kzRjbRFhPhBX7uhW5Locdy2fdNgf032ZNP74Gh09/vi0VZFdlcrPlVqLTh+KMnMIlQ
X-Google-Smtp-Source: AGHT+IFD3KCMigXiJjkWS/7t89T/wTtV78+L7dy9wrzABGAsFYWwW++Bz1Xf/olpKdt+pzJ2TXNH
X-Received: by 2002:a05:6808:2389:b0:3c9:c9b4:a9db with SMTP id 5614622812f47-3cdb854e44cmr5843519b6e.46.1716463274885;
        Thu, 23 May 2024 04:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716463274; cv=none;
        d=google.com; s=arc-20160816;
        b=gFGV5Mc0OrylqO7KvnHOe+0iGzoflqNk6swFrwcJsoui/a3Bcgrzdztw05atBQcpCW
         15NDEo4JNsvrROIdkcJwjFEd/ZQh1mzwCSpvSCb+SPkkqCU9WvSY/XBfGaTD11RmbADi
         /0vGqWPndybCXduVQZVywJ9e7gS4vZRq90jTo4/1o0tHioCbJvbejE4/URAsS9rFxJyk
         w5tSanvtSSlvD4uW3kYYj9b22duSq2620zeCT/9IK+uEu5Xmhbv8qAbdnlmnwXJmR/gk
         yFmnUUaKdTzTPEvrfsYQ6bsp2ynX1yUNRhQCmkB53sSdPoSSyQuYn0B4mOqAhIqeTnfz
         PRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3TftuAjqYhvVjsSBNnC7HmXavSpZdwsBZyLQvBuHfT4=;
        fh=6f+viIQE7HOwmseRYfaSYnxEKi4qD5fYaBNZ1cQEf8I=;
        b=Lb536B5tavQCCRXnCDXUScigQnAgLA/IiUo9LPB/WJY/CQEPvZ02A7NQ0xttmikqTz
         uOah712XGXKr3G5Ueeds9KOBUvZtrr9vWju5l/mK9ZRfqTkTV/v7GAEyGrialDFLpV78
         YbWAI5oYRiU1SI9xfskgJyPGjFKMBIwKAOqycjcxWWVKECOGQjUamyjoKittZkLEWShr
         FwwwltDn01ZRIlicNmOVB86Ogm5O09WFGNoZKVqnWG4H3Gi7gsPob4eyy23zEKFK0ivY
         yRR46nxx/Is2O64lj9aZiMJUl/rdViheuyZE79x7K+nUfHh7q8XEGVMH2DEpLBB3DMG2
         azdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cpxtarhg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf38d815si3464226385a.756.2024.05.23.04.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 04:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cpxtarhg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA6VM-0000Jb-JL; Thu, 23 May 2024 07:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA6VK-0000E8-0p
 for qemu-arm@nongnu.org; Thu, 23 May 2024 07:21:02 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA6VH-0002FW-1Y
 for qemu-arm@nongnu.org; Thu, 23 May 2024 07:21:01 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-572c65cea55so3438356a12.0
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 04:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716463253; x=1717068053; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3TftuAjqYhvVjsSBNnC7HmXavSpZdwsBZyLQvBuHfT4=;
 b=cpxtarhgLKLaB8yWL9ZBk7cper6/b6EZn3Ffd1ho7YQA0YMfRVr7FKKq2FClDpvinQ
 u2u8u4I8xKYGYP5IdYpKvztCKlYviv74EmHNx47iHIh6rlLBO5NdCo2K5qw8B4nzyakO
 rx8UrdJMpf/AKrC9jTAY4eAwSEzeL6X/OAs5TQ6mDN/CKP6+v/5UqwHcmUhoquSfomof
 hvr1bg/ucWc37Rchcn0OBymQkiadRNFQBXcSb2OfVz4HiGt2KVGy08rcYi3/yWvuSvQK
 8BcZlC2qzbnHfIqaaF3Nds9wMGMFC5UW+dqoqU8OJBOkNMj3F72neT/FRd01b37hfD9P
 FcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716463253; x=1717068053;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3TftuAjqYhvVjsSBNnC7HmXavSpZdwsBZyLQvBuHfT4=;
 b=dnApIwpy9ZJqMqwJje4RuZerNaAqQKejT6Jj5M42JM53H5tTswSmaYKUPunDh03Fcu
 pO4J7uOvNvmA51Ow5bq1WPKz+XTYwr2x0Rk0jlJGRDeDDFgNaC3ze42bkXbniWwOg9ks
 WAnXbP0Iy8zyAoLSUa6irLVa/5ycy/NZoasf4k7swACFzrh9LkwSIXAKihwqfTzV4gzo
 CUS0vMeRNdRx56WVCHFU3M9DFbHeyJ+/e0sRPF2s1WptrUECAPKHHd9QwJOtcP7jFPHo
 YAq0n03VM7A1EWjSczdKCKkOShganqTTjwqAFCxAEBUKpsef1qVyoLj5AAQDvqV9Hweu
 gkyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUIM4ymP52PkTXkhQIeXcPCceQbjpPuJnwAfi5FtGj+bxmxN2MtFeUzBYd60GAUJF9nI/TACzJr9tzXZ+QkFAkdati
X-Gm-Message-State: AOJu0Yw1Y+Urvf5Tzy5BXKjHP2Oh4eKr90aTS8t+wPFfoVUn06uAPGHX
 Su9TlzmSdZ5ixHCRCUMPiS56yUhRdMYHjfd/BMg8R1n5VPoHB2oyWLEjuHEHybX+RnYUANHPZma
 DiWqJF527zBZT0WMnczHYGiY24GTnj5X6siLmjA==
X-Received: by 2002:a50:a69e:0:b0:572:a172:be71 with SMTP id
 4fb4d7f45d1cf-57843ec07cfmr1567426a12.14.1716463251787; Thu, 23 May 2024
 04:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-12-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 12:20:40 +0100
Message-ID: <CAFEAcA_DOmefxboeO7jDHBJ43MxCkfGGj-Te=1gyx83LTY05-g@mail.gmail.com>
Subject: Re: [PATCH 11/57] target/arm: Convert Advanced SIMD copy to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: dtR1zLdAMODb

On Mon, 6 May 2024 at 02:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  13 +
>  target/arm/tcg/translate-a64.c | 426 +++++++++++----------------------
>  2 files changed, 152 insertions(+), 287 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
