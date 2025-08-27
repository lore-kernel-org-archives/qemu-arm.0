Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D873BCA0FF6
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:19:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4dK-0006vQ-5p; Tue, 26 Aug 2025 21:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4d5-0005nG-US
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:07:12 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4d0-0007V5-Ab
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:07:11 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-771e15ce64eso2217498b3a.0
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756256823; x=1756861623; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PiTlSDbl7ZE2Kdnr9r+qg6Y8XwHKnrFV6OAAtT3qX4s=;
 b=vaMCFL7+ZVFuuLoZeC3wFPiZXckN07/iN0qm9H36lTErZW2MaTk9HTg8HTaNLfrMAI
 LnckHPPm/gk2kwqRTfMDuetD1QULE8u5mjzosBKM/0svWS4KPRU39avCj2/r3mWRFly3
 +r0v/Z4V2gl7TUBOBR64zTVxKQI7cAALRwA7bHcLIGpIims8Q3ZQ0NRQqJ7uvHjxERQA
 c7QyWA7feZ2VpgUUDMs7vdaPB3ZEgLUox68DGsg2Zl/6c66pc92Hu4g8zBZFpzwIpYle
 zMZ3pbSneuKi1NysSbJV4PEIxReQck9SAv7kunDcX2xAYV66UFFEFq3riKCqrSLiyVMm
 0Ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256823; x=1756861623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PiTlSDbl7ZE2Kdnr9r+qg6Y8XwHKnrFV6OAAtT3qX4s=;
 b=aM1cJianE52pv0isBW4Otj9otZH7K+AceondR4QzEkAJPqa9uYDy6DDKQps1W+UyV3
 IRgEfX4PfEw5sK+9u8T7voZGBRbtx9jkQgO43vHtyvqiGdxFdxmK5q+M+utvIucOgV+N
 ma6bafhS0Zu7PUoqgp7WaEIcqekTDHurRtz7ny9zLEAqDpTEqFwNzinGfWRNVGzN6IK7
 SYkRO+2XkdLpstDBct2wcDlMZrhvfXe8iGZlX90PoTB1Q+YyjTQZ+XT3LKzp/ew4WE5n
 JkK4peK8yOY2UXhHha3lAg2Wl8cbR6QpHP9uDmNeQfufQjCZf1YwHQCWduyfxbKkI6XX
 TuFQ==
X-Gm-Message-State: AOJu0Yxo/QyzLf/y7ZfqDndSwW944azt7iIQJS9eDGE6EWsPbqLnYAzi
 e7z+9XW8ZwVxf1MrLPpzMFqyQUGLTs0IMrfgccKQPsbQrj35m3yJa9fc91gq0Pllx2I3kbdOhxi
 7td51dO0=
X-Gm-Gg: ASbGncv8F2xY7+zE2Y0u83pcY1SnjNpomGNjx6D3MIm/aHH8A5xrr9PxHZXhs7vc7TR
 5Wg3+LkkC7pY1bRKBhYS5TlKHT8s1+/myrh2E3s9cVVOftk/7LH+UackPPWHyYH4zoYcflcRDa6
 OI1dN92CmglP/OgH3PaZwayz6YKMDx/fChFJ/LJP4yq3uK+LRGd7xVoSYQtr+xnBHyJGXM32Y+L
 ezDxEvqSYHquzJDn+LVW0xvh/y2nVZDXI2kqngKSr8Mle0s+11gF2vim77bZ7l05R6ipPpzE0Ah
 wM5SXNgT412xdObEwwgCUhemr9jIOrHaU9+UIgpIqzhqAxsyCNWFUmV1QkaiLp/AHIDppM3ce2n
 Rv4VzqGnsZBUL1DmAWLb7n1u+Z9x2F+8TA47U9PeLlkXNgVw=
X-Google-Smtp-Source: AGHT+IH0iM1ygKOoU5r2kTMIxyLmtw73+6189p1IT7DGgLcP4y82qXYsjOF7Vl5WtssV+z+GIVmRkA==
X-Received: by 2002:a05:6a00:14c7:b0:770:5987:5b3a with SMTP id
 d2e1a72fcca58-77059879144mr11624726b3a.16.1756256823287; 
 Tue, 26 Aug 2025 18:07:03 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7720274534esm1419241b3a.47.2025.08.26.18.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:07:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 22/61] target/arm: Move cp processing to define_one_arm_cp_reg
Date: Wed, 27 Aug 2025 11:04:13 +1000
Message-ID: <20250827010453.4059782-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Processing of cp was split between add_cpreg_to_hashtable and
define_one_arm_cp_reg.  Unify it all to the top-level function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 53 +++++++++++++++++++--------------------------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index da6a8f0a8f..a9d6ed1270 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7269,7 +7269,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
  */
 static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
                                    CPState state, CPSecureState secstate,
