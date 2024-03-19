Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1384186ejb;
        Tue, 19 Mar 2024 08:47:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWh3OOqTLpcySIxp/N+h238lR3xF8bnz1vOdTiMeoSASctXQCfXBUB3jxoFpReSvv6zIAyGCC7U1JXCNVXp8Az5+MRBfs++
X-Google-Smtp-Source: AGHT+IH3bp1pZvDacEKWUZ1kkN26Avn7PBesnmW/e9jOl7tBlpCW4XZfQW7xgvHiohMbp9RZ1RkO
X-Received: by 2002:a05:6808:2199:b0:3c3:853d:ae5a with SMTP id be25-20020a056808219900b003c3853dae5amr3943145oib.8.1710863235637;
        Tue, 19 Mar 2024 08:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863235; cv=none;
        d=google.com; s=arc-20160816;
        b=uAEeVkknMgNu2SwrEZ/fDNLCeh9Jbhj6Kv9z9k6RBxExIkb6HWQC18bupOD0S+DdSA
         1MavE07FovxThFAhuf+hA8mUgCPcXvzHa6IqmYmVif71v5MKN3BOfXazz4Umk3qGhmNS
         tP+1RdHn7jngxTv/Unr1BMMm5klBp9bBxvidXb+MlHv1ToRFXebwd3h7DWEHSjijmXn3
         TrXF+aIz2rYHDJ+RX096BIHrmLVBC7B42jiTfMgKMD+6lsMebOmngLlLVAucdcpeHbts
         s1WK07A+0J2nF7wZR9OUqC8iY6zH3U0b65yBYa5sF3yWikby09u0AbhVETSh50rl7U5Z
         LzWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=llLOSUG/r9mfjCgy2ld/tJJKqoPOBOUeFtNXpO/0qHo=;
        fh=LZzXFFAj3D2WV6dDPjoW/03Ku8m1fbTHQ5TVY3ZiS/I=;
        b=s8TWmZc44tEJovI39vfune8U+e4ZQGtP+c1xBmopIO043L1/a8x8GisGPfmRrzeMUZ
         UdngkiFqdGu/bOMvgbpmUWAU/YtYBDaN4GFt9M7KOHHXNmxoWzLg5idwuwBLjYYCzSfE
         4/aqXRFzTTiGH829jLoogZAQnz3olWz2bly+kTcH6+DKyt6c5JWIQUhnmpoAT93gHVK4
         mnAm/vDFKAlbOo1uLeLtQGTQV8rbUz0cDRrChrj5q0IPG4JheKzfvdjSeI32Bv+RVFT8
         KYz3HRm0ZyGWI5UfonL5VkoAG5aNi7Duns0waeipgyO4xzZ7o5BuTVhLeq70iaJz5081
         tT4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BP+uOqwa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iy15-20020a0562140f6f00b0068cbae9b4f7si11454780qvb.201.2024.03.19.08.47.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:47:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BP+uOqwa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbeK-0000uf-CP; Tue, 19 Mar 2024 11:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbe7-0008Kb-Vf
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:45:01 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbe1-0005OF-D6
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:58 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41466e01965so4700975e9.3
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863091; x=1711467891; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=llLOSUG/r9mfjCgy2ld/tJJKqoPOBOUeFtNXpO/0qHo=;
 b=BP+uOqwaa+4O0/0Jm4W5+DfMmWnITz/V1uW8pj8ps+d7CXMEJZ2HL9yeluSYG+fGRl
 gCuS5WGXi0E7twJq+xE+K+dKV3HlRj5tbsPLaZoGgg7A8/5KIWReXYhTshSMgnDRL973
 d+luuSDq2u9IJ648IyN1y56lm/4lNr5Q9aMws3WTcGVzfsa2PmmIrP/MMbJl4+yFUN71
 LPUCjqe39I/QXr7nhYenNsijoT9MKlVw7DYnM+ZxdE86iwmE1+GbRWMEItLmlz7jghcJ
 VjCxl7MeDhFwp11hRoLfUWkWJfWqrwVgnsWtj6hSyjFjh82/jT5LYrbAqYKEKwAJ+tek
 M82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863091; x=1711467891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=llLOSUG/r9mfjCgy2ld/tJJKqoPOBOUeFtNXpO/0qHo=;
 b=PkRWZDSW3n+YBVxpisbo+znSUsZloSiRaRyvXvGJ/1hZt6aHOgVGAJ/NEK0A8kljKk
 CbuWFmn9qxwuXOY9QYukMDBdDvZ5/yKMtb+NkiU/+YWx8TSCgCSFMwQ8J6PtQaiuhcwZ
 3h4CPfwyusBr1lcnbUxZCijr9NLYO8apLKmdBNZCyppNFYP+D6kH5vDeDQ6aeF/sTdUl
 8IZB/kM3MxPQoiszAPPWYPlVu1n+uedn/g8zHfw41lMcn/J94zPjnml7sQTEHSEaNYG0
 NcxU3bSduoHYH3SCKMZMsfqLjnlGBv2Q+IvxpOmYI9BGWXrJcl4OXePp/ORkGh9vqN2m
 fUWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7gAc3kt9HNcZKeBKpLL9Ov1V66xQ7BtOlf6Z6cLCKmKOikKamRms8L5FfdEU09vNno569wr1BPNU1hJrz2c9RLvzU
