Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1803185lfb;
        Mon, 6 Jun 2022 19:49:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzniBrddAe+FnTV/7KcOeRGm/EbKLVDS18oDWAjzbQqcIXWfycu5rcZ/xDmv43CMCqpikfV
X-Received: by 2002:a37:5e02:0:b0:6a6:7b4c:4cd5 with SMTP id s2-20020a375e02000000b006a67b4c4cd5mr16282411qkb.105.1654570173828;
        Mon, 06 Jun 2022 19:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654570173; cv=none;
        d=google.com; s=arc-20160816;
        b=0mldcYhc3AROrFRYCNrOWCPe5JsXGKvN6+LnRdovAQr+GxTdifAKJz/c1FbLyDiHLt
         f2GUJwiwFyRuJ6EwjWNTt4eNb8gUakKKCGN+fjLO1cElPkedDTSaHEoOQGNShPCQkEBW
         1ogcg7fSM/LTNvMwYASLBt+L694z9bgBPypCxV+9Xtvk371pla+4jFXZuQwMaO7XhT39
         2K0wotH1zjH9vgYGdbpMQA3/ND0NYJ628ojFW1qYXQP5v3j1NRq4O9p2ZejfsKO2No3W
         xkLhIub1toHlBhGwdYa9WYLlxvF8Ozl5qlDb9mjXkbMGdedju80dqkD0c2jI6O0zGqYk
         hayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6L8pt/IhJxuBRjI6bUDUlD7xMciX/G+qjq8VDpWp4w4=;
        b=iwz2C7DePAeBTB8gEyV6cdVoqIn6Ot5xScy44pDZ9zWd9QQr0pNXD7rLoCN2PDV6qa
         shArV9P4v3OaTa3MynRahXR63lGPpv8Y+bjUbFuBA4D452wtDevzR+BPNwwWPZ1of8Hz
         LDrs8LvOsDibL9XXQ3GR3+yq978q0Nfcoj66m57vaPoekpNf6i6eixF6siSyeLotEA3f
         oDleVXglqsnusHjse8cqwnPnKyuDI8FWYJ4Ldi1WfCkEXQY3Da8G4LsyYBRXlTI17Q46
         7SS8fESjNxyxLscUmMEwuGud2hVVUP+DnhxVmnDbif+QLF3PxWfSPYtL7Yyg9yT9SfOp
         T9DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qRkGDEkN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw12-20020a056214238c00b004644f310893si7568299qvb.507.2022.06.06.19.49.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 19:49:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qRkGDEkN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPHh-00015i-6R
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 22:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFu-0006XJ-Bg
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:42 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFs-0000HP-D8
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:42 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 mh16-20020a17090b4ad000b001e8313301f1so6821424pjb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6L8pt/IhJxuBRjI6bUDUlD7xMciX/G+qjq8VDpWp4w4=;
 b=qRkGDEkNyWcQjH8cmaHXBhPMVs/n7G0U0y29nKaTNrN5dV9Lc2ucPLnyC4vkxMf6qX
 31eVKcGC8M+k9pZBOgLZr1ZScnnWHUEDYRnfgTt8Rlm6mP4iQl3YehPCOIDUoVyPNfWK
 zaSyk28EQtaXDDx9N5ZvZjkfxqCMrJWdb0fxfoeTwtHa9nXNmExm5aWR3PVrHWW/SmVE
 WlxZmrCofkbVWXgWoaVNu2/FOLD5xmr5PBa0fspXWbdzw3/0R9N0pNE5uUglYUPrO+mA
 aWCxeLUqTCQoxlVJk/+NbAXYdOE8YmCEDi+2067MGx8nZxc5y23sP0BSaK9GUel7lrml
 GvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6L8pt/IhJxuBRjI6bUDUlD7xMciX/G+qjq8VDpWp4w4=;
 b=vuAj+AQfKAAiTfALFcT/ozFF1hoQy0IczNDQFEfIsjFqeh3BVEFeWJeufsJ/vHfche
 MThZq053hEORnc40eUQ8Zgz+OP2plM7A2mnQAT+RgBoCXNxVAxwPCdLPI8sc+NJd9FFY
 yD05jURJqBuBmc4/qBEfzpv3JYvFy588A5SZbNqiA4JDzljDBOwzzwP8Qe51GBoOD2oz
 kswujssSMZkxukJzj8Cq2z2Qx7RvewCklLfO+b8ZigIuKMRYOElms0RFRJ9Nxyk0oSpL
 eLJlnDDIE2n4Quka3YvagtMLg+06jEUOpXmMMJMS6b0ZfASpXOP0IXaZAn6bVptqdwcu
 F0vA==
X-Gm-Message-State: AOAM533v3yG7Ew9PRKXGTkU280ioMMWnvnDAKAY2c56rgLMTkCre1zjs
 iba+A3KFsl6Co2WTo89dKWTsr7OiV09w9g==
X-Received: by 2002:a17:90a:5206:b0:1e0:ab19:5f41 with SMTP id
 v6-20020a17090a520600b001e0ab195f41mr29954440pjh.142.1654570059104; 
 Mon, 06 Jun 2022 19:47:39 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 04/25] target/arm: Move exception_target_el out of line
Date: Mon,  6 Jun 2022 19:47:13 -0700
Message-Id: <20220607024734.541321-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JkOTmajmY2oh

Move the function to op_helper.c, near raise_exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 16 +---------------
 target/arm/op_helper.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b654bee468..36c33a6ac5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1090,21 +1090,6 @@ typedef struct ARMVAParameters {
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data);
 
-static inline int exception_target_el(CPUARMState *env)
-{
-    int target_el = MAX(1, arm_current_el(env));
-
-    /*
-     * No such thing as secure EL1 if EL3 is aarch32,
-     * so update the target EL to EL3 in this case.
-     */
-    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3) && target_el == 1) {
-        target_el = 3;
-    }
-
-    return target_el;
-}
-
 /* Determine if allocation tags are available.  */
 static inline bool allocation_tag_access_enabled(CPUARMState *env, int el,
                                                  uint64_t sctlr)
@@ -1329,5 +1314,6 @@ void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 #endif
 
 void aa32_max_features(ARMCPU *cpu);
+int exception_target_el(CPUARMState *env);
 
 #endif
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 67b7dbeaa9..00a082d1f7 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -28,6 +28,21 @@
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
 
+int exception_target_el(CPUARMState *env)
+{
+    int target_el = MAX(1, arm_current_el(env));
+
+    /*
+     * No such thing as secure EL1 if EL3 is aarch32,
+     * so update the target EL to EL3 in this case.
+     */
+    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3) && target_el == 1) {
+        target_el = 3;
+    }
+
+    return target_el;
+}
+
 void raise_exception(CPUARMState *env, uint32_t excp,
                      uint32_t syndrome, uint32_t target_el)
 {
-- 
2.34.1