-                                   int crm, int opc1, int opc2,
+                                   int cp, int crm, int opc1, int opc2,
                                    const char *name)
 {
     CPUARMState *env = &cpu->env;
@@ -7277,28 +7277,14 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     ARMCPRegInfo *r2;
     bool is64 = r->type & ARM_CP_64BIT;
     bool ns = secstate & ARM_CP_SECSTATE_NS;
-    int cp = r->cp;
     size_t name_len;
     bool make_const;
 
     switch (state) {
     case ARM_CP_STATE_AA32:
-        /* We assume it is a cp15 register if the .cp field is left unset. */
-        if (cp == 0 && r->state == ARM_CP_STATE_BOTH) {
-            cp = 15;
-        }
         key = ENCODE_CP_REG(cp, is64, ns, r->crn, crm, opc1, opc2);
         break;
     case ARM_CP_STATE_AA64:
-        /*
-         * To allow abbreviation of ARMCPRegInfo definitions, we treat
-         * cp == 0 as equivalent to the value for "standard guest-visible
-         * sysreg".  STATE_BOTH definitions are also always "standard sysreg"
-         * in their AArch64 view (the .cp value may be non-zero for the
-         * benefit of the AArch32 view).
-         */
-        assert(cp == 0 || r->state == ARM_CP_STATE_BOTH);
-        cp = 0;
         key = ENCODE_AA64_CP_REG(r->opc0, opc1, r->crn, crm, opc2);
         break;
     default:
@@ -7459,7 +7445,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
 }
 
 static void add_cpreg_to_hashtable_aa32(ARMCPU *cpu, const ARMCPRegInfo *r,
-                                        int crm, int opc1, int opc2)
+                                        int cp, int crm, int opc1, int opc2)
 {
     /*
      * Under AArch32 CP registers can be common
@@ -7472,16 +7458,16 @@ static void add_cpreg_to_hashtable_aa32(ARMCPU *cpu, const ARMCPRegInfo *r,
     switch (r->secure) {
     case ARM_CP_SECSTATE_S:
     case ARM_CP_SECSTATE_NS:
-        add_cpreg_to_hashtable(cpu, r, ARM_CP_STATE_AA32,
-                               r->secure, crm, opc1, opc2, r->name);
+        add_cpreg_to_hashtable(cpu, r, ARM_CP_STATE_AA32, r->secure,
+                               cp, crm, opc1, opc2, r->name);
         break;
     case ARM_CP_SECSTATE_BOTH:
         name = g_strdup_printf("%s_S", r->name);
-        add_cpreg_to_hashtable(cpu, r, ARM_CP_STATE_AA32,
-                               ARM_CP_SECSTATE_S, crm, opc1, opc2, name);
+        add_cpreg_to_hashtable(cpu, r, ARM_CP_STATE_AA32, ARM_CP_SECSTATE_S,
+                               cp, crm, opc1, opc2, name);
         g_free(name);
-        add_cpreg_to_hashtable(cpu, r, ARM_CP_STATE_AA32,
-                               ARM_CP_SECSTATE_NS, crm, opc1, opc2, r->name);
+        add_cpreg_to_hashtable(cpu, r, ARM_CP_STATE_AA32, ARM_CP_SECSTATE_NS,
+                               cp, crm, opc1, opc2, r->name);
         break;
     default:
         g_assert_not_reached();
@@ -7512,11 +7498,11 @@ static void add_cpreg_to_hashtable_aa64(ARMCPU *cpu, const ARMCPRegInfo *r,
             nxs_ri.fgt |= R_FGT_NXS_MASK;
         }
         add_cpreg_to_hashtable(cpu, &nxs_ri, ARM_CP_STATE_AA64,
-                               ARM_CP_SECSTATE_NS, crm, opc1, opc2, name);
+                               ARM_CP_SECSTATE_NS, 0, crm, opc1, opc2, name);
     }
 
     add_cpreg_to_hashtable(cpu, r, ARM_CP_STATE_AA64, ARM_CP_SECSTATE_NS,
-                           crm, opc1, opc2, r->name);
+                           0, crm, opc1, opc2, r->name);
 }
 
 void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *r)
@@ -7551,6 +7537,7 @@ void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *r)
     int opc1max = (r->opc1 == CP_ANY) ? 7 : r->opc1;
     int opc2min = (r->opc2 == CP_ANY) ? 0 : r->opc2;
     int opc2max = (r->opc2 == CP_ANY) ? 7 : r->opc2;
+    int cp = r->cp;
 
     /*
      * AArch64 regs are all 64 bit so ARM_CP_64BIT is meaningless.
@@ -7573,21 +7560,25 @@ void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *r)
      */
     switch (r->state) {
     case ARM_CP_STATE_BOTH:
-        /* 0 has a special meaning, but otherwise the same rules as AA32. */
-        if (r->cp == 0) {
+        /*
+         * If the cp field is left unset, assume cp15.
+         * Otherwise apply the same rules as AA32.
+         */
+        if (cp == 0) {
+            cp = 15;
             break;
         }
         /* fall through */
     case ARM_CP_STATE_AA32:
         if (arm_feature(&cpu->env, ARM_FEATURE_V8) &&
             !arm_feature(&cpu->env, ARM_FEATURE_M)) {
-            assert(r->cp >= 14 && r->cp <= 15);
+            assert(cp >= 14 && cp <= 15);
         } else {
-            assert(r->cp < 8 || (r->cp >= 14 && r->cp <= 15));
+            assert(cp < 8 || (cp >= 14 && cp <= 15));
         }
         break;
     case ARM_CP_STATE_AA64:
-        assert(r->cp == 0);
+        assert(cp == 0);
         break;
     default:
         g_assert_not_reached();
@@ -7657,13 +7648,13 @@ void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *r)
             for (int opc2 = opc2min; opc2 <= opc2max; opc2++) {
                 switch (r->state) {
                 case ARM_CP_STATE_AA32:
-                    add_cpreg_to_hashtable_aa32(cpu, r, crm, opc1, opc2);
+                    add_cpreg_to_hashtable_aa32(cpu, r, cp, crm, opc1, opc2);
                     break;
                 case ARM_CP_STATE_AA64:
                     add_cpreg_to_hashtable_aa64(cpu, r, crm, opc1, opc2);
                     break;
                 case ARM_CP_STATE_BOTH:
-                    add_cpreg_to_hashtable_aa32(cpu, r, crm, opc1, opc2);
+                    add_cpreg_to_hashtable_aa32(cpu, r, cp, crm, opc1, opc2);
                     add_cpreg_to_hashtable_aa64(cpu, r, crm, opc1, opc2);
                     break;
                 default:
-- 
2.43.0


