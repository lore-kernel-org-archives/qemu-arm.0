Received: by 10.25.0.144 with SMTP id 138csp1835789lfa;
        Tue, 25 Apr 2017 05:07:14 -0700 (PDT)
X-Received: by 10.46.5.143 with SMTP id 137mr11038704ljf.49.1493122034228;
        Tue, 25 Apr 2017 05:07:14 -0700 (PDT)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id u77si12204831lja.188.2017.04.25.05.07.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 05:07:14 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1d2zFQ-0003WQ-FH; Tue, 25 Apr 2017 13:07:12 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: [PATCH 01/13] arm: Use the mmu_idx we're passed in arm_cpu_do_unaligned_access()
Date: Tue, 25 Apr 2017 13:06:58 +0100
Message-Id: <1493122030-32191-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
X-TUID: W9SpIcDFCbc6

When identifying the DFSR format for an alignment fault, use
the mmu index that we are passed, rather than calling cpu_mmu_index()
to get the mmu index for the current CPU state. This doesn't actually
make any difference since the only cases where the current MMU index
differs from the index used for the load are the "unprivileged
load/store" instructions, and in that case the mmu index may
differ but the translation regime is the same (apart from the
"use from Hyp mode" case which is UNPREDICTABLE).
However it's the more logical thing to do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 156b825..de24815 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -208,7 +208,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     /* the DFSR for an alignment fault depends on whether we're using
      * the LPAE long descriptor format, or the short descriptor format
      */
-    if (arm_s1_regime_using_lpae_format(env, cpu_mmu_index(env, false))) {
+    if (arm_s1_regime_using_lpae_format(env, mmu_idx)) {
         env->exception.fsr = (1 << 9) | 0x21;
     } else {
         env->exception.fsr = 0x1;
-- 
2.7.4
