Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp467646ejx;
        Mon, 21 Aug 2023 21:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp+HndlD3Ib2gZsAaRLJHoa6vvvuKl3vEhAOXwtwDXDH3Fg7OQNIjMfvdZF8kxRjI40AS4
X-Received: by 2002:a0c:dc12:0:b0:64b:fdf0:48a3 with SMTP id s18-20020a0cdc12000000b0064bfdf048a3mr9200247qvk.10.1692678427987;
        Mon, 21 Aug 2023 21:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692678427; cv=none;
        d=google.com; s=arc-20160816;
        b=pUW1OzHnuk6ykZKotMZ7XuDZkpgJPkXsczG4O9XJH84UUsCi3tKZSqLXWuWN2Omi28
         up3kCxgm5g4qaQts99daAnqwoakCnlpeuiyZlbU2FckTht4UaJfrCy7f50xlGmd9M0HI
         OePtsQ4CQhQIvAU/vu/IxP73J4tJ38T+pCU5+YCjGZeKGoUn713v/8rzCWFc9LCuUGah
         GnaZkaxojHuMDWSI/3RVxUyf7HOXIoR2NoGB0GewtfyvyaHKnMBvkZvu+MKFk0WcGgW0
         RB2MXJ0EbKGjvaJXkp9+1JZPS2HsOyq2Wr5uKpaeXcEDRr9tANLsiDSJ9is7MQiLltWg
         1bSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vq6cFhLLgy1EjGAe2inqelLAnSEJzTAGffoR6HgTphI=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=czM6/e25g+3naEOI1APrQAhShB12uH5V7RVeVDgIq/wf/gR2sSu6Q3vYiC+lobOG6J
         SoUgMCfhy0ZwN9JoL05MZ8y83NHqZZBr1PIiaiKLfuykVEOOS1obTGY+fj5n0jbmIXod
         U58kfUU8GePa2rjbc9xxuDWnJ11f1ykqBd+AYk/GRkJ5cQHno38CumV8vI31EztzVBvS
         n4nYUZiFgtwD7/xCFnLIHh2v7WBD7753Kdsq5sp7WHYjIVQgSwksPotJ2B39nmC8VFbv
         wtYM0sojbqKNRpdYEq6E+0nGJCCppLKmLHG4Vn8H6hZzimoZI5pBgXKg4+/vam85ftPp
         qwww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LefaJBOs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22-20020a0ca996000000b0063d6cf4ea69si5815277qvb.180.2023.08.21.21.27.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Aug 2023 21:27:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LefaJBOs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qYIxb-0006Ka-5f; Tue, 22 Aug 2023 00:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYIxZ-0006Ic-4I
 for qemu-devel@nongnu.org; Tue, 22 Aug 2023 00:25:41 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYIxU-0007Wd-Nb
 for qemu-devel@nongnu.org; Tue, 22 Aug 2023 00:25:40 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68a3e943762so1854921b3a.1
 for <qemu-devel@nongnu.org>; Mon, 21 Aug 2023 21:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692678335; x=1693283135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vq6cFhLLgy1EjGAe2inqelLAnSEJzTAGffoR6HgTphI=;
 b=LefaJBOs5sDQXKTlGNmxGIo3wTMIICdq+wkpVrLUMPjtvDkHZ8nBBCUOOc2TnPiYqk
 t+B0NVLp0izCCubqVDp6U7OTZwB4tqhQSl52z/Uad2IeDGTlETlsAaOkCyPhefR2aGQE
 c0WvX/VudK0YV800xugh5faF8wV580zDjX9/OHhK6UQXiPiT+rnuXJmKjsj9RC8liw7i
 wBVaaLcMGGT4qPlIGPUxCTVOeSKxhT5uX7dHhHZkCdSyFlgkLNzztAokMmgx144HMOur
 A6e/6ctCq4vZwnzvEYB9szInnUIDZ6I9UnHklpYoz70CNnv8zTNHuYwxw0FCywg79m/b
 dF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692678335; x=1693283135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vq6cFhLLgy1EjGAe2inqelLAnSEJzTAGffoR6HgTphI=;
 b=LY2H0oX4zZKf7fmkwBNpZr533VXigpkIHdPDae71pYmDKJULIrujZCatGf2AV8J1Jz
 aN2RF8Na5k6YFe/lo2EOidC8rHOLendmO1ROjwYsM9lQuOPECSPwlxfF1hlitk4ttHei
 eefJ+KQ2CbeEGS4+/XYudFIpa2dIXXy8ZWN6rWPh0O0xyl/tXJ6ep42uSJ359A/NDmfb
 F720t9wEGnkgD8q6d7NLoX/BHxVrdwkr3FyRq8q+jAFyCpnfLMhY2T3+vye/LQMWCY/W
 e1ehtvDrj9MRP4EsjOUb7DKut3eGtR9pTQUpiCKEFz4GZily09mjQXucODyKZMdLi25K
 84Tg==
