Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp467695ejx;
        Mon, 21 Aug 2023 21:27:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVA870Dh/tBSPpiSOEa/QsVPB+shPM6weHgLdijs22Dk8t909yDlaoKoKn+jTdzeAXcuhV
X-Received: by 2002:a0c:df05:0:b0:641:8878:29a5 with SMTP id g5-20020a0cdf05000000b00641887829a5mr10926840qvl.61.1692678437258;
        Mon, 21 Aug 2023 21:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692678437; cv=none;
        d=google.com; s=arc-20160816;
        b=JLpX56zR1BACsyC8KkI22gyPiOfLpDJIcirtRTNfkruUu4bsNj+JsvgfBemERra8i7
         0Tl2sGowlBjqSSqmAJmcBrnSTLWTX6ceUM9ePc8gYvMLxDjxLkN8GxbbrQz+qktJqW3B
         o3FzvUk3zJM1iGbvYiDGovjpeFR3g+Ek8gd/ONIe59TeJDEyvFKlIG2dgCdVpObtyr/n
         IacVWJX5uWnKiWtb1qes/IR9TIleTm2s/rzzuyF1+5sZPmIY6ZtBhQJlm67vDIcZnYOE
         iiDdL/mqH+1xL2rK/QtZhNGXpYpt0UY9JJO5rIBiVT3sEqtfcU+AZxzz4i5MK5xsoyof
         0TZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DnJTzl5NGHTGnySD/Xt64t/JmaV6O8fFyzOl8EasyGs=;
        fh=JeB3dVDTdYB7kPCK0u8jYmZ9QUU9ibi3wPLgIaJF/lk=;
        b=lLIrMj/2D75ZJw4uVaWyJI/UATqXSOW7N/m51g38ELm7H4pSHBcHpqqNKM62SL0vPf
         hVG59eY2HMVJCXyfQlch/Y0Dcd47MmMXNdjF9+VugwW8WPpRBD9MW4QdVaZEPv8dBeKO
         7ZSbsLJOdY6kCpUhrQFOBR/30KZqgvgWC0mAOhngCPe8p/U3COT2bm3ywE0qjtUujJnV
         amaIWa5w+YQiaIewbgbSEZ+426WctHxGEf9eKSZCMYorztc2At87ZCZAvlYVVPeg47W0
         icOWHE/rOeW00pR0PZWQe1IvZvkBz5L7qXVi0MZ2Ba4wSNTRBqto5v8HWLfa43rKuRb5
         ksFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BQ1Gipkn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16-20020a0ce450000000b0063677b0e46csi751738qvm.477.2023.08.21.21.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Aug 2023 21:27:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BQ1Gipkn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYIxg-0006Pf-HO; Tue, 22 Aug 2023 00:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYIxd-0006Ny-Qb
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 00:25:45 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYIxY-0007YC-9a
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 00:25:45 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-68a41035828so1346098b3a.1
 for <qemu-arm@nongnu.org>; Mon, 21 Aug 2023 21:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692678339; x=1693283139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DnJTzl5NGHTGnySD/Xt64t/JmaV6O8fFyzOl8EasyGs=;
 b=BQ1Gipkngio/Df6lASeoak1JVfF1NG+MynY5VZEJ9dTdmJ8E5NFAMcZIy+ukalozMO
 4VK7xj4e+GHhFd/56UG5XY4A97SDziPnYub894Z7OXjtldQZonPpJT4uVrH1cPbgtD25
 JKdpRJJZqTViJolk58QrwbMLmNR/I21+R9A0ttpmyQq41yL02R+5BMovF/o3+UOpbQw7
 IPaaqK4jsd7Gx53vmyqkcfK2AOoeweFQ920n1XVtREmylKI8odmFs/UomBimLO79fhOu
 Pjq0iz73ABY9pIctwTTiVaHzsW8WrK5zBDK63wbW6Wfh1YrL+wGdbSRQryDDbso6uXGr
 pUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692678339; x=1693283139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DnJTzl5NGHTGnySD/Xt64t/JmaV6O8fFyzOl8EasyGs=;
 b=L/tiG6lCV3CtInGyMBoGnx8MTY9T0y5SRzTwJWQxCSGtQHq7J85XIAH8tutE8xhgxV
 4/Ip9l79EmxkWOaW3fHLNHVcxuiG4EQZemiIdib4iNoDlOtr8Nb0TL/L9RjXLfCo59P/
 egsgOr344qPcLIE+2+SW4CHNQ3u1x7qU/6cACa6rN3F+cTY1zOcheATpXRxwCnGvXaq+
 aOwprLTGR72jTy2CL9s5ZPB1yr65kUoOm1qwl0DlkiWkJ/yGxu24vezlBDI0EsLyBIT0
 CZ9RPFTtaGeyE9HmLvzMXEDALU/KywJOEbXSZ2IZz+RWxTjgAUlGGWQvaXTj14LNdbfq
 aEBA==
