Received: by 2002:a17:504:6615:b0:1be9:327d:8ee3 with SMTP id h21csp92975njk;
        Thu, 20 Feb 2025 06:16:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsEvq24CV/DzwL4rKhIRdOf6Ha87MVcBpjX0lJ4X/edjNRLdEogcUQwEGgVSw8sROh5QL/DorIv5hvGg==@linaro.org
X-Google-Smtp-Source: AGHT+IFbvJC+hngmML1suIKL6sI6gLHEdVLD7bCqGhsfpp7s5V5xjRPdplty3Zdq9dwgnNYp0Eid
X-Received: by 2002:a05:600c:4f84:b0:439:99d1:d4a4 with SMTP id 5b1f17b1804b1-43999d1d6aemr79229305e9.18.1740060996449;
        Thu, 20 Feb 2025 06:16:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740060996; cv=none;
        d=google.com; s=arc-20240605;
        b=Zlx9pCFj+pNIH82+7v+haFnf+EpEaXstdbfBD14WvehGjdrLSt1tSwAOmrRoJm3i4h
         3ovjYxppcCcvhKsIc5t3wldVGPRTGj+4uXZ/tUkGlSXopnrARw3ClH1MbC3xbaznQDWE
         sq1rhh/8J1ONN7WMlaauzQtbAmab72LOyUYcuZXM7wjA+ooeUaD4qJnD8dPxmrt5Sw6r
         C8LIruiq8NCXcBbcUWHXQpqirHeeTwfGXmD026ZYt2jMeIJLdLHVTcNxb68b7AndPImJ
         qJsBhgVbi1VlVF1sCtEenYBbYnVTVoPoaA5J0seU31YMUnhQNKDyUwktXb1iNt+RG0Gz
         azDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oLF7hMM87dLQpph4+jiQW+iMxLICwPdupdQt6MqEqvo=;
        fh=FbZQQ3YghMb00qFx599qj/1VPlrUdzJmBexK+/4LYuo=;
        b=GGFrizMXZ68bjMe/i4VWIDt6x2s/f1FT+ch7K5Mk7T5bBO28yyd4qKQouS3qs/83He
         5VZrRds7W3nBOUb8b3s59QfRUWFRE0hJdGCL/hmwpy4N7QH2tJGRqsFtXTLGADD+PFJy
         aF15BacaOQ3TLVf8Bj+09bX8xgiZbJYY3uD9V8UlHCXRw+SEiwQleogkAxjK7HqgNOwd
         UaYlsX0qwJVzkUPR73xOFrdAiny3v+rpb+RUzfH3+GyE/ztlPWRu83Z9cCLsZBt1y3a0
         4/a7crcyroOZ7yOHVQiNhwjVfTDDenxiom1h5Q2XM4iHs3CUCPX8P7lMH7qMKfW9Ybjb
         ScMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qlRzwGli;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4398aa26565si57110335e9.76.2025.02.20.06.16.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2025 06:16:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qlRzwGli;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tl7Ll-00073O-15; Thu, 20 Feb 2025 09:16:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tl7Ky-0006t8-Ge
 for qemu-arm@nongnu.org; Thu, 20 Feb 2025 09:15:38 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tl7Kw-0005EQ-OR
 for qemu-arm@nongnu.org; Thu, 20 Feb 2025 09:15:36 -0500
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e4930eca0d4so757727276.3
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2025 06:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740060931; x=1740665731; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oLF7hMM87dLQpph4+jiQW+iMxLICwPdupdQt6MqEqvo=;
 b=qlRzwGliWLBVeLIW0Bz4FPjgh5Tst2dI8D5NzU/U3y/y3dXsNtrBURx0FOy/1wl57a
 +g0g/Hcbr0Bcc4xkBzF2+eR93W5r7Q6+oQfd4a4rTwDaZZEoi24N6aUPdSaoGiRxxVLB
 /6zz8KiIIReBr2lziua86wqX+PJP/3Y4yntpX/EFqoMv1WeTDA/9QGD/R6aLaDmi1lC5
 6ym7jCPqPFn2W/4inqnL9/cIM4XyiOvAXY8/LaIKDsxlFupPXeEC3zL1WvZzPOixjuKi
 SybpJoe8eGSWMjGlj5nkvoSKhrvkmoCD8vWgZPRG5IbvZOhJTFLQWyLi/XAuPcDQ9Cfp
 Of8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740060931; x=1740665731;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oLF7hMM87dLQpph4+jiQW+iMxLICwPdupdQt6MqEqvo=;
 b=wlE8XzagTgzqMfKW7jA0vk0qVMTCkHkUsM0G3UMBduli+Ne6l/wHWDOsoV4svxbY1J
 E5PDP+K7ye9srssIiK+XlZoVk4YsznqsdvzpvPVd9D7KXvmDv07bn16lFP65p7dUDNWe
 MZNT4Rm1ZBkjxbFh2AEfjPF37DyB4Q8U76yFF1S5kQaAXkOscM6WClsQ7BfiLjW/PWCx
 z0UxuvPyrEY8uU+aMiQ+eA/tHht5m1lVjYX0VVsVEhhlaB4qkuGeUYJbqgyJcbkbUBKZ
 BJIdjZTaDE5YAmKdsk5qftI43I/oDDx2a5KbXI6V+0ppDonXtZcltrJTYtw39btjtsM+
 5SWw==
