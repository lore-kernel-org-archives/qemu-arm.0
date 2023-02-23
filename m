Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1086006ejc;
        Thu, 23 Feb 2023 12:44:23 -0800 (PST)
X-Google-Smtp-Source: AK7set8sJxCdGKsB0N4su/8vgqZhggwEG2oyK/CRb8yXMPdVdw/J/p4Fy+8TXoIuuEGB3hq/xj3S
X-Received: by 2002:ac8:7dca:0:b0:3bf:b0c6:499b with SMTP id c10-20020ac87dca000000b003bfb0c6499bmr6531829qte.48.1677185063540;
        Thu, 23 Feb 2023 12:44:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677185063; cv=none;
        d=google.com; s=arc-20160816;
        b=kzgUt1gSDU06KRkohp2cxh2wEiHjeaTQ3MBX7BVst2qRQrbBT6SFaCk2Y767QHmVxK
         39mrRLMapiPTlLlUbUEXn+iXZgNJdNaNghGOu7tXFC08HUxpfhrx5oOhONL6E6fqkBTy
         SybHXc1hrBvacPddZ5T2h5aBIhEO4T2zSWL+KetTZemkHcozUPPrJTW+EVc+UVVa5lRk
         GWj3aL4t5KL0V8KpjWy4oz691vSs14XZzlTpKMvQsKKcMHb7MRD3/TT+31HCpz7PmpT+
         tWLr/Nc9Ay4sU9O7vlbYAPXzt8ypdvhmYCC67ijOexp9anMPB7BHshgPUDJIlQ1u+jlM
         PraA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4VpqcMOXVlrjqv2u2QyFnc/vNdrKfYNKBg4oxbaB+0Q=;
        b=rJEMjEhoQYpBCpJWGFFUSODbOd/75rJxWTpaKeW3Jq/3T6xVF8FfYvktpTVsSkIHcT
         S/MfwiUjrv757s+74JgomnhI8pnJH3WFXaLidVhjWGox6Wm2SiSBpnuO15rF+i59FkTn
         8NifqEvxRxD2n6wDLdQi0/OsJ6PKxozomTml48X5bN7MwhvCM6HWBGbHNTAGK5ksogE3
         WYWwHLpjnd/vJ7vVBBQQ2zH0fNE5zvj/Ou21KjfVdaFsWz36bpWxLqXEfNUWb9PdZCeR
         SUkwawRWxwrGtK5WpOHKCf6zs2OOsvTmXIIw1ivQegqIaBuWq1vfrKAILdDICQYBoFDS
         921w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AeF+e/q1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17-20020a05622a111100b003bfa09edb7csi8166790qty.633.2023.02.23.12.44.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 12:44:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AeF+e/q1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVIRn-0002ys-3b; Thu, 23 Feb 2023 15:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRl-0002yF-S4
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 15:44:09 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRj-0007UX-W0
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 15:44:09 -0500
Received: by mail-pl1-x641.google.com with SMTP id z2so14645625plf.12
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 12:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4VpqcMOXVlrjqv2u2QyFnc/vNdrKfYNKBg4oxbaB+0Q=;
 b=AeF+e/q1u6JXtK32KfD1tGeD3rTzWOTE9LnYz4oGELCJM5mBGEI71BjB61EQKWLjTu
 GhaWy0x0Bugy1WnUIv7T7ixAT/3e4biWSymK2/bkfvPn2SbIa0rFcYKOtFv9JJTHUr6j
 4MkdEkLBrZwLlEnxyV3aWx0WvofrodjuGgb8JnP8snXqf5XM9I5r2gynqw4NIOzOzj56
 T/KZ5oeLtK+0r6hSe9uuZfBGKPsYOp5GQ5W1RXKHSP1aJMOkJgBxcjm71pvgClGFihXp
 opjHUO/9Hi5x5lCDOTqXJuOCGHw0ygw3uBVr7b5/vlnpLwxhoc+eXzsugl2sMwDsn/Sx
 Efkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4VpqcMOXVlrjqv2u2QyFnc/vNdrKfYNKBg4oxbaB+0Q=;
 b=x/mR5oRWb8YO7oWLv0bHMx7tOLKAhWDGK2Kaq8FnY25W6WrTF+sBAOIRrajvNP3bjo
 hctB5FKWchsPYCqqMlI6/uwVBBxq6aEbZsd+5fE4auCD+I2zrsHHcpa85JygmBjNtNmH
 j2YSL6RKaRqRO8rj0SvWIuNc0n3l2xv9Ry/iienmH8Su8xflElsJ19tzHSdeUjpeumQ7
 ta0UUiO5HXlEYO3W9X7TTp6j93mB9iSfcQMmVVhWWqVkhVFzKJvfOw8CKUl8JGN1JsJd
 4EVTUignvUxVVlg1oX7LLi20YRgani89nY19+gcxY9THk5F5gcUPXLp/IwKujV87GFVd
 xJNQ==
X-Gm-Message-State: AO0yUKXPfq5aBBeHriSpEbMFmpwA5GHDBrRpDNzsC6iq3Zrz1chI0srO
 yhFr3GpLpTmZN31tTWcjaflUKA==
X-Received: by 2002:a05:6a20:6530:b0:cc:59a7:65ae with SMTP id
 n48-20020a056a20653000b000cc59a765aemr625929pzg.24.1677185046622; 
 Thu, 23 Feb 2023 12:44:06 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:44:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH 12/13] target/arm: Do memory type alignment check when
 translation disabled
Date: Thu, 23 Feb 2023 10:43:41 -1000
Message-Id: <20230223204342.1093632-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
X-TUID: sj0ty9FNe/Om

If translation is disabled, the default memory type is Device,
which requires alignment checking.  This is more optimially done
early via the MemOp given to the TCG memory operation.

Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1204
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 07d4100365..b1b664e0ad 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11867,6 +11867,37 @@ static inline bool fgt_svc(CPUARMState *env, int el)
         FIELD_EX64(env->cp15.fgt_exec[FGTREG_HFGITR], HFGITR_EL2, SVC_EL1);
 }
 
+/*
+ * Return true if memory alignment should be enforced.
+ */
+static bool aprofile_require_alignment(CPUARMState *env, int el, uint64_t sctlr)
+{
+#ifdef CONFIG_USER_ONLY
+    return false;
+#else
+    /* Check the alignment enable bit. */
+    if (sctlr & SCTLR_A) {
+        return true;
+    }
+
+    /*
+     * If translation is disabled, then the default memory type is
+     * Device(-nGnRnE) instead of Normal, which requires that alignment
+     * be enforced.  Since this affects all ram, it is most efficient
+     * to handle this during translation.
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
+#endif
+}
+
 static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
                                            ARMMMUIdx mmu_idx,
                                            CPUARMTBFlags flags)
@@ -11936,8 +11967,9 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
 {
     CPUARMTBFlags flags = {};
     int el = arm_current_el(env);
+    uint64_t sctlr = arm_sctlr(env, el);
 
-    if (arm_sctlr(env, el) & SCTLR_A) {
+    if (aprofile_require_alignment(env, el, sctlr)) {
         DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
     }
 
@@ -12037,7 +12069,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     sctlr = regime_sctlr(env, stage1);
 
-    if (sctlr & SCTLR_A) {
+    if (aprofile_require_alignment(env, el, sctlr)) {
         DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
     }
 
-- 
2.34.1

