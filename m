Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5264869wrt;
        Tue, 2 Oct 2018 09:36:15 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63MPXcndKOr4w0DVoc+e+fbAleA0tJiwXAmDi6NIlgvSyYvyraSYUf0nukRV803UHb6Zg2q
X-Received: by 2002:ad4:5052:: with SMTP id m18-v6mr12245197qvq.164.1538498175414;
        Tue, 02 Oct 2018 09:36:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538498175; cv=none;
        d=google.com; s=arc-20160816;
        b=n/hRM6nD8d8uK8xZI6w4Hgj5tQRptSTZ5WZHJ3j31Uf18QLbf5e5ugwo0yKjcMSJ7m
         F0zxC91N0Z3ljB3PrpHepTpVN1hQ36j8c/e127vzmf3Oon9l/nmdyar/A2cRDMPBHRsj
         gbekbRDxsJlSXwWl7lqCKBKTCr5M67E1Q6/id2AU0VQBcbEss8m0VRnEdRkzWXLMfyTx
         vGpnff0a3sed1pIt6cOilzSrR32MVa73MLbZ+Xnr1uS3Mh/7HxgaX+fDU8CxqSviKWbc
         Zr/4wEf6mK441HsN8pQL890ex5UhpvTQzvmNKISIxALWRWpn0Z7pa7G++HCoaUcnlWy/
         nKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=T4S0xeLRiuwbo6rPdWtjgnSVqlnJWrAcCr7jy1IhKfs=;
        b=okdJfo7kmVVy+Kt53Fwy884/h8pb9oyOCwSfyUrZYQEw/cypTFc67XqCpA2P3llMx1
         fNKY5J45cHaJ9HhlQmcMe35mhE/NzkUo6mRemHazLW9gr/WkM4qqa7MyxBZ1qWTWyemP
         fCFm7dAqLrXfKIXMXYYqRmbe6Sd5sBj/jXp3D419E7q3y2lfl9WBN/MyYbbiqSw5Ocz1
         g9WaYnfWG57hhYK1ceemPQhnEZ19mnr+ONajSaBj36PQoUSOGubcm9JDIs7FEzKVZcPr
         fPzP/pf/rAH0IPHD0U0yXTzcDbko0c9FdJkP7389RU0uT0hlp7s9n0vxtXt/4vLo5pVj
         Zfsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x27-v6si6286416qvh.66.2018.10.02.09.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 09:36:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7Neg-0006Z7-Re
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 12:36:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7NeV-0006Yr-I4
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7NeU-0004zw-NM
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:03 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51546)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g7NeU-0004yW-Fu; Tue, 02 Oct 2018 12:36:02 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g7NeS-0007Gj-TY; Tue, 02 Oct 2018 17:36:00 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 17:35:45 +0100
Message-Id: <20181002163556.10279-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002163556.10279-1-peter.maydell@linaro.org>
References: <20181002163556.10279-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 02/13] target/arm: Define new EXCP type for v8M
 stack overflows
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
X-TUID: 6zNNsVzN8BsP

Define EXCP_STKOF, and arrange for it to cause us to take
a UsageFault with CFSR.STKOF set.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 2 ++
 target/arm/helper.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d2c1d005ed7..318792823b9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -56,6 +56,7 @@
 #define EXCP_SEMIHOST       16   /* semihosting call */
 #define EXCP_NOCP           17   /* v7M NOCP UsageFault */
 #define EXCP_INVSTATE       18   /* v7M INVSTATE UsageFault */
+#define EXCP_STKOF          19   /* v8M STKOF UsageFault */
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
 #define ARMV7M_EXCP_RESET   1
@@ -1380,6 +1381,7 @@ FIELD(V7M_CFSR, UNDEFINSTR, 16 + 0, 1)
 FIELD(V7M_CFSR, INVSTATE, 16 + 1, 1)
 FIELD(V7M_CFSR, INVPC, 16 + 2, 1)
 FIELD(V7M_CFSR, NOCP, 16 + 3, 1)
+FIELD(V7M_CFSR, STKOF, 16 + 4, 1)
 FIELD(V7M_CFSR, UNALIGNED, 16 + 8, 1)
 FIELD(V7M_CFSR, DIVBYZERO, 16 + 9, 1)
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6ed8631dbee..c303dc453f1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7511,6 +7511,7 @@ static void arm_log_exception(int idx)
             [EXCP_SEMIHOST] = "Semihosting call",
             [EXCP_NOCP] = "v7M NOCP UsageFault",
             [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
+            [EXCP_STKOF] = "v8M STKOF UsageFault",
         };
 
         if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
@@ -7666,6 +7667,10 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVSTATE_MASK;
         break;
+    case EXCP_STKOF:
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
+        env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_STKOF_MASK;
+        break;
     case EXCP_SWI:
         /* The PC already points to the next instruction.  */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SVC, env->v7m.secure);
-- 
2.19.0