X-Gm-Message-State: AOJu0YzpSkJ411xTtdoHP0AmXyNKkiwe4/vy7i/wwtj8dnbrJ8DFJRw0
 32Yp0a6MIDNh7gIhEKtaISegPxMfPACJqYxxqe26gPEhwJhZLvF6l4O9CJC8VWk=
X-Received: by 2002:adf:ce81:0:b0:33f:6ec0:d228 with SMTP id
 r1-20020adfce81000000b0033f6ec0d228mr6510892wrn.1.1710863090819; 
 Tue, 19 Mar 2024 08:44:50 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 bq24-20020a5d5a18000000b0033ed8643638sm9333011wrb.106.2024.03.19.08.44.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:44:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH-for-9.1 19/27] target/riscv: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:48 +0100
Message-ID: <20240319154258.71206-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 3XIUe3y7bZNC

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Note, now riscv_get_cpu_state() is restricted to TCG, and
is declared with static scope.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu.h                      |  3 -
 target/riscv/cpu.c                      |  2 +-
 target/riscv/cpu_helper.c               | 87 ------------------------
 target/riscv/tcg/tcg-cpu.c              | 88 +++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc |  2 +-
 5 files changed, 90 insertions(+), 92 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3b1a02b944..d00d1be235 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -704,9 +704,6 @@ static inline uint32_t vext_get_vlmax(uint32_t vlenb, uint32_t vsew,
     return vlen >> (vsew + 3 - lmul);
 }
 
-void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
-                          uint64_t *cs_base, uint32_t *pflags);
-
 void riscv_cpu_update_mask(CPURISCVState *env);
 bool riscv_cpu_is_32bit(RISCVCPU *cpu);
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c160b9216b..ca537d0e0a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -889,7 +889,7 @@ static vaddr riscv_cpu_get_pc(CPUState *cs)
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
 
-    /* Match cpu_get_tb_cpu_state. */
+    /* Match riscv_get_cpu_state. */
     if (env->xl == MXL_RV32) {
         return env->pc & UINT32_MAX;
     }
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index ce7322011d..e18a269358 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -25,7 +25,6 @@
 #include "pmu.h"
 #include "exec/exec-all.h"
 #include "instmap.h"
-#include "tcg/tcg-op.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
 #include "sysemu/cpu-timers.h"
@@ -62,92 +61,6 @@ int riscv_env_mmu_index(CPURISCVState *env, bool ifetch)
 #endif
 }
 
