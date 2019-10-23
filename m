Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1049581wrq;
        Wed, 23 Oct 2019 08:35:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzL6Z6D+aiZDk6VAcm2kMSW32+e+vRL06+4oaCgKOu6pUFACUOhBB/b+ZKrVEOHVNBm9OAI
X-Received: by 2002:a50:8f65:: with SMTP id 92mr39442425edy.9.1571844959647;
        Wed, 23 Oct 2019 08:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571844959; cv=none;
        d=google.com; s=arc-20160816;
        b=v9UYNYCn6yjjHZlKduFK/Ix3UMriiLrjtGGj7N/5gw83B8Q7ylDCcAcVjWAHdzTxu/
         iaSBcvYI/yEVPYopXNJw01N39z3EIq4ocEXa66q/hq6sgy0wy5XQJpFhNj7RMPiQzvB2
         5eqWDKnXAfYohtnULbCQpJ3uXw6dIJB3+lqc1MOXQ82mBehYa3DXpfg0c/Y5BfxvY1U5
         Nkg72IFojbVpKkIxa/apwnVMae0bNj7BgqTYKbvcCgOoMiwpJ85IN1fCDXSfxRhtyC6n
         cgUg1fGophOo26kK/IajYUs6W1KIO9pv4oZcaHQfovdOe+IU6maRd98Ooo4J940Rp76V
         7xPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qxe5WkTH2gH9OxzrQymT8yteWQToRtaNSxbFtmMzahk=;
        b=fZC1C9745+ZFMwpDBh+zRYP3Nb+yls8eL5WhB7hcuOt+1/qH8zxehRddKcZs2aJtAl
         cALAfySoALOV3Wx2wmVup32tkqWZX7ujkea2WXcdsYyyAfYQvFW86wEvi0Lu8dHciN7T
         Z8rc4mZ+b2YZ5uQKj7mVEPmWp+NitSrrkgUVdO+ebQmSDxxVsrdicBZwmNGnAAzAFF/B
         Tq/8mNhS0H16gmgvwLVeyLNTVD0byrwbe63CTMBEiEf8XUzxWvFZJuJtskGW+xzRgTbt
         yYuoBxYTVw+giu8vH8oXyNxO6kd2CjizTzkiLOYeEQk9zf8Aed46gdbYQl5kJeT9hvGi
         O6dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SU1JrHFr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si15501018edm.240.2019.10.23.08.35.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:35:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SU1JrHFr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNIg1-0003Iy-Q2
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35449)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8x-0008Fy-L8
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8s-0001JK-GF
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:47 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:40471)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8s-0000zW-7o
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:42 -0400
Received: by mail-qt1-x843.google.com with SMTP id o49so24897215qta.7
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 08:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qxe5WkTH2gH9OxzrQymT8yteWQToRtaNSxbFtmMzahk=;
 b=SU1JrHFr7k1kmhDhIJjaVmbpu850wRRaC9NGaYOyxFWi712AROvpFjL55boVXtSq8/
 hOLu1pCT3DAPAC3DgondPj8aRGK1Y919fMNqcwgMgETJgLT2h+QMDuyRl47RzyEeaz//
 b1kyG9sA3sKOdCTY9mwTrcGIM10kq4+3bljqGRm4O2ChzXeO4rB5wDrodvOPQkDJI+jg
 zq96aDdOO0XKzo9+EWWKybYWY+DspwWBvxuvU+Y2U00WuWXjsyHib71GDcxI3jtS4L3R
 wCSpO0oglseT+djDXNZOSreX8lTPNfzATUgaG7iO27/l8UwmdNhSRgrENSDdZuMXdxtB
 EoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qxe5WkTH2gH9OxzrQymT8yteWQToRtaNSxbFtmMzahk=;
 b=LdONKmzn5FZHO3iK7zblSQu+F22C5lQrediQoxv4+eqZ77SPpNl5TLwLvTGDd8zYu8
 ejZo1iOUiAJ9eeZ0Q2Ato9wNzd+Gc+qs2rc1AIggnxGFnrVx9Vze4kcpWABrt9ie2KIG
 s7Uys+P7bf9TcBhmS7LwDR6oMqR1ZBTPgdKV6DiWUPTXtqioEBquHiRrinONpo/8XZvT
 oMDZ2w4EF+SeWdAfalDEqom7Qsct2wc3s/qMwQgCMx9uEckP7E4eR3PUFXuR8QkMSKGA
 kG0HXGed2dW/IROcQqOdP9IgNGUhB4myQiz75r9smfUjklrPxy/SNrFBr7xLh+YOQK6v
 PcYA==
X-Gm-Message-State: APjAAAUtVovScgaJDT15RvQWUYXKPc/4RekNcXBNsRsfY5FJeFXMQrEM
 X6buOGXVJGX/68nSNXhmEdQ0vw==
X-Received: by 2002:ac8:7a97:: with SMTP id x23mr9729232qtr.38.1571842864257; 
 Wed, 23 Oct 2019 08:01:04 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 02/24] target/arm: Split out rebuild_hflags_a64
Date: Wed, 23 Oct 2019 11:00:35 -0400
Message-Id: <20191023150057.25731-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
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
X-TUID: DnjaFYrTHGNu

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

