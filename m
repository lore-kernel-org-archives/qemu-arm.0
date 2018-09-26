Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x16-v6sm3506705wro.84.2018.09.26.04.20.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Sep 2018 04:20:49 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id A89AA3E0403;
	Wed, 26 Sep 2018 12:20:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	omair.javaid@linaro.org,
	ard.biesheuvel@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v1 1/4] target/arm64: properly handle DBGVR RESS bits
Date: Wed, 26 Sep 2018 12:20:45 +0100
Message-Id: <20180926112048.17778-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180926112048.17778-1-alex.bennee@linaro.org>
References: <20180926112048.17778-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 86a1nUTHNOYK

This only fails with some (broken) versions of gdb but we should
treat the top bits of DBGBVR as RESS. As the hardware may have IMPDEF
approaches to writes to this register we apply the sign extension when
checking breakpoints.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/kvm64.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index e0b8246283..80ad07ed0c 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -356,13 +356,23 @@ bool kvm_arm_hw_debug_active(CPUState *cs)
     return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
 }
 
+/*
+ * We shouldn't rely on gdb correctly setting the top bits of DBGBVR
+ * and the HW lists the top bits a RESS - sign-extending the top bit
+ * of the VA address. As it is IMPDEF if the write is either a sign
+ * extension or kept as is we might fix it up before we compare with
+ * the correctly reported and sign extended address.
+ */
+
 static bool find_hw_breakpoint(CPUState *cpu, target_ulong pc)
 {
     int i;
 
     for (i = 0; i < cur_hw_bps; i++) {
         HWBreakpoint *bp = get_hw_bp(i);
-        if (bp->bvr == pc) {
+        target_ulong bvr = bp->bvr;
+        bvr |= extract64(bvr, 52, 1) ? MAKE_64BIT_MASK(53, 11) : 0;
+        if (bvr == pc) {
             return true;
         }
     }
-- 
2.17.1
