Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1224846wrm;
        Fri, 18 Oct 2019 10:45:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwm6ECVnypNk20PZZEoUqrDpnbYkIDIp8KJzl+oHXnihV6a+EyAfaRM7jYUXZQEaDsWsQ/A
X-Received: by 2002:a0c:f788:: with SMTP id s8mr10960584qvn.92.1571420721879;
        Fri, 18 Oct 2019 10:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571420721; cv=none;
        d=google.com; s=arc-20160816;
        b=SQBczBStUghYLEBXk9jHFAKYGi5rLaZztFYcf3uQxK8eLM3P7co55UaSCAGoiwX3Zh
         e6Of249z8TIXp7W50ZK+LjFTxbR94b4a4Xo+9lJqyf0CCYLtiSHjSPgabe50XA0AwB71
         4F53zqXwCt8oti5GRpSiLbenRh5jMyWW9AjIi+Mx2rVoPQRWnpWS++A5goObnfBJodI5
         Z3WIXemSuSmcKdiloEkGMkIhPTd4uycrci//kYwQyxXR8z1eIpzyBGWyYyUFFLc1xitL
         o2Zs4OZQWZ+FhZZjUHb+Ej/0xTEm9MQN0Q83Fvl4Xiji5HFTweHfeTOGq/Tjtk7nsyV1
         fBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qxe5WkTH2gH9OxzrQymT8yteWQToRtaNSxbFtmMzahk=;
        b=aNQ+MMu/U7495bJRbcB9g3YZuZKtgzQleeKSmRbqdY5w5F5uza38uhyFnIAXYgfmbV
         OOgQsOnWC/sAsMqF28u1pM31kKh9hZ9CXkEaXhWXHeQMqMzm1v56XXOVrXrLS6aQzRCQ
         NfOTDoTQgY8bDG6S3l3J0D+acD1L5zhTKgDGoOpTqOhiOGrkcgik/zDWEgQCQS1P6bkG
         96E8RIbtiHSS4SxVtvthuRg1sIijLVqKtq0/sH4LZsqXjKexBs+ohNGxIkE/91eIS3OP
         RTqRXohXw73PEoWTtuU2ODFbEwD2qkeEwNqkQVyxtuadkhQFGOm7kVkr4hVdRbthNn3y
         8XdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TglGQ5w1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15si6486122qtb.147.2019.10.18.10.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:45:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TglGQ5w1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWJU-0006be-HZ
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59035)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIn-0006Os-OT
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIl-0005KD-Td
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:37 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:45687)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWIl-0005JV-Ns
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:35 -0400
Received: by mail-pl1-x643.google.com with SMTP id u12so3174069pls.12
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qxe5WkTH2gH9OxzrQymT8yteWQToRtaNSxbFtmMzahk=;
 b=TglGQ5w1lkkBL0n1CzRUpYRAeD8WLHtjq70P5SsSvtLR6n6hjUvijmTXwTUjyWsZbk
 +symiKA08DnlmIdYa/oWymh5DEkzUl/IS3WkyUWvih2Gx4+bjsx/ErGPrynA3UE1DYBb
 XnlJ86eeSAMSZeML3gdLXdu+OTmo+rAHvzbxuocjLgjw97n74A2qFDI0MaQiiiJ7WAdg
 cCa6QVyEtPpeSZlRK7sCqH8ge9Ahv6z/Srz6umNSTct1nEs0Pb8xFloHKOggqVxPCn5z
 neqKoymVLwsMlQOq7FBtacOsdaN10Q0nk4Fy01qFD2nN5L+x66g8Zlq7URRmuaN8bNhp
 LTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qxe5WkTH2gH9OxzrQymT8yteWQToRtaNSxbFtmMzahk=;
 b=K5+IG/mlkMK+naahSgC0GLlkVvheeioT6Z0f6EOpCNkua+DJLpy4f8null9L34Ecdb
 UfGK1JPeYoxxbZeKKkDF3BL+OQi/e4rGwNG8oc/X4anAqdDNXeO9sew/ZFs/H1EFt4mz
 TuuvzXuSYo/GUNkpMuEstRkYYb5xG2/O3FS66dPnNoskzzNNix/59tc3lBRqbyBM3A5X
 xs8KqxayWZoF2IZSOmYv6OjmiWIbwGpXH0PaGXqJE8kEk2tNFD5+szmtmr5kNH3CW/Qq
 KbCpJtsoquph6ySISPfO9ekdwvwdQ6mCnZXCoTRVOyGDzmYj+OwfVZ/k6Gyi/YMsaTc2
 +Wjw==
