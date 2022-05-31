Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3528231lfh;
        Tue, 31 May 2022 08:14:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCfYODnyStUE7K6mVN0pcRvX/SX9RGRURsRVEGG4EHqmzPQsafyfFGOiJlG/xRM4PLo/6b
X-Received: by 2002:ac8:5bc6:0:b0:2f9:3493:4b68 with SMTP id b6-20020ac85bc6000000b002f934934b68mr36533493qtb.272.1654010097622;
        Tue, 31 May 2022 08:14:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654010097; cv=none;
        d=google.com; s=arc-20160816;
        b=W2DzUNrBFvKrx4DwKCalQrrjxw9m46PwqydJg+V7JMXAe+Lt42KUz+muNxXiprxeAt
         PvRlZjUUVNSApQoW+2EfY74P030ZXFfDu4ys0abQDUp6wG1kT14BlrRbCkV97z7KkSLP
         j3QZDiUVez5DEB4daFJN5YGdcACwRbwStwDctVM5W56ZwX1pY0qspgyF2uv8zpXTrEX1
         hKJrwF14P/Q5GXxaH+V7i2mbf1+79FL96F4nRrq330io5MPp5qJyZQaganPqO45nRYt7
         FOfCrphfJIZXx4inAwPK+FKem2S1lGn7YrX+eKuo89RzGAVQknIuevgKQmD6Ln/bAtRR
         sixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=3WgZPgDk0dFcI58CSf3Go3i78DcgBwlK6f/TeEwMT/U=;
        b=fwXo8kVNqeRoDw6XZHpxoPWq62kialBJgQqbYcsgLIAuPNcPbLW20E70NC9lwWZNFj
         cJZEDMroPOjFgxgwioczefWdAM5iAiVfzPNuMIePT5yqqUnZnLTbWX0On53DuQKJTDbi
         zVdYVQyu0LpsA6BG2CRxgkf9a7XCQnZZSDxvNVtA0kDESX9DWnAo4+pj4wlg3e+GwQJa
         VdOty47oWAd6t4Uaj/dAa5jSlrStUMQMiIHbf6NLiehQdtogkTO70T0pOt5IM3CWxptI
         VQO/K4/bPuj9dBMkjpw9PyrX4OHnS/RniR8DnLWQ0yWR6xI+5d10eJQruWe0o4z74Udv
         KVWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XLGut18a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18-20020ac84e92000000b002fbbd57563csi3119598qtp.522.2022.05.31.08.14.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 08:14:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XLGut18a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw3aC-0004VJ-W2
	for alex.bennee@linaro.org; Tue, 31 May 2022 11:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw3Zt-0004Tc-Jv
 for qemu-arm@nongnu.org; Tue, 31 May 2022 11:14:38 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw3Zr-0002SU-Nu
 for qemu-arm@nongnu.org; Tue, 31 May 2022 11:14:37 -0400
Received: by mail-wr1-x42c.google.com with SMTP id s24so11804917wrb.10
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 08:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3WgZPgDk0dFcI58CSf3Go3i78DcgBwlK6f/TeEwMT/U=;
 b=XLGut18axQ2raXXAMQAIuwuKx/vSJGGGQydmoo9eY52IKVPcHe5MOTeuvgRju8FwOO
 6K/01WQrUk0nEF5MMOl96FSsMKnepMmlzXwqZFtAHk6sOfHa4Wb1v88y5GtoyS9hsw7i
 Zsf/ze3mMWcpPR4Z+5ab/VF2qZRZznGnuowYJGvw7M5FuxLl4TpBHYckUaiR7ft4jyhM
 1XG5b3iuqALUqbDKeWylU17UAAaqY5Xch+bAp0b9dzQPPTk99Ax4XL2PwZxU515oKOmX
 u+KcuZeQJJdDcGn59r+NHCxMIFItwFQbv9mGUKyiY/kSFMBZ3ubDqAHwGxtsD80vR69M
 v8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3WgZPgDk0dFcI58CSf3Go3i78DcgBwlK6f/TeEwMT/U=;
 b=UdtmpgOH/r77k52K065mVgjeMZWPC0/CNfuWzW+pQXeKtYIWPlj2gnka1T3GGGVbGv
 PtnekMu/CXt9x4XlNT22V/B05xiLn0U1HmW69QeKzu6XKdIGe02AhlMvUa9T5ferWEIp
 +98hH/6YAMoL7XUHyMgG10VWm6Tr2FMWDIxtrb7AyQDHk4y8T1biU9SF7fIp7V1uzKQQ
 h5vLcL6QYEd7mOfA/VgusHzWlrGJPooKYLvI6YIvnpH6nQDUbROEACWBrhf2hdCLm9Wl
 KhvZLcAvQKiZsfTdExsC3nR3nFjBe0gl0rr7vzxD9dMgp0uI04XRIwFqiNGcmZiUefc9
 rs0A==
X-Gm-Message-State: AOAM533f10/PCE4weZ+iLiEvss2BDxJG8qANg7XA5nt/Ne45u7sY51Z1
 NjrO9GI7hQuGA03ynHd9vecYzhSs75JyQQ==
