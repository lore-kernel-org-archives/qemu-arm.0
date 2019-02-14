Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp508332wrp;
        Wed, 13 Feb 2019 20:00:47 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY22o7+vJRnoUOjbn8uPWX6RZlFawPOs2y/ZwB65Ps0tgxcIoORl4FEj3MB53J9iIpM1wCf
X-Received: by 2002:a25:d6cf:: with SMTP id n198mr1355084ybg.380.1550116846947;
        Wed, 13 Feb 2019 20:00:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550116846; cv=none;
        d=google.com; s=arc-20160816;
        b=Bcq5jPOEN2BSgoRqSXeA4R3dVPrXaEPeRhXANJMDgt2EmT2MHgE4bPelrOTCSSXYuF
         YNPgjMxteIb9ONB0Me9zUX/tb+vjIEkEJJaywliQvRTSKe6X3ND/bOxBb3H0EFAWuuxh
         WwKb2Hxw7wNuKujSS+U0Ur+f0U8lbtVAnYOuv/Ibl3X+GLMw1z7jE0BbUVphRbuHMsaL
         HMgJ5dHHLO0JXgVUK0HtvA5W0RYQVcfoLbPAZ3AM7qPavyPf27QBjQ5cyAuMWWKFXGwK
         TmDUg8AEcHZAiNAvSKpf0Q1KDCQwU2GUGFfoXG5giDDS/8rmLKJzj3r7RQ+eOpm31H/Q
         RiSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=7d3sEG7wCiISNXj+g+mBPC/XuSuNXG+jImCHQ9AO0i0=;
        b=rgd43LcC50h7I4KPGltFiOiUgBYZ5dAi95+Gxh95jKbKqdxYG+f3klyNqcypEyW1YQ
         H5s1L4pz4F9mh3Zszff2weWkvIgCmqWx8E5bYbDXgNEa94VHLcyFY7QVT0HpIhhLwmKU
         ob4L4thMgieVxSqpqoBwap+rDMf/mAQrqgNID2rzbwqu9Y/zTaCxwFs/LiNcboHkvDRw
         WBkT7ipyZUEQ4lWjHiUF34QY9KBxQr7yKr6O0Rsafr4jCOr/HH6yRViNbnNo2ijH7CVc
         dH7q2ecZYUjFtuuU5G2KgDXmTz2e1FluK7KVCaZgOx4blJiaRHxRN5BxINHlxPm3g9Lo
         RKjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q0h5nqg3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g62si761479ywb.121.2019.02.13.20.00.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 20:00:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q0h5nqg3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39433 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gu8Cc-0000SG-B7
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 23:00:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gu89f-0006hY-9J
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 22:57:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gu7wL-00076A-AI
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 22:43:59 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:45866)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gu7wK-00070G-Vz
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 22:43:57 -0500
Received: by mail-pl1-x641.google.com with SMTP id r14so2356114pls.12
	for <qemu-devel@nongnu.org>; Wed, 13 Feb 2019 19:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7d3sEG7wCiISNXj+g+mBPC/XuSuNXG+jImCHQ9AO0i0=;
	b=q0h5nqg3pMC+dGBlOl/Hm3wB2f11ITbIglRdj1xSsw4uACU1iNmJR+zChEwM7gn76v
	c36/Gn5R2YCKT8D/azYGQ4tYkmRlEHf1OWuyAfagoOOu3tu3F9fgbz7Qq0aMUbGZx15e
	FDVopR2bTlqEZUn6jy04bWlcCoKEYoeBZChl8ZZWjc6bdzb9+oTlejDY3EuSAUuAhb/6
	twwgdmyH+JbwjOoruAUIGSv/JLes3ScFxxyHvOpTWhaekEY8v4nxdcjZ9jaypBj5Noxz
	NfRdVqBDVNrXx+8R9SXDGO5vqtWHs6BUqv/txN37FkP8Oz4qYCeKwjmVbg/mCimFaLEH
	WfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7d3sEG7wCiISNXj+g+mBPC/XuSuNXG+jImCHQ9AO0i0=;
	b=TogNCA280Zc0BgGm3ZxBcziLImnRQ8Q+OUIwZZhGfpWr5pBtzhlk7o5c+qmR39WRbx
	vpcujwcDBn+fpxHsJggC+UvnfasAU40XBa+Dd9Vy+S3/FCAtLSS49J/R3bV7dbRN2qTS
	sMxQHxEouilJqpkuoOikyQBaUG6Uwgu5Cvel13jCEL9yrWAl7jYyeNPxeCLWsek5gLCR
	2EbeLrtwBhJLgz9B6Uz/QTF4jC9LNzb8L+Hjt0YhRLM7x8ZXtnfYaeqKXggCBkXZ/XhV
	yZI9mBucO+zakNFWIZ5gP9uCPR6/sYgxkQS1Pb0+VtD/q6Ls9980ePwkl2IRgTA9weuW
	r10g==
