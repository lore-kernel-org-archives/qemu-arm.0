Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp408591njb;
        Thu, 5 Dec 2024 12:33:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUNpjzBOtbhsAbBaGCAxFEbfcUNH49QlF6qX7y9Eh+6p9H/t6h1u1jCxwltL5405M7br2jwRckl9lNTLA==@linaro.org
X-Google-Smtp-Source: AGHT+IHa1nvxevibwpaV4uvVyTNhCBW0GyvcH70BK/qUgEWy17Ixx/uFq9pWGPpyoXNQHjY/Tm6a
X-Received: by 2002:a05:6214:ac2:b0:6d8:8e0f:8c03 with SMTP id 6a1803df08f44-6d8e70e4e87mr7160206d6.18.1733430802052;
        Thu, 05 Dec 2024 12:33:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733430802; cv=none;
        d=google.com; s=arc-20240605;
        b=QbWpjxQtYjS40UruPMyvbO5t2C0qZJ48pTQJFF+XV35SWBKwaO5rtoYgluBn8rRzjt
         LVayu2JLqeSXNgJHl5TbMFIf06GGZmh1eHoiHN+mWEhOr7hkNWo9AgrAiruvkKCUiANx
         jf2HQfRzK5vLGd28vmP6lZ9vYQd3sCV2L/+MOeAQH3IF8f2/LWPeOryZ/C0rkE0gbDJi
         Jmni9lK6ZMnc5vKBM7kK3921RzDnmqCJxO/ygM7hv3fT6XwobDy8ZVmCGrX4oQBlDgdK
         y+113OuY83u1X/Yq3X/YABxtjaiU0yVBfTDf0zAC5fI4btAMhrtNg3IZP2UbIWI2LBfA
         mGHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eY4eeESJksDWNrqHhTIBAIixbIy694V7nfI3FEWkbYk=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=Kxgal5Gqyz5ehKm8UPcSihQaYMAEGLMk+uLS6oZusmJMPs0wTdPsuM2Xa+kj9Kg+/O
         pM45RvoiPhkpoXmes4lsQ6A6CvZ2k25KlL6R5vz0QMVjXOvLmeq2S7KzqY1zMCgvFyk5
         Wf1/UVOxV9q5bLlhbnTXLotWkF8j+cZwS0dHpeb+ihpVOdYNywW3ZXZafxlaTyVzmdoo
         Q7vw7vKYKg3jXAuepUQU6d5WUJt9CFPj3BKC98TEFniaRDcqmsjmOGsuc4HIW3wJ6XbN
         HxepoduDZRZO8MfahTBRwe6OMiodvMwVoYxu93v+WYrobS/FuQt5kdoVlx508+no7Tqx
         BEqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wkAiiDpZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dac255f5si23630846d6.452.2024.12.05.12.33.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 12:33:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wkAiiDpZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJIWw-00056c-0a; Thu, 05 Dec 2024 15:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJIWu-00056L-7h
 for qemu-devel@nongnu.org; Thu, 05 Dec 2024 15:32:56 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJIWr-0004D7-Pg
 for qemu-devel@nongnu.org; Thu, 05 Dec 2024 15:32:54 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d0c098c870so2506947a12.1
 for <qemu-devel@nongnu.org>; Thu, 05 Dec 2024 12:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733430772; x=1734035572; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eY4eeESJksDWNrqHhTIBAIixbIy694V7nfI3FEWkbYk=;
 b=wkAiiDpZ9CDAlGVGHMIXELsvT3CiuGIO1zP9Qs51XP8ytqwmlY43Yi7V59sBCPRe/R
 OBpGbvWyN+mY1lGXX/2IKCKd1MTr/d5svyzOgslSzRdf+lBNXboUJbmzonTDH/aM1x9O
 J1IVFQPn0if6pSqmLndZtr1q7b6HEARuxGDpxNLWl418Sk378LOuw6/lx+Co+igAymQZ
 hlUzEfNlztAg5KmDVrG+1h3XYotAax9yMVDU6wvzqDiymBbbzmebQVdnbQFJEeN7NXWD
 OSZXflWBPMxOnVu99j0UT7M3zypewlxxm4sNHk8UuBsI+PpZ0IBFxj3q+4bcigcyeOse
 ZyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733430772; x=1734035572;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eY4eeESJksDWNrqHhTIBAIixbIy694V7nfI3FEWkbYk=;
 b=FIK0o2IqCV9e+OlyoDy4A8wtnkJyzgPLPn8X+rSIS2S6TMViAusKbiEb4Gt7RWTiM/
 XWqIklz26i1QWmRPQeIhUAg0v+7kF7WAtLa96a75YU2GRfx01a16fTy5/3PZBgNIl/YG
 AVwtJXHryvXoOZS9DDN6CYmPjcfgYi5lFHoPx2td22FphE3Z5DGXFZykbjhHLuvn6LN6
 SymbjMHZ43j3Kosg9cHlfsytBQaX0cHgbFX+r2Ih3NyHN3P1AT+j60o3yBi7z4M7rUCH
 BgLFJd1jRj9dY4t51aEdX5VcWcCIzxSR3aqnlL1u7ncdYZQm2jGeyr4hKzbL+KgUry8p
 LQFA==
X-Gm-Message-State: AOJu0YxcGvRMgATN18GF4DbGzf49pCvtyKaXFXmwZrOus6MAw80DiBpe
 TO9BROvf9aL37WicE9vECq2Ji7Xob2I6tMpgoadUYBZ4FS/4kh0Waz+yTWnttqb7vZyLz8xJ5t+
 jdCi22hDws29/LH9RHs0JLQfaHaK0AEGBfjCGcQ==
X-Gm-Gg: ASbGncv8N//KuqAH3pGvnW2A07adVwYi7dv8d2qwxCNDzO5Jd8RW0xOrfDcnB3JFvtN
 4uVe6ZFWZKmNPCFIoHcISMgisqXO2HCtr
X-Received: by 2002:a05:6402:11d3:b0:5d0:9c3b:faf4 with SMTP id
 4fb4d7f45d1cf-5d3bd66af18mr650568a12.7.1733430772043; Thu, 05 Dec 2024
 12:32:52 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-19-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 20:32:41 +0000
Message-ID: <CAFEAcA-J+KrHaR+h1C_P56L_kjxyt4S1y+QYgBv1ysL=_C6_nA@mail.gmail.com>
Subject: Re: [PATCH 18/67] target/arm: Convert CCMP, CCMN to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: XbQv+l2aw6+L

On Sun, 1 Dec 2024 at 15:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 66 +++++++++++-----------------------
>  target/arm/tcg/a64.decode      |  6 ++--
>  2 files changed, 25 insertions(+), 47 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
