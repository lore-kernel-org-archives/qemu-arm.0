Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3322587njb;
        Tue, 9 Jul 2024 07:21:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNF91jV2qcnWaLqsUSFejLrOkRZNBao1B3yF0HD4teKXpZ6fQZCfR2CUD2sYUCDzkQ3XSg7XRD1SX15n+L9jGhAL1UdijP
X-Google-Smtp-Source: AGHT+IHN3fPZ9ib1vyqLeU8Nk3+/PKgmFbrDBEXQE2hcZxh+det79Rq7tRn5xv/7aTBL5yTJxvMu
X-Received: by 2002:a05:622a:1ba6:b0:444:fdee:aff4 with SMTP id d75a77b69052e-447fa8addbcmr29783341cf.13.1720534913972;
        Tue, 09 Jul 2024 07:21:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720534913; cv=none;
        d=google.com; s=arc-20160816;
        b=i8EOkQmAIwezP8DgNzp5sXMlvpk0C35RdqUwksUc10i+D/JKd84rdDjtLQKNk7hrtJ
         FAhgYCkMLeWto+2CZs8AGH/mrWZrOjdAbvibLU3/4ibiVcFENpnpTQbyrj2aakxyFXyF
         JG7xO2Cyc5Ul1weSyWD9FEldaj/4lW5bae3czxTS+U6y+NPG99YWky84tnzsy0RlMAT4
         SIPcS3Xd2S4osACOdVqbpC3kq6excnof9U+MXn7sgTClZVzRMI/eAAcKgGYG62USB2p7
         S7kEcOs3ZJz7Qs8Pf9KqW9wGZPg7FB6NZWPjP6UjiOWmlHV0YFdqJh522Do0r90hFUPc
         hc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1fGY3akIwGrvyq9NDRbjhvoDxrybtYmpnbWhqEBK9oA=;
        fh=UYM9H9Ar4RRrNMWI3bRCHwvhqr6kj9tiPA9rc/jAR34=;
        b=Hf+OMdNA1uv9RG3ZiFbeFIrhEMKUquJhn01HWlZmD9KIGIz/h5/5tK3j0jvHQe0Dr2
         RFWVO7mDgRiUjJiZNkpe8AmxlEn81lKRGirOvRqhi64nHFjxToxscIH/VpB02rCOj5v1
         SfyxTnB57zVKScUQVY2s/DHAXXTCNknqtXOHRzlBFucmgMntNSGZI018pfIyrE/wxwyv
         P6B01VTZXSHaIneTpNzRDJLeRb+PrQWrsJUToGpYPmFuvEZNylyRi94wKvg7rD2qAYgm
         eBr4bkt+6o4NufoxPhvODFVroEJEYmb0Q+QsrHwOXcir7sxoY3oSkNxR8THW/X/tvnEL
         DIZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tNHrNz2v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9c0b3f5si21923541cf.713.2024.07.09.07.21.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 07:21:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tNHrNz2v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRBiq-0008MC-GY; Tue, 09 Jul 2024 10:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRBip-0008HD-CE
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 10:21:35 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRBin-0001mi-R1
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 10:21:35 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57ccd1111b0so3488844a12.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 07:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720534891; x=1721139691; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1fGY3akIwGrvyq9NDRbjhvoDxrybtYmpnbWhqEBK9oA=;
 b=tNHrNz2vR/Sr0C0/6Lkq9l6wmmAIix3lLNPgMSTzBqv2trO2X8as4jDdKshDjkTsL2
 OzUGcirjAZlc7/McbXgN7CK3Udb0TfsCrWTyyTQCzu0yUsycwqRf3GXzWeQ8bbA0VEWL
 B2hnN7LxFIVQYY3nsJBt48n2iR2/e6r5N9s9M4at+VRXWsQdZ+V+vG501jPmwW3DHknp
 zLzWHQsoMjL/NGyPezCzdEKJaWgXcFMTs19jZh5IyWleO9nbS9/sTcNhQffYMXrg1S2M
 E9l5sHkIw5PEKSjhPLeVbg6qaGUiLEVU9+KQONBBoVodB0efY5Oy/5xZfEVqcS+hXfZG
 qjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720534891; x=1721139691;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1fGY3akIwGrvyq9NDRbjhvoDxrybtYmpnbWhqEBK9oA=;
 b=vP5VhZaoIyvjmAUinxQ61Nnz8QthL8EJvYIhsWmHVCcUE5JM3X0rCatxn84dSEUOPU
 0q/GaqQwumogmP+91tz3497XXXkjJSBaDL1CmJ2rt7EHbxb+Ubnz8f00UFHg0neJREt/
 Zwupf3QF7FG8hg2NUpbsV5uT6jPStxvycgQaHMVI2QCveDmZ21Oyj/U0HNsM7nk4s1W6
 lKESrm8ylHaDhFkAtKssPFa3S4ukyDnUrY8L9H1IdSq4RH/LERyAFjX7ZtJkZ93unP/M
 U/hO6LaG2b+7TUIcALIsmjqm5tqD4wzC/3bVWYm+Q/zwhJBPqlNH1aJunU4z+ohGCxRY
 Oy8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyGcHc2e25NUTDEX7RXBPLy9Kqv2NHtBxaPFWTxixMwumRTpH6a8tyhd8XhBeYqAczrhheItLVkJZEulhOGBQ4Wnyv
X-Gm-Message-State: AOJu0Yz0ZD//2MdKEB5JXpnUILN59TBHEmYBwCSxBca873Zg7vgnjAUv
 9f8W6MT1WMjOKiYeyf31g7FzUcUW00UmMqRzGc/MVOIGGBkTWhQq/lGoJ/sIP9bXRhxwwE7ui5S
 YZkIiy4FNYNrn70EC5uzZmj2sJndZU85bTX9fXB3Xl2XBC+2b
X-Received: by 2002:a50:d61d:0:b0:57c:6ade:d8f5 with SMTP id
 4fb4d7f45d1cf-594bb67f905mr2115949a12.21.1720534891072; Tue, 09 Jul 2024
 07:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240709000610.382391-1-richard.henderson@linaro.org>
 <20240709000610.382391-4-richard.henderson@linaro.org>
In-Reply-To: <20240709000610.382391-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jul 2024 15:21:20 +0100
Message-ID: <CAFEAcA94h70Spf8Y6eOuYpxYUtsTvkzga7vK0ZMg_YEC8X0Sgg@mail.gmail.com>
Subject: Re: [PATCH 3/6] target/arm: Convert SQDMULL, SQDMLAL,
 SQDMLSL to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: WThUYo6qVrf/

On Tue, 9 Jul 2024 at 01:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 604 ++++++---------------------------
>  target/arm/tcg/a64.decode      |  33 ++
>  2 files changed, 138 insertions(+), 499 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
