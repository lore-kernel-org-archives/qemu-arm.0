Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp844735lfg;
        Mon, 24 Feb 2020 14:24:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqxnwbu9h0Z+PaylMuzddGrHSSpV7R94mte2H92t8SnVyG2LKqQNtJx7ZHpXXZUx6zHzUDyC
X-Received: by 2002:ad4:58b3:: with SMTP id ea19mr47397866qvb.80.1582583074658;
        Mon, 24 Feb 2020 14:24:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582583074; cv=none;
        d=google.com; s=arc-20160816;
        b=uXwjW9nZJnlf1Dz36jjmRh0COg7JaMabSmoqxD5ZiHtXsR7BqVItXuv0JZOceX+8wi
         F7Ped4uFSfPedjkMm6DKIk6Vu5QUb5zirzN5PAOGH6CZ/0TtI4NW6ilt0LiWpRDQNmno
         AYjhG7cercrH/s332+wVe96GeRrphE9P1b9/fGb9Wc/3N3vdlnhIAl72K779Zqx4i/fn
         yp92MY+EEpw1JLPTtMWgR6kyzZB86gBJfEDuv6wgtbeDwbmHqASt7stqvFvfOahOpOP0
         8Hkrh23E1uepe2Ak2HVpolbGwT2hiiwfzPEMkOmzVPJNEGA4ItnInPNIagxNHlCM2q5r
         Aa4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fkzyGWRSXdTJhJxOryRfsTh15ycVqgk6twtD/0ShqhM=;
        b=zfAaQtVlJqrP0Q2x/plURbLI1V5veUygIWV5qAIv1Vxzkc/79oywmveQ+XBywN5Rgf
         ONclb1IMNOF0fwGXCSskec4vOfrZxJuLgUBw64sQ/KMJoL9gNVCEx/E66+x1R6+BDlOA
         9dU1e8KHnjvs7iHl4EjaSrOZyXtJVbMzo/1D5boNOipH/oshKK7VaDsEOl71QzNnLczO
         vbHpPY5iVArMghNvTZyKz1l2+ySEUnAijTai4yC5r9Pcj6Us03RM6GgAl1m+0EntYzuh
         zvbu39AekZarbAYMCU6kBqvHHM0aItdlaiCXtA3o57PvRnQzQfPYfcSS/Errmkmxrbq5
         dGAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZIiZp6BQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n59si5967326qva.59.2020.02.24.14.24.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 14:24:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZIiZp6BQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6M9S-0007kz-4C
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 17:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7e-00045X-1r
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7c-0005nZ-PH
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:41 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:55120)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6M7c-0005mo-JC
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:40 -0500
Received: by mail-pj1-x1041.google.com with SMTP id dw13so353504pjb.4
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 14:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fkzyGWRSXdTJhJxOryRfsTh15ycVqgk6twtD/0ShqhM=;
 b=ZIiZp6BQh+GleQv7Rca9wbyU29s8BiX2n4uTR5x20mHeKhHbeebuX10GFqD2eluxOF
 tRazJJiFtlhw4byypMlQrIcFmTcvKFGF2V9TFs8emCHyF8K4lb41bSseWDu/pdLIx0qr
 9iAMcK5Wpqmblmz8rsO42bucwfaAHrueDlm40r3zyLML/nqAGtJncI6yfbmERfJFCRSO
 osetWS7UntZ3ANyaQ+XlcLNfvhDUQUPihLW19yKr1ohMyu6QXl14GkFchAr4bsy186/F
 zBu8bro/sGqV5ExjHQ5IKSgWw84psiP8dOw4Ycwn5imVJthVM/XZREnvTzghKm/1BleQ
 KFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fkzyGWRSXdTJhJxOryRfsTh15ycVqgk6twtD/0ShqhM=;
 b=O/pBHby/M3a4HUOeFohrpwL3Zqss/8A7SuoKDw/StQW3dG6B7ys6qd0UIfIyTF3LC3
 2QcxPG1DNI8Ja7yxKV1VjSrz/M33+S8pRmAimX7PYdFvCXBMHiugm/BlRxLmfFBjqU4P
 YoDkowdbfNcc+p5pC7HvnQDMxAltD8grY+R2zYj1vAwLBaS0JFjbjbn36FYFoUh5ljxT
 F84GvfJ7f1En15FwO3qxk/raqSITxgGWG/6pz1xczMp2W/Ii/Wz9oUakLfs3YVZIszKi
 cNqw+yKhaMVJ/5+CnLTx0X9GcRkIvPoEzdEpCvqT5ZWU256HUPc4fdWQYivKwr3DBZ2K
 BiJw==
