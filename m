Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp20682lfp;
        Tue, 12 Jul 2022 21:59:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ugKc0uiLN/tdU0Z9VsgNsNSJOLpYbVUGUO8+msdRGBJ4AsH5bmnePP+ZdJHO6lN6WVqDNi
X-Received: by 2002:a05:620a:408c:b0:6b2:678c:6091 with SMTP id f12-20020a05620a408c00b006b2678c6091mr1194500qko.518.1657688380505;
        Tue, 12 Jul 2022 21:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657688380; cv=none;
        d=google.com; s=arc-20160816;
        b=nmRxxRHsuAHsSL6LgisDfMxwugflE4wg3kG0Zjn6hxd6B9qN8pxMjEOLYYgeshJwBY
         hXjenDx4UyQ8SJqeLtjN52ODdux7SrwQoFJolENTu8bDSOS21nRV9qMox1iYtf66QoxM
         LNZs/tMfSIAe6njCKhpoNEhT6v5ZAzp7xCqZlraRSzb/F9UVOOnMq86obhHWEwZyio/b
         BJW80KyU1X4a/pYrcdYq4dDMab2cGWHKvyN6WO69o6HwQTEv9/xhhM33lb/AZKzk88N7
         t0E4V1FuEacISWAx0Nug4G8oF1PlkqAHS2l9rOZakGaA0oBXyQRBbBB+6wo2Rftrtjp6
         igCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=H0h1mijfb/JBmMIsG1ho4eH5ZlC4TyS0gLWzNfX6jB0=;
        b=wZXcvqtBGheevJttSswoCf9rJSlaM+3nI2PoGmR4f61ycfRX/vv2jbtOv8KOdr0qhw
         1IUbSE5Mdza3qmRQUccveVNz3aJz4LuUh45sx8bMu6NnbTgux29BGZvJZX3USKqkgIXG
         gcMq+kYF44L81MTh7YVOLNE2u+xNrD/PXyxGIZO2K6TLVmUayudOAeUUt8Ap81annV3e
         upFtnXvEwzqXr+/JNFvJJDtHupajkruGgWrBF9M3Fd2wqeOvAnqc7bWgkjRMZQuFErbL
         eHOHFaeLs9N+Hq18EZD6+dF/3slttBb0RwV4j6WV0NCACmtZY/g7I3XP+SVgoXiiZJdq
         baKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Um2W1PLj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12-20020a05620a414c00b006b309e1d7aasi9188852qko.514.2022.07.12.21.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 21:59:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Um2W1PLj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBUTM-00018r-27
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 00:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBUSn-00015q-8O
 for qemu-arm@nongnu.org; Wed, 13 Jul 2022 00:59:05 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:46684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBUSl-0006rx-JR
 for qemu-arm@nongnu.org; Wed, 13 Jul 2022 00:59:04 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 t5-20020a17090a6a0500b001ef965b262eso1691241pjj.5
 for <qemu-arm@nongnu.org>; Tue, 12 Jul 2022 21:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H0h1mijfb/JBmMIsG1ho4eH5ZlC4TyS0gLWzNfX6jB0=;
 b=Um2W1PLjch0aH+/d4eDtNA/Xw2OpL6Z6fnYnDEPLyYkGENxcYExIubl6SknSvYwo+Q
 jZpDWmDw2iZe5/gIbCO2J3eQBXG5hPWqeWC8UZjWIAJ/U5rX7i6xPxrJJA+uWogdwzkH
 S2fo8Zu1trTE5UVzSGM46Ax8EWi5BsyLtJ9Vkwk/pYslkP6VuMEo8kxniNvYreOIBrsg
 JINfuxoMahU+jTeKMFUOnSOMfk4A9EmwAoADRS4rm0cCfzpGTr1QRyoGnSDbT0v9hqYq
 nReQ6TEaE9CnogdI9/fuir68MtEylw7/tMdhvZ5vaygrtkpQv/1tgyjlvV9l7B73R66w
 F4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H0h1mijfb/JBmMIsG1ho4eH5ZlC4TyS0gLWzNfX6jB0=;
 b=IcOXON+n3dxIaKRfzGExDlTsqCiAbZQyiNbwZ9FX+LVy5PiH/cl1EwCvkBk/2T8t7g
 rdTSm9pGm81Yc/Yf9V6sNJ7LZpx2fymW8g6Ng9Bfwcck6tiYnIELFaZ9MaawMhPsY7z4
 +9UoVPygyMtCwoqHzElkiXBE5G9AHxm52nuJeScAw8EChT3rni5Wn2e8LlwcNDQ/lFIz
 FWDr9Wgr6pcBx0LKW488mKolhyC1ieE8tfU4Tq4uG+7kjvquJWBy18FjMI5TU+1PU4Y6
 lt/YILUdKHDSA+DHSPvTLpul8+sK9UiuuAUPZR3nB3ZLYDTTy8WLmmWle3iKpdksPyju
 l2wA==