X-Gm-Message-State: APjAAAUlXjIf0iQZbQexlug8Oj3AScT8uj1Y7SywCNuEFujppzUKoWXe
 CztQNrQhYFL7I76ehdSRM1ccKHQCB/s=
X-Received: by 2002:a17:902:d88c:: with SMTP id
 b12mr11323181plz.254.1571420674653; 
 Fri, 18 Oct 2019 10:44:34 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 02/22] target/arm: Split out rebuild_hflags_a64
Date: Fri, 18 Oct 2019 10:44:11 -0700
Message-Id: <20191018174431.1784-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bkm87dxInHHl

Create a function to compute the values of the TBFLAG_A64 bits
that will be cached.  For now, the env->hflags variable is not
used, and the results are fed back to cpu_get_tb_cpu_state.

Note that not all BTI related flags are cached, so we have to
test the BTI feature twice -- once for those bits moved out to
rebuild_hflags_a64 and once for those bits that remain in
cpu_get_tb_cpu_state.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 131 +++++++++++++++++++++++---------------------
 1 file changed, 69 insertions(+), 62 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8829d91ae1..69da04786e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11070,6 +11070,71 @@ static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
     return flags;
 }
 
+static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
+                                   ARMMMUIdx mmu_idx)
+{
+    ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
+    ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
+    uint32_t flags = 0;
+    uint64_t sctlr;
+    int tbii, tbid;
+
+    flags = FIELD_DP32(flags, TBFLAG_ANY, AARCH64_STATE, 1);
+
+    /* FIXME: ARMv8.1-VHE S2 translation regime.  */
+    if (regime_el(env, stage1) < 2) {
+        ARMVAParameters p1 = aa64_va_parameters_both(env, -1, stage1);
+        tbid = (p1.tbi << 1) | p0.tbi;
+        tbii = tbid & ~((p1.tbid << 1) | p0.tbid);
+    } else {
+        tbid = p0.tbi;
+        tbii = tbid & !p0.tbid;
+    }
+
+    flags = FIELD_DP32(flags, TBFLAG_A64, TBII, tbii);
+    flags = FIELD_DP32(flags, TBFLAG_A64, TBID, tbid);
+
+    if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
+        int sve_el = sve_exception_el(env, el);
+        uint32_t zcr_len;
+
+        /*
+         * If SVE is disabled, but FP is enabled,
+         * then the effective len is 0.
+         */
+        if (sve_el != 0 && fp_el == 0) {
+            zcr_len = 0;
+        } else {
+            zcr_len = sve_zcr_len_for_el(env, el);
+        }
+        flags = FIELD_DP32(flags, TBFLAG_A64, SVEEXC_EL, sve_el);
+        flags = FIELD_DP32(flags, TBFLAG_A64, ZCR_LEN, zcr_len);
+    }
+
+    sctlr = arm_sctlr(env, el);
+
+    if (cpu_isar_feature(aa64_pauth, env_archcpu(env))) {
+        /*
+         * In order to save space in flags, we record only whether
+         * pauth is "inactive", meaning all insns are implemented as
+         * a nop, or "active" when some action must be performed.
+         * The decision of which action to take is left to a helper.
+         */
+        if (sctlr & (SCTLR_EnIA | SCTLR_EnIB | SCTLR_EnDA | SCTLR_EnDB)) {
+            flags = FIELD_DP32(flags, TBFLAG_A64, PAUTH_ACTIVE, 1);
+        }
+    }
+
+    if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
+        /* Note that SCTLR_EL[23].BT == SCTLR_BT1.  */
+        if (sctlr & (el == 0 ? SCTLR_BT0 : SCTLR_BT1)) {
+            flags = FIELD_DP32(flags, TBFLAG_A64, BT, 1);
+        }
+    }
+
+    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+}
+
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
@@ -11079,67 +11144,9 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     uint32_t flags = 0;
 
     if (is_a64(env)) {
-        ARMCPU *cpu = env_archcpu(env);
-        uint64_t sctlr;
-
         *pc = env->pc;
-        flags = FIELD_DP32(flags, TBFLAG_ANY, AARCH64_STATE, 1);
-
-        /* Get control bits for tagged addresses.  */
-        {
-            ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
-            ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
-            int tbii, tbid;
-
-            /* FIXME: ARMv8.1-VHE S2 translation regime.  */
-            if (regime_el(env, stage1) < 2) {
-                ARMVAParameters p1 = aa64_va_parameters_both(env, -1, stage1);
-                tbid = (p1.tbi << 1) | p0.tbi;
-                tbii = tbid & ~((p1.tbid << 1) | p0.tbid);
-            } else {
-                tbid = p0.tbi;
-                tbii = tbid & !p0.tbid;
-            }
-
-            flags = FIELD_DP32(flags, TBFLAG_A64, TBII, tbii);
-            flags = FIELD_DP32(flags, TBFLAG_A64, TBID, tbid);
-        }
-
-        if (cpu_isar_feature(aa64_sve, cpu)) {
-            int sve_el = sve_exception_el(env, current_el);
-            uint32_t zcr_len;
-
-            /* If SVE is disabled, but FP is enabled,
-             * then the effective len is 0.
-             */
-            if (sve_el != 0 && fp_el == 0) {
-                zcr_len = 0;
-            } else {
-                zcr_len = sve_zcr_len_for_el(env, current_el);
-            }
-            flags = FIELD_DP32(flags, TBFLAG_A64, SVEEXC_EL, sve_el);
-            flags = FIELD_DP32(flags, TBFLAG_A64, ZCR_LEN, zcr_len);
-        }
-
-        sctlr = arm_sctlr(env, current_el);
-
-        if (cpu_isar_feature(aa64_pauth, cpu)) {
-            /*
-             * In order to save space in flags, we record only whether
-             * pauth is "inactive", meaning all insns are implemented as
-             * a nop, or "active" when some action must be performed.
-             * The decision of which action to take is left to a helper.
-             */
-            if (sctlr & (SCTLR_EnIA | SCTLR_EnIB | SCTLR_EnDA | SCTLR_EnDB)) {
-                flags = FIELD_DP32(flags, TBFLAG_A64, PAUTH_ACTIVE, 1);
-            }
-        }
-
-        if (cpu_isar_feature(aa64_bti, cpu)) {
-            /* Note that SCTLR_EL[23].BT == SCTLR_BT1.  */
-            if (sctlr & (current_el == 0 ? SCTLR_BT0 : SCTLR_BT1)) {
-                flags = FIELD_DP32(flags, TBFLAG_A64, BT, 1);
-            }
+        flags = rebuild_hflags_a64(env, current_el, fp_el, mmu_idx);
+        if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
             flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
         }
     } else {
@@ -11159,9 +11166,9 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             flags = FIELD_DP32(flags, TBFLAG_A32,
                                XSCALE_CPAR, env->cp15.c15_cpar);
         }
-    }
 
-    flags = rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+        flags = rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+    }
 
     /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
      * states defined in the ARM ARM for software singlestep:
-- 
2.17.1

