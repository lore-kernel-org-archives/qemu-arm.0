Received: by 10.28.71.27 with SMTP id u27csp2072763wma;
        Sat, 17 Feb 2018 10:27:52 -0800 (PST)
X-Google-Smtp-Source: AH8x225fgAx7cx8pfygvu65+LJA1/5Qyps0DBA7LtnEjg5qGVCYYUWIN7w7qA45dzAJDXdmoDlN/
X-Received: by 10.37.35.212 with SMTP id j203mr6206292ybj.44.1518892072079;
        Sat, 17 Feb 2018 10:27:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518892072; cv=none;
        d=google.com; s=arc-20160816;
        b=WfNjNXoccutI14VyZTQWdNNjG0A3CQgEE2C2c3K0v/hq3ZvGUfNlhjy4JOvPa6Z7aX
         QadIbtIADHF2j9vtBPyY4aJDCHoeAreAYdvs8LDHgJrsWef5scxFe2yyDjCdd6ch8zB6
         C/5ExMgbxQ0n+qpFnkGCUHJqm9ce8Vj67Lii4Jhh6g24kGbh06y5TwKawEfuO/3DfdpI
         udfl6fRzwdDI2my2qCjRBOrREYwyoEfpHbAbL4i7O5rZ63T55QpjQs2zoYifGQAc78XT
         G2If/7gAy3o623XoWLPkGCiCI0R8BLGgcpaYrJHXigv2azw27nqpNRfFfPSFbMY1Z55c
         JJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=V7b6SuF1cXACZqT7BVM+onphPKImPG8640eKQWeQ1Es=;
        b=eTuPK0W//a6njkfdG66G+I5lth7n3z/vlNbL7FZmQIfNTGbE9CSD5q8CFOJteXecbG
         4gniCmtv9NWYO7eY5trw0EqpS4HIH6Ikr/oqya2wHVBo8sjVtOrmxygdqRecyJ6y/eL7
         OYhxDI2TaxvnwpXncktSKFWXnQqgQ9UL6jzbcFFY3YIwuRQoYXJYs1AWk5chPLM5npl0
         DL6Hq5e3MC3C/cycmma1GhDUtjZhXC+eQmSjWAMf5EFjn3Fw6b4NO9b138osIs6FOOQo
         79VMY381+pzlCFJUkynJcrgXsZC3CFCllHu0hBxSBbaxUyosVSF/bqt0VTeJEwU19XaR
         jcmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=isafiBsG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e14si163031ybc.735.2018.02.17.10.27.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:27:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=isafiBsG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48082 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7DD-0003yK-A2
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:27:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79A-0000Dt-EM
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en797-0001Uj-L6
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:40 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:44351)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en797-0001UP-By
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:37 -0500
Received: by mail-pg0-x243.google.com with SMTP id l4so2191032pgp.11
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V7b6SuF1cXACZqT7BVM+onphPKImPG8640eKQWeQ1Es=;
	b=isafiBsGufYRWtE6E74zecgqEc7cmIFrRYymxQ/7Ihet5OZvDEV9X6p5P/UrjjTCHU
	CXQFMKEP9znCSSejSmhtfxrz1JrwjfXsqK+G1RxK2U/2erNyhzs5KtAXvsrGYPVp1JfI
	oONQ0ahslfyxq9n5viitrI4EyzG7RCXiU8uxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=V7b6SuF1cXACZqT7BVM+onphPKImPG8640eKQWeQ1Es=;
	b=LNCQNWsnPETbMVfWZmXfyHiA8c8Dnwj3rRXtNHmde/loG4k046wQvoQWZcsnGjlIa3
	yWfx+SmGpiNdp1l5HvyvQUL/QIJ9swQhva0oP90y4dWYmIdvScEyv/DQ8ZZT4X8nJjrn
	S37UMYlrdn5qARnvIpw0GnAGDZjB3Cf1k9kRCaVlLU32ytKR3BOyVC7fFUZLEpu+q4cn
	eQIHmCIaoPRe/g8ljlpmOphT04fpeQvLIxGirldiN09uOR7Pka/SrbBNEEnXiTWkfUNi
	yRN5beV7pQi1O4srHSYF99EsAEk0DvpcNHbBYd6FjS1BORQfkqZmKSvm1NmIiQSoi/ak
	kHKg==