X-Received: by 2002:a5d:66c7:0:b0:210:3385:1e44 with SMTP id
 k7-20020a5d66c7000000b0021033851e44mr9349828wrw.566.1654010073705; 
 Tue, 31 May 2022 08:14:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c10cc00b003942a244ed7sm2381418wmd.28.2022.05.31.08.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 08:14:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Implement FEAT_DoubleFault
Date: Tue, 31 May 2022 16:14:31 +0100
Message-Id: <20220531151431.949322-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: xL8iLZOi/eiq

The FEAT_DoubleFault extension adds the following:

 * All external aborts on instruction fetches and translation table
   walks for instruction fetches must be synchronous.  For QEMU this
   is already true.

 * SCR_EL3 has a new bit NMEA which disables the masking of SError
   interrupts by PSTATE.A when the SError interrupt is taken to EL3.
   For QEMU we only need to make the bit writable, because we have no
   sources of SError interrupts.

 * SCR_EL3 has a new bit EASE which causes synchronous external
   aborts taken to EL3 to be taken at the same entry point as SError.
   (Note that this does not mean that they are SErrors for purposes
   of PSTATE.A masking or that the syndrome register reports them as
   SErrors: it just means that the vector offset is different.)

 * The existing SCTLR_EL3.IESB has an effective value of 1 when
   SCR_EL3.NMEA is 1.  For QEMU this is a no-op because we don't need
   different behaviour based on IESB (we don't need to do anything to
   ensure that error exceptions are synchronized).

So for QEMU the things we need to change are:
 * Make SCR_EL3.{NMEA,EASE} writable
 * When taking a synchronous external abort at EL3, adjust the
   vector entry point if SCR_EL3.EASE is set
 * Advertise the feature in the ID registers

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Based-on: <20220531114258.855804-1-peter.maydell@linaro.org>
("target/arm: Declare support for FEAT_RASv1p1")

 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu.h              |  5 +++++
 target/arm/cpu64.c            |  4 ++--
 target/arm/helper.c           | 36 +++++++++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 81467f02ce9..83b44100659 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -23,6 +23,7 @@ the following architecture extensions:
 - FEAT_Debugv8p2 (Debug changes for v8.2)
 - FEAT_Debugv8p4 (Debug changes for v8.4)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
+- FEAT_DoubleFault (Double Fault Extension)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
 - FEAT_FP16 (Half-precision floating-point data processing)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c1865ad5dad..0ee1705a4fa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3952,6 +3952,11 @@ static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) != 0;
 }
 
+static inline bool isar_feature_aa64_doublefault(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) >= 2;
+}
+
 static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index bd1c62a3428..cce68dd82a2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -899,7 +899,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64pfr0;
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
-    t = FIELD_DP64(t, ID_AA64PFR0, RAS, 1);       /* FEAT_RAS */
+    t = FIELD_DP64(t, ID_AA64PFR0, RAS, 2);       /* FEAT_RASv1p1 + FEAT_DoubleFault */
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
@@ -916,7 +916,7 @@ static void aarch64_max_initfn(Object *obj)
      * we do for EL2 with the virtualization=on property.
      */
     t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
-    t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 1);  /* FEAT_RASv1p1 */
+    t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 + FEAT_DoubleFault */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr1 = t;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 40da63913c9..7f2c14bea94 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1776,6 +1776,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_scxtnum, cpu)) {
             valid_mask |= SCR_ENSCXT;
         }
+        if (cpu_isar_feature(aa64_doublefault, cpu)) {
+            valid_mask |= SCR_EASE | SCR_NMEA;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
@@ -10113,6 +10116,31 @@ static uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
     return ret;
 }
 
+static bool syndrome_is_sync_extabt(uint32_t syndrome)
+{
+    /* Return true if this syndrome value is a synchronous external abort */
+    switch (syn_get_ec(syndrome)) {
+    case EC_INSNABORT:
+    case EC_INSNABORT_SAME_EL:
+    case EC_DATAABORT:
+    case EC_DATAABORT_SAME_EL:
+        /* Look at fault status code for all the synchronous ext abort cases */
+        switch (syndrome & 0x3f) {
+        case 0x10:
+        case 0x13:
+        case 0x14:
+        case 0x15:
+        case 0x16:
+        case 0x17:
+            return true;
+        default:
+            return false;
+        }
+    default:
+        return false;
+    }
+}
+
 /* Handle exception entry to a target EL which is using AArch64 */
 static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
 {
@@ -10168,6 +10196,14 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     switch (cs->exception_index) {
     case EXCP_PREFETCH_ABORT:
     case EXCP_DATA_ABORT:
+        /*
+         * FEAT_DoubleFault allows synchronous external aborts taken to EL3
+         * to be taken to the SError vector entrypoint.
+         */
+        if (new_el == 3 && (env->cp15.scr_el3 & SCR_EASE) &&
+            syndrome_is_sync_extabt(env->exception.syndrome)) {
+            addr += 0x180;
+        }
         env->cp15.far_el[new_el] = env->exception.vaddress;
         qemu_log_mask(CPU_LOG_INT, "...with FAR 0x%" PRIx64 "\n",
                       env->cp15.far_el[new_el]);
-- 
2.25.1

