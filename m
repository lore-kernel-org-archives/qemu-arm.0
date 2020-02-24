Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp581662lfg;
        Mon, 24 Feb 2020 09:30:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqyUMA+Hloeb0jLaxm6I2P4Yrv1irkP4Fe1Z9WTprUzT2UaqoyTtDppoj1S+RKGEpEPowXik
X-Received: by 2002:a37:ad13:: with SMTP id f19mr15078474qkm.363.1582565451135;
        Mon, 24 Feb 2020 09:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582565451; cv=none;
        d=google.com; s=arc-20160816;
        b=zmM7KLod6hNsSVD1MVRo3hSaPeYuAG0n7rp5v5hS6pO2cwDWlP/jxyXbkPL0xO+DoJ
         +quhQdswB2k2GIakdxZuvNna61xLlmU9kCRBRaqnxCL7EuREysAv1EDAeA7RL//AT/YC
         gedxqv3g+eqhV+FH0ZD22brCXvY+ylJLDD/t3VWiNL62ARBupX/iwhVcnt12jAScpd09
         GBc3bHEDmRYU0+Z8UM+g9Ecq19MyspNOeKKGcmL1Fy1AyOZQYGwCLZgmF4/jAQ1ziAQr
         sLF/McPJ5/Uh8QtgUYL7QtZmln4+t1KnYusqB4wbRsEu77V9Fq6J2fa+tAjmfvDGxIvZ
         KooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DK7oKAzyJ4Djvafrz6mvkwM3Ek9AWufxp8NykRFUZZE=;
        b=n/Hdom7Rv1AQwWJWI+66OAaYnZRg4fpweV/Tnuov/GJAjcVFkhbDzcGsoLARwntIQb
         Oo5eA+NYg0XpSC0tVujLtayuMmaLeNOTA5tsy64mVXiPgpabrYTALMlS3D4IXW3FLcfz
         +vVfWZlng86dy6q5qJ1BAVYxXqSXGgJTrWmWjniaqMHqpml1n6lRBuOMea3l4cKiOI6T
         Bmh22+Ag1KhL0yKU7j+5fFpGlXCG6emPS8s03aR7NX0hz6kQ7xTB3xfuwWv5wuDTVUSD
         Q8UEiTUnPcLDVw2Smo4AzVFkhOxeRNVrn2q8kKd2hwonLvI8EsWbn1O1QDRzGrb2yW6x
         nZoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Vp6/CIG9";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si1337877qkl.380.2020.02.24.09.30.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 09:30:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Vp6/CIG9";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6HZC-0000k4-ET
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 12:30:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50826)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6HXJ-00076D-4P
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 12:28:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6HXI-0001UD-0a
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 12:28:53 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40308)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6HXH-0001TS-QD
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 12:28:51 -0500
Received: by mail-wr1-x444.google.com with SMTP id t3so11355548wru.7
 for <qemu-devel@nongnu.org>; Mon, 24 Feb 2020 09:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DK7oKAzyJ4Djvafrz6mvkwM3Ek9AWufxp8NykRFUZZE=;
 b=Vp6/CIG9WifltWxxPSpbAgFXijs/FbF98l3TjNzT8K6J7geUMOmeLTCeh86aQG2kUh
 Nn3iHqdFOna1HaP1EO9uKn1eqQ/ULiJ9FtF2PowuqJLJYVVLiAxJ+6K7CxN5SEvDRZJm
 o/Ml/hZkwFg3G8TrctrR0XbK7fpxGzpi2nKvZhAdGpxdkj3KuW3ALl6MK8420ujNeP5P
 Hx+LD4gzJ/1pIEzlZt3picTvqDtEfOVJl4Ncdn+F1W9xm3B8M/+BHukYDeoCWRNWkq2g
 QW595VLum6mq9hPnQlgv9X7D5S79nhieTuQ3G8LV35W3aLn2hLVB3ViOQ2DNc3SM9sZX
 i2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DK7oKAzyJ4Djvafrz6mvkwM3Ek9AWufxp8NykRFUZZE=;
 b=HMIe7ybZr2SeFv9JHKUmbdLSzmxsOePnerVtsI2iOStgSpdCeOQJs4jkMBjc5lYK2s
 V0ZKpAT+92gvM6P+w/i6vrjCeKsbvdTIXDcAEdOQ4jf8hTpZd8P44TFsB3Q/zKS+e7yz
 Enx8XVltFcROs9JNNTq9K5ivGhD70ci8jbOL5QOcxojThtwMC1qiCCwm9pKRL6C6gz3t
 S61QwB1yifV+0Tx0lgqKdR3rT+KAurjhbFACqoA/i0IrdMnrrVkOZZ4h8zfch4AmCr7s
 4q4nbwe9EbQxkwu6wBvCN8hYo471ScsrAdmGlLZvUHcFUGSZCgofIXQ0mAPQqPzkrQ3/
 8avA==