X-Gm-Message-State: APf1xPCrvCFDrREzoV78ltXOHvZ3OZH8etk4U5p9q5bEqMfXtwlGhODy
	76qI+A+avj884Q/Dylj29qqEIJ6OUR8=
X-Received: by 10.99.114.86 with SMTP id c22mr8196301pgn.41.1518891816308;
	Sat, 17 Feb 2018 10:23:36 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.23.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:23:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:22 -0800
Message-Id: <20180217182323.25885-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH v2 06/67] target/arm: Implement SVE predicate test
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T5HRojXN2KBq

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 21 +++++++++++++
 target/arm/helper.h        |  1 +
 target/arm/sve_helper.c    | 77 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 62 +++++++++++++++++++++++++++++++++++++
 target/arm/Makefile.objs   |  2 +-
 target/arm/sve.decode      |  5 +++
 6 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/helper-sve.h
 create mode 100644 target/arm/sve_helper.c

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
new file mode 100644
index 0000000000..b6e91539ae
--- /dev/null
+++ b/target/arm/helper-sve.h
@@ -0,0 +1,21 @@
+/*
+ *  AArch64 SVE specific helper definitions
+ *
+ *  Copyright (c) 2018 Linaro, Ltd
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+DEF_HELPER_FLAGS_2(sve_predtest1, TCG_CALL_NO_WG, i32, i64, i64)
+DEF_HELPER_FLAGS_3(sve_predtest, TCG_CALL_NO_WG, i32, ptr, ptr, i32)
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 6dd8504ec3..be3c2fcdc0 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -567,4 +567,5 @@ DEF_HELPER_FLAGS_2(neon_pmull_64_hi, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
+#include "helper-sve.h"
 #endif
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
new file mode 100644
index 0000000000..7d13fd40ed
--- /dev/null
+++ b/target/arm/sve_helper.c
@@ -0,0 +1,77 @@
+/*
+ *  ARM SVE Operations
+ *
+ *  Copyright (c) 2018 Linaro
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "exec/helper-proto.h"
+#include "tcg/tcg-gvec-desc.h"
+
+
+/* Return a value for NZCV as per the ARM PredTest pseudofunction.
+ *
+ * The return value has bit 31 set if N is set, bit 1 set if Z is clear,
+ * and bit 0 set if C is set.
+ *
+ * This is an iterative function, called for each Pd and Pg word
+ * moving forward.
+ */
+
+/* For no G bits set, NZCV = C.  */
+#define PREDTEST_INIT  1
+
+static uint32_t iter_predtest_fwd(uint64_t d, uint64_t g, uint32_t flags)
+{
+    if (g) {
+        /* Compute N from first D & G.
+           Use bit 2 to signal first G bit seen.  */
+        if (!(flags & 4)) {
+            flags |= ((d & (g & -g)) != 0) << 31;
+            flags |= 4;
+        }
+
+        /* Accumulate Z from each D & G.  */
+        flags |= ((d & g) != 0) << 1;
+
+        /* Compute C from last !(D & G).  Replace previous.  */
+        flags = deposit32(flags, 0, 1, (d & pow2floor(g)) == 0);
+    }
+    return flags;
+}
+
+/* The same for a single word predicate.  */
+uint32_t HELPER(sve_predtest1)(uint64_t d, uint64_t g)
+{
+    return iter_predtest_fwd(d, g, PREDTEST_INIT);
+}
+
+/* The same for a multi-word predicate.  */
+uint32_t HELPER(sve_predtest)(void *vd, void *vg, uint32_t words)
+{
+    uint32_t flags = PREDTEST_INIT;
+    uint64_t *d = vd, *g = vg;
+    uintptr_t i = 0;
+
+    do {
+        flags = iter_predtest_fwd(d[i], g[i], flags);
+    } while (++i < words);
+
+    return flags;
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c0cccfda6f..c2e7fac938 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -83,6 +83,43 @@ static void do_mov_z(DisasContext *s, int rd, int rn)
     do_vector2_z(s, tcg_gen_gvec_mov, 0, rd, rn);
 }
 
