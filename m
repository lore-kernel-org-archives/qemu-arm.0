Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp504293njc;
        Fri, 21 Feb 2025 11:10:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUI2aaErt9mt0jaZ+57tTKtncTuwkTx0+BScSAf44dqDX1KBnzM1n5ue/k86eL7hD/Hg/JnXLKTpAJ+pw==@linaro.org
X-Google-Smtp-Source: AGHT+IHQS43eaFvJRz2bxXQMvnSXn5Y1guFtkR52p088oPyyjJhdSDA8BCArWn8zZcJ7FnsejXUD
X-Received: by 2002:a05:622a:2d6:b0:471:f0d6:8f32 with SMTP id d75a77b69052e-472248f4bc8mr60216661cf.34.1740165035470;
        Fri, 21 Feb 2025 11:10:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740165035; cv=none;
        d=google.com; s=arc-20240605;
        b=JAPRMmdAOd/Fd4cMdngQnzH6pGCDyYRbY1U10pnbuMM34GaR3h0QADcANvGfCsro/b
         F2iUBERFUnMXjRDV+jdpZFfJgXQ2hcsnD7C4jtA8fBKYpC9GYOi1qGwfjMcszXdPJXWo
         q0hufho40xE1ncw5tuS2o+nlH1ZFG2vV6N826r5/1oWdZ57Yrppo4Mj9/mkLIE/ijGws
         dGu2ywLm7/3qQyEqJ1+tw7LK+hA82A4vI/KZ1P81in/0I1s/z8+92m9fgkMypAlm+K5n
         DL7q8A0By+svUjQ45WDc15TpMCI6WMPv4+1iIxClhNhCFIQcIEe5LYOky5kKl29Tfl5I
         Iagg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=9+rzFkAvq1fT8VWgYWTbYKbxozjg166B260cDEJsA2M=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Yj2tuc4kcZp+1MhE2STKmI8isEAT1Kvwu2ipWnwWFXW43ZlZDKnY/zmOvgDyN++JPc
         NqgumGQzMI16NTXsYDuCw5rAC8u9L0CZ88ELbtdNT10zhQCByWpCCg/CEOcgSI5JIxD0
         K+FIE89WyExPaUy4pi3PcTSne+r7/v3igxiu2uwAyCXLfOvlriUXgNGYzodr6v2+fvYc
         qM/pEUz0dvS0KLt3EIlgcVOvP+zlqRhl/vpzd/RMydtK+RJrqF7bWwMqlJawXwtbfRb6
         BmTm85ttfecV9A2tn3gtQpFdUaykK9hMiY6wcTuJNksEgNwBCVeC99iFtqgMiwowq2WR
         RN7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vlyDM0fX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471ea82b828si105625071cf.188.2025.02.21.11.10.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2025 11:10:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vlyDM0fX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tlYPW-0006Id-BC; Fri, 21 Feb 2025 14:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tlYPU-0006Gq-CK
 for qemu-arm@nongnu.org; Fri, 21 Feb 2025 14:10:04 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tlYPR-00044m-Lc
 for qemu-arm@nongnu.org; Fri, 21 Feb 2025 14:10:03 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4394a823036so24229695e9.0
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2025 11:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740164999; x=1740769799; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=9+rzFkAvq1fT8VWgYWTbYKbxozjg166B260cDEJsA2M=;
 b=vlyDM0fX++eZN7A76pAEBnCVdTWLarrZHG6RnVAGtnRZ2nFqlSlZlclS4CMRbEi8ww
 yx4QOH1rKDxEAOI5dz8F6ht8nWSb8YTomBun2YWg+uqsLDABHw4OReOsWAu0jWDUKAZ3
 1Yxir2d73mYd085+lkgCTlJWJyVPvM5wgI6NfXFUpLFvIpb9UxQkrJ92RjREwOGU2R6l
 lX2U3DnlcDMQzO2Wsn20a41DQ0Lxm6WrVlQ9ViuNDqlIjTJp09YD9IANyxtu9CqbhdDW
 eu1jzZMsc5t41fFdtOABRYnFR1rhYKWsVvmq3KzneixKMyCDBtSJ+qOT1srhXovsGeTg
 j8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740164999; x=1740769799;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9+rzFkAvq1fT8VWgYWTbYKbxozjg166B260cDEJsA2M=;
 b=fBexmmAZSJZt2jkXepHe/Vczr4uzcEaQMMz1cOSwq34t6CmYknzbkwehfqx/OXnbIx
 HbGI8691c69Mnsymgp0NEe3yuq6PfL+fCvstXEjvGwjpsycRInjzhjqxmPhBcUQkAAfF
 e+PLORHP0o/7KnasONHuMl/znI1B8flmLSo3oRavDrCsbclK6N8DnPso93eNKJFUKb9w
 AfoQgAEiJ8YUdzGW4FkcTr8H8bxXf6CiSNyv6prdxr1FUOEsj2KAlBRod5YZ95O0w5qF
 fuEBaNv2WzS2UzFEcndjkc3RHG8gUKSQF9n1I+3AlDi9VF6K0YjwWlwkkSnGm0nO7v77
 QzWg==