X-Gm-Message-State: APjAAAVxZ1HOT3TtDVXIoDfoMyOydTlUrncLBovaGeiOgppW9jgDZ72r
 bPFoD/MAtyEModf95a1fVrtQow==
X-Received: by 2002:a17:90b:14a:: with SMTP id
 em10mr1479681pjb.4.1582582959513; 
 Mon, 24 Feb 2020 14:22:39 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id o6sm13897097pgg.37.2020.02.24.14.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 14:22:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/17] target/arm: Add isar_feature_aa64_fp_simd,
 isar_feature_aa32_vfp
Date: Mon, 24 Feb 2020 14:22:19 -0800
Message-Id: <20200224222232.13807-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200224222232.13807-1-richard.henderson@linaro.org>
References: <20200224222232.13807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
X-TUID: 9/gqQtpUpO/0

We cannot easily create "any" functions for these, because the
ID_AA64PFR0 fields for FP and SIMD signal "enabled" with zero.
Which means that an aarch32-only cpu will return incorrect results
when testing the aarch64 registers.

To use these, we must either have context or additionally test
vs ARM_FEATURE_AARCH64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 11 +++++++++++
 target/arm/cpu.c     |  9 ++++++---
 target/arm/machine.c |  5 +++--
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f7a90f512e..b94d2a5ace 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3494,6 +3494,11 @@ static inline bool isar_feature_aa32_fpdp_v3(const ARMISARegisters *id)
     return FIELD_EX32(id->mvfr0, MVFR0, FPDP) >= 2;
 }
 
+static inline bool isar_feature_aa32_vfp(const ARMISARegisters *id)
+{
+    return isar_feature_aa32_fpsp_v2(id) || isar_feature_aa32_fpdp_v2(id);
+}
+
 /*
  * We always set the FP and SIMD FP16 fields to indicate identical
  * levels of support (assuming SIMD is implemented at all), so
@@ -3696,6 +3701,12 @@ static inline bool isar_feature_aa64_dcpodp(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, DPB) >= 2;
 }
 
+static inline bool isar_feature_aa64_fp_simd(const ARMISARegisters *id)
+{
+    /* We always set the AdvSIMD and FP fields identically.  */
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, FP) != 0xf;
+}
+
 static inline bool isar_feature_aa64_fp16(const ARMISARegisters *id)
 {
     /* We always set the AdvSIMD and FP fields identically wrt FP16.  */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index be4c2a1253..5be4c25809 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1260,7 +1260,9 @@ void arm_cpu_post_init(Object *obj)
      * KVM does not currently allow us to lie to the guest about its
      * ID/feature registers, so the guest always sees what the host has.
      */
-    if (arm_feature(&cpu->env, ARM_FEATURE_VFP)) {
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)
+        ? cpu_isar_feature(aa64_fp_simd, cpu)
+        : cpu_isar_feature(aa32_vfp, cpu)) {
         cpu->has_vfp = true;
         if (!kvm_enabled()) {
             qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_property);
@@ -1636,8 +1638,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
      * We rely on no XScale CPU having VFP so we can use the same bits in the
      * TB flags field for VECSTRIDE and XSCALE_CPAR.
      */
-    assert(!(arm_feature(env, ARM_FEATURE_VFP) &&
-             arm_feature(env, ARM_FEATURE_XSCALE)));
+    assert(arm_feature(&cpu->env, ARM_FEATURE_AARCH64) ||
+           !cpu_isar_feature(aa32_vfp_simd, cpu) ||
+           !arm_feature(env, ARM_FEATURE_XSCALE));
 
     if (arm_feature(env, ARM_FEATURE_V7) &&
         !arm_feature(env, ARM_FEATURE_M) &&
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 241890ac8c..c5a2114f51 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -9,9 +9,10 @@
 static bool vfp_needed(void *opaque)
 {
     ARMCPU *cpu = opaque;
-    CPUARMState *env = &cpu->env;
 
-    return arm_feature(env, ARM_FEATURE_VFP);
+    return (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)
+            ? cpu_isar_feature(aa64_fp_simd, cpu)
+            : cpu_isar_feature(aa32_vfp_simd, cpu));
 }
 
 static int get_fpscr(QEMUFile *f, void *opaque, size_t size,
-- 
2.20.1

