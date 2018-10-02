Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5265053wrt;
        Tue, 2 Oct 2018 09:36:27 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62/hfEae7C8rzVA0WtpXAqI2IvfV5eKcQiC4lhilWOUSlguCafao1Qyv+zPEmkJ/0ArEfKL
X-Received: by 2002:ac8:3059:: with SMTP id g25-v6mr13537051qte.136.1538498187832;
        Tue, 02 Oct 2018 09:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538498187; cv=none;
        d=google.com; s=arc-20160816;
        b=sji9UOHKKYXAQ+Vk3DaUbasNCcxJPWge1m6c1n8EBYaB/8HkFJOPHC25D+jDs3z/B0
         T6BskS6RM82JwN0CX4lYms5IHH0JXgPMUXcxoY2dPBgxNCYlwMKQIatBkZr6e84L4OoY
         l02ShGHJT69bRD7PY3luugxwGFJixe4VypKIaqOop8k2VfLo647FEflQSd6zEv9V2gS6
         XE6IHx8R0BWVxuK+JRiNeVjMZ5n7yaqD2c8/C8UVNxrlJ+dEraNRuRogePjZ2w67Ujsj
         auJop3FMl5jXLDszXpEXkIAOd+r1XmQeyqvKxntZPISczDU+BzpRT4rXX3xX90lfs0Bj
         b8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Y/cK+PIlVdbSgahPwKirsSyZ0i4ZDzwJ/ZzfyA9jDMM=;
        b=YSxsEbweCGeJ+TBd/jJRL4pxZFYg4ZYJXPmRZ8D8ZQinJvJSp8PETWNt0QzlNLDFDb
         uTfz36ASkzRvdzeTxiynZIl0U4b1BVxtxxK2mmyE1IqTEVWyQqf/WrLleoUJSe8NoDK1
         PMNpbf7uHD3QM7x+rUnA/f2xj1CfKZQIrgvdgKBbRWTqU4SJRloWCXkVanrGVaS8apiy
         7+g4RwZ2LS/Kpl01KtQNhojcbhRgpE7G1ic+0jJwfDGJx5tDPyeZo2AzsFGA7MmdJhAh
         LO9Q57Dso+ogFPmkQw6GSyslcE3VnyNurFy2g0P7nQ1xCskvfFLGvUEHL4Ak9/uuH/hz
         //2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l33-v6si6188843qte.345.2018.10.02.09.36.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 09:36:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7Net-0006ly-8d
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 12:36:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7NeV-0006Ys-Rc
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7NeV-000509-21
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:03 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51552)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g7NeU-0004zh-Qy; Tue, 02 Oct 2018 12:36:02 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g7NeT-0007Gz-Ra; Tue, 02 Oct 2018 17:36:01 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 17:35:46 +0100
Message-Id: <20181002163556.10279-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002163556.10279-1-peter.maydell@linaro.org>
References: <20181002163556.10279-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 03/13] target/arm: Move v7m_using_psp() to
 internals.h
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
X-TUID: 1+/iT/gKAAUM

We're going to want v7m_using_psp() in op_helper.c in the
next patch, so move it from helper.c to internals.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 15 +++++++++++++++
 target/arm/helper.c    | 12 ------------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index dc9357766c9..bc4c01ccd92 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -796,4 +796,19 @@ static inline uint32_t arm_debug_exception_fsr(CPUARMState *env)
     }
 }
 
+/**
+ * v7m_using_psp: Return true if using process stack pointer
+ * Return true if the CPU is currently using the process stack
+ * pointer, or false if it is using the main stack pointer.
+ */
+static inline bool v7m_using_psp(CPUARMState *env)
+{
+    /* Handler mode always uses the main stack; for thread mode
+     * the CONTROL.SPSEL bit determines the answer.
+     * Note that in v7M it is not possible to be in Handler mode with
+     * CONTROL.SPSEL non-zero, but in v8M it is, so we must check both.
+     */
+    return !arm_v7m_is_handler_mode(env) &&
+        env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK;
+}
 #endif
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c303dc453f1..ef8c244fb84 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6554,18 +6554,6 @@ pend_fault:
     return false;
 }
 
-/* Return true if we're using the process stack pointer (not the MSP) */
-static bool v7m_using_psp(CPUARMState *env)
-{
-    /* Handler mode always uses the main stack; for thread mode
-     * the CONTROL.SPSEL bit determines the answer.
-     * Note that in v7M it is not possible to be in Handler mode with
-     * CONTROL.SPSEL non-zero, but in v8M it is, so we must check both.
-     */
-    return !arm_v7m_is_handler_mode(env) &&
-        env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK;
-}
-
 /* Write to v7M CONTROL.SPSEL bit for the specified security bank.
  * This may change the current stack pointer between Main and Process
  * stack pointers if it is done for the CONTROL register for the current
-- 
2.19.0

