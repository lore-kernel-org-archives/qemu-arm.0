Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4342487lfm;
        Tue, 23 Jun 2020 12:39:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMzmunwrLLdDMJX231yTT36STem9twe6dASVtUVE0DzOhW3Lc/ZeCnfdsFtTjTMlOZU0vP
X-Received: by 2002:a25:2604:: with SMTP id m4mr36992845ybm.470.1592941193362;
        Tue, 23 Jun 2020 12:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941193; cv=none;
        d=google.com; s=arc-20160816;
        b=NKBOQoHEGBG38UFcu/yHjydlwlr6yfbKDydnPSvuMzw1HlINoifVaNS1wXmX8W/sa2
         h9ZNAAw1wCBiB8CvYfeb4Q4ZTOYayh9hvre925z50pfWS7WuUd8pmqBfrGfRjPiU+wpX
         +KHRyGorvtBSE/0AaFi2s98PhhJ2QtgsM5940wQ7hCYJMbqSgx/WKqrHAUktDHZ6UoLa
         ogBVJBYgiRtY6/7nsFAF6bm2pe6MBUg70SM9W144TW55qtnu7mLCwavAVOiSgt/D8+RN
         L6zHery6sLBw2nrIdomqvQt59IazUVH+UPG2UyUdyvURdXXHbg7nHqHzK5zQuNrhShgv
         H1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MM8DwWcq9hOSHM42D5IzB2vhHpCdrEbYJvs5bn0zsdM=;
        b=KiviiSSHyYK82X87wKXTmJ0ekUgkpiXQkuEWFbKeFrMOH3uYGT7sL6JJLERXh5ZAiN
         GX/sxjFAvn2Yg3gVaMlfNEUlkbG14m9np76vfTOGl6EAsBPeuRWBEvCc/9+9m8IZ5O4/
         9b0TNQiVjPWX3FKWGdrtCZY5XeKVf9KM1d2DcOxSh8yt5zo+2g40iRNaihyYsbmxL5l4
         TXo4ufMgmuMcu7DXNU3+ARO+qkxHz9YM3hkOwd1tccCWJCtk5D/+fii7L+7hWK5PUD1d
         YhkAdywT9da8nY8vzatNHUtFV0iqMlA8a2Asvi+meYxAJVSWbFdEGzUQ3lndDDIljsK5
         kXzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gwmKw1zZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si17280229ybn.148.2020.06.23.12.39.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:39:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gwmKw1zZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnolp-000097-3I
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojL-0003SU-9z
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:15 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojI-0005Z0-Ub
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:14 -0400
Received: by mail-pg1-x544.google.com with SMTP id l63so2228pge.12
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MM8DwWcq9hOSHM42D5IzB2vhHpCdrEbYJvs5bn0zsdM=;
 b=gwmKw1zZH2XhERQD0gIHGyRd7zW05Glm/Q7IhSZ5z+n3ppmFPT7ZpNKEdHtVxO3k6v
 0gOpd6OY6XHjdxJcUShbvZYeTSOkOAuFGteg5FvP0/lTg8afJMtxQMQbFlRZvM56DBFR
 jVYDrVDDOcn2OynlnR0WvOEoXwgdjH40r5SfP0MOjpJNDfd5PLIPS3UiqJGTLsAVLRXW
 v3ciesGWHAPw9MEP5CDm9AlSOgJTnLwP95uo3rIuLEOryRYC3bnHvmfKN89ipw7ukBTP
 tl/SIqIM3oKKCMphAiROsUe0al5xQNav4aesU3LZUe4pg7RpHJZC1xmXb6N/hyV4umAB
 A5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MM8DwWcq9hOSHM42D5IzB2vhHpCdrEbYJvs5bn0zsdM=;
 b=Ii8VrO0p7BqmbGaokeK7cW1cAe9TghyaAE306zvXMdpG0dXXMJ1Q2EuWbB5kKost06
 RUQRP+0WTIi09ETcpYoMIs87ti7SC0Nx7U8MYbg2ExSVl0h8nXGJT544FwT253FcM+Bn
 raHsuRZqOhWRvJcrdTG3qe+2p903rUPbs9fo9Mhe+gI5r3zcJtHHul8COtI+on619Lwv
 Kdu1kHsWeFCgbfaFumQlxo7mlqqKCVgN7jexA5LSQMbAOLojPv++eU9aXYrtuxV0XbEY
 9KJzupLJfLB99suuxIBCny0EyfBCZeyooAP0LR4Ca//9511LpThLWk6tS8/z/Gyub7B4
 dsCQ==
