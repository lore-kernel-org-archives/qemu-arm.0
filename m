Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp487078ejy;
        Tue, 13 Sep 2022 08:50:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6At4t0SHsMj14sDTY2x9xLyn+4FUaldt9HiOlyJBHp9S+0P7FQbRWUVZpyo6yr/3VpFo5y
X-Received: by 2002:a05:620a:2156:b0:6cd:e76b:f65a with SMTP id m22-20020a05620a215600b006cde76bf65amr13875913qkm.308.1663084252510;
        Tue, 13 Sep 2022 08:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663084252; cv=none;
        d=google.com; s=arc-20160816;
        b=T1S67ITlWrsM8gkvydKKSYOd7YhEWuTj6hDO5Dh0ExTCOP0rslL8SuXNPdMReYFQFz
         J6T+BgBDAY8A3N/NxK/4CDB5qJrsVN3LFNaPxzpbuoawj+yNsZJYDowmVcmH19BIQTmH
         mtoCMzjO6do62yydRzB5L5SKMit3gix+z3JXGieADauw3hMyIaFyszCFMuzuLXS9VZbT
         T2Z2QNkxWM7cILTXj0XnBLEDfs59rh5edE9RqW8xvZH/vjW0rbuYADCrC4mrZSIAUuDi
         u987Hi7Jw9bMR8CcL003kc4ehpwfB9UWxWlMDo+EJfaUh3NhAEUpvHYxdt0A+cuZCfMc
         n+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=zPgXvBKfJfKdVLVw1MwG7vyTC/gmDC+uf6dtarBonqk=;
        b=vhV+MiFrj2Ojn17S3qhY+LwalHeBUzf2a4fIb0fk/9xMXCs7/hoR3Sf4cHA8nxrfa2
         r4QqEjlyF6o5DNXex4ECeRdgcIx233kex4E6MEnqGoWepyuauV4BAHZ07xHRK44dZVT9
         71/80PeYH6IOwBUWgEfXtgHtf2VInVr4ruMMFp9lSjONuSM1UX5gpUe8xRgR8NB3DoX5
         iJGfUX6DgD7z4onYDP6HQthkXE/X+NldmG5qHeCsvKQ7fKdmeWiov8ZMFAsRrJd94GM2
         fqcqPYZSoloOuvV65YYoHCjZ35rIqOVemdNE6w2A9LZM1sNKDedkH26mbi8w5PTADHcF
         ySxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVrQjH9j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk41-20020a05620a1a2900b006badde3f297si8766772qkb.49.2022.09.13.08.50.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Sep 2022 08:50:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVrQjH9j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oY8BY-0000LL-0J
	for alex.bennee@linaro.org; Tue, 13 Sep 2022 11:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY8BF-0000IB-4z
 for qemu-arm@nongnu.org; Tue, 13 Sep 2022 11:50:33 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:47000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY8BC-0006L5-Sx
 for qemu-arm@nongnu.org; Tue, 13 Sep 2022 11:50:32 -0400
Received: by mail-wr1-x42a.google.com with SMTP id g3so590264wrq.13
 for <qemu-arm@nongnu.org>; Tue, 13 Sep 2022 08:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=zPgXvBKfJfKdVLVw1MwG7vyTC/gmDC+uf6dtarBonqk=;
 b=EVrQjH9jDMdGKX9O1t9EWc8QgvM7RB3VVDSRWN9fO45AbDo2+4Md1b1DpeTsPSlghZ
 CcmCIBXcErm8dhO/aaX9flANv+O4GOjpbdNOX5vZ8DM/ih+fiAkcHGiG5+Yy9I4YrmcH
 uVUVDvSkzcAafwQ0a3nDsP32SBMm9x+DoIJTL+nN5lJ/y4rVDlvcwuyuhd50axJvGazW
 kEK3+eYLwo0/wB4GGUPCFQVIxiHHVsEsWDZYSUE777YXhVOXiV9CPloUm2iuseHbC9vD
 HhZoZknZCog7pykj+N/qmyao/X/uOh45c7AhjkakPyUbYbe4RE3x08Cluuozgox8W2eB
 mwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=zPgXvBKfJfKdVLVw1MwG7vyTC/gmDC+uf6dtarBonqk=;
 b=SgYym44zHc8737LYEV73lKcRqFf1xJVvEcNwWJnEL/raj0HavdnOVdr0ewS0WAGXnD
 YOiXbOq3SR5hE33Zt9FDSvRfe3Q/Rq2d5IzXJeYOAfeB8WaUPomGjQB19i4a7Orc6ZJB
 CrhgAIXYLDQjgfmLUWUDCVbtyU42wlV3GXAFKaeuYKbodGUYsq4jrPrlAJWl8c+OKWMa
 fmpQM1HNonc0rNE27JpaAGt4nI0k/SCpcY8edigc8z88nfTifkcHJOVMDO7iK7Ikti6O
 Wh6WOwTlx2mBXFaxN+DSzEC9bontuIrzVS+uOlwrDJeCyyOi5KBzu7/3be0eekk6dy07
 n5IA==
