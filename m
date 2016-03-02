Received: by 10.25.208.211 with SMTP id h202csp2008475lfg;
        Tue, 1 Mar 2016 22:57:41 -0800 (PST)
X-Received: by 10.55.71.66 with SMTP id u63mr31559389qka.67.1456901861160;
        Tue, 01 Mar 2016 22:57:41 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r13si34819796qkl.62.2016.03.01.22.57.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 22:57:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0j6-00078G-NJ
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 01:57:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iI-0005qs-J0
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:56:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iH-0003Ov-Ma
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:56:50 -0500
Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c]:33853)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0iH-0003Of-C7; Wed, 02 Mar 2016 01:56:49 -0500
Received: by mail-pa0-x22c.google.com with SMTP id fy10so127184600pac.1;
	Tue, 01 Mar 2016 22:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=oUwfm+cHN0p2fYqpI09g2i6kv4cdAJBIWPWXnUcT/As=;
	b=pMqGdxQxX1FN/6AcQsyqyLKxkhMHdJVBzClba0v9BtKuiPWJnqv5govzTA69ycOaIV
	tsWls7okGwEnIQoaoMxs6nHF72aXCj1/86SVFTtSQ8gaL4YjNuzXjZogP1KM/7cfPAKM
	2lPxvc+r6MU1JIPGeJ1obZdktrIR0dzRbrkdzsnE4tocn7VqR8Z5hD3PLCrt49GM/LiU
	3vBEtgvdsXqtPXbsblQis4YkFyvf2LHDHS2marANadNqWAlBs67HbqpUfCA+jWgBlsKQ
	DXyT+ZySevUev4MPdeWne+fVDFiW1tG7j/oIizWH5tOl91iFadeHPMFmK7aIRk7mlcVi
	vE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=oUwfm+cHN0p2fYqpI09g2i6kv4cdAJBIWPWXnUcT/As=;
	b=ZZgqopi9k3uJdZ+NlUIC6MYnQhRl/U/x+khQwC3Ki2LYLsAasQ8n9yrM6mZqv88CNr
	kN7qpLYxLRImc77CllL6rFD7xNRWjym5PCsooB1xnRL1tUxlfTfUWN86mA8TLb7Gtjsi
	tJX/MSgwkMQZTtTE37yhAKuESghzcovej7UdnYH/mJEjHbkrNNEGt0sL5LrAP1NV9n1a
	kXNXseLmHAKImfaG5iMIlrk20Wfo+FhNzv8k9xqNMTil/cvPAvVoehstzs5qF5KPceg0
	K5T0dCob9ZyYkvYe33T19FFelvQGj9U+9U0tDtmQIu/j2o6w4AZRZqfb+5jlLoge0DlI
	/opQ==
X-Gm-Message-State: AD7BkJLizf374+EednljtxsliDtcyODo7VAzFKCk3RGU1+8f7asBNvS+/StojPLB3z8h6A==
X-Received: by 10.66.124.226 with SMTP id ml2mr36141294pab.90.1456901808582;
	Tue, 01 Mar 2016 22:56:48 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.56.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:56:47 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:06 -0800
Message-Id: <d8be93661b4d95074485e362b50358362f8ca28d.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22c
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v2 02/18] linux-user: arm: pass env to
	get_user_code_*
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
X-TUID: n76ved393QyK

From: Paolo Bonzini <pbonzini@redhat.com>

This matches the idiom used by get_user_data_* later in the series,
and will help when bswap_code will be replaced by SCTLR.B.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
TEST result: 0 (log@ logs/qemu-armeb-BE32-)
TEST result: 0 (log@ logs/qemu-armeb-BE8-)
TEST result: 0 (log@ logs/qemu-arm-LE-)
TEST result: 0 (log@ logs/qemu-system-arm-LE-)

 linux-user/main.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 700724e..bcb9f66 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -435,17 +435,17 @@ void cpu_loop(CPUX86State *env)
 
 #ifdef TARGET_ARM
 
-#define get_user_code_u32(x, gaddr, doswap)             \
+#define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
-        if (!__r && (doswap)) {                         \
+        if (!__r && (env)->bswap_code) {                \
             (x) = bswap32(x);                           \
         }                                               \
         __r;                                            \
     })
 
-#define get_user_code_u16(x, gaddr, doswap)             \
+#define get_user_code_u16(x, gaddr, env)                \
     ({ abi_long __r = get_user_u16((x), (gaddr));       \
-        if (!__r && (doswap)) {                         \
+        if (!__r && (env)->bswap_code) {                \
             (x) = bswap16(x);                           \
         }                                               \
         __r;                                            \
@@ -692,7 +692,7 @@ void cpu_loop(CPUARMState *env)
                 /* we handle the FPU emulation here, as Linux */
                 /* we get the opcode */
                 /* FIXME - what to do if get_user() fails? */
-                get_user_code_u32(opcode, env->regs[15], env->bswap_code);
+                get_user_code_u32(opcode, env->regs[15], env);
 
                 rc = EmulateAll(opcode, &ts->fpa, env);
                 if (rc == 0) { /* illegal instruction */
@@ -762,25 +762,23 @@ void cpu_loop(CPUARMState *env)
                 if (trapnr == EXCP_BKPT) {
                     if (env->thumb) {
                         /* FIXME - what to do if get_user() fails? */
-                        get_user_code_u16(insn, env->regs[15], env->bswap_code);
+                        get_user_code_u16(insn, env->regs[15], env);
                         n = insn & 0xff;
                         env->regs[15] += 2;
                     } else {
                         /* FIXME - what to do if get_user() fails? */
-                        get_user_code_u32(insn, env->regs[15], env->bswap_code);
+                        get_user_code_u32(insn, env->regs[15], env);
                         n = (insn & 0xf) | ((insn >> 4) & 0xff0);
                         env->regs[15] += 4;
                     }
                 } else {
                     if (env->thumb) {
                         /* FIXME - what to do if get_user() fails? */
-                        get_user_code_u16(insn, env->regs[15] - 2,
-                                          env->bswap_code);
+                        get_user_code_u16(insn, env->regs[15] - 2, env);
                         n = insn & 0xff;
                     } else {
                         /* FIXME - what to do if get_user() fails? */
-                        get_user_code_u32(insn, env->regs[15] - 4,
-                                          env->bswap_code);
+                        get_user_code_u32(insn, env->regs[15] - 4, env);
                         n = insn & 0xffffff;
                     }
                 }
-- 
1.9.1