X-Gm-Message-State: AOAM531NgTvc9+X7Fl3CNBj8aty+5/xfmet04S5mP9p2hmJMYQr6cx29
 ++Zwm3l6yliol7juYvH0dgZeP6qf5To=
X-Received: by 2002:a63:c44b:: with SMTP id m11mr17553111pgg.404.1592941031511; 
 Tue, 23 Jun 2020 12:37:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 08/45] target/arm: Add MTE bits to tb_flags
Date: Tue, 23 Jun 2020 12:36:21 -0700
Message-Id: <20200623193658.623279-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v/XwNPFg6Hum

Cache the composite ATA setting.

Cache when MTE is fully enabled, i.e. access to tags are enabled
and tag checks affect the PE.  Do this for both the normal context
and the UNPRIV context.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Remove stub helper_mte_check; moved to a later patch.
v6: Add mte0_active and ata bits; drop reviewed-by.
---
 target/arm/cpu.h           | 12 ++++++++----
 target/arm/internals.h     | 18 +++++++++++++++++
 target/arm/translate.h     |  5 +++++
 target/arm/helper.c        | 40 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c |  4 ++++
 5 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 49cf37d43b..a5d3b6c9ee 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3187,10 +3187,10 @@ typedef ARMCPU ArchCPU;
  * |              |     |   TBFLAG_A32   |              |
  * |              |     +-----+----------+  TBFLAG_AM32 |
  * |  TBFLAG_ANY  |           |TBFLAG_M32|              |
- * |              |         +-+----------+--------------|
- * |              |         |         TBFLAG_A64        |
- * +--------------+---------+---------------------------+
- *  31          20        15                           0
+ * |              +-----------+----------+--------------|
+ * |              |            TBFLAG_A64               |
+ * +--------------+-------------------------------------+
+ *  31          20                                     0
  *
  * Unless otherwise noted, these bits are cached in env->hflags.
  */
@@ -3257,6 +3257,10 @@ FIELD(TBFLAG_A64, BT, 9, 1)
 FIELD(TBFLAG_A64, BTYPE, 10, 2)         /* Not cached. */
 FIELD(TBFLAG_A64, TBID, 12, 2)
 FIELD(TBFLAG_A64, UNPRIV, 14, 1)
+FIELD(TBFLAG_A64, ATA, 15, 1)
+FIELD(TBFLAG_A64, TCMA, 16, 2)
+FIELD(TBFLAG_A64, MTE_ACTIVE, 18, 1)
+FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
 
 /**
  * cpu_mmu_index:
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 56b4672685..53e249687b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1198,6 +1198,24 @@ static inline int exception_target_el(CPUARMState *env)
     return target_el;
 }
 
+/* Determine if allocation tags are available.  */
+static inline bool allocation_tag_access_enabled(CPUARMState *env, int el,
+                                                 uint64_t sctlr)
+{
+    if (el < 3
+        && arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.scr_el3 & SCR_ATA)) {
+        return false;
+    }
+    if (el < 2
+        && arm_feature(env, ARM_FEATURE_EL2)
+        && !(arm_hcr_el2_eff(env) & HCR_ATA)) {
+        return false;
+    }
+    sctlr &= (el == 0 ? SCTLR_ATA0 : SCTLR_ATA);
+    return sctlr != 0;
+}
+
 #ifndef CONFIG_USER_ONLY
 
 /* Security attributes for an address, as returned by v8m_security_lookup. */