+/* Set the cpu flags as per a return from an SVE helper.  */
+static void do_pred_flags(TCGv_i32 t)
+{
+    tcg_gen_mov_i32(cpu_NF, t);
+    tcg_gen_andi_i32(cpu_ZF, t, 2);
+    tcg_gen_andi_i32(cpu_CF, t, 1);
+    tcg_gen_movi_i32(cpu_VF, 0);
+}
+
+/* Subroutines computing the ARM PredTest psuedofunction.  */
+static void do_predtest1(TCGv_i64 d, TCGv_i64 g)
+{
+    TCGv_i32 t = tcg_temp_new_i32();
+
+    gen_helper_sve_predtest1(t, d, g);
+    do_pred_flags(t);
+    tcg_temp_free_i32(t);
+}
+
+static void do_predtest(DisasContext *s, int dofs, int gofs, int words)
+{
+    TCGv_ptr dptr = tcg_temp_new_ptr();
+    TCGv_ptr gptr = tcg_temp_new_ptr();
+    TCGv_i32 t;
+
+    tcg_gen_addi_ptr(dptr, cpu_env, dofs);
+    tcg_gen_addi_ptr(gptr, cpu_env, gofs);
+    t = tcg_const_i32(words);
+
+    gen_helper_sve_predtest(t, dptr, gptr, t);
+    tcg_temp_free_ptr(dptr);
+    tcg_temp_free_ptr(gptr);
+
+    do_pred_flags(t);
+    tcg_temp_free_i32(t);
+}
+
 /*
  *** SVE Logical - Unpredicated Group
  */
@@ -111,6 +148,31 @@ static void trans_BIC_zzz(DisasContext *s, arg_BIC_zzz *a, uint32_t insn)
     do_vector3_z(s, tcg_gen_gvec_andc, 0, a->rd, a->rn, a->rm);
 }
 
+/*
+ *** SVE Predicate Misc Group
+ */
+
+void trans_PTEST(DisasContext *s, arg_PTEST *a, uint32_t insn)
+{
+    int nofs = pred_full_reg_offset(s, a->rn);
+    int gofs = pred_full_reg_offset(s, a->pg);
+    int words = DIV_ROUND_UP(pred_full_reg_size(s), 8);
+
+    if (words == 1) {
+        TCGv_i64 pn = tcg_temp_new_i64();
+        TCGv_i64 pg = tcg_temp_new_i64();
+
+        tcg_gen_ld_i64(pn, cpu_env, nofs);
+        tcg_gen_ld_i64(pg, cpu_env, gofs);
+        do_predtest1(pn, pg);
+
+        tcg_temp_free_i64(pn);
+        tcg_temp_free_i64(pg);
+    } else {
+        do_predtest(s, nofs, gofs, words);
+    }
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 9934cf1d4d..452ac6f453 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -19,4 +19,4 @@ target/arm/decode-sve.inc.c: $(SRC_PATH)/target/arm/sve.decode $(DECODETREE)
 	  "GEN", $(TARGET_DIR)$@)
 
 target/arm/translate-sve.o: target/arm/decode-sve.inc.c
-obj-$(TARGET_AARCH64) += translate-sve.o
+obj-$(TARGET_AARCH64) += translate-sve.o sve_helper.o
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 0c6a7ba34d..7efaa8fe8e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -56,6 +56,11 @@ ORR_zzz		00000100 01 1 ..... 001 100 ..... .....		@rd_rn_rm_e0
 EOR_zzz		00000100 10 1 ..... 001 100 ..... .....		@rd_rn_rm_e0
 BIC_zzz		00000100 11 1 ..... 001 100 ..... .....		@rd_rn_rm_e0
 
+### SVE Predicate Misc Group
+
+# SVE predicate test
+PTEST		00100101 01010000 11 pg:4 0 rn:4 00000
+
 ### SVE Memory - 32-bit Gather and Unsized Contiguous Group
 
 # SVE load predicate register
-- 
2.14.3