X-Gm-Message-State: AHQUAuaN0+at2fnVhleeGBtWYInFoJQ65y4yxSy2qYpasjVJEyxRbDK2
	226bS3sQv8Z/0U5Wp+GlKU3ptcweMZA=
X-Received: by 2002:a17:902:708b:: with SMTP id
	z11mr1850359plk.203.1550115830451; 
	Wed, 13 Feb 2019 19:43:50 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82])
	by smtp.gmail.com with ESMTPSA id o2sm972713pgq.90.2019.02.13.19.43.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Feb 2019 19:43:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 19:43:43 -0800
Message-Id: <20190214034345.24722-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190214034345.24722-1-richard.henderson@linaro.org>
References: <20190214034345.24722-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH 2/4] target/arm: Implement FMLAL and FMLSL for
 aarch64
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8vFBdWz9ByuH

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 ++++
 target/arm/translate-a64.c | 49 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 47238e4245..15085a94ff 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3305,6 +3305,11 @@ static inline bool isar_feature_aa64_dp(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, DP) != 0;
 }
 
+static inline bool isar_feature_aa64_fhm(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, FHM) != 0;
+}
+
 static inline bool isar_feature_aa64_fcma(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, FCMA) != 0;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e002251ac6..d2ee811489 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10891,9 +10891,26 @@ static void disas_simd_3same_float(DisasContext *s, uint32_t insn)
         if (!fp_access_check(s)) {
             return;
         }
-
         handle_3same_float(s, size, elements, fpopcode, rd, rn, rm);
         return;
+
+    case 0x1d: /* FMLAL  */
+    case 0x3d: /* FMLSL  */
+    case 0x59: /* FMLAL2 */
+    case 0x79: /* FMLSL2 */
+        if (size & 1 || !dc_isar_feature(aa64_fhm, s)) {
+            unallocated_encoding(s);
+            return;
+        }
+        if (fp_access_check(s)) {
+            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, false,
+                              extract32(insn, 29, 1),
+                              extract32(insn, 23, 1)
+                              ? gen_helper_gvec_fmlsl_h
+                              : gen_helper_gvec_fmlal_h);
+        }
+        return;
+
     default:
         unallocated_encoding(s);
         return;
@@ -12724,6 +12741,17 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         }
         is_fp = 2;
         break;
+    case 0x00: /* FMLAL */
+    case 0x04: /* FMLSL */
+    case 0x18: /* FMLAL2 */
+    case 0x1c: /* FMLSL2 */
+        if (is_scalar || size != MO_32 || !dc_isar_feature(aa64_fhm, s)) {
+            unallocated_encoding(s);
+            return;
+        }
+        size = MO_16;
+        is_fp = 3;
+        break;
     default:
         unallocated_encoding(s);
         return;
@@ -12765,6 +12793,9 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         }
         break;
 
+    case 3: /* other fp, size already set and verified. */
+        break;
+
     default: /* integer */
         switch (size) {
         case MO_8:
@@ -12834,6 +12865,22 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             tcg_temp_free_ptr(fpst);
         }
         return;
+
+    case 0x00: /* FMLAL */
+    case 0x04: /* FMLSL */
+    case 0x18: /* FMLAL2 */
+    case 0x1c: /* FMLSL2 */
+        {
+            int data = (index << 1) | u;
+            tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                               vec_full_reg_offset(s, rn),
+                               vec_full_reg_offset(s, rm), fpst,
+                               is_q ? 16 : 8, vec_full_reg_size(s), data,
+                               opcode & 4 ? gen_helper_gvec_fmlsl_idx_h
+                               :  gen_helper_gvec_fmlal_idx_h);
+            tcg_temp_free_ptr(fpst);
+        }
+        return;
     }
 
     if (size == 3) {
-- 
2.17.2

