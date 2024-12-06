Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp975876njb;
        Fri, 6 Dec 2024 08:30:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXWfT+gq9zUulqDQsTNK6dgtJepXlDdOBzUvFKlorIQCVG2V9O2xiHH/p5DOo2ri5gSKuIybL2wbX2FlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFHFXNW/g+xDg0n5Vs2eNmKu0hJc595sGy7mEBb6oRrnVRX7Lyt01TqbyZaK6DNVI5Ke/8j
X-Received: by 2002:a67:f511:0:b0:4af:d263:de23 with SMTP id ada2fe7eead31-4afd263e057mr1606800137.9.1733502627115;
        Fri, 06 Dec 2024 08:30:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733502627; cv=none;
        d=google.com; s=arc-20240605;
        b=OmvjGz/fxCfLsTwEvQAhYcMblbs4Wp1K/ttkk80SllejpDbrfgmDgfoHz5C8PVyOs4
         3fR0Qpob54MhAqbtzzSctVRBk9404a8HPgYaFPElOkWwfju/gLA1hJeTfUZ9QtHDMrrl
         zfH/jmr+RXH6mHgAohuRXXpku/SvOmZqv9clwZdBEqQL8yQP5qIRe5+o3v1YlIP1Xc7N
         +LcH6dCCcl4vbpiy2pMMGarS2C1jmkBq0SLdMHPDb1HWr6stHDk+vQhKX+e1VR89dGQz
         MDvajoZYL9dQ2QJ/8nDGnrrl0cysRW8yG4RCscqcRfW0ZU9yP73i+1kR2FwLlRZkwX5D
         l1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=aH+FOYNIBbdbb/rC/ymbhx0K5JnxU65wu/7eZubR4ts=;
        fh=yk3WxxIlSMJvwWIjAfCDWN6xhfnHtjcrXMnfkHV8e6w=;
        b=knEsgq/Ib7auo4729HsPZKlgtyXNr3sJlILKG87oBM2N06dp9fuOyGH3WpyCm9DNp7
         rSoyCjSkXfbz4MoX1mBZCAzGGgs6WflwFHsXNUTUHYTXHiwgLZb+vH8A0wY11W3CxboK
         J3sbBSy4/ZEi8+FIqed7T+DDXyn3Zjn/yRZZhDAaI+MlE7jQa13j7VhfoZ1h108ybf/1
         gjTDzs52byFpOpph6J6KRr+oW+pSSm4ZNySASOETKJBmdui8eXCblb28EhNDz7CmHsoz
         wBrutEe+U6ytRBveers8iAYkbTMXNvLiQZwkF1FVRVP/MrmYF6Mzg6oj7vNmZUz7j9/x
         w63A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Esj471A+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afd469cb85si342067137.450.2024.12.06.08.30.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 08:30:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Esj471A+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJbDY-0005ln-FN; Fri, 06 Dec 2024 11:30:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJbDU-0005jl-Sm
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 11:30:08 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJbDT-0005xf-Dg
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 11:30:08 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d3d74363cbso326565a12.2
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 08:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733502605; x=1734107405; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aH+FOYNIBbdbb/rC/ymbhx0K5JnxU65wu/7eZubR4ts=;
 b=Esj471A+anTkrSjMB0a2K/8PZ7IHHutPqIGIkERI+XoE9kXylcRdG2DXDKJVovUDbC
 TXT00yRyBq5aKLAFE/uNXO7zJDHJZaIjyT5/RhWcZD7Ib9zJ89zcIivbI9RC/fHWTYJX
 aA0nhT3o2iZPH1cdvKUsiK8Cw+1qZsfr7ViMCwoRN5cv2ehCgn65XnFKzuMaWRG3Ow53
 +B9aM/W1EbNe9sVNT2P8YpkwpCewKd3I2fO3xQx/2cymfadJh4zEBCHDe67MO/Hkksa6
 uGfEUR29ytnqnnVn7Zdl5Vc+jaXWUUoAirfK63L0+ooMHAe6utaswz8kRYttybow4fxz
 BIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733502605; x=1734107405;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aH+FOYNIBbdbb/rC/ymbhx0K5JnxU65wu/7eZubR4ts=;
 b=rlavj6Orn2QO0OioJRneKVOFBvDsv+lGJrZmJxDcSFUCPGaTxbDuvIg1Qtmt62xyiH
 vtFOR6izyeT84HYlfncuykkCvLCgdLuOYc/kOXVmZI56yHHp/3iyfTJfraRceYXuABUC
 BcM+vFILHPyje0ZJPo4hqomaurajIWKZMb33c2SvGctM/smXJi5y0l0aWCA5J9LyzRmD
 tknWpZ7PlXSEXb8CZmMGNVlkArt4OhuWaslAAIS48qRgPGANJOhCsPazMowNy3JKC/FC
 r3iXmFVI5zqoyz0CpaySU565jf3uDzauaw1tUjfUuXksCDTRIWBdPPasMAQEgbjnAZOb
 UiIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQat2+pKGaPL5TxhpkrjyBCR3wOO0ri60i0mdzI9wTSENKGernDxkA3PtAfs9jpJrAw7rPH56RtQ==@nongnu.org
X-Gm-Message-State: AOJu0YwHhrqyDLmXdKMPzs9UysTS53xsknt4A9pFVCd+4b/rETAzY++v
 vD+hVKOahOMgRHUYLojh3BHCMIB0fULPQYw8/UYFkyt73bbpmSqPjRk9FwB4HoWVwNn+5cGq2Wh
 B1dgPS/TTQGBVo7m2ZUMOJwWonfQdjLofnonf9bp96gEpedQS
X-Gm-Gg: ASbGncs3NExSnLhziSy8YXw4gE7oBW8NxrMI+WfaH9QLIEURO8PSrDb0zDM1W+onprC
 r5rd93rCI7up2rVd9rLwNIPEFqX3HEXpt
X-Received: by 2002:a05:6402:5215:b0:5d0:bdc1:75df with SMTP id
 4fb4d7f45d1cf-5d3be763965mr3216124a12.24.1733502605086; Fri, 06 Dec 2024
 08:30:05 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-64-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-64-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 16:29:54 +0000
Message-ID: <CAFEAcA8WydPKZ+mMut2uayGF-ueSGYLm1rrMZ77tOKCSX3d+cg@mail.gmail.com>
Subject: Re: [PATCH 63/67] target/arm: Convert handle_2misc_fcmp_zero to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: L0E2wqYRg5Ha

On Sun, 1 Dec 2024 at 15:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes FCMEQ, FCMGT, FCMGE, FCMLT, FCMLE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