X-Gm-Message-State: AOJu0Yxp3T9en18hKtxObZ1g8r7+K/R/BZS5PudUM7U1ZELIAagi890O
 1y+Xpe9fK/NES9ufczO52BFppo5/Nn+GBNHz9gE=
X-Received: by 2002:a05:6a00:148f:b0:68a:4d66:ca1 with SMTP id
 v15-20020a056a00148f00b0068a4d660ca1mr5808059pfu.6.1692678335410; 
 Mon, 21 Aug 2023 21:25:35 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:2c08:e710:4459:46f1])
 by smtp.gmail.com with ESMTPSA id
 m14-20020aa7900e000000b0068a3f861b24sm3364908pfo.195.2023.08.21.21.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 21:25:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 4/9] target/arm: Don't change pauth features when changing
 algorithm
Date: Mon, 21 Aug 2023 21:25:25 -0700
Message-Id: <20230822042530.1026751-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822042530.1026751-1-richard.henderson@linaro.org>
References: <20230822042530.1026751-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: raPi5r6DdG+J

We have cpu properties to adjust the pauth algorithm for the
purpose of speed of emulation.  Retain the set of pauth features
supported by the cpu even as the algorithm changes.

This already affects the neoverse-v1 cpu, which has FEAT_EPAC.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c     | 70 +++++++++++++++++++++++++++---------------
 target/arm/tcg/cpu64.c |  2 ++
 2 files changed, 47 insertions(+), 25 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 96158093cc..fd584a31da 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -473,37 +473,57 @@ void aarch64_add_sme_properties(Object *obj)
 
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
 {
-    int arch_val = 0, impdef_val = 0;
-    uint64_t t;
+    ARMPauthFeature features = cpu_isar_feature(pauth_feature, cpu);
+    uint64_t isar1;
 
-    /* Exit early if PAuth is enabled, and fall through to disable it */
-    if ((kvm_enabled() || hvf_enabled()) && cpu->prop_pauth) {
-        if (!cpu_isar_feature(aa64_pauth, cpu)) {
-            error_setg(errp, "'pauth' feature not supported by %s on this host",
-                       kvm_enabled() ? "KVM" : "hvf");
+    /*
+     * These properties enable or disable Pauth as a whole, or change
+     * the pauth algorithm, but do not change the set of features that
+     * are present.  We have saved a copy of those features above and
+     * will now place it into the field that chooses the algorithm.
+     *
+     * Begin by disabling all fields.
+     */
+    isar1 = cpu->isar.id_aa64isar1;
+    isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, APA, 0);
+    isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPA, 0);
+    isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, API, 0);
+    isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPI, 0);
+
+    if (kvm_enabled() || hvf_enabled()) {
+        /*
+         * Exit early if PAuth is enabled and fall through to disable it.
+         * The algorithm selection properties are not present.
+         */
+        if (cpu->prop_pauth) {
+            if (features == 0) {
+                error_setg(errp, "'pauth' feature not supported by "
+                           "%s on this host", current_accel_name());
+            }
+            return;
+        }
+    } else {
+        /* Pauth properties are only present when the model supports it. */
+        if (features == 0) {
+            assert(!cpu->prop_pauth);
+            return;
         }
 
-        return;
-    }
-
-    /* TODO: Handle HaveEnhancedPAC, HaveEnhancedPAC2, HaveFPAC. */
-    if (cpu->prop_pauth) {
-        if (cpu->prop_pauth_impdef) {
-            impdef_val = 1;
-        } else {
-            arch_val = 1;
+        if (cpu->prop_pauth) {
+            if (cpu->prop_pauth_impdef) {
+                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, API, features);
+                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPI, 1);
+            } else {
+                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, APA, features);
+                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPA, 1);
+            }
+        } else if (cpu->prop_pauth_impdef) {
+            error_setg(errp, "cannot enable pauth-impdef without pauth");
+            error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
         }
-    } else if (cpu->prop_pauth_impdef) {
-        error_setg(errp, "cannot enable pauth-impdef without pauth");
-        error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
     }
 
-    t = cpu->isar.id_aa64isar1;
-    t = FIELD_DP64(t, ID_AA64ISAR1, APA, arch_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, arch_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, API, impdef_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, impdef_val);
-    cpu->isar.id_aa64isar1 = t;
+    cpu->isar.id_aa64isar1 = isar1;
 }
 
 static Property arm_cpu_pauth_property =
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 8019f00bc3..fec6a4875d 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -758,6 +758,8 @@ void aarch64_max_tcg_initfn(Object *obj)
 
     t = cpu->isar.id_aa64isar1;
     t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);      /* FEAT_DPB2 */
+    t = FIELD_DP64(t, ID_AA64ISAR1, APA, PauthFeat_1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, API, 1);
     t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);    /* FEAT_JSCVT */
     t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);     /* FEAT_FCMA */
     t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2);    /* FEAT_LRCPC2 */
-- 
2.34.1

