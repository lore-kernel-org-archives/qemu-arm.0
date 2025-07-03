Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp434588dyc;
        Thu, 3 Jul 2025 03:23:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLcEztVOBvxpICUR4CvaJ/rKLXUO5N60N3SGK76lTgW3KTeTa2VwgbT46c9zqX5cH01OrTNsCV9Lkx3w==@linaro.org
X-Google-Smtp-Source: AGHT+IFUHUYkxrA8AxetWThVMb3QtO0Spo2ZrFR3g8xcIAsPO0OCCuZzlau4n9FuoC2DaDFROI52
X-Received: by 2002:a05:620a:459f:b0:7d4:3b3b:20f5 with SMTP id af79cd13be357-7d5c47c07b4mr990677585a.48.1751538214146;
        Thu, 03 Jul 2025 03:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751538214; cv=none;
        d=google.com; s=arc-20240605;
        b=ImySBzCELut0WY+Syh7OG6EhhQ53+bRkOJxIkt5H55IJUaCGbOecnjdoLN0NnzrXpK
         5lpnBEI47XrIN1fsVuSLINRbkRY+sBsSsBmJWf1WcCoDkcaKW2Z4C+JcEjdf3+uok9uf
         VgvsX4h0QkwArDDzooqHtWmN4I5AnhP/gNJ09SXHNJMnau6d9YWnyBBjbjvI2jhqW8Fh
         5oWEnYAVagtEbzCTKC0PGAcB8zxcpMmLnr1dSi9yEJmniPaEJNRUITSRwnMJ4cyIEG8A
         VeUDf85qtRkAGJwytDtLVvs8+MSFtollLAelyaascjlIrDqsg5D6VzTo/JxKm4Tea1X6
         CwCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=e/oZafQ1SHFXKtFHR9vOE777S/3glDUbnaZXGFCDRLw=;
        fh=S9NQ3VMYfkTDEV4NFExfOzA8xqd2haxtUn++4pm1UV0=;
        b=V+Na+4mJNUyvsLDn0ZXns4ZBG6ar+OJM7YoJR7JO/GpveVPXZK/fp8Y6e4GCbnbNaE
         yjbcvQ1YJGkHjONy2T62EWVnOuj0JPuA8MJ+kuFR5m5RSPkJp1Ls/SSYNMbahU5ImQ0G
         oM8mSwnkIPq/09SvNkRjkZWOZxiUQcza8UGk0QO+E1fCtwARo3U48sUoEx63GrhiLjx1
         ArjcM8yAfjOBVwXzI3oaKsfmnYE3yO/B8LHslAsFjjJ1cOA+z2j1CNyq097YPw4BOYGS
         9Sj00r+PFP4W0H0z/hkw33XfWNmkk289ujxjWlRZo5zefXEFkMKXkBllUD4kownIsQuf
         lPbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hX0xtgZ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44e147630si1200928785a.365.2025.07.03.03.23.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:23:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hX0xtgZ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXH6K-0000u0-R5; Thu, 03 Jul 2025 06:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXH6I-0000ro-NH
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:23:30 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXH6G-0005Uu-0g
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:23:30 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-714078015edso58607427b3.2
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751538205; x=1752143005; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e/oZafQ1SHFXKtFHR9vOE777S/3glDUbnaZXGFCDRLw=;
 b=hX0xtgZ/BStin2OxAFmnEjvcMGH08V4ZK/MMMMBNmGs5V+pIj3qsoSMJ7n8aokhsy/
 bkdlCMXQreOdkXfe+zUFEA+Dhm0EuZYjvAm/6cQeNNKy4PU6j57Eeyf0nZdrMEBi1KMc
 BP+KJyXxL26s9GvXzP0mDkG5JBp7ghodP5eOGyfVXSaadeGMT3/6tu8hXOEkUvlzKTmp
 DoQbwfm0u2ThjRaEeZ/Fpfhq2ioF97oh9aZDCLjnEhDo90oEZerc3mzm6TxFhi0fnyuh
 bvpWpPKdnMZr3pYpTWrlMWtOtRrWeZ60+UyxH+4ZwUKbFWnjRoSVpNOA83QCvLf+cex6
 yDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751538205; x=1752143005;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e/oZafQ1SHFXKtFHR9vOE777S/3glDUbnaZXGFCDRLw=;
 b=mVvcjS1jGPc7ogxsfp0a0oBAZ6zuhwfG+5ZmEVS+HdUjvnenZm+sk+v48Tos3EE624
 qIGr6uxZdEtEl3OmDzYZ6kc6ZHdlxoqD1vV/Hm2fd0K2gAuHDE623KcZKASiVbrXxfH4
 DNLlVWTQoaRcTN9b7Tal4wzb3aQTT2/t1HtbwxpcIizQrCQXDK19Olmg9HCyG/gOox0k
 U5vJBpwunIQ03CRew93zQXZI4yvX8e3Xqbt3WTX6vhl6i8yhWwgty/gtjOuhYOIhkiA6
 3Om2qJJg2X7cnjj6F7dYZcH6/nTAPBIU1owzzCENCjXvK2TCq29cwhdgPvIfktuWqIlT
 XpjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ++wsXxDYFkDfKfy/4zuFJ1ogOuO9WND2c7lTUKUjCkGslbZOQqL5kLi3VBTSmrkhU2Os0IMesQ==@nongnu.org
