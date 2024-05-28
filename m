Received: by 2002:a17:906:ca8a:b0:a63:3083:985b with SMTP id js10csp455737ejb;
        Tue, 28 May 2024 05:31:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCYfNXIggfXhz2hdytM6XoqcGb1xxInPwgROzudx6jZTGj213O1oQgE4F5CVGAOwjvH+BwxWhpP5mnI5iyqHWXOhkToApu
X-Google-Smtp-Source: AGHT+IGlU2YNT+5VLVXoD/LGk8OQV4ITcr9SsPh0CGDCnFgLTtkOESv1ieIVtCHtO5JTqnkYfrk3
X-Received: by 2002:a05:620a:4389:b0:790:8837:c0ab with SMTP id af79cd13be357-794ab0844c7mr1591918885a.28.1716899509039;
        Tue, 28 May 2024 05:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716899509; cv=none;
        d=google.com; s=arc-20160816;
        b=TpohsUP87zowahuDff+1fhnSwzgIrvT1LGD4NFp866vBMDOYRxwIYAubVgWTOuBS++
         kqb5CI8wLDHPY09lLOOOzjz34X8C1YPCeMYeG35DfU8nmY3eV+GDaXaJ1cW0lvKBvUqo
         0OCUFiCwtsAClSXOXFsCjv9qTxExycseW1thbniUfUDlsTJwlWz38sLGTLQweMT0hQ9K
         1az2IFHa/GF4tVM6+1vc35doLIKJU+/tX58ZGEaoyUNTvNEJqoA0YIzNX7aISMdMxIuC
         9AQPlpClyNVRXN7AJWiIIOeCvE3V6t3okw5tet4y1HgV7hiSFtmfPz2wo3kyx+kpAjja
         Vshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Q7YMTLqkHC4fWohjIg2vd7qVXGW0DOiWQb9NkyMeib4=;
        fh=/kYdl2c7h6zx7rYoAWDWTlm+Z02zq2F6+LTtX9DHhJE=;
        b=1AGxLSj23cX2Ra7V+nIerTWcDrvwpokogEb3mSyFKNKx1pa54ixdLsC7hwINGlZrES
         SGRauokRgNpJNq8H23yrZRiwF2JcwJBM2wZJQqmZs4d4W5DNi6diQV0BcgnGCIZmhLAB
         lHH+sN2/u1Iq3Um7XLjsQT2cVoxRG8kfEqUBKOCZo6CTiVH31DyDJS07pUMl1HTzjYly
         GmDoXT/zuGBUyZBGNjOmkKGC+crM5qFPprCNJGOaKojca9FYp4LClMK5O9yDf4YbsTIH
         Efv2c5vfaq4BFWwTDjXTEtLvEMmmsGHgIEz2xNL1apR3Tvhf9QO4h8TRM611E4czbZeB
         zK5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jBdKnxay;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd141a5si1110255785a.342.2024.05.28.05.31.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 05:31:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jBdKnxay;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBvzU-0007l2-Nx; Tue, 28 May 2024 08:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBvzU-0007kt-0y
 for qemu-arm@nongnu.org; Tue, 28 May 2024 08:31:44 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBvzS-0002jx-C1
 for qemu-arm@nongnu.org; Tue, 28 May 2024 08:31:43 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4211249fdf4so6039235e9.3
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 05:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716899500; x=1717504300; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q7YMTLqkHC4fWohjIg2vd7qVXGW0DOiWQb9NkyMeib4=;
 b=jBdKnxayZFC8VdDyqEG3VzwFfmoFYqjFALNwS42hGT290xUaykLm+MicCjgmHrWV64
 gG23bkNlUk5iWIS0Zunie5fFrTHG9rSENvqyXtfPVpGH51i7Ftv4nUPrn57zgRFMh2/d
 BYqj85QZvlgaQzhq8SOa2Ppb3cy43ivuK3qFefhGPfbJUn0NmZ2l9OdCguPUsjyJ2eDp
 HAjU3pc/H43k2f3WcmyLRaBfGkRUr5whUw+Zulwizk1G81DEfVLBu2ENq8o4MGXg7Ytj
 1HRo+FEiIIiTsvcp5plXUCS6VdpQCbwLFCTYOlHSTZowW7Ai/ij7SOkUrEV3qIBZCvju
 1ElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716899500; x=1717504300;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q7YMTLqkHC4fWohjIg2vd7qVXGW0DOiWQb9NkyMeib4=;
 b=oDv1rRMMNPSIbxdH0ZF+Mqn7Rex5H4meqmX5VoPHVysA6GEdpsvnHOkVCCMX/1LWvI
 U4BSs0OvTgKEpms2IclT+Q1BrGpz1iaw0KG7wFp/xhYd86aXxHDVXLJCeoEHbGeCWReR
 FVAp1mztbFSY9TXEZGF3VzQWXkqWLxoW5wcDxHbCNvwaIJfMbsq8KSj7G5pUu8NE2EKv
 z0A/Fmc/gxCrNQ+LnZovRfRUDtPsu98L6lcFAMjwI99txnKo7ywDF7mjXbp9PAQMRvfr
 YCYvW3+Vw/cDlbBrvP901LtZyFb3dpb2SpTXO+aTKbHQFJVQ95xIcA4LYsD3ZImrpYfw
 pwWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo2w27mkZCeMtQpfVN+30Yf19iPlEbuhCDhpAHyIQRfaeEBudTHt4d3acNsNgKowZtS+rLyGjkLoSsZDlgKHGxxcIm
X-Gm-Message-State: AOJu0YysZsqUVh7rJ9xrsGQKiP3VounFgynTHVgUewL5eHX632o4S4YO
 MetZ7zSftERaQFo+0PnWk1AF8/H3aG93U0E0Vm2bdkluqQIkDawR3GUPkL0Mfvmbxm496X6BNWT
 nAVPLd86aA2fL6zoUYjjRwhZJyL4fBiY+njgAh89IgnBPB2S1
X-Received: by 2002:a05:6512:1309:b0:522:297f:cb06 with SMTP id
 2adb3069b0e04-529651988b4mr8081085e87.32.1716899123668; Tue, 28 May 2024
 05:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-7-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 13:25:12 +0100
Message-ID: <CAFEAcA_5RMV-OU+U+0LAEEQJsag1MF-La64JtqzTcN7EZ6u3_A@mail.gmail.com>
Subject: Re: [PATCH v2 06/67] target/arm: Verify sz=0 for Advanced SIMD scalar
 pairwise (fp16)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: U3PT0vZiT7EE

On Sat, 25 May 2024 at 00:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> All of these insns have "if sz == '1' then UNDEFINED" in their pseudocode.
> Fixes a RISU miscompare for invalid insn 0x5ef0c87a.
>
> Fixes: 5c36d89567c ("arm/translate-a64: add all FP16 ops in simd_scalar_pairwise")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
