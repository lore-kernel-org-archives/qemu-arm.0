Received: by 10.25.0.144 with SMTP id 138csp800691lfa;
        Mon, 10 Apr 2017 03:45:13 -0700 (PDT)
X-Received: by 10.55.147.131 with SMTP id v125mr47366100qkd.39.1491821113477;
        Mon, 10 Apr 2017 03:45:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33si13116813qtq.153.2017.04.10.03.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 03:45:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxWoo-0001Tq-Un
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 06:45:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxWog-0001T8-Vj
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 06:45:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxWof-00083L-SI
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 06:45:03 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:49107)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cxWof-000826-LV; Mon, 10 Apr 2017 06:45:01 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cxWjk-0005R7-1S; Mon, 10 Apr 2017 11:39:56 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 10 Apr 2017 11:39:50 +0100
Message-Id: <1491820793-5348-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491820793-5348-1-git-send-email-peter.maydell@linaro.org>
References: <1491820793-5348-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 4/7] arm: Move gen_set_condexec() and
 gen_set_pc_im() up in the file
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: chLqc5ME4A3W

Move the utility routines gen_set_condexec() and gen_set_pc_im()
up in the file, as we will want to use them from a function
placed earlier in the file than their current location.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 870e320..a1a0e73 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -893,6 +893,21 @@ static const uint8_t table_logic_cc[16] = {
     1, /* mvn */
 };
 
+static inline void gen_set_condexec(DisasContext *s)
+{
+    if (s->condexec_mask) {
+        uint32_t val = (s->condexec_cond << 4) | (s->condexec_mask >> 1);
+        TCGv_i32 tmp = tcg_temp_new_i32();
+        tcg_gen_movi_i32(tmp, val);
+        store_cpu_field(tmp, condexec_bits);
+    }
+}
+
+static inline void gen_set_pc_im(DisasContext *s, target_ulong val)
+{
+    tcg_gen_movi_i32(cpu_R[15], val);
+}
+
 /* Set PC and Thumb state from an immediate address.  */
 static inline void gen_bx_im(DisasContext *s, uint32_t addr)
 {
@@ -1069,11 +1084,6 @@ DO_GEN_ST(8, MO_UB)
 DO_GEN_ST(16, MO_UW)
 DO_GEN_ST(32, MO_UL)
 
-static inline void gen_set_pc_im(DisasContext *s, target_ulong val)
-{
-    tcg_gen_movi_i32(cpu_R[15], val);
-}
-
 static inline void gen_hvc(DisasContext *s, int imm16)
 {
     /* The pre HVC helper handles cases when HVC gets trapped
@@ -1107,17 +1117,6 @@ static inline void gen_smc(DisasContext *s)
     s->is_jmp = DISAS_SMC;
 }
 
-static inline void
-gen_set_condexec (DisasContext *s)
-{
-    if (s->condexec_mask) {
-        uint32_t val = (s->condexec_cond << 4) | (s->condexec_mask >> 1);
-        TCGv_i32 tmp = tcg_temp_new_i32();
-        tcg_gen_movi_i32(tmp, val);
-        store_cpu_field(tmp, condexec_bits);
-    }
-}
-
 static void gen_exception_internal_insn(DisasContext *s, int offset, int excp)
 {
     gen_set_condexec(s);
-- 
2.7.4