diff --git a/target/arm/translate.h b/target/arm/translate.h
index c6f9376000..dbbf6145cb 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -30,6 +30,7 @@ typedef struct DisasContext {
     ARMMMUIdx mmu_idx; /* MMU index to use for normal loads/stores */
     uint8_t tbii;      /* TBI1|TBI0 for insns */
     uint8_t tbid;      /* TBI1|TBI0 for data */
+    uint8_t tcma;      /* TCMA1|TCMA0 for MTE */
     bool ns;        /* Use non-secure CPREG bank on access */
     int fp_excp_el; /* FP exception EL or 0 if enabled */
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
@@ -77,6 +78,10 @@ typedef struct DisasContext {
     bool unpriv;
     /* True if v8.3-PAuth is active.  */
     bool pauth_active;
+    /* True if v8.5-MTE access to tags is enabled.  */
+    bool ata;
+    /* True if v8.5-MTE tag checks affect the PE; index with is_unpriv.  */
+    bool mte_active[2];
     /* True with v8.5-BTI and SCTLR_ELx.BT* set.  */
     bool bt;
     /* True if any CP15 access is trapped by HSTR_EL2 */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b4842ea23e..2c6ec244af 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10655,6 +10655,16 @@ static int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx)
     }
 }
 
+static int aa64_va_parameter_tcma(uint64_t tcr, ARMMMUIdx mmu_idx)
+{
+    if (regime_has_2_ranges(mmu_idx)) {
+        return extract64(tcr, 57, 2);
+    } else {
+        /* Replicate the single TCMA bit so we always have 2 bits.  */
+        return extract32(tcr, 30, 1) * 3;
+    }
+}
+
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
@@ -12679,6 +12689,36 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
     }
 
+    if (cpu_isar_feature(aa64_mte, env_archcpu(env))) {
+        /*
+         * Set MTE_ACTIVE if any access may be Checked, and leave clear
+         * if all accesses must be Unchecked:
+         * 1) If no TBI, then there are no tags in the address to check,
+         * 2) If Tag Check Override, then all accesses are Unchecked,
+         * 3) If Tag Check Fail == 0, then Checked access have no effect,
+         * 4) If no Allocation Tag Access, then all accesses are Unchecked.
+         */
+        if (allocation_tag_access_enabled(env, el, sctlr)) {
+            flags = FIELD_DP32(flags, TBFLAG_A64, ATA, 1);
+            if (tbid
+                && !(env->pstate & PSTATE_TCO)
+                && (sctlr & (el == 0 ? SCTLR_TCF0 : SCTLR_TCF))) {
+                flags = FIELD_DP32(flags, TBFLAG_A64, MTE_ACTIVE, 1);
+            }
+        }
+        /* And again for unprivileged accesses, if required.  */
+        if (FIELD_EX32(flags, TBFLAG_A64, UNPRIV)
+            && tbid
+            && !(env->pstate & PSTATE_TCO)
+            && (sctlr & SCTLR_TCF0)
+            && allocation_tag_access_enabled(env, 0, sctlr)) {
+            flags = FIELD_DP32(flags, TBFLAG_A64, MTE0_ACTIVE, 1);
+        }
+        /* Cache TCMA as well as TBI. */
+        flags = FIELD_DP32(flags, TBFLAG_A64, TCMA,
+                           aa64_va_parameter_tcma(tcr, mmu_idx));
+    }
+
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index efdfd50fb6..717cb96a40 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14183,6 +14183,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->mmu_idx = core_to_aa64_mmu_idx(core_mmu_idx);
     dc->tbii = FIELD_EX32(tb_flags, TBFLAG_A64, TBII);
     dc->tbid = FIELD_EX32(tb_flags, TBFLAG_A64, TBID);
+    dc->tcma = FIELD_EX32(tb_flags, TBFLAG_A64, TCMA);
     dc->current_el = arm_mmu_idx_to_el(dc->mmu_idx);
 #if !defined(CONFIG_USER_ONLY)
     dc->user = (dc->current_el == 0);
@@ -14194,6 +14195,9 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->bt = FIELD_EX32(tb_flags, TBFLAG_A64, BT);
     dc->btype = FIELD_EX32(tb_flags, TBFLAG_A64, BTYPE);
     dc->unpriv = FIELD_EX32(tb_flags, TBFLAG_A64, UNPRIV);
+    dc->ata = FIELD_EX32(tb_flags, TBFLAG_A64, ATA);
+    dc->mte_active[0] = FIELD_EX32(tb_flags, TBFLAG_A64, MTE_ACTIVE);
+    dc->mte_active[1] = FIELD_EX32(tb_flags, TBFLAG_A64, MTE0_ACTIVE);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
-- 
2.25.1

