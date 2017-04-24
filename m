Received: by 10.25.0.144 with SMTP id 138csp1492286lfa;
        Mon, 24 Apr 2017 09:33:43 -0700 (PDT)
X-Received: by 10.98.218.68 with SMTP id w4mr25647961pfl.246.1493051623121;
        Mon, 24 Apr 2017 09:33:43 -0700 (PDT)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 199si19600185pfz.376.2017.04.24.09.33.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Apr 2017 09:33:43 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1d2gvg-0002pF-RV; Mon, 24 Apr 2017 17:33:36 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Subject: [RFC 1/3] arm: Use the mmu_idx we're passed in arm_cpu_do_unaligned_access()
Date: Mon, 24 Apr 2017 17:33:33 +0100
Message-Id: <1493051615-30715-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493051615-30715-1-git-send-email-peter.maydell@linaro.org>
References: <1493051615-30715-1-git-send-email-peter.maydell@linaro.org>
X-TUID: bPNKadVly39y

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
