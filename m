Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5201063lfh;
        Thu, 2 Jun 2022 15:01:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvoQxcpx8fozOs+s5VHufYP4iZuz+1pfoQwt95rT/vj40jPi9p0kdM7mT3zVqzjBechugE
X-Received: by 2002:a05:622a:15cc:b0:304:bf4e:8448 with SMTP id d12-20020a05622a15cc00b00304bf4e8448mr5375450qty.585.1654207292310;
        Thu, 02 Jun 2022 15:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654207292; cv=none;
        d=google.com; s=arc-20160816;
        b=EqWzaCg6ghWb0DgD5eKIgBkjk4jHTB8zyz1gmf7it1zfXdLjezUuzEV8S11cf1jt9b
         hDV9FedW7QMr5G1NUDXx4loyB0mqhWeRzXDUQJaOtlit0LfkpHzeMrXGRc8AB6482Ugy
         iPWdKGWtevD1k4qgelM/wVDShXYJe1pyZysu+6olUeq9cjrxokWVHhLb8SmrdvxnTLJt
         24Eb4PT48dDp1GylVD0qm0xgJiE0QrzTweIX2FHTzW7ocO1aOgjl0Oxj3KP1IFlPKHKc
         TIvu8vZ8rzE8orXU6ziNvH38/qoiIJD/Jlb69RaqjvabETQPuNaswbZgE9XdgdDr96Bg
         lVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=X907WscUJ/vcZY0rjH59HojFCAmIiYCNZ0u3IiREgKo=;
        b=gW9PlsxMUDv0H2yVG44qimdxCt2P0/XkTnt4uANbpt/E22ttK9hkQVHt4eSXq+HqiI
         +LUuqS1ipaQd+NxKJ5OxlsF8hmnS1SSb44oM7ovS6osKjGUHKeUspLDm7NaDlB7bkz0J
         TAbp/8IL0TgkDMmICLGfb1G/nxch2ZprzbTEn/4b4ZUoP48oTkw0dQV5LdUOV7VbmMBV
         17J6JO+bvYSRq45ZtvbitJWLjJf81oiKNPURez+/kNy+otTVPU7JHEXWjpSpaqthC38u
         p/5keEfDSmyFk1MfsxfwgOxUGX4n89WMl2L0WnV6gPlmGvV9Icnl1dL8Z9dkeQBVh/HE
         /HFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vpnDYxlY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6-20020a05620a440600b006a67404aa6asi1908457qkp.349.2022.06.02.15.01.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:01:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vpnDYxlY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwssl-0003dY-P0
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgo-0004em-Mn
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:10 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgj-0008Ve-Sg
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:09 -0400
Received: by mail-pf1-x435.google.com with SMTP id c196so5815378pfb.1
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X907WscUJ/vcZY0rjH59HojFCAmIiYCNZ0u3IiREgKo=;
 b=vpnDYxlYuZYLgYNpIYFkkT24zO6YkyrtA8Gc1rtudDgRGZfMAiBLme/WfIVuCdy/MA
 Bexr6gWCUxz61KB4H71Ijv3dAKTFgmHeEn7nwY12nHBLMiUl3BwZITTUincJ0OIZwHaG
 MzD8Cf0VyIycjteSUUEuwgG8FgITh2Hjb93DuonlFzf4z2m3cLBIoBicgW1O5q6834yh
 qrH6eP2vZv+mvirXdE57/UJvN/Hazqsc4ALeAglWiZfGzApVWTq6RmY/Z4TJGJUQvh2h
 aVJ05WKTtNKNMNWDHZuYIDqXhHzgdmhHMRWChsz4cPej9V5WGBA8FxrsE03tvq0P7AVJ
 gHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X907WscUJ/vcZY0rjH59HojFCAmIiYCNZ0u3IiREgKo=;
 b=gKPrzKvvwv+Lsxq8rB3RiW2zUrBRU9TpGrAQsP8+uOVyIOiB5qsX4nefbDhXvydQQd
 nqvFUgtinyezQTy4IX3qDv9eOBC2A5kV599owGMBQDPf26wvDKh4H1wfzEI5WBGQ3Y4u
 MZZutZifPFoUyfkonWWhyqbYnI7zYwNJ8p8NEoI3huapLxiTSNRrexKs8HPY2Xb1wK3+
 bWLEvR9BDOwNsRWwLsxgY1YENg+mksiMUz7lSwU3zY3/QglBHuRZVoBsdKye1YgCWzjc
 SOV4h7DeY1jBXNG5mAHWNaEDZvWourSeXINcYHakTGufd+6xOMSTIUarXI49eETMLgP4
 QO+A==
X-Gm-Message-State: AOAM5307i0JzqrxRDLMjf7D7+jHpqiuDjxbuotYsgYi2AlhOrnc989Or
 l7zwDvpf4bXOd4O4uWzPQ6rKzIs+7sZCOQ==
