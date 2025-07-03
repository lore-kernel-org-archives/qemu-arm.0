Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp498644dyc;
        Thu, 3 Jul 2025 05:26:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXq01SDJ+hh8PMd/Td53bKtcrnZDfLuU7AOSGqUQ+1LkRcly+eN94D7UqjY3vBMCEB+fIfMTCaFvTUhzw==@linaro.org
X-Google-Smtp-Source: AGHT+IEn3JFhzqW2XcEJorROw2frUw0OPz91irruxeX2gj0yjJEsvJdyBCkL6Pm75+7tE3K33Ad2
X-Received: by 2002:a05:620a:430c:b0:7d0:9ffd:423e with SMTP id af79cd13be357-7d5c47278dfmr841931885a.13.1751545561408;
        Thu, 03 Jul 2025 05:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751545561; cv=none;
        d=google.com; s=arc-20240605;
        b=BRwb0U8o/5fGshItF4abdzAozRY5MsgUJ57QEWiVgZj3Pkj/hx+GMz/l2GeLpsiRuz
         OA2tDpXrDO/DYdfoWFUzwd1RBPYXGp+Qi69sClCO9uHI4HdYjutxbqlvesvDomuVHB2F
         P6P+j1/MhstJ+noRg5vG/O6TpL20CgoAqvGtjY4ee6zDrZxf8c0NMbABNGuhNih4jDB9
         bd7+qTYgHffQ0gTx4/Nbpv0IiFUo1Q0Pr7Nc7itbSwMBSPmtK5ISbhKHU5Y2Lj9Sa+eJ
         lj/ekknSBfX5gJ7sSbe6XogO7rEtIQDkadyG+P7wHcY0xQHZGj0nW5n+HaXVWX+ujGCZ
         /gcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bmecZQBb0PEqGfoacdtRXbVB2d6kRaM/CQtMXfOPPXY=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=Ui1lTprcBHgWf5vGJUmOZ9F8QKKULq1D80/raghtEmJ21WnIjABz4kwIMeXh1RiSg1
         j0x680nmq4/7iuqLLE/m+XuFHaG2Fktx3DbLRakoGI+fLOxEStDtpUQZBXTldV+UJVBG
         T8N9PAvkicYUmr9Ubie+yxUCWUbzssrXB3GI8DU24QR30ZjAX+QQ+u/Yrp+kf8MLmAcw
         /cLfQbJ14BhS+azl3ERF0t+Q07+qZ8baQ6V1fu2tzepcvhspRH8e+Bci4ch+WJaHXsYR
         SaeZAiFtMnttMhNDJ1luuxDXUGfBEl9Y2p+Pq6Z6K6AhBJmAcLnjh2LOf9YNAimCEAaf
         og+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HwtJ6+gz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d443288743si1388187185a.524.2025.07.03.05.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HwtJ6+gz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXJ0g-0007mO-Lb; Thu, 03 Jul 2025 08:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJ0c-0007ku-A8
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 08:25:47 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJ0V-0004kY-26
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 08:25:45 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-714067ecea3so44127397b3.0
 for <qemu-devel@nongnu.org>; Thu, 03 Jul 2025 05:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751545536; x=1752150336; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bmecZQBb0PEqGfoacdtRXbVB2d6kRaM/CQtMXfOPPXY=;
 b=HwtJ6+gzD//xXNIb6HL2Zg4Eo8IrN5NZNBY+TdKSqNIFwq+epz6+n+XrtEP9a60njH
 7fFfuV/krt9qDmuYgSDZndTFWAX3drEwhTA0PlIIId+fY2vmcTaPtagX2kjFgO+hHcEg
 rO/gBkBrxGYSSNjdjtygAKzHCnxFqzR09t9kgfIFRrJBPvj6LWlh3/F5fq5lEcHOiTbR
 autSuNkxGpU1mAU2O1Dkj501Y1ykbkZjwBF+NNDupFhcpsMGX/faawZ+hECSJhbJEjl6
 vTqvZ4HliPSTpx4TledgcIxwBLLpm/uH8zQv5J1WOmmfepOUP6r0/XV6uNy+KGmjMoO9
 i9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751545536; x=1752150336;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bmecZQBb0PEqGfoacdtRXbVB2d6kRaM/CQtMXfOPPXY=;
 b=wK/RgK4z5SZkzSC9lvzPl7JsCkhEvpKE+X5ue2HacumaJln5O/X2+6+bgRhTLSASso
 bkMJQ/XKvvO/RiMFy5AYbeDNNSYZzmNJh2CmmFgbdRosYSwsWzijsDJ8bq3WhhMGp2rH
 1SeC9uCo8VrQwYalEr8yckAg7yw0w+Kl/sDcG+p3gBvXuq+EQXevP91gefHRQjiVvz0m
 qeX2yE+iuuwBExzM6e7KpiAOsB40nWQNT0b3qRrbzrTXcwHpRuEFxh4CSrC8ZKKVf1gn
 ULoHzcFZ1kjZ9hyzsmjmLn8aTlJrfD9mGXZ+y7pGHxWqrL8x0TistzPUX3aAgDV6WhMc
 EpMA==
X-Gm-Message-State: AOJu0YwWggKj8dp9qximmrgAoWxO9kiX07xod4V6Q4vBEOkj4VkZWbSK
 sQKE++iaZ+ZrLdWFCyyR6K0Hvy0uywAmaqPDh5n+gvDq06zyeZ67SxUtrdptW4E4NNoD1uCPIQW
 Be2MjnieTR2lhiy0JUTloKkogQjm7WXzQammZI62K1siYjCGWU+zz
X-Gm-Gg: ASbGncvbPsmkHQY/uUn7ybOshcgrIY3gUiSghrq0qavGRp/IeYneIC1ERfEMbrgtvIb
 Km/TJnLKdiqFuke29rkwD6qkUsBzq8+4GSWTGd1hJSHwqaM3ao/rr6+EmrMJkGRp18F5hG5yMWN
 6Fe0XedwaluOCDtFwkPP+Ib45JNlS14bofgz85GITRebqK
X-Received: by 2002:a05:690c:385:b0:714:397:a3ac with SMTP id
 00721157ae682-7164d26d2b1mr85684157b3.8.1751545536084; Thu, 03 Jul 2025
 05:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-77-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-77-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:25:24 +0100
X-Gm-Features: Ac12FXzUhdmI8GzG7zqm4NkDzPZgwj0_wlVPrLYt-s9Z_xfprq50H-gwLmPhzaM
Message-ID: <CAFEAcA9r=OBH0Em92EZb9rHMtyAHNuFprNiEjKy_Q2bQsm8KAw@mail.gmail.com>
Subject: Re: [PATCH v3 76/97] target/arm: Implement CNTP (predicate as
 counter) for SME2/SVE2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ck+j6xnlZPFa

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sve.h    |  1 +
>  target/arm/tcg/sve_helper.c    | 21 +++++++++++++++++++++
>  target/arm/tcg/translate-sve.c | 30 ++++++++++++++++++++++++++++++
>  target/arm/tcg/sve.decode      |  3 ++-
>  4 files changed, 54 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
