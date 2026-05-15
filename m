Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6793CD4F47
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:26:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtUF-0005sW-U6; Fri, 15 May 2026 10:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtU5-0005eJ-4b
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:50 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtU3-0000ul-B8
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:48 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-459bf19e87bso3553337f8f.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855146; x=1779459946; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NIviysq2AqiFz9fV8rr10jJmjEvBfhW9uzxUqRTLkmo=;
 b=Zk1XrYKJ1IJnPsMwjhmk37DRz5hPFO2ybd+J43Gb0ZwwefXnQQHnFcQB1m03f5p7Xp
 MLoKu/riYFpVKqCKwlRztMMeobXo63vdu1ukWwL1CgYHLKzg1kWEf7l0PFHDUc7DdYjP
 b6zEIN3pAVsmOoBFxnJpuvvcWxAwEiuzUKW/nm49jgunLzVXSY3tGH5EUh0MyWkEt/ro
 uA0mtfOXllV8yc37AcDAvVM9E2mjjS341TMh8DOVLk9rpEwJ3Xx8S6LR1J9AOZ2kJu28
 8iBrcF7xVqc4eiAWNagXcRwCoGaHHbushLIpbd82u93Y3qJmD6B1CYcy27c3kT9quIfh
 /LtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855146; x=1779459946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NIviysq2AqiFz9fV8rr10jJmjEvBfhW9uzxUqRTLkmo=;
 b=FMA/q09OMKyCDWVLWItKQ9O4pXTCEMyeVKUTsOB2WqPOAMpsimlpocfSoJ3WaF2TvY
 pnofLbIED9pCvlg/X7saOteQSxKSSPDt9jh2GxHW3rLwFaQN8Es4IOUiKELtyHmo+5iZ
 Iqi/UWonMXYJynWjnekzyLFwgzUrKM6eW5PSjqKeWAbvU2zEZ/1XemKpAe6J3p1a/5rF
 0G/KqoUCugRCU0+cneVoNuBbibG7jCGNwmS0LnJJIog21sfJ85RFd0hPQmaLVOP6oQYA
 llkmVeo38OpEDCOMsn8OK7JYV6AYar157WD0FYpWHiW6zDylEzG8dkYs9cjVTgKKqKiE
 7eEg==
X-Gm-Message-State: AOJu0Ywyh0sZ9RrH+tc2ph4oow6mlKWAfkPTBzmcoFMzmOqELayHH/Hv
 s7edu428iavfnpwTqpWWFPGoRtw5/o0mSpc/fA44NwtFYkD+7+gViOgIRXtl1q1LVHwpWgU6HRY
 cRPJC
X-Gm-Gg: Acq92OGXbYOCdE9am10UwglMuzQQ2vvgfTn0b7dltev5a+SgeOV4PPorL70F0qlMoTH
 AG486V7f+XdQGMKQtd1r5wisHxWpsQ8jSHVkaYOcuRNngqdqWFi3dAi4pZisZAZY+oIPq8/ctPB
 jaEkRAAbGCsBDT1kLezMwZvt2JM0Nr178tT6dM2tOU0Nghq6SgII+ey9sGw8T438/vwcA0J+TEf
 6h5i2bHM4rlxAFrZPS9o3qP08pwI9cqJwYTYfEDpFZsDjfGwW1T4p863PQVBrwRmM1ki75qTjsh
 jBFKlN82A1b97mdp+KG2qjtZpRmdLTPCzaekRgo55B12M3r48bswEQBLTAAqx5M3OmSNixcncGs
 fHaotgDSFkc+hrkUZRykTZamTrvpZPmGqtVLcWFPyo1ThwVyLCbjbbG34O0CJsvK9fK4OU8Pddd
 hMY9aYGLqr3SXJ2/ECuSC3FZGigsiG6tzcPmxEv+N+/ZTyPH6cNVNsyi2+wM7+55sD60m4f7iR4
 vdu4tYaFuvEjk1of2B2fJg0FRto0jF1U9hfVMe5eQ==
X-Received: by 2002:a05:6000:26cf:b0:43d:7a97:78b5 with SMTP id
 ffacd0b85a97d-45e5c5ccbe0mr5803493f8f.33.1778855145871; 
 Fri, 15 May 2026 07:25:45 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a666fsm13560603f8f.36.2026.05.15.07.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 07:25:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 02/14] target/arm/ptw: Flip sense of get_phys_addr_lpae
 return value
Date: Fri, 15 May 2026 15:25:29 +0100
Message-ID: <20260515142541.571911-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515142541.571911-1-peter.maydell@linaro.org>
References: <20260515142541.571911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8a412f463a..93e77b3eb6 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1842,7 +1842,7 @@ static bool lpae_block_desc_valid(ARMCPU *cpu, bool ds,
 /**
  * get_phys_addr_lpae: perform one stage of page table walk, LPAE format
  *
- * Returns false if the translation was successful. Otherwise, phys_ptr,
+ * Returns true if the translation was successful. Otherwise, phys_ptr,
  * attrs, prot and page_size may not be filled in, and the populated fsr
  * value provides information on why the translation aborted, in the format
  * of a long-format DFSR/IFSR fault register, with the following caveat:
@@ -2432,7 +2432,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
     result->f.phys_addr = descaddr;
     result->f.lg_page_size = ctz64(page_size);
-    return false;
+    return true;
 
  do_translation_fault:
     fi->type = ARMFault_Translation;
@@ -2445,7 +2445,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         fi->stage2 = regime_is_stage2(mmu_idx);
     }
     fi->s1ns = fault_s1ns(ptw->cur_space, mmu_idx);
-    return true;
+    return false;
 }
 
 static bool get_phys_addr_pmsav5(CPUARMState *env,
@@ -3787,7 +3787,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
     }
 
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, ptw, address, access_type,
+        return !get_phys_addr_lpae(env, ptw, address, access_type,
                                   memop, result, fi);
     } else if (arm_feature(env, ARM_FEATURE_V7) ||
                regime_sctlr(env, mmu_idx) & SCTLR_XP) {
-- 
2.43.0


