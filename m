Received: by 10.223.159.74 with SMTP id f10csp2971185wrg;
        Mon, 18 Dec 2017 10:22:02 -0800 (PST)
X-Google-Smtp-Source: ACJfBosWGRYTauRpiUQyh1E97PkpDG2aLQkgv7RBkW6c7AdEKc4uKWvjVVH9Yq60ECyPuSbTrJnb
X-Received: by 10.37.162.144 with SMTP id c16mr548151ybi.291.1513621322389;
        Mon, 18 Dec 2017 10:22:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513621322; cv=none;
        d=google.com; s=arc-20160816;
        b=uC8jLCSIPTozAkohb6NdWlsnn+V9qOUtxqsiiRm2Y2SXAuFBGNLeewzuhu2aNbYSdL
         EnQ51+qVlyaZeCwKReQGLFW3oAvQIpNz8G7XdyNbqkwYGhEVcPImltAe/RvGDcnO6q+r
         bb+yX207CeDaZWfxxxhB95YO3f976uk9NZ2JlKDl5HdrmYUhVchs47fauNBa8xAuPpvH
         9Aj33+euLBb3xrj5p6m1CnrenVctLZfBc9veCDPRPdQiV+TK+BsJ0sdbfatNW9b55kzy
         H0Tr7Yd84y/Ez+Apahkhn8vr3EN8jT0+FX3poJrflfR/K8PVrR97lPK7nnQXxbAlotHl
         iI9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=RgN0A+cheDDYQ1TKNQpsfIJ0KEPgf5Y99AmhSS0vM2I=;
        b=pNE2esg/JPpMZWM9sGrDBYK0qWqfNYi53atwcaGDtKjpwlMJZ6bIwml1K7cdDyEIzP
         lraSqmS1bVvc3/9mhCBu1PCG6bUJEA6u6MobtCnX4FimjTB9xWe+s3lbR2OSFWOoaTRp
         w2T8Gk5ovcIcJdMXVdzE4U/c6PIckO4bPoilORHGCE8To4ECCKrQ7N7kOX8vI/rPNFmg
         W2V9bIxW2T//m8gJefSz42XjN1pM6tBIOTe+fwgynPa8xd3cJH6jW5+j1uJRb5uLELKT
         U/NU1b61gjdjSFoLjsAiNn+JGxgFFmdXaRDPkIIcrC02Q7Z5h6xLVzWjfs12h9OSZIRl
         +8lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cYmjOs6c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 187si2603634ybn.191.2017.12.18.10.22.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:22:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cYmjOs6c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36518 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR037-0001Ne-N5
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:22:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUM-00086K-W5
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUK-0001rq-UY
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:06 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:40518)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzUK-0001r8-LL
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:04 -0500
Received: by mail-pg0-x243.google.com with SMTP id k15so9432683pgr.7
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RgN0A+cheDDYQ1TKNQpsfIJ0KEPgf5Y99AmhSS0vM2I=;
	b=cYmjOs6cjCEfEVa5YxxONWawzH90M5mlRMsy3uAnOTOH95Bo4vLh/z9RZxMaRz0Qdn
	ipQvIqJIqxvebwg1Ejyvp5GDEhN6znwggvKT143wJRhf0Jnt76ea108WzEUgAJ0dspWy
	Td/tIHs4DxuK9QlvFMTpr1Hd0Owk0ByMsMggc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RgN0A+cheDDYQ1TKNQpsfIJ0KEPgf5Y99AmhSS0vM2I=;
	b=sKgxWeJcFPE5XhQhV+mfER/Ac4NiLgDIyga24smnx676etiwvFijiGB5mCPAcSq5hb
	iY02w8BwaTXkA+GoSXJ9sFfTOQ1QOAKCGyHsRXCrp6ZFABmo1cL9P24XkT8EDVlO4P2+
	PGk5FaD/jkN1S5sVYLA3oNB/VUIRba9/nTeiirQryPjCbmipyeKzMYo8kVovD0wF+ZEk
	RA/mStCHuuPtu93n8u4gJjLDRO/MGGflVe2B66e3MiH/AYzOMKjMhmqguftH0kLxNWRC
	F4391TEsxLB1ESZbVxz/RS27coF0gu+rlb8RXvaaWr3Xb1KInO7ptGSymhz7OHvuTI42
	MXjA==
X-Gm-Message-State: AKGB3mLe3nsVmlgBRLDaoh6ejQg7pzBY+tO2FhIFOYsOz+bFodkycpah
	IXZxjWS1XZCMwTStmPaqJuJ+7A==
X-Received: by 10.101.101.215 with SMTP id y23mr394201pgv.391.1513619163634;
	Mon, 18 Dec 2017 09:46:03 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	t84sm26209657pfe.160.2017.12.18.09.46.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:46:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:45:35 -0800