X-Gm-Message-State: AOJu0Yy+8OEM0jqj7gCpIjcRnwimfBLBQK3AFUZc3gnTzxdKBHuLqXzF
 oRz8MZrtj9CFSGF75nsvwaxiD9gXeE/VES4KfS+5nYA9YLOD14ah8V5N2ylr0uFxsK3oxxbjcfQ
 YdT8qVNIMhW6vvEpbc/mEkv6U3MGhDScJZiIYAg==
X-Gm-Gg: ASbGncvDf+zEm2nTMxSBy+HxQi6m7gOOA65XCHMEdfQ2wQS5vVbzmQos9ZdixWofndF
 dEr/O+CU1KYfbO2wM4h7VE+aDH8YG9K/x3p68ER1LLKh54nYRamx3PNqkmuJWVZF1HdXaoeKrFA
 ==
X-Received: by 2002:a05:6902:108d:b0:e5d:cd08:12f0 with SMTP id
 3f1490d57ef6-e5e0a183a4bmr6632570276.44.1740060931138; Thu, 20 Feb 2025
 06:15:31 -0800 (PST)
MIME-Version: 1.0
References: <20250219165534.3387376-1-slongfield@google.com>
In-Reply-To: <20250219165534.3387376-1-slongfield@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2025 14:15:17 +0000
X-Gm-Features: AWEUYZmj86MscSbyuSGCk_WUZypFPJqox-xar27df7kPoz6QkDceCnjZ4spQM9I
Message-ID: <CAFEAcA-ZCQ9e1=TimLQTU2OKsqs2-BFX9pV+0Va7=d19E+P9=A@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Fix signed integer overflow undefined
 behavior.
To: Stephen Longfield <slongfield@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, roqueh@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
X-TUID: pju544J4l3f2

On Wed, 19 Feb 2025 at 16:55, Stephen Longfield <slongfield@google.com> wrote:
>
> The problem is internal to t32_expandimm_imm, the imm intermediate
> immediate value.
>
> It's extracted via: int imm = extract32(x, 0, 8);, so the value will be
> between 0-255
>
> It is then multiplied by one of 1, 0x00010001, 0x01000100, 0x01010101,
> or 0x80.
>
> Values between 128-255 multiplied by 0x01000100 or 0x01010101 will cause
> the upper bit to get set, which is a signed integer overflow. From
> Chapter 6.5, paragraph 5 of the C11 spec:
> https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf this is
> undefined behavior.
>
> Though this is a minor undefined behavior, I'd like to see this fixed,
> since the error is showing up when I enable clang's sanitizers while
> looking for other issues.
>
> Changes from v1: From peter.maydell@linaro.org's review, only changing
> the internal representation from int to uint32_t, and leaving the API
> types the same.
>
> Signed-off-by: Stephen Longfield <slongfield@google.com>
> Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
> ---
>  target/arm/tcg/translate.c | 2 +-

Thanks; I've applied this to target-arm.next, with a rewritten
commit message:

    target/arm: Use uint32_t in t32_expandimm_imm()

    In t32_expandimm_imm(), we take an 8 bit value XY and construct a
    32-bit value which might be of the form XY, 00XY00XY, XY00XY00, or
    XYXYXYXY.  We do this with multiplications, and we use an 'int' type.
    For the cases where we're setting the high byte of the 32-bit value
    to XY, this means that we do an integer multiplication that might
    overflow, and rely on the -fwrapv semantics to keep this from being
    undefined behaviour.

    It's clearer to use an unsigned type here, because we're really
    doing operations on the value considered as a set of bits. The
    result is the same.

    The return value from the function remains 'int', because this
    is a decodetree !function function, and follows the API for those
    functions.

-- PMM
