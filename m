Received: by 10.25.0.144 with SMTP id 138csp967081lfa;
        Mon, 10 Apr 2017 10:37:00 -0700 (PDT)
X-Received: by 10.55.131.7 with SMTP id f7mr7457988qkd.0.1491845819979;
        Mon, 10 Apr 2017 10:36:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m67si14028082qte.217.2017.04.10.10.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 10:36:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35653 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxdFJ-0002zE-74
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 13:36:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxdCf-0000n6-2r
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 13:34:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxdCe-0006sa-0x
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 13:34:12 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:49130)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cxdCd-0006qG-QK; Mon, 10 Apr 2017 13:34:11 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cxcso-0005iF-8L; Mon, 10 Apr 2017 18:13:42 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 10 Apr 2017 18:13:33 +0100
Message-Id: <1491844419-12485-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491844419-12485-1-git-send-email-peter.maydell@linaro.org>
References: <1491844419-12485-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 3/9] arm: Factor out "generate right kind of
 step exception"
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
Cc: Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pHiintLQLT9N

We currently have two places that do:
            if (dc->ss_active) {
                gen_step_complete_exception(dc);
            } else {
                gen_exception_internal(EXCP_DEBUG);
            }

Factor this out into its own function, as we're about to add
a third place that needs the same logic.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ddc62b6..870e320 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -296,6 +296,19 @@ static void gen_step_complete_exception(DisasContext *s)
     s->is_jmp = DISAS_EXC;
 }
 
+static void gen_singlestep_exception(DisasContext *s)
+{
+    /* Generate the right kind of exception for singlestep, which is
+     * either the architectural singlestep or EXCP_DEBUG for QEMU's
+     * gdb singlestepping.
+     */
+    if (s->ss_active) {
+        gen_step_complete_exception(s);
+    } else {
+        gen_exception_internal(EXCP_DEBUG);
+    }
+}
+
 static void gen_smul_dual(TCGv_i32 a, TCGv_i32 b)
 {
     TCGv_i32 tmp1 = tcg_temp_new_i32();
@@ -11998,24 +12011,15 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
             gen_set_pc_im(dc, dc->pc);
             /* fall through */
         default:
-            if (dc->ss_active) {
-                gen_step_complete_exception(dc);
-            } else {
-                /* FIXME: Single stepping a WFI insn will not halt
-                   the CPU.  */
-                gen_exception_internal(EXCP_DEBUG);
-            }
+            /* FIXME: Single stepping a WFI insn will not halt the CPU. */
+            gen_singlestep_exception(dc);
         }
         if (dc->condjmp) {
             /* "Condition failed" instruction codepath. */
             gen_set_label(dc->condlabel);
             gen_set_condexec(dc);
             gen_set_pc_im(dc, dc->pc);
-            if (dc->ss_active) {
-                gen_step_complete_exception(dc);
-            } else {
-                gen_exception_internal(EXCP_DEBUG);
-            }
+            gen_singlestep_exception(dc);
         }
     } else {
         /* While branches must always occur at the end of an IT block,
-- 
2.7.4

