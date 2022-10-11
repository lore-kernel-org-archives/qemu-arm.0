Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2884085ocg;
        Mon, 10 Oct 2022 20:21:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Pc0Zu1Iqcsn51pTPruHnIivep32XCk2BTrjHqviA7O/l2kAnNTpBUaHxIJJclGCMSaINB
X-Received: by 2002:a05:620a:462b:b0:6ce:7dce:82d6 with SMTP id br43-20020a05620a462b00b006ce7dce82d6mr15014317qkb.476.1665458485417;
        Mon, 10 Oct 2022 20:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665458485; cv=none;
        d=google.com; s=arc-20160816;
        b=svEssZQSFm4AvlRPZ4gh3frI8ixHfMSKDIzemoZ43uGAcY+vfBN7SnQrNA/kO1lF6t
         FeCp0AXJ0qI2i5dwEWs7hydgZKnNm6voXbH1ObU/Q/roaDE7ULB+jgUlKlic3dkcEXg3
         SX+fEZEOMIurYU3hdgNkDZqw9l16X3xYhhOAfQQZHsriYGFvIeG6Ah+V37dkl2/9g5A8
         rX1U562Y/k4EXD+rX6ylEVezxAWlK4F8o1hVD3gH74+jdo+0iAm1gF1FI0PX+jJ1XbIJ
         ge1XkBVMlr1ihqSLPioorUH/c+1W9N2RmlyWuSdwneWdPA8YG2wK7tObvXeGz3MLYEL7
         oO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=CxVI4rO5bFW1ai6WrTjeyj0rW1YdO7UMXKRiY4kqRj8=;
        b=xcNVkIXMtn7+mKa+HLBpqldzdiYmDVMs90Cgv3fPtyXtRz4eMX5IOOnJFE+SLghwz1
         qXUK0BlkLki/cUlSk7H3QbFsfE4ZOedKtrmclppqN7OHwu0887ar1V+g3Z5fWXSFtYZD
         Zdi7TCESpy4veijEJb1NBLBWIQICcmNXd5dPtEwaf/ePJG5hObZSq2zuOnIuzzz70wmx
         cMUSLq3yyJZcTBGo7gKI34Y3+0DKKic450cz0pFxi+STCGwg5VTc4LBXK7iNeEXCPMgJ
         BBO6DnXr8muAzfu8TNRj6MMbJIVizngxSm2uBWPca6aM4krP8AinIGnkzLfW4p4eZzUT
         ln3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F83CPI5s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3-20020ac87003000000b00342f7e90114si6369317qtm.759.2022.10.10.20.21.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:21:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F83CPI5s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi5pd-0003xl-0I
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nc-0002Dj-Rh
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:22 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:36699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nX-0002z6-Mr
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:17 -0400
Received: by mail-pg1-x530.google.com with SMTP id s206so11788090pgs.3
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 20:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CxVI4rO5bFW1ai6WrTjeyj0rW1YdO7UMXKRiY4kqRj8=;
 b=F83CPI5s+qVqIR0FBsFOGjjsllNHz7/R7XbbhbAul5uffCcHpkWH0WvuJqbQoJb1hQ
 TNHTpb8vFWYXYhSs+nqriP+1ZW4ISfGcQZldoOpRvl9y4RsHfWP5bJAzsrdy6hkZOUnk
 aOlu0vEP4gAl3EEmy4L/4jdMZlHd1CmpaqxIVIeCcdNAiAHi15VTi6oj3Xmte24rqslN
 Fe38iMXfNJax4TNJ6+X0HFQ/0Ocv9tQs0kYOUnEYFKq2/yg7a/iRlKc1z65E1SJTEU4P
 c4V9Q0g5AluN4dUhBuCDI5dcoLAbCNxK3T1l/RSwGx1Bk0eVaI4DduWlxuZSXWuz8Ywl
 aDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CxVI4rO5bFW1ai6WrTjeyj0rW1YdO7UMXKRiY4kqRj8=;
 b=skaxTvmzAfeTPTcQzxHCHY4B/DGDcujbA1n+nmHr8+9BuAIQZSiBUY0cqhi9SDlMBV
 ZB+LKvjktldxYBZnzHaUT33S0NyZmW8Z0DcUdh1nehC/68gnXbmAAguU6kyzboAmt1+i
 MbKW2HEllQRziNpuAzWQ2BeF5Vr2pfoabxo8TRF/uhatsQJNNryiDwCBxk9eOJk/ptlk
 clcyO/3gDluR50ODYa2Iu0IQ17Fx2Bstcc69ZuLgZ6K3+h6xlTKm5fXnmVEMtBe66lvK
 Yvsm/mb1erR52y+DeIfKcaXqQL1UnywI8fr+rNFGdDns6MhQWq48liSaJbux8LTsLJyY
 2pCA==
