Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5267894wrt;
        Tue, 2 Oct 2018 09:39:24 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60o2xKeD9OIkGKsfZX25oxDZUo5P+mILwQBOxOzN0fKs1myj7+BxDlxjVEe1zEmmcIh5deB
X-Received: by 2002:a37:b506:: with SMTP id e6-v6mr11975970qkf.255.1538498364001;
        Tue, 02 Oct 2018 09:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538498363; cv=none;
        d=google.com; s=arc-20160816;
        b=l3oxw/QezTs04MOKh7zgr2VI2udUVv+JUZPbxjOGp2/bsdNyJmG5njnspzVXz3EhRo
         Cpt6iC9JhL43XMhYjmd3XFl7lLddc4SXmjXKHSB9PHUEQflJHFWxVE8TUu68rZdfSip/
         xEF66fJeCH59tumEGSK4CoX0hRCHP9MHUWQqtVaeVa89I9WZ8G5KhzfigeY7XDbo7Jsf
         HU0fp+xbtmz+gYoscHzjSH4IgoY/vwyVcOjhReaLYOE2y7qsiaHImxjLNrTOdKLYKAfH
         V/9ObI2tRJVMkXmxr1bcPH1C7OY7x7qnmq0PCzFn147nBbIwMsfuElgBVkIDtK63Gmqg
         63Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=zk3r9A0PCCkCYyoTknI1Wyv6k6uoizq8d9JFvlhqK9I=;
        b=RKuT/F+aT1vGlDdnPMIyhZaVca6T5Z7cEONblwgLVeK7NCz3v+tXUg1d5y28W/2+Ik
         w5d0M8D9ZYTkC4KWEpb+85+8JYhHosTqHDi6T0T4m4M8JScIFiAnVJSeq0yYZIEpC+K2
         R5/91CUxqEHfOYCv0q+2Ve7pQva0o+lAL0QUN5PymoF88oOp08BEMHaYmnUJn0Egzkoj
         5HMeuZq1OX/KHVq5kvsJEkvNftoZluUx/rz62utKb2tx7BcxtVgy1VALpx8crff/YcLU
         VTRRkHgEUs3aC2L12dxoHMwvL8VmpjZUiC0nuX3ljpEjIcBGpUfalPd+X8wubvFStP1z
         7J7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u5-v6si74813qta.385.2018.10.02.09.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 09:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7Nhj-00018F-EA
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 12:39:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Ned-0006fC-4a
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Nea-00055W-In
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:10 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51564)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g7Nea-00053V-7W; Tue, 02 Oct 2018 12:36:08 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g7NeZ-0007I8-6o; Tue, 02 Oct 2018 17:36:07 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 17:35:50 +0100
Message-Id: <20181002163556.10279-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002163556.10279-1-peter.maydell@linaro.org>
References: <20181002163556.10279-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 07/13] target/arm: Add v8M stack limit checks on
 NS function calls
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pOoWrouWkoZM

Check the v8M stack limits when pushing the frame for a
non-secure function call via BLXNS.

In order to be able to generate the exception we need to
promote raise_exception() from being local to op_helper.c
so we can call it from helper.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 9 +++++++++
 target/arm/helper.c    | 4 ++++
 target/arm/op_helper.c | 4 ++--
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 966a8131623..aa124a06a9d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -94,6 +94,15 @@ FIELD(V7M_EXCRET, RES1, 7, 25) /* including the must-be-1 prefix */
 #define M_FAKE_FSR_NSC_EXEC 0xf /* NS executing in S&NSC memory */
 #define M_FAKE_FSR_SFAULT 0xe /* SecureFault INVTRAN, INVEP or AUVIOL */
 
+/**
+ * raise_exception: Raise the specified exception.
+ * Raise a guest exception with the specified value, syndrome register
+ * and target exception level. This should be called from helper functions,
+ * and never returns because we will longjump back up to the CPU main loop.
+ */
+void QEMU_NORETURN raise_exception(CPUARMState *env, uint32_t excp,
+                                   uint32_t syndrome, uint32_t target_el);
+
 /*
  * For AArch64, map a given EL to an index in the banked_spsr array.
  * Note that this mapping and the AArch32 mapping defined in bank_number()
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a10dff01a90..074f7616272 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6710,6 +6710,10 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
                       "BLXNS with misaligned SP is UNPREDICTABLE\n");
     }
 
+    if (sp < v7m_sp_limit(env)) {
+        raise_exception(env, EXCP_STKOF, 0, 1);
+    }
+
     saved_psr = env->v7m.exception;
     if (env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK) {
         saved_psr |= XPSR_SFPA;
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 38f885b290f..de0d3984ea4 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -28,8 +28,8 @@
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
 
-static void raise_exception(CPUARMState *env, uint32_t excp,
-                            uint32_t syndrome, uint32_t target_el)
+void raise_exception(CPUARMState *env, uint32_t excp,
+                     uint32_t syndrome, uint32_t target_el)
 {
     CPUState *cs = CPU(arm_env_get_cpu(env));
 
-- 
2.19.0

