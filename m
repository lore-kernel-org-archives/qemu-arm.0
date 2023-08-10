Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp803780ejc;
        Thu, 10 Aug 2023 09:41:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHueb6L/AoOFJT7mxsIelnWEhwFkJMz1giTBH3qMOPI0jUdSQTHMrD1dunJk7pz4lGPamOc
X-Received: by 2002:a0c:fb12:0:b0:636:6205:fb01 with SMTP id c18-20020a0cfb12000000b006366205fb01mr2902715qvp.34.1691685715127;
        Thu, 10 Aug 2023 09:41:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691685715; cv=none;
        d=google.com; s=arc-20160816;
        b=ATzwmqdfeH/htQiVcup1xLa2NkXQt4jBSW/CrERDlQFD/Hmqpb3BIlHeqMJTkK5grm
         wgfWnKgeAYFNw/C5WJeMUfGnsnj9y9VsQWnEA5O3G86RURWPGARyJBgZf3Pk5OEpCvWP
         P6mObxRTWhRnbMdFDKgxh9x8iGEMnLS94tMFBRX5cm7LH2s2W8vNo0dutcEBlhWt8GHd
         Rd7yh7SjEgozbaTSOX/zaEMuLRVtGklTtjPn0fbCjl2B/u5TlO3M3gVW0rrNdNt6NSZp
         CUGNNgCR0SJmomVEAlLnWMfyqUqA+jjuoLpAgAvPi4Q5NR5SUh9s/zv9nDn/hRk/UCl2
         qsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=b8AAX1HEkupo+tqEtWJV6eUhNeCUQbFrc488Z8Uoplo=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=wOfnCupLFSQLZGDwDg33q1KQunBTvM7ImVDNv7AxkOdlv60pewm1saTAj7nuf6ccbu
         2xau5IrwGe1hg/hZskQZwaDcb7IRRgp8yyedKhoqO6KGXSMNeeDpIRKyyQnZa4HLykAR
         FF37s+JRCQtwoiPjQSwjQe4j9da4ZqtMqhuRTFoSiN5gxELn9/LpWW1MVxswNxWivHoR
         UxcjYP3LK1yrla7m5nicXAZBTEEXlQeqLqPcWWTZ5WGEAOORzG3yCcnURdXjZnjVI+2u
         F7aKb5yEbDvzUG5ZsK0qStHtYSDlRg+GOLyjj5etwp63u0PI1eZLmY3zfmSKEW5Wawc2
         z29w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O3Hx7YHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4-20020a0c9d44000000b00635ff0e3295si1046143qvf.519.2023.08.10.09.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 09:41:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O3Hx7YHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU8jE-0003jb-1I; Thu, 10 Aug 2023 12:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8jA-0003hY-J1
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:41:37 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8j7-0000V6-Ko
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:41:36 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe0eb0ca75so1631168e87.2
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691685692; x=1692290492;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b8AAX1HEkupo+tqEtWJV6eUhNeCUQbFrc488Z8Uoplo=;
 b=O3Hx7YHmUJBdo6PTg+ECeZY/1GC78bhftaBNe7ttUVRfWTUJiJrjU+8t0gJrKDFEzg
 FRlVq/fmMQzWn3I3sbD4qNbbL7H/krAWg/uCJTadtY6icV7ysQgeVlSpNbTMM/b2gL1N
 LPD6bkyDjXuxylruTYnEuPlRxHZ19GliPq2S2pH0Atndc8nwtZqfdZKQwW/SkLkerzAi
 rMOARP7LbZmCNT+CHfDoHlcCIs/VWm7IW7tny+g8HXJPX34x6Wb6w6p1+h1ZpHEMNTDm
 /bt64NM5M5z10Ru1sJwNbwNLvRWXYi1/XQrPfN7EbukuRmGph4S8qiKHLQeMdZYg7uLT
 BSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691685692; x=1692290492;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b8AAX1HEkupo+tqEtWJV6eUhNeCUQbFrc488Z8Uoplo=;
 b=cfYzGujwWmPZEn+9fgB8Bm1c2ecmyWwQ4jOV/VcgZt5ux8pXb2qJDIrxSAaxKHoVCu
 NbnAlkyaEIofARzoDs04fAYiHneGLhrZXej1YTwbvUw8HKRsl0vPnZLFRg+ofu8edwBG
 cijzgy+xcFn715caIqDNmeNF0FV4rN97ul/Dm+aDN88pwrNiKxVTFvEIaa/NMZi4pClm
 ytuUX1XY11Gy/IOmkqagRh8p3nCWOqH0J/tF0v4j0BFs8uGbULULn7pRkVmD0OvHmqCg
 nhSltqX81HWdWDI5PN1ESMLFLoYS3NiQC4W/gANr9V9oC7l6h1cD8gvfxB+tmwpkg1N6
 DsJw==
X-Gm-Message-State: AOJu0YxkXKg05WSvIuTCXsP5vN7M68hqU1TS3qTm0Z0y1XGmRj2KL/CP
 bJKWDbMe/TMIzJmZdfuMiq84jueTpwCS8l7hWa3C1Q==
X-Received: by 2002:a05:6512:3696:b0:4f8:5cde:a44f with SMTP id
 d22-20020a056512369600b004f85cdea44fmr1880839lfs.10.1691685691596; Thu, 10
 Aug 2023 09:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-14-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 17:41:20 +0100
Message-ID: <CAFEAcA9j4NcpwLudKc8kDEdEV2itXS1UTyR2u97hROWJ_n9=pg@mail.gmail.com>
Subject: Re: [PATCH 13/24] tcg/arm: Implement negsetcond_i32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: xBHI5HtB4H5K

On Tue, 8 Aug 2023 at 04:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Trivial, as we simply need to load a different constant
> in the conditional move.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.h     | 2 +-
>  tcg/arm/tcg-target.c.inc | 9 +++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
