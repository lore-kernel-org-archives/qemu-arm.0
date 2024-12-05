Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp406495njb;
        Thu, 5 Dec 2024 12:29:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUAeGHjv15i8bDJvOeVL9gsereIOKzkv40E5MkfngYC6Cxp6dEd9SPXYD1rwu7bUskbsdu9/5N+IPd48A==@linaro.org
X-Google-Smtp-Source: AGHT+IEpUajUzXNvvSTcNCm/HIbctEc5s2hy4Hf2ERZzyUpCgqP9bdWvj15ouG/Zw4yA5/3r8ig4
X-Received: by 2002:ad4:5c66:0:b0:6d8:accb:5a30 with SMTP id 6a1803df08f44-6d8e71fec6cmr5606716d6.36.1733430569202;
        Thu, 05 Dec 2024 12:29:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733430569; cv=none;
        d=google.com; s=arc-20240605;
        b=b3gGb6XXVDiIjoDdGiXEYbwHcABZRfrrAQ3XBrdH2z4/ihz8Thp2hS2p03nPrgwg3j
         L+VLeAuZs5E+5XRQFeaDypWSmMemfjemEjX7WqiuiV717kg0TaA+Flg2IEhcYhaS9BUn
         ZJutqGHAVjKE+bRTHFhLA5IVPcQmC1zSJ3XwP2KGPwSFRRlSJlcs/IQmZPX4RvY9bEpZ
         05n9NGAGaeFa5vY2wkL23JEJ1K7+ah8XTm3f3wJTjwVmAtGm72+PFhU9grgzn5TEPBkv
         Otj7SY8Rb9XtfZM/Gn+grC7T7YctHMQMuFtiNa8JvyWU1+wPf3DJCyFJ1A1MYDy7/JQ3
         EBpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mABNHMP6FvIXyD7suroKODjoEVvkfBT1QGbq7qeDMRY=;
        fh=I6uNVZN9jM8FzlfG3+C9U0umZE4n3wCa5DeLHpiLB/U=;
        b=bLgpwVl4x/HbsB3FkdkCCz13VMGy+UgAjsV42pgVsf9UqI5IGCQo8csUAEm8juMbFI
         C0pUr+GiuxKnrSXpXmpV53111ScApaZs/lxdKpDoyU7ZMGMPZ3AlZ+RQdp1EkPskwu5R
         FXNN5xk8AU3/RUOm2ytyD/kaIJfJIRm3+4t0nVGXxc2xVEPfobIgcutqgYpT90upjzps
         zBoyw0ZACf6GMSM5CGefFwPX77ndZ+AeRqrmEjPbxU5n7fFtAMuvJxW9Dugd8wEAVX14
         IYTOCjDLo/kyRpE7FTiL9U+T2QJuPOeaXZ2WFv4eUQf9qFYXD3gUv4914f4jW8R/30rQ
         /sKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vq5RiAhe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dac09547si24258166d6.307.2024.12.05.12.29.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 12:29:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vq5RiAhe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJITI-00049m-AX; Thu, 05 Dec 2024 15:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJITG-00049T-SO
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 15:29:10 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJITE-00024r-W2
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 15:29:10 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9f1d76dab1so264098466b.0
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 12:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733430547; x=1734035347; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mABNHMP6FvIXyD7suroKODjoEVvkfBT1QGbq7qeDMRY=;
 b=vq5RiAhesZMrYdIxSRnVV/FWVFKg21UXw0DJWATk0Tgwe+W9/oyD6nIuXKb7EYQFZv
 yzFo04iJGpljDx7MbX1mjikkC3QbSnGCtxely87N6c3wzur2g5tbNyIQt9dBtA532Hbx
 1a00xUcGulZK68yiCbnB011T8thKcBGhwnzFe4zPuR0gTUesfzayhFhEOe50V6DDopMB
 Ei9ttbfFrTfc0RL6+wisDi3CSnfYqjzbDrRKzHKrS/ynR6u4s0y9QUApyKVvfR3Sx+sY
 pm9fX6Lza6rzXPaNupHGh+igCzQr69sH4IO5fadDkFs57g4X6aI584xgWdyVCuY2GsKP
 luAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733430547; x=1734035347;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mABNHMP6FvIXyD7suroKODjoEVvkfBT1QGbq7qeDMRY=;
 b=sJXQ2scEkrvelheKwC6DOPCbPT/fuTrTxzw4KCSQSKwhN1LbStJOtun2Ga96V2P/ZR
 NvHj19HnkCqpF94eWHZfx6Y3jGJKFrWqwdMhjbveYPv7JmCU9f725mWOUmfeQlZHYz4r
 x4VvBLFgLjWVAMrrTg1Ih4p9RG8mdbV76aw7bY1wu32wGfQBbj1p9URvhaFt96RU/Mno
 5L1zpuYuhCqnGDyxWOro0IreFIC8JKGnYpBDgYh9hRh/YsQWqPZ/wWMT3RD/FhWOAf4+
 iSO6CnLx1YiIoTECUpcvgN92VinttKzK979rC9bzfP/+9zMf5ZfU+eQbTzmT01gBcDDQ
 CxyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy3xOooWnBSG8nGLKsTLCpN8IH84PZgKnYBbXEiaLnpAllDk+2lsuWIXnpJ+1lB2191vMIIUAdlw==@nongnu.org
X-Gm-Message-State: AOJu0YwfXDMwYqW5JvuPrx1F6F7XOjbkpLw9jL1cohWyVPjr246T6f2I
 tN79hR50nnbborLoKahW43UoRU5oMf2sAYNu99noInYRN+R+rRZlnS/HyVEy8j5DBf2Tii6laS9
 1+A8IcddJ6eq3fqFQ8Iiut0ilRRn/rKR8pgGinQ==
X-Gm-Gg: ASbGnctxsPzY5xnH2BVJWYgfuPVTXknSJjhJRd4f2ls4bvbSUjxgRnpNaA1rOERBdP4
 3aoncG1iAc/T5YPaebIN7UX0alNmnvXyh
X-Received: by 2002:a17:906:1baa:b0:aa6:32c0:5d03 with SMTP id
 a640c23a62f3a-aa639fec9femr22279666b.17.1733430547088; Thu, 05 Dec 2024
 12:29:07 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-18-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 20:28:56 +0000
Message-ID: <CAFEAcA8Bs8NozBx1hb2SYnmU6g-zq8dL85HgpLK2D=gy+qh5aw@mail.gmail.com>
Subject: Re: [PATCH 17/67] target/arm: Convert SETF8, SETF16 to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
X-TUID: Mmcz5sR0OL0u

On Sun, 1 Dec 2024 at 15:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 48 +++++-----------------------------
>  target/arm/tcg/a64.decode      |  4 +++
>  2 files changed, 11 insertions(+), 41 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