Message-Id: <20171218174552.18871-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218174552.18871-1-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH 06/23] target/arm: Implement SVE load
 vector/predicate
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oFw5gtqBnNIw

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  2 ++
 target/arm/sve_helper.c    | 31 +++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 32 ++++++++++++++++++++++++++++++++
 target/arm/sve.def         | 16 ++++++++++++++++
 4 files changed, 81 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 4a923a33b8..8b382a962d 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -35,3 +35,5 @@ DEF_HELPER_FLAGS_5(sve_orns_pred, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_nors_pred, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_nands_pred, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldr, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 5d2a6b2239..a605e623f7 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 
@@ -124,3 +125,33 @@ LOGICAL_PRED_FLAGS(sve_nands_pred, DO_NAND)
 #undef DO_NOR
 #undef DO_NAND
 #undef DO_SEL
+
+void HELPER(sve_ldr)(CPUARMState *env, void *d, target_ulong addr, uint32_t len)
+{
+    intptr_t i, len_align = QEMU_ALIGN_DOWN(len, 8);
+
+    for (i = 0; i < len_align; i += 8) {
+        *(uint64_t *)(d + i) = cpu_ldq_data(env, addr + i);
+    }
+
+    /* For LDR of predicate registers, we can have any multiple of 2.  */
+    switch (len % 8) {
+    case 0:
+        break;
+    case 2:
+        *(uint64_t *)(d + i) = cpu_lduw_data(env, addr + i);
+        break;
+    case 4:
+        *(uint64_t *)(d + i) = (uint32_t)cpu_ldl_data(env, addr + i);
+        break;
+    case 6:
+        {
+            uint32_t t0 = cpu_ldl_data(env, addr + i);
+            uint32_t t1 = cpu_lduw_data(env, addr + i + 2);
+            *(uint64_t *)(d + i) = deposit64(t0, 32, 32, t1);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ab03ead000..0e988c03aa 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -526,3 +526,35 @@ void trans_NANDS_pppp(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
 {
     do_logical_pppp_flags(s, a, gen_helper_sve_nands_pred);
 }
+
+static void do_ldr(DisasContext *s, uint32_t vofs, uint32_t len,
+                   int rn, int imm)
+{
+    TCGv_ptr vptr;
+    TCGv_i32 tlen;
+    TCGv_i64 addr = tcg_temp_new_i64();
+
+    tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm);
+
+    vptr = tcg_temp_new_ptr();
+    tlen = tcg_const_i32(len);
+    tcg_gen_addi_ptr(vptr, cpu_env, vofs);
+
+    gen_helper_sve_ldr(cpu_env, vptr, addr, tlen);
+
+    tcg_temp_free_ptr(vptr);
+    tcg_temp_free_i32(tlen);
+    tcg_temp_free_i64(addr);
+}
+
+void trans_LDR_zri(DisasContext *s, arg_rri *a, uint32_t insn)
+{
+    int size = vec_full_reg_size(s);
+    do_ldr(s, vec_full_reg_offset(s, a->rd), size, a->rn, a->imm * size);
+}
+
+void trans_LDR_pri(DisasContext *s, arg_rri *a, uint32_t insn)
+{
+    int size = pred_full_reg_size(s);
+    do_ldr(s, pred_full_reg_offset(s, a->rd), size, a->rn, a->imm * size);
+}
diff --git a/target/arm/sve.def b/target/arm/sve.def
index 77f96510d8..d1172296e0 100644
--- a/target/arm/sve.def
+++ b/target/arm/sve.def
@@ -19,11 +19,17 @@
 # This file is processed by scripts/decodetree.py
 #
 
+###########################################################################
+# Named fields.  These are primarily for disjoint fields.
+
+%imm9_16_10		16:s6 10:3
+
 ###########################################################################
 # Named attribute sets.  These are used to make nice(er) names
 # when creating helpers common to those for the individual
 # instruction patterns.
 
+&rri			rd rn imm
 &rrr_esz		rd rn rm esz
 &rprr_esz		rd pg rn rm esz
 &pred_set		rd pat esz i s
@@ -38,6 +44,10 @@
 # Three prediate operand, with governing predicate, unused vector element size
 @pd_pg_pn_pm		........ .... rm:4 .. pg:4 . rn:4 . rd:4	&rprr_esz esz=0
 
+# Basic Load/Store with 9-bit immediate offset
+@pd_rn_i9		........ ........ ...... rn:5 . rd:4		&rri imm=%imm9_16_10
+@rd_rn_i9		........ ........ ...... rn:5 rd:5		&rri imm=%imm9_16_10
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -76,3 +86,9 @@ ORRS_pppp		00100101 11 00 .... 01 .... 0 .... 0 ....	@pd_pg_pn_pm
 ORNS_pppp		00100101 11 00 .... 01 .... 0 .... 1 ....	@pd_pg_pn_pm
 NORS_pppp		00100101 11 00 .... 01 .... 1 .... 0 ....	@pd_pg_pn_pm
 NANDS_pppp		00100101 11 00 .... 01 .... 1 .... 1 ....	@pd_pg_pn_pm
+
+# SVE load predicate register
+LDR_pri			10000101 10 ...... 000 ... ..... 0 ....		@pd_rn_i9
+
+# SVE load vector register
+LDR_zri			1000010110 ...... 010 ... ..... .....		@rd_rn_i9
-- 
2.14.3

