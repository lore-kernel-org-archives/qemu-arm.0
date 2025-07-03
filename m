Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505056dyc;
        Thu, 3 Jul 2025 05:37:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXAvxlS/VGqiBNSsmRoLYVinWraRqFReysB1TNekgIeIefLojtkKrZmWYom5Yqx3Z/H0YDdzXDcJWT/BA==@linaro.org
X-Google-Smtp-Source: AGHT+IGtmb4d6zg5zoYROISLnGVAHJoEFhCKtSc2vFB1rh7wlmyRiNYKbJYmZwsMNlxbF/QXComU
X-Received: by 2002:a05:620a:f03:b0:7d2:15e:1f9d with SMTP id af79cd13be357-7d5c474c08emr1047072485a.53.1751546260498;
        Thu, 03 Jul 2025 05:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546260; cv=none;
        d=google.com; s=arc-20240605;
        b=hksnE0CKpgBGYNTeUwI+3wPLdE+bQ3jg9btR5f0ux42iTnbb3x5mV0WQyScH05zV/H
         uWTUAejb5bdT4IPcvw3hQ4nQmKfs3WEz6GRuq4m5lCoz7yAEuY1KrT1+0dGhy2wqfBAa
         N3B/D77qcizsgQPxoTGu5+75LYxoxRff8fhnnaimjJ04QQQdFwJVrnI7YSlpqJeLYVvd
         t8husbDhW9RTiih3akIxF886UFwSlBkw0T2qAFQ7L4djD7WtCduIh0jutESESdC2668w
         x8yA62oosUVyHhaO1yi1V61X8+fhVyOzDYTaBvH8/fKDwWCnHcK+N7PmmcH8nMH/gjhy
         ncqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MPJ6n38GLR7Tuj9qMkkB0ODgl2ns+5tOg89TACZnxHQ=;
        fh=WOnwnxmh5l70FSOOuug8653iiTEAyE9RewRl2UY8sHw=;
        b=fqgv/LF6eZvkQDyb0nwFbWlVRnZxTTG0/Gg+jeh70gFX4GRetTEVuHbQkHymSvSEAX
         XM4CMbB2ordlu8jhgG6gj+ZFuSup9FcS8W4Y20g3dBKYbmkt2Q8hY5iw11Yp/9hNJrdN
         dqDMaUarcI5eiR0S2EorT2Wqc75/evPJyltidB5l2ewtS2gY1xrOjJDP4IqVHuGGKKHC
         Pct4XX4DCJ7NC/g4FE98pBT2n7rqLxaNBV/Y7JeHNOV/zwCTnZ9+qd9ScUHbc9kWA2oz
         hvCsXGT8z/wJwZOMhZCwoym5Q2JtgADX2kzwoCF/K71MNnQaFGceLKzzludcGuYRR836
         pJ9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qw9dHRNF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d448610a44si1208476185a.484.2025.07.03.05.37.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qw9dHRNF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXJBy-0007fU-Sb; Thu, 03 Jul 2025 08:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJBw-0007du-93
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:37:28 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJBr-0008Er-Ab
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:37:28 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-708d90aa8f9so81170847b3.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751546241; x=1752151041; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MPJ6n38GLR7Tuj9qMkkB0ODgl2ns+5tOg89TACZnxHQ=;
 b=Qw9dHRNFsZ8FFjCAukcQio5+xx5eVX7rX0qJp8qImTD99nR7mdkIimZdVPc4MROWjH
 CNIk6IZTayszzz/JDMeq7lUea7lbJRnkNtkdC1Qr5nyi1tAvFgZyr8rC0qM4FueNxjgD
 7ah2TjCdjILjqX79d6ZuEFshqusHBd0UzCrPeqwq86XSmNDelDcKelmMwfUBNeMS24c7
 gsTIJW2aJryGe3RxQFQ5TYjOItjnmdVHCooDMWePzr64+uZQ2SFur4+K6RjegUfrO6M7
 PUrKpjWT8hYUJAsDoEH97DUhfHnfUEWlv84AGBXBfWtvChNr6nKzX6918tYDsrV7f2Nc
 Mopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751546241; x=1752151041;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MPJ6n38GLR7Tuj9qMkkB0ODgl2ns+5tOg89TACZnxHQ=;
 b=O4thwMmbEOttcpImwzEpX9+BabAZFUkqp/2GmTV1nDnXLNIER9YG24NnAtn5RGS77U
 g/WLGbABAmG4XCH06MMw0WW45F5stS3ESCxYpU/q6MF+/nUBfLeowYdAIAbRfFhYzWQC
 5CUNaIbw9XYgOAYqX342yjr2Xnhr69sJjjXv+QbWATMMRU4H8k0VnnGeYP5thgRJ6Qv0
 O9tfulNLGcZbWqwWQsn9p3x/MHsoDEdiaVPE/gC0I1hJOHdMtncB0wEITcMcDEweFq8U
 9Vc9IZCF6IwLpzrUY3+vsjJQPhZ1iTI0d8HB1Ta2TzQ28Ou9kTkBCq9LbRyM2IEWdU+H
 ud7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSSYWB6SGtv07ceusoErMxwMebX7IKKZ/FoNrxCpUwmqxH3ldEvXCgkYQqVqkVO3JQdeItoc7eSw==@nongnu.org
