Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c67sm1041147wmd.25.2017.11.07.08.52.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Nov 2017 08:52:32 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id E86993E03B5;
	Tue,  7 Nov 2017 16:52:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [PATCH] accel/tcg/translate-all: expand cpu_restore_state retaddr check
Date: Tue,  7 Nov 2017 16:52:26 +0000
Message-Id: <20171107165226.22546-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6aDWCyRU8L9a

We are still seeing signals during translation time when we walk over
a page protection boundary. This expands the check to ensure the
retaddr is inside the code generation buffer. The original suggestion
was to check versus tcg_ctx.code_gen_ptr but as we now segment the
translation buffer we have to settle for just a general check for
being inside.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
---
 accel/tcg/translate-all.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 34c5e28d07..eb255af402 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -357,16 +357,20 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t retaddr)
     TranslationBlock *tb;
     bool r = false;
 
-    /* A retaddr of zero is invalid so we really shouldn't have ended
-     * up here. The target code has likely forgotten to check retaddr
-     * != 0 before attempting to restore state. We return early to
-     * avoid blowing up on a recursive tb_lock(). The target must have
-     * previously survived a failed cpu_restore_state because
-     * tb_find_pc(0) would have failed anyway. It still should be
-     * fixed though.
+    /* The retaddr has to be in the region of current code buffer. If
+     * it's not we will not be able to resolve it here. If it is zero
+     * the calling code has likely forgotten to check retaddr before
+     * calling here. If it is not in the translated code we could be
+     * faulting during translation itself.
+     *
+     * Either way we need return early to avoid blowing up on a
+     * recursive tb_lock() as we can't resolve it here.
      */
 
-    if (!retaddr) {
+    if (!retaddr ||
+        (retaddr < (uintptr_t) tcg_init_ctx.code_gen_buffer) ||
+        (retaddr > (uintptr_t) (tcg_init_ctx.code_gen_buffer +
+                                tcg_init_ctx.code_gen_buffer_size))) {
         return r;
     }
 
-- 
2.14.2