X-Gm-Message-State: AOJu0YyG3MsD3iWDTKbVjO2NDE5OgGCsmUAd408lNjfr0IawdQPPi1tF
 /pgeMjKtWOKnDUWC9ZcA7gQ+6Wf7vw3Q8xniHUfvlNuphQDDsxZmrLHppVyceUHiL4lLfstJHYG
 YlkXwKkKLwxnx7uAqPL32UUXdGunJU6XdX0nLRORGPg==
X-Gm-Gg: ASbGncuY1wbvzRvjHCQDL3UTbcdp6eynKp1pWwHpfZUH2t9YH5sWzdt5MluvKas58MW
 nkItJ41Irjr8yL1lJXa/0jhU0dQpIHEs42chQ/7WS8gLvwp9oTrRUvpnREc7JdzrZBWM3ewuous
 AOBcPDm8tSRC4MtLU36XGpxrW0Qb2oLcDBUNZs0sEsi+wD
X-Received: by 2002:a05:690c:4:b0:70d:ed5d:b4b4 with SMTP id
 00721157ae682-7164d3f1568mr87072597b3.24.1751538205370; Thu, 03 Jul 2025
 03:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-52-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-52-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:23:14 +0100
X-Gm-Features: Ac12FXyvuCqiz7Z_h0heyZeK8LEa39VLJv7yOKD2rBrsjfFsCDyS898QFcACAHo
Message-ID: <CAFEAcA_2pQAQ6gnoq14xDBEFJKNg0jiuW0dtU2g-tca9f7JSXw@mail.gmail.com>
Subject: Re: [PATCH v3 51/97] target/arm: Implement SME2 SUNPK, UUNPK
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
X-TUID: YkO/kZ7gzH5N

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> +#define UNPK(NAME, SREG, TW, TN, HW, HN)                        \
> +void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
> +{                                                               \
> +    ARMVectorReg scratch[SREG];                                 \
> +    size_t oprsz = simd_oprsz(desc);                            \
> +    size_t n = oprsz / sizeof(TW);                              \
> +    if ((vs - vd) < 2 * SREG * sizeof(ARMVectorReg)) {          \
> +        vs = memcpy(scratch, vs, sizeof(scratch));              \
> +    }                                                           \
> +    for (size_t r = 0; r < SREG; ++r) {                         \
> +        TN *s = vs + r * sizeof(ARMVectorReg);                  \
> +        for (size_t i = 0; i < 2; ++i) {                        \
> +            TW *d = vd + (2 * r + i) * sizeof(ARMVectorReg);    \
> +            for (size_t e = 0; e < n; ++e) {                    \
> +                d[HW(e)] = s[i * n + HN(e)];                    \
> +            }                                                   \
> +        }                                                       \
> +    }                                                           \
> +}

Similar remarks about the "when do we need to copy" check
and the H macros as patch 49, but otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