-void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
-                          uint64_t *cs_base, uint32_t *pflags)
-{
-    RISCVCPU *cpu = env_archcpu(env);
-    RISCVExtStatus fs, vs;
-    uint32_t flags = 0;
-
-    *pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
-    *cs_base = 0;
-
-    if (cpu->cfg.ext_zve32f) {
-        /*
-         * If env->vl equals to VLMAX, we can use generic vector operation
-         * expanders (GVEC) to accerlate the vector operations.
-         * However, as LMUL could be a fractional number. The maximum
-         * vector size can be operated might be less than 8 bytes,
-         * which is not supported by GVEC. So we set vl_eq_vlmax flag to true
-         * only when maxsz >= 8 bytes.
-         */
-
-        /* lmul encoded as in DisasContext::lmul */
-        int8_t lmul = sextract32(FIELD_EX64(env->vtype, VTYPE, VLMUL), 0, 3);
-        uint32_t vsew = FIELD_EX64(env->vtype, VTYPE, VSEW);
-        uint32_t vlmax = vext_get_vlmax(cpu->cfg.vlenb, vsew, lmul);
-        uint32_t maxsz = vlmax << vsew;
-        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&
-                           (maxsz >= 8);
-        flags = FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
-        flags = FIELD_DP32(flags, TB_FLAGS, SEW, vsew);
-        flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
-                           FIELD_EX64(env->vtype, VTYPE, VLMUL));
-        flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
-        flags = FIELD_DP32(flags, TB_FLAGS, VTA,
-                           FIELD_EX64(env->vtype, VTYPE, VTA));
-        flags = FIELD_DP32(flags, TB_FLAGS, VMA,
-                           FIELD_EX64(env->vtype, VTYPE, VMA));
-        flags = FIELD_DP32(flags, TB_FLAGS, VSTART_EQ_ZERO, env->vstart == 0);
-    } else {
-        flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
-    }
-
-#ifdef CONFIG_USER_ONLY
-    fs = EXT_STATUS_DIRTY;
-    vs = EXT_STATUS_DIRTY;
-#else
-    flags = FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
-
-    flags |= riscv_env_mmu_index(env, 0);
-    fs = get_field(env->mstatus, MSTATUS_FS);
-    vs = get_field(env->mstatus, MSTATUS_VS);
-
-    if (env->virt_enabled) {
-        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
-        /*
-         * Merge DISABLED and !DIRTY states using MIN.
-         * We will set both fields when dirtying.
-         */
-        fs = MIN(fs, get_field(env->mstatus_hs, MSTATUS_FS));
-        vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
-    }
-
-    /* With Zfinx, floating point is enabled/disabled by Smstateen. */
-    if (!riscv_has_ext(env, RVF)) {
-        fs = (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) == RISCV_EXCP_NONE)
-             ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED;
-    }
-
-    if (cpu->cfg.debug && !icount_enabled()) {
-        flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
-    }
-#endif
-
-    flags = FIELD_DP32(flags, TB_FLAGS, FS, fs);
-    flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
-    flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
-    flags = FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
-    if (env->cur_pmmask != 0) {
-        flags = FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
-    }
-    if (env->cur_pmbase != 0) {
-        flags = FIELD_DP32(flags, TB_FLAGS, PM_BASE_ENABLED, 1);
-    }
-
-    *pflags = flags;
-}
-
 void riscv_cpu_update_mask(CPURISCVState *env)
 {
     target_ulong mask = 0, base = 0;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index ab6db817db..934007673e 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -31,6 +31,7 @@
 #include "hw/core/accel-cpu.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "tcg/tcg.h"
+#include "sysemu/cpu-timers.h"
 
 /* Hash that stores user set extensions */
 static GHashTable *multi_ext_user_opts;
@@ -129,10 +130,97 @@ static void riscv_restore_state_to_opc(CPUState *cs,
     env->bins = data[1];
 }
 
+static void riscv_get_cpu_state(CPURISCVState *env, vaddr *pc,
+                                uint64_t *cs_base, uint32_t *pflags)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    RISCVExtStatus fs, vs;
+    uint32_t flags = 0;
+
+    *pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
+    *cs_base = 0;
+
+    if (cpu->cfg.ext_zve32f) {
+        /*
+         * If env->vl equals to VLMAX, we can use generic vector operation
+         * expanders (GVEC) to accerlate the vector operations.
+         * However, as LMUL could be a fractional number. The maximum
+         * vector size can be operated might be less than 8 bytes,
+         * which is not supported by GVEC. So we set vl_eq_vlmax flag to true
+         * only when maxsz >= 8 bytes.
+         */
+
+        /* lmul encoded as in DisasContext::lmul */
+        int8_t lmul = sextract32(FIELD_EX64(env->vtype, VTYPE, VLMUL), 0, 3);
+        uint32_t vsew = FIELD_EX64(env->vtype, VTYPE, VSEW);
+        uint32_t vlmax = vext_get_vlmax(cpu->cfg.vlenb, vsew, lmul);
+        uint32_t maxsz = vlmax << vsew;
+        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&
+                           (maxsz >= 8);
+        flags = FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
+        flags = FIELD_DP32(flags, TB_FLAGS, SEW, vsew);
+        flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
+                           FIELD_EX64(env->vtype, VTYPE, VLMUL));
+        flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
+        flags = FIELD_DP32(flags, TB_FLAGS, VTA,
+                           FIELD_EX64(env->vtype, VTYPE, VTA));
+        flags = FIELD_DP32(flags, TB_FLAGS, VMA,
+                           FIELD_EX64(env->vtype, VTYPE, VMA));
+        flags = FIELD_DP32(flags, TB_FLAGS, VSTART_EQ_ZERO, env->vstart == 0);
+    } else {
+        flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
+    }
+
+#ifdef CONFIG_USER_ONLY
+    fs = EXT_STATUS_DIRTY;
+    vs = EXT_STATUS_DIRTY;
+#else
+    flags = FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
+
+    flags |= riscv_env_mmu_index(env, 0);
+    fs = get_field(env->mstatus, MSTATUS_FS);
+    vs = get_field(env->mstatus, MSTATUS_VS);
+
+    if (env->virt_enabled) {
+        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
+        /*
+         * Merge DISABLED and !DIRTY states using MIN.
+         * We will set both fields when dirtying.
+         */
+        fs = MIN(fs, get_field(env->mstatus_hs, MSTATUS_FS));
+        vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
+    }
+
+    /* With Zfinx, floating point is enabled/disabled by Smstateen. */
+    if (!riscv_has_ext(env, RVF)) {
+        fs = (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) == RISCV_EXCP_NONE)
+             ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED;
+    }
+
+    if (cpu->cfg.debug && !icount_enabled()) {
+        flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
+    }
+#endif
+
+    flags = FIELD_DP32(flags, TB_FLAGS, FS, fs);
+    flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
+    flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
+    flags = FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
+    if (env->cur_pmmask != 0) {
+        flags = FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
+    }
+    if (env->cur_pmbase != 0) {
+        flags = FIELD_DP32(flags, TB_FLAGS, PM_BASE_ENABLED, 1);
+    }
+
+    *pflags = flags;
+}
+
 static const TCGCPUOps riscv_tcg_ops = {
     .initialize = riscv_translate_init,
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
     .restore_state_to_opc = riscv_restore_state_to_opc,
+    .get_cpu_state = riscv_get_cpu_state,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = riscv_cpu_tlb_fill,
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index e42728990e..3c16c4852b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -578,7 +578,7 @@ static bool vext_check_slide(DisasContext *s, int vd, int vs2,
 }
 
 /*
- * In cpu_get_tb_cpu_state(), set VILL if RVV was not present.
+ * In riscv_get_cpu_state(), set VILL if RVV was not present.
  * So RVV is also be checked in this function.
  */
 static bool vext_check_isa_ill(DisasContext *s)
-- 
2.41.0