X-Gm-Message-State: AOJu0YyQsqkRGXcp8ciW/vCbCtS2xYhodSj6xC6HQLfNopX47ysVzyDv
 YUxIqymWYQGGeiPJEPvwB9IlvaOJjDJd9CLSrSMqwws0vl8xzjBTNsVw5DUqzFFJehKZCeoVKdd
 erq1vSrrLkt2HH7FqnX5tEmGjQiyWI3Qx/PeNA6D3Rw==
X-Gm-Gg: ASbGnctr1dEa60JNzlNTTWe+FMubNzmcvtT2w+QYW5cyHdPF4WcFzZxFue9rLDzdU7u
 DgCHcRI9bciMybdQs4bRePJ632iDwRaySwjh5o7MVg3ERYLo7VsU5ZUHedi6L6yLaNyE+cAOJC0
 jPxpDanM5p4hdxDlEyBwOX5dzgE/1fyBMgumCAmmjFA2yW
X-Received: by 2002:a05:690c:9993:b0:712:e22d:a235 with SMTP id
 00721157ae682-7164d4cfc0bmr85299517b3.17.1751546241490; Thu, 03 Jul 2025
 05:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-87-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-87-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:37:09 +0100
X-Gm-Features: Ac12FXyo6jRJcqZWtwxX6dN_fIubiT2zNwp0oj3tqRHbXTG6WH57eCVVhrjkxmk
Message-ID: <CAFEAcA98mLaeB-YV3PZwbUJ+szJM4-GqDCEyC0syuNVrR0kwxg@mail.gmail.com>
Subject: Re: [PATCH v3 86/97] target/arm: Implement {LD,
 ST}[234]Q for SME2p1/SVE2p1
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
X-TUID: kLT0rV9T9429

On Wed, 2 Jul 2025 at 13:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sve.h    |  32 +++++++++
>  target/arm/tcg/sve_helper.c    |   8 +++
>  target/arm/tcg/translate-sve.c | 126 ++++++++++++++++++++++++---------
>  target/arm/tcg/sve.decode      |  31 ++++++++
>  4 files changed, 162 insertions(+), 35 deletions(-)



> @@ -4812,23 +4812,25 @@ static bool trans_STR_pri(DisasContext *s, arg_rri *a)
>   */
>
>  /* The memory mode of the dtype.  */
> -static const MemOp dtype_mop[18] = {
> +static const MemOp dtype_mop[19] = {
>      MO_UB, MO_UB, MO_UB, MO_UB,
>      MO_SL, MO_UW, MO_UW, MO_UW,
>      MO_SW, MO_SW, MO_UL, MO_UL,
>      MO_SB, MO_SB, MO_SB, MO_UQ,
> -    MO_UL, MO_UQ,
> +    /* Artificial values used by decode */

This comment and the similar one in dtype_esz should have been
added in the earlier patch that added elements 16 and 17.

> +    MO_UL, MO_UQ, MO_128
>  };
>
>  #define dtype_msz(x)  (dtype_mop[x] & MO_SIZE)
>
>  /* The vector element size of dtype.  */
> -static const uint8_t dtype_esz[18] = {
> +static const uint8_t dtype_esz[19] = {
>      0, 1, 2, 3,
>      3, 1, 2, 3,
>      3, 2, 2, 3,
>      3, 2, 1, 3,
> -    4, 4,
> +    /* Artificial values used by decode */
> +    4, 4, 4,
>  };

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
