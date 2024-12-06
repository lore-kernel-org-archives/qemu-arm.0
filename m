Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp962838njb;
        Fri, 6 Dec 2024 08:12:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVI0xqcIdFaZvHnqwWi4NDbBpF9iQvIeisgmM7ohExl/GjkqmljO/MKmiwSjVkblsTOwHj5W5eBdGMkNQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGqy8wVJfA3hiE56DXbwhZA4lVIcgeuRAJ5Xt3UEo8C8eJ+bQF4nLtwKonr8q7OW3Eooq/Q
X-Received: by 2002:a05:6102:ccd:b0:4af:cb35:ca45 with SMTP id ada2fe7eead31-4afcb35ca88mr3771515137.6.1733501565683;
        Fri, 06 Dec 2024 08:12:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733501565; cv=none;
        d=google.com; s=arc-20240605;
        b=IPFrbz9nKhBA2l+wScJzklo/l4EEsmFc4YXhSS1WibP7IOLvyMWrJXu8jJ0YyarSQ4
         YHBLH5aD65dV9g9snin8B0cK4AmcYU3ryLdcznGbypj8zHZYRoKshnuZ3oSTR6NhHCst
         2J1uWj1mf1O397X+IEMjCJ7ub2jgHIP62FP011nZoQMn9WHNilRtiawv8iz1mrcWct1+
         SmRGSxsQzfNrr+d0ZjI8ADTy8P3XdHP1cXqPria8dGWXx/zhlb8O2jp+6aAn6qlPWDH0
         YfBZQwPJUNw4BDEeglhaxvsuYaXtXEK+aKLJsDMw3kjQ09OECdYJHxMSpRy38wM2HVSN
         vL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+TvohvwF7sIiq4yJFQu2i4lbU2okTZinLyLmTusnUQU=;
        fh=RnUR1eGgbU2cT9FlXYRHL2Tw2+rtib4iJ6NdQxmaY54=;
        b=cIRzaN1frP/eESYVGCnPOGgZ2Or5lYW5CT+pJ3dzBZWnfHCXga9OSFQ7UX4IGJVzBE
         l9ymo8MSjT/RouOJ5+ooJdy9VjkBMHmq4l7LhtVIIXydceUq0qAZ68dkFmm6Bd7U31kl
         N5L4h83slLeyc1FMKpF+KGufaysiqJceaJQsTwb8OCUW9BwWDHErWmLYReosWYAUK719
         kHRbENEVwqbVJwAQhCkXefMxXNBHSLGwWIv+Sd0k9RBNHg3Ii7IMU3UZFz8BOgvg/Nfy
         bA2DCaGI6+Tgg0rpOgm+xXqsZZOphyjKIXdAGezbcG3KBmL0nTze+l2JBpbma6yQh7GC
         sJlA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PMe7C3Mz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afbc6943d9si1243527137.220.2024.12.06.08.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 08:12:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PMe7C3Mz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJawf-0007DX-1k; Fri, 06 Dec 2024 11:12:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJawc-00079Y-Sn
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 11:12:42 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJawb-0001gE-50
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 11:12:42 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9a977d6cc7so313715166b.3
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 08:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733501559; x=1734106359; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+TvohvwF7sIiq4yJFQu2i4lbU2okTZinLyLmTusnUQU=;
 b=PMe7C3Mz0C0lLJgCwjTxpsYk3v36VmKK1QwCD244ZNtCAhJJGlPD46yi+4ix3v4zoI
 u3OY9yBFGLQhs3nsZ6nocrsXK9O1VSjsqP3tAM5YfHJWJEg60gMFwbfcN49Rrt9LuopN
 YBbdtu2GatK6Cw9OGDdLGDHWLSXcRKKAP0vBnR9O3GM4Nm9CZVzdqFJOC1YpbvhKtAUw
 rG3B0ftJFS5m/lPkQNdl7tIBvrUH3zdGICsBJNKYlE3ous/5KDWybK+EAtt4/Zf8tvp7
 MyUkTte7B3b+OLxoa6PBeJf+6uite66M0XSD0/wxn/QVdD5tIZCU3uguxNlj5lUX32Vp
 AEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733501559; x=1734106359;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+TvohvwF7sIiq4yJFQu2i4lbU2okTZinLyLmTusnUQU=;
 b=WuwX3eEnJDyszaYo5Emepkk820XNrAaEPfjno1CjoKHAMBjttqqRt8KQExRqJLIz/H
 CiBOZECzWCII5hWrqCKmn2HDHS1gXUEhtTxGXrP5LBn5DMnqaE85yleaFibNbT4MThGS
 cx5er+zMguUJdbzYj7u3v4YfWVf2k/0QqwMAfBWQHZP4AMPveWImlXI3PK5XDztfVj74
 Zp7qkVIjCjrCbPz2ykXyUEkIeFmSsWicJUjiLfAfyumaI8jNdjdRK0I6mCrhyY7KEcxJ
 f2v6+o4HJ1sod+PmD9NUH1iLnDOmEnU1TBfoV362zQATRCnwVVxsOEbi1Zx4yJD2hefe
 5HGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0zux+GOZjDBKUClr7oQ+H8ZSN2yIdHKqyT7XCv/4Biu4W9Vn5q3nwk0OE5IOrvmebtbIiCipTAw==@nongnu.org
X-Gm-Message-State: AOJu0Yw+AfaSs06+YXDuJ+CAo2r2K9GgDc62oNyXzlh/bblk+/W1nmii
 oBHdYUZrVbkmmb8dOMrUm3slfMw1c/pQ5dAjz1iANB1QKaOhjDf/EY1jE9xhaMSF10ne28LUtCn
 RwD8s8LB+5BZfa8I94/V1g4yJOfQxElY3iOCOKw==
X-Gm-Gg: ASbGncswDS6gIDWvAoBkNtsya48XcKX0q0XrQ7j0CQAuCEfEnfB9GfPFn9oAUNCmfKL
 w+wKcj8baHWAv2u9BIyWxPITBDhIXiCOF
X-Received: by 2002:a05:6402:3604:b0:5d0:d2ed:ebb with SMTP id
 4fb4d7f45d1cf-5d3be661a54mr8373931a12.3.1733501559244; Fri, 06 Dec 2024
 08:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-55-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-55-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 16:12:28 +0000
Message-ID: <CAFEAcA9=vDpu3bBqXskg2xjFeqsV7qQnhgnzw8BCbLqBRo1QiQ@mail.gmail.com>
Subject: Re: [PATCH 54/67] target/arm: Convert FRINT* (vector) to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
X-TUID: rhWJEsMHqYlF

On Sun, 1 Dec 2024 at 15:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 176 ++++++++++++---------------------
>  target/arm/tcg/a64.decode      |  26 +++++
>  2 files changed, 88 insertions(+), 114 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