X-Gm-Message-State: APjAAAXexTTzEjtikhzxvwOGeecXOSP+JwJo6FJo/3Kk/Rfp9ImRAnU5
 sIh+K/BIqX7nWjEK9GS+dKSApw==
X-Received: by 2002:a05:6000:1251:: with SMTP id
 j17mr71572254wrx.210.1582565330856; 
 Mon, 24 Feb 2020 09:28:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b10sm60652wmj.48.2020.02.24.09.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 09:28:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/arm: Implement v8.3-RCPC
Date: Mon, 24 Feb 2020 17:28:45 +0000
Message-Id: <20200224172846.13053-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200224172846.13053-1-peter.maydell@linaro.org>
References: <20200224172846.13053-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GF/lMrgLAr1I

The v8.3-RCPC extension implements three new load instructions
which provide slightly weaker consistency guarantees than the
existing load-acquire operations. For QEMU we choose to simply
implement them with a full LDAQ barrier.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 linux-user/elfload.c       |  1 +
 target/arm/cpu64.c         |  1 +
 target/arm/translate-a64.c | 24 ++++++++++++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b647d8df916..59b467a44bf 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3727,6 +3727,11 @@ static inline bool isar_feature_aa64_pmu_8_4(const ARMISARegisters *id)
         FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
 }
 
+static inline bool isar_feature_aa64_rcpc_8_3(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index b1a895f24ce..a0ffbc8861d 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -658,6 +658,7 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE_ID(aa64_sb, ARM_HWCAP_A64_SB);
     GET_FEATURE_ID(aa64_condm_4, ARM_HWCAP_A64_FLAGM);
     GET_FEATURE_ID(aa64_dcpop, ARM_HWCAP_A64_DCPOP);
+    GET_FEATURE_ID(aa64_rcpc_8_3, ARM_HWCAP_A64_LRCPC);
 
     return hwcaps;
 }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0929401a4dd..59b7c574e35 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -657,6 +657,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
+        t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 1); /* ARMv8.3-RCPC */
         cpu->isar.id_aa64isar1 = t;
 
         t = cpu->isar.id_aa64pfr0;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 596bf4cf734..7a066fb7cb2 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3142,6 +3142,8 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     int rs = extract32(insn, 16, 5);
     int rn = extract32(insn, 5, 5);
     int o3_opc = extract32(insn, 12, 4);
+    bool r = extract32(insn, 22, 1);
+    bool a = extract32(insn, 23, 1);
     TCGv_i64 tcg_rs, clean_addr;
     AtomicThreeOpFn *fn;
 
@@ -3177,6 +3179,13 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     case 010: /* SWP */
         fn = tcg_gen_atomic_xchg_i64;
         break;
+    case 014: /* LDAPR, LDAPRH, LDAPRB */
+        if (!dc_isar_feature(aa64_rcpc_8_3, s) ||
+            rs != 31 || a != 1 || r != 0) {
+            unallocated_encoding(s);
+            return;
+        }
+        break;
     default:
         unallocated_encoding(s);
         return;
@@ -3186,6 +3195,21 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
         gen_check_sp_alignment(s);
     }
     clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+
+    if (o3_opc == 014) {
+        /*
+         * LDAPR* are a special case because they are a simple load, not a
+         * fetch-and-do-something op.
+         * The architectural consistency requirements here are weaker than
+         * full load-acquire (we only need "load-acquire processor consistent"),
+         * but we choose to implement them as full LDAQ.
+         */
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, false,
+                  true, rt, disas_ldst_compute_iss_sf(size, false, 0), true);
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
+        return;
+    }
+
     tcg_rs = read_cpu_reg(s, rs, true);
 
     if (o3_opc == 1) { /* LDCLR */
-- 
2.20.1

