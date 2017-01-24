Received: by 10.25.77.65 with SMTP id a62csp1918305lfb;
        Tue, 24 Jan 2017 11:16:24 -0800 (PST)
X-Received: by 10.223.151.135 with SMTP id s7mr28943784wrb.51.1485285384335;
        Tue, 24 Jan 2017 11:16:24 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id d11si23907696wra.89.2017.01.24.11.16.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 11:16:24 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cW6Zr-0000PO-Sn; Tue, 24 Jan 2017 19:16:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Liviu Ionescu <ilg@livius.net>
Subject: [PATCH 06/10] armv7m: set CFSR.UNDEFINSTR on undefined instructions
Date: Tue, 24 Jan 2017 19:16:16 +0000
Message-Id: <1485285380-10565-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
X-TUID: JaKjUT8uRlo+

From: Michael Davidsaver <mdavidsaver@gmail.com>

When we take an exception for an undefined instruction, set the
appropriate CFSR bit.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
[PMM: tweaked commit message, comment]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7dc30f5..e6b1c36 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6072,6 +6072,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     switch (cs->exception_index) {
     case EXCP_UDEF:
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
+        env->v7m.cfsr |= R_V7M_CFSR_UNDEFINSTR_MASK;
         return;
     case EXCP_SWI:
         /* The PC already points to the next instruction.  */
-- 
2.7.4