X-Gm-Message-State: AJIora9vRjR7drdJLzP50pE+o8mwoR4RRTeSW8LJWLXk7yywu1v49OlJ
 t2OjhitEJmPPYdGUrxQjwZQt8w==
X-Received: by 2002:a17:903:26c1:b0:16b:df40:e566 with SMTP id
 jg1-20020a17090326c100b0016bdf40e566mr1435578plb.121.1657688340781; 
 Tue, 12 Jul 2022 21:59:00 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 d194-20020a621dcb000000b00525302fe9c4sm7677047pfd.190.2022.07.12.21.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 21:59:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: broonie@kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Fix aarch64_sve_change_el for SME
Date: Wed, 13 Jul 2022 10:28:48 +0530
Message-Id: <20220713045848.217364-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713045848.217364-1-richard.henderson@linaro.org>
References: <20220713045848.217364-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
X-TUID: MtyXLXwSMBb7

We were only checking for SVE disabled and not taking into
account PSTATE.SM to check SME disabled, which resulted in
vectors being incorrectly truncated.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6fff7fc64f..24c45a9bf3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11228,6 +11228,21 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq)
     }
 }
 
+static uint32_t sve_vqm1_for_el_sm_ena(CPUARMState *env, int el, bool sm)
+{
+    int exc_el;
+
+    if (sm) {
+        exc_el = sme_exception_el(env, el);
+    } else {
+        exc_el = sve_exception_el(env, el);
+    }
+    if (exc_el) {
+        return 0; /* disabled */
+    }
+    return sve_vqm1_for_el_sm(env, el, sm);
+}
+
 /*
  * Notice a change in SVE vector size when changing EL.
  */
@@ -11236,7 +11251,7 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
 {
     ARMCPU *cpu = env_archcpu(env);
     int old_len, new_len;
-    bool old_a64, new_a64;
+    bool old_a64, new_a64, sm;
 
     /* Nothing to do if no SVE.  */
     if (!cpu_isar_feature(aa64_sve, cpu)) {
@@ -11256,7 +11271,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      * invoke ResetSVEState when taking an exception from, or
      * returning to, AArch32 state when PSTATE.SM is enabled.
      */
-    if (old_a64 != new_a64 && FIELD_EX64(env->svcr, SVCR, SM)) {
+    sm = FIELD_EX64(env->svcr, SVCR, SM);
+    if (old_a64 != new_a64 && sm) {
         arm_reset_sve_state(env);
         return;
     }
@@ -11273,10 +11289,13 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      * we already have the correct register contents when encountering the
      * vq0->vq0 transition between EL0->EL1.
      */
-    old_len = (old_a64 && !sve_exception_el(env, old_el)
-               ? sve_vqm1_for_el(env, old_el) : 0);
-    new_len = (new_a64 && !sve_exception_el(env, new_el)
-               ? sve_vqm1_for_el(env, new_el) : 0);
+    old_len = new_len = 0;
+    if (old_a64) {
+        old_len = sve_vqm1_for_el_sm_ena(env, old_el, sm);
+    }
+    if (new_a64) {
+        new_len = sve_vqm1_for_el_sm_ena(env, new_el, sm);
+    }
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
-- 
2.34.1