X-Gm-Message-State: ACrzQf2hvF5FmMCtEpvE82PPVU8qQRSoevBycEB5/ISAsDOGvOZ9vqEM
 VnoVSSYKXM8CQxlx4BcBbL9LPoitVTQHuA==
X-Received: by 2002:aa7:8893:0:b0:563:89e0:2d43 with SMTP id
 z19-20020aa78893000000b0056389e02d43mr4994480pfe.25.1665458353954; 
 Mon, 10 Oct 2022 20:19:13 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 00/24] target/arm: Implement FEAT_HAFDBS
Date: Mon, 10 Oct 2022 20:18:47 -0700
Message-Id: <20221011031911.2408754-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: euB5mas/b/gK

Changes for v4:
  * Rebase on today's target-arm.next pull, including 21 patches.
  * Split AF and DB enablement into two patches.
  * Perform only one atomic update per PTE.
  * Raise Permission fault if atomic update reqd to read-only PTE.
  * More use of S1Translate struct, which is perhaps now mis-named but
    more generally useful/used; suggestions for better naming solicited.
  * Other minor updates per review.


r~


Based-on: 20221010142730.502083-1-peter.maydell@linaro.org
("[PULL 00/28] target-arm queue")


Richard Henderson (24):
  target/arm: Enable TARGET_PAGE_ENTRY_EXTRA
  target/arm: Use probe_access_full for MTE
  target/arm: Use probe_access_full for BTI
  target/arm: Add ARMMMUIdx_Phys_{S,NS}
  target/arm: Move ARMMMUIdx_Stage2 to a real tlb mmu_idx
  target/arm: Restrict tlb flush from vttbr_write to vmid change
  target/arm: Split out S1Translate type
  target/arm: Plumb debug into S1Translate
  target/arm: Move be test for regime into S1TranslateResult
  target/arm: Use softmmu tlbs for page table walking
  target/arm: Split out get_phys_addr_twostage
  target/arm: Use bool consistently for get_phys_addr subroutines
  target/arm: Add ptw_idx to S1Translate
  target/arm: Add isar predicates for FEAT_HAFDBS
  target/arm: Extract HA and HD in aa64_va_parameters
  target/arm: Move S1_ptw_translate outside arm_ld[lq]_ptw
  target/arm: Add ARMFault_UnsuppAtomicUpdate
  target/arm: Remove loop from get_phys_addr_lpae
  target/arm: Fix fault reporting in get_phys_addr_lpae
  target/arm: Don't shift attrs in get_phys_addr_lpae
  target/arm: Consider GP an attribute in get_phys_addr_lpae
  target/arm: Implement FEAT_HAFDBS, access flag portion
  target/arm: Implement FEAT_HAFDBS, dirty bit portion
  target/arm: Use the max page size in a 2-stage ptw

 docs/system/arm/emulation.rst  |   1 +
 target/arm/cpu-param.h         |  15 +-
 target/arm/cpu.h               |  57 +-
 target/arm/internals.h         |   7 +
 target/arm/sve_ldst_internal.h |   1 +
 target/arm/cpu64.c             |   1 +
 target/arm/helper.c            | 163 ++++--
 target/arm/mte_helper.c        |  62 +--
 target/arm/ptw.c               | 945 ++++++++++++++++++++++-----------
 target/arm/sve_helper.c        |  54 +-
 target/arm/tlb_helper.c        |  24 +-
 target/arm/translate-a64.c     |  21 +-
 12 files changed, 862 insertions(+), 489 deletions(-)

-- 
2.34.1

