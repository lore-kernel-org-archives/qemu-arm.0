Received: by 10.25.77.65 with SMTP id a62csp356223lfb;
        Fri, 17 Feb 2017 13:15:39 -0800 (PST)
X-Received: by 10.200.56.76 with SMTP id r12mr9136402qtb.2.1487366138973;
        Fri, 17 Feb 2017 13:15:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r58si1672631qtb.43.2017.02.17.13.15.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 13:15:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56027 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cepsQ-00033Q-CL
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 16:15:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nreilly@blackberry.com>) id 1cemnc-0003yk-NE
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 12:58:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nreilly@blackberry.com>) id 1cemnb-0003kN-Ok
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 12:58:28 -0500
Received: from smtp-p01.blackberry.com ([208.65.78.88]:30227)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <nreilly@blackberry.com>)
	id 1cemnX-0003cB-35; Fri, 17 Feb 2017 12:58:23 -0500
Received: from mhs101cnc.rim.net ([10.65.141.79])
	by mhs210cnc-app.rim.net with ESMTP; 17 Feb 2017 12:58:16 -0500
Received: from unknown (HELO BB2299038558.rim.net) ([10.65.140.253])
	by mhs101cnc.rim.net with ESMTP; 17 Feb 2017 17:58:16 +0000
From: Nick Reilly <nreilly@blackberry.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 17 Feb 2017 12:58:04 -0500
Message-Id: <1487354284-7587-1-git-send-email-nreilly@blackberry.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 208.65.78.88
X-Mailman-Approved-At: Fri, 17 Feb 2017 16:15:32 -0500
Subject: [Qemu-arm] [PATCH] Add missing fp_access_check() to aarch64 crypto
 instructions
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
Cc: peter.maydell@linaro.org, Nick Reilly <nreilly@blackberry.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IcLY7UGrBeNL

The aarch64 crypto instructions for AES and SHA are missing the
check for if the FPU is enabled.

Signed-off-by: Nick Reilly <nreilly@blackberry.com>
---
 target/arm/translate-a64.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e61bbd6..8105e7e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10929,6 +10929,10 @@ static void disas_crypto_aes(DisasContext *s, uint32_t insn)
         return;
     }
 
+    if (!fp_access_check(s)) {
+        return;
+    }
+
     /* Note that we convert the Vx register indexes into the
      * index within the vfp.regs[] array, so we can share the
      * helper with the AArch32 instructions.
@@ -10993,6 +10997,10 @@ static void disas_crypto_three_reg_sha(DisasContext *s, uint32_t insn)
         return;
     }
 
+    if (!fp_access_check(s)) {
+        return;
+    }
+
     tcg_rd_regno = tcg_const_i32(rd << 1);
     tcg_rn_regno = tcg_const_i32(rn << 1);
     tcg_rm_regno = tcg_const_i32(rm << 1);
@@ -11056,6 +11064,10 @@ static void disas_crypto_two_reg_sha(DisasContext *s, uint32_t insn)
         return;
     }
 
+    if (!fp_access_check(s)) {
+        return;
+    }
+
     tcg_rd_regno = tcg_const_i32(rd << 1);
     tcg_rn_regno = tcg_const_i32(rn << 1);
 
-- 
1.9.1

