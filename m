Received: by 10.25.208.211 with SMTP id h202csp2009869lfg;
        Tue, 1 Mar 2016 23:01:39 -0800 (PST)
X-Received: by 10.140.85.133 with SMTP id n5mr31908585qgd.32.1456902099751;
        Tue, 01 Mar 2016 23:01:39 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w74si34822545qgw.78.2016.03.01.23.01.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 23:01:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0mx-0006BC-7j
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 02:01:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0io-0006yx-8P
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0il-0003aU-1b
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:22 -0500
Received: from mail-pf0-x232.google.com ([2607:f8b0:400e:c00::232]:34451)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0ik-0003aO-NR; Wed, 02 Mar 2016 01:57:18 -0500
Received: by mail-pf0-x232.google.com with SMTP id 4so50027103pfd.1;
	Tue, 01 Mar 2016 22:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=zeq1Wptx31efms29W6H/8PO907NRvOW4gJ/sN/ItJVE=;
	b=Tincoq3LA4Hx6gBdkP94JBy2skw/R6rvZREmLWYxUdRt9uIrEHFMVhkqBg2AbcqhYB
	NlxgTX3pV0qODxTZuYxQBR+HnLe1V4tjuIoMJ7TkH9cNt9zQ7nQxHc4H2uEGqcCxbLQA
	q1xFxry0BBV+BsOfFtToxyM+KKwQ1+rhkfMqIjnHCumL88qJwCAWEl3hlTlD9q/ats1c
	fTYEB6IQvPCfpEix9fVun/h5IfTqbUtybY30bJxeovVjuuo2EuBpQndrbU0mKssj1Gzh
	uAoXIkl1ODRNSA/Co5IYT71/JHgJpFm8t9pmtjFSbKU4+ipGSw6RhOj/UfstBmx2L6ZG
	A8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=zeq1Wptx31efms29W6H/8PO907NRvOW4gJ/sN/ItJVE=;
	b=TE5X7lKkR7lgftbNToPVzddS3bqgngka0fZ5j3XQHDrns9vmoQoJKTtWun4BQZnPrh
	TxL+jT8eA0P7427PUK8isdimIvWtn8UeTYD1RXjM1gvhTeU3VVc5zNkASS5x7DbMMPpI
	lnK4EagKIVrCXQRfDXgoFCvoHUme2oT7qtSCbxtkH1QjiR19qft5UCQARdbCV1W6re38
	+RQDQJs4/ADFHigzdFIIXPFsPQcGTlodxumP42/gJNr9c1ueK6vm9HBQG/sIZZiCCfEG
	/X1gpwpSUJGq2+DoTlkCZysUBCY/52suEJn5WDBYrSNHKujL0TOBDax6UCmWi60+pqxY
	nZRw==
X-Gm-Message-State: AD7BkJK5ee2CdSqQz+o04w6P9Lpcq2eTBADaWCdQY8gS9U4R+Ur2NiqWeynSB/BVvxb3xQ==
X-Received: by 10.98.65.82 with SMTP id o79mr36009784pfa.115.1456901837945;
	Tue, 01 Mar 2016 22:57:17 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.57.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:57:16 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:17 -0800
Message-Id: <9ae997eabbc2f23bbc4122dcc43c324b6d1775b0.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::232
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v2 13/18] target-arm: implement setend
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8lmE4tmf0F8A

From: Paolo Bonzini <pbonzini@redhat.com>

Since this is not a high-performance path, just use a helper to
flip the E bit and force a lookup in the hash table since the
flags have changed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 target-arm/helper.h    |  1 +
 target-arm/op_helper.c |  5 +++++
 target-arm/translate.c | 14 ++++++--------
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/target-arm/helper.h b/target-arm/helper.h
index ea13202..e3d09d9 100644
--- a/target-arm/helper.h
+++ b/target-arm/helper.h
@@ -48,6 +48,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
 DEF_HELPER_2(exception_internal, void, env, i32)
 DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
+DEF_HELPER_1(setend, void, env)
 DEF_HELPER_1(wfi, void, env)
 DEF_HELPER_1(wfe, void, env)
 DEF_HELPER_1(yield, void, env)
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 4881e34..92fde0a 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -296,6 +296,11 @@ uint32_t HELPER(usat16)(CPUARMState *env, uint32_t x, uint32_t shift)
     return res;
 }
 
+void HELPER(setend)(CPUARMState *env)
+{
+    env->uncached_cpsr ^= CPSR_E;
+}
+
 /* Function checks whether WFx (WFI/WFE) instructions are set up to be trapped.
  * The function returns the target EL (1-3) if the instruction is to be trapped;
  * otherwise it returns 0 indicating it is not trapped.
diff --git a/target-arm/translate.c b/target-arm/translate.c
index fe0be00..d0f13e2 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -7786,10 +7786,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         if ((insn & 0x0ffffdff) == 0x01010000) {
             ARCH(6);
             /* setend */
-            if (((insn >> 9) & 1) != bswap_code(s->sctlr_b)) {
-                /* Dynamic endianness switching not implemented. */
-                qemu_log_mask(LOG_UNIMP, "arm: unimplemented setend\n");
-                goto illegal_op;
+            if (((insn >> 9) & 1) != !!(s->be_data == MO_BE)) {
+                gen_helper_setend(cpu_env);
+                s->is_jmp = DISAS_UPDATE;
             }
             return;
         } else if ((insn & 0x0fffff00) == 0x057ff000) {
@@ -11121,10 +11120,9 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
             case 2:
                 /* setend */
                 ARCH(6);
-                if (((insn >> 3) & 1) != bswap_code(s->sctlr_b)) {
-                    /* Dynamic endianness switching not implemented. */
-                    qemu_log_mask(LOG_UNIMP, "arm: unimplemented setend\n");
-                    goto illegal_op;
+                if (((insn >> 3) & 1) != !!(s->be_data == MO_BE)) {
+                    gen_helper_setend(cpu_env);
+                    s->is_jmp = DISAS_UPDATE;
                 }
                 break;
             case 3:
-- 
1.9.1

