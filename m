Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp915758njb;
        Fri, 6 Dec 2024 07:11:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWVBgkaweYJB0TJRZZGHoCuWy33AmwZeJDJRxByY9BDtPqGLjsLpvrkvI7DAgZBXv7XaZOHiufFNZScQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGeMA4kUJk7lT3w901rlZevGXBcKiVGH+A7Bqo+QxKQWpoT3jRi6tnPa6Pqw+7aV1hEGtzY
X-Received: by 2002:ad4:5aec:0:b0:6d4:158a:7745 with SMTP id 6a1803df08f44-6d8e717d2b7mr58290336d6.22.1733497895969;
        Fri, 06 Dec 2024 07:11:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733497895; cv=none;
        d=google.com; s=arc-20240605;
        b=I9oLJyXXhJDexrFqFjecCuTPYlVAOjrfluBtOq+gT3gSOaWnGb9kUCRPwcoXuMCrqo
         rGRFZgGw/1cUBLzVHfI9Ke+xCdOSPJZWebw/tJWl72IEwec8E2QRlUOTlC4KashKkKGo
         HLz57NkOnZobwtLHn24C+tC8Yxaf2fDUytKFHdJUdItDn3FWU+lE/0rXMhM4SlZDv7FI
         tUjRAUiFOqhnWuOA2CO+0mt5ZQe1AowOMzEUWOIC5uqKua4ZVDZ63/vkrigispdJoa5x
         D+lVc687w35fm64Hwi8UrSpKOy9FQgxvJYrrw+K1Yw8IizkI9MCAG74CbvDvf+Uib50C
         wKvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=38NebLTFw6mLpi/S6wvRGKDFwCEXEsFpmO+vlDD+P3A=;
        fh=06JD/eAIUXmYoy1sh+wGfk7i9FxDArN/ZoQRE20uIpI=;
        b=OUdpniR9jgnWWyKuWzuhvPIheAgllgu2XOTm3SgY0250wdJj61EKgF+UQk+pXoyKcY
         RG4YaDyIbwMBqca1ZKjai8OHbW/NpyT3rhiIvvRFGATm13yRzrnz3VZTg8W4WbnDHJU8
         qoBjjvUQAnFnqVXvDSF0TwICKwED5VDdFxKYiSFNgBVEH2+HE2Vnn31Mwc76+fUiI4Mi
         yIEu3k3wuigKydky0KiJg8b8qDVeMDoXJd5gyB1luB3TjvfxpJAww3QMjd/8PjJ5MqUj
         iCh5nU2zL5tKaZt01iiNurye+LwSSVTyqQxFkI5tCwtMjb83wMi2N+ocIcaTpa14Slhl
         rXCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dF5Vq1i6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8da67b7cesi44494186d6.75.2024.12.06.07.11.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 07:11:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dF5Vq1i6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJZzC-00063f-8T; Fri, 06 Dec 2024 10:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZz1-0005qk-EO
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:11:09 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZyy-0003FZ-Op
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:11:06 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-3003943288bso5604971fa.0
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 07:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733497863; x=1734102663; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=38NebLTFw6mLpi/S6wvRGKDFwCEXEsFpmO+vlDD+P3A=;
 b=dF5Vq1i6XsimzeXNII2LBhcfZJ3SPY9yYmY+tbLeujWyrf1r3DH8xfeg/VBSVnltsK
 iUhC3aWxpmvtI2v6HfJ1ppiuSB7oxz2UJb4oYv7vEKmkwji9IUgYxspyI1dluvKZ/316
 SHf01T6YYdKtnPeWJ10AJG+NKCrdV62z904PiJqiJwaJ8IyxgEJgMwhdjy8jAOj0z5YE
 ojpvXu7quOkBep/DKVG9SHq+Kq4PyxMUOwJF5MPXFUuXKn+3zP0J97AptUV0jqaHIqCA
 Qpt6FUb1memKaGa5n0clO1oReOfW1CJ1jNZsmEW/nnfyYHtaUAAvwiYiR4FwjAsTPGFi
 oJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733497863; x=1734102663;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=38NebLTFw6mLpi/S6wvRGKDFwCEXEsFpmO+vlDD+P3A=;
 b=xNXfWXrpjWq7/c3mHvqASTSKfsle70ryzUDEl9C1sAWworUfYVH1EERKt8F5KXZk53
 kEildg4WeWXHsvzaqdIQfO0e8AiqisBnp1C4XYyPRIugApbk5JnyO9HD46zfYbbWa+t/
 dLOC33SV5kImQXjzNc1YeZRRo4ZILnwONcJJT+eNph043HLlyC5Ke+QFWul+wxpNiHbS
 NrxWfmDHbE+WTnxUYoOVTD07XWBERyiWFJJXkPyzOkOQvPvLU4AWyfVswUVKeWPY6/lv
 0xsvp/nmaq9k5u4G4/rCf6pcQtu/pb0vYuRtjwHY/sJlyMcN3SHqCjJ3oEbMsslHOQh4
 856w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4Nct75xjVWV8XG4zu6F07jvK+BokWr5gIDbAHY17Qsm6mcsZRUDwvuci0zB3uqGsGP9s9TmjaLw==@nongnu.org
X-Gm-Message-State: AOJu0YwAONUs912Rbs8jynUOPZUSdYHXhAoh0Nem6KK0jvjkmqzaZdEN
 Kj4jMAybLFxVdLz8WFS361Uf3VMyNeQv7GYHbQWRWZh6OkuLEiZiYEwnPFbRaSCmTbOjMZ618Wp
 DCj+Yk30gBtZOwzUbgO0R8Su9vm4UYefiKF2YAQ==
X-Gm-Gg: ASbGncvhMKdsahNnnKdQStVWxC4pgRb0QW+PQrLjhirt8/7P9fL2UKpWqxLYsX6AcfO
 BLiADKioqa0DRedLFUwR37BgWyST5UKcn
X-Received: by 2002:a05:651c:1544:b0:2ff:b6df:ce0a with SMTP id
 38308e7fff4ca-3002fd46712mr24158761fa.28.1733497862164; Fri, 06 Dec 2024
 07:11:02 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-44-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 15:10:51 +0000
Message-ID: <CAFEAcA_erXHv6nKT694pJurq-gh3otBAe8L9cfAkprOiEBg_4g@mail.gmail.com>
Subject: Re: [PATCH 43/67] target/arm: Move helper_neon_addlp_{s8,
 s16} to neon_helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x234.google.com
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
X-TUID: da4W9QcWVRdv

On Sun, 1 Dec 2024 at 15:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move from helper-a64.c to neon_helper.c so that these
> functions are available for arm32 code as well.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h          |  2 ++
>  target/arm/tcg/helper-a64.h  |  2 --
>  target/arm/tcg/helper-a64.c  | 43 ------------------------------------
>  target/arm/tcg/neon_helper.c | 43 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 45 insertions(+), 45 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