X-Gm-Message-State: AOJu0Yzg//UTq12xcGbYQ113e9bUHcCj2OXC9GP9IV/z9cFc6noySCkG
 4ClqyuMSWiR/iPEWhtjVj6jvp0OLdRoVAHxsupL4/iSRbLRHPbkDlP8EK4keypfTtYR8EG9tPvW
 X
X-Gm-Gg: ASbGncurK7HB6bTaIM3r/ehjTccZJGC6qg9djC5IapurOQcQci+Q5EmUwxBN8GMwPxP
 eDgDvoUuwhV8oT7At2i2JZn6873iuy7A/2IeCXZwrsybDQtEoWmTAgx33cTPnSBB6ABhFpPNmC2
 fZLBRS0llMdESOTdeYhhTH+hpzbWMIxX7/DCJd65+c5NW+6gcnjb3D3MoBlsieUTcj+F/ohZc2k
 M5lu1F3NkM/eBq/WS5CCgg8paD8zxy4yayf/zpnnFK69sJqX9eoFGT0VLGgCqCDd5GZbwnDvsGb
 sW3C7iHLYiJqHNQK/f5ZG2hUuyoa5I9D
X-Received: by 2002:a05:600c:450d:b0:439:9a43:dd62 with SMTP id
 5b1f17b1804b1-439aebb2d6fmr28356035e9.24.1740164999153; 
 Fri, 21 Feb 2025 11:09:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbe0sm24392478f8f.39.2025.02.21.11.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 11:09:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/arm: Move vfp_helper.c TCG code into tcg/ subdir
Date: Fri, 21 Feb 2025 19:09:52 +0000
Message-ID: <20250221190957.811948-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: 3RApViz0LTE+

target/arm/vfp_helper.c is almost entirely TCG-specific code,
guarded by #ifdef CONFIG_TCG. The only parts that aren't
TCG-specific are the handling of the FPSCR/FPSR/FPCR registers.
(I noticed this while I was working on the FEAT_AFP code, and
it felt a bit awkward but I left it as-is at the time.)

This series moves all the TCG code into tcg/vfp_helper.c.
Once only the FPSCR etc code is left, we rename the old
file to vfp_fpscr.c.

Series structure:
 * move the easy stuff as copy-n-paste to create new file
 * move the FPSCR get/set helpers
 * move the softfloat-specific parts of FPSR/FPCR handling
 * rename

This was just a quick last-thing-Friday tidyup, so I'm not
strongly attached to it if people don't think it's worth the
churn. I do think at least the first patch or some variant
on it is worth doing, though.

thanks
-- PMM

Peter Maydell (4):
  target/arm: Move TCG-only VFP code into tcg/ subdir
  target/arm: Move FPSCR get/set helpers to tcg/vfp_helper.c
  target/arm: Move softfloat specific FPCR/FPSR handling to tcg/
  target/arm: Rename vfp_helper.c to vfp_fpscr.c

 target/arm/internals.h            |   9 ++
 target/arm/tcg-stubs.c            |  22 ++++
 target/arm/{ => tcg}/vfp_helper.c | 189 +++---------------------------
 target/arm/vfp_fpscr.c            | 155 ++++++++++++++++++++++++
 target/arm/meson.build            |   2 +-
 target/arm/tcg/meson.build        |   1 +
 6 files changed, 205 insertions(+), 173 deletions(-)
 rename target/arm/{ => tcg}/vfp_helper.c (90%)
 create mode 100644 target/arm/vfp_fpscr.c

-- 
2.43.0

