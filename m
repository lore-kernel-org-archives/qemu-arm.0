Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp51170lfm;
        Thu, 25 Jun 2020 20:38:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBvqkPqlQtK9TmTYYDuRJnODI/UWeHiieYDPBZygWUAdgRGFEXsf/oL3eJCbVopy/AvUhF
X-Received: by 2002:a25:df09:: with SMTP id w9mr1825496ybg.67.1593142722374;
        Thu, 25 Jun 2020 20:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593142722; cv=none;
        d=google.com; s=arc-20160816;
        b=yWA70uS95fWLuR6wIHivSoA0XbIOP/BmSfEkOxbj3XEgg7VB29CyeIf+pDrVs3dPy4
         GHMto1ZBUDoEH0ccQARiHlwVWWIVQMUME4p7ECmTTuR2rrzKV6muTh7EzWk+YZwHPT84
         RBSoNwiGkiADMyBHUifuRBkHXcvKNLIbQaCBF1MwhLdKPSxAq5w5y5dg7cNUlu3RtiA7
         iE5LpA3FMnwVe91fjOppeGfoqGF283tS7vKH2a2pj/0ujNozfs+N3X9rf7ND/Jh4mcLO
         +6tGqU6WaZb/8vvOJ4fIypG374x1XJbwAgPciH+J0BMwRgRk91a8hCCUqhnmR46XZ0Fg
         96fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2lKr79btPsGcUrr83LCqC7k88F7L5S0PZjZ4KnKs9Y0=;
        b=cU8rAUbLNKwldzE7SkTGYi/Yl+hGLdTLdwMWt76B92IUXZiI3SBHdIjH3YN6eqhrMx
         /WLEIAt2dP+HF3I8PJ8nQoMIc0m3QpX7IzX/wv/rSilP/f12XY2OSZfY5TYCXNsTtmA2
         ZqxuJxQLA0njct+JvGFQ2XpZ1sV0AnvhRnQJesudmiFplFfgSWGKQW9jtPuABGmmVdkg
         CP3L56b5XBoXCBQIfd1M2D7t+t2qKwg30FZAAg0uN4E6+2jLQ6+YbhBMaknX+MBe7K6X
         CnxBSoeyISF0Gl/f2SfLrHHjEmgQn14vIa3HCH9DuVMgvJQC9dksS5Kwl+HPSDOHYVrr
         qGug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FrCwEwPm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17si1473600ybk.289.2020.06.25.20.38.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:38:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FrCwEwPm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofCL-0003tH-Pi
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6A-0000Ga-Un
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:18 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:34846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof69-0001vC-5W
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:18 -0400
Received: by mail-pj1-x1030.google.com with SMTP id i4so4373080pjd.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2lKr79btPsGcUrr83LCqC7k88F7L5S0PZjZ4KnKs9Y0=;
 b=FrCwEwPmwwG+/wZygVrz3LX7DebcHjLkrigO1ZKPk0mxTcVfJErG5KfPL32MDIyhKU
 uIm2kdN3Olbe0zUkoudsr4aZw6oCqHFis7TXHgsxeOsn1IP2J8cusrJFdmWZzbDll0ms
 qxRYDBQZJG1AC6/QGIdniaGqd+lsDMubpLEJeuV2mn81e0Wz4+GbUsoU4j1UR4H0EV7U
 C17eVJFoNU8k71vETS0P4k6xepwzOvW76W34S657V+8gCtmTS/sfkJxHF8TPvNJrPQD1
 FEXEEgR4AAtb+ZwCBacRqNPS0ZD8jvyxNyawba+rxdXqjieOMcgFWFtMV2duxO0w2g8F
 Uw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lKr79btPsGcUrr83LCqC7k88F7L5S0PZjZ4KnKs9Y0=;
 b=OMEwIXkkuFfTvg9SlSJBOn/Cy//Sz7A9tpx7Lf8aW04GdZXW+Jq/y8ud4zaOvMTro2
 31HqbmimGDSj501SiwQrLZFtLvlmU7qny8Y2THd9puu3fY86+Wp4cbfO+sARQAK+DJK4
 89tjqequqUkn2eFs4CsIQJfXttaGESRxkwEYCvQA+bExryS/1FIrhxAD59eQOQL3tjv2
 H5S5v3LjtJhSmGeHp2fZOoaxSkvnd1+Sd+nKkzo996YatXDA3GaN4mb+euCjp5C8XkT/
 Hy0+3U/f5sJ8JdVaiKbhgzplgTGFjoPfYBAtYiU1kbeEzX9wHtZN3X3DSEc2W8y2W1+4
 R2/A==
X-Gm-Message-State: AOAM531hnAqhpqb/9SbxvxnvWSrXXciv/12bkQlIUj3/WxfsU/f5WEL9
 OJlOUhVK0f8oAwPROR7Ypq0GxQ==
X-Received: by 2002:a17:90b:30c4:: with SMTP id
 hi4mr1141249pjb.166.1593142335724; 
 Thu, 25 Jun 2020 20:32:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 22/46] target/arm: Move regime_tcr to internals.h
Date: Thu, 25 Jun 2020 20:31:20 -0700
Message-Id: <20200626033144.790098-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pf6R0u5c1OHG

We will shortly need this in mte_helper.c as well.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 9 +++++++++
 target/arm/helper.c    | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c36fcb151b..7c9abbabc9 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -949,6 +949,15 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+/* Return the TCR controlling this translation regime */
+static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        return &env->cp15.vtcr_el2;
+    }
+    return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
+}
+
 /* Return the FSR value for a debug exception (watchpoint, hardware
  * breakpoint or BKPT insn) targeting the specified exception level.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d14313de66..33f902387b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9875,15 +9875,6 @@ static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 #endif /* !CONFIG_USER_ONLY */
 
-/* Return the TCR controlling this translation regime */
-static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    if (mmu_idx == ARMMMUIdx_Stage2) {
-        return &env->cp15.vtcr_el2;
-    }
-    return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
-}
-
 /* Convert a possible stage1+2 MMU index into the appropriate
  * stage 1 MMU index
  */
-- 
2.25.1

