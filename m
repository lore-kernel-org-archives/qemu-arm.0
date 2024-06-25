Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp660507njc;
        Tue, 25 Jun 2024 05:39:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6OU12GboiHohKre6eG2N6KVEp5gagvdKbt/Fbb94ThBKKnhqi1yPHSrfdA6+iRzRHuXhsrEpzbMBrt/LrsBIfnCwMNln5
X-Google-Smtp-Source: AGHT+IE/Xa4lQxPjhmlE9mE4Y4cl+j/LzDFkF0UPvJTOEFswD2wDt7Sk/FwnuRHJ1v2GbBAMGLRS
X-Received: by 2002:a05:6122:208a:b0:4ef:678e:8aa0 with SMTP id 71dfb90a1353d-4ef6a5fcfb6mr6946951e0c.4.1719319167162;
        Tue, 25 Jun 2024 05:39:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719319167; cv=none;
        d=google.com; s=arc-20160816;
        b=kpARinUeHR2MKqTi4zsadvJxShWTcomF1ZwyD5AO9jCBU9v5OavHIgA5GNkzsx96ki
         PLGl7dazx3NZES5QgLElTFILhCAu2tQoBP/CcwzObCMVMsBEjRm50D531WMQDhUBhncS
         krA7UGKIwEqBxZj0sc8KGOF99cOH3Vc0XtBKEbHURf1sIem+fI1z4UiN3BHIcBw7WWfu
         Hb8PrHRdZAwQOM2jFpU7enkZPQ9McK5NZAuMLszPYvYnBw90Tl55W29p5ZbkZm/sbWYe
         nELqGKI/iOOzUN9zt6oFFkAEpA31UGIwaGT0BToPqSKKVGjmy2fi7FAGjf3vO5RsYDtQ
         Kq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dl2K5msxk4bm2KHv/0YRRmsgYy+HuefsmsPOsL7syjI=;
        fh=sa6b5NoZCGyNrKzxHJcZHOqBMY+0LYVN0GWESdEoKuc=;
        b=t39y4lnHSmyaPXFRG4hZNGJJlW5uneeolrEWciwz2yqpWZPBy0ZEU9F9gMivxeIk61
         J1aEf0Gdj2OyQ8jOvvXMuTvl6NEvUMRxRBV48FztLx3+MgxYgm/puqNR8v22qwJH/ekZ
         B7UgLuE/HYidLTkNhKCXIYNGQ7tRoaBN3YB6TN/Z7U2yO0xboDYUuO3BNdOJVb9m5SA4
         I4uTzXs8QaU9P75rKqE3EEJA/3Nv1w2XBIT5RhrZquunmVcZtZdS5ZtCDGSExp+mjtm8
         Lb9bJL/o0Lkl+3IrvXoMWuKGtg5/8pSHl+C6gWCTFqg2qN9R0jVFeOXNe4TY9KSp7TrJ
         7lvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KyYYzGoS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ed133c2si104617206d6.141.2024.06.25.05.39.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 05:39:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KyYYzGoS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM5SE-0003tO-Ji; Tue, 25 Jun 2024 08:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5S2-0003hS-6n
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:39:12 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5S0-00026y-N1
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:39:09 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6f8ebbd268so1070428066b.0
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 05:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719319144; x=1719923944; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dl2K5msxk4bm2KHv/0YRRmsgYy+HuefsmsPOsL7syjI=;
 b=KyYYzGoSc7dKRCk78MH8GvrWq7aiEbI91t4DJMdTQk9M6cyDpyT0u9ut1Lo+fEUm5W
 Oncn2Cta3p3mmgFe8wYdSxy9N9i6+ixqvmxKtQ3hPf7CXF1SZ6m9sTMEPf0yC+8GHiVX
 09YCLHtbog97ahe/vleiCs9DxMA5kvLjt3d4DZi3MXRmZAMToMAS0ytl5PzAIlKKMGRT
 M8ozt22lY6L80vSfVh9VOqxjs1dKe215tqsApZ79KPExrMyO85YnyDt1RFIJTXt87zkO
 nB7smrrRL9ShgBv065J+FcWrkEdNTZUUlmNEN7N+ct+xnlLoiwV1L25rSHhak/FiH6ID
 ZH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719319144; x=1719923944;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dl2K5msxk4bm2KHv/0YRRmsgYy+HuefsmsPOsL7syjI=;
 b=dTlc2X1INu3EcfvsauXbd2AxBgo0nSBogFVWYjYr1+M7Xa3REFC+Y5WSEA7evsyYhe
 vEz+eWWw7MFhE27S37hNsz7x5VviIUiSX84h1Ec2TKFC+uc4v4Qq/2jdZkjSAT152gu0
 4YASZ8jc+VNbA29khVRiZZ+myA79GwXsqLf3vMyMlZaFtiCx5+o3HdkfccLsV2NKQWID
 4nwu0Wzma1cvdHnsQ6TcHzzGCt9omkwYTYi15buXQM2FxAzFkp/j6WbFWes2SCtgyGgr
 JcqneW1YF4WH8+GXUjMqwbp0oY7btmRgcVRdEmYwjoZbj3lwWtIEV8hh4sajAaQ89yjQ
 wIaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2uZyezzLgGzt85KJG0z3uupq98abxELw9KdoL1g0LDBzKYLc7KH99m9jnlZFZF1saEEY47KJDlvatwT23QVXmnyOw
X-Gm-Message-State: AOJu0YwN7dcKz613FV2qHOXOgf9CmFG0d4LguFHn7TbB+rVUTmT0/D9w
 Lt3sipXaw8lXckc7LqgBjcv1a1Tar1IK+Df2uhFw23iLT4aRcH3DmCcNfCLf/t8+hlYuM1Dgkfy
 rBdYoyg7/iKhntcm5WrGRsG3mdB1h51/mDL4tBw==
X-Received: by 2002:a17:906:2b93:b0:a6f:e069:3b06 with SMTP id
 a640c23a62f3a-a6ffe3ceb11mr738604066b.21.1719319144156; Tue, 25 Jun 2024
 05:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
 <20240625050810.1475643-6-richard.henderson@linaro.org>
In-Reply-To: <20240625050810.1475643-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jun 2024 13:38:52 +0100
Message-ID: <CAFEAcA_Gp0ryBCV_yGHe9x7Jv8isbAePyNTJZ0+SD9Fkxpuz1Q@mail.gmail.com>
Subject: Re: [PATCH 05/13] target/arm: Convert SDOT, UDOT to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
X-TUID: SxDL3GbvIsv5

On Tue, 25 Jun 2024 at 06:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  7 +++++
>  target/arm/tcg/translate-a64.c | 54 ++++++++++++++++++----------------
>  2 files changed, 35 insertions(+), 26 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