X-Gm-Message-State: AOJu0YwGERExCggnauILcOOyhIY79BqghldysUPjff93kbGnLnshQkK7
 SrAOys5Zou6Bkkn+lnKIdeYjj0R7gvMv/v3u0hg=
X-Received: by 2002:a05:6a00:1a4f:b0:68a:5395:7aa9 with SMTP id
 h15-20020a056a001a4f00b0068a53957aa9mr3657350pfv.6.1692678338861; 
 Mon, 21 Aug 2023 21:25:38 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:2c08:e710:4459:46f1])
 by smtp.gmail.com with ESMTPSA id
 m14-20020aa7900e000000b0068a3f861b24sm3364908pfo.195.2023.08.21.21.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 21:25:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v4 8/9] targer/arm: Inform helpers whether a PAC instruction
 is 'combined'
Date: Mon, 21 Aug 2023 21:25:29 -0700
Message-Id: <20230822042530.1026751-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822042530.1026751-1-richard.henderson@linaro.org>
References: <20230822042530.1026751-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-TUID: mzDwJ3BDJZaN

From: Aaron Lindsay <aaron@os.amperecomputing.com>

An instruction is a 'combined' Pointer Authentication instruction
if it does something in addition to PAC -- for instance, branching
to or loading an address from the authenticated pointer.

Knowing whether a PAC operation is 'combined' is needed to
implement FEAT_FPACCOMBINE.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230609172324.982888-7-aaron@os.amperecomputing.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64.h    |  4 ++
 target/arm/tcg/pauth_helper.c  | 71 +++++++++++++++++++++++++++-------
 target/arm/tcg/translate-a64.c | 12 +++---
 3 files changed, 68 insertions(+), 19 deletions(-)

diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
index 3d5957c11f..57cfd68569 100644
--- a/target/arm/tcg/helper-a64.h
+++ b/target/arm/tcg/helper-a64.h
@@ -90,9 +90,13 @@ DEF_HELPER_FLAGS_3(pacda, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(pacdb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(pacga, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(autia, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(autia_combined, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(autib, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(autib_combined, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(autda, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(autda_combined, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(autdb, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(autdb_combined, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index b6aeb90548..c05c5b30ff 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -397,7 +397,8 @@ static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
 }
 
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
-                           ARMPACKey *key, bool data, int keynumber)
+                           ARMPACKey *key, bool data, int keynumber,
+                           uintptr_t ra, bool is_combined)
 {
     ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
@@ -519,44 +520,88 @@ uint64_t HELPER(pacga)(CPUARMState *env, uint64_t x, uint64_t y)
     return pac & 0xffffffff00000000ull;
 }
 
-uint64_t HELPER(autia)(CPUARMState *env, uint64_t x, uint64_t y)
+static uint64_t pauth_autia(CPUARMState *env, uint64_t x, uint64_t y,
+                            uintptr_t ra, bool is_combined)
 {
     int el = arm_current_el(env);
     if (!pauth_key_enabled(env, el, SCTLR_EnIA)) {
         return x;
     }
-    pauth_check_trap(env, el, GETPC());
-    return pauth_auth(env, x, y, &env->keys.apia, false, 0);
+    pauth_check_trap(env, el, ra);
+    return pauth_auth(env, x, y, &env->keys.apia, false, 0, ra, is_combined);
 }
 
-uint64_t HELPER(autib)(CPUARMState *env, uint64_t x, uint64_t y)
+uint64_t HELPER(autia)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autia(env, x, y, GETPC(), false);
+}
+
+uint64_t HELPER(autia_combined)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autia(env, x, y, GETPC(), true);
+}
+
+static uint64_t pauth_autib(CPUARMState *env, uint64_t x, uint64_t y,
+                            uintptr_t ra, bool is_combined)
 {
     int el = arm_current_el(env);
     if (!pauth_key_enabled(env, el, SCTLR_EnIB)) {
         return x;
     }
-    pauth_check_trap(env, el, GETPC());
-    return pauth_auth(env, x, y, &env->keys.apib, false, 1);
+    pauth_check_trap(env, el, ra);
+    return pauth_auth(env, x, y, &env->keys.apib, false, 1, ra, is_combined);
 }
 
-uint64_t HELPER(autda)(CPUARMState *env, uint64_t x, uint64_t y)
+uint64_t HELPER(autib)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autib(env, x, y, GETPC(), false);
+}
+
+uint64_t HELPER(autib_combined)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autib(env, x, y, GETPC(), true);
+}
+
+static uint64_t pauth_autda(CPUARMState *env, uint64_t x, uint64_t y,
+                            uintptr_t ra, bool is_combined)
 {
     int el = arm_current_el(env);
     if (!pauth_key_enabled(env, el, SCTLR_EnDA)) {
         return x;
     }
-    pauth_check_trap(env, el, GETPC());
-    return pauth_auth(env, x, y, &env->keys.apda, true, 0);
+    pauth_check_trap(env, el, ra);
+    return pauth_auth(env, x, y, &env->keys.apda, true, 0, ra, is_combined);
 }
 
-uint64_t HELPER(autdb)(CPUARMState *env, uint64_t x, uint64_t y)
+uint64_t HELPER(autda)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autda(env, x, y, GETPC(), false);
+}
+
+uint64_t HELPER(autda_combined)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autda(env, x, y, GETPC(), true);
+}
+
+static uint64_t pauth_autdb(CPUARMState *env, uint64_t x, uint64_t y,
+                            uintptr_t ra, bool is_combined)
 {
     int el = arm_current_el(env);
     if (!pauth_key_enabled(env, el, SCTLR_EnDB)) {
         return x;
     }
-    pauth_check_trap(env, el, GETPC());
-    return pauth_auth(env, x, y, &env->keys.apdb, true, 1);
+    pauth_check_trap(env, el, ra);
+    return pauth_auth(env, x, y, &env->keys.apdb, true, 1, ra, is_combined);
+}
+
+uint64_t HELPER(autdb)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autdb(env, x, y, GETPC(), false);
+}
+
+uint64_t HELPER(autdb_combined)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autdb(env, x, y, GETPC(), true);
 }
 
 uint64_t HELPER(xpaci)(CPUARMState *env, uint64_t a)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5fa1257d32..ac5f58c00e 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1530,9 +1530,9 @@ static TCGv_i64 auth_branch_target(DisasContext *s, TCGv_i64 dst,
 
     truedst = tcg_temp_new_i64();
     if (use_key_a) {
-        gen_helper_autia(truedst, cpu_env, dst, modifier);
+        gen_helper_autia_combined(truedst, cpu_env, dst, modifier);
     } else {
-        gen_helper_autib(truedst, cpu_env, dst, modifier);
+        gen_helper_autib_combined(truedst, cpu_env, dst, modifier);
     }
     return truedst;
 }
@@ -3352,11 +3352,11 @@ static bool trans_LDRA(DisasContext *s, arg_LDRA *a)
 
     if (s->pauth_active) {
         if (!a->m) {
-            gen_helper_autda(dirty_addr, cpu_env, dirty_addr,
-                             tcg_constant_i64(0));
+            gen_helper_autda_combined(dirty_addr, cpu_env, dirty_addr,
+                                      tcg_constant_i64(0));
         } else {
-            gen_helper_autdb(dirty_addr, cpu_env, dirty_addr,
-                             tcg_constant_i64(0));
+            gen_helper_autdb_combined(dirty_addr, cpu_env, dirty_addr,
+                                      tcg_constant_i64(0));
         }
     }
 
-- 
2.34.1

