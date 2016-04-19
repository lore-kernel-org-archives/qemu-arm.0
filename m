Received: by 10.159.53.12 with SMTP id o12csp2038417uao;
        Tue, 19 Apr 2016 11:09:38 -0700 (PDT)
X-Received: by 10.140.33.229 with SMTP id j92mr5318598qgj.20.1461089378833;
        Tue, 19 Apr 2016 11:09:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a40si403813qgf.66.2016.04.19.11.09.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Apr 2016 11:09:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:34245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1asa5h-0004Lc-RL
	for alex.bennee@linaro.org; Tue, 19 Apr 2016 14:09:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1asa4h-00023X-Cn
	for qemu-arm@nongnu.org; Tue, 19 Apr 2016 14:08:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1asa4b-00014D-MX
	for qemu-arm@nongnu.org; Tue, 19 Apr 2016 14:08:35 -0400
Received: from forward13j.cmail.yandex.net ([5.255.227.177]:53699)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1asa4b-00013v-9t; Tue, 19 Apr 2016 14:08:29 -0400
Received: from smtp12.mail.yandex.net (smtp12.mail.yandex.net [95.108.131.191])
	by forward13j.cmail.yandex.net (Yandex) with ESMTP id 4C51920B08;
	Tue, 19 Apr 2016 21:08:08 +0300 (MSK)
Received: from smtp12.mail.yandex.net (localhost [127.0.0.1])
	by smtp12.mail.yandex.net (Yandex) with ESMTP id A8B8916A10D0;
	Tue, 19 Apr 2016 21:08:07 +0300 (MSK)
Received: by smtp12.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	WNad2B8dFm-87BmwP3O; Tue, 19 Apr 2016 21:08:07 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1461089287; bh=IaRSZq9ENcsODyZLE6Uehe/J1kMFnxgs+Qq33evnE3A=;
	h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	References;
	b=pUOMmO1o2WxxH0b23YbvHb0RQp9xyzqE80dkxyj1FxSQQEDzZP4nl6VNME9VLp7HD
	h2gUmTwwwb7svb607AUf9M7K+nyyW+9wjrcmBwtrb2Webm32uawnEqOlTVuo6770ey
	C5ngGIOlGDD9mjhyWWfg7Rmyl1UNV4V8qBiFlVdk=
Authentication-Results: smtp12.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 37377968
From: Sergey Sorokin <afarallax@yandex.ru>
To: qemu-devel@nongnu.org
Date: Tue, 19 Apr 2016 21:07:17 +0300
Message-Id: <1461089238-18314-2-git-send-email-afarallax@yandex.ru>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1461089238-18314-1-git-send-email-afarallax@yandex.ru>
References: <1461089238-18314-1-git-send-email-afarallax@yandex.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.227.177
Subject: [Qemu-arm] [PATCH 1/2] target-arm: Unify AArch32 exception return
 generating functions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Sergey Sorokin <afarallax@yandex.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E1/r0kBl7nkQ

There is a duplicating code in AArch32 exception return implementation.
The patch rearranges the code to avoid this.

Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
---
 target-arm/translate.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index 940ec8d..68671b7 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -4349,24 +4349,27 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
     s->is_jmp = DISAS_UPDATE;
 }
 
-/* Generate an old-style exception return. Marks pc as dead. */
-static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
+/* Generate an exception return. Marks both values as dead. */
+static void gen_exception_return_internal(DisasContext *s, TCGv_i32 pc,
+                                          TCGv_i32 cpsr)
 {
-    TCGv_i32 tmp;
+    gen_helper_cpsr_write_eret(cpu_env, cpsr);
+    tcg_temp_free_i32(cpsr);
     store_reg(s, 15, pc);
-    tmp = load_cpu_field(spsr);
-    gen_helper_cpsr_write_eret(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
     s->is_jmp = DISAS_JUMP;
 }
 
+/* Generate an old-style exception return. Marks pc as dead. */
+static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
+{
+    TCGv_i32 tmp = load_cpu_field(spsr);
+    gen_exception_return_internal(s, pc, tmp);
+}
+
 /* Generate a v6 exception return.  Marks both values as dead.  */
 static void gen_rfe(DisasContext *s, TCGv_i32 pc, TCGv_i32 cpsr)
 {
-    gen_helper_cpsr_write_eret(cpu_env, cpsr);
-    tcg_temp_free_i32(cpsr);
-    store_reg(s, 15, pc);
-    s->is_jmp = DISAS_JUMP;
+    gen_exception_return_internal(s, pc, cpsr);
 }
 
 static void gen_nop_hint(DisasContext *s, int val)
@@ -9378,11 +9381,14 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                     store_reg(s, rn, loaded_var);
                 }
                 if (exc_return) {
-                    /* Restore CPSR from SPSR.  */
-                    tmp = load_cpu_field(spsr);
-                    gen_helper_cpsr_write_eret(cpu_env, tmp);
-                    tcg_temp_free_i32(tmp);
-                    s->is_jmp = DISAS_JUMP;
+                    /* Restore CPSR from SPSR.
+                     * Since gen_exception_return() function updates r15
+                     * we need just pass current r15 value into it.
+                     */
+                    tmp = tcg_temp_new_i32();
+                    tcg_gen_mov_i32(tmp, cpu_R[15]);
+                    /* It marks tmp as dead. */
+                    gen_exception_return(s, tmp);
                 }
             }
             break;
-- 
1.9.3