X-Gm-Message-State: ACgBeo2MqEVGhdvemFkeXdnVfdDONcDM7A+Zsr2BLN72Y4TcwwE1D9eN
 1Do2jGenQhaJHRPYdiG9bM0Fkw==
X-Received: by 2002:adf:d1cc:0:b0:22a:450c:6208 with SMTP id
 b12-20020adfd1cc000000b0022a450c6208mr11600820wrd.696.1663084218167; 
 Tue, 13 Sep 2022 08:50:18 -0700 (PDT)
Received: from stoup.. ([89.101.193.68]) by smtp.gmail.com with ESMTPSA id
 b11-20020a05600c4e0b00b003b492753826sm5164972wmq.43.2022.09.13.08.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 08:50:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH] target/arm: Do alignment check when translation disabled
Date: Tue, 13 Sep 2022 16:49:56 +0100
Message-Id: <20220913154956.12731-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0jB/nxdQrtWq

If translation is disabled, the default memory type is Device,
which requires alignment checking.  Document, but defer, the
more general case of per-page alignment checking.

Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1204
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d7bc467a2a..79609443aa 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10713,6 +10713,39 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     return arm_mmu_idx_el(env, arm_current_el(env));
 }
 
+/*
+ * Return true if memory alignment should be enforced.
+ */
+static bool aprofile_require_alignment(CPUARMState *env, int el, uint64_t sctlr)
+{
+    /* Check the alignment enable bit. */
+    if (sctlr & SCTLR_A) {
+        return true;
+    }
+
+    /*
+     * If translation is disabled, then the default memory type
+     * may be Device(-nGnRnE) instead of Normal, which requires that
+     * alignment be enforced.
+     *
+     * TODO: The more general case is translation enabled, with a per-page
+     * check of the memory type as assigned via MAIR_ELx and the PTE.
+     * We could arrange for a bit in MemTxAttrs to enforce alignment
+     * via forced use of the softmmu slow path.  Given that such pages
+     * are intended for MMIO, where the slow path is required anyhow,
+     * this should not result in extra overhead.
+     */
+    if (sctlr & SCTLR_M) {
+        /* Translation enabled: memory type in PTE via MAIR_ELx. */
+        return false;
+    }
+    if (el < 2 && (arm_hcr_el2_eff(env) & (HCR_DC | HCR_VM))) {
+        /* Stage 2 translation enabled: memory type in PTE. */
+        return false;
+    }
+    return true;
+}
+
 static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
                                            ARMMMUIdx mmu_idx,
                                            CPUARMTBFlags flags)
@@ -10777,8 +10810,9 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
 {
     CPUARMTBFlags flags = {};
     int el = arm_current_el(env);
+    uint64_t sctlr = arm_sctlr(env, el);
 
-    if (arm_sctlr(env, el) & SCTLR_A) {
+    if (aprofile_require_alignment(env, el, sctlr)) {
         DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
     }
 
@@ -10871,7 +10905,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     sctlr = regime_sctlr(env, stage1);
 
-    if (sctlr & SCTLR_A) {
+    if (aprofile_require_alignment(env, el, sctlr)) {
         DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
     }
 
-- 
2.34.1