X-Received: by 2002:aa7:90d5:0:b0:4e1:307c:d94a with SMTP id
 k21-20020aa790d5000000b004e1307cd94amr7127556pfk.38.1654206545025; 
 Thu, 02 Jun 2022 14:49:05 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 12/71] target/arm: Rename sve_zcr_len_for_el to sve_vqm1_for_el
Date: Thu,  2 Jun 2022 14:47:54 -0700
Message-Id: <20220602214853.496211-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-TUID: DxkGY9bNTqgH

This will be used for both Normal and Streaming SVE, and the value
does not necessarily come from ZCR_ELx.  While we're at it, emphasize
the units in which the value is returned.

Patch produced by
    git grep -l sve_zcr_len_for_el | \
    xargs -n1 sed -i 's/sve_zcr_len_for_el/sve_vqm1_for_el/g'

and then adding a function comment.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 11 ++++++++++-
 target/arm/arch_dump.c |  2 +-
 target/arm/cpu.c       |  2 +-
 target/arm/gdbstub64.c |  2 +-
 target/arm/helper.c    | 12 ++++++------
 5 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ef51c3774e..cb37787c35 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1132,7 +1132,16 @@ void aarch64_sync_64_to_32(CPUARMState *env);
 
 int fp_exception_el(CPUARMState *env, int cur_el);
 int sve_exception_el(CPUARMState *env, int cur_el);
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
+
+/**
+ * sve_vqm1_for_el:
+ * @env: CPUARMState
+ * @el: exception level
+ *
+ * Compute the current SVE vector length for @el, in units of
+ * Quadwords Minus 1 -- the same scale used for ZCR_ELx.LEN.
+ */
+uint32_t sve_vqm1_for_el(CPUARMState *env, int el);
 
 static inline bool is_a64(CPUARMState *env)
 {
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 0184845310..b1f040e69f 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -166,7 +166,7 @@ static off_t sve_fpcr_offset(uint32_t vq)
 
 static uint32_t sve_current_vq(CPUARMState *env)
 {
-    return sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+    return sve_vqm1_for_el(env, arm_current_el(env)) + 1;
 }
 
 static size_t sve_size_vq(uint32_t vq)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0621944167..1b5d535788 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -925,7 +925,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  vfp_get_fpcr(env), vfp_get_fpsr(env));
 
     if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
-        int j, zcr_len = sve_zcr_len_for_el(env, el);
+        int j, zcr_len = sve_vqm1_for_el(env, el);
 
         for (i = 0; i <= FFR_PRED_NUM; i++) {
             bool eol;
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 596878666d..07a6746944 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -152,7 +152,7 @@ int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
          * We report in Vector Granules (VG) which is 64bit in a Z reg
          * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
          */
-        int vq = sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+        int vq = sve_vqm1_for_el(env, arm_current_el(env)) + 1;
         return gdb_get_reg64(buf, vq * 2);
     }
     default:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7b6f31e9c8..cb44d528c0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6225,7 +6225,7 @@ int sve_exception_el(CPUARMState *env, int el)
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
+uint32_t sve_vqm1_for_el(CPUARMState *env, int el)
 {
     ARMCPU *cpu = env_archcpu(env);
     uint32_t len = cpu->sve_max_vq - 1;
@@ -6248,7 +6248,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                       uint64_t value)
 {
     int cur_el = arm_current_el(env);
-    int old_len = sve_zcr_len_for_el(env, cur_el);
+    int old_len = sve_vqm1_for_el(env, cur_el);
     int new_len;
 
     /* Bits other than [3:0] are RAZ/WI.  */
@@ -6259,7 +6259,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * Because we arrived here, we know both FP and SVE are enabled;
      * otherwise we would have trapped access to the ZCR_ELn register.
      */
-    new_len = sve_zcr_len_for_el(env, cur_el);
+    new_len = sve_vqm1_for_el(env, cur_el);
     if (new_len < old_len) {
         aarch64_sve_narrow_vq(env, new_len + 1);
     }
@@ -13683,7 +13683,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                 sve_el = 0;
             }
         } else if (sve_el == 0) {
-            DP_TBFLAG_A64(flags, VL, sve_zcr_len_for_el(env, el));
+            DP_TBFLAG_A64(flags, VL, sve_vqm1_for_el(env, el));
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
     }
@@ -14049,10 +14049,10 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      */
     old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
     old_len = (old_a64 && !sve_exception_el(env, old_el)
-               ? sve_zcr_len_for_el(env, old_el) : 0);
+               ? sve_vqm1_for_el(env, old_el) : 0);
     new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
     new_len = (new_a64 && !sve_exception_el(env, new_el)
-               ? sve_zcr_len_for_el(env, new_el) : 0);
+               ? sve_vqm1_for_el(env, new_el) : 0);
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
-- 
2.34.1

